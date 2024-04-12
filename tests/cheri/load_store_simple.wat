(module
  (memory i32 1)

  (func (export "do_load0") (param i32) (result i32)
    (memory.grow (i32.const 1))
    drop
    local.get 0
    i32.load offset=0)

  (func (export "do_store") (param i32 i32)
    local.get 0
    local.get 1
    i32.store8 offset=0)

  (func (export "do_load") (param i32) (result i32)
    local.get 0
    i32.load8_u offset=0))

