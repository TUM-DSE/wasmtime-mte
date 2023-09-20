//! Low-level abstraction for allocating and managing zero-filled pages
//! of memory.

use anyhow::anyhow;
use anyhow::{Context, Result};
use std::convert::TryFrom;
use std::fs::File;
use std::ops::Range;
use std::path::Path;
use std::ptr;
use std::slice;
use std::sync::Arc;

/// A simple struct consisting of a page-aligned pointer to page-aligned
/// and initially-zeroed memory and a length.
#[derive(Debug)]
pub struct Mmap {
    // Note that this is stored as a `usize` instead of a `*const` or `*mut`
    // pointer to allow this structure to be natively `Send` and `Sync` without
    // `unsafe impl`. This type is sendable across threads and shareable since
    // the coordination all happens at the OS layer.
    ptr: usize,
    len: usize,
    file: Option<Arc<File>>,
}

impl Mmap {
    /// Construct a new empty instance of `Mmap`.
    pub fn new() -> Self {
        // Rust's slices require non-null pointers, even when empty. `Vec`
        // contains code to create a non-null dangling pointer value when
        // constructed empty, so we reuse that here.
        let empty = Vec::<u8>::new();
        Self {
            ptr: empty.as_ptr() as usize,
            len: 0,
            file: None,
        }
    }

    /// Create a new `Mmap` pointing to at least `size` bytes of page-aligned accessible memory.
    pub fn with_at_least(size: usize) -> Result<Self> {
        let page_size = crate::page_size();
        let rounded_size = (size + (page_size - 1)) & !(page_size - 1);
        Self::accessible_reserved(rounded_size, rounded_size)
    }

    /// Creates a new `Mmap` by opening the file located at `path` and mapping
    /// it into memory.
    ///
    /// The memory is mapped in read-only mode for the entire file. If portions
    /// of the file need to be modified then the `region` crate can be use to
    /// alter permissions of each page.
    ///
    /// The memory mapping and the length of the file within the mapping are
    /// returned.
    pub fn from_file(path: &Path) -> Result<Self> {
        #[cfg(unix)]
        {
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

            Ok(Self {
                ptr: ptr as usize,
                len,
                file: Some(Arc::new(file)),
            })
        }

        #[cfg(windows)]
        {
            use std::fs::OpenOptions;
            use std::io;
            use std::os::windows::prelude::*;
            use windows_sys::Win32::Foundation::*;
            use windows_sys::Win32::Storage::FileSystem::*;
            use windows_sys::Win32::System::Memory::*;

            unsafe {
                // Open the file with read/execute access and only share for
                // read. This will enable us to perform the proper mmap below
                // while also disallowing other processes modifying the file
                // and having those modifications show up in our address space.
                let file = OpenOptions::new()
                    .read(true)
                    .access_mode(FILE_GENERIC_READ | FILE_GENERIC_EXECUTE)
                    .share_mode(FILE_SHARE_READ)
                    .open(path)
                    .context("failed to open file")?;

                let len = file
                    .metadata()
                    .context("failed to get file metadata")?
                    .len();
                let len = usize::try_from(len).map_err(|_| anyhow!("file too large to map"))?;

                // Create a file mapping that allows PAGE_EXECUTE_WRITECOPY.
                // This enables up-to these permissions but we won't leave all
                // of these permissions active at all times. Execution is
                // necessary for the generated code from Cranelift and the
                // WRITECOPY part is needed for possibly resolving relocations,
                // but otherwise writes don't happen.
                let mapping = CreateFileMappingW(
                    file.as_raw_handle() as isize,
                    ptr::null_mut(),
                    PAGE_EXECUTE_WRITECOPY,
                    0,
                    0,
                    ptr::null(),
                );
                if mapping == 0 {
                    return Err(io::Error::last_os_error())
                        .context("failed to create file mapping");
                }

                // Create a view for the entire file using all our requisite
                // permissions so that we can change the virtual permissions
                // later on.
                let ptr = MapViewOfFile(
                    mapping,
                    FILE_MAP_READ | FILE_MAP_EXECUTE | FILE_MAP_COPY,
                    0,
                    0,
                    len,
                );
                let err = io::Error::last_os_error();
                CloseHandle(mapping);
                if ptr.is_null() {
                    return Err(err)
                        .context(format!("failed to create map view of {:#x} bytes", len));
                }

                let ret = Self {
                    ptr: ptr as usize,
                    len,
                    file: Some(Arc::new(file)),
                };

                // Protect the entire file as PAGE_WRITECOPY to start (i.e.
                // remove the execute bit)
                let mut old = 0;
                if VirtualProtect(ret.ptr as *mut _, ret.len, PAGE_WRITECOPY, &mut old) == 0 {
                    return Err(io::Error::last_os_error())
                        .context("failed change pages to `PAGE_READONLY`");
                }

                Ok(ret)
            }
        }
    }

