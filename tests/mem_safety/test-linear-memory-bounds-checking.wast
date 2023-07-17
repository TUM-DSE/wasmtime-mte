(module
  ;; Define a memory with initial size of 1 page (64KiB).
  (memory i64 1 1)

  ;; Define a function that attempts to read from address 70000, which is beyond the linear memory.
  (func $readOutOfBounds (result i64)
    (i64.load (i64.const 70000))  ;; Load 64-bit integer from address 70000, expect MTE to trap
  )

  (func (export "main") (result i64)
    ;; Call readOutOfBounds and return its result
    (call $readOutOfBounds)
  )
)
