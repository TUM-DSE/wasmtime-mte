(module
  (memory i64 1 1)
  ;; (global $sp (mut i64) (i64.const 64))
  (global $__stack_pointer (mut i64) (i64.const 64))

  ;; Equivalent C function:
  ;;
  ;; void store_pointer(int *value_ptr, int **dst_ptr) {
  ;;   *dst_ptr = value_ptr;
  ;; }
  ;;
  (func $store_pointer (export "store_pointer") (param $value_ptr i64) (param $dst_ptr i64)
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
  (func $load_pointer (export "load_pointer") (param $x i64) (result i64)
    ;; Load address from memory pointed to by $x
    (local.get $x) ;; push $x to stack
    (i64.load) ;; load(x): push address pointed to by $x (*x) onto stack
    (i64.pointer_auth) ;; auth_pointer(*x): verifies/authenticates PAC; if authenticated, return pointer back on stack, else trap
    (return) ;; 
  )

  ;; Equivalent C function:
  ;;
  ;; int main() {
  ;;   int *buf[4];
  ;;   int x = 42;
  ;;
  ;;   // &buf[1] is signed with PAC here
  ;;   store_pointer(&x, &buf[1]);
  ;;
  ;;   // load succeeds because &buf[1] can be authenticated with PAC
  ;;   int *x_ptr = (int*) load_pointer(&buf[1]);
  ;;
  ;;   return 0;
  ;; }
  ;;
  (func (export "main") (result i64)
    (local $buf_addr i64)
    (local $x_addr i64)

    (global.get $__stack_pointer)
    (i64.const 32)
    (i64.sub)
    (local.tee $buf_addr)
    (i64.const 4)
    (i64.sub)
    (local.tee $x_addr)
    (global.set $__stack_pointer)

    (local.get $x_addr)
    (local.get $buf_addr)
    (i64.const 1)
    (i64.add)
    (call $store_pointer)

    (local.get $buf_addr)
    (i64.const 1)
    (i64.add)
    (call $load_pointer)
    (drop) ;; weil wir nichts mit *x_ptr machen

    (global.get $__stack_pointer)
    (i64.const 36)
    (i64.add)
    (global.set $__stack_pointer)

    (i64.const 0)
    (return)
  )

)
