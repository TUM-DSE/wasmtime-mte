(module
  (memory i64 1 1)
  (global $sp (mut i32) (i32.const 64))
  (func (export "load") (param i64) (result i32)
    (i32.load (local.get 0))
  )
)
