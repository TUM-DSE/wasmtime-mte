;;! target = "x86_64"


(module
  (func $dummy3 (param i32 i32 i32))
  (func (export "as-call-last")
    (call $dummy3 (i32.const 1) (i32.const 2) (unreachable))
  )
)
;;    0:	 55                   	push	rbp
;;    1:	 4889e5               	mov	rbp, rsp
;;    4:	 4883ec18             	sub	rsp, 0x18
;;    8:	 897c2414             	mov	dword ptr [rsp + 0x14], edi
;;    c:	 89742410             	mov	dword ptr [rsp + 0x10], esi
;;   10:	 8954240c             	mov	dword ptr [rsp + 0xc], edx
;;   14:	 4c893424             	mov	qword ptr [rsp], r14
;;   18:	 4883c418             	add	rsp, 0x18
;;   1c:	 5d                   	pop	rbp
;;   1d:	 c3                   	ret	
;;
;;    0:	 55                   	push	rbp
;;    1:	 4889e5               	mov	rbp, rsp
;;    4:	 4883ec08             	sub	rsp, 8
;;    8:	 4c893424             	mov	qword ptr [rsp], r14
;;    c:	 0f0b                 	ud2	
;;    e:	 4883c408             	add	rsp, 8
;;   12:	 5d                   	pop	rbp
;;   13:	 c3                   	ret	
