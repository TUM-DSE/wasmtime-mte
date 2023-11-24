//! WebAssembly module and function translation state.
//!
//! The `FuncTranslationState` struct defined in this module is used to keep track of the WebAssembly
//! value and control stacks during the translation of a single function.

use crate::environ::{FuncEnvironment, GlobalVariable};
use crate::{FuncIndex, GlobalIndex, Heap, MemoryIndex, TableIndex, TypeIndex, WasmResult};
use crate::{HashMap, Occupied, Vacant};
use cranelift_codegen::ir::{self, Block, Inst, InstBuilder, Value};
use cranelift_frontend::FunctionBuilder;
use once_cell::sync::Lazy;
use rand::Rng;
use std::vec::Vec;

/// Information about the presence of an associated `else` for an `if`, or the
/// lack thereof.
#[derive(Debug)]
pub enum ElseData {
    /// The `if` does not already have an `else` block.
    ///
    /// This doesn't mean that it will never have an `else`, just that we
    /// haven't seen it yet.
    NoElse {
        /// If we discover that we need an `else` block, this is the jump
        /// instruction that needs to be fixed up to point to the new `else`
        /// block rather than the destination block after the `if...end`.
        branch_inst: Inst,

        /// The placeholder block we're replacing.
        placeholder: Block,
    },

    /// We have already allocated an `else` block.
    ///
    /// Usually we don't know whether we will hit an `if .. end` or an `if
    /// .. else .. end`, but sometimes we can tell based on the block's type
    /// signature that the signature is not valid if there isn't an `else`. In
    /// these cases, we pre-allocate the `else` block.
    WithElse {
        /// This is the `else` block.
        else_block: Block,
    },
}

/// A control stack frame can be an `if`, a `block` or a `loop`, each one having the following
/// fields:
///
/// - `destination`: reference to the `Block` that will hold the code after the control block;
/// - `num_return_values`: number of values returned by the control block;
/// - `original_stack_size`: size of the value stack at the beginning of the control block.
///
/// The `loop` frame has a `header` field that references the `Block` that contains the beginning
/// of the body of the loop.
#[derive(Debug)]
pub enum ControlStackFrame {
    If {
        destination: Block,
        else_data: ElseData,
        num_param_values: usize,
        num_return_values: usize,
        original_stack_size: usize,
        exit_is_branched_to: bool,
        blocktype: wasmparser::BlockType,
        /// Was the head of the `if` reachable?
        head_is_reachable: bool,
        /// What was the reachability at the end of the consequent?
        ///
        /// This is `None` until we're finished translating the consequent, and
        /// is set to `Some` either by hitting an `else` when we will begin
        /// translating the alternative, or by hitting an `end` in which case
        /// there is no alternative.
        consequent_ends_reachable: Option<bool>,
        // Note: no need for `alternative_ends_reachable` because that is just
        // `state.reachable` when we hit the `end` in the `if .. else .. end`.
    },
    Block {
        destination: Block,
        num_param_values: usize,
        num_return_values: usize,
        original_stack_size: usize,
        exit_is_branched_to: bool,
    },
    Loop {
        destination: Block,
        header: Block,
        num_param_values: usize,
        num_return_values: usize,
        original_stack_size: usize,
    },
}

