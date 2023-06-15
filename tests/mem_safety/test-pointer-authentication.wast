(module
  (memory i64 1 1)
  (global $sp (mut i64) (i64.const 64))

  ;; Equivalent C function:
  ;;
  ;; void store(int *ptr, int **x) {
  ;;   *x = ptr;
  ;; }
  ;;
  (func (export "store") (param $ptr i64) (param $x i64)
    ;; Store pointer $ptr to the memory address pointed to by $x
    (local.get $x) ;; push $x to stack
    (local.get $ptr) ;; push $ptr to stack
    (i64.pointer_sign) ;; sign_pointer(ptr): signs $ptr with PAC; return signed ptr on stack
    (i64.store) ;; store(x, ptr)
  )

  ;; Equivalent C function:
  ;;
  ;; int *load(int **x) {
  ;;   return *x;
  ;; }
  ;;
  (func (export "load") (param $x i64) (result i64)
    ;; Load address from memory pointed to by $x
    (local.get $x) ;; push $x to stack
    (i64.load) ;; load(x): push address pointed to by $x (*x) onto stack
    ;; TODO: think about whether pointer_auth even has to return authenticated pointer, could also simply trap if authentication fails
    (i64.pointer_auth) ;; auth_pointer(*x): verifies/authenticates PAC; if authenticated, return pointer back on stack, else trap
    (return) ;; 
  )
)
