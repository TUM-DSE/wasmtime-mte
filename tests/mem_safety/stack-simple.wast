(module
  (memory 1 1)
  (global $sp (mut i32) (i32.const 64))
  (func (export "foo") (result i32)
        (local $ptr i64)
        (i32.const 0)
        (i32.const 16)
        (segment.stack_new)
        (local.tee $ptr)
        (i32.const 42)
        (i32.store_segment)

        (local.get $ptr)
        (i32.load_segment)

        (local.get $ptr)
        (i32.const 0)
        (i32.const 16)
        (segment.stack_free)
        (return)
  )
  (func (export "bar") (result i32)
        (local $ptr i64)
        (i32.const 0)
        (i32.const 16)
        (segment.stack_new)
        (local.tee $ptr)

        ;; this should generate a mte fault
        (i64.add (i64.const 17))
        (i32.const 42)
        (i32.store_segment)

        (local.get $ptr)
        (i32.load_segment)

        (local.get $ptr)
        (i32.const 0)
        (i32.const 16)
        (segment.stack_free)
        (return)
  )
)

;;(module
;;  (memory 1 1)
;;  (global $sp (mut i32) (i32.const 64))
;;  (func (export "foo") (result i32)
;;        (i32.const 0)
;;        (i32.const 16)
;;        (segment.stack_new)
;;        (i32.const 42)
;;        (i32.store)
;;        (i32.const 0)
;;        (i32.load)
;;
;;        (i32.const 0)
;;        (i32.const 0)
;;        (i32.const 16)
;;        (segment.stack_free)
;;        (return)
;;  )
;;)