/// Helper methods for the control stack objects.
impl ControlStackFrame {
    pub fn num_return_values(&self) -> usize {
        match *self {
            Self::If {
                num_return_values, ..
            }
            | Self::Block {
                num_return_values, ..
            }
            | Self::Loop {
                num_return_values, ..
            } => num_return_values,
        }
    }
    pub fn num_param_values(&self) -> usize {
        match *self {
            Self::If {
                num_param_values, ..
            }
            | Self::Block {
                num_param_values, ..
            }
            | Self::Loop {
                num_param_values, ..
            } => num_param_values,
        }
    }
    pub fn following_code(&self) -> Block {
        match *self {
            Self::If { destination, .. }
            | Self::Block { destination, .. }
            | Self::Loop { destination, .. } => destination,
        }
    }
    pub fn br_destination(&self) -> Block {
        match *self {
            Self::If { destination, .. } | Self::Block { destination, .. } => destination,
            Self::Loop { header, .. } => header,
        }
    }
    /// Private helper. Use `truncate_value_stack_to_else_params()` or
    /// `truncate_value_stack_to_original_size()` to restore value-stack state.
    fn original_stack_size(&self) -> usize {
        match *self {
            Self::If {
                original_stack_size,
                ..
            }
            | Self::Block {
                original_stack_size,
                ..
            }
            | Self::Loop {
                original_stack_size,
                ..
            } => original_stack_size,
        }
    }
    pub fn is_loop(&self) -> bool {
        match *self {
            Self::If { .. } | Self::Block { .. } => false,
            Self::Loop { .. } => true,
        }
    }

    pub fn exit_is_branched_to(&self) -> bool {
        match *self {
            Self::If {
                exit_is_branched_to,
                ..
            }
            | Self::Block {
                exit_is_branched_to,
                ..
            } => exit_is_branched_to,
            Self::Loop { .. } => false,
        }
    }

    pub fn set_branched_to_exit(&mut self) {
        match *self {
            Self::If {
                ref mut exit_is_branched_to,
                ..
            }
            | Self::Block {
                ref mut exit_is_branched_to,
                ..
            } => *exit_is_branched_to = true,
            Self::Loop { .. } => {}
        }
    }

    /// Pop values from the value stack so that it is left at the
    /// input-parameters to an else-block.
    pub fn truncate_value_stack_to_else_params(&self, stack: &mut Vec<Value>) {
        debug_assert!(matches!(self, &ControlStackFrame::If { .. }));
        stack.truncate(self.original_stack_size());
    }

    /// Pop values from the value stack so that it is left at the state it was
    /// before this control-flow frame.
    pub fn truncate_value_stack_to_original_size(&self, stack: &mut Vec<Value>) {
        // The "If" frame pushes its parameters twice, so they're available to the else block
        // (see also `FuncTranslationState::push_if`).
        // Yet, the original_stack_size member accounts for them only once, so that the else
        // block can see the same number of parameters as the consequent block. As a matter of
        // fact, we need to substract an extra number of parameter values for if blocks.
        let num_duplicated_params = match self {
            &ControlStackFrame::If {
                num_param_values, ..
            } => {
                debug_assert!(num_param_values <= self.original_stack_size());
                num_param_values
            }
            _ => 0,
        };
        stack.truncate(self.original_stack_size() - num_duplicated_params);
    }
}

/// Contains information passed along during a function's translation and that records:
///
/// - The current value and control stacks.
/// - The depth of the two unreachable control blocks stacks, that are manipulated when translating
///   unreachable code;
pub struct FuncTranslationState {
    /// A stack of values corresponding to the active values in the input wasm function at this
    /// point.
    pub(crate) stack: Vec<Value>,
    /// A stack of active control flow operations at this point in the input wasm function.
    pub(crate) control_stack: Vec<ControlStackFrame>,
    /// Is the current translation state still reachable? This is false when translating operators
    /// like End, Return, or Unreachable.
    pub(crate) reachable: bool,

    // Map of global variables that have already been created by `FuncEnvironment::make_global`.
    globals: HashMap<GlobalIndex, GlobalVariable>,

    // Map of heaps that have been created by `FuncEnvironment::make_heap`.
    memory_to_heap: HashMap<MemoryIndex, Heap>,

    // Map of tables that have been created by `FuncEnvironment::make_table`.
    pub(crate) tables: HashMap<TableIndex, ir::Table>,

    // Map of indirect call signatures that have been created by
    // `FuncEnvironment::make_indirect_sig()`.
    // Stores both the signature reference and the number of WebAssembly arguments
    signatures: HashMap<TypeIndex, (ir::SigRef, usize)>,