    /// Create a new `Mmap` pointing to `accessible_size` bytes of page-aligned accessible memory,
    /// within a reserved mapping of `mapping_size` bytes. `accessible_size` and `mapping_size`
    /// must be native page-size multiples.
    #[cfg(not(target_os = "windows"))]
    pub fn accessible_reserved(accessible_size: usize, mapping_size: usize) -> Result<Self> {
        let page_size = crate::page_size();
        assert!(accessible_size <= mapping_size);
        assert_eq!(mapping_size & (page_size - 1), 0);
        assert_eq!(accessible_size & (page_size - 1), 0);

        // Mmap may return EINVAL if the size is zero, so just
        // special-case that.
        if mapping_size == 0 {
            return Ok(Self::new());
        }

        Ok(if accessible_size == mapping_size {
            // Allocate a single read-write region at once.
            let ptr = unsafe {
                rustix::mm::mmap_anonymous(
                    ptr::null_mut(),
                    mapping_size,
                    rustix::mm::ProtFlags::READ | rustix::mm::ProtFlags::WRITE,
                    rustix::mm::MapFlags::PRIVATE,
                )
                .context(format!("mmap failed to allocate {:#x} bytes", mapping_size))?
            };

            Self {
                ptr: ptr as usize,
                len: mapping_size,
                file: None,
            }
        } else {
            // Reserve the mapping size.
            let ptr = unsafe {
                rustix::mm::mmap_anonymous(
                    ptr::null_mut(),
                    mapping_size,
                    rustix::mm::ProtFlags::empty(),
                    rustix::mm::MapFlags::PRIVATE,
                )
                .context(format!("mmap failed to allocate {:#x} bytes", mapping_size))?
            };

            let mut result = Self {
                ptr: ptr as usize,
                len: mapping_size,
                file: None,
            };

            if accessible_size != 0 {
                // Commit the accessible size.
                result.make_accessible(0, accessible_size)?;
            }

            result
        })
    }

    /// Create a new `Mmap` pointing to `accessible_size` bytes of page-aligned accessible memory,
    /// within a reserved mapping of `mapping_size` bytes. `accessible_size` and `mapping_size`
    /// must be native page-size multiples.
    #[cfg(target_os = "windows")]
    pub fn accessible_reserved(accessible_size: usize, mapping_size: usize) -> Result<Self> {
        use anyhow::bail;
        use std::io;
        use windows_sys::Win32::System::Memory::*;

        if mapping_size == 0 {
            return Ok(Self::new());
        }

        let page_size = crate::page_size();
        assert!(accessible_size <= mapping_size);
        assert_eq!(mapping_size & (page_size - 1), 0);
        assert_eq!(accessible_size & (page_size - 1), 0);

        Ok(if accessible_size == mapping_size {
            // Allocate a single read-write region at once.
            let ptr = unsafe {
                VirtualAlloc(
                    ptr::null_mut(),
                    mapping_size,
                    MEM_RESERVE | MEM_COMMIT,
                    PAGE_READWRITE,
                )
            };
            if ptr.is_null() {
                bail!("VirtualAlloc failed: {}", io::Error::last_os_error());
            }

            Self {
                ptr: ptr as usize,
                len: mapping_size,
                file: None,
            }
        } else {
            // Reserve the mapping size.
            let ptr =
                unsafe { VirtualAlloc(ptr::null_mut(), mapping_size, MEM_RESERVE, PAGE_NOACCESS) };
            if ptr.is_null() {
                bail!("VirtualAlloc failed: {}", io::Error::last_os_error());
            }

            let mut result = Self {
                ptr: ptr as usize,
                len: mapping_size,
                file: None,
            };

            if accessible_size != 0 {
                // Commit the accessible size.
                result.make_accessible(0, accessible_size)?;
            }

            result
        })
    }

