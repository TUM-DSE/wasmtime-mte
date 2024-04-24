(module
  (memory 1 1)
  (func (export "foo") (param i64) (result i64)
        (i64.pointer_sign (local.get 0) (i64.const 0))
        (return)
  )
)
