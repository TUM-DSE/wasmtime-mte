(module
  (memory 1 1)
  (global $sp (mut i32) (i32.const 1024))
  (func (export "foo") (result i32)
    (local $tmp i32)
    (local $tmp2 i32)
    (global.get $sp)
    (i32.const 256)
    (i32.sub)
    (local.tee $tmp)
    (global.set $sp)
    (local.get $tmp)
    (i32.const 16)
    (segment.new_stack)
    (tee_local $tmp2) (get_local $tmp2)

    (i32.const 42)
    (i32.store8)

    (i32.load8_s)
    (local.set $tmp2)
    (local.get $tmp)
    (global.get $sp)
    (i32.const 16)
    (segment.free_stack)
    (local.get $tmp)
    (i32.const 16)
    (i32.add)
    (global.set $sp)
    (local.get $tmp2)
    (return)

;;        (i32.sub (global.get $sp) (i32.const 16))
;;        (i32.const 16)
;;        (segment.new_stack)
;;        (i32.const 42)
;;        (i32.store)
;;        (i32.sub (i32.const 64) (i32.const 16))
;;        (i32.load)
;;
;;        (i32.sub (global.get $sp) (i32.const 16))
;;        (global.get $sp)
;;        (i32.const 16)
;;        (segment.free_stack)
;;        (return)
  )
)

;;(assert_return (invoke "foo") (i32.const 42))
;;
;;  	global.get	__stack_pointer
;;  	i32.const	256
;;  	i32.sub
;;  	local.tee	2
;;  	global.set	__stack_pointer
;;  	#DEBUG_VALUE: test:j <- undef
;;  	#DEBUG_VALUE: test:i <- !target-index(0,1)
;;  	local.get	2
;;  	i32.const	16
;;  	segment.stack_new
;;  .Ltmp2:
;;  	.loc	1 15 12 prologue_end            # ../hello-world/main.c:15:12
;;  	local.get	1
;;  	i32.add
;;  	i32.load8_s	0
;;  	local.set	1
;;  	local.get	2
;;  	i32.const	16
;;  	segment.free
;;  	.loc	1 15 5 is_stmt 0                # ../hello-world/main.c:15:5
;;  	local.get	2
;;  	i32.const	256
;;  	i32.add
;;  	global.set	__stack_pointer
;;  	local.get	1
;;                                          # fallthrough-return
;;  	end_function
;;