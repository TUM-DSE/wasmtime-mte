(module
  (memory 1 1)
  (func (export "foo") (result i32)
        (i32.sub (i32.const 64) (i32.const 16))
        (i32.const 16)
        (segment.new_stack)
        (i32.const 42)
        (i32.store)
        (i32.sub (i32.const 64) (i32.const 16))
        (i32.load)
        (return)
  )
;;  (func (export "foo2") (result i32)
;;        (i32.sub (i32.const 64) (i32.const 16))
;;        (i32.const 42)
;;        (i32.store)
;;        (i32.sub (i32.const 64) (i32.const 16))
;;        (i32.load)
;;        (return)
;;  )
)

;;(assert_return (invoke "foo") (i32.const 42))

