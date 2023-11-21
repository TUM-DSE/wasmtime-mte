(module
  (memory i64 1 1)
  (global $sp (mut i32) (i32.const 64))
  (func (export "foo") (param i64) (result i32)
        (local $ptr i64)
        (local.get 0)
        (i64.add (i64.const 32))
        (i64.mul (i64.const 4))
        (i64.const 16)
        (segment.new)
        (local.tee $ptr)
        (i32.const 42)
        (i32.store)

        (local.get $ptr)
        (i32.load)

        (local.get $ptr)
        (i64.const 0)
        (i64.const 16)
        (segment.set_tag)
        (return)
  )
  (func (export "bar") (result i32)
        (local $ptr i64)
        (i64.const 0)
        (i64.const 16)
        (segment.new)
        (local.tee $ptr)

        ;; this should generate a mte fault
        (i64.add (i64.const 17))
        (i32.const 42)
        (i32.store)

        (local.get $ptr)
        (i32.load)

        (local.get $ptr)
        (i64.const 0)
        (i64.const 16)
        (segment.set_tag)
        (return)
  )
)
