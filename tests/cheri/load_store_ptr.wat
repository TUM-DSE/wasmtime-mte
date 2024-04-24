(module
  (memory i32 1)

  (func (export "do_load") (param ptr) (result i32)
    local.get 0
    i32.const 8
    ptr.add
    i32.load8_u offset=0
    drop
    local.get 0
    ptr.load
    i32.load
  )
)
