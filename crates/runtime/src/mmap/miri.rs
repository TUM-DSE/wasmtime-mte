//! A "dummy" implementation of mmaps for miri where "we do the best we can"
//!
//! Namely this uses `alloc` to allocate memory for the "mmap" specifically to
//! create page-aligned allocations. This allocation doesn't handle operations
//! like becoming executable or becoming readonly or being created from files,
//! but it's enough to get various tests running relying on memories and such.

use crate::SendSyncPtr;
use anyhow::{bail, Result};
use std::alloc::{self, Layout};
use std::fs::File;
use std::ops::Range;
use std::path::Path;
use std::ptr::NonNull;

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
        let mut ret = Mmap::reserve(size)?;
        ret.make_accessible(0, size)?;
        Ok(ret)
    }

    pub fn reserve(size: usize) -> Result<Self> {
        let layout = Layout::from_size_align(size, crate::page_size()).unwrap();
        let ptr = unsafe { alloc::alloc(layout) };
        if ptr.is_null() {
            bail!("failed to allocate memory");
        }

        let memory = std::ptr::slice_from_raw_parts_mut(ptr.cast(), size);
        let memory = SendSyncPtr::new(NonNull::new(memory).unwrap());
        Ok(Mmap { memory })
    }

    pub fn from_file(_path: &Path) -> Result<(Self, File)> {
        bail!("not supported on miri");
    }

    pub fn make_accessible(&mut self, start: usize, len: usize, enable_mte: bool) -> Result<()> {
        if enable_mte {
            bail!("enabling mte on windows is not supported.")
        }

        // The memory is technically always accessible but this marks it as
        // initialized for miri-level checking.
        unsafe {
            std::ptr::write_bytes(self.memory.as_ptr().cast::<u8>().add(start), 0u8, len);
        }
        Ok(())
    }

    pub fn as_ptr(&self) -> *const u8 {
        self.memory.as_ptr() as *const u8
    }

    pub fn as_mut_ptr(&mut self) -> *mut u8 {
        self.memory.as_ptr().cast()
    }

    pub fn len(&self) -> usize {
        unsafe { (*self.memory.as_ptr()).len() }
    }

    #[inline]
    pub fn mte_protected(&self) -> bool {
        false
    }

    pub unsafe fn make_executable(
        &self,
        _range: Range<usize>,
        _enable_branch_protection: bool,
    ) -> Result<()> {
        Ok(())
    }

    pub unsafe fn make_readonly(&self, _range: Range<usize>) -> Result<()> {
        Ok(())
    }
}

impl Drop for Mmap {
    fn drop(&mut self) {
        if self.len() == 0 {
            return;
        }
        unsafe {
            let layout = Layout::from_size_align(self.len(), crate::page_size()).unwrap();
            alloc::dealloc(self.as_mut_ptr(), layout);
        }
    }
}