    /// Make the memory starting at `start` and extending for `len` bytes accessible.
    /// `start` and `len` must be native page-size multiples and describe a range within
    /// `self`'s reserved memory.
    #[cfg(not(target_os = "windows"))]
    pub fn make_accessible(&mut self, start: usize, len: usize) -> Result<()> {
        use rustix::mm::{mprotect, MprotectFlags};

        let page_size = crate::page_size();
        assert_eq!(start & (page_size - 1), 0);
        assert_eq!(len & (page_size - 1), 0);
        assert!(len <= self.len);
        assert!(start <= self.len - len);

        if !self.make_accessible_with_mte(start, len)? {
            // Commit the accessible size.
            let ptr = self.ptr as *mut u8;
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
    #[cfg(all(target_arch = "aarch64", target_os = "linux", target_feature = "mte"))]
    fn make_accessible_with_mte(&mut self, start: usize, len: usize) -> Result<bool> {
        use std::io;

        const PR_SET_TAGGED_ADDR_CTRL: i32 = 55;
        const PR_TAGGED_ADDR_ENABLE: u64 = 1 << 0;
        const PR_MTE_TCF_SHIFT: i32 = 1;
        const PR_MTE_TCF_SYNC: u64 = 1u64 << PR_MTE_TCF_SHIFT;
        const PR_MTE_TCF_ASYNC: u64 = 2u64 << PR_MTE_TCF_SHIFT;
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
                return Err::<bool, io::Error>(io::Error::last_os_error().into())
                    .context("unable to enable mte (prctl)");
            }
        }

        let prot = libc::PROT_READ | libc::PROT_WRITE | 0x20 /* PROT_MTE */;
        let ptr = self.ptr as *mut u8;
        eprintln!(
            "enabling mte for memory (enable_mte): ptr = 0x{:x}, len = 0x{:x}",
            self.ptr + start,
            len
        );

        unsafe {
            if libc::mprotect(ptr.add(start).cast(), len, prot) != 0 {
                return Err::<bool, io::Error>(io::Error::last_os_error().into())
                    .context("unable to mprotect mte flags");
            }
        }
        //
        // unsafe {
        //     let old_ptr: *mut i8 = ptr.add(start).cast();
        //     let mut ptr = old_ptr as u64;
        //     asm!("irg {ptr}, {ptr}", ptr = inout(reg) ptr);
        //     asm!("stg {ptr}, [{ptr}]", ptr = inout(reg) ptr);
        //     let ptr = ptr as *mut i8;
        //     ptr.write_volatile(42);
        //     let result = ptr.read_volatile();
        //     println!("got ptr[0] = {result}");
        //     println!("expecting segfault...");
        //     ptr.add(16).write_volatile(43);
        //     let result = ptr.add(16).read_volatile();
        //     println!("got ptr[16] = {result}");
        // }

        Ok(true)
    }

    /// We don't support MTE on non arm64 linux
    #[cfg(not(all(target_arch = "aarch64", target_os = "linux", target_feature = "mte")))]
    fn make_accessible_with_mte(&mut self, _start: usize, _len: usize) -> Result<bool> {
        Ok(false)
    }

    /// Make the memory starting at `start` and extending for `len` bytes accessible.
    /// `start` and `len` must be native page-size multiples and describe a range within
    /// `self`'s reserved memory.
    #[cfg(target_os = "windows")]
    pub fn make_accessible(&mut self, start: usize, len: usize) -> Result<()> {
        use anyhow::bail;
        use std::ffi::c_void;
        use std::io;
        use windows_sys::Win32::System::Memory::*;

        let page_size = crate::page_size();
        assert_eq!(start & (page_size - 1), 0);
        assert_eq!(len & (page_size - 1), 0);
        assert!(len <= self.len);
        assert!(start <= self.len - len);

        // Commit the accessible size.
        let ptr = self.ptr as *const u8;
        if unsafe {
            VirtualAlloc(
                ptr.add(start) as *mut c_void,
                len,
                MEM_COMMIT,
                PAGE_READWRITE,
            )
        }
        .is_null()
        {
            bail!("VirtualAlloc failed: {}", io::Error::last_os_error());
        }

        Ok(())
    }

    /// Return the allocated memory as a slice of u8.
    pub fn as_slice(&self) -> &[u8] {
        unsafe { slice::from_raw_parts(self.ptr as *const u8, self.len) }
    }

    /// Return the allocated memory as a mutable slice of u8.
    pub fn as_mut_slice(&mut self) -> &mut [u8] {
        unsafe { slice::from_raw_parts_mut(self.ptr as *mut u8, self.len) }
    }