    // Imported and local functions that have been created by
    // `FuncEnvironment::make_direct_func()`.
    // Stores both the function reference and the number of WebAssembly arguments
    functions: HashMap<FuncIndex, (ir::FuncRef, usize)>,

    // TODO: maybe split into two separate members, latest_tagged_index and latest_tag. but having together makes sense due to the Option, whether each member is Some or None should always be the same

    // In each (C) function, stack arrays are allocated contiguously. We want
    // to deterministically guarantee that no two consecutive stack allocations
    // share the same MTE tag. Therefore, we generate an initial MTE tag
    // randomly, and deterministically generate the next tags using that initial
    // tag, ensuring that no consecutively generated tags are equal.
    // We store the lastest random tag, which we always need to calculate the
    // next random tag.
    latest_random_mte_tag: Option<RandomMteTag>,
}

const MTE_NON_TAG_BITS_MASK: i64 = 0xF0FF_FFFF_FFFF_FFFFu64 as i64;
const MTE_DEFAULT_FREE_TAG: u8 = 0b0000;
const MTE_TAG_MIN_VALUE: u8 = 0b0000;
const MTE_TAG_MAX_VALUE: u8 = 0b1111;

/// When generating random MTE tags, these values can never be generated.
const EXCLUDED_MTE_TAGS: [u8; 1] = [MTE_DEFAULT_FREE_TAG];

/// All possible values of random MTE tags that are allowed to be generated.
/// This includes all valid MTE values (0-15) without `EXCLUDED_MTE_TAGS`.
static ALL_POSSIBLE_RANDOM_MTE_TAGS: Lazy<(usize, Vec<u8>)> = Lazy::new(|| {
    // Iterate over all valid MTE tag values (0..=15).
    let vector: Vec<u8> = (MTE_TAG_MIN_VALUE..=MTE_TAG_MAX_VALUE)
        // Remove excluded (special) MTE tags so they never get generated.
        .filter(|x| !EXCLUDED_MTE_TAGS.contains(x))
        .collect();
    (vector.len(), vector)
});

/// A 4-bit MTE (Memory Tagging Extension) tag that is randomly generated at
/// compile-time. Importantly, the generated tag must be a valid MTE tag
/// (between 0b0000 and 0b1111) and must not be one of the special free tags
/// from `EXCLUDED_MTE_TAGS`.
#[derive(Debug)]
struct RandomMteTag {
    tag: u8,
    // TODO: we could probably make this a u8 for efficieny as well, but vector.len() natively returns usize, so we use that for now
    index: usize,
}

impl RandomMteTag {
    /// Generate the initial random MTE tag.
    fn generate_initial() -> Self {
        let (all_possible_values_len, all_possible_tags) = &*ALL_POSSIBLE_RANDOM_MTE_TAGS;
        let initial_random_index = rand::thread_rng().gen_range(0..*all_possible_values_len);
        let initial_random_tag = all_possible_tags[initial_random_index];

        Self {
            tag: initial_random_tag,
            index: initial_random_index,
        }
    }

    /// Given the current MTE tag, generate the next MTE tag deterministically
    /// so that it never has the same value as the current MTE tag.
    fn generate_next(self) -> Self {
        let (all_possible_values_len, all_possible_tags) = &*ALL_POSSIBLE_RANDOM_MTE_TAGS;
        // Get next index by incrementing, and wrapping around once max index is reached.
        let next_random_index = (self.index + 1) % all_possible_values_len;
        let next_random_tag = all_possible_tags[next_random_index];

        Self {
            tag: next_random_tag,
            index: next_random_index,
        }
    }

    /// Tag an index, which has never been tagged, with this random tag.
    /// Returns the newly tagged index.
    fn _tag_untagged_index(&self, untagged_index: Value, builder: &mut FunctionBuilder) -> Value {
        // Tag with this tag.
        let new_tagged_index = builder
            .ins()
            .bor_imm(untagged_index, (self.tag as i64) << 56);

        new_tagged_index
    }

