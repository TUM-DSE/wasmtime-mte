(module
  (type (;0;) (func (param i64 i64) (result i32)))
  (type (;1;) (func (param i32)))
  (type (;2;) (func))
  (type (;3;) (func (param i32) (result i32)))
  (type (;4;) (func (param i32 i64) (result i32)))
  (type (;5;) (func (param i64) (result i64)))
  (type (;6;) (func (param i64)))
  (type (;7;) (func (param i64 i64) (result i64)))
  (type (;8;) (func (result i32)))
  (type (;9;) (func (param i64 i32 i64) (result i64)))
  (type (;10;) (func (param i64 i64 i64 i64 i64)))
  (import "wasi_snapshot_preview1" "args_get" (func $__imported_wasi_snapshot_preview1_args_get (;0;) (type 0)))
  (import "wasi_snapshot_preview1" "args_sizes_get" (func $__imported_wasi_snapshot_preview1_args_sizes_get (;1;) (type 0)))
  (import "wasi_snapshot_preview1" "proc_exit" (func $__imported_wasi_snapshot_preview1_proc_exit (;2;) (type 1)))
  (func $__wasm_call_ctors (;3;) (type 2))
  (func $_start (;4;) (type 2)
    (local i32)
    block ;; label = @1
      block ;; label = @2
        i64.const 0
        i32.load offset=1024
        br_if 0 (;@2;)
        i64.const 0
        i32.const 1
        i32.store offset=1024
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
  (func $testStack (;5;) (type 3) (param i32) (result i32)
    (local i64 i64 i64)
    global.get $__stack_pointer
    i64.const 16
    i64.sub
    local.tee 1
    i64.const 16
    segment.stack_new align=1
    local.tee 2
    local.get 0
    i64.extend_i32_s
    i64.const 2
    i64.shl
    i64.add
    local.tee 3
    i32.const 42
    i32.store
    local.get 3
    i32.load
    local.set 0
    local.get 2
    local.get 1
    i64.const 16
    segment.stack_free align=1
    local.get 0
  )
  (func $main (;6;) (type 4) (param i32 i64) (result i32)
    i32.const 0
  )
  (func $malloc (;7;) (type 5) (param i64) (result i64)
    local.get 0
    call $dlmalloc
  )
  (func $dlmalloc (;8;) (type 5) (param i64) (result i64)
    (local i64 i64 i64 i64 i64 i64 i32 i32 i32 i64 i64 i64 i64)
    global.get $__stack_pointer
    i64.const 16
    i64.sub
    local.tee 1
    global.set $__stack_pointer
    block ;; label = @1
      i64.const 0
      i64.load offset=1072
      local.tee 2
      i64.const 0
      i64.ne
      br_if 0 (;@1;)
      block ;; label = @2
        block ;; label = @3
          i64.const 0
          i64.load offset=1968
          local.tee 3
          i64.eqz
          br_if 0 (;@3;)
          i64.const 0
          i64.load offset=1976
          local.set 4
          br 1 (;@2;)
        end
        i64.const 65536
        local.set 4
        i64.const 0
        i64.const 65536
        i64.store offset=1984
        i64.const 0
        i64.const -1
        i64.store offset=1992
        i64.const 0
        i64.const 65536
        i64.store offset=1976
        i64.const 0
        i64.const -1
        i64.store offset=2000
        i64.const 0
        i32.const 0
        i32.store offset=2008
        i64.const 0
        i32.const 0
        i32.store offset=1912
        i64.const 0
        local.get 1
        i64.const 8
        i64.add
        i64.const -16
        i64.and
        i64.const 1431655768
        i64.xor
        local.tee 3
        i64.store offset=1968
      end
      i64.const 0
      local.set 2
      i64.const 67552
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
      i64.const 67552
      i64.sub
      local.tee 5
      i64.const 129
      i64.lt_u
      br_if 0 (;@1;)
      i64.const 0
      local.set 4
      i64.const 0
      local.get 5
      i64.store offset=1928
      i64.const 0
      i64.const 67552
      i64.store offset=1920
      i64.const 0
      i64.const 67552
      i64.store offset=1056
      i64.const 0
      local.get 3
      i64.store offset=1096
      i64.const 0
      i64.const -1
      i64.store offset=1088
      loop ;; label = @2
        local.get 4
        i64.const 1144
        i64.add
        local.get 4
        i64.const 1120
        i64.add
        local.tee 3
        i64.store
        local.get 3
        local.get 4
        i64.const 1104
        i64.add
        local.tee 6
        i64.store
        local.get 4
        i64.const 1128
        i64.add
        local.get 6
        i64.store
        local.get 4
        i64.const 1160
        i64.add
        local.get 4
        i64.const 1136
        i64.add
        local.tee 6
        i64.store
        local.get 6
        local.get 3
        i64.store
        local.get 4
        i64.const 1176
        i64.add
        local.get 4
        i64.const 1152
        i64.add
        local.tee 3
        i64.store
        local.get 3
        local.get 6
        i64.store
        local.get 4
        i64.const 1168
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
      i64.const 67552
      i64.const 0
      i64.const -16
      i64.const 67552
      i64.sub
      i64.const 15
      i64.and
      i64.const 67552
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
      i64.load offset=2000
      i64.store offset=1080
      i64.const 0
      local.get 4
      i64.store offset=1048
      i64.const 0
      local.get 2
      i64.store offset=1072
      i64.const 67552
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
                          i32.load offset=1032
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
                              i64.const 1104
                              i64.add
                              local.tee 4
                              local.get 3
                              i64.const 1120
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
                              i32.store offset=1032
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
                        i64.load offset=1040
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
                              i64.const 1104
                              i64.add
                              local.tee 4
                              local.get 3
                              i64.const 1120
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
                              i32.store offset=1032
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
                            i64.const 1104
                            i64.add
                            local.set 6
                            i64.const 0
                            i64.load offset=1064
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
                                i32.store offset=1032
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
                          i64.store offset=1064
                          i64.const 0
                          local.get 0
                          i64.store offset=1040
                          br 10 (;@1;)
                        end
                        i64.const 0
                        i32.load offset=1036
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
                        i64.const 1632
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
                          i64.load offset=1056
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
                      i32.load offset=1036
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
                              i64.const 1632
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
                            i64.const 1632
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
                      i64.load offset=1040
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
                          i64.load offset=1056
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
                            i64.const 1632
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
                            i32.store offset=1036
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
                          i64.const 1104
                          i64.add
                          local.set 4
                          block ;; label = @12
                            block ;; label = @13
                              i64.const 0
                              i32.load offset=1032
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
                              i32.store offset=1032
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
                        i64.const 1632
                        i64.add
                        local.set 6
                        block ;; label = @11
                          i64.const 0
                          i32.load offset=1036
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
                          i32.store offset=1036
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
                      i64.load offset=1040
                      local.tee 4
                      local.get 5
                      i64.lt_u
                      br_if 0 (;@9;)
                      i64.const 0
                      i64.load offset=1064
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
                      i64.store offset=1040
                      i64.const 0
                      local.get 0
                      i64.store offset=1064
                      local.get 3
                      i64.const 16
                      i64.add
                      local.set 4
                      br 8 (;@1;)
                    end
                    block ;; label = @9
                      i64.const 0
                      i64.load offset=1048
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
                      i64.store offset=1072
                      i64.const 0
                      local.get 3
                      i64.store offset=1048
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
                        i64.load offset=1968
                        i64.eqz
                        br_if 0 (;@10;)
                        i64.const 0
                        i64.load offset=1984
                        local.set 3
                        br 1 (;@9;)
                      end
                      i64.const 65536
                      local.set 3
                      i64.const 0
                      i64.const 65536
                      i64.store offset=1984
                      i64.const 0
                      i64.const -1
                      i64.store offset=1992
                      i64.const 0
                      i64.const 65536
                      i64.store offset=1976
                      i64.const 0
                      i64.const -1
                      i64.store offset=2000
                      i64.const 0
                      i32.const 0
                      i32.store offset=2008
                      i64.const 0
                      i32.const 0
                      i32.store offset=1912
                      i64.const 0
                      local.get 1
                      i64.const 8
                      i64.add
                      i64.const -16
                      i64.and
                      i64.const 1431655768
                      i64.xor
                      i64.store offset=1968
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
                      i32.store offset=1028
                      br 8 (;@1;)
                    end
                    block ;; label = @9
                      i64.const 0
                      i64.load offset=1904
                      local.tee 4
                      i64.eqz
                      br_if 0 (;@9;)
                      block ;; label = @10
                        i64.const 0
                        i64.load offset=1888
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
                      i32.store offset=1028
                      br 8 (;@1;)
                    end
                    i64.const 0
                    i32.load8_u offset=1912
                    i32.const 4
                    i32.and
                    br_if 3 (;@5;)
                    block ;; label = @9
                      block ;; label = @10
                        block ;; label = @11
                          local.get 2
                          i64.eqz
                          br_if 0 (;@11;)
                          i64.const 1920
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
                          i64.load offset=1976
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
                          i64.load offset=1904
                          local.tee 4
                          i64.eqz
                          br_if 0 (;@11;)
                          i64.const 0
                          i64.load offset=1888
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
                        i64.load offset=1984
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
              i32.load offset=1912
              i32.const 4
              i32.or
              i32.store offset=1912
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
          i64.load offset=1888
          local.get 12
          i64.add
          local.tee 4
          i64.store offset=1888
          block ;; label = @4
            local.get 4
            i64.const 0
            i64.load offset=1896
            i64.le_u
            br_if 0 (;@4;)
            i64.const 0
            local.get 4
            i64.store offset=1896
          end
          block ;; label = @4
            block ;; label = @5
              block ;; label = @6
                block ;; label = @7
                  i64.const 0
                  i64.load offset=1072
                  local.tee 3
                  i64.eqz
                  br_if 0 (;@7;)
                  i64.const 1920
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
                    i64.load offset=1056
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
                  i64.store offset=1056
                end
                i64.const 0
                local.set 4
                i64.const 0
                i32.const 0
                i32.store offset=1944
                i64.const 0
                local.get 12
                i64.store offset=1928
                i64.const 0
                local.get 0
                i64.store offset=1920
                i64.const 0
                i64.const -1
                i64.store offset=1088
                i64.const 0
                i64.const 0
                i64.load offset=1968
                i64.store offset=1096
                loop ;; label = @7
                  local.get 4
                  i64.const 1144
                  i64.add
                  local.get 4
                  i64.const 1120
                  i64.add
                  local.tee 3
                  i64.store
                  local.get 3
                  local.get 4
                  i64.const 1104
                  i64.add
                  local.tee 6
                  i64.store
                  local.get 4
                  i64.const 1128
                  i64.add
                  local.get 6
                  i64.store
                  local.get 4
                  i64.const 1160
                  i64.add
                  local.get 4
                  i64.const 1136
                  i64.add
                  local.tee 6
                  i64.store
                  local.get 6
                  local.get 3
                  i64.store
                  local.get 4
                  i64.const 1176
                  i64.add
                  local.get 4
                  i64.const 1152
                  i64.add
                  local.tee 3
                  i64.store
                  local.get 3
                  local.get 6
                  i64.store
                  local.get 4
                  i64.const 1168
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
                i64.load offset=2000
                i64.store offset=1080
                i64.const 0
                local.get 4
                i64.store offset=1048
                i64.const 0
                local.get 3
                i64.store offset=1072
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
              i64.load offset=1048
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
              i64.load offset=2000
              i64.store offset=1080
              i64.const 0
              local.get 6
              i64.store offset=1048
              i64.const 0
              local.get 0
              i64.store offset=1072
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
              i64.load offset=1056
              local.tee 11
              i64.ge_u
              br_if 0 (;@5;)
              i64.const 0
              local.get 0
              i64.store offset=1056
              local.get 0
              local.set 11
            end
            local.get 0
            local.get 12
            i64.add
            local.set 6
            i64.const 1920
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
                      i64.const 1920
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
                      i64.store offset=1072
                      i64.const 0
                      i64.const 0
                      i64.load offset=1048
                      local.get 6
                      i64.add
                      local.tee 4
                      i64.store offset=1048
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
                      i64.load offset=1064
                      i64.ne
                      br_if 0 (;@9;)
                      i64.const 0
                      local.get 5
                      i64.store offset=1064
                      i64.const 0
                      i64.const 0
                      i64.load offset=1040
                      local.get 6
                      i64.add
                      local.tee 4
                      i64.store offset=1040
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
                          i64.const 1104
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
                            i32.load offset=1032
                            i32.const -2
                            local.get 4
                            i64.const 3
                            i64.shr_u
                            i32.wrap_i64
                            i32.rotl
                            i32.and
                            i32.store offset=1032
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
                            i64.const 1632
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
                            i32.load offset=1036
                            i32.const -2
                            local.get 9
                            i32.rotl
                            i32.and
                            i32.store offset=1036
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
                      i64.const 1104
                      i64.add
                      local.set 4
                      block ;; label = @10
                        block ;; label = @11
                          i64.const 0
                          i32.load offset=1032
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
                          i32.store offset=1032
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
                    i64.const 1632
                    i64.add
                    local.set 3
                    block ;; label = @9
                      i64.const 0
                      i32.load offset=1036
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
                      i32.store offset=1036
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
                  i64.load offset=2000
                  i64.store offset=1080
                  i64.const 0
                  local.get 4
                  i64.store offset=1048
                  i64.const 0
                  local.get 2
                  i64.store offset=1072
                  local.get 11
                  i64.const 40
                  i64.add
                  i64.const 0
                  i64.load offset=1944
                  i64.store
                  local.get 11
                  i64.const 32
                  i64.add
                  i64.const 0
                  i64.load offset=1936
                  i64.store
                  local.get 11
                  i64.const 24
                  i64.add
                  i64.const 0
                  i64.load offset=1928
                  i64.store
                  local.get 11
                  i64.const 0
                  i64.load offset=1920
                  i64.store offset=16
                  i64.const 0
                  local.get 11
                  i64.const 16
                  i64.add
                  i64.store offset=1936
                  i64.const 0
                  i32.const 0
                  i32.store offset=1944
                  i64.const 0
                  local.get 0
                  i64.store offset=1920
                  i64.const 0
                  local.get 12
                  i64.store offset=1928
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
                    i64.const 1104
                    i64.add
                    local.set 4
                    block ;; label = @9
                      block ;; label = @10
                        i64.const 0
                        i32.load offset=1032
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
                        i32.store offset=1032
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
                  i64.const 1632
                  i64.add
                  local.set 6
                  block ;; label = @8
                    i64.const 0
                    i32.load offset=1036
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
                    i32.store offset=1036
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
          i64.load offset=1048
          local.tee 4
          local.get 5
          i64.le_u
          br_if 0 (;@3;)
          i64.const 0
          i64.load offset=1072
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
          i64.store offset=1048
          i64.const 0
          local.get 6
          i64.store offset=1072
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
        i32.store offset=1028
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
            i64.const 1632
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
            i32.store offset=1036
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
          i64.const 1104
          i64.add
          local.set 5
          i64.const 0
          i64.load offset=1064
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
              i32.store offset=1032
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
        i64.store offset=1064
        i64.const 0
        local.get 3
        i64.store offset=1040
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
  (func $free (;9;) (type 6) (param i64)
    local.get 0
    call $dlfree
  )
  (func $dlfree (;10;) (type 6) (param i64)
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
        i64.load offset=1056
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
          i64.load offset=1064
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
            i64.const 1104
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
              i32.load offset=1032
              i32.const -2
              local.get 2
              i64.const 3
              i64.shr_u
              i32.wrap_i64
              i32.rotl
              i32.and
              i32.store offset=1032
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
              i64.const 1632
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
              i32.load offset=1036
              i32.const -2
              local.get 8
              i32.rotl
              i32.and
              i32.store offset=1036
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
        i64.store offset=1040
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
            i64.load offset=1072
            i64.ne
            br_if 0 (;@4;)
            i64.const 0
            local.get 1
            i64.store offset=1072
            i64.const 0
            i64.const 0
            i64.load offset=1048
            local.get 0
            i64.add
            local.tee 0
            i64.store offset=1048
            local.get 1
            local.get 0
            i64.const 1
            i64.or
            i64.store offset=8
            local.get 1
            i64.const 0
            i64.load offset=1064
            i64.ne
            br_if 3 (;@1;)
            i64.const 0
            i64.const 0
            i64.store offset=1040
            i64.const 0
            i64.const 0
            i64.store offset=1064
            return
          end
          block ;; label = @4
            local.get 3
            i64.const 0
            i64.load offset=1064
            i64.ne
            br_if 0 (;@4;)
            i64.const 0
            local.get 1
            i64.store offset=1064
            i64.const 0
            i64.const 0
            i64.load offset=1040
            local.get 0
            i64.add
            local.tee 0
            i64.store offset=1040
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
              i64.const 1104
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
                i32.load offset=1032
                i32.const -2
                local.get 2
                i64.const 3
                i64.shr_u
                i32.wrap_i64
                i32.rotl
                i32.and
                i32.store offset=1032
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
                i64.load offset=1056
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
                i64.const 1632
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
                i32.load offset=1036
                i32.const -2
                local.get 8
                i32.rotl
                i32.and
                i32.store offset=1036
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
          i64.load offset=1064
          i64.ne
          br_if 1 (;@2;)
          i64.const 0
          local.get 0
          i64.store offset=1040
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
        i64.const 1104
        i64.add
        local.set 2
        block ;; label = @3
          block ;; label = @4
            i64.const 0
            i32.load offset=1032
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
            i32.store offset=1032
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
      i64.const 1632
      i64.add
      local.set 4
      block ;; label = @2
        block ;; label = @3
          i64.const 0
          i32.load offset=1036
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
          i32.store offset=1036
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
      i64.load offset=1088
      i64.const -1
      i64.add
      local.tee 1
      local.get 1
      i64.eqz
      select
      i64.store offset=1088
    end
  )
  (func $calloc (;11;) (type 7) (param i64 i64) (result i64)
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
  (func $_Exit (;12;) (type 1) (param i32)
    local.get 0
    call $__wasi_proc_exit
    unreachable
  )
  (func $__main_void (;13;) (type 8) (result i32)
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
  (func $__wasi_args_get (;14;) (type 0) (param i64 i64) (result i32)
    local.get 0
    local.get 1
    call $__imported_wasi_snapshot_preview1_args_get
    i32.const 65535
    i32.and
  )
  (func $__wasi_args_sizes_get (;15;) (type 0) (param i64 i64) (result i32)
    local.get 0
    local.get 1
    call $__imported_wasi_snapshot_preview1_args_sizes_get
    i32.const 65535
    i32.and
  )
  (func $__wasi_proc_exit (;16;) (type 1) (param i32)
    local.get 0
    call $__imported_wasi_snapshot_preview1_proc_exit
    unreachable
  )
  (func $abort (;17;) (type 2)
    unreachable
    unreachable
  )
  (func $sbrk (;18;) (type 5) (param i64) (result i64)
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
        i32.store offset=1028
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
  (func $dummy (;19;) (type 2))
  (func $__wasm_call_dtors (;20;) (type 2)
    call $dummy
    call $dummy
  )
  (func $memset (;21;) (type 9) (param i64 i32 i64) (result i64)
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
  (func $__multi3 (;22;) (type 10) (param i64 i64 i64 i64 i64)
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
  (table (;0;) 1 1 funcref)
  (memory (;0;) i64 2)
  (global $__stack_pointer (;0;) (mut i64) i64.const 67552)
  (export "memory" (memory 0))
  (export "_start" (func $_start))
  (export "testStack" (func $testStack))
)