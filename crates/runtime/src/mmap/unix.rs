use crate::SendSyncPtr;
use anyhow::{anyhow, Context, Result};
use rustix::mm::{mprotect, MprotectFlags};
use std::fs::File;
use std::ops::Range;
use std::path::Path;
use std::ptr::{self, NonNull};

#[derive(Debug)]
pub struct Mmap {
    memory: SendSyncPtr<[u8]>,
}

impl Mmap {
    pub fn new_empty() -> Mmap {
        Mmap {
            memory: SendSyncPtr::from(&mut [][..]),
        }
    }

    pub fn new(size: usize) -> Result<Self> {
        let ptr = unsafe {
            rustix::mm::mmap_anonymous(
                ptr::null_mut(),
                size,
                rustix::mm::ProtFlags::READ | rustix::mm::ProtFlags::WRITE,
                rustix::mm::MapFlags::PRIVATE,
            )?
        };
        let memory = std::ptr::slice_from_raw_parts_mut(ptr.cast(), size);
        let memory = SendSyncPtr::new(NonNull::new(memory).unwrap());
        Ok(Mmap { memory })
    }

    pub fn reserve(size: usize) -> Result<Self> {
        let ptr = unsafe {
            rustix::mm::mmap_anonymous(
                ptr::null_mut(),
                size,
                rustix::mm::ProtFlags::empty(),
                rustix::mm::MapFlags::PRIVATE,
            )?
        };

        let memory = std::ptr::slice_from_raw_parts_mut(ptr.cast(), size);
        let memory = SendSyncPtr::new(NonNull::new(memory).unwrap());
        Ok(Mmap { memory })
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

        Ok((Mmap { memory }, file))
    }

    pub fn make_accessible(&mut self, start: usize, len: usize, enable_mte: bool) -> Result<()> {
        if enable_mte {
            self.make_accessible_with_mte(start, len)?;
        } else {
            let ptr = self.memory.as_ptr().cast::<u8>();
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

    /// Make memory accessible while enabling mte
    #[cfg(all(
        target_arch = "aarch64",
        any(target_os = "linux", target_os = "android"),
        target_feature = "mte"
    ))]
    fn make_accessible_with_mte(&mut self, start: usize, len: usize) -> Result<()> {
        use std::io;

        const PR_SET_TAGGED_ADDR_CTRL: i32 = 55;
        const PR_TAGGED_ADDR_ENABLE: u64 = 1 << 0;
        const PR_MTE_TCF_SHIFT: i32 = 1;
        const PR_MTE_TCF_SYNC: u64 = 1u64 << PR_MTE_TCF_SHIFT;
        // const PR_MTE_TCF_ASYNC: u64 = 2u64 << PR_MTE_TCF_SHIFT;
        const PR_MTE_TAG_SHIFT: i32 = 3;

        unsafe {
            if libc::prctl(
                PR_SET_TAGGED_ADDR_CTRL,
                PR_TAGGED_ADDR_ENABLE
                    | PR_MTE_TCF_SYNC
                    // | PR_MTE_TCF_ASYNC
                    | (0xfffeu64 << PR_MTE_TAG_SHIFT),
                0,
                0,
                0,
            ) != 0
            {
                anyhow::bail!(io::Error::last_os_error())
            }
        }

        let prot = libc::PROT_READ | libc::PROT_WRITE | 0x20 /* PROT_MTE */;
        let ptr = unsafe { self.memory.as_ptr().cast::<u8>().add(start) };
        eprintln!(
            "enabling mte for memory (enable_mte): ptr = 0x{:x}, len = 0x{:x}",
            ptr as usize, len
        );

        unsafe {
            if libc::mprotect(ptr.cast(), len, prot) != 0 {
                anyhow::bail!(io::Error::last_os_error())
            }
        }

        Ok(())
    }

    /// We don't support MTE on non arm64 linux
    #[cfg(not(all(
        target_arch = "aarch64",
        any(target_os = "linux", target_os = "android"),
        target_feature = "mte"
    )))]
    fn make_accessible_with_mte(&mut self, _start: usize, _len: usize) -> Result<()> {
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