    /// Tag an index, which is already tagged, with this random tag.
    /// Returns the newly tagged index.
    fn tag_tagged_index(&self, tagged_index: Value, builder: &mut FunctionBuilder) -> Value {
        // Remove tag from already tagged index.
        let untagged_index = builder.ins().band_imm(tagged_index, MTE_NON_TAG_BITS_MASK);
        // Tag with this tag.
        let new_tagged_index = builder
            .ins()
            .bor_imm(untagged_index, (self.tag as i64) << 56);

        new_tagged_index
    }
}

impl FuncTranslationState {
    /// Tag the `index` with an MTE tag, and return the tagged index.
    /// The index of the first allocation in a (C) function will always be
    /// tagged with a (compile-time generated) random tag, and subsequent
    /// allocation indexes will be tagged in a way so that their tags are
    /// deterministically never equal to the tag of their predecessor.
    pub fn tag_index(&mut self, index: Value, builder: &mut FunctionBuilder) -> Value {
        let new_random_tag = match self.latest_random_mte_tag.take() {
            None => RandomMteTag::generate_initial(),
            Some(previous_random_tag) => previous_random_tag.generate_next(),
        };

        // TODO: once everything works, maybe optimize by using tag_untagged_index for initial => inserts one inst less
        let new_tagged_index = new_random_tag.tag_tagged_index(index, builder);

        self.latest_random_mte_tag = Some(new_random_tag);
        new_tagged_index
    }
}

// Public methods that are exposed to non-`cranelift_wasm` API consumers.
impl FuncTranslationState {
    /// True if the current translation state expresses reachable code, false if it is unreachable.
    #[inline]
    pub fn reachable(&self) -> bool {
        self.reachable
    }
}

impl FuncTranslationState {
    /// Construct a new, empty, `FuncTranslationState`
    pub(crate) fn new() -> Self {
        Self {
            stack: Vec::new(),
            control_stack: Vec::new(),
            reachable: true,
            globals: HashMap::new(),
            memory_to_heap: HashMap::new(),
            tables: HashMap::new(),
            signatures: HashMap::new(),
            functions: HashMap::new(),
            // Generate a new initial random value for the next (C) function.
            latest_random_mte_tag: None,
        }
    }

    fn clear(&mut self) {
        debug_assert!(self.stack.is_empty());
        debug_assert!(self.control_stack.is_empty());
        self.reachable = true;
        self.globals.clear();
        self.memory_to_heap.clear();
        self.tables.clear();
        self.signatures.clear();
        self.functions.clear();
        // Generate a new initial random value for the next (C) function.
        self.latest_random_mte_tag = None;
    }

    /// Initialize the state for compiling a function with the given signature.
    ///
    /// This resets the state to containing only a single block representing the whole function.
    /// The exit block is the last block in the function which will contain the return instruction.
    pub(crate) fn initialize(&mut self, sig: &ir::Signature, exit_block: Block) {
        self.clear();
        self.push_block(
            exit_block,
            0,
            sig.returns
                .iter()
                .filter(|arg| arg.purpose == ir::ArgumentPurpose::Normal)
                .count(),
        );
    }

    /// Push a value.
    pub(crate) fn push1(&mut self, val: Value) {
        self.stack.push(val);
    }

    /// Push multiple values.
    pub(crate) fn pushn(&mut self, vals: &[Value]) {
        self.stack.extend_from_slice(vals);
    }

    /// Pop one value.
    pub(crate) fn pop1(&mut self) -> Value {
        self.stack
            .pop()
            .expect("attempted to pop a value from an empty stack")
    }

    /// Peek at the top of the stack without popping it.
    pub(crate) fn peek1(&self) -> Value {
        *self
            .stack
            .last()
            .expect("attempted to peek at a value on an empty stack")
    }

