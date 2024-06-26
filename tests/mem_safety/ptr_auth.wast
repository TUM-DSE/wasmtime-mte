(module
    (memory 1 1)
    (func (export "sign") (param i64) (result i64)
        (i64.pointer_sign (local.get 0) (i64.const 0))
        (return)
    )
    (func (export "strip") (param i64) (result i64)
        (i64.pointer_strip (local.get 0))
        (return)
    )
    (func (export "sign+auth") (param i64) (param i64) (result i64)
        (i64.pointer_sign (local.get 0) (i64.const 0))
        (local.get 1)
        (i64.add)
        (i64.const 0)
        (i64.pointer_auth)
        (return)
    )
    (func $add (;8;) (result i64)
        (local i64 i64 i64)
        i64.const 1
        local.set 0
        i64.const 0
        local.set 1
        local.get 0
        local.get 1
        i64.pointer_sign
        local.set 2
        local.get 2
        return
    )
)
