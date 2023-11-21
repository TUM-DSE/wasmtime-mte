(module
  (type (;0;) (func (param i64 i64 i64) (result i64)))
  (type (;1;) (func (param i64 i64 i32) (result i64)))
  (type (;2;) (func (param i64 i64) (result i32)))
  (type (;3;) (func (param i32) (result i32)))
  (type (;4;) (func (param i32 i64) (result i32)))
  (type (;5;) (func (param i32 i64 i32 i64) (result i32)))
  (type (;6;) (func (param i32 i64 i64 i64) (result i32)))
  (type (;7;) (func (param i32)))
  (type (;8;) (func))
  (type (;9;) (func (param i64 i64) (result i64)))
  (type (;10;) (func (param i64) (result i64)))
  (type (;11;) (func (param i64)))
  (type (;12;) (func (param i64 i64)))
  (type (;13;) (func (result i32)))
  (type (;14;) (func (param i64) (result i32)))
  (type (;15;) (func (param i32 i64 i32) (result i64)))
  (type (;16;) (func (result i64)))
  (type (;17;) (func (param i64 i64 i64 i64) (result i64)))
  (type (;18;) (func (param i32) (result i64)))
  (type (;19;) (func (param i64 i32 i64) (result i64)))
  (type (;20;) (func (param i64 i32) (result i32)))
  (type (;21;) (func (param f64 i64) (result f64)))
  (type (;22;) (func (param i64 i64 i64) (result i32)))
  (type (;23;) (func (param i64 i64 i64 i64 i64) (result i32)))
  (type (;24;) (func (param i64 i32 i64)))
  (type (;25;) (func (param i64 i32 i32 i32 i32)))
  (type (;26;) (func (param i64 i64 i64 i64 i64)))
  (import "wasi_snapshot_preview1" "args_get" (func $__imported_wasi_snapshot_preview1_args_get (;0;) (type 2)))
  (import "wasi_snapshot_preview1" "args_sizes_get" (func $__imported_wasi_snapshot_preview1_args_sizes_get (;1;) (type 2)))
  (import "wasi_snapshot_preview1" "fd_close" (func $__imported_wasi_snapshot_preview1_fd_close (;2;) (type 3)))
  (import "wasi_snapshot_preview1" "fd_fdstat_get" (func $__imported_wasi_snapshot_preview1_fd_fdstat_get (;3;) (type 4)))
  (import "wasi_snapshot_preview1" "fd_seek" (func $__imported_wasi_snapshot_preview1_fd_seek (;4;) (type 5)))
  (import "wasi_snapshot_preview1" "fd_write" (func $__imported_wasi_snapshot_preview1_fd_write (;5;) (type 6)))
  (import "wasi_snapshot_preview1" "proc_exit" (func $__imported_wasi_snapshot_preview1_proc_exit (;6;) (type 7)))
  (func $__wasm_call_ctors (;7;) (type 8))
  (func $_start (;8;) (type 8)
    (local i32)
    block ;; label = @1
      block ;; label = @2
        i64.const 0
        i32.load offset=3840
        br_if 0 (;@2;)
        i64.const 0
        i32.const 1
        i32.store offset=3840
        call $__wasm_call_ctors
        call $__main_void
        local.set 0
        call $__wasm_call_dtors
        local.get 0
        br_if 1 (;@1;)
        return
      end
      unreachable
      unreachable
    end
    local.get 0
    call $__wasi_proc_exit
    unreachable
  )
  (func $__wasm_memsafety_aligned_alloc_for_mte (;9;) (type 9) (param i64 i64) (result i64)
    (local i64 i64)
    block ;; label = @1
      local.get 1
      i64.eqz
      i32.eqz
      br_if 0 (;@1;)
      i64.const 0
      return
    end
    i64.const 0
    local.set 2
    block ;; label = @1
      local.get 0
      i64.const 16
      local.get 0
      i64.const 16
      i64.gt_u
      select
      local.tee 0
      local.get 1
      local.get 0
      i64.add
      i64.const -1
      i64.add
      i64.const 0
      local.get 0
      i64.sub
      local.tee 3
      i64.and
      local.tee 1
      local.get 0
      i64.const 15
      i64.add
      local.get 3
      i64.and
      local.tee 0
      i64.add
      call $aligned_alloc
      local.tee 3
      i64.eqz
      br_if 0 (;@1;)
      local.get 3
      local.get 1
      i64.store
      local.get 3
      local.get 0
      i64.add
      local.tee 2
      i64.const -8
      i64.add
      local.get 0
      i64.store
      local.get 2
      local.get 1
      segment.new align=1
      local.set 2
    end
    local.get 2
  )
  (func $__wasm_memsafety_malloc (;10;) (type 10) (param i64) (result i64)
    i64.const 16
    local.get 0
    call $__wasm_memsafety_aligned_alloc_for_mte
  )
  (func $__wasm_memsafety_free (;11;) (type 11) (param i64)
    (local i64)
    block ;; label = @1
      local.get 0
      i64.eqz
      br_if 0 (;@1;)
      local.get 0
      local.get 0
      i64.const -1080863910568919041
      i64.and
      local.tee 1
      local.get 1
      i64.const -8
      i64.add
      i64.load
      i64.sub
      local.tee 1
      i64.load
      segment.free align=1
      local.get 1
      call $free
    end
  )
  (func $main (;12;) (type 4) (param i32 i64) (result i32)
    (local i64 i32 i32 i64)
    global.get $__stack_pointer
    i64.const 32
    i64.sub
    local.tee 2
    global.set $__stack_pointer
    block ;; label = @1
      block ;; label = @2
        local.get 0
        i32.const 3
        i32.gt_s
        br_if 0 (;@2;)
        local.get 2
        local.get 1
        i64.load
        i64.store
        i64.const 1078
        local.get 2
        call $printf
        drop
        i32.const 1
        local.set 0
        br 1 (;@1;)
      end
      local.get 1
      i64.load offset=8
      call $atoi
      local.set 0
      local.get 1
      i64.load offset=16
      call $atoi
      local.set 3
      local.get 1
      i64.load offset=24
      call $atoi
      local.set 4
      local.get 0
      i64.extend_i32_s
      i64.const 2
      i64.shl
      call $__wasm_memsafety_malloc
      local.tee 1
      local.get 3
      i64.extend_i32_s
      i64.const 2
      i64.shl
      i64.add
      local.tee 5
      local.get 4
      i32.store
      local.get 2
      local.get 5
      i32.load
      i32.store offset=16
      i64.const 1110
      local.get 2
      i64.const 16
      i64.add
      call $printf
      drop
      local.get 1
      call $__wasm_memsafety_free
      i32.const 0
      local.set 0
    end
    local.get 2
    i64.const 32
    i64.add
    global.set $__stack_pointer
    local.get 0
  )
  (func $malloc (;13;) (type 10) (param i64) (result i64)
    local.get 0
    call $dlmalloc
  )
  (func $dlmalloc (;14;) (type 10) (param i64) (result i64)
    (local i64 i64 i64 i64 i64 i64 i32 i32 i32 i64 i64 i64 i64)
    global.get $__stack_pointer
    i64.const 16
    i64.sub
    local.tee 1
    global.set $__stack_pointer
    block ;; label = @1
      i64.const 0
      i64.load offset=3888
      local.tee 2
      i64.const 0
      i64.ne
      br_if 0 (;@1;)
      block ;; label = @2
        block ;; label = @3
          i64.const 0
          i64.load offset=4784
          local.tee 3
          i64.eqz
          br_if 0 (;@3;)
          i64.const 0
          i64.load offset=4792
          local.set 4
          br 1 (;@2;)
        end
        i64.const 65536
        local.set 4
        i64.const 0
        i64.const 65536
        i64.store offset=4800
        i64.const 0
        i64.const -1
        i64.store offset=4808
        i64.const 0
        i64.const 65536
        i64.store offset=4792
        i64.const 0
        i64.const -1
        i64.store offset=4816
        i64.const 0
        i32.const 0
        i32.store offset=4824
        i64.const 0
        i32.const 0
        i32.store offset=4728
        i64.const 0
        local.get 1
        i64.const 8
        i64.add
        i64.const -16
        i64.and
        i64.const 1431655768
        i64.xor
        local.tee 3
        i64.store offset=4784
      end
      i64.const 0
      local.set 2
      i64.const 71504
      local.get 4
      i64.add
      i64.const -1
      i64.add
      i64.const 0
      local.get 4
      i64.sub
      i64.and
      i64.const 131072
      i64.const 131072
      i64.eqz
      select
      i64.const 71504
      i64.sub
      local.tee 5
      i64.const 129
      i64.lt_u
      br_if 0 (;@1;)
      i64.const 0
      local.set 4
      i64.const 0
      local.get 5
      i64.store offset=4744
      i64.const 0
      i64.const 71504
      i64.store offset=4736
      i64.const 0
      i64.const 71504
      i64.store offset=3872
      i64.const 0
      local.get 3
      i64.store offset=3912
      i64.const 0
      i64.const -1
      i64.store offset=3904
      loop ;; label = @2
        local.get 4
        i64.const 3960
        i64.add
        local.get 4
        i64.const 3936
        i64.add
        local.tee 3
        i64.store
        local.get 3
        local.get 4
        i64.const 3920
        i64.add
        local.tee 6
        i64.store
        local.get 4
        i64.const 3944
        i64.add
        local.get 6
        i64.store
        local.get 4
        i64.const 3976
        i64.add
        local.get 4
        i64.const 3952
        i64.add
        local.tee 6
        i64.store
        local.get 6
        local.get 3
        i64.store
        local.get 4
        i64.const 3992
        i64.add
        local.get 4
        i64.const 3968
        i64.add
        local.tee 3
        i64.store
        local.get 3
        local.get 6
        i64.store
        local.get 4
        i64.const 3984
        i64.add
        local.get 3
        i64.store
        local.get 4
        i64.const 64
        i64.add
        local.tee 4
        i64.const 512
        i64.ne
        br_if 0 (;@2;)
      end
      i64.const 71504
      i64.const 0
      i64.const -16
      i64.const 71504
      i64.sub
      i64.const 15
      i64.and
      i64.const 71504
      i64.const 16
      i64.add
      i64.const 15
      i64.and
      i64.eqz
      select
      local.tee 4
      i64.add
      local.tee 2
      local.get 5
      i64.const -80
      i64.add
      local.tee 3
      local.get 4
      i64.sub
      local.tee 4
      i64.const 1
      i64.or
      i64.store offset=8
      i64.const 0
      i64.const 0
      i64.load offset=4816
      i64.store offset=3896
      i64.const 0
      local.get 4
      i64.store offset=3864
      i64.const 0
      local.get 2
      i64.store offset=3888
      i64.const 71504
      local.get 3
      i64.add
      i64.const 80
      i64.store offset=8
    end
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            block ;; label = @5
              block ;; label = @6
                block ;; label = @7
                  block ;; label = @8
                    block ;; label = @9
                      block ;; label = @10
                        local.get 0
                        i64.const 232
                        i64.gt_u
                        br_if 0 (;@10;)
                        block ;; label = @11
                          i64.const 0
                          i32.load offset=3848
                          local.tee 7
                          i64.const 32
                          local.get 0
                          i64.const 23
                          i64.add
                          i64.const -16
                          i64.and
                          local.get 0
                          i64.const 23
                          i64.lt_u
                          select
                          local.tee 5
                          i64.const 3
                          i64.shr_u
                          i32.wrap_i64
                          local.tee 8
                          i32.shr_u
                          local.tee 9
                          i32.const 3
                          i32.and
                          i32.eqz
                          br_if 0 (;@11;)
                          block ;; label = @12
                            block ;; label = @13
                              local.get 9
                              i32.const 1
                              i32.and
                              local.get 8
                              i32.or
                              i32.const 1
                              i32.xor
                              local.tee 9
                              i32.const 1
                              i32.shl
                              i64.extend_i32_u
                              i64.const 3
                              i64.shl
                              local.tee 3
                              i64.const 3920
                              i64.add
                              local.tee 4
                              local.get 3
                              i64.const 3936
                              i64.add
                              i64.load
                              local.tee 3
                              i64.load offset=16
                              local.tee 6
                              i64.ne
                              br_if 0 (;@13;)
                              i64.const 0
                              local.get 7
                              i32.const -2
                              local.get 9
                              i32.rotl
                              i32.and
                              i32.store offset=3848
                              br 1 (;@12;)
                            end
                            local.get 4
                            local.get 6
                            i64.store offset=16
                            local.get 6
                            local.get 4
                            i64.store offset=24
                          end
                          local.get 3
                          i64.const 16
                          i64.add
                          local.set 4
                          local.get 3
                          local.get 9
                          i32.const 3
                          i32.shl
                          i64.extend_i32_u
                          local.tee 6
                          i64.const 3
                          i64.or
                          i64.store offset=8
                          local.get 3
                          local.get 6
                          i64.add
                          local.tee 3
                          local.get 3
                          i64.load offset=8
                          i64.const 1
                          i64.or
                          i64.store offset=8
                          br 10 (;@1;)
                        end
                        local.get 5
                        i64.const 0
                        i64.load offset=3856
                        local.tee 10
                        i64.le_u
                        br_if 1 (;@9;)
                        block ;; label = @11
                          local.get 9
                          i32.eqz
                          br_if 0 (;@11;)
                          block ;; label = @12
                            block ;; label = @13
                              local.get 9
                              local.get 8
                              i32.shl
                              i32.const 2
                              local.get 8
                              i32.shl
                              local.tee 9
                              i32.const 0
                              local.get 9
                              i32.sub
                              i32.or
                              i32.and
                              local.tee 9
                              i32.const 0
                              local.get 9
                              i32.sub
                              i32.and
                              i32.ctz
                              local.tee 9
                              i32.const 1
                              i32.shl
                              i64.extend_i32_u
                              i64.const 3
                              i64.shl
                              local.tee 3
                              i64.const 3920
                              i64.add
                              local.tee 4
                              local.get 3
                              i64.const 3936
                              i64.add
                              i64.load
                              local.tee 3
                              i64.load offset=16
                              local.tee 6
                              i64.ne
                              br_if 0 (;@13;)
                              i64.const 0
                              local.get 7
                              i32.const -2
                              local.get 9
                              i32.rotl
                              i32.and
                              local.tee 7
                              i32.store offset=3848
                              br 1 (;@12;)
                            end
                            local.get 4
                            local.get 6
                            i64.store offset=16
                            local.get 6
                            local.get 4
                            i64.store offset=24
                          end
                          local.get 3
                          i64.const 16
                          i64.add
                          local.set 4
                          block ;; label = @12
                            local.get 9
                            i32.const 3
                            i32.shl
                            i64.extend_i32_u
                            local.tee 6
                            local.get 5
                            i64.sub
                            local.tee 0
                            i64.const 31
                            i64.gt_u
                            br_if 0 (;@12;)
                            local.get 3
                            local.get 6
                            i64.const 3
                            i64.or
                            i64.store offset=8
                            local.get 3
                            local.get 6
                            i64.add
                            local.tee 3
                            local.get 3
                            i64.load offset=8
                            i64.const 1
                            i64.or
                            i64.store offset=8
                            br 11 (;@1;)
                          end
                          local.get 3
                          local.get 5
                          i64.const 3
                          i64.or
                          i64.store offset=8
                          local.get 3
                          local.get 6
                          i64.add
                          local.get 0
                          i64.store
                          local.get 3
                          local.get 5
                          i64.add
                          local.tee 5
                          local.get 0
                          i64.const 1
                          i64.or
                          i64.store offset=8
                          block ;; label = @12
                            local.get 10
                            i64.eqz
                            br_if 0 (;@12;)
                            local.get 10
                            i64.const 1
                            i64.shl
                            i64.const 34359738352
                            i64.and
                            i64.const 3920
                            i64.add
                            local.set 6
                            i64.const 0
                            i64.load offset=3880
                            local.set 3
                            block ;; label = @13
                              block ;; label = @14
                                local.get 7
                                i32.const 1
                                local.get 10
                                i64.const 3
                                i64.shr_u
                                i32.wrap_i64
                                i32.shl
                                local.tee 9
                                i32.and
                                br_if 0 (;@14;)
                                i64.const 0
                                local.get 7
                                local.get 9
                                i32.or
                                i32.store offset=3848
                                local.get 6
                                local.set 11
                                br 1 (;@13;)
                              end
                              local.get 6
                              i64.load offset=16
                              local.set 11
                            end
                            local.get 11
                            local.get 3
                            i64.store offset=24
                            local.get 6
                            local.get 3
                            i64.store offset=16
                            local.get 3
                            local.get 6
                            i64.store offset=24
                            local.get 3
                            local.get 11
                            i64.store offset=16
                          end
                          i64.const 0
                          local.get 5
                          i64.store offset=3880
                          i64.const 0
                          local.get 0
                          i64.store offset=3856
                          br 10 (;@1;)
                        end
                        i64.const 0
                        i32.load offset=3852
                        local.tee 8
                        i32.eqz
                        br_if 1 (;@9;)
                        local.get 8
                        i32.const 0
                        local.get 8
                        i32.sub
                        i32.and
                        i32.ctz
                        i64.extend_i32_u
                        i64.const 3
                        i64.shl
                        i64.const 4448
                        i64.add
                        i64.load
                        local.tee 0
                        i64.load offset=8
                        i64.const -8
                        i64.and
                        local.get 5
                        i64.sub
                        local.set 3
                        local.get 0
                        local.set 6
                        block ;; label = @11
                          loop ;; label = @12
                            block ;; label = @13
                              local.get 6
                              i64.load offset=32
                              local.tee 4
                              i64.const 0
                              i64.ne
                              br_if 0 (;@13;)
                              local.get 6
                              i64.const 40
                              i64.add
                              i64.load
                              local.tee 4
                              i64.eqz
                              br_if 2 (;@11;)
                            end
                            local.get 4
                            i64.load offset=8
                            i64.const -8
                            i64.and
                            local.get 5
                            i64.sub
                            local.tee 6
                            local.get 3
                            local.get 6
                            local.get 3
                            i64.lt_u
                            local.tee 9
                            select
                            local.set 3
                            local.get 4
                            local.get 0
                            local.get 9
                            select
                            local.set 0
                            local.get 4
                            local.set 6
                            br 0 (;@12;)
                          end
                        end
                        local.get 0
                        i64.load offset=48
                        local.set 2
                        block ;; label = @11
                          local.get 0
                          i64.load offset=24
                          local.tee 11
                          local.get 0
                          i64.eq
                          br_if 0 (;@11;)
                          local.get 0
                          i64.load offset=16
                          local.tee 4
                          i64.const 0
                          i64.load offset=3872
                          i64.lt_u
                          drop
                          local.get 11
                          local.get 4
                          i64.store offset=16
                          local.get 4
                          local.get 11
                          i64.store offset=24
                          br 9 (;@2;)
                        end
                        block ;; label = @11
                          local.get 0
                          i64.const 40
                          i64.add
                          local.tee 6
                          i64.load
                          local.tee 4
                          i64.const 0
                          i64.ne
                          br_if 0 (;@11;)
                          local.get 0
                          i64.load offset=32
                          local.tee 4
                          i64.eqz
                          br_if 3 (;@8;)
                          local.get 0
                          i64.const 32
                          i64.add
                          local.set 6
                        end
                        loop ;; label = @11
                          local.get 6
                          local.set 12
                          local.get 4
                          local.tee 11
                          i64.const 40
                          i64.add
                          local.tee 6
                          i64.load
                          local.tee 4
                          i64.const 0
                          i64.ne
                          br_if 0 (;@11;)
                          local.get 11
                          i64.const 32
                          i64.add
                          local.set 6
                          local.get 11
                          i64.load offset=32
                          local.tee 4
                          i64.const 0
                          i64.ne
                          br_if 0 (;@11;)
                        end
                        local.get 12
                        i64.const 0
                        i64.store
                        br 8 (;@2;)
                      end
                      i64.const -1
                      local.set 5
                      local.get 0
                      i64.const -129
                      i64.gt_u
                      br_if 0 (;@9;)
                      local.get 0
                      i64.const 23
                      i64.add
                      local.tee 4
                      i64.const -16
                      i64.and
                      local.set 5
                      i64.const 0
                      i32.load offset=3852
                      local.tee 8
                      i32.eqz
                      br_if 0 (;@9;)
                      block ;; label = @10
                        block ;; label = @11
                          local.get 4
                          i64.const 8
                          i64.shr_u
                          i32.wrap_i64
                          local.tee 7
                          br_if 0 (;@11;)
                          i32.const 0
                          local.set 9
                          br 1 (;@10;)
                        end
                        i32.const 31
                        local.set 9
                        local.get 7
                        i32.const 65535
                        i32.gt_u
                        br_if 0 (;@10;)
                        local.get 5
                        i32.const 38
                        local.get 7
                        i32.clz
                        local.tee 9
                        i32.sub
                        i64.extend_i32_u
                        i64.shr_u
                        i32.wrap_i64
                        i32.const 1
                        i32.and
                        local.get 9
                        i32.const 1
                        i32.shl
                        i32.or
                        i32.const 62
                        i32.xor
                        local.set 9
                      end
                      i64.const 0
                      local.get 5
                      i64.sub
                      local.set 3
                      block ;; label = @10
                        block ;; label = @11
                          block ;; label = @12
                            block ;; label = @13
                              local.get 9
                              i64.extend_i32_u
                              i64.const 3
                              i64.shl
                              i64.const 4448
                              i64.add
                              i64.load
                              local.tee 6
                              i64.eqz
                              i32.eqz
                              br_if 0 (;@13;)
                              i64.const 0
                              local.set 4
                              i64.const 0
                              local.set 0
                              br 1 (;@12;)
                            end
                            local.get 5
                            i64.const 0
                            i64.const 63
                            local.get 9
                            i32.const 1
                            i32.shr_u
                            i32.const 6
                            i32.add
                            i64.extend_i32_u
                            i64.sub
                            local.get 9
                            i32.const 31
                            i32.eq
                            select
                            i64.shl
                            local.set 11
                            i64.const 0
                            local.set 4
                            i64.const 0
                            local.set 0
                            loop ;; label = @13
                              block ;; label = @14
                                local.get 6
                                i64.load offset=8
                                i64.const -8
                                i64.and
                                local.get 5
                                i64.sub
                                local.tee 12
                                local.get 3
                                i64.ge_u
                                br_if 0 (;@14;)
                                local.get 12
                                local.set 3
                                local.get 6
                                local.set 0
                                local.get 12
                                i64.eqz
                                i32.eqz
                                br_if 0 (;@14;)
                                i64.const 0
                                local.set 3
                                local.get 6
                                local.set 0
                                local.get 6
                                local.set 4
                                br 3 (;@11;)
                              end
                              local.get 4
                              local.get 4
                              local.get 6
                              i64.const 40
                              i64.add
                              i64.load
                              local.tee 12
                              local.get 12
                              local.get 6
                              local.get 11
                              i64.const 60
                              i64.shr_u
                              i64.const 8
                              i64.and
                              i64.add
                              i64.const 32
                              i64.add
                              i64.load
                              local.tee 6
                              i64.eq
                              select
                              local.get 12
                              i64.eqz
                              select
                              local.set 4
                              local.get 11
                              i64.const 1
                              i64.shl
                              local.set 11
                              local.get 6
                              i64.const 0
                              i64.ne
                              br_if 0 (;@13;)
                            end
                          end
                          block ;; label = @12
                            local.get 4
                            local.get 0
                            i64.or
                            i64.const 0
                            i64.ne
                            br_if 0 (;@12;)
                            i32.const 2
                            local.get 9
                            i32.shl
                            local.tee 9
                            i32.const 0
                            local.get 9
                            i32.sub
                            i32.or
                            local.get 8
                            i32.and
                            local.tee 9
                            i32.eqz
                            br_if 3 (;@9;)
                            local.get 9
                            i32.const 0
                            local.get 9
                            i32.sub
                            i32.and
                            i32.ctz
                            i64.extend_i32_u
                            i64.const 3
                            i64.shl
                            i64.const 4448
                            i64.add
                            i64.load
                            local.set 4
                            i64.const 0
                            local.set 0
                          end
                          local.get 4
                          i64.eqz
                          br_if 1 (;@10;)
                        end
                        loop ;; label = @11
                          local.get 4
                          i64.load offset=8
                          i64.const -8
                          i64.and
                          local.get 5
                          i64.sub
                          local.tee 11
                          local.get 3
                          i64.lt_u
                          local.set 9
                          block ;; label = @12
                            local.get 4
                            i64.load offset=32
                            local.tee 6
                            i64.const 0
                            i64.ne
                            br_if 0 (;@12;)
                            local.get 4
                            i64.const 40
                            i64.add
                            i64.load
                            local.set 6
                          end
                          local.get 11
                          local.get 3
                          local.get 9
                          select
                          local.set 3
                          local.get 4
                          local.get 0
                          local.get 9
                          select
                          local.set 0
                          local.get 6
                          local.set 4
                          local.get 6
                          i64.const 0
                          i64.ne
                          br_if 0 (;@11;)
                        end
                      end
                      local.get 0
                      i64.eqz
                      br_if 0 (;@9;)
                      local.get 3
                      i64.const 0
                      i64.load offset=3856
                      local.get 5
                      i64.sub
                      i64.ge_u
                      br_if 0 (;@9;)
                      local.get 0
                      i64.load offset=48
                      local.set 2
                      block ;; label = @10
                        block ;; label = @11
                          local.get 0
                          i64.load offset=24
                          local.tee 11
                          local.get 0
                          i64.eq
                          br_if 0 (;@11;)
                          local.get 0
                          i64.load offset=16
                          local.tee 4
                          i64.const 0
                          i64.load offset=3872
                          i64.lt_u
                          drop
                          local.get 11
                          local.get 4
                          i64.store offset=16
                          local.get 4
                          local.get 11
                          i64.store offset=24
                          br 1 (;@10;)
                        end
                        block ;; label = @11
                          local.get 0
                          i64.const 40
                          i64.add
                          local.tee 6
                          i64.load
                          local.tee 4
                          i64.const 0
                          i64.ne
                          br_if 0 (;@11;)
                          block ;; label = @12
                            local.get 0
                            i64.load offset=32
                            local.tee 4
                            i64.eqz
                            i32.eqz
                            br_if 0 (;@12;)
                            i64.const 0
                            local.set 11
                            br 2 (;@10;)
                          end
                          local.get 0
                          i64.const 32
                          i64.add
                          local.set 6
                        end
                        loop ;; label = @11
                          local.get 6
                          local.set 12
                          local.get 4
                          local.tee 11
                          i64.const 40
                          i64.add
                          local.tee 6
                          i64.load
                          local.tee 4
                          i64.const 0
                          i64.ne
                          br_if 0 (;@11;)
                          local.get 11
                          i64.const 32
                          i64.add
                          local.set 6
                          local.get 11
                          i64.load offset=32
                          local.tee 4
                          i64.const 0
                          i64.ne
                          br_if 0 (;@11;)
                        end
                        local.get 12
                        i64.const 0
                        i64.store
                      end
                      block ;; label = @10
                        local.get 2
                        i64.eqz
                        br_if 0 (;@10;)
                        block ;; label = @11
                          block ;; label = @12
                            local.get 0
                            local.get 0
                            i32.load offset=56
                            local.tee 9
                            i64.extend_i32_u
                            i64.const 3
                            i64.shl
                            i64.const 4448
                            i64.add
                            local.tee 4
                            i64.load
                            i64.ne
                            br_if 0 (;@12;)
                            local.get 4
                            local.get 11
                            i64.store
                            local.get 11
                            i64.const 0
                            i64.ne
                            br_if 1 (;@11;)
                            i64.const 0
                            local.get 8
                            i32.const -2
                            local.get 9
                            i32.rotl
                            i32.and
                            i32.store offset=3852
                            br 2 (;@10;)
                          end
                          local.get 2
                          i64.const 32
                          i64.const 40
                          local.get 2
                          i64.load offset=32
                          local.get 0
                          i64.eq
                          select
                          i64.add
                          local.get 11
                          i64.store
                          local.get 11
                          i64.eqz
                          br_if 1 (;@10;)
                        end
                        local.get 11
                        local.get 2
                        i64.store offset=48
                        block ;; label = @11
                          local.get 0
                          i64.load offset=32
                          local.tee 4
                          i64.eqz
                          br_if 0 (;@11;)
                          local.get 11
                          local.get 4
                          i64.store offset=32
                          local.get 4
                          local.get 11
                          i64.store offset=48
                        end
                        local.get 0
                        i64.const 40
                        i64.add
                        i64.load
                        local.tee 4
                        i64.eqz
                        br_if 0 (;@10;)
                        local.get 11
                        i64.const 40
                        i64.add
                        local.get 4
                        i64.store
                        local.get 4
                        local.get 11
                        i64.store offset=48
                      end
                      block ;; label = @10
                        block ;; label = @11
                          local.get 3
                          i64.const 31
                          i64.gt_u
                          br_if 0 (;@11;)
                          local.get 0
                          local.get 3
                          local.get 5
                          i64.add
                          local.tee 4
                          i64.const 3
                          i64.or
                          i64.store offset=8
                          local.get 0
                          local.get 4
                          i64.add
                          local.tee 4
                          local.get 4
                          i64.load offset=8
                          i64.const 1
                          i64.or
                          i64.store offset=8
                          br 1 (;@10;)
                        end
                        local.get 0
                        local.get 5
                        i64.add
                        local.tee 11
                        local.get 3
                        i64.const 1
                        i64.or
                        i64.store offset=8
                        local.get 0
                        local.get 5
                        i64.const 3
                        i64.or
                        i64.store offset=8
                        local.get 11
                        local.get 3
                        i64.add
                        local.get 3
                        i64.store
                        block ;; label = @11
                          local.get 3
                          i64.const 255
                          i64.gt_u
                          br_if 0 (;@11;)
                          local.get 3
                          i64.const 1
                          i64.shl
                          i64.const 34359738352
                          i64.and
                          i64.const 3920
                          i64.add
                          local.set 4
                          block ;; label = @12
                            block ;; label = @13
                              i64.const 0
                              i32.load offset=3848
                              local.tee 9
                              i32.const 1
                              local.get 3
                              i64.const 3
                              i64.shr_u
                              i32.wrap_i64
                              i32.shl
                              local.tee 8
                              i32.and
                              br_if 0 (;@13;)
                              i64.const 0
                              local.get 9
                              local.get 8
                              i32.or
                              i32.store offset=3848
                              local.get 4
                              local.set 3
                              br 1 (;@12;)
                            end
                            local.get 4
                            i64.load offset=16
                            local.set 3
                          end
                          local.get 3
                          local.get 11
                          i64.store offset=24
                          local.get 4
                          local.get 11
                          i64.store offset=16
                          local.get 11
                          local.get 4
                          i64.store offset=24
                          local.get 11
                          local.get 3
                          i64.store offset=16
                          br 1 (;@10;)
                        end
                        block ;; label = @11
                          block ;; label = @12
                            local.get 3
                            i64.const 8
                            i64.shr_u
                            i32.wrap_i64
                            local.tee 8
                            br_if 0 (;@12;)
                            i32.const 0
                            local.set 9
                            br 1 (;@11;)
                          end
                          i32.const 31
                          local.set 9
                          local.get 8
                          i32.const 65535
                          i32.gt_u
                          br_if 0 (;@11;)
                          local.get 3
                          i32.const 38
                          local.get 8
                          i32.clz
                          local.tee 9
                          i32.sub
                          i64.extend_i32_u
                          i64.shr_u
                          i32.wrap_i64
                          i32.const 1
                          i32.and
                          local.get 9
                          i32.const 1
                          i32.shl
                          i32.or
                          i32.const 62
                          i32.xor
                          local.set 9
                        end
                        local.get 11
                        i64.const 0
                        i64.store offset=32
                        local.get 11
                        i64.const 40
                        i64.add
                        i64.const 0
                        i64.store
                        local.get 11
                        local.get 9
                        i32.store offset=56
                        local.get 9
                        i64.extend_i32_u
                        i64.const 3
                        i64.shl
                        i64.const 4448
                        i64.add
                        local.set 6
                        block ;; label = @11
                          i64.const 0
                          i32.load offset=3852
                          local.tee 8
                          i32.const 1
                          local.get 9
                          i32.shl
                          local.tee 7
                          i32.and
                          br_if 0 (;@11;)
                          local.get 6
                          local.get 11
                          i64.store
                          i64.const 0
                          local.get 8
                          local.get 7
                          i32.or
                          i32.store offset=3852
                          local.get 11
                          local.get 6
                          i64.store offset=48
                          local.get 11
                          local.get 11
                          i64.store offset=16
                          local.get 11
                          local.get 11
                          i64.store offset=24
                          br 1 (;@10;)
                        end
                        local.get 3
                        i64.const 0
                        i64.const 63
                        local.get 9
                        i32.const 1
                        i32.shr_u
                        i32.const 6
                        i32.add
                        i64.extend_i32_u
                        i64.sub
                        local.get 9
                        i32.const 31
                        i32.eq
                        select
                        i64.shl
                        local.set 4
                        local.get 6
                        i64.load
                        local.set 5
                        block ;; label = @11
                          loop ;; label = @12
                            local.get 5
                            local.tee 6
                            i64.load offset=8
                            i64.const -8
                            i64.and
                            local.get 3
                            i64.eq
                            br_if 1 (;@11;)
                            local.get 4
                            i64.const 60
                            i64.shr_u
                            local.set 5
                            local.get 4
                            i64.const 1
                            i64.shl
                            local.set 4
                            local.get 6
                            local.get 5
                            i64.const 8
                            i64.and
                            i64.add
                            i64.const 32
                            i64.add
                            local.tee 12
                            i64.load
                            local.tee 5
                            i64.const 0
                            i64.ne
                            br_if 0 (;@12;)
                          end
                          local.get 12
                          local.get 11
                          i64.store
                          local.get 11
                          local.get 6
                          i64.store offset=48
                          local.get 11
                          local.get 11
                          i64.store offset=24
                          local.get 11
                          local.get 11
                          i64.store offset=16
                          br 1 (;@10;)
                        end
                        local.get 6
                        i64.load offset=16
                        local.tee 4
                        local.get 11
                        i64.store offset=24
                        local.get 6
                        local.get 11
                        i64.store offset=16
                        local.get 11
                        i64.const 0
                        i64.store offset=48
                        local.get 11
                        local.get 6
                        i64.store offset=24
                        local.get 11
                        local.get 4
                        i64.store offset=16
                      end
                      local.get 0
                      i64.const 16
                      i64.add
                      local.set 4
                      br 8 (;@1;)
                    end
                    block ;; label = @9
                      i64.const 0
                      i64.load offset=3856
                      local.tee 4
                      local.get 5
                      i64.lt_u
                      br_if 0 (;@9;)
                      i64.const 0
                      i64.load offset=3880
                      local.set 3
                      block ;; label = @10
                        block ;; label = @11
                          local.get 4
                          local.get 5
                          i64.sub
                          local.tee 6
                          i64.const 32
                          i64.lt_u
                          br_if 0 (;@11;)
                          local.get 3
                          local.get 5
                          i64.add
                          local.tee 0
                          local.get 6
                          i64.const 1
                          i64.or
                          i64.store offset=8
                          local.get 3
                          local.get 4
                          i64.add
                          local.get 6
                          i64.store
                          local.get 3
                          local.get 5
                          i64.const 3
                          i64.or
                          i64.store offset=8
                          br 1 (;@10;)
                        end
                        local.get 3
                        local.get 4
                        i64.const 3
                        i64.or
                        i64.store offset=8
                        local.get 3
                        local.get 4
                        i64.add
                        local.tee 4
                        local.get 4
                        i64.load offset=8
                        i64.const 1
                        i64.or
                        i64.store offset=8
                        i64.const 0
                        local.set 0
                        i64.const 0
                        local.set 6
                      end
                      i64.const 0
                      local.get 6
                      i64.store offset=3856
                      i64.const 0
                      local.get 0
                      i64.store offset=3880
                      local.get 3
                      i64.const 16
                      i64.add
                      local.set 4
                      br 8 (;@1;)
                    end
                    block ;; label = @9
                      i64.const 0
                      i64.load offset=3864
                      local.tee 6
                      local.get 5
                      i64.le_u
                      br_if 0 (;@9;)
                      local.get 2
                      local.get 5
                      i64.add
                      local.tee 4
                      local.get 6
                      local.get 5
                      i64.sub
                      local.tee 3
                      i64.const 1
                      i64.or
                      i64.store offset=8
                      i64.const 0
                      local.get 4
                      i64.store offset=3888
                      i64.const 0
                      local.get 3
                      i64.store offset=3864
                      local.get 2
                      local.get 5
                      i64.const 3
                      i64.or
                      i64.store offset=8
                      local.get 2
                      i64.const 16
                      i64.add
                      local.set 4
                      br 8 (;@1;)
                    end
                    block ;; label = @9
                      block ;; label = @10
                        i64.const 0
                        i64.load offset=4784
                        i64.eqz
                        br_if 0 (;@10;)
                        i64.const 0
                        i64.load offset=4800
                        local.set 3
                        br 1 (;@9;)
                      end
                      i64.const 65536
                      local.set 3
                      i64.const 0
                      i64.const 65536
                      i64.store offset=4800
                      i64.const 0
                      i64.const -1
                      i64.store offset=4808
                      i64.const 0
                      i64.const 65536
                      i64.store offset=4792
                      i64.const 0
                      i64.const -1
                      i64.store offset=4816
                      i64.const 0
                      i32.const 0
                      i32.store offset=4824
                      i64.const 0
                      i32.const 0
                      i32.store offset=4728
                      i64.const 0
                      local.get 1
                      i64.const 8
                      i64.add
                      i64.const -16
                      i64.and
                      i64.const 1431655768
                      i64.xor
                      i64.store offset=4784
                    end
                    i64.const 0
                    local.set 4
                    block ;; label = @9
                      local.get 3
                      local.get 5
                      i64.const 95
                      i64.add
                      local.tee 10
                      i64.add
                      local.tee 0
                      i64.const 0
                      local.get 3
                      i64.sub
                      local.tee 12
                      i64.and
                      local.tee 11
                      local.get 5
                      i64.gt_u
                      br_if 0 (;@9;)
                      i64.const 0
                      i32.const 48
                      i32.store offset=4832
                      br 8 (;@1;)
                    end
                    block ;; label = @9
                      i64.const 0
                      i64.load offset=4720
                      local.tee 4
                      i64.eqz
                      br_if 0 (;@9;)
                      block ;; label = @10
                        i64.const 0
                        i64.load offset=4704
                        local.tee 3
                        local.get 11
                        i64.add
                        local.tee 13
                        local.get 3
                        i64.le_u
                        br_if 0 (;@10;)
                        local.get 13
                        local.get 4
                        i64.le_u
                        br_if 1 (;@9;)
                      end
                      i64.const 0
                      local.set 4
                      i64.const 0
                      i32.const 48
                      i32.store offset=4832
                      br 8 (;@1;)
                    end
                    i64.const 0
                    i32.load8_u offset=4728
                    i32.const 4
                    i32.and
                    br_if 3 (;@5;)
                    block ;; label = @9
                      block ;; label = @10
                        block ;; label = @11
                          local.get 2
                          i64.eqz
                          br_if 0 (;@11;)
                          i64.const 4736
                          local.set 4
                          loop ;; label = @12
                            block ;; label = @13
                              local.get 4
                              i64.load
                              local.tee 3
                              local.get 2
                              i64.gt_u
                              br_if 0 (;@13;)
                              local.get 3
                              local.get 4
                              i64.load offset=8
                              i64.add
                              local.get 2
                              i64.gt_u
                              br_if 3 (;@10;)
                            end
                            local.get 4
                            i64.load offset=16
                            local.tee 4
                            i64.const 0
                            i64.ne
                            br_if 0 (;@12;)
                          end
                        end
                        i64.const 0
                        call $sbrk
                        local.tee 0
                        i64.const -1
                        i64.eq
                        br_if 4 (;@6;)
                        local.get 11
                        local.set 12
                        block ;; label = @11
                          i64.const 0
                          i64.load offset=4792
                          local.tee 4
                          i64.const -1
                          i64.add
                          local.tee 3
                          local.get 0
                          i64.and
                          i64.eqz
                          br_if 0 (;@11;)
                          local.get 11
                          local.get 0
                          i64.sub
                          local.get 3
                          local.get 0
                          i64.add
                          i64.const 0
                          local.get 4
                          i64.sub
                          i64.and
                          i64.add
                          local.set 12
                        end
                        local.get 12
                        local.get 5
                        i64.le_u
                        br_if 4 (;@6;)
                        local.get 12
                        i64.const 9223372036854775806
                        i64.gt_u
                        br_if 4 (;@6;)
                        block ;; label = @11
                          i64.const 0
                          i64.load offset=4720
                          local.tee 4
                          i64.eqz
                          br_if 0 (;@11;)
                          i64.const 0
                          i64.load offset=4704
                          local.tee 3
                          local.get 12
                          i64.add
                          local.tee 6
                          local.get 3
                          i64.le_u
                          br_if 5 (;@6;)
                          local.get 6
                          local.get 4
                          i64.gt_u
                          br_if 5 (;@6;)
                        end
                        local.get 12
                        call $sbrk
                        local.tee 4
                        local.get 0
                        i64.ne
                        br_if 1 (;@9;)
                        br 6 (;@4;)
                      end
                      local.get 0
                      local.get 6
                      i64.sub
                      local.get 12
                      i64.and
                      local.tee 12
                      i64.const 9223372036854775806
                      i64.gt_u
                      br_if 3 (;@6;)
                      local.get 12
                      call $sbrk
                      local.tee 0
                      local.get 4
                      i64.load
                      local.get 4
                      i64.load offset=8
                      i64.add
                      i64.eq
                      br_if 2 (;@7;)
                      local.get 0
                      local.set 4
                    end
                    block ;; label = @9
                      local.get 4
                      i64.const -1
                      i64.eq
                      br_if 0 (;@9;)
                      local.get 5
                      i64.const 96
                      i64.add
                      local.get 12
                      i64.le_u
                      br_if 0 (;@9;)
                      block ;; label = @10
                        local.get 10
                        local.get 12
                        i64.sub
                        i64.const 0
                        i64.load offset=4800
                        local.tee 3
                        i64.add
                        i64.const 0
                        local.get 3
                        i64.sub
                        i64.and
                        local.tee 3
                        i64.const 9223372036854775806
                        i64.le_u
                        br_if 0 (;@10;)
                        local.get 4
                        local.set 0
                        br 6 (;@4;)
                      end
                      block ;; label = @10
                        local.get 3
                        call $sbrk
                        i64.const -1
                        i64.eq
                        br_if 0 (;@10;)
                        local.get 3
                        local.get 12
                        i64.add
                        local.set 12
                        local.get 4
                        local.set 0
                        br 6 (;@4;)
                      end
                      i64.const 0
                      local.get 12
                      i64.sub
                      call $sbrk
                      drop
                      br 3 (;@6;)
                    end
                    local.get 4
                    local.set 0
                    local.get 4
                    i64.const -1
                    i64.ne
                    br_if 4 (;@4;)
                    br 2 (;@6;)
                  end
                  i64.const 0
                  local.set 11
                  br 5 (;@2;)
                end
                local.get 0
                i64.const -1
                i64.ne
                br_if 2 (;@4;)
              end
              i64.const 0
              i64.const 0
              i32.load offset=4728
              i32.const 4
              i32.or
              i32.store offset=4728
            end
            local.get 11
            i64.const 9223372036854775806
            i64.gt_u
            br_if 1 (;@3;)
            local.get 11
            call $sbrk
            local.set 0
            i64.const 0
            call $sbrk
            local.set 4
            local.get 0
            i64.const -1
            i64.eq
            br_if 1 (;@3;)
            local.get 4
            i64.const -1
            i64.eq
            br_if 1 (;@3;)
            local.get 0
            local.get 4
            i64.ge_u
            br_if 1 (;@3;)
            local.get 4
            local.get 0
            i64.sub
            local.tee 12
            local.get 5
            i64.const 80
            i64.add
            i64.le_u
            br_if 1 (;@3;)
          end
          i64.const 0
          i64.const 0
          i64.load offset=4704
          local.get 12
          i64.add
          local.tee 4
          i64.store offset=4704
          block ;; label = @4
            local.get 4
            i64.const 0
            i64.load offset=4712
            i64.le_u
            br_if 0 (;@4;)
            i64.const 0
            local.get 4
            i64.store offset=4712
          end
          block ;; label = @4
            block ;; label = @5
              block ;; label = @6
                block ;; label = @7
                  i64.const 0
                  i64.load offset=3888
                  local.tee 3
                  i64.eqz
                  br_if 0 (;@7;)
                  i64.const 4736
                  local.set 4
                  loop ;; label = @8
                    local.get 0
                    local.get 4
                    i64.load
                    local.tee 6
                    local.get 4
                    i64.load offset=8
                    local.tee 11
                    i64.add
                    i64.eq
                    br_if 2 (;@6;)
                    local.get 4
                    i64.load offset=16
                    local.tee 4
                    i64.eqz
                    i32.eqz
                    br_if 0 (;@8;)
                    br 3 (;@5;)
                  end
                end
                block ;; label = @7
                  block ;; label = @8
                    i64.const 0
                    i64.load offset=3872
                    local.tee 4
                    i64.eqz
                    br_if 0 (;@8;)
                    local.get 0
                    local.get 4
                    i64.ge_u
                    br_if 1 (;@7;)
                  end
                  i64.const 0
                  local.get 0
                  i64.store offset=3872
                end
                i64.const 0
                local.set 4
                i64.const 0
                i32.const 0
                i32.store offset=4760
                i64.const 0
                local.get 12
                i64.store offset=4744
                i64.const 0
                local.get 0
                i64.store offset=4736
                i64.const 0
                i64.const -1
                i64.store offset=3904
                i64.const 0
                i64.const 0
                i64.load offset=4784
                i64.store offset=3912
                loop ;; label = @7
                  local.get 4
                  i64.const 3960
                  i64.add
                  local.get 4
                  i64.const 3936
                  i64.add
                  local.tee 3
                  i64.store
                  local.get 3
                  local.get 4
                  i64.const 3920
                  i64.add
                  local.tee 6
                  i64.store
                  local.get 4
                  i64.const 3944
                  i64.add
                  local.get 6
                  i64.store
                  local.get 4
                  i64.const 3976
                  i64.add
                  local.get 4
                  i64.const 3952
                  i64.add
                  local.tee 6
                  i64.store
                  local.get 6
                  local.get 3
                  i64.store
                  local.get 4
                  i64.const 3992
                  i64.add
                  local.get 4
                  i64.const 3968
                  i64.add
                  local.tee 3
                  i64.store
                  local.get 3
                  local.get 6
                  i64.store
                  local.get 4
                  i64.const 3984
                  i64.add
                  local.get 3
                  i64.store
                  local.get 4
                  i64.const 64
                  i64.add
                  local.tee 4
                  i64.const 512
                  i64.ne
                  br_if 0 (;@7;)
                end
                local.get 0
                i64.const 0
                i64.const -16
                local.get 0
                i64.sub
                i64.const 15
                i64.and
                local.get 0
                i64.const 16
                i64.add
                i64.const 15
                i64.and
                i64.eqz
                select
                local.tee 4
                i64.add
                local.tee 3
                local.get 12
                i64.const -80
                i64.add
                local.tee 6
                local.get 4
                i64.sub
                local.tee 4
                i64.const 1
                i64.or
                i64.store offset=8
                i64.const 0
                i64.const 0
                i64.load offset=4816
                i64.store offset=3896
                i64.const 0
                local.get 4
                i64.store offset=3864
                i64.const 0
                local.get 3
                i64.store offset=3888
                local.get 0
                local.get 6
                i64.add
                i64.const 80
                i64.store offset=8
                br 2 (;@4;)
              end
              local.get 4
              i32.load8_u offset=24
              i32.const 8
              i32.and
              br_if 0 (;@5;)
              local.get 3
              local.get 6
              i64.lt_u
              br_if 0 (;@5;)
              local.get 3
              local.get 0
              i64.ge_u
              br_if 0 (;@5;)
              local.get 3
              i64.const 0
              i64.const -16
              local.get 3
              i64.sub
              i64.const 15
              i64.and
              local.get 3
              i64.const 16
              i64.add
              i64.const 15
              i64.and
              i64.eqz
              select
              local.tee 6
              i64.add
              local.tee 0
              i64.const 0
              i64.load offset=3864
              local.get 12
              i64.add
              local.tee 2
              local.get 6
              i64.sub
              local.tee 6
              i64.const 1
              i64.or
              i64.store offset=8
              local.get 4
              local.get 11
              local.get 12
              i64.add
              i64.store offset=8
              i64.const 0
              i64.const 0
              i64.load offset=4816
              i64.store offset=3896
              i64.const 0
              local.get 6
              i64.store offset=3864
              i64.const 0
              local.get 0
              i64.store offset=3888
              local.get 3
              local.get 2
              i64.add
              i64.const 80
              i64.store offset=8
              br 1 (;@4;)
            end
            block ;; label = @5
              local.get 0
              i64.const 0
              i64.load offset=3872
              local.tee 11
              i64.ge_u
              br_if 0 (;@5;)
              i64.const 0
              local.get 0
              i64.store offset=3872
              local.get 0
              local.set 11
            end
            local.get 0
            local.get 12
            i64.add
            local.set 6
            i64.const 4736
            local.set 4
            block ;; label = @5
              block ;; label = @6
                block ;; label = @7
                  block ;; label = @8
                    block ;; label = @9
                      block ;; label = @10
                        block ;; label = @11
                          loop ;; label = @12
                            local.get 4
                            i64.load
                            local.get 6
                            i64.eq
                            br_if 1 (;@11;)
                            local.get 4
                            i64.load offset=16
                            local.tee 4
                            i64.eqz
                            i32.eqz
                            br_if 0 (;@12;)
                            br 2 (;@10;)
                          end
                        end
                        local.get 4
                        i32.load8_u offset=24
                        i32.const 8
                        i32.and
                        i32.eqz
                        br_if 1 (;@9;)
                      end
                      i64.const 4736
                      local.set 4
                      loop ;; label = @10
                        block ;; label = @11
                          local.get 4
                          i64.load
                          local.tee 6
                          local.get 3
                          i64.gt_u
                          br_if 0 (;@11;)
                          local.get 6
                          local.get 4
                          i64.load offset=8
                          i64.add
                          local.tee 6
                          local.get 3
                          i64.gt_u
                          br_if 3 (;@8;)
                        end
                        local.get 4
                        i64.load offset=16
                        local.set 4
                        br 0 (;@10;)
                      end
                    end
                    local.get 4
                    local.get 0
                    i64.store
                    local.get 4
                    local.get 4
                    i64.load offset=8
                    local.get 12
                    i64.add
                    i64.store offset=8
                    local.get 0
                    i64.const 0
                    i64.const -16
                    local.get 0
                    i64.sub
                    i64.const 15
                    i64.and
                    local.get 0
                    i64.const 16
                    i64.add
                    i64.const 15
                    i64.and
                    i64.eqz
                    select
                    i64.add
                    local.tee 2
                    local.get 5
                    i64.const 3
                    i64.or
                    i64.store offset=8
                    local.get 6
                    i64.const 0
                    i64.const -16
                    local.get 6
                    i64.sub
                    i64.const 15
                    i64.and
                    local.get 6
                    i64.const 16
                    i64.add
                    i64.const 15
                    i64.and
                    i64.eqz
                    select
                    i64.add
                    local.tee 12
                    local.get 2
                    local.get 5
                    i64.add
                    local.tee 5
                    i64.sub
                    local.set 6
                    block ;; label = @9
                      local.get 12
                      local.get 3
                      i64.ne
                      br_if 0 (;@9;)
                      i64.const 0
                      local.get 5
                      i64.store offset=3888
                      i64.const 0
                      i64.const 0
                      i64.load offset=3864
                      local.get 6
                      i64.add
                      local.tee 4
                      i64.store offset=3864
                      local.get 5
                      local.get 4
                      i64.const 1
                      i64.or
                      i64.store offset=8
                      br 3 (;@6;)
                    end
                    block ;; label = @9
                      local.get 12
                      i64.const 0
                      i64.load offset=3880
                      i64.ne
                      br_if 0 (;@9;)
                      i64.const 0
                      local.get 5
                      i64.store offset=3880
                      i64.const 0
                      i64.const 0
                      i64.load offset=3856
                      local.get 6
                      i64.add
                      local.tee 4
                      i64.store offset=3856
                      local.get 5
                      local.get 4
                      i64.const 1
                      i64.or
                      i64.store offset=8
                      local.get 5
                      local.get 4
                      i64.add
                      local.get 4
                      i64.store
                      br 3 (;@6;)
                    end
                    block ;; label = @9
                      local.get 12
                      i64.load offset=8
                      local.tee 4
                      i64.const 3
                      i64.and
                      i64.const 1
                      i64.ne
                      br_if 0 (;@9;)
                      local.get 4
                      i64.const -8
                      i64.and
                      local.set 10
                      block ;; label = @10
                        block ;; label = @11
                          local.get 4
                          i64.const 255
                          i64.gt_u
                          br_if 0 (;@11;)
                          local.get 12
                          i64.load offset=16
                          local.tee 3
                          local.get 4
                          i64.const 1
                          i64.shl
                          i64.const 34359738352
                          i64.and
                          i64.const 3920
                          i64.add
                          local.tee 11
                          i64.eq
                          drop
                          block ;; label = @12
                            local.get 12
                            i64.load offset=24
                            local.tee 0
                            local.get 3
                            i64.ne
                            br_if 0 (;@12;)
                            i64.const 0
                            i64.const 0
                            i32.load offset=3848
                            i32.const -2
                            local.get 4
                            i64.const 3
                            i64.shr_u
                            i32.wrap_i64
                            i32.rotl
                            i32.and
                            i32.store offset=3848
                            br 2 (;@10;)
                          end
                          local.get 0
                          local.get 11
                          i64.eq
                          drop
                          local.get 0
                          local.get 3
                          i64.store offset=16
                          local.get 3
                          local.get 0
                          i64.store offset=24
                          br 1 (;@10;)
                        end
                        local.get 12
                        i64.load offset=48
                        local.set 13
                        block ;; label = @11
                          block ;; label = @12
                            local.get 12
                            i64.load offset=24
                            local.tee 0
                            local.get 12
                            i64.eq
                            br_if 0 (;@12;)
                            local.get 12
                            i64.load offset=16
                            local.tee 4
                            local.get 11
                            i64.lt_u
                            drop
                            local.get 0
                            local.get 4
                            i64.store offset=16
                            local.get 4
                            local.get 0
                            i64.store offset=24
                            br 1 (;@11;)
                          end
                          block ;; label = @12
                            local.get 12
                            i64.const 40
                            i64.add
                            local.tee 4
                            i64.load
                            local.tee 3
                            i64.const 0
                            i64.ne
                            br_if 0 (;@12;)
                            local.get 12
                            i64.const 32
                            i64.add
                            local.tee 4
                            i64.load
                            local.tee 3
                            i64.eqz
                            i32.eqz
                            br_if 0 (;@12;)
                            i64.const 0
                            local.set 0
                            br 1 (;@11;)
                          end
                          loop ;; label = @12
                            local.get 4
                            local.set 11
                            local.get 3
                            local.tee 0
                            i64.const 40
                            i64.add
                            local.tee 4
                            i64.load
                            local.tee 3
                            i64.const 0
                            i64.ne
                            br_if 0 (;@12;)
                            local.get 0
                            i64.const 32
                            i64.add
                            local.set 4
                            local.get 0
                            i64.load offset=32
                            local.tee 3
                            i64.const 0
                            i64.ne
                            br_if 0 (;@12;)
                          end
                          local.get 11
                          i64.const 0
                          i64.store
                        end
                        local.get 13
                        i64.eqz
                        br_if 0 (;@10;)
                        block ;; label = @11
                          block ;; label = @12
                            local.get 12
                            local.get 12
                            i32.load offset=56
                            local.tee 9
                            i64.extend_i32_u
                            i64.const 3
                            i64.shl
                            i64.const 4448
                            i64.add
                            local.tee 4
                            i64.load
                            i64.ne
                            br_if 0 (;@12;)
                            local.get 4
                            local.get 0
                            i64.store
                            local.get 0
                            i64.const 0
                            i64.ne
                            br_if 1 (;@11;)
                            i64.const 0
                            i64.const 0
                            i32.load offset=3852
                            i32.const -2
                            local.get 9
                            i32.rotl
                            i32.and
                            i32.store offset=3852
                            br 2 (;@10;)
                          end
                          local.get 13
                          i64.const 32
                          i64.const 40
                          local.get 13
                          i64.load offset=32
                          local.get 12
                          i64.eq
                          select
                          i64.add
                          local.get 0
                          i64.store
                          local.get 0
                          i64.eqz
                          br_if 1 (;@10;)
                        end
                        local.get 0
                        local.get 13
                        i64.store offset=48
                        block ;; label = @11
                          local.get 12
                          i64.load offset=32
                          local.tee 4
                          i64.eqz
                          br_if 0 (;@11;)
                          local.get 0
                          local.get 4
                          i64.store offset=32
                          local.get 4
                          local.get 0
                          i64.store offset=48
                        end
                        local.get 12
                        i64.load offset=40
                        local.tee 4
                        i64.eqz
                        br_if 0 (;@10;)
                        local.get 0
                        i64.const 40
                        i64.add
                        local.get 4
                        i64.store
                        local.get 4
                        local.get 0
                        i64.store offset=48
                      end
                      local.get 10
                      local.get 6
                      i64.add
                      local.set 6
                      local.get 12
                      local.get 10
                      i64.add
                      local.tee 12
                      i64.load offset=8
                      local.set 4
                    end
                    local.get 12
                    local.get 4
                    i64.const -2
                    i64.and
                    i64.store offset=8
                    local.get 5
                    local.get 6
                    i64.add
                    local.get 6
                    i64.store
                    local.get 5
                    local.get 6
                    i64.const 1
                    i64.or
                    i64.store offset=8
                    block ;; label = @9
                      local.get 6
                      i64.const 255
                      i64.gt_u
                      br_if 0 (;@9;)
                      local.get 6
                      i64.const 1
                      i64.shl
                      i64.const 34359738352
                      i64.and
                      i64.const 3920
                      i64.add
                      local.set 4
                      block ;; label = @10
                        block ;; label = @11
                          i64.const 0
                          i32.load offset=3848
                          local.tee 9
                          i32.const 1
                          local.get 6
                          i64.const 3
                          i64.shr_u
                          i32.wrap_i64
                          i32.shl
                          local.tee 8
                          i32.and
                          br_if 0 (;@11;)
                          i64.const 0
                          local.get 9
                          local.get 8
                          i32.or
                          i32.store offset=3848
                          local.get 4
                          local.set 3
                          br 1 (;@10;)
                        end
                        local.get 4
                        i64.load offset=16
                        local.set 3
                      end
                      local.get 3
                      local.get 5
                      i64.store offset=24
                      local.get 4
                      local.get 5
                      i64.store offset=16
                      local.get 5
                      local.get 4
                      i64.store offset=24
                      local.get 5
                      local.get 3
                      i64.store offset=16
                      br 3 (;@6;)
                    end
                    block ;; label = @9
                      block ;; label = @10
                        local.get 6
                        i64.const 8
                        i64.shr_u
                        i32.wrap_i64
                        local.tee 8
                        br_if 0 (;@10;)
                        i32.const 0
                        local.set 9
                        br 1 (;@9;)
                      end
                      i32.const 31
                      local.set 9
                      local.get 8
                      i32.const 65535
                      i32.gt_u
                      br_if 0 (;@9;)
                      local.get 6
                      i32.const 38
                      local.get 8
                      i32.clz
                      local.tee 9
                      i32.sub
                      i64.extend_i32_u
                      i64.shr_u
                      i32.wrap_i64
                      i32.const 1
                      i32.and
                      local.get 9
                      i32.const 1
                      i32.shl
                      i32.or
                      i32.const 62
                      i32.xor
                      local.set 9
                    end
                    local.get 5
                    i64.const 0
                    i64.store offset=32
                    local.get 5
                    i64.const 40
                    i64.add
                    i64.const 0
                    i64.store
                    local.get 5
                    local.get 9
                    i32.store offset=56
                    local.get 9
                    i64.extend_i32_u
                    i64.const 3
                    i64.shl
                    i64.const 4448
                    i64.add
                    local.set 3
                    block ;; label = @9
                      i64.const 0
                      i32.load offset=3852
                      local.tee 8
                      i32.const 1
                      local.get 9
                      i32.shl
                      local.tee 7
                      i32.and
                      br_if 0 (;@9;)
                      local.get 3
                      local.get 5
                      i64.store
                      i64.const 0
                      local.get 8
                      local.get 7
                      i32.or
                      i32.store offset=3852
                      local.get 5
                      local.get 3
                      i64.store offset=48
                      local.get 5
                      local.get 5
                      i64.store offset=16
                      local.get 5
                      local.get 5
                      i64.store offset=24
                      br 3 (;@6;)
                    end
                    local.get 6
                    i64.const 0
                    i64.const 63
                    local.get 9
                    i32.const 1
                    i32.shr_u
                    i32.const 6
                    i32.add
                    i64.extend_i32_u
                    i64.sub
                    local.get 9
                    i32.const 31
                    i32.eq
                    select
                    i64.shl
                    local.set 4
                    local.get 3
                    i64.load
                    local.set 0
                    loop ;; label = @9
                      local.get 0
                      local.tee 3
                      i64.load offset=8
                      i64.const -8
                      i64.and
                      local.get 6
                      i64.eq
                      br_if 2 (;@7;)
                      local.get 4
                      i64.const 60
                      i64.shr_u
                      local.set 0
                      local.get 4
                      i64.const 1
                      i64.shl
                      local.set 4
                      local.get 3
                      local.get 0
                      i64.const 8
                      i64.and
                      i64.add
                      i64.const 32
                      i64.add
                      local.tee 11
                      i64.load
                      local.tee 0
                      i64.const 0
                      i64.ne
                      br_if 0 (;@9;)
                    end
                    local.get 11
                    local.get 5
                    i64.store
                    local.get 5
                    local.get 3
                    i64.store offset=48
                    local.get 5
                    local.get 5
                    i64.store offset=24
                    local.get 5
                    local.get 5
                    i64.store offset=16
                    br 2 (;@6;)
                  end
                  local.get 0
                  i64.const 0
                  i64.const -16
                  local.get 0
                  i64.sub
                  i64.const 15
                  i64.and
                  local.get 0
                  i64.const 16
                  i64.add
                  i64.const 15
                  i64.and
                  i64.eqz
                  select
                  local.tee 4
                  i64.add
                  local.tee 2
                  local.get 12
                  i64.const -80
                  i64.add
                  local.tee 11
                  local.get 4
                  i64.sub
                  local.tee 4
                  i64.const 1
                  i64.or
                  i64.store offset=8
                  local.get 0
                  local.get 11
                  i64.add
                  i64.const 80
                  i64.store offset=8
                  local.get 3
                  local.get 6
                  i64.const 0
                  i64.const 79
                  local.get 6
                  i64.sub
                  i64.const 15
                  i64.and
                  local.get 6
                  i64.const -79
                  i64.add
                  i64.const 15
                  i64.and
                  i64.eqz
                  select
                  i64.add
                  i64.const -95
                  i64.add
                  local.tee 11
                  local.get 11
                  local.get 3
                  i64.const 32
                  i64.add
                  local.tee 10
                  i64.lt_u
                  select
                  local.tee 11
                  i64.const 51
                  i64.store offset=8
                  i64.const 0
                  i64.const 0
                  i64.load offset=4816
                  i64.store offset=3896
                  i64.const 0
                  local.get 4
                  i64.store offset=3864
                  i64.const 0
                  local.get 2
                  i64.store offset=3888
                  local.get 11
                  i64.const 40
                  i64.add
                  i64.const 0
                  i64.load offset=4760
                  i64.store
                  local.get 11
                  i64.const 32
                  i64.add
                  i64.const 0
                  i64.load offset=4752
                  i64.store
                  local.get 11
                  i64.const 24
                  i64.add
                  i64.const 0
                  i64.load offset=4744
                  i64.store
                  local.get 11
                  i64.const 0
                  i64.load offset=4736
                  i64.store offset=16
                  i64.const 0
                  local.get 11
                  i64.const 16
                  i64.add
                  i64.store offset=4752
                  i64.const 0
                  i32.const 0
                  i32.store offset=4760
                  i64.const 0
                  local.get 0
                  i64.store offset=4736
                  i64.const 0
                  local.get 12
                  i64.store offset=4744
                  local.get 11
                  i64.const 56
                  i64.add
                  local.set 4
                  loop ;; label = @8
                    local.get 4
                    i64.const 11
                    i64.store
                    local.get 4
                    i64.const 8
                    i64.add
                    local.tee 4
                    local.get 6
                    i64.lt_u
                    br_if 0 (;@8;)
                  end
                  local.get 11
                  local.get 3
                  i64.eq
                  br_if 3 (;@4;)
                  local.get 11
                  local.get 11
                  i64.load offset=8
                  i64.const -2
                  i64.and
                  i64.store offset=8
                  local.get 11
                  local.get 11
                  local.get 3
                  i64.sub
                  local.tee 12
                  i64.store
                  local.get 3
                  local.get 12
                  i64.const 1
                  i64.or
                  i64.store offset=8
                  block ;; label = @8
                    local.get 12
                    i64.const 255
                    i64.gt_u
                    br_if 0 (;@8;)
                    local.get 12
                    i64.const 1
                    i64.shl
                    i64.const 34359738352
                    i64.and
                    i64.const 3920
                    i64.add
                    local.set 4
                    block ;; label = @9
                      block ;; label = @10
                        i64.const 0
                        i32.load offset=3848
                        local.tee 9
                        i32.const 1
                        local.get 12
                        i64.const 3
                        i64.shr_u
                        i32.wrap_i64
                        i32.shl
                        local.tee 8
                        i32.and
                        br_if 0 (;@10;)
                        i64.const 0
                        local.get 9
                        local.get 8
                        i32.or
                        i32.store offset=3848
                        local.get 4
                        local.set 6
                        br 1 (;@9;)
                      end
                      local.get 4
                      i64.load offset=16
                      local.set 6
                    end
                    local.get 6
                    local.get 3
                    i64.store offset=24
                    local.get 4
                    local.get 3
                    i64.store offset=16
                    local.get 3
                    local.get 4
                    i64.store offset=24
                    local.get 3
                    local.get 6
                    i64.store offset=16
                    br 4 (;@4;)
                  end
                  block ;; label = @8
                    block ;; label = @9
                      local.get 12
                      i64.const 8
                      i64.shr_u
                      i32.wrap_i64
                      local.tee 8
                      br_if 0 (;@9;)
                      i32.const 0
                      local.set 9
                      br 1 (;@8;)
                    end
                    i32.const 31
                    local.set 9
                    local.get 8
                    i32.const 65535
                    i32.gt_u
                    br_if 0 (;@8;)
                    local.get 12
                    i32.const 38
                    local.get 8
                    i32.clz
                    local.tee 9
                    i32.sub
                    i64.extend_i32_u
                    i64.shr_u
                    i32.wrap_i64
                    i32.const 1
                    i32.and
                    local.get 9
                    i32.const 1
                    i32.shl
                    i32.or
                    i32.const 62
                    i32.xor
                    local.set 9
                  end
                  local.get 10
                  i64.const 0
                  i64.store
                  local.get 3
                  local.get 9
                  i32.store offset=56
                  local.get 10
                  i64.const 8
                  i64.add
                  i64.const 0
                  i64.store
                  local.get 9
                  i64.extend_i32_u
                  i64.const 3
                  i64.shl
                  i64.const 4448
                  i64.add
                  local.set 6
                  block ;; label = @8
                    i64.const 0
                    i32.load offset=3852
                    local.tee 8
                    i32.const 1
                    local.get 9
                    i32.shl
                    local.tee 7
                    i32.and
                    br_if 0 (;@8;)
                    local.get 6
                    local.get 3
                    i64.store
                    i64.const 0
                    local.get 8
                    local.get 7
                    i32.or
                    i32.store offset=3852
                    local.get 3
                    local.get 6
                    i64.store offset=48
                    local.get 3
                    local.get 3
                    i64.store offset=16
                    local.get 3
                    local.get 3
                    i64.store offset=24
                    br 4 (;@4;)
                  end
                  local.get 12
                  i64.const 0
                  i64.const 63
                  local.get 9
                  i32.const 1
                  i32.shr_u
                  i32.const 6
                  i32.add
                  i64.extend_i32_u
                  i64.sub
                  local.get 9
                  i32.const 31
                  i32.eq
                  select
                  i64.shl
                  local.set 4
                  local.get 6
                  i64.load
                  local.set 0
                  loop ;; label = @8
                    local.get 0
                    local.tee 6
                    i64.load offset=8
                    i64.const -8
                    i64.and
                    local.get 12
                    i64.eq
                    br_if 3 (;@5;)
                    local.get 4
                    i64.const 60
                    i64.shr_u
                    local.set 0
                    local.get 4
                    i64.const 1
                    i64.shl
                    local.set 4
                    local.get 6
                    local.get 0
                    i64.const 8
                    i64.and
                    i64.add
                    i64.const 32
                    i64.add
                    local.tee 11
                    i64.load
                    local.tee 0
                    i64.const 0
                    i64.ne
                    br_if 0 (;@8;)
                  end
                  local.get 11
                  local.get 3
                  i64.store
                  local.get 3
                  local.get 6
                  i64.store offset=48
                  local.get 3
                  local.get 3
                  i64.store offset=24
                  local.get 3
                  local.get 3
                  i64.store offset=16
                  br 3 (;@4;)
                end
                local.get 3
                i64.load offset=16
                local.tee 4
                local.get 5
                i64.store offset=24
                local.get 3
                local.get 5
                i64.store offset=16
                local.get 5
                i64.const 0
                i64.store offset=48
                local.get 5
                local.get 3
                i64.store offset=24
                local.get 5
                local.get 4
                i64.store offset=16
              end
              local.get 2
              i64.const 16
              i64.add
              local.set 4
              br 4 (;@1;)
            end
            local.get 6
            i64.load offset=16
            local.tee 4
            local.get 3
            i64.store offset=24
            local.get 6
            local.get 3
            i64.store offset=16
            local.get 3
            i64.const 0
            i64.store offset=48
            local.get 3
            local.get 6
            i64.store offset=24
            local.get 3
            local.get 4
            i64.store offset=16
          end
          i64.const 0
          i64.load offset=3864
          local.tee 4
          local.get 5
          i64.le_u
          br_if 0 (;@3;)
          i64.const 0
          i64.load offset=3888
          local.tee 3
          local.get 5
          i64.add
          local.tee 6
          local.get 4
          local.get 5
          i64.sub
          local.tee 4
          i64.const 1
          i64.or
          i64.store offset=8
          i64.const 0
          local.get 4
          i64.store offset=3864
          i64.const 0
          local.get 6
          i64.store offset=3888
          local.get 3
          local.get 5
          i64.const 3
          i64.or
          i64.store offset=8
          local.get 3
          i64.const 16
          i64.add
          local.set 4
          br 2 (;@1;)
        end
        i64.const 0
        local.set 4
        i64.const 0
        i32.const 48
        i32.store offset=4832
        br 1 (;@1;)
      end
      block ;; label = @2
        local.get 2
        i64.eqz
        br_if 0 (;@2;)
        block ;; label = @3
          block ;; label = @4
            local.get 0
            local.get 0
            i32.load offset=56
            local.tee 9
            i64.extend_i32_u
            i64.const 3
            i64.shl
            i64.const 4448
            i64.add
            local.tee 4
            i64.load
            i64.ne
            br_if 0 (;@4;)
            local.get 4
            local.get 11
            i64.store
            local.get 11
            i64.const 0
            i64.ne
            br_if 1 (;@3;)
            i64.const 0
            local.get 8
            i32.const -2
            local.get 9
            i32.rotl
            i32.and
            i32.store offset=3852
            br 2 (;@2;)
          end
          local.get 2
          i64.const 32
          i64.const 40
          local.get 2
          i64.load offset=32
          local.get 0
          i64.eq
          select
          i64.add
          local.get 11
          i64.store
          local.get 11
          i64.eqz
          br_if 1 (;@2;)
        end
        local.get 11
        local.get 2
        i64.store offset=48
        block ;; label = @3
          local.get 0
          i64.load offset=32
          local.tee 4
          i64.eqz
          br_if 0 (;@3;)
          local.get 11
          local.get 4
          i64.store offset=32
          local.get 4
          local.get 11
          i64.store offset=48
        end
        local.get 0
        i64.const 40
        i64.add
        i64.load
        local.tee 4
        i64.eqz
        br_if 0 (;@2;)
        local.get 11
        i64.const 40
        i64.add
        local.get 4
        i64.store
        local.get 4
        local.get 11
        i64.store offset=48
      end
      block ;; label = @2
        block ;; label = @3
          local.get 3
          i64.const 31
          i64.gt_u
          br_if 0 (;@3;)
          local.get 0
          local.get 3
          local.get 5
          i64.add
          local.tee 4
          i64.const 3
          i64.or
          i64.store offset=8
          local.get 0
          local.get 4
          i64.add
          local.tee 4
          local.get 4
          i64.load offset=8
          i64.const 1
          i64.or
          i64.store offset=8
          br 1 (;@2;)
        end
        local.get 0
        local.get 5
        i64.add
        local.tee 6
        local.get 3
        i64.const 1
        i64.or
        i64.store offset=8
        local.get 0
        local.get 5
        i64.const 3
        i64.or
        i64.store offset=8
        local.get 6
        local.get 3
        i64.add
        local.get 3
        i64.store
        block ;; label = @3
          local.get 10
          i64.eqz
          br_if 0 (;@3;)
          local.get 10
          i64.const 1
          i64.shl
          i64.const 34359738352
          i64.and
          i64.const 3920
          i64.add
          local.set 5
          i64.const 0
          i64.load offset=3880
          local.set 4
          block ;; label = @4
            block ;; label = @5
              i32.const 1
              local.get 10
              i64.const 3
              i64.shr_u
              i32.wrap_i64
              i32.shl
              local.tee 9
              local.get 7
              i32.and
              br_if 0 (;@5;)
              i64.const 0
              local.get 9
              local.get 7
              i32.or
              i32.store offset=3848
              local.get 5
              local.set 11
              br 1 (;@4;)
            end
            local.get 5
            i64.load offset=16
            local.set 11
          end
          local.get 11
          local.get 4
          i64.store offset=24
          local.get 5
          local.get 4
          i64.store offset=16
          local.get 4
          local.get 5
          i64.store offset=24
          local.get 4
          local.get 11
          i64.store offset=16
        end
        i64.const 0
        local.get 6
        i64.store offset=3880
        i64.const 0
        local.get 3
        i64.store offset=3856
      end
      local.get 0
      i64.const 16
      i64.add
      local.set 4
    end
    local.get 1
    i64.const 16
    i64.add
    global.set $__stack_pointer
    local.get 4
  )
  (func $free (;15;) (type 11) (param i64)
    local.get 0
    call $dlfree
  )
  (func $dlfree (;16;) (type 11) (param i64)
    (local i64 i64 i64 i64 i64 i64 i64 i32 i32 i32)
    block ;; label = @1
      local.get 0
      i64.eqz
      br_if 0 (;@1;)
      local.get 0
      i64.const -16
      i64.add
      local.tee 1
      local.get 0
      i64.const -8
      i64.add
      i64.load
      local.tee 2
      i64.const -8
      i64.and
      local.tee 0
      i64.add
      local.set 3
      block ;; label = @2
        local.get 2
        i32.wrap_i64
        i32.const 1
        i32.and
        br_if 0 (;@2;)
        local.get 2
        i64.const 3
        i64.and
        i64.eqz
        br_if 1 (;@1;)
        local.get 1
        local.get 1
        i64.load
        local.tee 2
        i64.sub
        local.tee 1
        i64.const 0
        i64.load offset=3872
        local.tee 4
        i64.lt_u
        br_if 1 (;@1;)
        local.get 2
        local.get 0
        i64.add
        local.set 0
        block ;; label = @3
          local.get 1
          i64.const 0
          i64.load offset=3880
          i64.eq
          br_if 0 (;@3;)
          block ;; label = @4
            local.get 2
            i64.const 255
            i64.gt_u
            br_if 0 (;@4;)
            local.get 1
            i64.load offset=16
            local.tee 4
            local.get 2
            i64.const 1
            i64.shl
            i64.const 34359738352
            i64.and
            i64.const 3920
            i64.add
            local.tee 5
            i64.eq
            drop
            block ;; label = @5
              local.get 1
              i64.load offset=24
              local.tee 6
              local.get 4
              i64.ne
              br_if 0 (;@5;)
              i64.const 0
              i64.const 0
              i32.load offset=3848
              i32.const -2
              local.get 2
              i64.const 3
              i64.shr_u
              i32.wrap_i64
              i32.rotl
              i32.and
              i32.store offset=3848
              br 3 (;@2;)
            end
            local.get 6
            local.get 5
            i64.eq
            drop
            local.get 6
            local.get 4
            i64.store offset=16
            local.get 4
            local.get 6
            i64.store offset=24
            br 2 (;@2;)
          end
          local.get 1
          i64.load offset=48
          local.set 7
          block ;; label = @4
            block ;; label = @5
              local.get 1
              i64.load offset=24
              local.tee 6
              local.get 1
              i64.eq
              br_if 0 (;@5;)
              local.get 1
              i64.load offset=16
              local.tee 2
              local.get 4
              i64.lt_u
              drop
              local.get 6
              local.get 2
              i64.store offset=16
              local.get 2
              local.get 6
              i64.store offset=24
              br 1 (;@4;)
            end
            block ;; label = @5
              local.get 1
              i64.const 40
              i64.add
              local.tee 2
              i64.load
              local.tee 4
              i64.const 0
              i64.ne
              br_if 0 (;@5;)
              local.get 1
              i64.const 32
              i64.add
              local.tee 2
              i64.load
              local.tee 4
              i64.eqz
              i32.eqz
              br_if 0 (;@5;)
              i64.const 0
              local.set 6
              br 1 (;@4;)
            end
            loop ;; label = @5
              local.get 2
              local.set 5
              local.get 4
              local.tee 6
              i64.const 40
              i64.add
              local.tee 2
              i64.load
              local.tee 4
              i64.const 0
              i64.ne
              br_if 0 (;@5;)
              local.get 6
              i64.const 32
              i64.add
              local.set 2
              local.get 6
              i64.load offset=32
              local.tee 4
              i64.const 0
              i64.ne
              br_if 0 (;@5;)
            end
            local.get 5
            i64.const 0
            i64.store
          end
          local.get 7
          i64.eqz
          br_if 1 (;@2;)
          block ;; label = @4
            block ;; label = @5
              local.get 1
              local.get 1
              i32.load offset=56
              local.tee 8
              i64.extend_i32_u
              i64.const 3
              i64.shl
              i64.const 4448
              i64.add
              local.tee 2
              i64.load
              i64.ne
              br_if 0 (;@5;)
              local.get 2
              local.get 6
              i64.store
              local.get 6
              i64.const 0
              i64.ne
              br_if 1 (;@4;)
              i64.const 0
              i64.const 0
              i32.load offset=3852
              i32.const -2
              local.get 8
              i32.rotl
              i32.and
              i32.store offset=3852
              br 3 (;@2;)
            end
            local.get 7
            i64.const 32
            i64.const 40
            local.get 7
            i64.load offset=32
            local.get 1
            i64.eq
            select
            i64.add
            local.get 6
            i64.store
            local.get 6
            i64.eqz
            br_if 2 (;@2;)
          end
          local.get 6
          local.get 7
          i64.store offset=48
          block ;; label = @4
            local.get 1
            i64.load offset=32
            local.tee 2
            i64.eqz
            br_if 0 (;@4;)
            local.get 6
            local.get 2
            i64.store offset=32
            local.get 2
            local.get 6
            i64.store offset=48
          end
          local.get 1
          i64.load offset=40
          local.tee 2
          i64.eqz
          br_if 1 (;@2;)
          local.get 6
          i64.const 40
          i64.add
          local.get 2
          i64.store
          local.get 2
          local.get 6
          i64.store offset=48
          br 1 (;@2;)
        end
        local.get 3
        i64.load offset=8
        local.tee 2
        i64.const 3
        i64.and
        i64.const 3
        i64.ne
        br_if 0 (;@2;)
        local.get 3
        local.get 2
        i64.const -2
        i64.and
        i64.store offset=8
        i64.const 0
        local.get 0
        i64.store offset=3856
        local.get 1
        local.get 0
        i64.add
        local.get 0
        i64.store
        local.get 1
        local.get 0
        i64.const 1
        i64.or
        i64.store offset=8
        return
      end
      local.get 1
      local.get 3
      i64.ge_u
      br_if 0 (;@1;)
      local.get 3
      i64.load offset=8
      local.tee 2
      i64.const 1
      i64.and
      i64.eqz
      br_if 0 (;@1;)
      block ;; label = @2
        block ;; label = @3
          local.get 2
          i64.const 2
          i64.and
          i64.const 0
          i64.ne
          br_if 0 (;@3;)
          block ;; label = @4
            local.get 3
            i64.const 0
            i64.load offset=3888
            i64.ne
            br_if 0 (;@4;)
            i64.const 0
            local.get 1
            i64.store offset=3888
            i64.const 0
            i64.const 0
            i64.load offset=3864
            local.get 0
            i64.add
            local.tee 0
            i64.store offset=3864
            local.get 1
            local.get 0
            i64.const 1
            i64.or
            i64.store offset=8
            local.get 1
            i64.const 0
            i64.load offset=3880
            i64.ne
            br_if 3 (;@1;)
            i64.const 0
            i64.const 0
            i64.store offset=3856
            i64.const 0
            i64.const 0
            i64.store offset=3880
            return
          end
          block ;; label = @4
            local.get 3
            i64.const 0
            i64.load offset=3880
            i64.ne
            br_if 0 (;@4;)
            i64.const 0
            local.get 1
            i64.store offset=3880
            i64.const 0
            i64.const 0
            i64.load offset=3856
            local.get 0
            i64.add
            local.tee 0
            i64.store offset=3856
            local.get 1
            local.get 0
            i64.const 1
            i64.or
            i64.store offset=8
            local.get 1
            local.get 0
            i64.add
            local.get 0
            i64.store
            return
          end
          local.get 2
          i64.const -8
          i64.and
          local.get 0
          i64.add
          local.set 0
          block ;; label = @4
            block ;; label = @5
              local.get 2
              i64.const 255
              i64.gt_u
              br_if 0 (;@5;)
              local.get 3
              i64.load offset=16
              local.tee 4
              local.get 2
              i64.const 1
              i64.shl
              i64.const 34359738352
              i64.and
              i64.const 3920
              i64.add
              local.tee 5
              i64.eq
              drop
              block ;; label = @6
                local.get 3
                i64.load offset=24
                local.tee 6
                local.get 4
                i64.ne
                br_if 0 (;@6;)
                i64.const 0
                i64.const 0
                i32.load offset=3848
                i32.const -2
                local.get 2
                i64.const 3
                i64.shr_u
                i32.wrap_i64
                i32.rotl
                i32.and
                i32.store offset=3848
                br 2 (;@4;)
              end
              local.get 6
              local.get 5
              i64.eq
              drop
              local.get 6
              local.get 4
              i64.store offset=16
              local.get 4
              local.get 6
              i64.store offset=24
              br 1 (;@4;)
            end
            local.get 3
            i64.load offset=48
            local.set 7
            block ;; label = @5
              block ;; label = @6
                local.get 3
                i64.load offset=24
                local.tee 6
                local.get 3
                i64.eq
                br_if 0 (;@6;)
                local.get 3
                i64.load offset=16
                local.tee 2
                i64.const 0
                i64.load offset=3872
                i64.lt_u
                drop
                local.get 6
                local.get 2
                i64.store offset=16
                local.get 2
                local.get 6
                i64.store offset=24
                br 1 (;@5;)
              end
              block ;; label = @6
                local.get 3
                i64.const 40
                i64.add
                local.tee 2
                i64.load
                local.tee 4
                i64.const 0
                i64.ne
                br_if 0 (;@6;)
                local.get 3
                i64.const 32
                i64.add
                local.tee 2
                i64.load
                local.tee 4
                i64.eqz
                i32.eqz
                br_if 0 (;@6;)
                i64.const 0
                local.set 6
                br 1 (;@5;)
              end
              loop ;; label = @6
                local.get 2
                local.set 5
                local.get 4
                local.tee 6
                i64.const 40
                i64.add
                local.tee 2
                i64.load
                local.tee 4
                i64.const 0
                i64.ne
                br_if 0 (;@6;)
                local.get 6
                i64.const 32
                i64.add
                local.set 2
                local.get 6
                i64.load offset=32
                local.tee 4
                i64.const 0
                i64.ne
                br_if 0 (;@6;)
              end
              local.get 5
              i64.const 0
              i64.store
            end
            local.get 7
            i64.eqz
            br_if 0 (;@4;)
            block ;; label = @5
              block ;; label = @6
                local.get 3
                local.get 3
                i32.load offset=56
                local.tee 8
                i64.extend_i32_u
                i64.const 3
                i64.shl
                i64.const 4448
                i64.add
                local.tee 2
                i64.load
                i64.ne
                br_if 0 (;@6;)
                local.get 2
                local.get 6
                i64.store
                local.get 6
                i64.const 0
                i64.ne
                br_if 1 (;@5;)
                i64.const 0
                i64.const 0
                i32.load offset=3852
                i32.const -2
                local.get 8
                i32.rotl
                i32.and
                i32.store offset=3852
                br 2 (;@4;)
              end
              local.get 7
              i64.const 32
              i64.const 40
              local.get 7
              i64.load offset=32
              local.get 3
              i64.eq
              select
              i64.add
              local.get 6
              i64.store
              local.get 6
              i64.eqz
              br_if 1 (;@4;)
            end
            local.get 6
            local.get 7
            i64.store offset=48
            block ;; label = @5
              local.get 3
              i64.load offset=32
              local.tee 2
              i64.eqz
              br_if 0 (;@5;)
              local.get 6
              local.get 2
              i64.store offset=32
              local.get 2
              local.get 6
              i64.store offset=48
            end
            local.get 3
            i64.load offset=40
            local.tee 2
            i64.eqz
            br_if 0 (;@4;)
            local.get 6
            i64.const 40
            i64.add
            local.get 2
            i64.store
            local.get 2
            local.get 6
            i64.store offset=48
          end
          local.get 1
          local.get 0
          i64.add
          local.get 0
          i64.store
          local.get 1
          local.get 0
          i64.const 1
          i64.or
          i64.store offset=8
          local.get 1
          i64.const 0
          i64.load offset=3880
          i64.ne
          br_if 1 (;@2;)
          i64.const 0
          local.get 0
          i64.store offset=3856
          return
        end
        local.get 3
        local.get 2
        i64.const -2
        i64.and
        i64.store offset=8
        local.get 1
        local.get 0
        i64.add
        local.get 0
        i64.store
        local.get 1
        local.get 0
        i64.const 1
        i64.or
        i64.store offset=8
      end
      block ;; label = @2
        local.get 0
        i64.const 255
        i64.gt_u
        br_if 0 (;@2;)
        local.get 0
        i64.const 1
        i64.shl
        i64.const 34359738352
        i64.and
        i64.const 3920
        i64.add
        local.set 2
        block ;; label = @3
          block ;; label = @4
            i64.const 0
            i32.load offset=3848
            local.tee 8
            i32.const 1
            local.get 0
            i64.const 3
            i64.shr_u
            i32.wrap_i64
            i32.shl
            local.tee 9
            i32.and
            br_if 0 (;@4;)
            i64.const 0
            local.get 8
            local.get 9
            i32.or
            i32.store offset=3848
            local.get 2
            local.set 0
            br 1 (;@3;)
          end
          local.get 2
          i64.load offset=16
          local.set 0
        end
        local.get 0
        local.get 1
        i64.store offset=24
        local.get 2
        local.get 1
        i64.store offset=16
        local.get 1
        local.get 2
        i64.store offset=24
        local.get 1
        local.get 0
        i64.store offset=16
        return
      end
      block ;; label = @2
        block ;; label = @3
          local.get 0
          i64.const 8
          i64.shr_u
          i32.wrap_i64
          local.tee 9
          br_if 0 (;@3;)
          i32.const 0
          local.set 8
          br 1 (;@2;)
        end
        i32.const 31
        local.set 8
        local.get 9
        i32.const 65535
        i32.gt_u
        br_if 0 (;@2;)
        local.get 0
        i32.const 38
        local.get 9
        i32.clz
        local.tee 8
        i32.sub
        i64.extend_i32_u
        i64.shr_u
        i32.wrap_i64
        i32.const 1
        i32.and
        local.get 8
        i32.const 1
        i32.shl
        i32.or
        i32.const 62
        i32.xor
        local.set 8
      end
      local.get 1
      i64.const 0
      i64.store offset=32
      local.get 1
      local.get 8
      i32.store offset=56
      local.get 1
      i64.const 40
      i64.add
      i64.const 0
      i64.store
      local.get 8
      i64.extend_i32_u
      i64.const 3
      i64.shl
      i64.const 4448
      i64.add
      local.set 4
      block ;; label = @2
        block ;; label = @3
          i64.const 0
          i32.load offset=3852
          local.tee 9
          i32.const 1
          local.get 8
          i32.shl
          local.tee 10
          i32.and
          br_if 0 (;@3;)
          local.get 4
          local.get 1
          i64.store
          i64.const 0
          local.get 9
          local.get 10
          i32.or
          i32.store offset=3852
          local.get 1
          local.get 4
          i64.store offset=48
          local.get 1
          local.get 1
          i64.store offset=16
          local.get 1
          local.get 1
          i64.store offset=24
          br 1 (;@2;)
        end
        local.get 0
        i64.const 0
        i64.const 63
        local.get 8
        i32.const 1
        i32.shr_u
        i32.const 6
        i32.add
        i64.extend_i32_u
        i64.sub
        local.get 8
        i32.const 31
        i32.eq
        select
        i64.shl
        local.set 2
        local.get 4
        i64.load
        local.set 6
        block ;; label = @3
          loop ;; label = @4
            local.get 6
            local.tee 4
            i64.load offset=8
            i64.const -8
            i64.and
            local.get 0
            i64.eq
            br_if 1 (;@3;)
            local.get 2
            i64.const 60
            i64.shr_u
            local.set 6
            local.get 2
            i64.const 1
            i64.shl
            local.set 2
            local.get 4
            local.get 6
            i64.const 8
            i64.and
            i64.add
            i64.const 32
            i64.add
            local.tee 3
            i64.load
            local.tee 6
            i64.const 0
            i64.ne
            br_if 0 (;@4;)
          end
          local.get 3
          local.get 1
          i64.store
          local.get 1
          local.get 4
          i64.store offset=48
          local.get 1
          local.get 1
          i64.store offset=24
          local.get 1
          local.get 1
          i64.store offset=16
          br 1 (;@2;)
        end
        local.get 4
        i64.load offset=16
        local.tee 0
        local.get 1
        i64.store offset=24
        local.get 4
        local.get 1
        i64.store offset=16
        local.get 1
        i64.const 0
        i64.store offset=48
        local.get 1
        local.get 4
        i64.store offset=24
        local.get 1
        local.get 0
        i64.store offset=16
      end
      i64.const 0
      i64.const -1
      i64.const 0
      i64.load offset=3904
      i64.const -1
      i64.add
      local.tee 1
      local.get 1
      i64.eqz
      select
      i64.store offset=3904
    end
  )
  (func $calloc (;17;) (type 9) (param i64 i64) (result i64)
    (local i64 i64)
    global.get $__stack_pointer
    i64.const 16
    i64.sub
    local.tee 2
    global.set $__stack_pointer
    block ;; label = @1
      block ;; label = @2
        local.get 0
        i64.eqz
        i32.eqz
        br_if 0 (;@2;)
        i64.const 0
        local.set 3
        br 1 (;@1;)
      end
      local.get 2
      local.get 0
      i64.const 0
      local.get 1
      i64.const 0
      call $__multi3
      local.get 2
      i64.load
      local.set 3
      local.get 1
      local.get 0
      i64.or
      i64.const 65536
      i64.lt_u
      br_if 0 (;@1;)
      i64.const -1
      local.get 3
      local.get 2
      i64.load offset=8
      i64.const 0
      i64.ne
      select
      local.set 3
    end
    block ;; label = @1
      local.get 3
      call $dlmalloc
      local.tee 0
      i64.eqz
      br_if 0 (;@1;)
      local.get 0
      i64.const -8
      i64.add
      i32.load8_u
      i32.const 3
      i32.and
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.const 0
      local.get 3
      call $memset
      drop
    end
    local.get 2
    i64.const 16
    i64.add
    global.set $__stack_pointer
    local.get 0
  )
  (func $dispose_chunk (;18;) (type 12) (param i64 i64)
    (local i64 i64 i64 i64 i64 i64 i32 i32 i32)
    local.get 0
    local.get 1
    i64.add
    local.set 2
    block ;; label = @1
      block ;; label = @2
        local.get 0
        i64.load offset=8
        local.tee 3
        i32.wrap_i64
        i32.const 1
        i32.and
        br_if 0 (;@2;)
        local.get 3
        i64.const 3
        i64.and
        i64.eqz
        br_if 1 (;@1;)
        local.get 0
        i64.load
        local.tee 3
        local.get 1
        i64.add
        local.set 1
        block ;; label = @3
          block ;; label = @4
            local.get 0
            local.get 3
            i64.sub
            local.tee 0
            i64.const 0
            i64.load offset=3880
            i64.eq
            br_if 0 (;@4;)
            block ;; label = @5
              local.get 3
              i64.const 255
              i64.gt_u
              br_if 0 (;@5;)
              local.get 0
              i64.load offset=16
              local.tee 4
              local.get 3
              i64.const 1
              i64.shl
              i64.const 34359738352
              i64.and
              i64.const 3920
              i64.add
              local.tee 5
              i64.eq
              drop
              local.get 0
              i64.load offset=24
              local.tee 6
              local.get 4
              i64.ne
              br_if 2 (;@3;)
              i64.const 0
              i64.const 0
              i32.load offset=3848
              i32.const -2
              local.get 3
              i64.const 3
              i64.shr_u
              i32.wrap_i64
              i32.rotl
              i32.and
              i32.store offset=3848
              br 3 (;@2;)
            end
            local.get 0
            i64.load offset=48
            local.set 7
            block ;; label = @5
              block ;; label = @6
                local.get 0
                i64.load offset=24
                local.tee 6
                local.get 0
                i64.eq
                br_if 0 (;@6;)
                local.get 0
                i64.load offset=16
                local.tee 3
                i64.const 0
                i64.load offset=3872
                i64.lt_u
                drop
                local.get 6
                local.get 3
                i64.store offset=16
                local.get 3
                local.get 6
                i64.store offset=24
                br 1 (;@5;)
              end
              block ;; label = @6
                local.get 0
                i64.const 40
                i64.add
                local.tee 3
                i64.load
                local.tee 4
                i64.const 0
                i64.ne
                br_if 0 (;@6;)
                local.get 0
                i64.const 32
                i64.add
                local.tee 3
                i64.load
                local.tee 4
                i64.eqz
                i32.eqz
                br_if 0 (;@6;)
                i64.const 0
                local.set 6
                br 1 (;@5;)
              end
              loop ;; label = @6
                local.get 3
                local.set 5
                local.get 4
                local.tee 6
                i64.const 40
                i64.add
                local.tee 3
                i64.load
                local.tee 4
                i64.const 0
                i64.ne
                br_if 0 (;@6;)
                local.get 6
                i64.const 32
                i64.add
                local.set 3
                local.get 6
                i64.load offset=32
                local.tee 4
                i64.const 0
                i64.ne
                br_if 0 (;@6;)
              end
              local.get 5
              i64.const 0
              i64.store
            end
            local.get 7
            i64.eqz
            br_if 2 (;@2;)
            block ;; label = @5
              block ;; label = @6
                local.get 0
                local.get 0
                i32.load offset=56
                local.tee 8
                i64.extend_i32_u
                i64.const 3
                i64.shl
                i64.const 4448
                i64.add
                local.tee 3
                i64.load
                i64.ne
                br_if 0 (;@6;)
                local.get 3
                local.get 6
                i64.store
                local.get 6
                i64.const 0
                i64.ne
                br_if 1 (;@5;)
                i64.const 0
                i64.const 0
                i32.load offset=3852
                i32.const -2
                local.get 8
                i32.rotl
                i32.and
                i32.store offset=3852
                br 4 (;@2;)
              end
              local.get 7
              i64.const 32
              i64.const 40
              local.get 7
              i64.load offset=32
              local.get 0
              i64.eq
              select
              i64.add
              local.get 6
              i64.store
              local.get 6
              i64.eqz
              br_if 3 (;@2;)
            end
            local.get 6
            local.get 7
            i64.store offset=48
            block ;; label = @5
              local.get 0
              i64.load offset=32
              local.tee 3
              i64.eqz
              br_if 0 (;@5;)
              local.get 6
              local.get 3
              i64.store offset=32
              local.get 3
              local.get 6
              i64.store offset=48
            end
            local.get 0
            i64.load offset=40
            local.tee 3
            i64.eqz
            br_if 2 (;@2;)
            local.get 6
            i64.const 40
            i64.add
            local.get 3
            i64.store
            local.get 3
            local.get 6
            i64.store offset=48
            br 2 (;@2;)
          end
          local.get 2
          i64.load offset=8
          local.tee 3
          i64.const 3
          i64.and
          i64.const 3
          i64.ne
          br_if 1 (;@2;)
          local.get 2
          local.get 3
          i64.const -2
          i64.and
          i64.store offset=8
          i64.const 0
          local.get 1
          i64.store offset=3856
          local.get 2
          local.get 1
          i64.store
          local.get 0
          local.get 1
          i64.const 1
          i64.or
          i64.store offset=8
          return
        end
        local.get 6
        local.get 5
        i64.eq
        drop
        local.get 6
        local.get 4
        i64.store offset=16
        local.get 4
        local.get 6
        i64.store offset=24
      end
      block ;; label = @2
        block ;; label = @3
          local.get 2
          i64.load offset=8
          local.tee 3
          i64.const 2
          i64.and
          i64.const 0
          i64.ne
          br_if 0 (;@3;)
          block ;; label = @4
            local.get 2
            i64.const 0
            i64.load offset=3888
            i64.ne
            br_if 0 (;@4;)
            i64.const 0
            local.get 0
            i64.store offset=3888
            i64.const 0
            i64.const 0
            i64.load offset=3864
            local.get 1
            i64.add
            local.tee 1
            i64.store offset=3864
            local.get 0
            local.get 1
            i64.const 1
            i64.or
            i64.store offset=8
            local.get 0
            i64.const 0
            i64.load offset=3880
            i64.ne
            br_if 3 (;@1;)
            i64.const 0
            i64.const 0
            i64.store offset=3856
            i64.const 0
            i64.const 0
            i64.store offset=3880
            return
          end
          block ;; label = @4
            local.get 2
            i64.const 0
            i64.load offset=3880
            i64.ne
            br_if 0 (;@4;)
            i64.const 0
            local.get 0
            i64.store offset=3880
            i64.const 0
            i64.const 0
            i64.load offset=3856
            local.get 1
            i64.add
            local.tee 1
            i64.store offset=3856
            local.get 0
            local.get 1
            i64.const 1
            i64.or
            i64.store offset=8
            local.get 0
            local.get 1
            i64.add
            local.get 1
            i64.store
            return
          end
          local.get 3
          i64.const -8
          i64.and
          local.get 1
          i64.add
          local.set 1
          block ;; label = @4
            block ;; label = @5
              local.get 3
              i64.const 255
              i64.gt_u
              br_if 0 (;@5;)
              local.get 2
              i64.load offset=16
              local.tee 4
              local.get 3
              i64.const 1
              i64.shl
              i64.const 34359738352
              i64.and
              i64.const 3920
              i64.add
              local.tee 5
              i64.eq
              drop
              block ;; label = @6
                local.get 2
                i64.load offset=24
                local.tee 6
                local.get 4
                i64.ne
                br_if 0 (;@6;)
                i64.const 0
                i64.const 0
                i32.load offset=3848
                i32.const -2
                local.get 3
                i64.const 3
                i64.shr_u
                i32.wrap_i64
                i32.rotl
                i32.and
                i32.store offset=3848
                br 2 (;@4;)
              end
              local.get 6
              local.get 5
              i64.eq
              drop
              local.get 6
              local.get 4
              i64.store offset=16
              local.get 4
              local.get 6
              i64.store offset=24
              br 1 (;@4;)
            end
            local.get 2
            i64.load offset=48
            local.set 7
            block ;; label = @5
              block ;; label = @6
                local.get 2
                i64.load offset=24
                local.tee 6
                local.get 2
                i64.eq
                br_if 0 (;@6;)
                local.get 2
                i64.load offset=16
                local.tee 3
                i64.const 0
                i64.load offset=3872
                i64.lt_u
                drop
                local.get 6
                local.get 3
                i64.store offset=16
                local.get 3
                local.get 6
                i64.store offset=24
                br 1 (;@5;)
              end
              block ;; label = @6
                local.get 2
                i64.const 40
                i64.add
                local.tee 4
                i64.load
                local.tee 3
                i64.const 0
                i64.ne
                br_if 0 (;@6;)
                local.get 2
                i64.const 32
                i64.add
                local.tee 4
                i64.load
                local.tee 3
                i64.eqz
                i32.eqz
                br_if 0 (;@6;)
                i64.const 0
                local.set 6
                br 1 (;@5;)
              end
              loop ;; label = @6
                local.get 4
                local.set 5
                local.get 3
                local.tee 6
                i64.const 40
                i64.add
                local.tee 4
                i64.load
                local.tee 3
                i64.const 0
                i64.ne
                br_if 0 (;@6;)
                local.get 6
                i64.const 32
                i64.add
                local.set 4
                local.get 6
                i64.load offset=32
                local.tee 3
                i64.const 0
                i64.ne
                br_if 0 (;@6;)
              end
              local.get 5
              i64.const 0
              i64.store
            end
            local.get 7
            i64.eqz
            br_if 0 (;@4;)
            block ;; label = @5
              block ;; label = @6
                local.get 2
                local.get 2
                i32.load offset=56
                local.tee 8
                i64.extend_i32_u
                i64.const 3
                i64.shl
                i64.const 4448
                i64.add
                local.tee 3
                i64.load
                i64.ne
                br_if 0 (;@6;)
                local.get 3
                local.get 6
                i64.store
                local.get 6
                i64.const 0
                i64.ne
                br_if 1 (;@5;)
                i64.const 0
                i64.const 0
                i32.load offset=3852
                i32.const -2
                local.get 8
                i32.rotl
                i32.and
                i32.store offset=3852
                br 2 (;@4;)
              end
              local.get 7
              i64.const 32
              i64.const 40
              local.get 7
              i64.load offset=32
              local.get 2
              i64.eq
              select
              i64.add
              local.get 6
              i64.store
              local.get 6
              i64.eqz
              br_if 1 (;@4;)
            end
            local.get 6
            local.get 7
            i64.store offset=48
            block ;; label = @5
              local.get 2
              i64.load offset=32
              local.tee 3
              i64.eqz
              br_if 0 (;@5;)
              local.get 6
              local.get 3
              i64.store offset=32
              local.get 3
              local.get 6
              i64.store offset=48
            end
            local.get 2
            i64.load offset=40
            local.tee 3
            i64.eqz
            br_if 0 (;@4;)
            local.get 6
            i64.const 40
            i64.add
            local.get 3
            i64.store
            local.get 3
            local.get 6
            i64.store offset=48
          end
          local.get 0
          local.get 1
          i64.add
          local.get 1
          i64.store
          local.get 0
          local.get 1
          i64.const 1
          i64.or
          i64.store offset=8
          local.get 0
          i64.const 0
          i64.load offset=3880
          i64.ne
          br_if 1 (;@2;)
          i64.const 0
          local.get 1
          i64.store offset=3856
          return
        end
        local.get 2
        local.get 3
        i64.const -2
        i64.and
        i64.store offset=8
        local.get 0
        local.get 1
        i64.add
        local.get 1
        i64.store
        local.get 0
        local.get 1
        i64.const 1
        i64.or
        i64.store offset=8
      end
      block ;; label = @2
        local.get 1
        i64.const 255
        i64.gt_u
        br_if 0 (;@2;)
        local.get 1
        i64.const 1
        i64.shl
        i64.const 34359738352
        i64.and
        i64.const 3920
        i64.add
        local.set 3
        block ;; label = @3
          block ;; label = @4
            i64.const 0
            i32.load offset=3848
            local.tee 8
            i32.const 1
            local.get 1
            i64.const 3
            i64.shr_u
            i32.wrap_i64
            i32.shl
            local.tee 9
            i32.and
            br_if 0 (;@4;)
            i64.const 0
            local.get 8
            local.get 9
            i32.or
            i32.store offset=3848
            local.get 3
            local.set 1
            br 1 (;@3;)
          end
          local.get 3
          i64.load offset=16
          local.set 1
        end
        local.get 1
        local.get 0
        i64.store offset=24
        local.get 3
        local.get 0
        i64.store offset=16
        local.get 0
        local.get 3
        i64.store offset=24
        local.get 0
        local.get 1
        i64.store offset=16
        return
      end
      block ;; label = @2
        block ;; label = @3
          local.get 1
          i64.const 8
          i64.shr_u
          i32.wrap_i64
          local.tee 9
          br_if 0 (;@3;)
          i32.const 0
          local.set 8
          br 1 (;@2;)
        end
        i32.const 31
        local.set 8
        local.get 9
        i32.const 65535
        i32.gt_u
        br_if 0 (;@2;)
        local.get 1
        i32.const 38
        local.get 9
        i32.clz
        local.tee 8
        i32.sub
        i64.extend_i32_u
        i64.shr_u
        i32.wrap_i64
        i32.const 1
        i32.and
        local.get 8
        i32.const 1
        i32.shl
        i32.or
        i32.const 62
        i32.xor
        local.set 8
      end
      local.get 0
      i64.const 0
      i64.store offset=32
      local.get 0
      local.get 8
      i32.store offset=56
      local.get 0
      i64.const 40
      i64.add
      i64.const 0
      i64.store
      local.get 8
      i64.extend_i32_u
      i64.const 3
      i64.shl
      i64.const 4448
      i64.add
      local.set 4
      block ;; label = @2
        i64.const 0
        i32.load offset=3852
        local.tee 9
        i32.const 1
        local.get 8
        i32.shl
        local.tee 10
        i32.and
        br_if 0 (;@2;)
        local.get 4
        local.get 0
        i64.store
        i64.const 0
        local.get 9
        local.get 10
        i32.or
        i32.store offset=3852
        local.get 0
        local.get 4
        i64.store offset=48
        local.get 0
        local.get 0
        i64.store offset=16
        local.get 0
        local.get 0
        i64.store offset=24
        return
      end
      local.get 1
      i64.const 0
      i64.const 63
      local.get 8
      i32.const 1
      i32.shr_u
      i32.const 6
      i32.add
      i64.extend_i32_u
      i64.sub
      local.get 8
      i32.const 31
      i32.eq
      select
      i64.shl
      local.set 3
      local.get 4
      i64.load
      local.set 6
      block ;; label = @2
        loop ;; label = @3
          local.get 6
          local.tee 4
          i64.load offset=8
          i64.const -8
          i64.and
          local.get 1
          i64.eq
          br_if 1 (;@2;)
          local.get 3
          i64.const 60
          i64.shr_u
          local.set 6
          local.get 3
          i64.const 1
          i64.shl
          local.set 3
          local.get 4
          local.get 6
          i64.const 8
          i64.and
          i64.add
          i64.const 32
          i64.add
          local.tee 2
          i64.load
          local.tee 6
          i64.const 0
          i64.ne
          br_if 0 (;@3;)
        end
        local.get 2
        local.get 0
        i64.store
        local.get 0
        local.get 4
        i64.store offset=48
        local.get 0
        local.get 0
        i64.store offset=24
        local.get 0
        local.get 0
        i64.store offset=16
        return
      end
      local.get 4
      i64.load offset=16
      local.tee 1
      local.get 0
      i64.store offset=24
      local.get 4
      local.get 0
      i64.store offset=16
      local.get 0
      i64.const 0
      i64.store offset=48
      local.get 0
      local.get 4
      i64.store offset=24
      local.get 0
      local.get 1
      i64.store offset=16
    end
  )
  (func $internal_memalign (;19;) (type 9) (param i64 i64) (result i64)
    (local i64 i64 i64 i64 i64)
    i64.const 32
    local.set 2
    block ;; label = @1
      block ;; label = @2
        local.get 0
        i64.const 32
        local.get 0
        i64.const 32
        i64.gt_u
        select
        local.tee 3
        local.get 3
        i64.const -1
        i64.add
        i64.and
        i64.eqz
        i32.eqz
        br_if 0 (;@2;)
        local.get 3
        local.set 0
        br 1 (;@1;)
      end
      loop ;; label = @2
        local.get 2
        local.tee 0
        i64.const 1
        i64.shl
        local.set 2
        local.get 0
        local.get 3
        i64.lt_u
        br_if 0 (;@2;)
      end
    end
    block ;; label = @1
      i64.const -128
      local.get 0
      i64.sub
      local.get 1
      i64.gt_u
      br_if 0 (;@1;)
      i64.const 0
      i32.const 48
      i32.store offset=4832
      i64.const 0
      return
    end
    block ;; label = @1
      i64.const 32
      local.get 1
      i64.const 23
      i64.add
      i64.const -16
      i64.and
      local.get 1
      i64.const 23
      i64.lt_u
      select
      local.tee 1
      local.get 0
      i64.add
      i64.const 24
      i64.add
      call $dlmalloc
      local.tee 2
      i64.eqz
      i32.eqz
      br_if 0 (;@1;)
      i64.const 0
      return
    end
    local.get 2
    i64.const -16
    i64.add
    local.set 3
    block ;; label = @1
      block ;; label = @2
        local.get 0
        i64.const -1
        i64.add
        local.get 2
        i64.and
        i64.eqz
        i32.eqz
        br_if 0 (;@2;)
        local.get 3
        local.set 0
        br 1 (;@1;)
      end
      local.get 2
      i64.const -8
      i64.add
      local.tee 4
      i64.load
      local.tee 5
      i64.const -8
      i64.and
      local.get 2
      local.get 0
      i64.add
      i64.const -1
      i64.add
      i64.const 0
      local.get 0
      i64.sub
      i64.and
      i64.const -16
      i64.add
      local.tee 2
      i64.const 0
      local.get 0
      local.get 2
      local.get 3
      i64.sub
      i64.const 31
      i64.gt_u
      select
      i64.add
      local.tee 0
      local.get 3
      i64.sub
      local.tee 2
      i64.sub
      local.set 6
      block ;; label = @2
        local.get 5
        i64.const 3
        i64.and
        i64.const 0
        i64.ne
        br_if 0 (;@2;)
        local.get 0
        local.get 6
        i64.store offset=8
        local.get 0
        local.get 3
        i64.load
        local.get 2
        i64.add
        i64.store
        br 1 (;@1;)
      end
      local.get 0
      local.get 6
      local.get 0
      i64.load offset=8
      i64.const 1
      i64.and
      i64.or
      i64.const 2
      i64.or
      i64.store offset=8
      local.get 0
      local.get 6
      i64.add
      local.tee 6
      local.get 6
      i64.load offset=8
      i64.const 1
      i64.or
      i64.store offset=8
      local.get 4
      local.get 2
      local.get 4
      i64.load
      i64.const 1
      i64.and
      i64.or
      i64.const 2
      i64.or
      i64.store
      local.get 3
      local.get 2
      i64.add
      local.tee 6
      local.get 6
      i64.load offset=8
      i64.const 1
      i64.or
      i64.store offset=8
      local.get 3
      local.get 2
      call $dispose_chunk
    end
    block ;; label = @1
      local.get 0
      i64.load offset=8
      local.tee 2
      i64.const 3
      i64.and
      i64.eqz
      br_if 0 (;@1;)
      local.get 2
      i64.const -8
      i64.and
      local.tee 3
      local.get 1
      i64.const 32
      i64.add
      i64.le_u
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      local.get 2
      i64.const 1
      i64.and
      i64.or
      i64.const 2
      i64.or
      i64.store offset=8
      local.get 0
      local.get 1
      i64.add
      local.tee 2
      local.get 3
      local.get 1
      i64.sub
      local.tee 1
      i64.const 3
      i64.or
      i64.store offset=8
      local.get 0
      local.get 3
      i64.add
      local.tee 3
      local.get 3
      i64.load offset=8
      i64.const 1
      i64.or
      i64.store offset=8
      local.get 2
      local.get 1
      call $dispose_chunk
    end
    local.get 0
    i64.const 16
    i64.add
  )
  (func $aligned_alloc (;20;) (type 9) (param i64 i64) (result i64)
    block ;; label = @1
      local.get 0
      i64.const 16
      i64.gt_u
      br_if 0 (;@1;)
      local.get 1
      call $dlmalloc
      return
    end
    local.get 0
    local.get 1
    call $internal_memalign
  )
  (func $_Exit (;21;) (type 7) (param i32)
    local.get 0
    call $__wasi_proc_exit
    unreachable
  )
  (func $__main_void (;22;) (type 13) (result i32)
    (local i64 i64 i64 i32)
    global.get $__stack_pointer
    i64.const 16
    i64.sub
    local.tee 0
    global.set $__stack_pointer
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            block ;; label = @5
              local.get 0
              local.get 0
              i64.const 8
              i64.add
              call $__wasi_args_sizes_get
              br_if 0 (;@5;)
              local.get 0
              i64.load
              i64.const 1
              i64.add
              local.tee 1
              i64.const 0
              i64.eq
              br_if 1 (;@4;)
              local.get 0
              i64.load offset=8
              call $malloc
              local.tee 2
              i64.const 0
              i64.eq
              br_if 2 (;@3;)
              local.get 1
              i64.const 8
              call $calloc
              local.tee 1
              i64.const 0
              i64.eq
              br_if 3 (;@2;)
              local.get 1
              local.get 2
              call $__wasi_args_get
              br_if 4 (;@1;)
              local.get 0
              i32.load
              local.get 1
              call $main
              local.set 3
              local.get 0
              i64.const 16
              i64.add
              global.set $__stack_pointer
              local.get 3
              return
            end
            i32.const 71
            call $_Exit
            unreachable
          end
          i32.const 70
          call $_Exit
          unreachable
        end
        i32.const 70
        call $_Exit
        unreachable
      end
      local.get 2
      call $free
      i32.const 70
      call $_Exit
      unreachable
    end
    local.get 2
    call $free
    local.get 1
    call $free
    i32.const 71
    call $_Exit
    unreachable
  )
  (func $__wasi_args_get (;23;) (type 2) (param i64 i64) (result i32)
    local.get 0
    local.get 1
    call $__imported_wasi_snapshot_preview1_args_get
    i32.const 65535
    i32.and
  )
  (func $__wasi_args_sizes_get (;24;) (type 2) (param i64 i64) (result i32)
    local.get 0
    local.get 1
    call $__imported_wasi_snapshot_preview1_args_sizes_get
    i32.const 65535
    i32.and
  )
  (func $__wasi_fd_close (;25;) (type 3) (param i32) (result i32)
    local.get 0
    call $__imported_wasi_snapshot_preview1_fd_close
    i32.const 65535
    i32.and
  )
  (func $__wasi_fd_fdstat_get (;26;) (type 4) (param i32 i64) (result i32)
    local.get 0
    local.get 1
    call $__imported_wasi_snapshot_preview1_fd_fdstat_get
    i32.const 65535
    i32.and
  )
  (func $__wasi_fd_seek (;27;) (type 5) (param i32 i64 i32 i64) (result i32)
    local.get 0
    local.get 1
    local.get 2
    local.get 3
    call $__imported_wasi_snapshot_preview1_fd_seek
    i32.const 65535
    i32.and
  )
  (func $__wasi_fd_write (;28;) (type 6) (param i32 i64 i64 i64) (result i32)
    local.get 0
    local.get 1
    local.get 2
    local.get 3
    call $__imported_wasi_snapshot_preview1_fd_write
    i32.const 65535
    i32.and
  )
  (func $__wasi_proc_exit (;29;) (type 7) (param i32)
    local.get 0
    call $__imported_wasi_snapshot_preview1_proc_exit
    unreachable
  )
  (func $abort (;30;) (type 8)
    unreachable
    unreachable
  )
  (func $sbrk (;31;) (type 10) (param i64) (result i64)
    block ;; label = @1
      local.get 0
      i64.const 0
      i64.ne
      br_if 0 (;@1;)
      memory.size
      i64.const 16
      i64.shl
      return
    end
    block ;; label = @1
      local.get 0
      i64.const 65535
      i64.and
      i64.eqz
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i64.const -1
      i64.le_s
      br_if 0 (;@1;)
      block ;; label = @2
        local.get 0
        i64.const 16
        i64.shr_u
        memory.grow
        local.tee 0
        i64.const 4294967295
        i64.ne
        br_if 0 (;@2;)
        i64.const 0
        i32.const 48
        i32.store offset=4832
        i64.const -1
        return
      end
      local.get 0
      i64.const 16
      i64.shl
      return
    end
    call $abort
    unreachable
  )
  (func $dummy (;32;) (type 8))
  (func $__wasm_call_dtors (;33;) (type 8)
    call $dummy
    call $__stdio_exit
  )
  (func $printf (;34;) (type 2) (param i64 i64) (result i32)
    (local i64 i32)
    global.get $__stack_pointer
    i64.const 16
    i64.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    local.get 1
    i64.store offset=8
    i64.const 3456
    local.get 0
    local.get 1
    call $vfprintf
    local.set 3
    local.get 2
    i64.const 16
    i64.add
    global.set $__stack_pointer
    local.get 3
  )
  (func $close (;35;) (type 3) (param i32) (result i32)
    block ;; label = @1
      local.get 0
      call $__wasi_fd_close
      local.tee 0
      br_if 0 (;@1;)
      i32.const 0
      return
    end
    i64.const 0
    local.get 0
    i32.store offset=4832
    i32.const -1
  )
  (func $__stdio_close (;36;) (type 14) (param i64) (result i32)
    local.get 0
    i32.load offset=112
    call $close
  )
  (func $writev (;37;) (type 15) (param i32 i64 i32) (result i64)
    (local i64)
    global.get $__stack_pointer
    i64.const 16
    i64.sub
    local.tee 3
    global.set $__stack_pointer
    block ;; label = @1
      block ;; label = @2
        local.get 2
        i32.const -1
        i32.gt_s
        br_if 0 (;@2;)
        i64.const 0
        i32.const 28
        i32.store offset=4832
        i64.const -1
        local.set 1
        br 1 (;@1;)
      end
      block ;; label = @2
        local.get 0
        local.get 1
        local.get 2
        i64.extend_i32_u
        local.get 3
        i64.const 8
        i64.add
        call $__wasi_fd_write
        local.tee 2
        i32.eqz
        br_if 0 (;@2;)
        i64.const 0
        local.get 2
        i32.store offset=4832
        i64.const -1
        local.set 1
        br 1 (;@1;)
      end
      local.get 3
      i64.load offset=8
      local.set 1
    end
    local.get 3
    i64.const 16
    i64.add
    global.set $__stack_pointer
    local.get 1
  )
  (func $__stdio_write (;38;) (type 0) (param i64 i64 i64) (result i64)
    (local i64 i32 i64 i64 i64 i32 i64)
    global.get $__stack_pointer
    i64.const 32
    i64.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    i64.const 24
    i64.add
    local.get 2
    i64.store
    local.get 3
    local.get 1
    i64.store offset=16
    local.get 3
    local.get 0
    i64.load offset=48
    local.tee 1
    i64.store
    local.get 3
    local.get 0
    i64.load offset=40
    local.get 1
    i64.sub
    local.tee 1
    i64.store offset=8
    i32.const 2
    local.set 4
    block ;; label = @1
      block ;; label = @2
        local.get 1
        local.get 2
        i64.add
        local.tee 5
        local.get 0
        i32.load offset=112
        local.get 3
        i32.const 2
        call $writev
        local.tee 6
        i64.eq
        br_if 0 (;@2;)
        local.get 3
        local.set 1
        loop ;; label = @3
          block ;; label = @4
            local.get 6
            i64.const -1
            i64.gt_s
            br_if 0 (;@4;)
            i64.const 0
            local.set 6
            local.get 0
            i64.const 0
            i64.store offset=32
            local.get 0
            i64.const 48
            i64.add
            i64.const 0
            i64.store
            local.get 0
            i64.const 40
            i64.add
            i64.const 0
            i64.store
            local.get 0
            local.get 0
            i32.load
            i32.const 32
            i32.or
            i32.store
            local.get 4
            i32.const 2
            i32.eq
            br_if 3 (;@1;)
            local.get 2
            local.get 1
            i64.load offset=8
            i64.sub
            local.set 6
            br 3 (;@1;)
          end
          local.get 1
          i64.const 24
          i64.const 8
          local.get 6
          local.get 1
          i64.load offset=8
          local.tee 7
          i64.gt_u
          local.tee 8
          select
          i64.add
          local.tee 9
          local.get 9
          i64.load
          local.get 6
          local.get 7
          i64.const 0
          local.get 8
          select
          i64.sub
          local.tee 7
          i64.sub
          i64.store
          local.get 1
          local.get 8
          i64.extend_i32_u
          i64.const 4
          i64.shl
          i64.add
          local.tee 1
          local.get 1
          i64.load
          local.get 7
          i64.add
          i64.store
          local.get 5
          local.get 6
          i64.sub
          local.tee 5
          local.get 0
          i32.load offset=112
          local.get 1
          local.get 4
          local.get 8
          i32.sub
          local.tee 4
          call $writev
          local.tee 6
          i64.ne
          br_if 0 (;@3;)
        end
      end
      local.get 0
      local.get 0
      i64.load offset=80
      local.tee 1
      i64.store offset=48
      local.get 0
      local.get 1
      i64.store offset=40
      local.get 0
      local.get 1
      local.get 0
      i64.load offset=88
      i64.add
      i64.store offset=32
      local.get 2
      local.set 6
    end
    local.get 3
    i64.const 32
    i64.add
    global.set $__stack_pointer
    local.get 6
  )
  (func $__isatty (;39;) (type 3) (param i32) (result i32)
    (local i64)
    global.get $__stack_pointer
    i64.const 32
    i64.sub
    local.tee 1
    global.set $__stack_pointer
    block ;; label = @1
      block ;; label = @2
        local.get 0
        local.get 1
        i64.const 8
        i64.add
        call $__wasi_fd_fdstat_get
        local.tee 0
        br_if 0 (;@2;)
        i32.const 59
        local.set 0
        local.get 1
        i32.load8_u offset=8
        i32.const 2
        i32.ne
        br_if 0 (;@2;)
        local.get 1
        i32.load8_u offset=16
        i32.const 36
        i32.and
        br_if 0 (;@2;)
        i32.const 1
        local.set 0
        br 1 (;@1;)
      end
      i64.const 0
      local.get 0
      i32.store offset=4832
      i32.const 0
      local.set 0
    end
    local.get 1
    i64.const 32
    i64.add
    global.set $__stack_pointer
    local.get 0
  )
  (func $__stdout_write (;40;) (type 0) (param i64 i64 i64) (result i64)
    local.get 0
    i64.const 1
    i64.store offset=64
    block ;; label = @1
      local.get 0
      i32.load8_u
      i32.const 64
      i32.and
      br_if 0 (;@1;)
      local.get 0
      i32.load offset=112
      call $__isatty
      br_if 0 (;@1;)
      local.get 0
      i32.const -1
      i32.store offset=120
    end
    local.get 0
    local.get 1
    local.get 2
    call $__stdio_write
  )
  (func $__lseek (;41;) (type 15) (param i32 i64 i32) (result i64)
    (local i64)
    global.get $__stack_pointer
    i64.const 16
    i64.sub
    local.tee 3
    global.set $__stack_pointer
    block ;; label = @1
      block ;; label = @2
        local.get 0
        local.get 1
        local.get 2
        i32.const 255
        i32.and
        local.get 3
        i64.const 8
        i64.add
        call $__wasi_fd_seek
        local.tee 2
        i32.eqz
        br_if 0 (;@2;)
        i64.const 0
        i32.const 70
        local.get 2
        local.get 2
        i32.const 76
        i32.eq
        select
        i32.store offset=4832
        i64.const -1
        local.set 1
        br 1 (;@1;)
      end
      local.get 3
      i64.load offset=8
      local.set 1
    end
    local.get 3
    i64.const 16
    i64.add
    global.set $__stack_pointer
    local.get 1
  )
  (func $__stdio_seek (;42;) (type 1) (param i64 i64 i32) (result i64)
    local.get 0
    i32.load offset=112
    local.get 1
    local.get 2
    call $__lseek
  )
  (func $__ofl_lock (;43;) (type 16) (result i64)
    i64.const 5880
  )
  (func $__stdio_exit (;44;) (type 8)
    (local i64 i64 i64)
    block ;; label = @1
      call $__ofl_lock
      i64.load
      local.tee 0
      i64.eqz
      br_if 0 (;@1;)
      loop ;; label = @2
        block ;; label = @3
          local.get 0
          i64.load offset=40
          local.get 0
          i64.load offset=48
          i64.eq
          br_if 0 (;@3;)
          local.get 0
          i64.const 0
          i64.const 0
          local.get 0
          i64.load offset=64
          i32.wrap_i64
          call_indirect (type 0)
          drop
        end
        block ;; label = @3
          local.get 0
          i64.load offset=8
          local.tee 1
          local.get 0
          i64.load offset=16
          local.tee 2
          i64.eq
          br_if 0 (;@3;)
          local.get 0
          local.get 1
          local.get 2
          i64.sub
          i32.const 1
          local.get 0
          i64.load offset=72
          i32.wrap_i64
          call_indirect (type 1)
          drop
        end
        local.get 0
        i64.load offset=104
        local.tee 0
        i64.const 0
        i64.ne
        br_if 0 (;@2;)
      end
    end
    block ;; label = @1
      i64.const 0
      i64.load offset=5888
      local.tee 0
      i64.eqz
      br_if 0 (;@1;)
      block ;; label = @2
        local.get 0
        i64.load offset=40
        local.get 0
        i64.load offset=48
        i64.eq
        br_if 0 (;@2;)
        local.get 0
        i64.const 0
        i64.const 0
        local.get 0
        i64.load offset=64
        i32.wrap_i64
        call_indirect (type 0)
        drop
      end
      local.get 0
      i64.load offset=8
      local.tee 1
      local.get 0
      i64.load offset=16
      local.tee 2
      i64.eq
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      local.get 2
      i64.sub
      i32.const 1
      local.get 0
      i64.load offset=72
      i32.wrap_i64
      call_indirect (type 1)
      drop
    end
    block ;; label = @1
      i64.const 0
      i64.load offset=3640
      local.tee 0
      i64.eqz
      br_if 0 (;@1;)
      block ;; label = @2
        local.get 0
        i64.load offset=40
        local.get 0
        i64.load offset=48
        i64.eq
        br_if 0 (;@2;)
        local.get 0
        i64.const 0
        i64.const 0
        local.get 0
        i64.load offset=64
        i32.wrap_i64
        call_indirect (type 0)
        drop
      end
      local.get 0
      i64.load offset=8
      local.tee 1
      local.get 0
      i64.load offset=16
      local.tee 2
      i64.eq
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      local.get 2
      i64.sub
      i32.const 1
      local.get 0
      i64.load offset=72
      i32.wrap_i64
      call_indirect (type 1)
      drop
    end
    block ;; label = @1
      i64.const 0
      i64.load offset=3832
      local.tee 0
      i64.eqz
      br_if 0 (;@1;)
      block ;; label = @2
        local.get 0
        i64.load offset=40
        local.get 0
        i64.load offset=48
        i64.eq
        br_if 0 (;@2;)
        local.get 0
        i64.const 0
        i64.const 0
        local.get 0
        i64.load offset=64
        i32.wrap_i64
        call_indirect (type 0)
        drop
      end
      local.get 0
      i64.load offset=8
      local.tee 1
      local.get 0
      i64.load offset=16
      local.tee 2
      i64.eq
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      local.get 2
      i64.sub
      i32.const 1
      local.get 0
      i64.load offset=72
      i32.wrap_i64
      call_indirect (type 1)
      drop
    end
  )
  (func $__towrite (;45;) (type 14) (param i64) (result i32)
    (local i32 i64)
    local.get 0
    local.get 0
    i32.load offset=116
    local.tee 1
    i32.const -1
    i32.add
    local.get 1
    i32.or
    i32.store offset=116
    block ;; label = @1
      local.get 0
      i32.load
      local.tee 1
      i32.const 8
      i32.and
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      i32.const 32
      i32.or
      i32.store
      i32.const -1
      return
    end
    local.get 0
    i64.const 0
    i64.store offset=8
    local.get 0
    i64.const 16
    i64.add
    i64.const 0
    i64.store
    local.get 0
    local.get 0
    i64.load offset=80
    local.tee 2
    i64.store offset=48
    local.get 0
    local.get 2
    i64.store offset=40
    local.get 0
    local.get 2
    local.get 0
    i64.load offset=88
    i64.add
    i64.store offset=32
    i32.const 0
  )
  (func $__fwritex (;46;) (type 0) (param i64 i64 i64) (result i64)
    (local i64 i64 i64 i64 i64)
    i64.const 0
    local.set 3
    block ;; label = @1
      block ;; label = @2
        local.get 2
        i64.load offset=32
        local.tee 4
        i64.const 0
        i64.ne
        br_if 0 (;@2;)
        local.get 2
        call $__towrite
        br_if 1 (;@1;)
        local.get 2
        i64.load offset=32
        local.set 4
      end
      block ;; label = @2
        local.get 4
        local.get 2
        i64.load offset=40
        local.tee 5
        i64.sub
        local.get 1
        i64.ge_u
        br_if 0 (;@2;)
        local.get 2
        local.get 0
        local.get 1
        local.get 2
        i64.load offset=64
        i32.wrap_i64
        call_indirect (type 0)
        return
      end
      i64.const 0
      local.set 6
      block ;; label = @2
        local.get 2
        i32.load offset=120
        i32.const 0
        i32.lt_s
        br_if 0 (;@2;)
        local.get 0
        local.set 3
        i64.const 0
        local.set 4
        loop ;; label = @3
          local.get 1
          local.get 4
          i64.eq
          br_if 1 (;@2;)
          local.get 4
          i64.const 1
          i64.add
          local.set 4
          local.get 3
          i64.const -1
          i64.add
          local.tee 3
          local.get 1
          i64.add
          local.tee 7
          i32.load8_u
          i32.const 10
          i32.ne
          br_if 0 (;@3;)
        end
        local.get 2
        local.get 0
        local.get 1
        local.get 4
        i64.sub
        i64.const 1
        i64.add
        local.tee 6
        local.get 2
        i64.load offset=64
        i32.wrap_i64
        call_indirect (type 0)
        local.tee 3
        local.get 6
        i64.lt_u
        br_if 1 (;@1;)
        local.get 4
        i64.const -1
        i64.add
        local.set 1
        local.get 7
        i64.const 1
        i64.add
        local.set 0
        local.get 2
        i64.load offset=40
        local.set 5
      end
      local.get 5
      local.get 0
      local.get 1
      call $memcpy
      drop
      local.get 2
      local.get 2
      i64.load offset=40
      local.get 1
      i64.add
      i64.store offset=40
      local.get 6
      local.get 1
      i64.add
      local.set 3
    end
    local.get 3
  )
  (func $fwrite (;47;) (type 17) (param i64 i64 i64 i64) (result i64)
    (local i64 i64 i64 i64 i64 i64)
    local.get 2
    local.get 1
    i64.mul
    local.set 4
    block ;; label = @1
      block ;; label = @2
        local.get 3
        i64.load offset=32
        local.tee 5
        i64.const 0
        i64.ne
        br_if 0 (;@2;)
        i64.const 0
        local.set 6
        local.get 3
        call $__towrite
        br_if 1 (;@1;)
        local.get 3
        i64.load offset=32
        local.set 5
      end
      block ;; label = @2
        local.get 5
        local.get 3
        i64.load offset=40
        local.tee 7
        i64.sub
        local.get 4
        i64.ge_u
        br_if 0 (;@2;)
        local.get 3
        local.get 0
        local.get 4
        local.get 3
        i64.load offset=64
        i32.wrap_i64
        call_indirect (type 0)
        local.set 6
        br 1 (;@1;)
      end
      block ;; label = @2
        block ;; label = @3
          local.get 3
          i32.load offset=120
          i32.const 0
          i32.ge_s
          br_if 0 (;@3;)
          i64.const 0
          local.set 8
          local.get 4
          local.set 5
          br 1 (;@2;)
        end
        local.get 0
        local.get 4
        i64.add
        local.set 6
        i64.const 0
        local.set 8
        i64.const 0
        local.set 5
        loop ;; label = @3
          block ;; label = @4
            local.get 4
            local.get 5
            i64.add
            i64.eqz
            i32.eqz
            br_if 0 (;@4;)
            local.get 4
            local.set 5
            br 2 (;@2;)
          end
          local.get 5
          i64.const -1
          i64.add
          local.tee 5
          local.get 6
          i64.add
          local.tee 9
          i32.load8_u
          i32.const 10
          i32.ne
          br_if 0 (;@3;)
        end
        local.get 3
        local.get 0
        local.get 4
        local.get 5
        i64.add
        i64.const 1
        i64.add
        local.tee 8
        local.get 3
        i64.load offset=64
        i32.wrap_i64
        call_indirect (type 0)
        local.tee 6
        local.get 8
        i64.lt_u
        br_if 1 (;@1;)
        local.get 5
        i64.const -1
        i64.xor
        local.set 5
        local.get 9
        i64.const 1
        i64.add
        local.set 0
        local.get 3
        i64.load offset=40
        local.set 7
      end
      local.get 7
      local.get 0
      local.get 5
      call $memcpy
      drop
      local.get 3
      local.get 3
      i64.load offset=40
      local.get 5
      i64.add
      i64.store offset=40
      local.get 8
      local.get 5
      i64.add
      local.set 6
    end
    block ;; label = @1
      local.get 6
      local.get 4
      i64.ne
      br_if 0 (;@1;)
      i64.const 0
      local.get 2
      local.get 1
      i64.eqz
      select
      return
    end
    local.get 6
    local.get 1
    i64.div_u
  )
  (func $#func48<dummy> (@name "dummy") (;48;) (type 9) (param i64 i64) (result i64)
    local.get 0
  )
  (func $__lctrans (;49;) (type 9) (param i64 i64) (result i64)
    local.get 0
    local.get 1
    call $#func48<dummy>
  )
  (func $strerror (;50;) (type 18) (param i32) (result i64)
    (local i64)
    block ;; label = @1
      i64.const 0
      i64.load offset=5944
      local.tee 1
      i64.const 0
      i64.ne
      br_if 0 (;@1;)
      i64.const 5896
      local.set 1
      i64.const 0
      i64.const 5896
      i64.store offset=5944
    end
    i32.const 0
    local.get 0
    local.get 0
    i32.const 76
    i32.gt_u
    select
    i64.extend_i32_u
    i64.const 1
    i64.shl
    i64.const 2816
    i64.add
    i64.load16_u
    i64.const 1251
    i64.add
    local.get 1
    i64.load offset=40
    call $__lctrans
  )
  (func $wcrtomb (;51;) (type 19) (param i64 i32 i64) (result i64)
    (local i64)
    i64.const 1
    local.set 3
    block ;; label = @1
      local.get 0
      i64.eqz
      br_if 0 (;@1;)
      block ;; label = @2
        local.get 1
        i32.const 127
        i32.gt_u
        br_if 0 (;@2;)
        local.get 0
        local.get 1
        i32.store8
        i64.const 1
        return
      end
      block ;; label = @2
        block ;; label = @3
          i64.const 0
          i64.load offset=5896
          i64.const 0
          i64.ne
          br_if 0 (;@3;)
          block ;; label = @4
            local.get 1
            i32.const -128
            i32.and
            i32.const 57216
            i32.eq
            br_if 0 (;@4;)
            i64.const 0
            i32.const 25
            i32.store offset=4832
            br 2 (;@2;)
          end
          local.get 0
          local.get 1
          i32.store8
          i64.const 1
          return
        end
        block ;; label = @3
          local.get 1
          i32.const 2047
          i32.gt_u
          br_if 0 (;@3;)
          local.get 0
          local.get 1
          i32.const 63
          i32.and
          i32.const 128
          i32.or
          i32.store8 offset=1
          local.get 0
          local.get 1
          i32.const 6
          i32.shr_u
          i32.const 192
          i32.or
          i32.store8
          i64.const 2
          return
        end
        block ;; label = @3
          block ;; label = @4
            local.get 1
            i32.const 55296
            i32.lt_u
            br_if 0 (;@4;)
            local.get 1
            i32.const -8192
            i32.and
            i32.const 57344
            i32.ne
            br_if 1 (;@3;)
          end
          local.get 0
          local.get 1
          i32.const 63
          i32.and
          i32.const 128
          i32.or
          i32.store8 offset=2
          local.get 0
          local.get 1
          i32.const 12
          i32.shr_u
          i32.const 224
          i32.or
          i32.store8
          local.get 0
          local.get 1
          i32.const 6
          i32.shr_u
          i32.const 63
          i32.and
          i32.const 128
          i32.or
          i32.store8 offset=1
          i64.const 3
          return
        end
        block ;; label = @3
          local.get 1
          i32.const -65536
          i32.add
          i32.const 1048575
          i32.gt_u
          br_if 0 (;@3;)
          local.get 0
          local.get 1
          i32.const 63
          i32.and
          i32.const 128
          i32.or
          i32.store8 offset=3
          local.get 0
          local.get 1
          i32.const 18
          i32.shr_u
          i32.const 240
          i32.or
          i32.store8
          local.get 0
          local.get 1
          i32.const 6
          i32.shr_u
          i32.const 63
          i32.and
          i32.const 128
          i32.or
          i32.store8 offset=2
          local.get 0
          local.get 1
          i32.const 12
          i32.shr_u
          i32.const 63
          i32.and
          i32.const 128
          i32.or
          i32.store8 offset=1
          i64.const 4
          return
        end
        i64.const 0
        i32.const 25
        i32.store offset=4832
      end
      i64.const -1
      local.set 3
    end
    local.get 3
  )
  (func $wctomb (;52;) (type 20) (param i64 i32) (result i32)
    block ;; label = @1
      local.get 0
      i64.eqz
      i32.eqz
      br_if 0 (;@1;)
      i32.const 0
      return
    end
    local.get 0
    local.get 1
    i64.const 0
    call $wcrtomb
    i32.wrap_i64
  )
  (func $frexp (;53;) (type 21) (param f64 i64) (result f64)
    (local i64 i32)
    block ;; label = @1
      local.get 0
      i64.reinterpret_f64
      local.tee 2
      i64.const 52
      i64.shr_u
      i32.wrap_i64
      i32.const 2047
      i32.and
      local.tee 3
      i32.const 2047
      i32.eq
      br_if 0 (;@1;)
      block ;; label = @2
        local.get 3
        br_if 0 (;@2;)
        block ;; label = @3
          local.get 0
          f64.const 0x0p+0 (;=0;)
          f64.ne
          br_if 0 (;@3;)
          local.get 1
          i32.const 0
          i32.store
          local.get 0
          return
        end
        local.get 0
        f64.const 0x1p+64 (;=18446744073709552000;)
        f64.mul
        local.get 1
        call $frexp
        local.set 0
        local.get 1
        local.get 1
        i32.load
        i32.const -64
        i32.add
        i32.store
        local.get 0
        return
      end
      local.get 1
      local.get 3
      i32.const -1022
      i32.add
      i32.store
      local.get 2
      i64.const -9218868437227405313
      i64.and
      i64.const 4602678819172646912
      i64.or
      f64.reinterpret_i64
      local.set 0
    end
    local.get 0
  )
  (func $fputs (;54;) (type 2) (param i64 i64) (result i32)
    (local i64)
    local.get 0
    call $strlen
    local.set 2
    i32.const -1
    i32.const 0
    local.get 2
    local.get 0
    i64.const 1
    local.get 2
    local.get 1
    call $fwrite
    i64.ne
    select
  )
  (func $vfprintf (;55;) (type 22) (param i64 i64 i64) (result i32)
    (local i64 i32 i32 i32)
    global.get $__stack_pointer
    i64.const 224
    i64.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    local.get 2
    i64.store offset=216
    local.get 3
    i64.const 192
    i64.add
    i64.const 0
    i64.store
    local.get 3
    i64.const 184
    i64.add
    i64.const 0
    i64.store
    local.get 3
    i64.const 176
    i64.add
    i64.const 0
    i64.store
    local.get 3
    i64.const 0
    i64.store offset=168
    local.get 3
    i64.const 0
    i64.store offset=160
    local.get 3
    local.get 2
    i64.store offset=208
    block ;; label = @1
      block ;; label = @2
        i64.const 0
        local.get 1
        local.get 3
        i64.const 208
        i64.add
        local.get 3
        i64.const 80
        i64.add
        local.get 3
        i64.const 160
        i64.add
        call $printf_core
        i32.const 0
        i32.ge_s
        br_if 0 (;@2;)
        i32.const -1
        local.set 4
        br 1 (;@1;)
      end
      local.get 0
      i32.load
      local.set 5
      block ;; label = @2
        local.get 0
        i32.load offset=116
        i32.const 0
        i32.gt_s
        br_if 0 (;@2;)
        local.get 0
        local.get 5
        i32.const -33
        i32.and
        i32.store
      end
      i64.const 0
      local.set 2
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            block ;; label = @5
              local.get 0
              i64.load offset=88
              i64.const 0
              i64.ne
              br_if 0 (;@5;)
              local.get 0
              i64.const 80
              i64.store offset=88
              local.get 0
              i64.const 0
              i64.store offset=32
              local.get 0
              i64.const 40
              i64.add
              i64.const 0
              i64.store
              local.get 0
              i64.const 48
              i64.add
              i64.const 0
              i64.store
              local.get 0
              i64.load offset=80
              local.set 2
              local.get 0
              local.get 3
              i64.store offset=80
              br 1 (;@4;)
            end
            local.get 0
            i64.load offset=32
            i64.const 0
            i64.ne
            br_if 1 (;@3;)
          end
          i32.const -1
          local.set 4
          local.get 0
          call $__towrite
          br_if 1 (;@2;)
        end
        local.get 0
        local.get 1
        local.get 3
        i64.const 208
        i64.add
        local.get 3
        i64.const 80
        i64.add
        local.get 3
        i64.const 160
        i64.add
        call $printf_core
        local.set 4
      end
      local.get 5
      i32.const 32
      i32.and
      local.set 5
      block ;; label = @2
        local.get 2
        i64.eqz
        br_if 0 (;@2;)
        local.get 0
        i64.const 0
        i64.const 0
        local.get 0
        i64.load offset=64
        i32.wrap_i64
        call_indirect (type 0)
        drop
        local.get 0
        i64.const 0
        i64.store offset=88
        local.get 0
        local.get 2
        i64.store offset=80
        local.get 0
        i64.const 0
        i64.store offset=32
        local.get 0
        i64.const 48
        i64.add
        i64.const 0
        i64.store
        local.get 0
        i64.load offset=40
        local.set 2
        local.get 0
        i64.const 0
        i64.store offset=40
        i32.const -1
        local.get 4
        local.get 2
        i64.eqz
        select
        local.set 4
      end
      local.get 0
      local.get 0
      i32.load
      local.tee 6
      local.get 5
      i32.or
      i32.store
      i32.const -1
      local.get 4
      local.get 6
      i32.const 32
      i32.and
      select
      local.set 4
    end
    local.get 3
    i64.const 224
    i64.add
    global.set $__stack_pointer
    local.get 4
  )
  (func $printf_core (;56;) (type 23) (param i64 i64 i64 i64 i64) (result i32)
    (local i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i32 i32 i32 i64 i64 i64 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i64 f64 i32 i64 i32 i64 i64 f64 i64)
    global.get $__stack_pointer
    i64.const 880
    i64.sub
    local.tee 5
    global.set $__stack_pointer
    local.get 5
    i64.const 68
    i64.add
    i64.const 12
    i64.add
    local.set 6
    i64.const 0
    local.get 5
    i64.const 112
    i64.add
    i64.sub
    local.set 7
    local.get 5
    i64.const -3988
    i64.add
    local.set 8
    local.get 5
    i64.const 55
    i64.add
    local.set 9
    local.get 5
    i64.const 68
    i64.add
    i64.const 11
    i64.add
    local.set 10
    local.get 5
    i64.const 80
    i64.add
    i64.const 8
    i64.or
    local.set 11
    local.get 5
    i64.const 80
    i64.add
    i64.const 9
    i64.or
    local.set 12
    local.get 5
    i64.const 68
    i64.add
    i64.const 10
    i64.add
    local.set 13
    local.get 5
    i64.const 56
    i64.add
    local.set 14
    i32.const 0
    local.set 15
    i32.const 0
    local.set 16
    i32.const 0
    local.set 17
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          loop ;; label = @4
            local.get 1
            local.set 18
            local.get 17
            local.get 16
            i32.const 2147483647
            i32.xor
            i32.gt_s
            br_if 1 (;@3;)
            local.get 17
            local.get 16
            i32.add
            local.set 16
            block ;; label = @5
              block ;; label = @6
                block ;; label = @7
                  block ;; label = @8
                    block ;; label = @9
                      block ;; label = @10
                        block ;; label = @11
                          block ;; label = @12
                            block ;; label = @13
                              block ;; label = @14
                                block ;; label = @15
                                  local.get 18
                                  i32.load8_u
                                  local.tee 17
                                  i32.eqz
                                  br_if 0 (;@15;)
                                  local.get 18
                                  local.set 1
                                  loop ;; label = @16
                                    block ;; label = @17
                                      block ;; label = @18
                                        block ;; label = @19
                                          local.get 17
                                          i32.const 255
                                          i32.and
                                          local.tee 17
                                          i32.eqz
                                          br_if 0 (;@19;)
                                          local.get 17
                                          i32.const 37
                                          i32.ne
                                          br_if 2 (;@17;)
                                          local.get 1
                                          local.set 19
                                          local.get 1
                                          local.set 20
                                          loop ;; label = @20
                                            block ;; label = @21
                                              local.get 20
                                              i32.load8_u offset=1
                                              i32.const 37
                                              i32.eq
                                              br_if 0 (;@21;)
                                              local.get 20
                                              local.set 1
                                              br 3 (;@18;)
                                            end
                                            local.get 19
                                            i64.const 1
                                            i64.add
                                            local.set 19
                                            local.get 20
                                            i32.load8_u offset=2
                                            local.set 17
                                            local.get 20
                                            i64.const 2
                                            i64.add
                                            local.tee 1
                                            local.set 20
                                            local.get 17
                                            i32.const 37
                                            i32.eq
                                            br_if 0 (;@20;)
                                            br 2 (;@18;)
                                          end
                                        end
                                        local.get 1
                                        local.set 19
                                      end
                                      local.get 19
                                      local.get 18
                                      i64.sub
                                      local.tee 20
                                      local.get 16
                                      i32.const 2147483647
                                      i32.xor
                                      local.tee 21
                                      i64.extend_i32_u
                                      i64.gt_s
                                      br_if 14 (;@3;)
                                      local.get 20
                                      i32.wrap_i64
                                      local.set 17
                                      block ;; label = @18
                                        local.get 0
                                        i64.eqz
                                        local.tee 22
                                        br_if 0 (;@18;)
                                        local.get 0
                                        i32.load8_u
                                        i32.const 32
                                        i32.and
                                        br_if 0 (;@18;)
                                        local.get 18
                                        local.get 20
                                        i64.extend32_s
                                        local.get 0
                                        call $__fwritex
                                        drop
                                      end
                                      local.get 17
                                      br_if 13 (;@4;)
                                      local.get 1
                                      i64.const 1
                                      i64.add
                                      local.set 20
                                      i32.const -1
                                      local.set 23
                                      block ;; label = @18
                                        local.get 1
                                        i32.load8_s offset=1
                                        local.tee 24
                                        i32.const -48
                                        i32.add
                                        local.tee 17
                                        i32.const 9
                                        i32.gt_u
                                        br_if 0 (;@18;)
                                        local.get 1
                                        i32.load8_u offset=2
                                        i32.const 36
                                        i32.ne
                                        br_if 0 (;@18;)
                                        local.get 1
                                        i64.const 3
                                        i64.add
                                        local.set 20
                                        local.get 1
                                        i32.load8_s offset=3
                                        local.set 24
                                        i32.const 1
                                        local.set 15
                                        local.get 17
                                        local.set 23
                                      end
                                      i32.const 0
                                      local.set 25
                                      block ;; label = @18
                                        local.get 24
                                        i32.const -32
                                        i32.add
                                        local.tee 17
                                        i32.const 31
                                        i32.gt_u
                                        br_if 0 (;@18;)
                                        i32.const 1
                                        local.get 17
                                        i32.shl
                                        local.tee 17
                                        i32.const 75913
                                        i32.and
                                        i32.eqz
                                        br_if 0 (;@18;)
                                        local.get 20
                                        i64.const 1
                                        i64.add
                                        local.set 1
                                        i32.const 0
                                        local.set 25
                                        loop ;; label = @19
                                          local.get 17
                                          local.get 25
                                          i32.or
                                          local.set 25
                                          local.get 1
                                          local.tee 20
                                          i32.load8_s
                                          local.tee 24
                                          i32.const -32
                                          i32.add
                                          local.tee 17
                                          i32.const 32
                                          i32.ge_u
                                          br_if 1 (;@18;)
                                          local.get 20
                                          i64.const 1
                                          i64.add
                                          local.set 1
                                          i32.const 1
                                          local.get 17
                                          i32.shl
                                          local.tee 17
                                          i32.const 75913
                                          i32.and
                                          br_if 0 (;@19;)
                                        end
                                      end
                                      block ;; label = @18
                                        local.get 24
                                        i32.const 42
                                        i32.ne
                                        br_if 0 (;@18;)
                                        block ;; label = @19
                                          block ;; label = @20
                                            local.get 20
                                            i32.load8_s offset=1
                                            i32.const -48
                                            i32.add
                                            local.tee 17
                                            i32.const 9
                                            i32.gt_u
                                            br_if 0 (;@20;)
                                            local.get 20
                                            i32.load8_u offset=2
                                            i32.const 36
                                            i32.ne
                                            br_if 0 (;@20;)
                                            local.get 4
                                            local.get 17
                                            i64.extend_i32_u
                                            i64.const 2
                                            i64.shl
                                            i64.add
                                            i32.const 10
                                            i32.store
                                            local.get 20
                                            i64.const 3
                                            i64.add
                                            local.set 19
                                            local.get 20
                                            i64.load8_s offset=1
                                            i64.const 3
                                            i64.shl
                                            local.get 3
                                            i64.add
                                            i64.const -384
                                            i64.add
                                            i32.load
                                            local.set 26
                                            i32.const 1
                                            local.set 15
                                            br 1 (;@19;)
                                          end
                                          local.get 15
                                          br_if 6 (;@13;)
                                          local.get 20
                                          i64.const 1
                                          i64.add
                                          local.set 19
                                          block ;; label = @20
                                            local.get 22
                                            i32.eqz
                                            br_if 0 (;@20;)
                                            i32.const 0
                                            local.set 15
                                            i32.const 0
                                            local.set 26
                                            br 6 (;@14;)
                                          end
                                          local.get 2
                                          local.get 2
                                          i64.load
                                          local.tee 1
                                          i64.const 4
                                          i64.add
                                          i64.store
                                          local.get 1
                                          i32.load
                                          local.set 26
                                          i32.const 0
                                          local.set 15
                                        end
                                        local.get 26
                                        i32.const -1
                                        i32.gt_s
                                        br_if 4 (;@14;)
                                        i32.const 0
                                        local.get 26
                                        i32.sub
                                        local.set 26
                                        local.get 25
                                        i32.const 8192
                                        i32.or
                                        local.set 25
                                        br 4 (;@14;)
                                      end
                                      i32.const 0
                                      local.set 26
                                      block ;; label = @18
                                        local.get 24
                                        i32.const -48
                                        i32.add
                                        local.tee 17
                                        i32.const 9
                                        i32.le_u
                                        br_if 0 (;@18;)
                                        local.get 20
                                        local.set 19
                                        br 4 (;@14;)
                                      end
                                      i32.const 0
                                      local.set 26
                                      loop ;; label = @18
                                        block ;; label = @19
                                          local.get 26
                                          i32.const 214748364
                                          i32.gt_u
                                          br_if 0 (;@19;)
                                          i32.const -1
                                          local.get 26
                                          i32.const 10
                                          i32.mul
                                          local.tee 24
                                          local.get 17
                                          i32.add
                                          local.get 17
                                          local.get 24
                                          i32.const 2147483647
                                          i32.xor
                                          i32.gt_u
                                          select
                                          local.set 26
                                          local.get 20
                                          i32.load8_s offset=1
                                          local.set 17
                                          local.get 20
                                          i64.const 1
                                          i64.add
                                          local.tee 19
                                          local.set 20
                                          local.get 17
                                          i32.const -48
                                          i32.add
                                          local.tee 17
                                          i32.const 10
                                          i32.lt_u
                                          br_if 1 (;@18;)
                                          local.get 26
                                          i32.const 0
                                          i32.lt_s
                                          br_if 16 (;@3;)
                                          br 5 (;@14;)
                                        end
                                        local.get 20
                                        i32.load8_s offset=1
                                        local.set 17
                                        i32.const -1
                                        local.set 26
                                        local.get 20
                                        i64.const 1
                                        i64.add
                                        local.set 20
                                        local.get 17
                                        i32.const -48
                                        i32.add
                                        local.tee 17
                                        i32.const 10
                                        i32.lt_u
                                        br_if 0 (;@18;)
                                        br 15 (;@3;)
                                      end
                                    end
                                    local.get 1
                                    i32.load8_u offset=1
                                    local.set 17
                                    local.get 1
                                    i64.const 1
                                    i64.add
                                    local.set 1
                                    br 0 (;@16;)
                                  end
                                end
                                local.get 0
                                i64.const 0
                                i64.ne
                                br_if 13 (;@1;)
                                block ;; label = @15
                                  local.get 15
                                  br_if 0 (;@15;)
                                  i32.const 0
                                  local.set 16
                                  br 14 (;@1;)
                                end
                                block ;; label = @15
                                  block ;; label = @16
                                    local.get 4
                                    i32.load offset=4
                                    local.tee 17
                                    br_if 0 (;@16;)
                                    i64.const 1
                                    local.set 1
                                    br 1 (;@15;)
                                  end
                                  local.get 3
                                  i64.const 8
                                  i64.add
                                  local.get 17
                                  local.get 2
                                  call $pop_arg
                                  block ;; label = @16
                                    local.get 4
                                    i32.load offset=8
                                    local.tee 17
                                    br_if 0 (;@16;)
                                    i64.const 2
                                    local.set 1
                                    br 1 (;@15;)
                                  end
                                  local.get 3
                                  i64.const 16
                                  i64.add
                                  local.get 17
                                  local.get 2
                                  call $pop_arg
                                  block ;; label = @16
                                    local.get 4
                                    i32.load offset=12
                                    local.tee 17
                                    br_if 0 (;@16;)
                                    i64.const 3
                                    local.set 1
                                    br 1 (;@15;)
                                  end
                                  local.get 3
                                  i64.const 24
                                  i64.add
                                  local.get 17
                                  local.get 2
                                  call $pop_arg
                                  block ;; label = @16
                                    local.get 4
                                    i32.load offset=16
                                    local.tee 17
                                    br_if 0 (;@16;)
                                    i64.const 4
                                    local.set 1
                                    br 1 (;@15;)
                                  end
                                  local.get 3
                                  i64.const 32
                                  i64.add
                                  local.get 17
                                  local.get 2
                                  call $pop_arg
                                  block ;; label = @16
                                    local.get 4
                                    i32.load offset=20
                                    local.tee 17
                                    br_if 0 (;@16;)
                                    i64.const 5
                                    local.set 1
                                    br 1 (;@15;)
                                  end
                                  local.get 3
                                  i64.const 40
                                  i64.add
                                  local.get 17
                                  local.get 2
                                  call $pop_arg
                                  block ;; label = @16
                                    local.get 4
                                    i32.load offset=24
                                    local.tee 17
                                    br_if 0 (;@16;)
                                    i64.const 6
                                    local.set 1
                                    br 1 (;@15;)
                                  end
                                  local.get 3
                                  i64.const 48
                                  i64.add
                                  local.get 17
                                  local.get 2
                                  call $pop_arg
                                  block ;; label = @16
                                    local.get 4
                                    i32.load offset=28
                                    local.tee 17
                                    br_if 0 (;@16;)
                                    i64.const 7
                                    local.set 1
                                    br 1 (;@15;)
                                  end
                                  local.get 3
                                  i64.const 56
                                  i64.add
                                  local.get 17
                                  local.get 2
                                  call $pop_arg
                                  block ;; label = @16
                                    local.get 4
                                    i32.load offset=32
                                    local.tee 17
                                    br_if 0 (;@16;)
                                    i64.const 8
                                    local.set 1
                                    br 1 (;@15;)
                                  end
                                  local.get 3
                                  i64.const 64
                                  i64.add
                                  local.get 17
                                  local.get 2
                                  call $pop_arg
                                  block ;; label = @16
                                    local.get 4
                                    i32.load offset=36
                                    local.tee 17
                                    br_if 0 (;@16;)
                                    i64.const 9
                                    local.set 1
                                    br 1 (;@15;)
                                  end
                                  local.get 3
                                  i64.const 72
                                  i64.add
                                  local.get 17
                                  local.get 2
                                  call $pop_arg
                                  i32.const 1
                                  local.set 16
                                  br 14 (;@1;)
                                end
                                local.get 1
                                i64.const 2
                                i64.shl
                                local.set 1
                                loop ;; label = @15
                                  local.get 4
                                  local.get 1
                                  i64.add
                                  i32.load
                                  br_if 2 (;@13;)
                                  local.get 1
                                  i64.const 4
                                  i64.add
                                  local.tee 1
                                  i64.const 40
                                  i64.ne
                                  br_if 0 (;@15;)
                                end
                                i32.const 1
                                local.set 16
                                br 13 (;@1;)
                              end
                              i32.const 0
                              local.set 17
                              i32.const -1
                              local.set 27
                              block ;; label = @14
                                block ;; label = @15
                                  local.get 19
                                  i32.load8_u
                                  i32.const 46
                                  i32.eq
                                  br_if 0 (;@15;)
                                  local.get 19
                                  local.set 1
                                  i32.const 0
                                  local.set 28
                                  br 1 (;@14;)
                                end
                                block ;; label = @15
                                  local.get 19
                                  i32.load8_s offset=1
                                  local.tee 24
                                  i32.const 42
                                  i32.ne
                                  br_if 0 (;@15;)
                                  block ;; label = @16
                                    block ;; label = @17
                                      local.get 19
                                      i32.load8_s offset=2
                                      i32.const -48
                                      i32.add
                                      local.tee 24
                                      i32.const 9
                                      i32.gt_u
                                      br_if 0 (;@17;)
                                      local.get 19
                                      i32.load8_u offset=3
                                      i32.const 36
                                      i32.ne
                                      br_if 0 (;@17;)
                                      local.get 4
                                      local.get 24
                                      i64.extend_i32_u
                                      i64.const 2
                                      i64.shl
                                      i64.add
                                      i32.const 10
                                      i32.store
                                      local.get 19
                                      i64.const 4
                                      i64.add
                                      local.set 1
                                      local.get 19
                                      i64.load8_s offset=2
                                      i64.const 3
                                      i64.shl
                                      local.get 3
                                      i64.add
                                      i64.const -384
                                      i64.add
                                      i32.load
                                      local.set 27
                                      br 1 (;@16;)
                                    end
                                    local.get 15
                                    br_if 3 (;@13;)
                                    local.get 19
                                    i64.const 2
                                    i64.add
                                    local.set 1
                                    block ;; label = @17
                                      local.get 22
                                      i32.eqz
                                      br_if 0 (;@17;)
                                      i32.const 0
                                      local.set 27
                                      br 1 (;@16;)
                                    end
                                    local.get 2
                                    local.get 2
                                    i64.load
                                    local.tee 20
                                    i64.const 4
                                    i64.add
                                    i64.store
                                    local.get 20
                                    i32.load
                                    local.set 27
                                  end
                                  local.get 27
                                  i32.const -1
                                  i32.xor
                                  i32.const 31
                                  i32.shr_u
                                  local.set 28
                                  br 1 (;@14;)
                                end
                                local.get 19
                                i64.const 1
                                i64.add
                                local.set 1
                                i32.const 1
                                local.set 28
                                i32.const 0
                                local.set 27
                                local.get 24
                                i32.const -48
                                i32.add
                                local.tee 29
                                i32.const 9
                                i32.gt_u
                                br_if 0 (;@14;)
                                i32.const 0
                                local.set 24
                                loop ;; label = @15
                                  i32.const -1
                                  local.set 27
                                  block ;; label = @16
                                    local.get 24
                                    i32.const 214748364
                                    i32.gt_u
                                    br_if 0 (;@16;)
                                    i32.const -1
                                    local.get 24
                                    i32.const 10
                                    i32.mul
                                    local.tee 24
                                    local.get 29
                                    i32.add
                                    local.get 29
                                    local.get 24
                                    i32.const 2147483647
                                    i32.xor
                                    i32.gt_u
                                    select
                                    local.set 27
                                  end
                                  local.get 1
                                  i32.load8_s offset=1
                                  local.set 29
                                  local.get 27
                                  local.set 24
                                  local.get 1
                                  i64.const 1
                                  i64.add
                                  local.tee 20
                                  local.set 1
                                  local.get 29
                                  i32.const -48
                                  i32.add
                                  local.tee 29
                                  i32.const 10
                                  i32.lt_u
                                  br_if 0 (;@15;)
                                end
                                local.get 20
                                local.set 1
                              end
                              loop ;; label = @14
                                local.get 17
                                local.set 24
                                local.get 1
                                i32.load8_s
                                local.tee 17
                                i32.const -123
                                i32.add
                                i32.const -58
                                i32.lt_u
                                br_if 1 (;@13;)
                                local.get 1
                                i64.const 1
                                i64.add
                                local.set 1
                                local.get 17
                                i64.extend_i32_s
                                local.get 24
                                i64.extend_i32_u
                                local.tee 20
                                i64.const 58
                                i64.mul
                                i64.add
                                i64.const 2911
                                i64.add
                                i32.load8_u
                                local.tee 17
                                i32.const -1
                                i32.add
                                i32.const 8
                                i32.lt_u
                                br_if 0 (;@14;)
                              end
                              block ;; label = @14
                                block ;; label = @15
                                  block ;; label = @16
                                    local.get 17
                                    i32.const 27
                                    i32.eq
                                    br_if 0 (;@16;)
                                    local.get 17
                                    i32.eqz
                                    br_if 3 (;@13;)
                                    block ;; label = @17
                                      local.get 23
                                      i32.const 0
                                      i32.lt_s
                                      br_if 0 (;@17;)
                                      local.get 4
                                      local.get 23
                                      i64.extend_i32_u
                                      local.tee 19
                                      i64.const 2
                                      i64.shl
                                      i64.add
                                      local.get 17
                                      i32.store
                                      local.get 5
                                      local.get 3
                                      local.get 19
                                      i64.const 3
                                      i64.shl
                                      i64.add
                                      i64.load
                                      i64.store offset=56
                                      br 2 (;@15;)
                                    end
                                    block ;; label = @17
                                      local.get 22
                                      i32.eqz
                                      br_if 0 (;@17;)
                                      i32.const 0
                                      local.set 16
                                      br 16 (;@1;)
                                    end
                                    local.get 5
                                    i64.const 56
                                    i64.add
                                    local.get 17
                                    local.get 2
                                    call $pop_arg
                                    br 2 (;@14;)
                                  end
                                  local.get 23
                                  i32.const -1
                                  i32.gt_s
                                  br_if 2 (;@13;)
                                end
                                i32.const 0
                                local.set 17
                                local.get 22
                                br_if 10 (;@4;)
                              end
                              local.get 25
                              i32.const -65537
                              i32.and
                              local.tee 30
                              local.get 25
                              local.get 25
                              i32.const 8192
                              i32.and
                              select
                              local.set 29
                              block ;; label = @14
                                block ;; label = @15
                                  block ;; label = @16
                                    block ;; label = @17
                                      block ;; label = @18
                                        block ;; label = @19
                                          block ;; label = @20
                                            block ;; label = @21
                                              block ;; label = @22
                                                block ;; label = @23
                                                  block ;; label = @24
                                                    block ;; label = @25
                                                      block ;; label = @26
                                                        block ;; label = @27
                                                          block ;; label = @28
                                                            block ;; label = @29
                                                              block ;; label = @30
                                                                local.get 1
                                                                i64.const -1
                                                                i64.add
                                                                i32.load8_s
                                                                local.tee 17
                                                                i32.const -33
                                                                i32.and
                                                                local.get 17
                                                                local.get 17
                                                                i32.const 15
                                                                i32.and
                                                                i32.const 3
                                                                i32.eq
                                                                select
                                                                local.get 17
                                                                local.get 24
                                                                select
                                                                local.tee 23
                                                                i32.const -65
                                                                i32.add
                                                                br_table 16 (;@14;) 18 (;@12;) 13 (;@17;) 18 (;@12;) 16 (;@14;) 16 (;@14;) 16 (;@14;) 18 (;@12;) 18 (;@12;) 18 (;@12;) 18 (;@12;) 18 (;@12;) 18 (;@12;) 18 (;@12;) 18 (;@12;) 18 (;@12;) 18 (;@12;) 18 (;@12;) 12 (;@18;) 18 (;@12;) 18 (;@12;) 18 (;@12;) 18 (;@12;) 3 (;@27;) 18 (;@12;) 18 (;@12;) 18 (;@12;) 18 (;@12;) 18 (;@12;) 18 (;@12;) 18 (;@12;) 18 (;@12;) 16 (;@14;) 18 (;@12;) 8 (;@22;) 5 (;@25;) 16 (;@14;) 16 (;@14;) 16 (;@14;) 18 (;@12;) 5 (;@25;) 18 (;@12;) 18 (;@12;) 18 (;@12;) 9 (;@21;) 1 (;@29;) 4 (;@26;) 2 (;@28;) 18 (;@12;) 18 (;@12;) 10 (;@20;) 18 (;@12;) 0 (;@30;) 18 (;@12;) 18 (;@12;) 3 (;@27;) 18 (;@12;)
                                                              end
                                                              i32.const 0
                                                              local.set 24
                                                              i64.const 1024
                                                              local.set 31
                                                              local.get 5
                                                              i64.load offset=56
                                                              local.set 20
                                                              br 5 (;@24;)
                                                            end
                                                            i32.const 0
                                                            local.set 17
                                                            block ;; label = @29
                                                              block ;; label = @30
                                                                block ;; label = @31
                                                                  block ;; label = @32
                                                                    block ;; label = @33
                                                                      block ;; label = @34
                                                                        block ;; label = @35
                                                                          local.get 20
                                                                          i64.const 255
                                                                          i64.and
                                                                          i32.wrap_i64
                                                                          br_table 0 (;@35;) 1 (;@34;) 2 (;@33;) 3 (;@32;) 4 (;@31;) 31 (;@4;) 5 (;@30;) 6 (;@29;) 31 (;@4;)
                                                                        end
                                                                        local.get 5
                                                                        i64.load offset=56
                                                                        local.get 16
                                                                        i32.store
                                                                        br 30 (;@4;)
                                                                      end
                                                                      local.get 5
                                                                      i64.load offset=56
                                                                      local.get 16
                                                                      i64.extend_i32_s
                                                                      i64.store
                                                                      br 29 (;@4;)
                                                                    end
                                                                    local.get 5
                                                                    i64.load offset=56
                                                                    local.get 16
                                                                    i64.extend_i32_s
                                                                    i64.store
                                                                    br 28 (;@4;)
                                                                  end
                                                                  local.get 5
                                                                  i64.load offset=56
                                                                  local.get 16
                                                                  i32.store16
                                                                  br 27 (;@4;)
                                                                end
                                                                local.get 5
                                                                i64.load offset=56
                                                                local.get 16
                                                                i32.store8
                                                                br 26 (;@4;)
                                                              end
                                                              local.get 5
                                                              i64.load offset=56
                                                              local.get 16
                                                              i64.extend_i32_s
                                                              i64.store
                                                              br 25 (;@4;)
                                                            end
                                                            local.get 5
                                                            i64.load offset=56
                                                            local.get 16
                                                            i64.extend_i32_s
                                                            i64.store
                                                            br 24 (;@4;)
                                                          end
                                                          local.get 27
                                                          i32.const 16
                                                          local.get 27
                                                          i32.const 16
                                                          i32.gt_u
                                                          select
                                                          local.set 27
                                                          local.get 29
                                                          i32.const 8
                                                          i32.or
                                                          local.set 29
                                                          i32.const 120
                                                          local.set 23
                                                        end
                                                        i32.const 0
                                                        local.set 24
                                                        i64.const 1024
                                                        local.set 31
                                                        local.get 5
                                                        i64.load offset=56
                                                        local.tee 20
                                                        i64.eqz
                                                        br_if 19 (;@7;)
                                                        local.get 23
                                                        i32.const 32
                                                        i32.and
                                                        local.set 22
                                                        local.get 14
                                                        local.set 18
                                                        loop ;; label = @27
                                                          local.get 18
                                                          i64.const -1
                                                          i64.add
                                                          local.tee 18
                                                          local.get 20
                                                          i64.const 15
                                                          i64.and
                                                          i64.const 3440
                                                          i64.add
                                                          i32.load8_u
                                                          local.get 22
                                                          i32.or
                                                          i32.store8
                                                          local.get 20
                                                          i64.const 15
                                                          i64.gt_u
                                                          local.set 17
                                                          local.get 20
                                                          i64.const 4
                                                          i64.shr_u
                                                          local.set 20
                                                          local.get 17
                                                          br_if 0 (;@27;)
                                                        end
                                                        i64.const 1
                                                        local.set 19
                                                        local.get 29
                                                        i32.const 8
                                                        i32.and
                                                        i32.eqz
                                                        br_if 20 (;@6;)
                                                        local.get 23
                                                        i32.const 4
                                                        i32.shr_s
                                                        i64.extend_i32_s
                                                        i64.const 1024
                                                        i64.add
                                                        local.set 31
                                                        i32.const 2
                                                        local.set 24
                                                        br 20 (;@6;)
                                                      end
                                                      local.get 14
                                                      local.set 18
                                                      block ;; label = @26
                                                        local.get 5
                                                        i64.load offset=56
                                                        local.tee 19
                                                        i64.eqz
                                                        br_if 0 (;@26;)
                                                        local.get 14
                                                        local.set 18
                                                        local.get 19
                                                        local.set 20
                                                        loop ;; label = @27
                                                          local.get 18
                                                          i64.const -1
                                                          i64.add
                                                          local.tee 18
                                                          local.get 20
                                                          i32.wrap_i64
                                                          i32.const 7
                                                          i32.and
                                                          i32.const 48
                                                          i32.or
                                                          i32.store8
                                                          local.get 20
                                                          i64.const 7
                                                          i64.gt_u
                                                          local.set 17
                                                          local.get 20
                                                          i64.const 3
                                                          i64.shr_u
                                                          local.set 20
                                                          local.get 17
                                                          br_if 0 (;@27;)
                                                        end
                                                      end
                                                      i32.const 0
                                                      local.set 24
                                                      i64.const 1024
                                                      local.set 31
                                                      local.get 29
                                                      i32.const 8
                                                      i32.and
                                                      i32.eqz
                                                      br_if 19 (;@6;)
                                                      local.get 14
                                                      local.get 18
                                                      i64.sub
                                                      local.tee 20
                                                      local.get 27
                                                      i64.extend_i32_s
                                                      i64.lt_s
                                                      br_if 19 (;@6;)
                                                      local.get 20
                                                      i32.wrap_i64
                                                      i32.const 1
                                                      i32.add
                                                      local.set 27
                                                      br 19 (;@6;)
                                                    end
                                                    block ;; label = @25
                                                      local.get 5
                                                      i64.load offset=56
                                                      local.tee 20
                                                      i64.const -1
                                                      i64.gt_s
                                                      br_if 0 (;@25;)
                                                      local.get 5
                                                      i64.const 0
                                                      local.get 20
                                                      i64.sub
                                                      local.tee 20
                                                      i64.store offset=56
                                                      i64.const 1024
                                                      local.set 31
                                                      i32.const 1
                                                      local.set 24
                                                      br 2 (;@23;)
                                                    end
                                                    block ;; label = @25
                                                      local.get 29
                                                      i32.const 2048
                                                      i32.and
                                                      i32.eqz
                                                      br_if 0 (;@25;)
                                                      i32.const 1
                                                      local.set 24
                                                      i64.const 1025
                                                      local.set 31
                                                      br 1 (;@24;)
                                                    end
                                                    i64.const 1026
                                                    i64.const 1024
                                                    local.get 29
                                                    i32.const 1
                                                    i32.and
                                                    local.tee 24
                                                    select
                                                    local.set 31
                                                  end
                                                  local.get 20
                                                  i64.eqz
                                                  br_if 16 (;@7;)
                                                end
                                                local.get 14
                                                local.set 18
                                                loop ;; label = @23
                                                  local.get 18
                                                  i64.const -1
                                                  i64.add
                                                  local.tee 18
                                                  local.get 20
                                                  local.get 20
                                                  i64.const 10
                                                  i64.div_u
                                                  local.tee 19
                                                  i64.const 10
                                                  i64.mul
                                                  i64.sub
                                                  i32.wrap_i64
                                                  i32.const 48
                                                  i32.or
                                                  i32.store8
                                                  local.get 20
                                                  i64.const 9
                                                  i64.gt_u
                                                  local.set 17
                                                  local.get 19
                                                  local.set 20
                                                  local.get 17
                                                  br_if 0 (;@23;)
                                                end
                                                i64.const 1
                                                local.set 19
                                                br 16 (;@6;)
                                              end
                                              local.get 5
                                              local.get 5
                                              i64.load offset=56
                                              i64.store8 offset=55
                                              i32.const 0
                                              local.set 24
                                              i64.const 1024
                                              local.set 31
                                              i32.const 1
                                              local.set 27
                                              local.get 14
                                              local.set 20
                                              local.get 9
                                              local.set 18
                                              br 16 (;@5;)
                                            end
                                            i64.const 4832
                                            i32.load
                                            call $strerror
                                            local.set 18
                                            br 1 (;@19;)
                                          end
                                          i64.const 1071
                                          local.get 5
                                          i64.load offset=56
                                          local.tee 20
                                          local.get 20
                                          i64.eqz
                                          select
                                          local.set 18
                                        end
                                        local.get 18
                                        local.get 18
                                        local.get 27
                                        i32.const 2147483647
                                        local.get 27
                                        i32.const 2147483647
                                        i32.lt_u
                                        select
                                        i64.extend_i32_u
                                        call $strnlen
                                        local.tee 19
                                        i64.add
                                        local.set 20
                                        block ;; label = @19
                                          local.get 27
                                          i32.const -1
                                          i32.gt_s
                                          br_if 0 (;@19;)
                                          local.get 20
                                          i32.load8_u
                                          br_if 16 (;@3;)
                                        end
                                        local.get 19
                                        i32.wrap_i64
                                        local.set 27
                                        i32.const 0
                                        local.set 24
                                        i64.const 1024
                                        local.set 31
                                        br 13 (;@5;)
                                      end
                                      local.get 5
                                      i64.load offset=56
                                      local.set 18
                                      block ;; label = @18
                                        local.get 27
                                        i32.eqz
                                        br_if 0 (;@18;)
                                        local.get 27
                                        i64.extend_i32_s
                                        local.set 31
                                        br 2 (;@16;)
                                      end
                                      i64.const 0
                                      local.set 20
                                      br 2 (;@15;)
                                    end
                                    local.get 5
                                    i32.const 0
                                    i32.store offset=12
                                    local.get 5
                                    local.get 5
                                    i64.load offset=56
                                    i64.store32 offset=8
                                    local.get 5
                                    local.get 5
                                    i64.const 8
                                    i64.add
                                    i64.store offset=56
                                    local.get 5
                                    i64.const 8
                                    i64.add
                                    local.set 18
                                    i64.const -1
                                    local.set 31
                                  end
                                  i64.const 0
                                  local.set 20
                                  local.get 18
                                  local.set 19
                                  block ;; label = @16
                                    loop ;; label = @17
                                      local.get 19
                                      i32.load
                                      local.tee 17
                                      i32.eqz
                                      br_if 1 (;@16;)
                                      local.get 5
                                      i64.const 4
                                      i64.add
                                      local.get 17
                                      call $wctomb
                                      local.tee 17
                                      i32.const 0
                                      i32.lt_s
                                      br_if 15 (;@2;)
                                      local.get 31
                                      local.get 20
                                      i64.sub
                                      local.get 17
                                      i64.extend_i32_u
                                      local.tee 32
                                      i64.lt_u
                                      br_if 1 (;@16;)
                                      local.get 19
                                      i64.const 4
                                      i64.add
                                      local.set 19
                                      local.get 20
                                      local.get 32
                                      i64.add
                                      local.tee 20
                                      local.get 31
                                      i64.lt_u
                                      br_if 0 (;@17;)
                                    end
                                  end
                                  local.get 20
                                  i64.const 2147483647
                                  i64.gt_u
                                  br_if 12 (;@3;)
                                end
                                local.get 20
                                i32.wrap_i64
                                local.set 21
                                block ;; label = @15
                                  local.get 29
                                  i32.const 73728
                                  i32.and
                                  local.tee 22
                                  br_if 0 (;@15;)
                                  local.get 26
                                  local.get 21
                                  i32.le_s
                                  br_if 0 (;@15;)
                                  local.get 5
                                  i64.const 112
                                  i64.add
                                  i32.const 32
                                  local.get 26
                                  local.get 21
                                  i32.sub
                                  local.tee 17
                                  i32.const 256
                                  local.get 17
                                  i32.const 256
                                  i32.lt_u
                                  local.tee 24
                                  select
                                  i64.extend_i32_u
                                  call $memset
                                  drop
                                  block ;; label = @16
                                    local.get 24
                                    br_if 0 (;@16;)
                                    loop ;; label = @17
                                      block ;; label = @18
                                        local.get 0
                                        i32.load8_u
                                        i32.const 32
                                        i32.and
                                        br_if 0 (;@18;)
                                        local.get 5
                                        i64.const 112
                                        i64.add
                                        i64.const 256
                                        local.get 0
                                        call $__fwritex
                                        drop
                                      end
                                      local.get 17
                                      i32.const -256
                                      i32.add
                                      local.tee 17
                                      i32.const 255
                                      i32.gt_u
                                      br_if 0 (;@17;)
                                    end
                                  end
                                  local.get 0
                                  i32.load8_u
                                  i32.const 32
                                  i32.and
                                  br_if 0 (;@15;)
                                  local.get 5
                                  i64.const 112
                                  i64.add
                                  local.get 17
                                  i64.extend_i32_u
                                  local.get 0
                                  call $__fwritex
                                  drop
                                end
                                block ;; label = @15
                                  local.get 20
                                  i64.eqz
                                  br_if 0 (;@15;)
                                  i64.const 0
                                  local.set 19
                                  loop ;; label = @16
                                    local.get 18
                                    i32.load
                                    local.tee 17
                                    i32.eqz
                                    br_if 1 (;@15;)
                                    local.get 19
                                    local.get 5
                                    i64.const 4
                                    i64.add
                                    local.get 17
                                    call $wctomb
                                    i64.extend_i32_s
                                    local.tee 31
                                    i64.add
                                    local.tee 19
                                    local.get 20
                                    i64.gt_u
                                    br_if 1 (;@15;)
                                    block ;; label = @17
                                      local.get 0
                                      i32.load8_u
                                      i32.const 32
                                      i32.and
                                      br_if 0 (;@17;)
                                      local.get 5
                                      i64.const 4
                                      i64.add
                                      local.get 31
                                      local.get 0
                                      call $__fwritex
                                      drop
                                    end
                                    local.get 18
                                    i64.const 4
                                    i64.add
                                    local.set 18
                                    local.get 19
                                    local.get 20
                                    i64.lt_u
                                    br_if 0 (;@16;)
                                  end
                                end
                                block ;; label = @15
                                  local.get 22
                                  i32.const 8192
                                  i32.ne
                                  br_if 0 (;@15;)
                                  local.get 26
                                  local.get 21
                                  i32.le_s
                                  br_if 0 (;@15;)
                                  local.get 5
                                  i64.const 112
                                  i64.add
                                  i32.const 32
                                  local.get 26
                                  local.get 21
                                  i32.sub
                                  local.tee 17
                                  i32.const 256
                                  local.get 17
                                  i32.const 256
                                  i32.lt_u
                                  local.tee 22
                                  select
                                  i64.extend_i32_u
                                  call $memset
                                  drop
                                  block ;; label = @16
                                    local.get 22
                                    br_if 0 (;@16;)
                                    loop ;; label = @17
                                      block ;; label = @18
                                        local.get 0
                                        i32.load8_u
                                        i32.const 32
                                        i32.and
                                        br_if 0 (;@18;)
                                        local.get 5
                                        i64.const 112
                                        i64.add
                                        i64.const 256
                                        local.get 0
                                        call $__fwritex
                                        drop
                                      end
                                      local.get 17
                                      i32.const -256
                                      i32.add
                                      local.tee 17
                                      i32.const 255
                                      i32.gt_u
                                      br_if 0 (;@17;)
                                    end
                                  end
                                  local.get 0
                                  i32.load8_u
                                  i32.const 32
                                  i32.and
                                  br_if 0 (;@15;)
                                  local.get 5
                                  i64.const 112
                                  i64.add
                                  local.get 17
                                  i64.extend_i32_u
                                  local.get 0
                                  call $__fwritex
                                  drop
                                end
                                local.get 26
                                local.get 21
                                local.get 26
                                local.get 21
                                i32.gt_s
                                select
                                local.set 17
                                br 10 (;@4;)
                              end
                              block ;; label = @14
                                local.get 28
                                i32.eqz
                                br_if 0 (;@14;)
                                local.get 27
                                i32.const 0
                                i32.lt_s
                                br_if 11 (;@3;)
                              end
                              local.get 5
                              f64.load offset=56
                              local.set 33
                              local.get 5
                              i32.const 0
                              i32.store offset=108
                              block ;; label = @14
                                block ;; label = @15
                                  local.get 33
                                  i64.reinterpret_f64
                                  i64.const -1
                                  i64.gt_s
                                  br_if 0 (;@15;)
                                  local.get 33
                                  f64.neg
                                  local.set 33
                                  i32.const 1
                                  local.set 30
                                  i32.const 0
                                  local.set 34
                                  i64.const 1034
                                  local.set 35
                                  br 1 (;@14;)
                                end
                                block ;; label = @15
                                  local.get 29
                                  i32.const 2048
                                  i32.and
                                  i32.eqz
                                  br_if 0 (;@15;)
                                  i32.const 1
                                  local.set 30
                                  i32.const 0
                                  local.set 34
                                  i64.const 1037
                                  local.set 35
                                  br 1 (;@14;)
                                end
                                i64.const 1040
                                i64.const 1035
                                local.get 29
                                i32.const 1
                                i32.and
                                local.tee 30
                                select
                                local.set 35
                                local.get 30
                                i32.eqz
                                local.set 34
                              end
                              block ;; label = @14
                                local.get 33
                                f64.abs
                                f64.const inf (;=inf;)
                                f64.lt
                                br_if 0 (;@14;)
                                local.get 30
                                i32.const 3
                                i32.add
                                local.set 21
                                block ;; label = @15
                                  local.get 29
                                  i32.const 8192
                                  i32.and
                                  br_if 0 (;@15;)
                                  local.get 26
                                  local.get 21
                                  i32.le_s
                                  br_if 0 (;@15;)
                                  local.get 5
                                  i64.const 624
                                  i64.add
                                  i32.const 32
                                  local.get 26
                                  local.get 21
                                  i32.sub
                                  local.tee 17
                                  i32.const 256
                                  local.get 17
                                  i32.const 256
                                  i32.lt_u
                                  local.tee 22
                                  select
                                  i64.extend_i32_u
                                  call $memset
                                  drop
                                  block ;; label = @16
                                    local.get 22
                                    br_if 0 (;@16;)
                                    loop ;; label = @17
                                      block ;; label = @18
                                        local.get 0
                                        i32.load8_u
                                        i32.const 32
                                        i32.and
                                        br_if 0 (;@18;)
                                        local.get 5
                                        i64.const 624
                                        i64.add
                                        i64.const 256
                                        local.get 0
                                        call $__fwritex
                                        drop
                                      end
                                      local.get 17
                                      i32.const -256
                                      i32.add
                                      local.tee 17
                                      i32.const 255
                                      i32.gt_u
                                      br_if 0 (;@17;)
                                    end
                                  end
                                  local.get 0
                                  i32.load8_u
                                  i32.const 32
                                  i32.and
                                  br_if 0 (;@15;)
                                  local.get 5
                                  i64.const 624
                                  i64.add
                                  local.get 17
                                  i64.extend_i32_u
                                  local.get 0
                                  call $__fwritex
                                  drop
                                end
                                block ;; label = @15
                                  local.get 0
                                  i32.load
                                  local.tee 17
                                  i32.const 32
                                  i32.and
                                  br_if 0 (;@15;)
                                  local.get 35
                                  local.get 30
                                  i64.extend_i32_u
                                  local.get 0
                                  call $__fwritex
                                  drop
                                  local.get 0
                                  i32.load
                                  local.set 17
                                end
                                block ;; label = @15
                                  local.get 17
                                  i32.const 32
                                  i32.and
                                  br_if 0 (;@15;)
                                  i64.const 1053
                                  i64.const 1061
                                  local.get 23
                                  i32.const 32
                                  i32.and
                                  local.tee 17
                                  select
                                  i64.const 1057
                                  i64.const 1065
                                  local.get 17
                                  select
                                  local.get 33
                                  local.get 33
                                  f64.ne
                                  select
                                  i64.const 3
                                  local.get 0
                                  call $__fwritex
                                  drop
                                end
                                block ;; label = @15
                                  local.get 29
                                  i32.const 73728
                                  i32.and
                                  i32.const 8192
                                  i32.ne
                                  br_if 0 (;@15;)
                                  local.get 26
                                  local.get 21
                                  i32.le_s
                                  br_if 0 (;@15;)
                                  local.get 5
                                  i64.const 624
                                  i64.add
                                  i32.const 32
                                  local.get 26
                                  local.get 21
                                  i32.sub
                                  local.tee 17
                                  i32.const 256
                                  local.get 17
                                  i32.const 256
                                  i32.lt_u
                                  local.tee 22
                                  select
                                  i64.extend_i32_u
                                  call $memset
                                  drop
                                  block ;; label = @16
                                    local.get 22
                                    br_if 0 (;@16;)
                                    loop ;; label = @17
                                      block ;; label = @18
                                        local.get 0
                                        i32.load8_u
                                        i32.const 32
                                        i32.and
                                        br_if 0 (;@18;)
                                        local.get 5
                                        i64.const 624
                                        i64.add
                                        i64.const 256
                                        local.get 0
                                        call $__fwritex
                                        drop
                                      end
                                      local.get 17
                                      i32.const -256
                                      i32.add
                                      local.tee 17
                                      i32.const 255
                                      i32.gt_u
                                      br_if 0 (;@17;)
                                    end
                                  end
                                  local.get 0
                                  i32.load8_u
                                  i32.const 32
                                  i32.and
                                  br_if 0 (;@15;)
                                  local.get 5
                                  i64.const 624
                                  i64.add
                                  local.get 17
                                  i64.extend_i32_u
                                  local.get 0
                                  call $__fwritex
                                  drop
                                end
                                local.get 21
                                local.get 26
                                local.get 21
                                local.get 26
                                i32.gt_s
                                select
                                local.set 17
                                br 10 (;@4;)
                              end
                              block ;; label = @14
                                block ;; label = @15
                                  block ;; label = @16
                                    local.get 33
                                    local.get 5
                                    i64.const 108
                                    i64.add
                                    call $frexp
                                    local.tee 33
                                    local.get 33
                                    f64.add
                                    local.tee 33
                                    f64.const 0x0p+0 (;=0;)
                                    f64.eq
                                    br_if 0 (;@16;)
                                    local.get 5
                                    local.get 5
                                    i32.load offset=108
                                    local.tee 17
                                    i32.const -1
                                    i32.add
                                    i32.store offset=108
                                    local.get 23
                                    i32.const 32
                                    i32.or
                                    local.tee 28
                                    i32.const 97
                                    i32.ne
                                    br_if 1 (;@15;)
                                    br 7 (;@9;)
                                  end
                                  local.get 23
                                  i32.const 32
                                  i32.or
                                  local.tee 28
                                  i32.const 97
                                  i32.eq
                                  br_if 6 (;@9;)
                                  i32.const 6
                                  local.get 27
                                  local.get 27
                                  i32.const 0
                                  i32.lt_s
                                  select
                                  local.set 27
                                  local.get 5
                                  i32.load offset=108
                                  local.set 17
                                  br 1 (;@14;)
                                end
                                local.get 5
                                local.get 17
                                i32.const -29
                                i32.add
                                local.tee 17
                                i32.store offset=108
                                i32.const 6
                                local.get 27
                                local.get 27
                                i32.const 0
                                i32.lt_s
                                select
                                local.set 27
                                local.get 33
                                f64.const 0x1p+28 (;=268435456;)
                                f64.mul
                                local.set 33
                              end
                              local.get 5
                              i64.const 112
                              i64.add
                              i64.const 0
                              i64.const 72
                              local.get 17
                              i32.const 0
                              i32.lt_s
                              local.tee 36
                              select
                              i64.const 2
                              i64.shl
                              local.tee 37
                              i64.add
                              local.tee 38
                              local.set 19
                              loop ;; label = @14
                                block ;; label = @15
                                  block ;; label = @16
                                    local.get 33
                                    f64.const 0x1p+32 (;=4294967296;)
                                    f64.lt
                                    local.get 33
                                    f64.const 0x0p+0 (;=0;)
                                    f64.ge
                                    i32.and
                                    i32.eqz
                                    br_if 0 (;@16;)
                                    local.get 33
                                    i32.trunc_f64_u
                                    local.set 21
                                    br 1 (;@15;)
                                  end
                                  i32.const 0
                                  local.set 21
                                end
                                local.get 19
                                local.get 21
                                i32.store
                                local.get 19
                                i64.const 4
                                i64.add
                                local.set 19
                                local.get 33
                                local.get 21
                                f64.convert_i32_u
                                f64.sub
                                f64.const 0x1.dcd65p+29 (;=1000000000;)
                                f64.mul
                                local.tee 33
                                f64.const 0x0p+0 (;=0;)
                                f64.ne
                                br_if 0 (;@14;)
                              end
                              block ;; label = @14
                                block ;; label = @15
                                  local.get 17
                                  i32.const 1
                                  i32.ge_s
                                  br_if 0 (;@15;)
                                  local.get 19
                                  local.set 20
                                  local.get 38
                                  local.set 18
                                  br 1 (;@14;)
                                end
                                local.get 38
                                local.set 18
                                loop ;; label = @15
                                  local.get 17
                                  i32.const 29
                                  local.get 17
                                  i32.const 29
                                  i32.lt_s
                                  select
                                  local.set 17
                                  block ;; label = @16
                                    local.get 19
                                    i64.const -4
                                    i64.add
                                    local.tee 20
                                    local.get 18
                                    i64.lt_u
                                    br_if 0 (;@16;)
                                    local.get 17
                                    i64.extend_i32_u
                                    local.set 32
                                    i64.const 0
                                    local.set 31
                                    loop ;; label = @17
                                      local.get 20
                                      local.get 20
                                      i64.load32_u
                                      local.get 32
                                      i64.shl
                                      local.get 31
                                      i64.const 4294967295
                                      i64.and
                                      i64.add
                                      local.tee 31
                                      local.get 31
                                      i64.const 1000000000
                                      i64.div_u
                                      local.tee 31
                                      i64.const 1000000000
                                      i64.mul
                                      i64.sub
                                      i64.store32
                                      local.get 20
                                      i64.const -4
                                      i64.add
                                      local.tee 20
                                      local.get 18
                                      i64.ge_u
                                      br_if 0 (;@17;)
                                    end
                                    local.get 31
                                    i32.wrap_i64
                                    local.tee 21
                                    i32.eqz
                                    br_if 0 (;@16;)
                                    local.get 18
                                    i64.const -4
                                    i64.add
                                    local.tee 18
                                    local.get 21
                                    i32.store
                                  end
                                  block ;; label = @16
                                    loop ;; label = @17
                                      local.get 19
                                      local.tee 20
                                      local.get 18
                                      i64.le_u
                                      br_if 1 (;@16;)
                                      local.get 20
                                      i64.const -4
                                      i64.add
                                      local.tee 19
                                      i32.load
                                      i32.eqz
                                      br_if 0 (;@17;)
                                    end
                                  end
                                  local.get 5
                                  local.get 5
                                  i32.load offset=108
                                  local.get 17
                                  i32.sub
                                  local.tee 17
                                  i32.store offset=108
                                  local.get 20
                                  local.set 19
                                  local.get 17
                                  i32.const 0
                                  i32.gt_s
                                  br_if 0 (;@15;)
                                end
                              end
                              block ;; label = @14
                                local.get 17
                                i32.const -1
                                i32.gt_s
                                br_if 0 (;@14;)
                                local.get 27
                                i32.const 25
                                i32.add
                                i32.const 9
                                i32.div_u
                                i32.const 1
                                i32.add
                                i64.extend_i32_u
                                local.set 31
                                loop ;; label = @15
                                  i32.const 0
                                  local.get 17
                                  i32.sub
                                  local.tee 17
                                  i32.const 9
                                  local.get 17
                                  i32.const 9
                                  i32.lt_s
                                  select
                                  local.set 22
                                  block ;; label = @16
                                    block ;; label = @17
                                      local.get 18
                                      local.get 20
                                      i64.lt_u
                                      br_if 0 (;@17;)
                                      local.get 18
                                      i32.load
                                      local.set 21
                                      br 1 (;@16;)
                                    end
                                    i32.const 1000000000
                                    local.get 22
                                    i32.shr_u
                                    local.set 24
                                    i32.const -1
                                    local.get 22
                                    i32.shl
                                    i32.const -1
                                    i32.xor
                                    local.set 25
                                    i32.const 0
                                    local.set 17
                                    local.get 18
                                    local.set 19
                                    loop ;; label = @17
                                      local.get 19
                                      local.get 19
                                      i32.load
                                      local.tee 21
                                      local.get 22
                                      i32.shr_u
                                      local.get 17
                                      i32.add
                                      i32.store
                                      local.get 21
                                      local.get 25
                                      i32.and
                                      local.get 24
                                      i32.mul
                                      local.set 17
                                      local.get 19
                                      i64.const 4
                                      i64.add
                                      local.tee 19
                                      local.get 20
                                      i64.lt_u
                                      br_if 0 (;@17;)
                                    end
                                    local.get 18
                                    i32.load
                                    local.set 21
                                    local.get 17
                                    i32.eqz
                                    br_if 0 (;@16;)
                                    local.get 20
                                    local.get 17
                                    i32.store
                                    local.get 20
                                    i64.const 4
                                    i64.add
                                    local.set 20
                                  end
                                  local.get 5
                                  local.get 5
                                  i32.load offset=108
                                  local.get 22
                                  i32.add
                                  local.tee 17
                                  i32.store offset=108
                                  local.get 38
                                  local.get 18
                                  local.get 21
                                  i32.eqz
                                  i64.extend_i32_u
                                  i64.const 2
                                  i64.shl
                                  i64.add
                                  local.tee 18
                                  local.get 28
                                  i32.const 102
                                  i32.eq
                                  select
                                  local.tee 19
                                  local.get 31
                                  i64.const 2
                                  i64.shl
                                  i64.add
                                  local.get 20
                                  local.get 20
                                  local.get 19
                                  i64.sub
                                  i64.const 2
                                  i64.shr_s
                                  local.get 31
                                  i64.gt_s
                                  select
                                  local.set 20
                                  local.get 17
                                  i32.const 0
                                  i32.lt_s
                                  br_if 0 (;@15;)
                                end
                              end
                              i32.const 0
                              local.set 17
                              block ;; label = @14
                                local.get 18
                                local.get 20
                                i64.ge_u
                                br_if 0 (;@14;)
                                local.get 38
                                local.get 18
                                i64.sub
                                i64.const 2
                                i64.shr_u
                                i32.wrap_i64
                                i32.const 9
                                i32.mul
                                local.set 17
                                local.get 18
                                i32.load
                                local.tee 22
                                i32.const 10
                                i32.lt_u
                                br_if 0 (;@14;)
                                i32.const 10
                                local.set 21
                                loop ;; label = @15
                                  local.get 17
                                  i32.const 1
                                  i32.add
                                  local.set 17
                                  local.get 22
                                  local.get 21
                                  i32.const 10
                                  i32.mul
                                  local.tee 21
                                  i32.ge_u
                                  br_if 0 (;@15;)
                                end
                              end
                              block ;; label = @14
                                local.get 20
                                local.get 38
                                i64.sub
                                i64.const 2
                                i64.shr_s
                                i64.const 9
                                i64.mul
                                i64.const -9
                                i64.add
                                local.get 27
                                i32.const 0
                                local.get 17
                                local.get 28
                                i32.const 102
                                i32.eq
                                select
                                i32.sub
                                local.get 27
                                i32.const 0
                                i32.ne
                                local.get 28
                                i32.const 103
                                i32.eq
                                local.tee 25
                                i32.and
                                i32.sub
                                local.tee 21
                                i64.extend_i32_s
                                i64.le_s
                                br_if 0 (;@14;)
                                local.get 5
                                i64.const 112
                                i64.add
                                i64.const 1
                                i64.const 73
                                local.get 36
                                select
                                i64.const 2
                                i64.shl
                                local.tee 32
                                i64.add
                                local.get 21
                                i32.const 9216
                                i32.add
                                local.tee 22
                                i32.const 9
                                i32.div_s
                                local.tee 28
                                i32.const -1024
                                i32.add
                                i64.extend_i32_s
                                i64.const 2
                                i64.shl
                                i64.add
                                local.set 19
                                i32.const 10
                                local.set 21
                                block ;; label = @15
                                  local.get 22
                                  local.get 28
                                  i32.const 9
                                  i32.mul
                                  i32.sub
                                  local.tee 24
                                  i32.const 7
                                  i32.gt_s
                                  br_if 0 (;@15;)
                                  i32.const 8
                                  local.get 24
                                  i32.sub
                                  local.tee 36
                                  i32.const 7
                                  i32.and
                                  local.set 22
                                  i32.const 10
                                  local.set 21
                                  block ;; label = @16
                                    local.get 24
                                    i32.const -1
                                    i32.add
                                    i32.const 7
                                    i32.lt_u
                                    br_if 0 (;@16;)
                                    local.get 36
                                    i32.const -8
                                    i32.and
                                    local.set 24
                                    i32.const 10
                                    local.set 21
                                    loop ;; label = @17
                                      local.get 21
                                      i32.const 100000000
                                      i32.mul
                                      local.set 21
                                      local.get 24
                                      i32.const -8
                                      i32.add
                                      local.tee 24
                                      br_if 0 (;@17;)
                                    end
                                  end
                                  local.get 22
                                  i32.eqz
                                  br_if 0 (;@15;)
                                  loop ;; label = @16
                                    local.get 21
                                    i32.const 10
                                    i32.mul
                                    local.set 21
                                    local.get 22
                                    i32.const -1
                                    i32.add
                                    local.tee 22
                                    br_if 0 (;@16;)
                                  end
                                end
                                local.get 19
                                i64.const 4
                                i64.add
                                local.set 31
                                block ;; label = @15
                                  block ;; label = @16
                                    local.get 19
                                    i32.load
                                    local.tee 22
                                    local.get 22
                                    local.get 21
                                    i32.div_u
                                    local.tee 36
                                    local.get 21
                                    i32.mul
                                    i32.sub
                                    local.tee 24
                                    br_if 0 (;@16;)
                                    local.get 31
                                    local.get 20
                                    i64.eq
                                    br_if 1 (;@15;)
                                  end
                                  block ;; label = @16
                                    block ;; label = @17
                                      local.get 36
                                      i32.const 1
                                      i32.and
                                      br_if 0 (;@17;)
                                      f64.const 0x1p+53 (;=9007199254740992;)
                                      local.set 33
                                      local.get 21
                                      i32.const 1000000000
                                      i32.ne
                                      br_if 1 (;@16;)
                                      local.get 19
                                      local.get 18
                                      i64.le_u
                                      br_if 1 (;@16;)
                                      local.get 19
                                      i64.const -4
                                      i64.add
                                      i32.load8_u
                                      i32.const 1
                                      i32.and
                                      i32.eqz
                                      br_if 1 (;@16;)
                                    end
                                    f64.const 0x1.0000000000001p+53 (;=9007199254740994;)
                                    local.set 33
                                  end
                                  f64.const 0x1p-1 (;=0.5;)
                                  f64.const 0x1p+0 (;=1;)
                                  f64.const 0x1.8p+0 (;=1.5;)
                                  local.get 31
                                  local.get 20
                                  i64.eq
                                  select
                                  f64.const 0x1.8p+0 (;=1.5;)
                                  local.get 24
                                  local.get 21
                                  i32.const 1
                                  i32.shr_u
                                  local.tee 36
                                  i32.eq
                                  select
                                  local.get 24
                                  local.get 36
                                  i32.lt_u
                                  select
                                  local.set 39
                                  block ;; label = @16
                                    local.get 34
                                    br_if 0 (;@16;)
                                    local.get 35
                                    i32.load8_u
                                    i32.const 45
                                    i32.ne
                                    br_if 0 (;@16;)
                                    local.get 39
                                    f64.neg
                                    local.set 39
                                    local.get 33
                                    f64.neg
                                    local.set 33
                                  end
                                  local.get 19
                                  local.get 22
                                  local.get 24
                                  i32.sub
                                  local.tee 22
                                  i32.store
                                  local.get 33
                                  local.get 39
                                  f64.add
                                  local.get 33
                                  f64.eq
                                  br_if 0 (;@15;)
                                  local.get 19
                                  local.get 22
                                  local.get 21
                                  i32.add
                                  local.tee 17
                                  i32.store
                                  block ;; label = @16
                                    local.get 17
                                    i32.const 1000000000
                                    i32.lt_u
                                    br_if 0 (;@16;)
                                    local.get 8
                                    local.get 32
                                    local.get 28
                                    i64.extend_i32_s
                                    i64.const 2
                                    i64.shl
                                    i64.add
                                    i64.add
                                    local.set 19
                                    loop ;; label = @17
                                      local.get 19
                                      i64.const 4
                                      i64.add
                                      i32.const 0
                                      i32.store
                                      block ;; label = @18
                                        local.get 19
                                        local.get 18
                                        i64.ge_u
                                        br_if 0 (;@18;)
                                        local.get 18
                                        i64.const -4
                                        i64.add
                                        local.tee 18
                                        i32.const 0
                                        i32.store
                                      end
                                      local.get 19
                                      local.get 19
                                      i32.load
                                      i32.const 1
                                      i32.add
                                      local.tee 17
                                      i32.store
                                      local.get 19
                                      i64.const -4
                                      i64.add
                                      local.set 19
                                      local.get 17
                                      i32.const 999999999
                                      i32.gt_u
                                      br_if 0 (;@17;)
                                    end
                                    local.get 19
                                    i64.const 4
                                    i64.add
                                    local.set 19
                                  end
                                  local.get 38
                                  local.get 18
                                  i64.sub
                                  i64.const 2
                                  i64.shr_u
                                  i32.wrap_i64
                                  i32.const 9
                                  i32.mul
                                  local.set 17
                                  local.get 18
                                  i32.load
                                  local.tee 22
                                  i32.const 10
                                  i32.lt_u
                                  br_if 0 (;@15;)
                                  i32.const 10
                                  local.set 21
                                  loop ;; label = @16
                                    local.get 17
                                    i32.const 1
                                    i32.add
                                    local.set 17
                                    local.get 22
                                    local.get 21
                                    i32.const 10
                                    i32.mul
                                    local.tee 21
                                    i32.ge_u
                                    br_if 0 (;@16;)
                                  end
                                end
                                local.get 19
                                i64.const 4
                                i64.add
                                local.tee 19
                                local.get 20
                                local.get 20
                                local.get 19
                                i64.gt_u
                                select
                                local.set 20
                              end
                              local.get 7
                              local.get 20
                              i64.add
                              local.get 37
                              i64.sub
                              local.set 19
                              block ;; label = @14
                                loop ;; label = @15
                                  local.get 19
                                  local.set 31
                                  local.get 20
                                  local.tee 37
                                  local.get 18
                                  i64.le_u
                                  local.tee 21
                                  br_if 1 (;@14;)
                                  local.get 31
                                  i64.const -4
                                  i64.add
                                  local.set 19
                                  local.get 37
                                  i64.const -4
                                  i64.add
                                  local.tee 20
                                  i32.load
                                  i32.eqz
                                  br_if 0 (;@15;)
                                end
                              end
                              block ;; label = @14
                                block ;; label = @15
                                  local.get 25
                                  br_if 0 (;@15;)
                                  local.get 29
                                  i32.const 8
                                  i32.and
                                  local.set 24
                                  br 1 (;@14;)
                                end
                                local.get 17
                                i32.const -1
                                i32.xor
                                i32.const -1
                                local.get 27
                                i32.const 1
                                local.get 27
                                select
                                local.tee 22
                                local.get 17
                                i32.gt_s
                                local.get 17
                                i32.const -5
                                i32.gt_s
                                i32.and
                                local.tee 24
                                select
                                local.get 22
                                i32.add
                                local.set 27
                                i32.const -1
                                i32.const -2
                                local.get 24
                                select
                                local.get 23
                                i32.add
                                local.set 23
                                local.get 29
                                i32.const 8
                                i32.and
                                local.tee 24
                                br_if 0 (;@14;)
                                i32.const 9
                                local.set 22
                                block ;; label = @15
                                  local.get 21
                                  br_if 0 (;@15;)
                                  local.get 37
                                  i64.const -4
                                  i64.add
                                  i32.load
                                  local.tee 24
                                  i32.eqz
                                  br_if 0 (;@15;)
                                  i32.const 0
                                  local.set 22
                                  local.get 24
                                  i32.const 10
                                  i32.rem_u
                                  br_if 0 (;@15;)
                                  i32.const 10
                                  local.set 21
                                  i32.const 0
                                  local.set 22
                                  loop ;; label = @16
                                    local.get 22
                                    i32.const 1
                                    i32.add
                                    local.set 22
                                    local.get 24
                                    local.get 21
                                    i32.const 10
                                    i32.mul
                                    local.tee 21
                                    i32.rem_u
                                    i32.eqz
                                    br_if 0 (;@16;)
                                  end
                                end
                                local.get 31
                                i64.const 2
                                i64.shr_s
                                i64.const 9
                                i64.mul
                                local.set 19
                                local.get 22
                                i64.extend_i32_u
                                local.set 31
                                local.get 27
                                i64.extend_i32_s
                                local.set 20
                                block ;; label = @15
                                  block ;; label = @16
                                    local.get 23
                                    i32.const -33
                                    i32.and
                                    i32.const 70
                                    i32.ne
                                    br_if 0 (;@16;)
                                    local.get 19
                                    local.get 31
                                    i64.sub
                                    i64.const -9
                                    i64.add
                                    local.tee 19
                                    i64.const 0
                                    local.get 19
                                    i64.const 0
                                    i64.gt_s
                                    select
                                    local.tee 19
                                    local.get 20
                                    local.get 19
                                    local.get 20
                                    i64.lt_s
                                    select
                                    i32.wrap_i64
                                    local.set 27
                                    br 1 (;@15;)
                                  end
                                  local.get 19
                                  local.get 17
                                  i64.extend_i32_s
                                  i64.add
                                  local.get 31
                                  i64.sub
                                  i64.const -9
                                  i64.add
                                  local.tee 19
                                  i64.const 0
                                  local.get 19
                                  i64.const 0
                                  i64.gt_s
                                  select
                                  local.tee 19
                                  local.get 20
                                  local.get 19
                                  local.get 20
                                  i64.lt_s
                                  select
                                  i32.wrap_i64
                                  local.set 27
                                end
                                i32.const 0
                                local.set 24
                              end
                              local.get 27
                              i32.const 2147483645
                              i32.const 2147483646
                              local.get 27
                              local.get 24
                              i32.or
                              local.tee 28
                              select
                              i32.gt_s
                              br_if 10 (;@3;)
                              local.get 27
                              local.get 28
                              i32.const 0
                              i32.ne
                              i32.add
                              i32.const 1
                              i32.add
                              local.set 22
                              block ;; label = @14
                                block ;; label = @15
                                  local.get 23
                                  i32.const -33
                                  i32.and
                                  i32.const 70
                                  i32.ne
                                  local.tee 34
                                  br_if 0 (;@15;)
                                  local.get 17
                                  local.get 22
                                  i32.const 2147483647
                                  i32.xor
                                  i32.gt_s
                                  br_if 12 (;@3;)
                                  local.get 17
                                  i32.const 0
                                  local.get 17
                                  i32.const 0
                                  i32.gt_s
                                  select
                                  local.set 17
                                  br 1 (;@14;)
                                end
                                block ;; label = @15
                                  block ;; label = @16
                                    local.get 17
                                    br_if 0 (;@16;)
                                    local.get 6
                                    local.set 31
                                    local.get 6
                                    local.set 19
                                    br 1 (;@15;)
                                  end
                                  local.get 17
                                  local.get 17
                                  i32.const 31
                                  i32.shr_s
                                  local.tee 21
                                  i32.xor
                                  local.get 21
                                  i32.sub
                                  i64.extend_i32_u
                                  local.set 20
                                  local.get 6
                                  local.set 31
                                  local.get 6
                                  local.set 19
                                  loop ;; label = @16
                                    local.get 19
                                    i64.const -1
                                    i64.add
                                    local.tee 19
                                    local.get 20
                                    local.get 20
                                    i64.const 10
                                    i64.div_u
                                    local.tee 32
                                    i64.const 10
                                    i64.mul
                                    i64.sub
                                    i32.wrap_i64
                                    i32.const 48
                                    i32.or
                                    i32.store8
                                    local.get 31
                                    i64.const -1
                                    i64.add
                                    local.set 31
                                    local.get 20
                                    i64.const 9
                                    i64.gt_u
                                    local.set 21
                                    local.get 32
                                    local.set 20
                                    local.get 21
                                    br_if 0 (;@16;)
                                  end
                                end
                                block ;; label = @15
                                  local.get 6
                                  local.get 31
                                  i64.sub
                                  i64.const 1
                                  i64.gt_s
                                  br_if 0 (;@15;)
                                  local.get 19
                                  local.get 13
                                  local.get 31
                                  i64.sub
                                  i64.add
                                  local.tee 19
                                  i32.const 48
                                  local.get 31
                                  local.get 5
                                  i64.const 68
                                  i64.add
                                  i64.sub
                                  i64.const -10
                                  i64.add
                                  call $memset
                                  drop
                                end
                                local.get 19
                                i64.const -2
                                i64.add
                                local.tee 40
                                local.get 23
                                i32.store8
                                local.get 19
                                i64.const -1
                                i64.add
                                i32.const 45
                                i32.const 43
                                local.get 17
                                i32.const 0
                                i32.lt_s
                                select
                                i32.store8
                                local.get 6
                                local.get 40
                                i64.sub
                                local.tee 20
                                local.get 22
                                i32.const 2147483647
                                i32.xor
                                i64.extend_i32_u
                                i64.gt_s
                                br_if 11 (;@3;)
                                local.get 20
                                i32.wrap_i64
                                local.set 17
                              end
                              local.get 17
                              local.get 22
                              i32.add
                              local.tee 17
                              local.get 30
                              i32.const 2147483647
                              i32.xor
                              i32.gt_s
                              br_if 10 (;@3;)
                              local.get 17
                              local.get 30
                              i32.add
                              local.set 22
                              block ;; label = @14
                                local.get 29
                                i32.const 73728
                                i32.and
                                local.tee 25
                                br_if 0 (;@14;)
                                local.get 26
                                local.get 22
                                i32.le_s
                                br_if 0 (;@14;)
                                local.get 5
                                i64.const 624
                                i64.add
                                i32.const 32
                                local.get 26
                                local.get 22
                                i32.sub
                                local.tee 17
                                i32.const 256
                                local.get 17
                                i32.const 256
                                i32.lt_u
                                local.tee 21
                                select
                                i64.extend_i32_u
                                call $memset
                                drop
                                block ;; label = @15
                                  local.get 21
                                  br_if 0 (;@15;)
                                  loop ;; label = @16
                                    block ;; label = @17
                                      local.get 0
                                      i32.load8_u
                                      i32.const 32
                                      i32.and
                                      br_if 0 (;@17;)
                                      local.get 5
                                      i64.const 624
                                      i64.add
                                      i64.const 256
                                      local.get 0
                                      call $__fwritex
                                      drop
                                    end
                                    local.get 17
                                    i32.const -256
                                    i32.add
                                    local.tee 17
                                    i32.const 255
                                    i32.gt_u
                                    br_if 0 (;@16;)
                                  end
                                end
                                local.get 0
                                i32.load8_u
                                i32.const 32
                                i32.and
                                br_if 0 (;@14;)
                                local.get 5
                                i64.const 624
                                i64.add
                                local.get 17
                                i64.extend_i32_u
                                local.get 0
                                call $__fwritex
                                drop
                              end
                              block ;; label = @14
                                local.get 0
                                i32.load8_u
                                i32.const 32
                                i32.and
                                br_if 0 (;@14;)
                                local.get 35
                                local.get 30
                                i64.extend_i32_u
                                local.get 0
                                call $__fwritex
                                drop
                              end
                              block ;; label = @14
                                local.get 25
                                i32.const 65536
                                i32.ne
                                br_if 0 (;@14;)
                                local.get 26
                                local.get 22
                                i32.le_s
                                br_if 0 (;@14;)
                                local.get 5
                                i64.const 624
                                i64.add
                                i32.const 48
                                local.get 26
                                local.get 22
                                i32.sub
                                local.tee 17
                                i32.const 256
                                local.get 17
                                i32.const 256
                                i32.lt_u
                                local.tee 21
                                select
                                i64.extend_i32_u
                                call $memset
                                drop
                                block ;; label = @15
                                  local.get 21
                                  br_if 0 (;@15;)
                                  loop ;; label = @16
                                    block ;; label = @17
                                      local.get 0
                                      i32.load8_u
                                      i32.const 32
                                      i32.and
                                      br_if 0 (;@17;)
                                      local.get 5
                                      i64.const 624
                                      i64.add
                                      i64.const 256
                                      local.get 0
                                      call $__fwritex
                                      drop
                                    end
                                    local.get 17
                                    i32.const -256
                                    i32.add
                                    local.tee 17
                                    i32.const 255
                                    i32.gt_u
                                    br_if 0 (;@16;)
                                  end
                                end
                                local.get 0
                                i32.load8_u
                                i32.const 32
                                i32.and
                                br_if 0 (;@14;)
                                local.get 5
                                i64.const 624
                                i64.add
                                local.get 17
                                i64.extend_i32_u
                                local.get 0
                                call $__fwritex
                                drop
                              end
                              local.get 34
                              br_if 2 (;@11;)
                              local.get 38
                              local.get 18
                              local.get 18
                              local.get 38
                              i64.gt_u
                              select
                              local.tee 31
                              local.set 32
                              loop ;; label = @14
                                block ;; label = @15
                                  block ;; label = @16
                                    block ;; label = @17
                                      block ;; label = @18
                                        local.get 32
                                        i32.load
                                        local.tee 17
                                        i32.eqz
                                        br_if 0 (;@18;)
                                        local.get 17
                                        i64.extend_i32_u
                                        local.set 20
                                        i64.const 8
                                        local.set 19
                                        loop ;; label = @19
                                          local.get 5
                                          i64.const 80
                                          i64.add
                                          local.get 19
                                          i64.add
                                          local.get 20
                                          local.get 20
                                          i64.const 10
                                          i64.div_u
                                          local.tee 18
                                          i64.const 10
                                          i64.mul
                                          i64.sub
                                          i32.wrap_i64
                                          i32.const 48
                                          i32.or
                                          i32.store8
                                          local.get 19
                                          i64.const -1
                                          i64.add
                                          local.set 19
                                          local.get 20
                                          i64.const 9
                                          i64.gt_u
                                          local.set 17
                                          local.get 18
                                          local.set 20
                                          local.get 17
                                          br_if 0 (;@19;)
                                        end
                                        local.get 19
                                        i64.const 1
                                        i64.add
                                        local.tee 18
                                        local.get 5
                                        i64.const 80
                                        i64.add
                                        i64.add
                                        local.set 20
                                        block ;; label = @19
                                          local.get 32
                                          local.get 31
                                          i64.eq
                                          br_if 0 (;@19;)
                                          local.get 19
                                          i64.const 2
                                          i64.add
                                          i64.const 2
                                          i64.lt_s
                                          br_if 4 (;@15;)
                                          br 3 (;@16;)
                                        end
                                        local.get 19
                                        i64.const 8
                                        i64.ne
                                        br_if 3 (;@15;)
                                        br 1 (;@17;)
                                      end
                                      i64.const 9
                                      local.set 18
                                      local.get 32
                                      local.get 31
                                      i64.ne
                                      br_if 1 (;@16;)
                                    end
                                    local.get 5
                                    i32.const 48
                                    i32.store8 offset=88
                                    local.get 11
                                    local.set 20
                                    br 1 (;@15;)
                                  end
                                  local.get 5
                                  i64.const 80
                                  i64.add
                                  local.get 18
                                  local.get 5
                                  i64.const 80
                                  i64.add
                                  i64.add
                                  local.tee 19
                                  i64.const -1
                                  i64.add
                                  local.tee 20
                                  local.get 5
                                  i64.const 80
                                  i64.add
                                  local.get 20
                                  i64.lt_u
                                  select
                                  local.tee 20
                                  i32.const 48
                                  local.get 19
                                  local.get 20
                                  i64.sub
                                  call $memset
                                  drop
                                end
                                block ;; label = @15
                                  local.get 0
                                  i32.load8_u
                                  i32.const 32
                                  i32.and
                                  br_if 0 (;@15;)
                                  local.get 20
                                  local.get 12
                                  local.get 20
                                  i64.sub
                                  local.get 0
                                  call $__fwritex
                                  drop
                                end
                                local.get 32
                                i64.const 4
                                i64.add
                                local.tee 32
                                local.get 38
                                i64.le_u
                                br_if 0 (;@14;)
                              end
                              block ;; label = @14
                                local.get 28
                                i32.eqz
                                br_if 0 (;@14;)
                                local.get 0
                                i32.load8_u
                                i32.const 32
                                i32.and
                                br_if 0 (;@14;)
                                i64.const 1069
                                i64.const 1
                                local.get 0
                                call $__fwritex
                                drop
                              end
                              block ;; label = @14
                                block ;; label = @15
                                  local.get 32
                                  local.get 37
                                  i64.lt_u
                                  br_if 0 (;@15;)
                                  local.get 27
                                  local.set 17
                                  br 1 (;@14;)
                                end
                                block ;; label = @15
                                  local.get 27
                                  i32.const 1
                                  i32.ge_s
                                  br_if 0 (;@15;)
                                  local.get 27
                                  local.set 17
                                  br 1 (;@14;)
                                end
                                loop ;; label = @15
                                  block ;; label = @16
                                    block ;; label = @17
                                      block ;; label = @18
                                        local.get 32
                                        i32.load
                                        local.tee 17
                                        br_if 0 (;@18;)
                                        local.get 12
                                        local.set 19
                                        local.get 12
                                        local.set 18
                                        br 1 (;@17;)
                                      end
                                      local.get 17
                                      i64.extend_i32_u
                                      local.set 20
                                      local.get 12
                                      local.set 18
                                      local.get 12
                                      local.set 19
                                      loop ;; label = @18
                                        local.get 19
                                        i64.const -1
                                        i64.add
                                        local.tee 19
                                        local.get 20
                                        local.get 20
                                        i64.const 10
                                        i64.div_u
                                        local.tee 31
                                        i64.const 10
                                        i64.mul
                                        i64.sub
                                        i32.wrap_i64
                                        i32.const 48
                                        i32.or
                                        i32.store8
                                        local.get 18
                                        i64.const -1
                                        i64.add
                                        local.set 18
                                        local.get 20
                                        i64.const 9
                                        i64.gt_u
                                        local.set 17
                                        local.get 31
                                        local.set 20
                                        local.get 17
                                        br_if 0 (;@18;)
                                      end
                                      local.get 19
                                      local.get 5
                                      i64.const 80
                                      i64.add
                                      i64.le_u
                                      br_if 1 (;@16;)
                                    end
                                    local.get 19
                                    local.get 5
                                    i64.const 80
                                    i64.add
                                    i64.add
                                    local.get 18
                                    i64.sub
                                    local.tee 19
                                    i32.const 48
                                    local.get 18
                                    local.get 5
                                    i64.const 80
                                    i64.add
                                    i64.sub
                                    call $memset
                                    drop
                                  end
                                  block ;; label = @16
                                    local.get 0
                                    i32.load8_u
                                    i32.const 32
                                    i32.and
                                    br_if 0 (;@16;)
                                    local.get 19
                                    local.get 27
                                    i32.const 9
                                    local.get 27
                                    i32.const 9
                                    i32.lt_s
                                    select
                                    i64.extend_i32_u
                                    local.get 0
                                    call $__fwritex
                                    drop
                                  end
                                  local.get 27
                                  i32.const -9
                                  i32.add
                                  local.set 17
                                  local.get 32
                                  i64.const 4
                                  i64.add
                                  local.tee 32
                                  local.get 37
                                  i64.ge_u
                                  br_if 1 (;@14;)
                                  local.get 27
                                  i32.const 9
                                  i32.gt_s
                                  local.set 21
                                  local.get 17
                                  local.set 27
                                  local.get 21
                                  br_if 0 (;@15;)
                                end
                              end
                              local.get 0
                              i32.const 48
                              local.get 17
                              i32.const 9
                              i32.add
                              i32.const 9
                              i32.const 0
                              call $pad
                              br 3 (;@10;)
                            end
                            i64.const 4832
                            i32.const 28
                            i32.store
                            br 10 (;@2;)
                          end
                          i32.const 0
                          local.set 24
                          i64.const 1024
                          local.set 31
                          local.get 14
                          local.set 20
                          local.get 29
                          local.set 30
                          br 6 (;@5;)
                        end
                        block ;; label = @11
                          local.get 27
                          i32.const 0
                          i32.lt_s
                          br_if 0 (;@11;)
                          local.get 37
                          local.get 18
                          i64.const 4
                          i64.add
                          local.get 37
                          local.get 18
                          i64.gt_u
                          select
                          local.set 37
                          local.get 18
                          local.set 32
                          loop ;; label = @12
                            block ;; label = @13
                              block ;; label = @14
                                local.get 32
                                i32.load
                                local.tee 17
                                i32.eqz
                                br_if 0 (;@14;)
                                local.get 17
                                i64.extend_i32_u
                                local.set 20
                                i64.const 0
                                local.set 19
                                loop ;; label = @15
                                  local.get 5
                                  i64.const 80
                                  i64.add
                                  local.get 19
                                  i64.add
                                  i64.const 8
                                  i64.add
                                  local.get 20
                                  local.get 20
                                  i64.const 10
                                  i64.div_u
                                  local.tee 31
                                  i64.const 10
                                  i64.mul
                                  i64.sub
                                  i32.wrap_i64
                                  i32.const 48
                                  i32.or
                                  i32.store8
                                  local.get 19
                                  i64.const -1
                                  i64.add
                                  local.set 19
                                  local.get 20
                                  i64.const 9
                                  i64.gt_u
                                  local.set 17
                                  local.get 31
                                  local.set 20
                                  local.get 17
                                  br_if 0 (;@15;)
                                end
                                local.get 19
                                i64.const 0
                                i64.eq
                                br_if 0 (;@14;)
                                local.get 5
                                i64.const 80
                                i64.add
                                local.get 19
                                i64.add
                                i64.const 9
                                i64.add
                                local.set 20
                                br 1 (;@13;)
                              end
                              local.get 5
                              i32.const 48
                              i32.store8 offset=88
                              local.get 11
                              local.set 20
                            end
                            block ;; label = @13
                              block ;; label = @14
                                local.get 32
                                local.get 18
                                i64.eq
                                br_if 0 (;@14;)
                                local.get 20
                                local.get 5
                                i64.const 80
                                i64.add
                                i64.le_u
                                br_if 1 (;@13;)
                                local.get 5
                                i64.const 80
                                i64.add
                                i32.const 48
                                local.get 20
                                local.get 5
                                i64.const 80
                                i64.add
                                i64.sub
                                call $memset
                                drop
                                local.get 5
                                i64.const 80
                                i64.add
                                local.set 20
                                br 1 (;@13;)
                              end
                              block ;; label = @14
                                local.get 0
                                i32.load8_u
                                i32.const 32
                                i32.and
                                br_if 0 (;@14;)
                                local.get 20
                                i64.const 1
                                local.get 0
                                call $__fwritex
                                drop
                              end
                              local.get 20
                              i64.const 1
                              i64.add
                              local.set 20
                              block ;; label = @14
                                local.get 24
                                br_if 0 (;@14;)
                                local.get 27
                                i32.const 1
                                i32.lt_s
                                br_if 1 (;@13;)
                              end
                              local.get 0
                              i32.load8_u
                              i32.const 32
                              i32.and
                              br_if 0 (;@13;)
                              i64.const 1069
                              i64.const 1
                              local.get 0
                              call $__fwritex
                              drop
                            end
                            local.get 12
                            local.get 20
                            i64.sub
                            local.set 19
                            block ;; label = @13
                              local.get 0
                              i32.load8_u
                              i32.const 32
                              i32.and
                              br_if 0 (;@13;)
                              local.get 20
                              local.get 19
                              local.get 27
                              i64.extend_i32_u
                              local.tee 31
                              local.get 19
                              local.get 31
                              i64.lt_s
                              select
                              local.get 0
                              call $__fwritex
                              drop
                            end
                            local.get 27
                            local.get 19
                            i32.wrap_i64
                            i32.sub
                            local.set 27
                            local.get 32
                            i64.const 4
                            i64.add
                            local.tee 32
                            local.get 37
                            i64.ge_u
                            br_if 1 (;@11;)
                            local.get 27
                            i32.const -1
                            i32.gt_s
                            br_if 0 (;@12;)
                          end
                        end
                        local.get 0
                        i32.const 48
                        local.get 27
                        i32.const 18
                        i32.add
                        i32.const 18
                        i32.const 0
                        call $pad
                        local.get 0
                        i32.load8_u
                        i32.const 32
                        i32.and
                        br_if 0 (;@10;)
                        local.get 40
                        local.get 6
                        local.get 40
                        i64.sub
                        local.get 0
                        call $__fwritex
                        drop
                      end
                      local.get 25
                      i32.const 8192
                      i32.ne
                      br_if 1 (;@8;)
                      local.get 26
                      local.get 22
                      i32.le_s
                      br_if 1 (;@8;)
                      local.get 5
                      i64.const 624
                      i64.add
                      i32.const 32
                      local.get 26
                      local.get 22
                      i32.sub
                      local.tee 17
                      i32.const 256
                      local.get 17
                      i32.const 256
                      i32.lt_u
                      local.tee 21
                      select
                      i64.extend_i32_u
                      call $memset
                      drop
                      block ;; label = @10
                        local.get 21
                        br_if 0 (;@10;)
                        loop ;; label = @11
                          block ;; label = @12
                            local.get 0
                            i32.load8_u
                            i32.const 32
                            i32.and
                            br_if 0 (;@12;)
                            local.get 5
                            i64.const 624
                            i64.add
                            i64.const 256
                            local.get 0
                            call $__fwritex
                            drop
                          end
                          local.get 17
                          i32.const -256
                          i32.add
                          local.tee 17
                          i32.const 255
                          i32.gt_u
                          br_if 0 (;@11;)
                        end
                      end
                      local.get 0
                      i32.load8_u
                      i32.const 32
                      i32.and
                      br_if 1 (;@8;)
                      local.get 5
                      i64.const 624
                      i64.add
                      local.get 17
                      i64.extend_i32_u
                      local.get 0
                      call $__fwritex
                      drop
                      br 1 (;@8;)
                    end
                    local.get 35
                    i64.const 9
                    i64.const 0
                    local.get 23
                    i32.const 32
                    i32.and
                    local.tee 21
                    select
                    i64.add
                    local.set 32
                    block ;; label = @9
                      local.get 27
                      i32.const 11
                      i32.gt_u
                      br_if 0 (;@9;)
                      block ;; label = @10
                        block ;; label = @11
                          i32.const 12
                          local.get 27
                          i32.sub
                          local.tee 17
                          i32.const 7
                          i32.and
                          local.tee 22
                          br_if 0 (;@11;)
                          f64.const 0x1p+4 (;=16;)
                          local.set 39
                          br 1 (;@10;)
                        end
                        local.get 27
                        i32.const -12
                        i32.add
                        local.set 17
                        f64.const 0x1p+4 (;=16;)
                        local.set 39
                        loop ;; label = @11
                          local.get 17
                          i32.const 1
                          i32.add
                          local.set 17
                          local.get 39
                          f64.const 0x1p+4 (;=16;)
                          f64.mul
                          local.set 39
                          local.get 22
                          i32.const -1
                          i32.add
                          local.tee 22
                          br_if 0 (;@11;)
                        end
                        i32.const 0
                        local.get 17
                        i32.sub
                        local.set 17
                      end
                      block ;; label = @10
                        local.get 27
                        i32.const -5
                        i32.add
                        i32.const 7
                        i32.lt_u
                        br_if 0 (;@10;)
                        loop ;; label = @11
                          local.get 39
                          f64.const 0x1p+4 (;=16;)
                          f64.mul
                          f64.const 0x1p+4 (;=16;)
                          f64.mul
                          f64.const 0x1p+4 (;=16;)
                          f64.mul
                          f64.const 0x1p+4 (;=16;)
                          f64.mul
                          f64.const 0x1p+4 (;=16;)
                          f64.mul
                          f64.const 0x1p+4 (;=16;)
                          f64.mul
                          f64.const 0x1p+4 (;=16;)
                          f64.mul
                          f64.const 0x1p+4 (;=16;)
                          f64.mul
                          local.set 39
                          local.get 17
                          i32.const -8
                          i32.add
                          local.tee 17
                          br_if 0 (;@11;)
                        end
                      end
                      block ;; label = @10
                        local.get 32
                        i32.load8_u
                        i32.const 45
                        i32.ne
                        br_if 0 (;@10;)
                        local.get 39
                        local.get 33
                        f64.neg
                        local.get 39
                        f64.sub
                        f64.add
                        f64.neg
                        local.set 33
                        br 1 (;@9;)
                      end
                      local.get 33
                      local.get 39
                      f64.add
                      local.get 39
                      f64.sub
                      local.set 33
                    end
                    block ;; label = @9
                      block ;; label = @10
                        local.get 5
                        i32.load offset=108
                        local.tee 22
                        i32.eqz
                        br_if 0 (;@10;)
                        local.get 22
                        local.get 22
                        i32.const 31
                        i32.shr_s
                        local.tee 17
                        i32.xor
                        local.get 17
                        i32.sub
                        i64.extend_i32_u
                        local.set 20
                        i64.const 0
                        local.set 19
                        loop ;; label = @11
                          local.get 5
                          i64.const 68
                          i64.add
                          local.get 19
                          i64.add
                          i64.const 11
                          i64.add
                          local.get 20
                          local.get 20
                          i64.const 10
                          i64.div_u
                          local.tee 18
                          i64.const 10
                          i64.mul
                          i64.sub
                          i32.wrap_i64
                          i32.const 48
                          i32.or
                          i32.store8
                          local.get 19
                          i64.const -1
                          i64.add
                          local.set 19
                          local.get 20
                          i64.const 9
                          i64.gt_u
                          local.set 17
                          local.get 18
                          local.set 20
                          local.get 17
                          br_if 0 (;@11;)
                        end
                        local.get 19
                        i64.const 0
                        i64.eq
                        br_if 0 (;@10;)
                        local.get 5
                        i64.const 68
                        i64.add
                        local.get 19
                        i64.add
                        i64.const 12
                        i64.add
                        local.set 20
                        br 1 (;@9;)
                      end
                      local.get 5
                      i32.const 48
                      i32.store8 offset=79
                      local.get 10
                      local.set 20
                    end
                    local.get 30
                    i32.const 2
                    i32.or
                    local.set 24
                    local.get 20
                    i64.const -2
                    i64.add
                    local.tee 31
                    local.get 23
                    i32.const 15
                    i32.add
                    i32.store8
                    local.get 20
                    i64.const -1
                    i64.add
                    i32.const 45
                    i32.const 43
                    local.get 22
                    i32.const 0
                    i32.lt_s
                    select
                    i32.store8
                    local.get 29
                    i32.const 8
                    i32.and
                    local.set 22
                    local.get 5
                    i64.const 80
                    i64.add
                    local.set 19
                    loop ;; label = @9
                      local.get 19
                      local.set 20
                      block ;; label = @10
                        block ;; label = @11
                          local.get 33
                          f64.abs
                          f64.const 0x1p+31 (;=2147483648;)
                          f64.lt
                          i32.eqz
                          br_if 0 (;@11;)
                          local.get 33
                          i32.trunc_f64_s
                          local.set 17
                          br 1 (;@10;)
                        end
                        i32.const -2147483648
                        local.set 17
                      end
                      local.get 20
                      local.get 17
                      i64.extend_i32_s
                      i64.const 3440
                      i64.add
                      i32.load8_u
                      local.get 21
                      i32.or
                      i32.store8
                      local.get 33
                      local.get 17
                      f64.convert_i32_s
                      f64.sub
                      f64.const 0x1p+4 (;=16;)
                      f64.mul
                      local.set 33
                      block ;; label = @10
                        local.get 20
                        i64.const 1
                        i64.add
                        local.tee 19
                        local.get 5
                        i64.const 80
                        i64.add
                        i64.sub
                        i64.const 1
                        i64.ne
                        br_if 0 (;@10;)
                        block ;; label = @11
                          local.get 22
                          br_if 0 (;@11;)
                          local.get 27
                          i32.const 0
                          i32.gt_s
                          br_if 0 (;@11;)
                          local.get 33
                          f64.const 0x0p+0 (;=0;)
                          f64.eq
                          br_if 1 (;@10;)
                        end
                        local.get 20
                        i32.const 46
                        i32.store8 offset=1
                        local.get 20
                        i64.const 2
                        i64.add
                        local.set 19
                      end
                      local.get 33
                      f64.const 0x0p+0 (;=0;)
                      f64.ne
                      br_if 0 (;@9;)
                    end
                    i64.const 2147483645
                    local.get 6
                    local.get 31
                    i64.sub
                    local.tee 18
                    local.get 24
                    i64.extend_i32_u
                    local.tee 38
                    i64.add
                    i64.sub
                    local.get 27
                    i64.extend_i32_s
                    local.tee 37
                    i64.lt_s
                    br_if 5 (;@3;)
                    local.get 24
                    local.get 27
                    i32.const 2
                    i32.add
                    i64.extend_i32_u
                    local.get 19
                    local.get 5
                    i64.const 80
                    i64.add
                    i64.sub
                    local.tee 20
                    local.get 20
                    i64.const -2
                    i64.add
                    local.get 37
                    i64.lt_s
                    select
                    local.get 20
                    local.get 27
                    select
                    local.get 18
                    i64.add
                    local.tee 19
                    i32.wrap_i64
                    i32.add
                    local.set 22
                    block ;; label = @9
                      local.get 29
                      i32.const 73728
                      i32.and
                      local.tee 21
                      br_if 0 (;@9;)
                      local.get 26
                      local.get 22
                      i32.le_s
                      br_if 0 (;@9;)
                      local.get 5
                      i64.const 624
                      i64.add
                      i32.const 32
                      local.get 26
                      local.get 22
                      i32.sub
                      local.tee 17
                      i32.const 256
                      local.get 17
                      i32.const 256
                      i32.lt_u
                      local.tee 24
                      select
                      i64.extend_i32_u
                      call $memset
                      drop
                      block ;; label = @10
                        local.get 24
                        br_if 0 (;@10;)
                        loop ;; label = @11
                          block ;; label = @12
                            local.get 0
                            i32.load8_u
                            i32.const 32
                            i32.and
                            br_if 0 (;@12;)
                            local.get 5
                            i64.const 624
                            i64.add
                            i64.const 256
                            local.get 0
                            call $__fwritex
                            drop
                          end
                          local.get 17
                          i32.const -256
                          i32.add
                          local.tee 17
                          i32.const 255
                          i32.gt_u
                          br_if 0 (;@11;)
                        end
                      end
                      local.get 0
                      i32.load8_u
                      i32.const 32
                      i32.and
                      br_if 0 (;@9;)
                      local.get 5
                      i64.const 624
                      i64.add
                      local.get 17
                      i64.extend_i32_u
                      local.get 0
                      call $__fwritex
                      drop
                    end
                    block ;; label = @9
                      local.get 0
                      i32.load8_u
                      i32.const 32
                      i32.and
                      br_if 0 (;@9;)
                      local.get 32
                      local.get 38
                      local.get 0
                      call $__fwritex
                      drop
                    end
                    block ;; label = @9
                      local.get 21
                      i32.const 65536
                      i32.ne
                      br_if 0 (;@9;)
                      local.get 26
                      local.get 22
                      i32.le_s
                      br_if 0 (;@9;)
                      local.get 5
                      i64.const 624
                      i64.add
                      i32.const 48
                      local.get 26
                      local.get 22
                      i32.sub
                      local.tee 17
                      i32.const 256
                      local.get 17
                      i32.const 256
                      i32.lt_u
                      local.tee 24
                      select
                      i64.extend_i32_u
                      call $memset
                      drop
                      block ;; label = @10
                        local.get 24
                        br_if 0 (;@10;)
                        loop ;; label = @11
                          block ;; label = @12
                            local.get 0
                            i32.load8_u
                            i32.const 32
                            i32.and
                            br_if 0 (;@12;)
                            local.get 5
                            i64.const 624
                            i64.add
                            i64.const 256
                            local.get 0
                            call $__fwritex
                            drop
                          end
                          local.get 17
                          i32.const -256
                          i32.add
                          local.tee 17
                          i32.const 255
                          i32.gt_u
                          br_if 0 (;@11;)
                        end
                      end
                      local.get 0
                      i32.load8_u
                      i32.const 32
                      i32.and
                      br_if 0 (;@9;)
                      local.get 5
                      i64.const 624
                      i64.add
                      local.get 17
                      i64.extend_i32_u
                      local.get 0
                      call $__fwritex
                      drop
                    end
                    block ;; label = @9
                      local.get 0
                      i32.load8_u
                      i32.const 32
                      i32.and
                      br_if 0 (;@9;)
                      local.get 5
                      i64.const 80
                      i64.add
                      local.get 20
                      local.get 0
                      call $__fwritex
                      drop
                    end
                    block ;; label = @9
                      local.get 19
                      local.get 20
                      local.get 18
                      i64.add
                      i64.sub
                      i32.wrap_i64
                      local.tee 17
                      i32.const 1
                      i32.lt_s
                      br_if 0 (;@9;)
                      local.get 5
                      i64.const 624
                      i64.add
                      i32.const 48
                      local.get 17
                      i32.const 256
                      local.get 17
                      i32.const 256
                      i32.lt_u
                      local.tee 24
                      select
                      i64.extend_i32_u
                      call $memset
                      drop
                      block ;; label = @10
                        local.get 24
                        br_if 0 (;@10;)
                        loop ;; label = @11
                          block ;; label = @12
                            local.get 0
                            i32.load8_u
                            i32.const 32
                            i32.and
                            br_if 0 (;@12;)
                            local.get 5
                            i64.const 624
                            i64.add
                            i64.const 256
                            local.get 0
                            call $__fwritex
                            drop
                          end
                          local.get 17
                          i32.const -256
                          i32.add
                          local.tee 17
                          i32.const 255
                          i32.gt_u
                          br_if 0 (;@11;)
                        end
                      end
                      local.get 0
                      i32.load8_u
                      i32.const 32
                      i32.and
                      br_if 0 (;@9;)
                      local.get 5
                      i64.const 624
                      i64.add
                      local.get 17
                      i64.extend_i32_u
                      local.get 0
                      call $__fwritex
                      drop
                    end
                    block ;; label = @9
                      local.get 0
                      i32.load8_u
                      i32.const 32
                      i32.and
                      br_if 0 (;@9;)
                      local.get 31
                      local.get 18
                      local.get 0
                      call $__fwritex
                      drop
                    end
                    local.get 21
                    i32.const 8192
                    i32.ne
                    br_if 0 (;@8;)
                    local.get 26
                    local.get 22
                    i32.le_s
                    br_if 0 (;@8;)
                    local.get 5
                    i64.const 624
                    i64.add
                    i32.const 32
                    local.get 26
                    local.get 22
                    i32.sub
                    local.tee 17
                    i32.const 256
                    local.get 17
                    i32.const 256
                    i32.lt_u
                    local.tee 21
                    select
                    i64.extend_i32_u
                    call $memset
                    drop
                    block ;; label = @9
                      local.get 21
                      br_if 0 (;@9;)
                      loop ;; label = @10
                        block ;; label = @11
                          local.get 0
                          i32.load8_u
                          i32.const 32
                          i32.and
                          br_if 0 (;@11;)
                          local.get 5
                          i64.const 624
                          i64.add
                          i64.const 256
                          local.get 0
                          call $__fwritex
                          drop
                        end
                        local.get 17
                        i32.const -256
                        i32.add
                        local.tee 17
                        i32.const 255
                        i32.gt_u
                        br_if 0 (;@10;)
                      end
                    end
                    local.get 0
                    i32.load8_u
                    i32.const 32
                    i32.and
                    br_if 0 (;@8;)
                    local.get 5
                    i64.const 624
                    i64.add
                    local.get 17
                    i64.extend_i32_u
                    local.get 0
                    call $__fwritex
                    drop
                  end
                  local.get 22
                  local.get 26
                  local.get 22
                  local.get 26
                  i32.gt_s
                  select
                  local.tee 17
                  i32.const 0
                  i32.ge_s
                  br_if 3 (;@4;)
                  br 4 (;@3;)
                end
                i64.const 0
                local.set 19
                local.get 14
                local.set 18
              end
              block ;; label = @6
                local.get 28
                i32.eqz
                br_if 0 (;@6;)
                local.get 27
                i32.const 0
                i32.lt_s
                br_if 3 (;@3;)
              end
              local.get 29
              i32.const -65537
              i32.and
              local.get 29
              local.get 28
              select
              local.set 30
              block ;; label = @6
                local.get 19
                i64.const 0
                i64.ne
                br_if 0 (;@6;)
                local.get 27
                br_if 0 (;@6;)
                i32.const 0
                local.set 27
                local.get 14
                local.set 20
                local.get 14
                local.set 18
                br 1 (;@5;)
              end
              local.get 14
              local.get 18
              i64.sub
              local.get 19
              i64.eqz
              i64.extend_i32_u
              i64.add
              local.tee 20
              local.get 27
              i64.extend_i32_s
              local.tee 19
              local.get 20
              local.get 19
              i64.gt_s
              select
              i32.wrap_i64
              local.set 27
              local.get 14
              local.set 20
            end
            local.get 20
            local.get 18
            i64.sub
            local.tee 20
            i32.wrap_i64
            local.tee 29
            local.get 27
            local.get 20
            local.get 27
            i64.extend_i32_s
            i64.gt_s
            select
            local.tee 25
            local.get 24
            i32.const 2147483647
            i32.xor
            i32.gt_s
            br_if 1 (;@3;)
            local.get 26
            local.get 25
            local.get 24
            i32.add
            local.tee 22
            local.get 26
            local.get 22
            i32.gt_s
            select
            local.tee 17
            local.get 21
            i32.gt_s
            br_if 1 (;@3;)
            block ;; label = @5
              local.get 30
              i32.const 73728
              i32.and
              local.tee 27
              br_if 0 (;@5;)
              local.get 22
              local.get 26
              i32.ge_s
              br_if 0 (;@5;)
              local.get 5
              i64.const 112
              i64.add
              i32.const 32
              local.get 17
              local.get 22
              i32.sub
              local.tee 21
              i32.const 256
              local.get 21
              i32.const 256
              i32.lt_u
              local.tee 23
              select
              i64.extend_i32_u
              call $memset
              drop
              block ;; label = @6
                local.get 23
                br_if 0 (;@6;)
                loop ;; label = @7
                  block ;; label = @8
                    local.get 0
                    i32.load8_u
                    i32.const 32
                    i32.and
                    br_if 0 (;@8;)
                    local.get 5
                    i64.const 112
                    i64.add
                    i64.const 256
                    local.get 0
                    call $__fwritex
                    drop
                  end
                  local.get 21
                  i32.const -256
                  i32.add
                  local.tee 21
                  i32.const 255
                  i32.gt_u
                  br_if 0 (;@7;)
                end
              end
              local.get 0
              i32.load8_u
              i32.const 32
              i32.and
              br_if 0 (;@5;)
              local.get 5
              i64.const 112
              i64.add
              local.get 21
              i64.extend_i32_u
              local.get 0
              call $__fwritex
              drop
            end
            block ;; label = @5
              local.get 0
              i32.load8_u
              i32.const 32
              i32.and
              br_if 0 (;@5;)
              local.get 31
              local.get 24
              i64.extend_i32_u
              local.get 0
              call $__fwritex
              drop
            end
            block ;; label = @5
              local.get 27
              i32.const 65536
              i32.ne
              br_if 0 (;@5;)
              local.get 22
              local.get 26
              i32.ge_s
              br_if 0 (;@5;)
              local.get 5
              i64.const 112
              i64.add
              i32.const 48
              local.get 17
              local.get 22
              i32.sub
              local.tee 21
              i32.const 256
              local.get 21
              i32.const 256
              i32.lt_u
              local.tee 24
              select
              i64.extend_i32_u
              call $memset
              drop
              block ;; label = @6
                local.get 24
                br_if 0 (;@6;)
                loop ;; label = @7
                  block ;; label = @8
                    local.get 0
                    i32.load8_u
                    i32.const 32
                    i32.and
                    br_if 0 (;@8;)
                    local.get 5
                    i64.const 112
                    i64.add
                    i64.const 256
                    local.get 0
                    call $__fwritex
                    drop
                  end
                  local.get 21
                  i32.const -256
                  i32.add
                  local.tee 21
                  i32.const 255
                  i32.gt_u
                  br_if 0 (;@7;)
                end
              end
              local.get 0
              i32.load8_u
              i32.const 32
              i32.and
              br_if 0 (;@5;)
              local.get 5
              i64.const 112
              i64.add
              local.get 21
              i64.extend_i32_u
              local.get 0
              call $__fwritex
              drop
            end
            block ;; label = @5
              local.get 25
              local.get 29
              i32.le_s
              br_if 0 (;@5;)
              local.get 5
              i64.const 112
              i64.add
              i32.const 48
              local.get 25
              local.get 29
              i32.sub
              local.tee 21
              i32.const 256
              local.get 21
              i32.const 256
              i32.lt_u
              local.tee 24
              select
              i64.extend_i32_u
              call $memset
              drop
              block ;; label = @6
                local.get 24
                br_if 0 (;@6;)
                loop ;; label = @7
                  block ;; label = @8
                    local.get 0
                    i32.load8_u
                    i32.const 32
                    i32.and
                    br_if 0 (;@8;)
                    local.get 5
                    i64.const 112
                    i64.add
                    i64.const 256
                    local.get 0
                    call $__fwritex
                    drop
                  end
                  local.get 21
                  i32.const -256
                  i32.add
                  local.tee 21
                  i32.const 255
                  i32.gt_u
                  br_if 0 (;@7;)
                end
              end
              local.get 0
              i32.load8_u
              i32.const 32
              i32.and
              br_if 0 (;@5;)
              local.get 5
              i64.const 112
              i64.add
              local.get 21
              i64.extend_i32_u
              local.get 0
              call $__fwritex
              drop
            end
            block ;; label = @5
              local.get 0
              i32.load8_u
              i32.const 32
              i32.and
              br_if 0 (;@5;)
              local.get 18
              local.get 20
              local.get 0
              call $__fwritex
              drop
            end
            local.get 27
            i32.const 8192
            i32.ne
            br_if 0 (;@4;)
            local.get 22
            local.get 26
            i32.ge_s
            br_if 0 (;@4;)
            local.get 5
            i64.const 112
            i64.add
            i32.const 32
            local.get 17
            local.get 22
            i32.sub
            local.tee 21
            i32.const 256
            local.get 21
            i32.const 256
            i32.lt_u
            local.tee 22
            select
            i64.extend_i32_u
            call $memset
            drop
            block ;; label = @5
              local.get 22
              br_if 0 (;@5;)
              loop ;; label = @6
                block ;; label = @7
                  local.get 0
                  i32.load8_u
                  i32.const 32
                  i32.and
                  br_if 0 (;@7;)
                  local.get 5
                  i64.const 112
                  i64.add
                  i64.const 256
                  local.get 0
                  call $__fwritex
                  drop
                end
                local.get 21
                i32.const -256
                i32.add
                local.tee 21
                i32.const 255
                i32.gt_u
                br_if 0 (;@6;)
              end
            end
            local.get 0
            i32.load8_u
            i32.const 32
            i32.and
            br_if 0 (;@4;)
            local.get 5
            i64.const 112
            i64.add
            local.get 21
            i64.extend_i32_u
            local.get 0
            call $__fwritex
            drop
            br 0 (;@4;)
          end
        end
        i64.const 4832
        i32.const 61
        i32.store
      end
      i32.const -1
      local.set 16
    end
    local.get 5
    i64.const 880
    i64.add
    global.set $__stack_pointer
    local.get 16
  )
  (func $pop_arg (;57;) (type 24) (param i64 i32 i64)
    (local i64)
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            block ;; label = @5
              block ;; label = @6
                block ;; label = @7
                  block ;; label = @8
                    block ;; label = @9
                      block ;; label = @10
                        block ;; label = @11
                          block ;; label = @12
                            block ;; label = @13
                              block ;; label = @14
                                block ;; label = @15
                                  block ;; label = @16
                                    block ;; label = @17
                                      block ;; label = @18
                                        block ;; label = @19
                                          local.get 1
                                          i32.const -9
                                          i32.add
                                          br_table 17 (;@2;) 0 (;@19;) 1 (;@18;) 4 (;@15;) 2 (;@17;) 3 (;@16;) 5 (;@14;) 6 (;@13;) 7 (;@12;) 8 (;@11;) 9 (;@10;) 10 (;@9;) 11 (;@8;) 12 (;@7;) 13 (;@6;) 14 (;@5;) 15 (;@4;) 16 (;@3;) 18 (;@1;)
                                        end
                                        local.get 2
                                        local.get 2
                                        i64.load
                                        local.tee 3
                                        i64.const 4
                                        i64.add
                                        i64.store
                                        local.get 0
                                        local.get 3
                                        i64.load32_s
                                        i64.store
                                        return
                                      end
                                      local.get 2
                                      local.get 2
                                      i64.load
                                      local.tee 3
                                      i64.const 4
                                      i64.add
                                      i64.store
                                      local.get 0
                                      local.get 3
                                      i64.load32_u
                                      i64.store
                                      return
                                    end
                                    local.get 2
                                    local.get 2
                                    i64.load
                                    i64.const 7
                                    i64.add
                                    i64.const -8
                                    i64.and
                                    local.tee 3
                                    i64.const 8
                                    i64.add
                                    i64.store
                                    local.get 0
                                    local.get 3
                                    i64.load
                                    i64.store
                                    return
                                  end
                                  local.get 2
                                  local.get 2
                                  i64.load
                                  i64.const 7
                                  i64.add
                                  i64.const -8
                                  i64.and
                                  local.tee 3
                                  i64.const 8
                                  i64.add
                                  i64.store
                                  local.get 0
                                  local.get 3
                                  i64.load
                                  i64.store
                                  return
                                end
                                local.get 2
                                local.get 2
                                i64.load
                                i64.const 7
                                i64.add
                                i64.const -8
                                i64.and
                                local.tee 3
                                i64.const 8
                                i64.add
                                i64.store
                                local.get 0
                                local.get 3
                                i64.load
                                i64.store
                                return
                              end
                              local.get 2
                              local.get 2
                              i64.load
                              local.tee 3
                              i64.const 4
                              i64.add
                              i64.store
                              local.get 0
                              local.get 3
                              i64.load16_s
                              i64.store
                              return
                            end
                            local.get 2
                            local.get 2
                            i64.load
                            local.tee 3
                            i64.const 4
                            i64.add
                            i64.store
                            local.get 0
                            local.get 3
                            i64.load16_u
                            i64.store
                            return
                          end
                          local.get 2
                          local.get 2
                          i64.load
                          local.tee 3
                          i64.const 4
                          i64.add
                          i64.store
                          local.get 0
                          local.get 3
                          i64.load8_s
                          i64.store
                          return
                        end
                        local.get 2
                        local.get 2
                        i64.load
                        local.tee 3
                        i64.const 4
                        i64.add
                        i64.store
                        local.get 0
                        local.get 3
                        i64.load8_u
                        i64.store
                        return
                      end
                      local.get 2
                      local.get 2
                      i64.load
                      i64.const 7
                      i64.add
                      i64.const -8
                      i64.and
                      local.tee 3
                      i64.const 8
                      i64.add
                      i64.store
                      local.get 0
                      local.get 3
                      i64.load
                      i64.store
                      return
                    end
                    local.get 2
                    local.get 2
                    i64.load
                    i64.const 7
                    i64.add
                    i64.const -8
                    i64.and
                    local.tee 3
                    i64.const 8
                    i64.add
                    i64.store
                    local.get 0
                    local.get 3
                    i64.load
                    i64.store
                    return
                  end
                  local.get 2
                  local.get 2
                  i64.load
                  i64.const 7
                  i64.add
                  i64.const -8
                  i64.and
                  local.tee 3
                  i64.const 8
                  i64.add
                  i64.store
                  local.get 0
                  local.get 3
                  i64.load
                  i64.store
                  return
                end
                local.get 2
                local.get 2
                i64.load
                i64.const 7
                i64.add
                i64.const -8
                i64.and
                local.tee 3
                i64.const 8
                i64.add
                i64.store
                local.get 0
                local.get 3
                i64.load
                i64.store
                return
              end
              local.get 2
              local.get 2
              i64.load
              i64.const 7
              i64.add
              i64.const -8
              i64.and
              local.tee 3
              i64.const 8
              i64.add
              i64.store
              local.get 0
              local.get 3
              i64.load
              i64.store
              return
            end
            local.get 2
            local.get 2
            i64.load
            i64.const 7
            i64.add
            i64.const -8
            i64.and
            local.tee 3
            i64.const 8
            i64.add
            i64.store
            local.get 0
            local.get 3
            i64.load
            i64.store
            return
          end
          local.get 2
          local.get 2
          i64.load
          i64.const 7
          i64.add
          i64.const -8
          i64.and
          local.tee 3
          i64.const 8
          i64.add
          i64.store
          local.get 0
          local.get 3
          f64.load
          f64.store
          return
        end
        call $long_double_not_supported
        unreachable
      end
      local.get 2
      local.get 2
      i64.load
      i64.const 7
      i64.add
      i64.const -8
      i64.and
      local.tee 3
      i64.const 8
      i64.add
      i64.store
      local.get 0
      local.get 3
      i64.load
      i64.store
    end
  )
  (func $pad (;58;) (type 25) (param i64 i32 i32 i32 i32)
    (local i64 i64)
    global.get $__stack_pointer
    i64.const 256
    i64.sub
    local.tee 5
    global.set $__stack_pointer
    block ;; label = @1
      local.get 2
      local.get 3
      i32.le_s
      br_if 0 (;@1;)
      local.get 4
      i32.const 73728
      i32.and
      br_if 0 (;@1;)
      local.get 5
      local.get 1
      local.get 2
      local.get 3
      i32.sub
      local.tee 3
      i32.const 256
      local.get 3
      i32.const 256
      i32.lt_u
      local.tee 2
      select
      i64.extend_i32_u
      call $memset
      local.set 6
      block ;; label = @2
        local.get 2
        br_if 0 (;@2;)
        loop ;; label = @3
          block ;; label = @4
            local.get 0
            i32.load8_u
            i32.const 32
            i32.and
            br_if 0 (;@4;)
            local.get 6
            i64.const 256
            local.get 0
            call $__fwritex
            drop
          end
          local.get 3
          i32.const -256
          i32.add
          local.tee 3
          i32.const 255
          i32.gt_u
          br_if 0 (;@3;)
        end
      end
      local.get 0
      i32.load8_u
      i32.const 32
      i32.and
      br_if 0 (;@1;)
      local.get 6
      local.get 3
      i64.extend_i32_u
      local.get 0
      call $__fwritex
      drop
    end
    local.get 5
    i64.const 256
    i64.add
    global.set $__stack_pointer
  )
  (func $long_double_not_supported (;59;) (type 8)
    i64.const 1120
    i64.const 3648
    call $fputs
    drop
    call $abort
    unreachable
  )
  (func $atoi (;60;) (type 14) (param i64) (result i32)
    (local i32 i32 i64 i32)
    loop ;; label = @1
      local.get 0
      i32.load8_s
      local.tee 1
      i32.const -14
      i32.add
      local.set 2
      local.get 0
      i64.const 1
      i64.add
      local.tee 3
      local.set 0
      local.get 1
      i32.const 32
      i32.eq
      br_if 0 (;@1;)
      local.get 3
      local.set 0
      local.get 2
      i32.const -6
      i32.gt_u
      br_if 0 (;@1;)
    end
    i32.const 0
    local.set 4
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            local.get 1
            i32.const -43
            i32.add
            br_table 2 (;@2;) 0 (;@4;) 1 (;@3;) 0 (;@4;)
          end
          local.get 3
          i64.const -1
          i64.add
          local.set 3
          i32.const 0
          local.set 4
          br 2 (;@1;)
        end
        i32.const 1
        local.set 4
      end
      local.get 3
      i32.load8_s
      local.set 1
    end
    i32.const 0
    local.set 2
    block ;; label = @1
      local.get 1
      i32.const -48
      i32.add
      local.tee 1
      i32.const 9
      i32.gt_u
      br_if 0 (;@1;)
      local.get 3
      i64.const 1
      i64.add
      local.set 0
      i32.const 0
      local.set 2
      loop ;; label = @2
        local.get 2
        i32.const 10
        i32.mul
        local.get 1
        i32.sub
        local.set 2
        local.get 0
        i32.load8_s
        local.set 1
        local.get 0
        i64.const 1
        i64.add
        local.set 0
        local.get 1
        i32.const -48
        i32.add
        local.tee 1
        i32.const 10
        i32.lt_u
        br_if 0 (;@2;)
      end
    end
    local.get 2
    i32.const 0
    local.get 2
    i32.sub
    local.get 4
    select
  )
  (func $memcpy (;61;) (type 0) (param i64 i64 i64) (result i64)
    (local i64 i64 i64 i64 i32)
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          local.get 2
          i64.const 32
          i64.gt_u
          br_if 0 (;@3;)
          local.get 1
          i64.const 3
          i64.and
          i64.eqz
          br_if 1 (;@2;)
          local.get 2
          i64.const 0
          i64.eq
          br_if 1 (;@2;)
          local.get 0
          local.get 1
          i32.load8_u
          i32.store8
          local.get 2
          i64.const -1
          i64.add
          local.set 3
          local.get 0
          i64.const 1
          i64.add
          local.set 4
          local.get 1
          i64.const 1
          i64.add
          local.tee 5
          i64.const 3
          i64.and
          i64.eqz
          br_if 2 (;@1;)
          local.get 3
          i64.eqz
          br_if 2 (;@1;)
          local.get 0
          local.get 1
          i32.load8_u offset=1
          i32.store8 offset=1
          local.get 2
          i64.const -2
          i64.add
          local.set 3
          local.get 0
          i64.const 2
          i64.add
          local.set 4
          local.get 1
          i64.const 2
          i64.add
          local.tee 5
          i64.const 3
          i64.and
          i64.eqz
          br_if 2 (;@1;)
          local.get 3
          i64.eqz
          br_if 2 (;@1;)
          local.get 0
          local.get 1
          i32.load8_u offset=2
          i32.store8 offset=2
          local.get 2
          i64.const -3
          i64.add
          local.set 3
          local.get 0
          i64.const 3
          i64.add
          local.set 4
          local.get 1
          i64.const 3
          i64.add
          local.tee 5
          i64.const 3
          i64.and
          i64.eqz
          br_if 2 (;@1;)
          local.get 3
          i64.eqz
          br_if 2 (;@1;)
          local.get 0
          local.get 1
          i32.load8_u offset=3
          i32.store8 offset=3
          local.get 2
          i64.const -4
          i64.add
          local.set 3
          local.get 0
          i64.const 4
          i64.add
          local.set 4
          local.get 1
          i64.const 4
          i64.add
          local.set 5
          br 2 (;@1;)
        end
        local.get 0
        local.get 1
        local.get 2
        memory.copy
        local.get 0
        return
      end
      local.get 2
      local.set 3
      local.get 0
      local.set 4
      local.get 1
      local.set 5
    end
    block ;; label = @1
      block ;; label = @2
        local.get 4
        i64.const 3
        i64.and
        local.tee 2
        i64.const 0
        i64.ne
        br_if 0 (;@2;)
        block ;; label = @3
          block ;; label = @4
            local.get 3
            i64.const 16
            i64.ge_u
            br_if 0 (;@4;)
            local.get 3
            local.set 2
            br 1 (;@3;)
          end
          block ;; label = @4
            local.get 3
            i64.const -16
            i64.add
            local.tee 2
            i64.const 16
            i64.and
            i64.const 0
            i64.ne
            br_if 0 (;@4;)
            local.get 4
            local.get 5
            i64.load align=4
            i64.store align=4
            local.get 4
            local.get 5
            i64.load offset=8 align=4
            i64.store offset=8 align=4
            local.get 4
            i64.const 16
            i64.add
            local.set 4
            local.get 5
            i64.const 16
            i64.add
            local.set 5
            local.get 2
            local.set 3
          end
          local.get 2
          i64.const 16
          i64.lt_u
          br_if 0 (;@3;)
          local.get 3
          local.set 2
          loop ;; label = @4
            local.get 4
            local.get 5
            i64.load align=4
            i64.store align=4
            local.get 4
            local.get 5
            i64.load offset=8 align=4
            i64.store offset=8 align=4
            local.get 4
            local.get 5
            i64.load offset=16 align=4
            i64.store offset=16 align=4
            local.get 4
            local.get 5
            i64.load offset=24 align=4
            i64.store offset=24 align=4
            local.get 4
            i64.const 32
            i64.add
            local.set 4
            local.get 5
            i64.const 32
            i64.add
            local.set 5
            local.get 2
            i64.const -32
            i64.add
            local.tee 2
            i64.const 15
            i64.gt_u
            br_if 0 (;@4;)
          end
        end
        block ;; label = @3
          local.get 2
          i64.const 8
          i64.lt_u
          br_if 0 (;@3;)
          local.get 4
          local.get 5
          i64.load align=4
          i64.store align=4
          local.get 5
          i64.const 8
          i64.add
          local.set 5
          local.get 4
          i64.const 8
          i64.add
          local.set 4
        end
        block ;; label = @3
          local.get 2
          i64.const 4
          i64.and
          i64.eqz
          br_if 0 (;@3;)
          local.get 4
          local.get 5
          i32.load
          i32.store
          local.get 5
          i64.const 4
          i64.add
          local.set 5
          local.get 4
          i64.const 4
          i64.add
          local.set 4
        end
        block ;; label = @3
          local.get 2
          i64.const 2
          i64.and
          i64.eqz
          br_if 0 (;@3;)
          local.get 4
          local.get 5
          i32.load16_u align=1
          i32.store16 align=1
          local.get 4
          i64.const 2
          i64.add
          local.set 4
          local.get 5
          i64.const 2
          i64.add
          local.set 5
        end
        local.get 2
        i64.const 1
        i64.and
        i64.eqz
        br_if 1 (;@1;)
        local.get 4
        local.get 5
        i32.load8_u
        i32.store8
        local.get 0
        return
      end
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            block ;; label = @5
              block ;; label = @6
                local.get 3
                i64.const 32
                i64.lt_u
                br_if 0 (;@6;)
                local.get 2
                i64.const -1
                i64.add
                local.tee 2
                i64.const 2
                i64.gt_u
                br_if 5 (;@1;)
                block ;; label = @7
                  block ;; label = @8
                    local.get 2
                    i32.wrap_i64
                    br_table 3 (;@5;) 0 (;@8;) 1 (;@7;) 3 (;@5;)
                  end
                  local.get 4
                  local.get 5
                  i32.load
                  i32.store16 align=1
                  local.get 4
                  local.get 5
                  i64.const 2
                  i64.add
                  i32.load align=2
                  i32.store offset=2
                  local.get 4
                  local.get 5
                  i64.const 6
                  i64.add
                  i64.load align=2
                  i64.store offset=6 align=4
                  local.get 4
                  i64.const 18
                  i64.add
                  local.set 2
                  local.get 5
                  i64.const 18
                  i64.add
                  local.set 1
                  i64.const 14
                  local.set 6
                  local.get 5
                  i64.const 14
                  i64.add
                  i32.load align=2
                  local.set 7
                  i64.const 14
                  local.set 3
                  br 3 (;@4;)
                end
                local.get 4
                local.get 5
                i32.load
                i32.store8
                local.get 4
                local.get 5
                i64.const 1
                i64.add
                i32.load align=1
                i32.store offset=1
                local.get 4
                local.get 5
                i64.const 5
                i64.add
                i64.load align=1
                i64.store offset=5 align=4
                local.get 4
                i64.const 17
                i64.add
                local.set 2
                local.get 5
                i64.const 17
                i64.add
                local.set 1
                i64.const 13
                local.set 6
                local.get 5
                i64.const 13
                i64.add
                i32.load align=1
                local.set 7
                i64.const 15
                local.set 3
                br 2 (;@4;)
              end
              block ;; label = @6
                block ;; label = @7
                  local.get 3
                  i64.const 16
                  i64.ge_u
                  br_if 0 (;@7;)
                  local.get 4
                  local.set 2
                  local.get 5
                  local.set 1
                  br 1 (;@6;)
                end
                local.get 4
                local.get 5
                i32.load8_u
                i32.store8
                local.get 4
                local.get 5
                i32.load offset=1 align=1
                i32.store offset=1 align=1
                local.get 4
                local.get 5
                i64.load offset=5 align=1
                i64.store offset=5 align=1
                local.get 4
                local.get 5
                i32.load16_u offset=13 align=1
                i32.store16 offset=13 align=1
                local.get 4
                local.get 5
                i32.load8_u offset=15
                i32.store8 offset=15
                local.get 4
                i64.const 16
                i64.add
                local.set 2
                local.get 5
                i64.const 16
                i64.add
                local.set 1
              end
              local.get 3
              i64.const 8
              i64.and
              i64.eqz
              i32.eqz
              br_if 2 (;@3;)
              br 3 (;@2;)
            end
            local.get 4
            local.get 5
            i32.load
            local.tee 7
            i32.store8
            local.get 4
            local.get 7
            i32.const 16
            i32.shr_u
            i32.store8 offset=2
            local.get 4
            local.get 7
            i32.const 8
            i32.shr_u
            i32.store8 offset=1
            local.get 4
            local.get 5
            i64.const 3
            i64.add
            i32.load align=1
            i32.store offset=3
            local.get 4
            local.get 5
            i64.const 7
            i64.add
            i64.load align=1
            i64.store offset=7 align=4
            local.get 4
            i64.const 19
            i64.add
            local.set 2
            local.get 5
            i64.const 19
            i64.add
            local.set 1
            i64.const 15
            local.set 6
            local.get 5
            i64.const 15
            i64.add
            i32.load align=1
            local.set 7
            i64.const 13
            local.set 3
          end
          local.get 4
          local.get 6
          i64.add
          local.get 7
          i32.store
        end
        local.get 2
        local.get 1
        i64.load align=1
        i64.store align=1
        local.get 2
        i64.const 8
        i64.add
        local.set 2
        local.get 1
        i64.const 8
        i64.add
        local.set 1
      end
      block ;; label = @2
        local.get 3
        i64.const 4
        i64.and
        i64.eqz
        br_if 0 (;@2;)
        local.get 2
        local.get 1
        i32.load align=1
        i32.store align=1
        local.get 2
        i64.const 4
        i64.add
        local.set 2
        local.get 1
        i64.const 4
        i64.add
        local.set 1
      end
      block ;; label = @2
        local.get 3
        i64.const 2
        i64.and
        i64.eqz
        br_if 0 (;@2;)
        local.get 2
        local.get 1
        i32.load16_u align=1
        i32.store16 align=1
        local.get 2
        i64.const 2
        i64.add
        local.set 2
        local.get 1
        i64.const 2
        i64.add
        local.set 1
      end
      local.get 3
      i64.const 1
      i64.and
      i64.eqz
      br_if 0 (;@1;)
      local.get 2
      local.get 1
      i32.load8_u
      i32.store8
    end
    local.get 0
  )
  (func $memset (;62;) (type 19) (param i64 i32 i64) (result i64)
    (local i64 i64 i64)
    block ;; label = @1
      local.get 2
      i64.const 33
      i64.lt_u
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      local.get 2
      memory.fill
      local.get 0
      return
    end
    block ;; label = @1
      local.get 2
      i64.eqz
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      i32.store8
      local.get 2
      local.get 0
      i64.add
      local.tee 3
      i64.const -1
      i64.add
      local.get 1
      i32.store8
      local.get 2
      i64.const 3
      i64.lt_u
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      i32.store8 offset=2
      local.get 0
      local.get 1
      i32.store8 offset=1
      local.get 3
      i64.const -3
      i64.add
      local.get 1
      i32.store8
      local.get 3
      i64.const -2
      i64.add
      local.get 1
      i32.store8
      local.get 2
      i64.const 7
      i64.lt_u
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      i32.store8 offset=3
      local.get 3
      i64.const -4
      i64.add
      local.get 1
      i32.store8
      local.get 2
      i64.const 9
      i64.lt_u
      br_if 0 (;@1;)
      local.get 0
      i64.const 0
      local.get 0
      i64.sub
      i64.const 3
      i64.and
      local.tee 3
      i64.add
      local.tee 4
      local.get 1
      i32.const 255
      i32.and
      i32.const 16843009
      i32.mul
      local.tee 1
      i32.store
      local.get 4
      local.get 2
      local.get 3
      i64.sub
      i64.const -4
      i64.and
      local.tee 3
      i64.add
      local.tee 2
      i64.const -4
      i64.add
      local.get 1
      i32.store
      local.get 3
      i64.const 9
      i64.lt_u
      br_if 0 (;@1;)
      local.get 4
      local.get 1
      i32.store offset=8
      local.get 4
      local.get 1
      i32.store offset=4
      local.get 2
      i64.const -8
      i64.add
      local.get 1
      i32.store
      local.get 2
      i64.const -12
      i64.add
      local.get 1
      i32.store
      local.get 3
      i64.const 25
      i64.lt_u
      br_if 0 (;@1;)
      local.get 4
      local.get 1
      i32.store offset=24
      local.get 4
      local.get 1
      i32.store offset=20
      local.get 4
      local.get 1
      i32.store offset=16
      local.get 4
      local.get 1
      i32.store offset=12
      local.get 2
      i64.const -16
      i64.add
      local.get 1
      i32.store
      local.get 2
      i64.const -20
      i64.add
      local.get 1
      i32.store
      local.get 2
      i64.const -24
      i64.add
      local.get 1
      i32.store
      local.get 2
      i64.const -28
      i64.add
      local.get 1
      i32.store
      local.get 3
      local.get 4
      i64.const 4
      i64.and
      i64.const 24
      i64.or
      local.tee 2
      i64.sub
      local.tee 5
      i64.const 32
      i64.lt_u
      br_if 0 (;@1;)
      local.get 1
      i64.extend_i32_u
      i64.const 4294967297
      i64.mul
      local.set 3
      local.get 4
      local.get 2
      i64.add
      local.set 2
      loop ;; label = @2
        local.get 2
        local.get 3
        i64.store offset=24
        local.get 2
        local.get 3
        i64.store offset=16
        local.get 2
        local.get 3
        i64.store offset=8
        local.get 2
        local.get 3
        i64.store
        local.get 2
        i64.const 32
        i64.add
        local.set 2
        local.get 5
        i64.const -32
        i64.add
        local.tee 5
        i64.const 31
        i64.gt_u
        br_if 0 (;@2;)
      end
    end
    local.get 0
  )
  (func $strlen (;63;) (type 10) (param i64) (result i64)
    (local i64 i64)
    local.get 0
    local.set 1
    block ;; label = @1
      block ;; label = @2
        local.get 0
        i64.const 7
        i64.and
        i64.eqz
        br_if 0 (;@2;)
        local.get 0
        local.set 1
        local.get 0
        i32.load8_u
        i32.eqz
        br_if 1 (;@1;)
        local.get 0
        i64.const 1
        i64.add
        local.tee 1
        i64.const 7
        i64.and
        i64.eqz
        br_if 0 (;@2;)
        local.get 1
        i32.load8_u
        i32.eqz
        br_if 1 (;@1;)
        local.get 0
        i64.const 2
        i64.add
        local.tee 1
        i64.const 7
        i64.and
        i64.eqz
        br_if 0 (;@2;)
        local.get 1
        i32.load8_u
        i32.eqz
        br_if 1 (;@1;)
        local.get 0
        i64.const 3
        i64.add
        local.tee 1
        i64.const 7
        i64.and
        i64.eqz
        br_if 0 (;@2;)
        local.get 1
        i32.load8_u
        i32.eqz
        br_if 1 (;@1;)
        local.get 0
        i64.const 4
        i64.add
        local.tee 1
        i64.const 7
        i64.and
        i64.eqz
        br_if 0 (;@2;)
        local.get 1
        i32.load8_u
        i32.eqz
        br_if 1 (;@1;)
        local.get 0
        i64.const 5
        i64.add
        local.tee 1
        i64.const 7
        i64.and
        i64.eqz
        br_if 0 (;@2;)
        local.get 1
        i32.load8_u
        i32.eqz
        br_if 1 (;@1;)
        local.get 0
        i64.const 6
        i64.add
        local.tee 1
        i64.const 7
        i64.and
        i64.eqz
        br_if 0 (;@2;)
        local.get 1
        i32.load8_u
        i32.eqz
        br_if 1 (;@1;)
        local.get 0
        i64.const 7
        i64.add
        local.tee 1
        i64.const 7
        i64.and
        i64.eqz
        br_if 0 (;@2;)
        local.get 1
        i32.load8_u
        i32.eqz
        br_if 1 (;@1;)
        local.get 0
        i64.const 8
        i64.add
        local.set 1
      end
      local.get 1
      i64.const -9
      i64.add
      local.set 1
      loop ;; label = @2
        local.get 1
        i64.const 9
        i64.add
        local.set 2
        local.get 1
        i64.const 8
        i64.add
        local.set 1
        local.get 2
        i64.load
        local.tee 2
        i64.const -1
        i64.xor
        local.get 2
        i64.const -72340172838076673
        i64.add
        i64.and
        i64.const -9187201950435737472
        i64.and
        i64.eqz
        br_if 0 (;@2;)
      end
      loop ;; label = @2
        local.get 1
        i64.const 1
        i64.add
        local.tee 1
        i32.load8_u
        br_if 0 (;@2;)
      end
    end
    local.get 1
    local.get 0
    i64.sub
  )
  (func $memchr (;64;) (type 19) (param i64 i32 i64) (result i64)
    (local i64 i32 i64 i64)
    i64.const 0
    local.set 3
    local.get 2
    i64.const 0
    i64.ne
    local.set 4
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            local.get 0
            i64.const 7
            i64.and
            i64.eqz
            br_if 0 (;@4;)
            local.get 2
            i64.eqz
            br_if 0 (;@4;)
            block ;; label = @5
              local.get 0
              i32.load8_u
              local.get 1
              i32.const 255
              i32.and
              i32.ne
              br_if 0 (;@5;)
              local.get 0
              local.set 5
              local.get 2
              local.set 6
              br 3 (;@2;)
            end
            local.get 2
            i64.const -1
            i64.add
            local.tee 6
            i64.const 0
            i64.ne
            local.set 4
            local.get 0
            i64.const 1
            i64.add
            local.tee 5
            i64.const 7
            i64.and
            i64.eqz
            br_if 1 (;@3;)
            local.get 6
            i64.eqz
            br_if 1 (;@3;)
            local.get 5
            i32.load8_u
            local.get 1
            i32.const 255
            i32.and
            i32.eq
            br_if 2 (;@2;)
            local.get 2
            i64.const -2
            i64.add
            local.tee 6
            i64.const 0
            i64.ne
            local.set 4
            local.get 0
            i64.const 2
            i64.add
            local.tee 5
            i64.const 7
            i64.and
            i64.eqz
            br_if 1 (;@3;)
            local.get 6
            i64.eqz
            br_if 1 (;@3;)
            local.get 5
            i32.load8_u
            local.get 1
            i32.const 255
            i32.and
            i32.eq
            br_if 2 (;@2;)
            local.get 2
            i64.const -3
            i64.add
            local.tee 6
            i64.const 0
            i64.ne
            local.set 4
            local.get 0
            i64.const 3
            i64.add
            local.tee 5
            i64.const 7
            i64.and
            i64.eqz
            br_if 1 (;@3;)
            local.get 6
            i64.eqz
            br_if 1 (;@3;)
            local.get 5
            i32.load8_u
            local.get 1
            i32.const 255
            i32.and
            i32.eq
            br_if 2 (;@2;)
            local.get 2
            i64.const -4
            i64.add
            local.tee 6
            i64.const 0
            i64.ne
            local.set 4
            local.get 0
            i64.const 4
            i64.add
            local.tee 5
            i64.const 7
            i64.and
            i64.eqz
            br_if 1 (;@3;)
            local.get 6
            i64.eqz
            br_if 1 (;@3;)
            local.get 5
            i32.load8_u
            local.get 1
            i32.const 255
            i32.and
            i32.eq
            br_if 2 (;@2;)
            local.get 2
            i64.const -5
            i64.add
            local.tee 6
            i64.const 0
            i64.ne
            local.set 4
            local.get 0
            i64.const 5
            i64.add
            local.tee 5
            i64.const 7
            i64.and
            i64.eqz
            br_if 1 (;@3;)
            local.get 6
            i64.eqz
            br_if 1 (;@3;)
            local.get 5
            i32.load8_u
            local.get 1
            i32.const 255
            i32.and
            i32.eq
            br_if 2 (;@2;)
            local.get 2
            i64.const -6
            i64.add
            local.tee 6
            i64.const 0
            i64.ne
            local.set 4
            local.get 0
            i64.const 6
            i64.add
            local.tee 5
            i64.const 7
            i64.and
            i64.eqz
            br_if 1 (;@3;)
            local.get 6
            i64.eqz
            br_if 1 (;@3;)
            local.get 5
            i32.load8_u
            local.get 1
            i32.const 255
            i32.and
            i32.eq
            br_if 2 (;@2;)
            local.get 2
            i64.const -7
            i64.add
            local.tee 6
            i64.const 0
            i64.ne
            local.set 4
            local.get 0
            i64.const 7
            i64.add
            local.tee 5
            i64.const 7
            i64.and
            i64.eqz
            br_if 1 (;@3;)
            local.get 6
            i64.eqz
            br_if 1 (;@3;)
            local.get 5
            i32.load8_u
            local.get 1
            i32.const 255
            i32.and
            i32.eq
            br_if 2 (;@2;)
            local.get 0
            i64.const 8
            i64.add
            local.set 5
            local.get 2
            i64.const -8
            i64.add
            local.tee 6
            i64.const 0
            i64.ne
            local.set 4
            br 1 (;@3;)
          end
          local.get 2
          local.set 6
          local.get 0
          local.set 5
        end
        local.get 4
        i32.eqz
        br_if 1 (;@1;)
        block ;; label = @3
          local.get 5
          i32.load8_u
          local.get 1
          i32.const 255
          i32.and
          i32.eq
          br_if 0 (;@3;)
          local.get 6
          i64.const 8
          i64.lt_u
          br_if 0 (;@3;)
          local.get 1
          i32.const 255
          i32.and
          i64.extend_i32_u
          i64.const 72340172838076673
          i64.mul
          local.set 0
          loop ;; label = @4
            local.get 5
            i64.load
            local.get 0
            i64.xor
            local.tee 2
            i64.const -1
            i64.xor
            local.get 2
            i64.const -72340172838076673
            i64.add
            i64.and
            i64.const -9187201950435737472
            i64.and
            i64.const 0
            i64.ne
            br_if 2 (;@2;)
            local.get 5
            i64.const 8
            i64.add
            local.set 5
            local.get 6
            i64.const -8
            i64.add
            local.tee 6
            i64.const 7
            i64.gt_u
            br_if 0 (;@4;)
          end
        end
        local.get 6
        i64.eqz
        br_if 1 (;@1;)
      end
      local.get 1
      i32.const 255
      i32.and
      local.set 1
      loop ;; label = @2
        block ;; label = @3
          local.get 5
          i32.load8_u
          local.get 1
          i32.ne
          br_if 0 (;@3;)
          local.get 5
          return
        end
        local.get 5
        i64.const 1
        i64.add
        local.set 5
        i64.const 0
        local.set 3
        local.get 6
        i64.const -1
        i64.add
        local.tee 6
        i64.const 0
        i64.ne
        br_if 0 (;@2;)
      end
    end
    local.get 3
  )
  (func $strnlen (;65;) (type 9) (param i64 i64) (result i64)
    (local i64)
    local.get 1
    local.get 0
    i32.const 0
    local.get 1
    call $memchr
    local.tee 2
    local.get 0
    i64.sub
    local.get 2
    i64.eqz
    select
  )
  (func $__multi3 (;66;) (type 26) (param i64 i64 i64 i64 i64)
    (local i64)
    local.get 0
    local.get 4
    local.get 1
    i64.mul
    local.get 2
    local.get 3
    i64.mul
    i64.add
    local.get 3
    i64.const 32
    i64.shr_u
    local.tee 2
    local.get 1
    i64.const 32
    i64.shr_u
    local.tee 4
    i64.mul
    i64.add
    local.get 3
    i64.const 4294967295
    i64.and
    local.tee 3
    local.get 1
    i64.const 4294967295
    i64.and
    local.tee 1
    i64.mul
    local.tee 5
    i64.const 32
    i64.shr_u
    local.get 3
    local.get 4
    i64.mul
    i64.add
    local.tee 3
    i64.const 32
    i64.shr_u
    i64.add
    local.get 3
    i64.const 4294967295
    i64.and
    local.get 2
    local.get 1
    i64.mul
    i64.add
    local.tee 1
    i64.const 32
    i64.shr_u
    i64.add
    i64.store offset=8
    local.get 0
    local.get 1
    i64.const 32
    i64.shl
    local.get 5
    i64.const 4294967295
    i64.and
    i64.or
    i64.store
  )
  (table (;0;) 5 5 funcref)
  (memory (;0;) i64 2)
  (global $__stack_pointer (;0;) (mut i64) i64.const 71504)
  (export "memory" (memory 0))
  (export "_start" (func $_start))
  (elem (;0;) (i32.const 1) func $__stdio_write $__stdio_close $__stdout_write $__stdio_seek)
  (data $.rodata (;0;) (i64.const 1024) "-+   0X0x\00-0X+0X 0X-0x+0x 0x\00nan\00inf\00NAN\00INF\00.\00(null)\00Usage: %s heapsize index value\0a\00val = %d\0a\00Support for formatting long double values is currently disabled.\0aTo enable it, add -lc-printscan-long-double to the link command.\0a\00Success\00Illegal byte sequence\00Domain error\00Result not representable\00Not a tty\00Permission denied\00Operation not permitted\00No such file or directory\00No such process\00File exists\00Value too large for data type\00No space left on device\00Out of memory\00Resource busy\00Interrupted system call\00Resource temporarily unavailable\00Invalid seek\00Cross-device link\00Read-only file system\00Directory not empty\00Connection reset by peer\00Operation timed out\00Connection refused\00Host is unreachable\00Address in use\00Broken pipe\00I/O error\00No such device or address\00No such device\00Not a directory\00Is a directory\00Text file busy\00Exec format error\00Invalid argument\00Argument list too long\00Symbolic link loop\00Filename too long\00Too many open files in system\00No file descriptors available\00Bad file descriptor\00No child process\00Bad address\00File too large\00Too many links\00No locks available\00Resource deadlock would occur\00State not recoverable\00Previous owner died\00Operation canceled\00Function not implemented\00No message of desired type\00Identifier removed\00Link has been severed\00Protocol error\00Bad message\00Not a socket\00Destination address required\00Message too large\00Protocol wrong type for socket\00Protocol not available\00Protocol not supported\00Not supported\00Address family not supported by protocol\00Address not available\00Network is down\00Network unreachable\00Connection reset by network\00Connection aborted\00No buffer space available\00Socket is connected\00Socket not connected\00Operation already in progress\00Operation in progress\00Stale file handle\00Quota exceeded\00Multihop attempted\00Capabilities insufficient\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00u\02N\00\d6\01\e2\04\b9\04\18\01\8e\05\ed\02\16\04\f2\00\97\03\01\038\05\af\01\82\01O\03/\04\1e\00\d4\05\a2\00\12\03\1e\03\c2\01\de\03\08\00\ac\05\00\01d\02\f1\01e\054\02\8c\02\cf\02-\03L\04\e3\05\9f\02\f8\04\1c\05\08\05\b1\02K\05\15\02x\00R\02<\03\f1\03\e4\00\c3\03}\04\cc\00\aa\03y\05$\02n\01m\03\22\04\ab\04D\00\fb\01\ae\00\83\03`\00\e5\01\07\04\94\04^\04+\00X\019\01\92\00\c2\05\9b\01C\02F\01\f6\05\00\00\00\00\00\00\19\00\0a\00\19\19\19\00\00\00\00\05\00\00\00\00\00\00\09\00\00\00\00\0b\00\00\00\00\00\00\00\00\19\00\11\0a\19\19\19\03\0a\07\00\01\1b\09\0b\18\00\00\09\06\0b\00\00\0b\00\06\19\00\00\00\19\19\19\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\0e\00\00\00\00\00\00\00\00\19\00\0a\0d\19\19\19\00\0d\00\00\02\00\09\0e\00\00\00\09\00\0e\00\00\0e\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\0c\00\00\00\00\00\00\00\00\00\00\00\13\00\00\00\00\13\00\00\00\00\09\0c\00\00\00\00\00\0c\00\00\0c\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\10\00\00\00\00\00\00\00\00\00\00\00\0f\00\00\00\04\0f\00\00\00\00\09\10\00\00\00\00\00\10\00\00\10\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\12\00\00\00\00\00\00\00\00\00\00\00\11\00\00\00\00\11\00\00\00\00\09\12\00\00\00\00\00\12\00\00\12\00\00\1a\00\00\00\1a\1a\1a\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\1a\00\00\00\1a\1a\1a\00\00\00\00\00\00\09\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\14\00\00\00\00\00\00\00\00\00\00\00\17\00\00\00\00\17\00\00\00\00\09\14\00\00\00\00\00\14\00\00\14\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\16\00\00\00\00\00\00\00\00\00\00\00\15\00\00\00\00\15\00\00\00\00\09\16\00\00\00\00\00\16\00\00\16\00\000123456789ABCDEF")
  (data $.data (;1;) (i64.const 3456) "\05\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\03\00\00\00\00\00\00\00\04\00\00\00\00\00\00\00\f8\12\00\00\00\00\00\00\00\04\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\00\00\00\00\0a\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\80\0d\00\00\00\00\00\00\05\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\00\00\00\00\04\00\00\00\00\00\00\00H\17\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\00\00\00\00\ff\ff\ff\ff\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00@\0e\00\00\00\00\00\00")
  (@producers
    (language "C11" "")
    (processed-by "clang" "17.0.0 (git@github.com:TUM-DSE/llvm-memsafe-wasm.git e0177d9830173a0a309525d3c7262ac1557fd40e)")
  )
)