    /// Pop two values. Return them in the order they were pushed.
    pub(crate) fn pop2(&mut self) -> (Value, Value) {
        let v2 = self.stack.pop().unwrap();
        let v1 = self.stack.pop().unwrap();
        (v1, v2)
    }

    /// Pop three values. Return them in the order they were pushed.
    pub(crate) fn pop3(&mut self) -> (Value, Value, Value) {
        let v3 = self.stack.pop().unwrap();
        let v2 = self.stack.pop().unwrap();
        let v1 = self.stack.pop().unwrap();
        (v1, v2, v3)
    }

    /// Helper to ensure the the stack size is at least as big as `n`; note that due to
    /// `debug_assert` this will not execute in non-optimized builds.
    #[inline]
    fn ensure_length_is_at_least(&self, n: usize) {
        debug_assert!(
            n <= self.stack.len(),
            "attempted to access {} values but stack only has {} values",
            n,
            self.stack.len()
        )
    }

    /// Pop the top `n` values on the stack.
    ///
    /// The popped values are not returned. Use `peekn` to look at them before popping.
    pub(crate) fn popn(&mut self, n: usize) {
        self.ensure_length_is_at_least(n);
        let new_len = self.stack.len() - n;
        self.stack.truncate(new_len);
    }

    /// Peek at the top `n` values on the stack in the order they were pushed.
    pub(crate) fn peekn(&self, n: usize) -> &[Value] {
        self.ensure_length_is_at_least(n);
        &self.stack[self.stack.len() - n..]
    }

    /// Peek at the top `n` values on the stack in the order they were pushed.
    pub(crate) fn peekn_mut(&mut self, n: usize) -> &mut [Value] {
        self.ensure_length_is_at_least(n);
        let len = self.stack.len();
        &mut self.stack[len - n..]
    }

    /// Push a block on the control stack.
    pub(crate) fn push_block(
        &mut self,
        following_code: Block,
        num_param_types: usize,
        num_result_types: usize,
    ) {
        debug_assert!(num_param_types <= self.stack.len());
        self.control_stack.push(ControlStackFrame::Block {
            destination: following_code,
            original_stack_size: self.stack.len() - num_param_types,
            num_param_values: num_param_types,
            num_return_values: num_result_types,
            exit_is_branched_to: false,
        });
    }

    /// Push a loop on the control stack.
    pub(crate) fn push_loop(
        &mut self,
        header: Block,
        following_code: Block,
        num_param_types: usize,
        num_result_types: usize,
    ) {
        debug_assert!(num_param_types <= self.stack.len());
        self.control_stack.push(ControlStackFrame::Loop {
            header,
            destination: following_code,
            original_stack_size: self.stack.len() - num_param_types,
            num_param_values: num_param_types,
            num_return_values: num_result_types,
        });
    }

    /// Push an if on the control stack.
    pub(crate) fn push_if(
        &mut self,
        destination: Block,
        else_data: ElseData,
        num_param_types: usize,
        num_result_types: usize,
        blocktype: wasmparser::BlockType,
    ) {
        debug_assert!(num_param_types <= self.stack.len());

        // Push a second copy of our `if`'s parameters on the stack. This lets
        // us avoid saving them on the side in the `ControlStackFrame` for our
        // `else` block (if it exists), which would require a second heap
        // allocation. See also the comment in `translate_operator` for
        // `Operator::Else`.
        self.stack.reserve(num_param_types);
        for i in (self.stack.len() - num_param_types)..self.stack.len() {
            let val = self.stack[i];
            self.stack.push(val);
        }

        self.control_stack.push(ControlStackFrame::If {
            destination,
            else_data,
            original_stack_size: self.stack.len() - num_param_types,
            num_param_values: num_param_types,
            num_return_values: num_result_types,
            exit_is_branched_to: false,
            head_is_reachable: self.reachable,
            consequent_ends_reachable: None,
            blocktype,
        });
    }
}

