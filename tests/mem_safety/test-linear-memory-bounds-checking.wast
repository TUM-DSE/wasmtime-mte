(module
  ;; Define a memory with initial size of 1 page (64KiB).
  (memory i64 1 1)

  ;; Define a function that attempts to read from address 70000, which is beyond the linear memory.
  (func $readOutOfBounds (result i32)
    (i32.load (i32.const 70000))  ;; Load 32-bit integer from address 70000, expect MTE to trap
  )

  ;; Set $readOutOfBounds to be called when the module starts
  (start $readOutOfBounds)
)
