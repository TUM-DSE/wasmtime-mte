use crate::mte::MTEConfig;
use crate::{mte, SendSyncPtr};
use anyhow::{anyhow, Context, Result};
use rustix::mm::{mprotect, MprotectFlags};
use std::fs::File;
use std::ops::Range;
use std::path::Path;
use std::ptr::{self, NonNull};

#[derive(Debug)]
pub struct Mmap {
    memory: SendSyncPtr<[u8]>,
    mte: MTEConfig,
}

impl Mmap {
    pub fn new_empty(mte: MTEConfig) -> Mmap {
        let mut memory = SendSyncPtr::from(&mut [][..]);
        if mte.enabled {
            memory = Self::enable_mte(memory, mte.bounds_checks).unwrap();
        }
        Mmap { memory, mte }
    }

    pub fn new(size: usize, mte: MTEConfig) -> Result<Self> {
        let ptr = unsafe {
            rustix::mm::mmap_anonymous(
                ptr::null_mut(),
                size,
                rustix::mm::ProtFlags::READ | rustix::mm::ProtFlags::WRITE,
                rustix::mm::MapFlags::PRIVATE,
            )?
        };
        let memory = std::ptr::slice_from_raw_parts_mut(ptr.cast(), size);
        let mut memory = SendSyncPtr::new(NonNull::new(memory).unwrap());
        if mte.enabled {
            memory = Self::enable_mte(memory, mte.bounds_checks)?;
        }
        Ok(Mmap { memory, mte })
    }

    pub fn reserve(size: usize, mte: MTEConfig) -> Result<Self> {
        let ptr = unsafe {
            rustix::mm::mmap_anonymous(
                ptr::null_mut(),
                size,
                rustix::mm::ProtFlags::empty(),
                rustix::mm::MapFlags::PRIVATE,
            )?
        };

        let memory = std::ptr::slice_from_raw_parts_mut(ptr.cast(), size);
        let mut memory = SendSyncPtr::new(NonNull::new(memory).unwrap());
        if mte.enabled {
            memory = Self::enable_mte(memory, mte.bounds_checks)?;
        }
        Ok(Mmap { memory, mte })
    }

    pub fn from_file(path: &Path) -> Result<(Self, File)> {
        let file = File::open(path).context("failed to open file")?;
        let len = file
            .metadata()
            .context("failed to get file metadata")?
            .len();
        let len = usize::try_from(len).map_err(|_| anyhow!("file too large to map"))?;
        let ptr = unsafe {
            rustix::mm::mmap(
                ptr::null_mut(),
                len,
                rustix::mm::ProtFlags::READ | rustix::mm::ProtFlags::WRITE,
                rustix::mm::MapFlags::PRIVATE,
                &file,
                0,
            )
            .context(format!("mmap failed to allocate {:#x} bytes", len))?
        };
        let memory = std::ptr::slice_from_raw_parts_mut(ptr.cast(), len);
        let memory = SendSyncPtr::new(NonNull::new(memory).unwrap());

        Ok((
            Mmap {
                memory,
                mte: MTEConfig::default(),
            },
            file,
        ))
    }

    pub fn make_accessible(&mut self, start: usize, len: usize) -> Result<()> {
        let ptr = self.memory.as_ptr().cast::<u8>();
        if self.mte.enabled {
            unsafe {
                let start = ptr.offset(start as isize);
                mte::make_accessible(start.cast(), len)?;
                if self.mte.bounds_checks {
                    mte::tag_memory(ptr.cast(), start.cast(), len)?;
                }
            }
        } else {
            unsafe {
                mprotect(
                    ptr.add(start).cast(),
                    len,
                    MprotectFlags::READ | MprotectFlags::WRITE,
                )?;
            }
        }

        Ok(())
    }

    #[cfg(all(
        target_arch = "aarch64",
        any(target_os = "linux", target_os = "android"),
        target_feature = "mte"
    ))]
    fn enable_mte(memory: SendSyncPtr<[u8]>, tag_memory: bool) -> Result<SendSyncPtr<[u8]>> {
        use crate::mte;

        mte::enable_mte()?;

        if tag_memory {
            // then tag the base pointer
            let tagged_slice = unsafe {
                let ptr = memory.as_ptr().as_ref().unwrap().as_ptr() as usize;
                assert_eq!(ptr % 32, 0, "memory not aligned to 32 bytes");
                let tagged_ptr = (ptr | mte::RUNTIME_MEM_TAG) as *mut u8;
                std::slice::from_raw_parts(tagged_ptr, memory.len())
            };

            Ok(SendSyncPtr::new(NonNull::from(tagged_slice)))
        } else {
            Ok(memory)
        }
    }

    /// We don't support MTE on non arm64 linux
    #[cfg(not(all(
        target_arch = "aarch64",
        any(target_os = "linux", target_os = "android"),
        target_feature = "mte"
    )))]
    fn enable_mte(_memory: SendSyncPtr<[u8]>, _tag_memory: bool) -> Result<SendSyncPtr<[u8]>> {
        anyhow::bail!(
            "cannot enable mte on os {}, arch {}",
            std::env::consts::OS,
            std::env::consts::ARCH
        )
    }

    #[inline]
    pub fn as_ptr(&self) -> *const u8 {
        self.memory.as_ptr() as *const u8
    }

    #[inline]
    pub fn as_mut_ptr(&mut self) -> *mut u8 {
        self.memory.as_ptr().cast()
    }

    #[inline]
    pub fn len(&self) -> usize {
        unsafe { (*self.memory.as_ptr()).len() }
    }

    #[inline]
    pub fn mte_config(&self) -> MTEConfig {
        self.mte
    }

    pub unsafe fn make_executable(
        &self,
        range: Range<usize>,
        enable_branch_protection: bool,
    ) -> Result<()> {
        let base = self.memory.as_ptr().cast::<u8>().add(range.start).cast();
        let len = range.end - range.start;

        let flags = MprotectFlags::READ | MprotectFlags::EXEC;
        let flags = if enable_branch_protection {
            #[cfg(all(target_arch = "aarch64", target_os = "linux"))]
            if std::arch::is_aarch64_feature_detected!("bti") {
                MprotectFlags::from_bits_retain(flags.bits() | /* PROT_BTI */ 0x10)
            } else {
                flags
            }

            #[cfg(not(all(target_arch = "aarch64", target_os = "linux")))]
            flags
        } else {
            flags
        };

        mprotect(base, len, flags)?;

        Ok(())
    }

    pub unsafe fn make_readonly(&self, range: Range<usize>) -> Result<()> {
        let base = self.memory.as_ptr().cast::<u8>().add(range.start).cast();
        let len = range.end - range.start;

        mprotect(base, len, MprotectFlags::READ)?;

        Ok(())
    }
}

impl Drop for Mmap {
    fn drop(&mut self) {
        unsafe {
            let ptr = self.memory.as_ptr().cast();
            let len = (*self.memory.as_ptr()).len();
            if len == 0 {
                return;
            }
            rustix::mm::munmap(ptr, len).expect("munmap failed");
        }
    }
}