/// Methods for handling entity references.
impl FuncTranslationState {
    /// Get the `GlobalVariable` reference that should be used to access the global variable
    /// `index`. Create the reference if necessary.
    /// Also return the WebAssembly type of the global.
    pub(crate) fn get_global<FE: FuncEnvironment + ?Sized>(
        &mut self,
        func: &mut ir::Function,
        index: u32,
        environ: &mut FE,
    ) -> WasmResult<GlobalVariable> {
        let index = GlobalIndex::from_u32(index);
        match self.globals.entry(index) {
            Occupied(entry) => Ok(*entry.get()),
            Vacant(entry) => Ok(*entry.insert(environ.make_global(func, index)?)),
        }
    }

    /// Get the `Heap` reference that should be used to access linear memory `index`.
    /// Create the reference if necessary.
    pub(crate) fn get_heap<FE: FuncEnvironment + ?Sized>(
        &mut self,
        func: &mut ir::Function,
        index: u32,
        environ: &mut FE,
    ) -> WasmResult<Heap> {
        let index = MemoryIndex::from_u32(index);
        match self.memory_to_heap.entry(index) {
            Occupied(entry) => Ok(*entry.get()),
            Vacant(entry) => Ok(*entry.insert(environ.make_heap(func, index)?)),
        }
    }

    /// Get the `Table` reference that should be used to access table `index`.
    /// Create the reference if necessary.
    pub(crate) fn get_or_create_table<FE: FuncEnvironment + ?Sized>(
        &mut self,
        func: &mut ir::Function,
        index: u32,
        environ: &mut FE,
    ) -> WasmResult<ir::Table> {
        let index = TableIndex::from_u32(index);
        match self.tables.entry(index) {
            Occupied(entry) => Ok(*entry.get()),
            Vacant(entry) => Ok(*entry.insert(environ.make_table(func, index)?)),
        }
    }

    /// Get the `SigRef` reference that should be used to make an indirect call with signature
    /// `index`. Also return the number of WebAssembly arguments in the signature.
    ///
    /// Create the signature if necessary.
    pub(crate) fn get_indirect_sig<FE: FuncEnvironment + ?Sized>(
        &mut self,
        func: &mut ir::Function,
        index: u32,
        environ: &mut FE,
    ) -> WasmResult<(ir::SigRef, usize)> {
        let index = TypeIndex::from_u32(index);
        match self.signatures.entry(index) {
            Occupied(entry) => Ok(*entry.get()),
            Vacant(entry) => {
                let sig = environ.make_indirect_sig(func, index)?;
                Ok(*entry.insert((sig, num_wasm_parameters(environ, &func.dfg.signatures[sig]))))
            }
        }
    }

    /// Get the `FuncRef` reference that should be used to make a direct call to function
    /// `index`. Also return the number of WebAssembly arguments in the signature.
    ///
    /// Create the function reference if necessary.
    pub(crate) fn get_direct_func<FE: FuncEnvironment + ?Sized>(
        &mut self,
        func: &mut ir::Function,
        index: u32,
        environ: &mut FE,
    ) -> WasmResult<(ir::FuncRef, usize)> {
        let index = FuncIndex::from_u32(index);
        match self.functions.entry(index) {
            Occupied(entry) => Ok(*entry.get()),
            Vacant(entry) => {
                let fref = environ.make_direct_func(func, index)?;
                let sig = func.dfg.ext_funcs[fref].signature;
                Ok(*entry.insert((
                    fref,
                    num_wasm_parameters(environ, &func.dfg.signatures[sig]),
                )))
            }
        }
    }
}

fn num_wasm_parameters<FE: FuncEnvironment + ?Sized>(
    environ: &FE,
    signature: &ir::Signature,
) -> usize {
    (0..signature.params.len())
        .filter(|index| environ.is_wasm_parameter(signature, *index))
        .count()
}
