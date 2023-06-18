(module
  (memory i64 1 1)
  (global $sp (mut i64) (i64.const 64))

  ;; Equivalent C function:
  ;;
  ;; void store_pointer(int *value_ptr, int **dst_ptr) {
  ;;   *dst_ptr = value_ptr;
  ;; }
  ;;
  (func (export "store_pointer") (param $value_ptr i64) (param $dst_ptr i64)
    ;; Store pointer $value_ptr to the memory address pointed to by $dst_ptr
    (local.get $dst_ptr) ;; push $dst_ptr to stack
    (local.get $value_ptr) ;; push $value_ptr to stack
    (i64.pointer_sign) ;; sign_pointer(value_ptr): signs $value_ptr with PAC; return signed value_ptr on stack
    (i64.store) ;; store(dst_ptr, value_ptr)
  )

  ;; Equivalent C function:
  ;;
  ;; int *load_pointer(int **x) {
  ;;   return *x;
  ;; }
  ;;
  (func (export "load_pointer") (param $x i64) (result i64)
    ;; Load address from memory pointed to by $x
    (local.get $x) ;; push $x to stack
    (i64.pointer_auth) ;; auth_pointer(*x): verifies/authenticates PAC; if authenticated, return pointer back on stack, else trap
    (i64.load) ;; load(x): push address pointed to by $x (*x) onto stack
    (return) ;; 
  )
)