    /// Return the allocated memory as a pointer to u8.
    pub fn as_ptr(&self) -> *const u8 {
        self.ptr as *const u8
    }

    /// Return the allocated memory as a mutable pointer to u8.
    pub fn as_mut_ptr(&self) -> *mut u8 {
        self.ptr as *mut u8
    }

    /// Return the length of the allocated memory.
    pub fn len(&self) -> usize {
        self.len
    }

    /// Return whether any memory has been allocated.
    pub fn is_empty(&self) -> bool {
        self.len() == 0
    }

    /// Makes the specified `range` within this `Mmap` to be read/execute.
    pub unsafe fn make_executable(
        &self,
        range: Range<usize>,
        enable_branch_protection: bool,
    ) -> Result<()> {
        assert!(range.start <= self.len());
        assert!(range.end <= self.len());
        assert!(range.start <= range.end);
        assert!(
            range.start % crate::page_size() == 0,
            "changing of protections isn't page-aligned",
        );
        let base = self.as_ptr().add(range.start) as *mut _;
        let len = range.end - range.start;

        #[cfg(windows)]
        {
            use std::io;
            use windows_sys::Win32::System::Memory::*;

            let flags = if enable_branch_protection {
                // TODO: We use this check to avoid an unused variable warning,
                // but some of the CFG-related flags might be applicable
                PAGE_EXECUTE_READ
            } else {
                PAGE_EXECUTE_READ
            };
            let mut old = 0;
            let result = VirtualProtect(base, len, flags, &mut old);
            if result == 0 {
                return Err(io::Error::last_os_error().into());
            }
        }

        #[cfg(not(windows))]
        {
            use rustix::mm::{mprotect, MprotectFlags};

            let flags = MprotectFlags::READ | MprotectFlags::EXEC;
            let flags = if enable_branch_protection {
                #[cfg(all(target_arch = "aarch64", target_os = "linux"))]
                if std::arch::is_aarch64_feature_detected!("bti") {
                    MprotectFlags::from_bits_unchecked(flags.bits() | /* PROT_BTI */ 0x10)
                } else {
                    flags
                }

                #[cfg(not(all(target_arch = "aarch64", target_os = "linux")))]
                flags
            } else {
                flags
            };

            mprotect(base, len, flags)?;
        }

        Ok(())
    }

    /// Makes the specified `range` within this `Mmap` to be readonly.
    pub unsafe fn make_readonly(&self, range: Range<usize>) -> Result<()> {
        assert!(range.start <= self.len());
        assert!(range.end <= self.len());
        assert!(range.start <= range.end);
        assert!(
            range.start % crate::page_size() == 0,
            "changing of protections isn't page-aligned",
        );
        let base = self.as_ptr().add(range.start) as *mut _;
        let len = range.end - range.start;

        #[cfg(windows)]
        {
            use std::io;
            use windows_sys::Win32::System::Memory::*;

            let mut old = 0;
            let result = VirtualProtect(base, len, PAGE_READONLY, &mut old);
            if result == 0 {
                return Err(io::Error::last_os_error().into());
            }
        }

        #[cfg(not(windows))]
        {
            use rustix::mm::{mprotect, MprotectFlags};
            mprotect(base, len, MprotectFlags::READ)?;
        }

        Ok(())
    }

    /// Returns the underlying file that this mmap is mapping, if present.
    pub fn original_file(&self) -> Option<&Arc<File>> {
        self.file.as_ref()
    }
}

impl Drop for Mmap {
    #[cfg(not(target_os = "windows"))]
    fn drop(&mut self) {
        if self.len != 0 {
            unsafe { rustix::mm::munmap(self.ptr as *mut std::ffi::c_void, self.len) }
                .expect("munmap failed");
        }
    }

    #[cfg(target_os = "windows")]
    fn drop(&mut self) {
        if self.len != 0 {
            use std::ffi::c_void;
            use windows_sys::Win32::System::Memory::*;

            if self.file.is_none() {
                let r = unsafe { VirtualFree(self.ptr as *mut c_void, 0, MEM_RELEASE) };
                assert_ne!(r, 0);
            } else {
                let r = unsafe { UnmapViewOfFile(self.ptr as *mut c_void) };
                assert_ne!(r, 0);
            }
        }
    }
}

fn _assert() {
    fn _assert_send_sync<T: Send + Sync>() {}
    _assert_send_sync::<Mmap>();
}
