//! MTE module

#![allow(dead_code)]

use anyhow::Result;
use std::ffi::c_void;
use wasmtime_environ::Tunables;

/// Mask to mask out the mte tag
const MTE_MASK: usize = 0xF0FF_FFFF_FFFF_FFFF;
/// The default tag to use for runtime memory
pub const RUNTIME_MEM_TAG: usize = 0x0100_0000_0000_0000;

/// Untag a pointer
#[inline]
#[cfg(all(target_feature = "mte", target_arch = "aarch64"))]
pub fn untag_ptr<T>(ptr: *mut T) -> *mut T {
    (ptr as usize & MTE_MASK) as *mut T
}

/// Untag a pointer
#[inline]
#[cfg(not(all(target_feature = "mte", target_arch = "aarch64")))]
pub fn untag_ptr<T>(ptr: *mut T) -> *mut T {
    ptr
}

/// In which mode MTE should be enabled
#[derive(Copy, Clone)]
pub enum MTEMode {
    /// Ignore tag check faults
    None,
    /// Synchronous tag check fault mode
    Sync,
    /// Asynchronous tag check fault mode
    Async,
}

impl MTEMode {
    fn mask(&self) -> u64 {
        const PR_MTE_TCF_SHIFT: i32 = 1;
        match self {
            MTEMode::None => 0,
            MTEMode::Sync => 1u64 << PR_MTE_TCF_SHIFT,
            MTEMode::Async => 2u64 << PR_MTE_TCF_SHIFT,
        }
    }
}

/// Enable mte for the current process
#[cfg(all(
    target_feature = "mte",
    any(target_os = "linux", target_os = "android"),
    target_arch = "aarch64"
))]
pub fn enable_mte(mode: MTEMode) -> Result<()> {
    use std::io;

    const PR_SET_TAGGED_ADDR_CTRL: i32 = 55;
    const PR_TAGGED_ADDR_ENABLE: u64 = 1 << 0;
    const PR_MTE_TAG_SHIFT: i32 = 3;

    // first we enable MTE for the current process
    unsafe {
        if libc::prctl(
            PR_SET_TAGGED_ADDR_CTRL,
            PR_TAGGED_ADDR_ENABLE
                | mode.mask()
                | (0xfffeu64 << PR_MTE_TAG_SHIFT),
            0,
            0,
            0,
        ) != 0
        {
            anyhow::bail!(io::Error::last_os_error())
        }
    }

    Ok(())
}

/// Enable mte for the current process
#[cfg(not(all(
    target_feature = "mte",
    any(target_os = "linux", target_os = "android"),
    target_arch = "aarch64"
)))]
pub fn enable_mte(_mode: MTEMode) -> Result<()> {
    anyhow::bail!(
        "cannot enable mte on os {}, arch {}",
        std::env::consts::OS,
        std::env::consts::ARCH
    )
}


/// Copy the tags from one mmapped memory region to another
/// The caller must ensure a few things:
/// - Both memory regions are valid and have enabled mte
/// - [from] and [to] are both at least [len] bytes long
/// - [from], [to], and [len] are aligned on MTE boundaries, i.e. 16 bytes
#[cfg(all(
target_arch = "aarch64",
any(target_os = "linux", target_os = "android"),
target_feature = "mte"
))]
pub unsafe fn copy_tags(from: *const u8, to: *mut u8, len: usize) {
    use std::arch::asm;

    assert_eq!(len % 16, 0);

    let mut from = from;
    let mut to = to;

    let end = to.offset(len as isize);

    while to != end {
        let mut tagged_ptr: u64;
        asm!("ldg {tagged_ptr}, [{from}]", tagged_ptr = out(reg) tagged_ptr, from = inout(reg) from);
        from = from.offset(16);
        asm!("stg {tagged_ptr}, [{to}], #16", tagged_ptr = in(reg) tagged_ptr, to = inout(reg) to);
    }
}


/// Copy the tags from one mmapped memory region to another
/// The caller must ensure a few things:
/// - Both memory regions are valid and have enabled mte
/// - [from] and [to] are both at least [len] bytes long
/// - [from], [to], and [len] are aligned on MTE boundaries, i.e. 16 bytes
#[cfg(not(all(
target_arch = "aarch64",
any(target_os = "linux", target_os = "android"),
target_feature = "mte"
)))]
pub unsafe fn copy_tags(_from: *const u8, _to: *mut u8, _len: usize) {
}


/// Mark memory as accessible and enable mte
/// Unsafe as the caller may only call this on mmaped memory
#[cfg(all(
    target_feature = "mte",
    any(target_os = "linux", target_os = "android"),
    target_arch = "aarch64"
))]
pub unsafe fn make_accessible(ptr: *mut c_void, len: usize) -> Result<()> {
    use std::io;

    let prot = libc::PROT_READ | libc::PROT_WRITE | 0x20 /* PROT_MTE */;

    unsafe {
        if libc::mprotect(ptr.cast(), len, prot) != 0 {
            anyhow::bail!(io::Error::last_os_error())
        }
    }

    Ok(())
}

/// Mark memory as accessible and enable mte
#[cfg(not(all(
    target_feature = "mte",
    any(target_os = "linux", target_os = "android"),
    target_arch = "aarch64"
)))]
pub unsafe fn make_accessible(_ptr: *mut c_void, _len: usize) -> Result<()> {
    anyhow::bail!(
        "cannot enable mte for memory on os {}, arch {}",
        std::env::consts::OS,
        std::env::consts::ARCH
    )
}

/// Tag a memory region
/// Unsafe as the caller may only call this on mte enabled memory
#[cfg(all(
    target_feature = "mte",
    any(target_os = "linux", target_os = "android"),
    target_arch = "aarch64"
))]
pub unsafe fn tag_memory(tag: *mut c_void, ptr: *mut c_void, len: usize) -> Result<()> {
    use std::arch::asm;
    assert_eq!((ptr as usize) % 16, 0, "memory must be aligned to 16 bytes");
    assert_eq!(len % 16, 0, "memory length must be aligned to 16 bytes");

    let mut i = 0usize;
    while i + 32 <= len {
        let ptr = ptr.offset(i as isize);
        asm!("st2g {tag}, [{ptr}]", tag = in(reg) tag, ptr = in(reg) ptr);
        i += 32;
    }

    if i + 16 <= len {
        let ptr = ptr.offset(i as isize);
        asm!("stg {tag}, [{ptr}]", tag = in(reg) tag, ptr = in(reg) ptr);
        i += 16;
    }

    assert_eq!(i, len);

    Ok(())
}

/// Tag a memory region
#[cfg(not(all(
    target_feature = "mte",
    any(target_os = "linux", target_os = "android"),
    target_arch = "aarch64"
)))]
pub unsafe fn tag_memory(_tag: *mut c_void, _ptr: *mut c_void, _len: usize) -> Result<()> {
    anyhow::bail!(
        "cannot tag memory with mte for memory on os {}, arch {}",
        std::env::consts::OS,
        std::env::consts::ARCH
    )
}

/// MTE config for the mmap memory
#[derive(Debug, Default, Copy, Clone)]
pub struct MTEConfig {
    /// If mte is enabled
    pub enabled: bool,
    /// If bounds checks are done using MTE
    pub bounds_checks: bool,
}

impl MTEConfig {
    /// Copy config values from tunables
    pub fn new(tunables: &Tunables) -> Self {
        Self {
            enabled: tunables.enable_mte,
            bounds_checks: tunables.enable_mte_bounds_checks,
        }
    }
}
