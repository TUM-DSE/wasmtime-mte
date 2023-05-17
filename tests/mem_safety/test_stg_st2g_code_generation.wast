;; These are some "test-cases" to check whether wasmtime generates the expected
;; combination of stg, st2g and loops for different wast input files.
;;
;; How to run:
;; 1. Compile this file using wasmtime:
;; wasmtime compile --target aarch64-unknown-linux-gnu --cranelift-enable use_mte --wasm-features=memory64,mem-safety <this-file>
;; 2. Look at the generated asm code with `llvm-objdump`
;; llvm-objdump -D test_stg_st2g_code_generation.cwasm > tmp.s
;;
;; Note: the test-cases have been numbered, since they are also named `_wasm_function_n` in objdump's output

(module
  (memory i64 1 1)
  (global $sp (mut i32) (i32.const 64))


  ;; Test 0:
  ;;
  ;; Equivalent C function:
  ;;
  ;; int foo() {
  ;;   int x[4];
  ;;   x[0] = 42;
  ;;   return x[0];
  ;; }
  ;;
  ;; What stg/st2g instructions should be generated:
  ;; stg
  ;;
  (func (export "one_stg") (result i32)
        ;; int x[4]; (1 int is 4 bytes, 4 * 4 bytes = 16 bytes total)
        (local $ptr i64) ;; declare variable ptr

        ;; tag memory region
        (i64.const 0) ;; index (offset/ptr in wasm linear memory)
        (i64.const 16) ;; size of region we want to tag
        (segment.stack_new) ;; returns tagged_index on stack
        (local.tee $ptr) ;; store tagged_index into $ptr

        ;; x[0] = 42;
        (i32.const 42) ;; push 42 on stack
        (i32.store) ;; store value 42 into $ptr (ptr[0] = 42)

        ;; push ptr[0] onto stack
        (local.get $ptr) ;; push $ptr onto stack
        (i32.load) ;; push back ptr[0] onto stack

        ;; untag memory region
        (local.get $ptr) ;; push $ptr value to stack
        (i64.const 0) ;; index
        (i64.const 16) ;; size
        (segment.stack_free)

        ;; return x[0];
        (return)
  )



  ;; Test 1:
  ;;
  ;; Equivalent C function:
  ;;
  ;; int foo() {
  ;;   int x[20];
  ;;   x[0] = 42;
  ;;   return x[0];
  ;; }
  ;;
  ;; What stg/st2g instructions should be generated:
  ;; st2g
  ;; st2g
  ;; stg
  ;;
  (func (export "less_than_one_threshhold") (result i32)
        ;; int x[20]; (1 int is 4 bytes, 4 * 20 bytes = 80 bytes total)
        (local $ptr i64) ;; declare variable ptr

        ;; tag memory region
        (i64.const 0) ;; index (offset/ptr in wasm linear memory)
        (i64.const 80) ;; size of region we want to tag
        (segment.stack_new) ;; returns tagged_index on stack
        (local.tee $ptr) ;; store tagged_index into $ptr

        ;; x[0] = 42;
        (i32.const 42) ;; push 42 on stack
        (i32.store) ;; store value 42 into $ptr (ptr[0] = 42)

        ;; push ptr[0] onto stack
        (local.get $ptr) ;; push $ptr onto stack
        (i32.load) ;; push back ptr[0] onto stack

        ;; untag memory region
        (local.get $ptr) ;; push $ptr value to stack
        (i64.const 0) ;; index
        (i64.const 80) ;; size
        (segment.stack_free)

        ;; return x[0];
        (return)
  )



  ;; Test 2:
  ;;
  ;; Equivalent C function:
  ;;
  ;; int foo() {
  ;;   int x[40];
  ;;   x[0] = 42;
  ;;   return x[0];
  ;; }
  ;;
  ;; What stg/st2g instructions should be generated:
  ;; st2g
  ;; st2g
  ;; st2g
  ;; st2g
  ;; st2g
  ;;
  (func (export "exactly_one_threshhold") (result i32)
        ;; int x[40]; (1 int is 4 bytes, 4 * 40 bytes = 160 bytes total)
        (local $ptr i64) ;; declare variable ptr

        ;; tag memory region
        (i64.const 0) ;; index (offset/ptr in wasm linear memory)
        (i64.const 160) ;; size of region we want to tag
        (segment.stack_new) ;; returns tagged_index on stack
        (local.tee $ptr) ;; store tagged_index into $ptr

        ;; x[0] = 42;
        (i32.const 42) ;; push 42 on stack
        (i32.store) ;; store value 42 into $ptr (ptr[0] = 42)

        ;; push ptr[0] onto stack
        (local.get $ptr) ;; push $ptr onto stack
        (i32.load) ;; push back ptr[0] onto stack

        ;; untag memory region
        (local.get $ptr) ;; push $ptr value to stack
        (i64.const 0) ;; index
        (i64.const 160) ;; size
        (segment.stack_free)

        ;; return x[0];
        (return)
  )



  ;; Test 3:
  ;;
  ;; Equivalent C function:
  ;;
  ;; int foo() {
  ;;   int x[76];
  ;;   x[0] = 42;
  ;;   return x[0];
  ;; }
  ;;
  ;; What stg/st2g instructions should be generated:
  ;; st2g
  ;; st2g
  ;; st2g
  ;; st2g
  ;; st2g
  ;;
  ;; st2g
  ;; st2g
  ;; st2g
  ;; st2g
  ;; stg
  ;;
  (func (export "just_less_than_two_threshholds") (result i32)
        ;; int x[76]; (1 int is 4 bytes, 4 * 76 bytes = 2*160 - 16 = 304 bytes total)
        (local $ptr i64) ;; declare variable ptr

        ;; tag memory region
        (i64.const 0) ;; index (offset/ptr in wasm linear memory)
        (i64.const 304) ;; size of region we want to tag
        (segment.stack_new) ;; returns tagged_index on stack
        (local.tee $ptr) ;; store tagged_index into $ptr

        ;; x[0] = 42;
        (i32.const 42) ;; push 42 on stack
        (i32.store) ;; store value 42 into $ptr (ptr[0] = 42)

        ;; push ptr[0] onto stack
        (local.get $ptr) ;; push $ptr onto stack
        (i32.load) ;; push back ptr[0] onto stack

        ;; untag memory region
        (local.get $ptr) ;; push $ptr value to stack
        (i64.const 0) ;; index
        (i64.const 304) ;; size
        (segment.stack_free)

        ;; return x[0];
        (return)
  )



  ;; Test 4:
  ;;
  ;; Equivalent C function:
  ;;
  ;; int foo() {
  ;;   int x[132];
  ;;   x[0] = 42;
  ;;   return x[0];
  ;; }
  ;;
  ;; What stg/st2g instructions should be generated:
  ;; for _ in 0..3:
  ;;   st2g
  ;;   st2g
  ;;   st2g
  ;;   st2g
  ;;   st2g
  ;; st2g
  ;; stg
  ;;
  (func (export "multiple_threshhold_loops") (result i32)
        ;; int x[132]; (1 int is 4 bytes, 4 * 132 bytes = 528 bytes total)
        (local $ptr i64) ;; declare variable ptr

        ;; tag memory region
        (i64.const 0) ;; index (offset/ptr in wasm linear memory)
        (i64.const 528) ;; size of region we want to tag
        (segment.stack_new) ;; returns tagged_index on stack
        (local.tee $ptr) ;; store tagged_index into $ptr

        ;; x[0] = 42;
        (i32.const 42) ;; push 42 on stack
        (i32.store) ;; store value 42 into $ptr (ptr[0] = 42)

        ;; push ptr[0] onto stack
        (local.get $ptr) ;; push $ptr onto stack
        (i32.load) ;; push back ptr[0] onto stack

        ;; untag memory region
        (local.get $ptr) ;; push $ptr value to stack
        (i64.const 0) ;; index
        (i64.const 528) ;; size
        (segment.stack_free)

        ;; return x[0];
        (return)
  )



  ;; Test 5:
  ;;
  ;; Equivalent C function:
  ;;
  ;; int foo(int i) {
  ;;   int x[i];
  ;;   x[0] = 42;
  ;;   return x[0];
  ;; }
  ;;
  ;; What stg/st2g instructions should be generated:
  ;; Completely dynamic, no static optimizations
  ;;
  (func (export "non_constant_dynamic_length") (param $i i64) (result i32)
        ;; int x[i]; (1 int is 4 bytes, 4 * i bytes total)
        (local $ptr i64) ;; declare variable ptr

        ;; i *= 4 to get total bytes
        (local.get $i)
        (i64.const 4)
        (i64.mul)
        (local.set $i)

        ;; tag memory region
        (i64.const 0) ;; index (offset/ptr in wasm linear memory)
        (local.get $i) ;; size of region we want to tag
        (segment.stack_new) ;; returns tagged_index on stack
        (local.tee $ptr) ;; store tagged_index into $ptr

        ;; x[0] = 42;
        (i32.const 42) ;; push 42 on stack
        (i32.store) ;; store value 42 into $ptr (ptr[0] = 42)

        ;; push ptr[0] onto stack
        (local.get $ptr) ;; push $ptr onto stack
        (i32.load) ;; push back ptr[0] onto stack

        ;; untag memory region
        (local.get $ptr) ;; push $ptr value to stack
        (i64.const 0) ;; index
        (local.get $i) ;; size
        (segment.stack_free)

        ;; return x[0];
        (return)
  )
)
