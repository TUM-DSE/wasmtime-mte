//! Constants that should be exported so they can be used in `cranelift` but
//! also in other crates.

// Memory Tagging Extension (MTE):

/// The tag assigned to free memory {regions, addresses} in the linear memory.
pub const MTE_LINEAR_MEMORY_FREE_TAG: u8 = 0b0001;

/// The tag assigned to free memory {regions, addresses} outside the linear
/// memory. This value must also be configured as the default tag the Linux OS
/// assigns to all uninitialized, free memory.
pub const MTE_DEFAULT_FREE_TAG: u8 = 0b0000;

/// The least significant bit of an MTE tag.
pub const MTE_TAG_LEAST_SIG_BIT: u8 = 56;

/// The most significant bit of an MTE tag.
pub const MTE_TAG_MOST_SIG_BIT: u8 = 59;

/// A 64-bit bit mask that has all bits set, only the bits of the
/// MTE tag (56-59) are unset.
pub const BIT_MASK_EXCLUDING_MTE_TAG: i64 = 0xF0FF_FFFF_FFFF_FFFFu64 as i64;

/// A 64-bit bit mask that has all bits unset, only the bits of the
/// MTE tag (56-59) are set.
pub const BIT_MASK_INCLUDING_MTE_TAG: i64 = 0x0F00_0000_0000_0000u64 as i64;
