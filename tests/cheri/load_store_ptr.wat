(module
  (memory i32 1)

  (func (export "do_load") (param ptr) (result i32)
    local.get 0
    i32.load8_u offset=0))
