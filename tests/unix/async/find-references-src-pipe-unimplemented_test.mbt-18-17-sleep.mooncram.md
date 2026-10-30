# async find-references sleep src/pipe/unimplemented_test.mbt:18:17

```mooncram
$ export MOON_HOME="${MOON_HOME:-$HOME/.moon}"
```

```mooncram
$ export TEST_REPO_ROOT="$(cd "$TESTDIR/../../../fixtures/repos/async" && pwd)"
```

```mooncram
$ normalize_moon_ide_output() { sed -e "s|$TEST_REPO_ROOT|<WORKDIR>|g" -e "s|$MOON_HOME|<MOON_HOME>|g"; }
```

```mooncram
$ run_moon_ide() { status_file="${TMPDIR:-/tmp}/moon-ide-status.$$"; ( cd "$TEST_REPO_ROOT" && "$@"; echo "$?" > "$status_file" ) 2>&1 | normalize_moon_ide_output; status=$(cat "$status_file"); rm -f "$status_file"; return "$status"; }
```

```mooncram
$ run_moon_ide moon ide find-references 'sleep' --loc 'src/pipe/unimplemented_test.mbt:18:17' --target js
Found 314 references for symbol 'sleep':
<WORKDIR>/src/all_any_test.mbt:20:14-20:19:
   |   let start = @async.now()
   |   let results = @async.all([
   |     () => {
20 |       @async.sleep(400)
   |              ^^^^^
   |       1
   |     },

<WORKDIR>/src/all_any_test.mbt:24:14-24:19:
   |       1
   |     },
   |     () => {
24 |       @async.sleep(200)
   |              ^^^^^
   |       2
   |     },

<WORKDIR>/src/all_any_test.mbt:39:14-39:19:
   |   let log = []
   |   let results = @async.all([
   |     () => {
39 |       @async.sleep(300)
   |              ^^^^^
   |       log.push("task 0")
   |       0

<WORKDIR>/src/all_any_test.mbt:44:14-44:19:
   |       0
   |     },
   |     () => {
44 |       @async.sleep(100)
   |              ^^^^^
   |       log.push("task 1")
   |       1

<WORKDIR>/src/all_any_test.mbt:65:16-65:21:
   |       () => {
   |         log.push("task #1 started")
   |         defer log.push("task #1 completed")
65 |         @async.sleep(200)
   |                ^^^^^
   |         0
   |       },

<WORKDIR>/src/all_any_test.mbt:71:16-71:21:
   |       () => {
   |         log.push("task #2 started")
   |         defer log.push("task #2 completed")
71 |         @async.sleep(100)
   |                ^^^^^
   |         1
   |       },

<WORKDIR>/src/all_any_test.mbt:77:16-77:21:
   |       () => {
   |         log.push("task #3 started")
   |         defer log.push("task #3 completed")
77 |         @async.sleep(200)
   |                ^^^^^
   |         2
   |       },

<WORKDIR>/src/all_any_test.mbt:108:16-108:21:
    |   let result = @test_util.expect_error_async <| () => {
    |     @async.all([
    |       () => {
108 |         @async.sleep(100)
    |                ^^^^^
    |         log.push("task #1 completed")
    |       },

<WORKDIR>/src/all_any_test.mbt:112:16-112:21:
    |         log.push("task #1 completed")
    |       },
    |       () => {
112 |         @async.sleep(200)
    |                ^^^^^
    |         log.push("task #2 failing")
    |         raise Failure::Failure("Err")

<WORKDIR>/src/all_any_test.mbt:117:55-117:60:
    |         raise Failure::Failure("Err")
    |       },
    |       () => {
117 |         match @async.handle_cancellation(() => @async.sleep(300)) {
    |                                                       ^^^^^
    |           None => log.push("task #3 cancelled")
    |           Some(_) => log.push("task #3 completed")

<WORKDIR>/src/all_any_test.mbt:139:51-139:56:
    | async test "all cancelled" {
    |   let log = []
    |   async fn task(idx : Int32, sleep_time : Int32) -> Int32 {
139 |     match @async.handle_cancellation(() => @async.sleep(sleep_time)) {
    |                                                   ^^^^^
    |       None => log.push("task #\{idx} cancelled")
    |       Some(_) => log.push("task #\{idx} completed")

<WORKDIR>/src/all_any_test.mbt:158:14-158:19:
    |   let start = @async.now()
    |   let result = @async.any([
    |     () => {
158 |       @async.sleep(600)
    |              ^^^^^
    |       1
    |     },

<WORKDIR>/src/all_any_test.mbt:162:14-162:19:
    |       1
    |     },
    |     () => {
162 |       @async.sleep(200)
    |              ^^^^^
    |       2
    |     },

<WORKDIR>/src/all_any_test.mbt:166:14-166:19:
    |       2
    |     },
    |     () => {
166 |       @async.sleep(400)
    |              ^^^^^
    |       3
    |     },

<WORKDIR>/src/all_any_test.mbt:179:51-179:56:
    | async test "any returns first success" {
    |   let log = []
    |   async fn task(idx : Int32, sleep_time : Int32) -> Int32 {
179 |     match @async.handle_cancellation(() => @async.sleep(sleep_time)) {
    |                                                   ^^^^^
    |       None => {
    |         log.push("task #\{idx} cancelled")

<WORKDIR>/src/all_any_test.mbt:206:55-206:60:
    |   let result = @test_util.expect_error_async <| () => {
    |     @async.any([
    |       () => {
206 |         match @async.handle_cancellation(() => @async.sleep(300)) {
    |                                                       ^^^^^
    |           None => log.push("task #1 cancelled")
    |           Some(_) => log.push("task #1 completed")

<WORKDIR>/src/all_any_test.mbt:212:16-212:21:
    |         }
    |       },
    |       () => {
212 |         @async.sleep(150)
    |                ^^^^^
    |         raise Failure::Failure("Err")
    |       },

<WORKDIR>/src/all_any_test.mbt:232:16-232:21:
    |   let result = @async.any(
    |     [
    |       () => {
232 |         @async.sleep(300)
    |                ^^^^^
    |         log.push("task #1 failing")
    |         raise Err

<WORKDIR>/src/all_any_test.mbt:237:16-237:21:
    |         raise Err
    |       },
    |       () => {
237 |         @async.sleep(150)
    |                ^^^^^
    |         log.push("task #2 failing")
    |         raise Failure::Failure("fail")

<WORKDIR>/src/all_any_test.mbt:242:16-242:21:
    |         raise Failure::Failure("fail")
    |       },
    |       () => {
242 |         @async.sleep(450)
    |                ^^^^^
    |         log.push("task #3 completed")
    |         2

<WORKDIR>/src/all_any_test.mbt:262:18-262:23:
    |     @async.any(
    |       [
    |         () => {
262 |           @async.sleep(300)
    |                  ^^^^^
    |           log.push("task #1 failing")
    |           raise Err

<WORKDIR>/src/all_any_test.mbt:267:18-267:23:
    |           raise Err
    |         },
    |         () => {
267 |           @async.sleep(150)
    |                  ^^^^^
    |           log.push("task #2 failing")
    |           raise Failure::Failure("fail")

<WORKDIR>/src/all_any_test.mbt:299:51-299:56:
    | async test "any cancelled" {
    |   let log = []
    |   async fn task(idx : Int32, sleep_time : Int32) -> Int32 {
299 |     match @async.handle_cancellation(() => @async.sleep(sleep_time)) {
    |                                                   ^^^^^
    |       None => log.push("task #\{idx} cancelled")
    |       Some(_) => log.push("task #\{idx} completed")

<WORKDIR>/src/allow_failure_test.mbt:20:12-20:17:
   |   let buf = StringBuilder()
   |   @async.with_task_group() <| root => {
   |     root.spawn_bg(allow_failure=true, () => raise Err)
20 |     @async.sleep(100)
   |            ^^^^^
   |     buf <+ "main task terminate\n"
   |   }

<WORKDIR>/src/allow_failure_test.mbt:38:14-38:19:
   |   let err = @test_util.expect_error_async <| () => {
   |     @async.with_task_group(root => {
   |       let task = root.spawn(allow_failure=true, () => raise Err)
38 |       @async.sleep(100)
   |              ^^^^^
   |       task.wait()
   |       buf <+ "main task terminate\n"

<WORKDIR>/src/allow_failure_test.mbt:57:14-57:19:
   |   let buf = StringBuilder()
   |   @async.with_task_group(root => {
   |     root.spawn_bg(allow_failure=true) <| () => {
57 |       @async.sleep(1000)
   |              ^^^^^
   |       buf <+ "`allow_failure` task terminate\n"
   |     }

<WORKDIR>/src/allow_failure_test.mbt:60:12-60:17:
   |       @async.sleep(1000)
   |       buf <+ "`allow_failure` task terminate\n"
   |     }
60 |     @async.sleep(100)
   |            ^^^^^
   |     buf <+ "main task terminate\n"
   |   })

<WORKDIR>/src/aqueue/README.mbt.md:121:16-121:21:
    |       for _ in 0..<3 {
    |         let x = q.get()
    |         log.push("get() => \{x}")
121 |         @async.sleep(100)
    |                ^^^^^
    |       }
    |     }

<WORKDIR>/src/aqueue/README.mbt.md:152:16-152:21:
    |       for _ in 0..<3 {
    |         let x = q.get()
    |         log.push("get() => \{x}")
152 |         @async.sleep(50)
    |                ^^^^^
    |       }
    |     }

<WORKDIR>/src/aqueue/README.mbt.md:322:14-322:19:
    |     let q = @aqueue.Queue(kind=Blocking(1))
    |     q.put(1) // fills the buffer
    |     root.spawn_bg(() => {
322 |       @async.sleep(50)
    |              ^^^^^
    |       q.close()
    |     })

<WORKDIR>/src/aqueue/README.mbt.md:397:16-397:21:
    |     group.spawn_bg() <| () => {
    |       for i in 0..<3 {
    |         q.put("A\{i}")
397 |         @async.sleep(100)
    |                ^^^^^
    |       }
    |     }

<WORKDIR>/src/aqueue/README.mbt.md:402:14-402:19:
    |     }
    |     // Producer B puts items at 50, 150, 250 ms.
    |     group.spawn_bg() <| () => {
402 |       @async.sleep(50)
    |              ^^^^^
    |       for i in 0..<3 {
    |         q.put("B\{i}")

<WORKDIR>/src/aqueue/README.mbt.md:405:16-405:21:
    |       @async.sleep(50)
    |       for i in 0..<3 {
    |         q.put("B\{i}")
405 |         @async.sleep(100)
    |                ^^^^^
    |       }
    |     }

<WORKDIR>/src/aqueue/README.mbt.md:437:18-437:23:
    |         for ;; {
    |           let item = q.get()
    |           work_by_worker[w].push(item)
437 |           @async.sleep(20) // simulate per-item processing cost
    |                  ^^^^^
    |         }
    |       }

<WORKDIR>/src/aqueue/README.mbt.md:476:14-476:19:
    |     root.spawn_bg(() => log.push("r1 got \{q.get()}"))
    |     // Reader 2 starts waiting at ~50 ms.
    |     root.spawn_bg(() => {
476 |       @async.sleep(50)
    |              ^^^^^
    |       log.push("r2 got \{q.get()}")
    |     })

<WORKDIR>/src/aqueue/README.mbt.md:480:12-480:17:
    |       log.push("r2 got \{q.get()}")
    |     })
    |     // Producer puts two items at 100 ms.
480 |     @async.sleep(100)
    |            ^^^^^
    |     q.put(1)
    |     q.put(2)

<WORKDIR>/src/aqueue/aqueue_test.mbt:27:16-27:21:
   |     }
   |     root.spawn_bg() <| () => {
   |       for x in 0..<6 {
27 |         @async.sleep(70)
   |                ^^^^^
   |         queue.put(x)
   |         log.write_string("put(\{x})\n")

<WORKDIR>/src/aqueue/aqueue_test.mbt:59:14-59:19:
   |   @async.with_task_group() <| root => {
   |     let queue = @aqueue.Queue(kind=Unbounded)
   |     root.spawn_bg() <| () => {
59 |       @async.sleep(70)
   |              ^^^^^
   |       let x = queue.get()
   |       log.write_string("task 1: get => \{x}\n")

<WORKDIR>/src/aqueue/aqueue_test.mbt:67:12-67:17:
   |       let x = queue.get()
   |       log.write_string("task 2: get => \{x}\n")
   |     }
67 |     @async.sleep(170)
   |            ^^^^^
   |     queue.put(1)
   |     queue.put(2)

<WORKDIR>/src/aqueue/aqueue_test.mbt:110:12-110:17:
    |   @async.with_task_group() <| group => {
    |     let q = @aqueue.Queue(kind=Unbounded)
    |     let get_task = group.spawn(() => log.write_string("get() => \{q.get()}\n"))
110 |     @async.sleep(100)
    |            ^^^^^
    |     q.put(42)
    |     get_task.cancel()

<WORKDIR>/src/aqueue/aqueue_test.mbt:113:12-113:17:
    |     @async.sleep(100)
    |     q.put(42)
    |     get_task.cancel()
113 |     @async.sleep(100)
    |            ^^^^^
    |     debug_inspect(q.try_get(), content="None")
    |   }

<WORKDIR>/src/aqueue/aqueue_test.mbt:142:12-142:17:
    |         log.write_string("task 2: get => \{x}\n")
    |       }
    |     }
142 |     @async.sleep(70)
    |            ^^^^^
    |     queue.put(1)
    |     queue.put(2)

<WORKDIR>/src/aqueue/aqueue_test.mbt:145:12-145:17:
    |     @async.sleep(70)
    |     queue.put(1)
    |     queue.put(2)
145 |     @async.sleep(70)
    |            ^^^^^
    |     queue.put(3)
    |     queue.put(4)

<WORKDIR>/src/aqueue/aqueue_test.mbt:171:16-171:21:
    |       for _ in 0..<2 {
    |         let x = queue.get()
    |         log.write_string("task 1: get => \{x}\n")
171 |         @async.sleep(200)
    |                ^^^^^
    |         queue.put(x + 1)
    |       }

<WORKDIR>/src/aqueue/aqueue_test.mbt:176:14-176:19:
    |       }
    |     }
    |     root.spawn_bg() <| () => {
176 |       @async.sleep(100)
    |              ^^^^^
    |       for _ in 0..<2 {
    |         let x = queue.get()

<WORKDIR>/src/aqueue/aqueue_test.mbt:180:16-180:21:
    |       for _ in 0..<2 {
    |         let x = queue.get()
    |         log.write_string("task 2: get => \{x}\n")
180 |         @async.sleep(200)
    |                ^^^^^
    |         queue.put(x + 1)
    |       }

<WORKDIR>/src/aqueue/blocking_test.mbt:30:16-30:21:
   |       for _ in 0..<3 {
   |         let x = q.get()
   |         log.push("get() => \{x}")
30 |         @async.sleep(100)
   |                ^^^^^
   |       }
   |     }

<WORKDIR>/src/aqueue/blocking_test.mbt:54:16-54:21:
   |       for _ in 0..<4 {
   |         let x = q.get()
   |         log.push("get() => \{x}")
54 |         @async.sleep(100)
   |                ^^^^^
   |       }
   |     }

<WORKDIR>/src/aqueue/blocking_test.mbt:84:16-84:21:
   |     }
   |     group.spawn_bg(no_wait=true) <| () => {
   |       for ;; {
84 |         @async.sleep(100)
   |                ^^^^^
   |         ignore(q.get())
   |       }

<WORKDIR>/src/aqueue/blocking_test.mbt:102:14-102:19:
    |     let q = @async.Queue(kind=Blocking(1))
    |     q.put(0)
    |     group.spawn_bg(no_wait=true) <| () => {
102 |       @async.sleep(250)
    |              ^^^^^
    |       ignore(q.get())
    |     }

<WORKDIR>/src/aqueue/blocking_test.mbt:133:16-133:21:
    |       for i in 0..<2 {
    |         queue.put(i)
    |         log.push("task 1: put() completed")
133 |         @async.sleep(200)
    |                ^^^^^
    |         let x = queue.get()
    |         log.push("task 1: get() => \{x}")

<WORKDIR>/src/aqueue/blocking_test.mbt:139:14-139:19:
    |       }
    |     }
    |     root.spawn_bg() <| () => {
139 |       @async.sleep(100)
    |              ^^^^^
    |       for i in 0..<2 {
    |         queue.put(i)

<WORKDIR>/src/aqueue/blocking_test.mbt:143:16-143:21:
    |       for i in 0..<2 {
    |         queue.put(i)
    |         log.push("task 2: put() completed")
143 |         @async.sleep(200)
    |                ^^^^^
    |         let x = queue.get()
    |         log.push("task 2: get() => \{x}")

<WORKDIR>/src/aqueue/blocking_test.mbt:148:12-148:17:
    |         log.push("task 2: get() => \{x}")
    |       }
    |     }
148 |     @async.sleep(200)
    |            ^^^^^
    |     inspect(queue.get(), content="0")
    |   }

<WORKDIR>/src/aqueue/blocking_test.mbt:169:12-169:17:
    |         Some(_) => log.push("put() completed")
    |       }
    |     })
169 |     @async.sleep(100)
    |            ^^^^^
    |     let _ = q.get()
    |     put_task.cancel()

<WORKDIR>/src/aqueue/blocking_test.mbt:172:12-172:17:
    |     @async.sleep(100)
    |     let _ = q.get()
    |     put_task.cancel()
172 |     @async.sleep(100)
    |            ^^^^^
    |     debug_inspect(q.try_get(), content="Some(1)")
    |   }

<WORKDIR>/src/aqueue/blocking_test.mbt:193:16-193:21:
    |       for _ in 0..<4 {
    |         let x = q.get()
    |         log.push("get() => \{x}")
193 |         @async.sleep(100)
    |                ^^^^^
    |       }
    |     }

<WORKDIR>/src/aqueue/close_test.mbt:82:14-82:19:
   |   @async.with_task_group() <| group => {
   |     let start = @async.now()
   |     group.spawn_bg() <| () => {
82 |       @async.sleep(300)
   |              ^^^^^
   |       q.close()
   |     }

<WORKDIR>/src/aqueue/close_test.mbt:101:14-101:19:
    |   @async.with_task_group() <| group => {
    |     let start = @async.now()
    |     group.spawn_bg() <| () => {
101 |       @async.sleep(300)
    |              ^^^^^
    |       q.close()
    |     }

<WORKDIR>/src/aqueue/close_test.mbt:120:14-120:19:
    |   @async.with_task_group() <| group => {
    |     let start = @async.now()
    |     group.spawn_bg() <| () => {
120 |       @async.sleep(300)
    |              ^^^^^
    |       q.close()
    |     }

<WORKDIR>/src/async.mbt:103:7-103:12:
    | ) -> X {
    |   with_task_group() <| group => {
    |     group.spawn_bg(no_wait=true) <| () => {
103 |       sleep(time)
    |       ^^^^^
    |       raise error
    |     }

<WORKDIR>/src/async.mbt:123:7-123:12:
    | pub async fn[X] with_timeout_opt(time : Int32, f : async () -> X) -> X? {
    |   with_task_group() <| group => {
    |     group.spawn_bg(no_wait=true) <| () => {
123 |       sleep(time)
    |       ^^^^^
    |       group.return_immediately(None)
    |     }

<WORKDIR>/src/async.mbt:245:16-245:21:
    |           err if fatal_error is Some(f) && f(err) => raise err
    |           err if @coroutine.is_being_cancelled() => raise err
    |           err if max_retry is Some(max) && i >= max => raise err
245 |           _ => sleep(t)
    |                ^^^^^
    |         } noraise {
    |           result => return result

<WORKDIR>/src/async.mbt:257:13-257:18:
    |           err if @coroutine.is_being_cancelled() => raise err
    |           err if max_retry is Some(max) && i >= max => raise err
    |           _ => {
257 |             sleep(timeout)
    |             ^^^^^
    |             continue i + 1,
    |               @cmp.minimum(maximum, (timeout.to_double() * factor).to_int())

<WORKDIR>/src/cancellation_test.mbt:20:53-20:58:
   |   let buf = StringBuilder()
   |   @async.with_task_group(root => {
   |     let task = root.spawn(() => {
20 |       match @async.handle_cancellation(() => @async.sleep(300)) {
   |                                                     ^^^^^
   |         None => buf.write_string("cancelled\n")
   |         Some(_) => buf <+ "task finished\n"

<WORKDIR>/src/cancellation_test.mbt:25:12-25:17:
   |         Some(_) => buf <+ "task finished\n"
   |       }
   |     })
25 |     @async.sleep(100)
   |            ^^^^^
   |     task.cancel()
   |     @async.sleep(200)

<WORKDIR>/src/cancellation_test.mbt:27:12-27:17:
   |     })
   |     @async.sleep(100)
   |     task.cancel()
27 |     @async.sleep(200)
   |            ^^^^^
   |     buf <+ "main task exit\n"
   |   })

<WORKDIR>/src/cancellation_test.mbt:49:16-49:21:
   |   let err = @test_util.expect_error_async <| () => {
   |     @async.with_task_group(root => {
   |       root.spawn_bg() <| () => {
49 |         @async.sleep(300)
   |                ^^^^^
   |         raise Err
   |       }

<WORKDIR>/src/cancellation_test.mbt:54:18-54:23:
   |       }
   |       root.spawn_bg() <| () => {
   |         let result = @async.handle_cancellation() <| () => {
54 |           @async.sleep(200)
   |                  ^^^^^
   |           buf <+ "task 2, tick 1\n"
   |           @async.sleep(200)

<WORKDIR>/src/cancellation_test.mbt:56:18-56:23:
   |         let result = @async.handle_cancellation() <| () => {
   |           @async.sleep(200)
   |           buf <+ "task 2, tick 1\n"
56 |           @async.sleep(200)
   |                  ^^^^^
   |           buf <+ "task 2, tick 2\n"
   |         }

<WORKDIR>/src/cancellation_test.mbt:85:20-85:25:
   |       try
   |         @async.with_task_group() <| fn(ctx) {
   |           ctx.spawn_bg() <| () => {
85 |             @async.sleep(200)
   |                    ^^^^^
   |             raise Err
   |           }

<WORKDIR>/src/cancellation_test.mbt:89:59-89:64:
   |             raise Err
   |           }
   |           ctx.spawn_bg() <| () => {
89 |             match @async.handle_cancellation(() => @async.sleep(400)) {
   |                                                           ^^^^^
   |               None => buf.write_string("ctx 1 task 2 cancelled\n")
   |               Some(_) => buf <+ "ctx 1 task 2 finished\n"

<WORKDIR>/src/cancellation_test.mbt:109:20-109:25:
    |       try
    |         @async.with_task_group() <| fn(ctx) {
    |           ctx.spawn_bg() <| () => {
109 |             @async.sleep(500)
    |                    ^^^^^
    |             raise Err
    |           }

<WORKDIR>/src/cancellation_test.mbt:113:59-113:64:
    |             raise Err
    |           }
    |           ctx.spawn_bg() <| () => {
113 |             match @async.handle_cancellation(() => @async.sleep(300)) {
    |                                                           ^^^^^
    |               None => buf.write_string("ctx 2 task 2 cancelled\n")
    |               Some(_) => buf <+ "ctx 2 task 2 finished\n"

<WORKDIR>/src/cancellation_test.mbt:148:16-148:21:
    |   @async.with_task_group(root => {
    |     root.spawn_bg() <| () => {
    |       for _ in 0..<2 {
148 |         @async.sleep(400)
    |                ^^^^^
    |         buf <+ "tick\n"
    |       }

<WORKDIR>/src/cancellation_test.mbt:153:50-153:55:
    |       }
    |     }
    |     let task = root.spawn(() => {
153 |       if @async.handle_cancellation(() => @async.sleep(1000)) is None {
    |                                                  ^^^^^
    |         buf.write_string("first sleep cancelled\n")
    |       }

<WORKDIR>/src/cancellation_test.mbt:156:50-156:55:
    |       if @async.handle_cancellation(() => @async.sleep(1000)) is None {
    |         buf.write_string("first sleep cancelled\n")
    |       }
156 |       if @async.handle_cancellation(() => @async.sleep(1000)) is None {
    |                                                  ^^^^^
    |         buf.write_string("second sleep cancelled\n")
    |       }

<WORKDIR>/src/cancellation_test.mbt:161:12-161:17:
    |       }
    |       buf <+ "task finished\n"
    |     })
161 |     @async.sleep(600)
    |            ^^^^^
    |     task.cancel()
    |     buf <+ "main task exit\n"

<WORKDIR>/src/cancellation_test.mbt:186:18-186:23:
    |     @async.with_task_group(root => {
    |       root.spawn_bg() <| () => {
    |         @async.with_task_group() <| group => {
186 |           @async.sleep(1)
    |                  ^^^^^
    |           group.spawn_bg(() => raise Err)
    |           buf <+ "after spawn\n"

<WORKDIR>/src/cancellation_test.mbt:189:18-189:23:
    |           @async.sleep(1)
    |           group.spawn_bg(() => raise Err)
    |           buf <+ "after spawn\n"
189 |           @async.sleep(400)
    |                  ^^^^^
    |           buf <+ "main task exit\n"
    |         }

<WORKDIR>/src/cancellation_test.mbt:193:14-193:19:
    |           buf <+ "main task exit\n"
    |         }
    |       }
193 |       @async.sleep(200)
    |              ^^^^^
    |     })
    |   }

<WORKDIR>/src/cancellation_test.mbt:212:55-212:60:
    |   let err = @test_util.expect_error_async <| () => {
    |     @async.with_task_group(root => {
    |       root.spawn_bg(no_wait=true) <| () => {
212 |         match @async.handle_cancellation(() => @async.sleep(1000)) {
    |                                                       ^^^^^
    |           None => {
    |             log <+ "causing other error in cancellation handler\n"

<WORKDIR>/src/cancellation_test.mbt:220:14-220:19:
    |           Some(_) => () (escaped)
    |         }
    |       }
220 |       @async.sleep(200)
    |              ^^^^^
    |     })
    |   }

<WORKDIR>/src/cancellation_test.mbt:240:14-240:19:
    |     let task = root.spawn(() => {
    |       defer log.write_string("task terminated\n")
    |       log <+ "task started\n"
240 |       @async.sleep(100)
    |              ^^^^^
    |       log <+ "task finished\n"
    |     })

<WORKDIR>/src/cancellation_test.mbt:262:56-262:61:
    |   let result = @test_util.expect_error_async <| () => {
    |     @async.with_task_group(group => {
    |       group.spawn_bg(() => raise Failure::Failure("failure"))
262 |       group.spawn_bg(() => group.spawn_bg(() => @async.sleep(100)))
    |                                                        ^^^^^
    |     })
    |   }

<WORKDIR>/src/cond_var/README.mbt.md:57:12-57:17:
   |         log.push("waiter \{i}: unblocked")
   |       }
   |     }
57 |     @async.sleep(50) // ensure all three are parked
   |            ^^^^^
   |     log.push("broadcast()")
   |     cond.broadcast()

<WORKDIR>/src/cond_var/README.mbt.md:115:14-115:19:
    |     }
    |     // Task B parks at ~50 ms.
    |     group.spawn_bg() <| () => {
115 |       @async.sleep(50)
    |              ^^^^^
    |       cond.wait()
    |       log.push("B")

<WORKDIR>/src/cond_var/README.mbt.md:120:12-120:17:
    |       log.push("B")
    |     }
    |     // Two signals, 50 ms apart.
120 |     @async.sleep(100)
    |            ^^^^^
    |     cond.signal()
    |     @async.sleep(50)

<WORKDIR>/src/cond_var/README.mbt.md:122:12-122:17:
    |     // Two signals, 50 ms apart.
    |     @async.sleep(100)
    |     cond.signal()
122 |     @async.sleep(50)
    |            ^^^^^
    |     cond.signal()
    |   }

<WORKDIR>/src/cond_var/cond_var_test.mbt:20:14-20:19:
   |   @async.with_task_group() <| root => {
   |     let cond = @cond_var.Cond()
   |     root.spawn_bg() <| () => {
20 |       @async.sleep(500)
   |              ^^^^^
   |       cond.signal()
   |     }

<WORKDIR>/src/cond_var/cond_var_test.mbt:45:12-45:17:
   |       cond.wait()
   |       log <+ "waiter 2 succeed\n"
   |     }
45 |     @async.sleep(100)
   |            ^^^^^
   |     cond.signal()
   |     wait_task.cancel()

<WORKDIR>/src/cond_var/cond_var_test.mbt:48:12-48:17:
   |     @async.sleep(100)
   |     cond.signal()
   |     wait_task.cancel()
48 |     @async.sleep(100)
   |            ^^^^^
   |   }
   |   inspect(

<WORKDIR>/src/cond_var/cond_var_test.mbt:71:14-71:19:
   |       }
   |     }
   |     root.spawn_bg() <| () => {
71 |       @async.sleep(100)
   |              ^^^^^
   |       for _ in 0..<3 {
   |         cond.wait()

<WORKDIR>/src/cond_var/cond_var_test.mbt:77:12-77:17:
   |         log <+ "task 2 received signal\n"
   |       }
   |     }
77 |     @async.sleep(200)
   |            ^^^^^
   |     for _ in 0..<6 {
   |       cond.signal()

<WORKDIR>/src/cond_var/cond_var_test.mbt:80:14-80:19:
   |     @async.sleep(200)
   |     for _ in 0..<6 {
   |       cond.signal()
80 |       @async.sleep(50)
   |              ^^^^^
   |     }
   |   }

<WORKDIR>/src/cond_var/cond_var_test.mbt:108:12-108:17:
    |         log.write_string("task \{i} received signal\n")
    |       }
    |     }
108 |     @async.sleep(100)
    |            ^^^^^
    |     cond.broadcast()
    |   }

<WORKDIR>/src/cond_var/cond_var_test.mbt:133:12-133:17:
    |         log.write_string("task \{i} received signal\n")
    |       }
    |     }
133 |     @async.sleep(500)
    |            ^^^^^
    |     cond.broadcast()
    |   }

<WORKDIR>/src/fs/unimplemented.mbt:24:17-24:22:
   |   ignore(@int.MAX_VALUE)
   |   ignore(@cmp.minimum(0, 0))
   |   ignore(@io.pipe)
24 |   ignore(@async.sleep)
   |                 ^^^^^
   |   ignore(@event_loop.Timer::new)
   |   ignore(@os_error.unimplemented)

<WORKDIR>/src/group_defer_test.mbt:22:14-22:19:
   |     root.add_defer(() => log <+ "first group defer\n")
   |     root.spawn_bg() <| () => {
   |       defer log.write_string("defer for first task\n")
22 |       @async.sleep(200)
   |              ^^^^^
   |       root.add_defer(() => log <+ "third group defer\n")
   |       @async.sleep(200)

<WORKDIR>/src/group_defer_test.mbt:24:14-24:19:
   |       defer log.write_string("defer for first task\n")
   |       @async.sleep(200)
   |       root.add_defer(() => log <+ "third group defer\n")
24 |       @async.sleep(200)
   |              ^^^^^
   |       log <+ "first task finished\n"
   |     }

<WORKDIR>/src/group_defer_test.mbt:29:14-29:19:
   |     }
   |     root.spawn_bg() <| () => {
   |       defer log.write_string("defer for second task\n")
29 |       @async.sleep(100)
   |              ^^^^^
   |       root.add_defer(() => log <+ "second group defer\n")
   |       @async.sleep(200)

<WORKDIR>/src/group_defer_test.mbt:31:14-31:19:
   |       defer log.write_string("defer for second task\n")
   |       @async.sleep(100)
   |       root.add_defer(() => log <+ "second group defer\n")
31 |       @async.sleep(200)
   |              ^^^^^
   |       log <+ "second task finished\n"
   |     }

<WORKDIR>/src/group_defer_test.mbt:36:14-36:19:
   |     }
   |     root.spawn_bg(no_wait=true) <| () => {
   |       defer log.write_string("defer for cancelled task\n")
36 |       @async.sleep(1000)
   |              ^^^^^
   |     }
   |   }

<WORKDIR>/src/group_defer_test.mbt:63:16-63:21:
   |       root.add_defer(() => log <+ "first group defer\n")
   |       root.spawn_bg() <| () => {
   |         defer log.write_string("defer for first task\n")
63 |         @async.sleep(200)
   |                ^^^^^
   |         root.add_defer(() => log <+ "third group defer\n")
   |         @async.sleep(200)

<WORKDIR>/src/group_defer_test.mbt:65:16-65:21:
   |         defer log.write_string("defer for first task\n")
   |         @async.sleep(200)
   |         root.add_defer(() => log <+ "third group defer\n")
65 |         @async.sleep(200)
   |                ^^^^^
   |         log <+ "first task finished\n"
   |       }

<WORKDIR>/src/group_defer_test.mbt:70:16-70:21:
   |       }
   |       root.spawn_bg() <| () => {
   |         defer log.write_string("defer for second task\n")
70 |         @async.sleep(100)
   |                ^^^^^
   |         root.add_defer(() => log <+ "second group defer\n")
   |         @async.sleep(200)

<WORKDIR>/src/group_defer_test.mbt:72:16-72:21:
   |         defer log.write_string("defer for second task\n")
   |         @async.sleep(100)
   |         root.add_defer(() => log <+ "second group defer\n")
72 |         @async.sleep(200)
   |                ^^^^^
   |         log <+ "second task raise error\n"
   |         raise Err

<WORKDIR>/src/group_defer_test.mbt:78:16-78:21:
   |       }
   |       root.spawn_bg(no_wait=true) <| () => {
   |         defer log.write_string("defer for cancelled task\n")
78 |         @async.sleep(1000)
   |                ^^^^^
   |       }
   |     })

<WORKDIR>/src/group_defer_test.mbt:104:16-104:21:
    |   @async.with_task_group() <| root => {
    |     root.spawn_bg() <| () => {
    |       for _ in 0..<4 {
104 |         @async.sleep(200)
    |                ^^^^^
    |         log <+ "tick\n"
    |       }

<WORKDIR>/src/group_defer_test.mbt:112:20-112:25:
    |       @async.with_task_group(group => {
    |         group.add_defer(() => {
    |           @async.protect_from_cancel() <| () => {
112 |             @async.sleep(200)
    |                    ^^^^^
    |             log <+ "protected async defer completed\n"
    |           }

<WORKDIR>/src/group_defer_test.mbt:117:16-117:21:
    |           }
    |         })
    |         defer log.write_string("start group termination\n")
117 |         @async.sleep(2000)
    |                ^^^^^
    |       })
    |     })

<WORKDIR>/src/gzip/gzip_test.mbt:86:16-86:21:
   |       )
   |       for chunk in source_chunks {
   |         encoder.write(chunk)
86 |         @async.sleep(10)
   |                ^^^^^
   |       }
   |       encoder.end()

<WORKDIR>/src/gzip/gzip_test.mbt:128:14-128:19:
    |       log.push("write plain ab")
    |       encoder.write("ab")
    |       encoder.flush()
128 |       @async.sleep(60)
    |              ^^^^^
    |       log.push("write plain cd")
    |       encoder.write("cd")

<WORKDIR>/src/gzip/gzip_test.mbt:132:14-132:19:
    |       log.push("write plain cd")
    |       encoder.write("cd")
    |       encoder.flush()
132 |       @async.sleep(60)
    |              ^^^^^
    |       log.push("end")
    |       encoder.end()

<WORKDIR>/src/gzip/gzip_test.mbt:157:14-157:19:
    |     root.spawn_bg() <| () => {
    |       defer compressed_w.close()
    |       compressed_w.write(b"\x1f\x8b\x08\x00\x00\x00\x00\x00\x00\xff")
157 |       @async.sleep(20)
    |              ^^^^^
    |       log.push("write plain ab")
    |       compressed_w.write(b"\x00\x02\x00\xfd\xffab")

<WORKDIR>/src/gzip/gzip_test.mbt:160:14-160:19:
    |       @async.sleep(20)
    |       log.push("write plain ab")
    |       compressed_w.write(b"\x00\x02\x00\xfd\xffab")
160 |       @async.sleep(200)
    |              ^^^^^
    |       log.push("write plain cd")
    |       compressed_w.write(b"\x00\x02\x00\xfd\xffcd")

<WORKDIR>/src/gzip/gzip_test.mbt:163:14-163:19:
    |       @async.sleep(200)
    |       log.push("write plain cd")
    |       compressed_w.write(b"\x00\x02\x00\xfd\xffcd")
163 |       @async.sleep(200)
    |              ^^^^^
    |       log.push("write plain ef")
    |       compressed_w.write(b"\x00\x02\x00\xfd\xffef")

<WORKDIR>/src/gzip/gzip_test.mbt:166:14-166:19:
    |       @async.sleep(200)
    |       log.push("write plain ef")
    |       compressed_w.write(b"\x00\x02\x00\xfd\xffef")
166 |       @async.sleep(200)
    |              ^^^^^
    |       log.push("finish")
    |       compressed_w.write(b"\x01\x00\x00\xff\xff")

<WORKDIR>/src/gzip/gzip_test.mbt:200:14-200:19:
    |       defer compressed_w.close()
    |       compressed_w.write(b"\x1f\x8b\x08\x00\x00\x00\x00\x00\x00\xff")
    |       compressed_w.write(b"\x00\x04\x00\xfb\xffabcd")
200 |       @async.sleep(200)
    |              ^^^^^
    |       compressed_w.write(b"\x00\x04\x00\xfb\xffefgh")
    |       compressed_w.write(b"\x01\x00\x00\xff\xff")

<WORKDIR>/src/http/client_test.mbt:72:14-72:19:
   |       log <+ "client sending PUT request\n"
   |       let client = @http.put_stream("http://127.0.0.1:\{port}/put-streaming")
   |       defer client.close()
72 |       @async.sleep(100)
   |              ^^^^^
   |       log <+ "client: sending PUT data part 1\n"
   |       client..write("PUT data part 1\n").flush()

<WORKDIR>/src/http/client_test.mbt:75:14-75:19:
   |       @async.sleep(100)
   |       log <+ "client: sending PUT data part 1\n"
   |       client..write("PUT data part 1\n").flush()
75 |       @async.sleep(100)
   |              ^^^^^
   |       log <+ "client: sending PUT data part 2\n"
   |       client.write("PUT data part 2\n")

<WORKDIR>/src/http/client_test.mbt:86:14-86:19:
   |       log <+ "client sending POST request\n"
   |       let client = @http.post_stream("http://127.0.0.1:\{port}/post-streaming")
   |       defer client.close()
86 |       @async.sleep(100)
   |              ^^^^^
   |       log <+ "client: sending POST data part 1\n"
   |       client..write("POST data part 1\n").flush()

<WORKDIR>/src/http/client_test.mbt:89:14-89:19:
   |       @async.sleep(100)
   |       log <+ "client: sending POST data part 1\n"
   |       client..write("POST data part 1\n").flush()
89 |       @async.sleep(100)
   |              ^^^^^
   |       log <+ "client: sending POST data part 2\n"
   |       client.write("POST data part 2\n")

<WORKDIR>/src/http/client_test.mbt:98:12-98:17:
   |     }
   |     // give some time for the client to close,
   |     // so that the port occupied by the server can be reused immediately.
98 |     @async.sleep(200)
   |            ^^^^^
   |   }
   |   if is_js {

<WORKDIR>/src/http/unimplemented_test.mbt:19:17-19:22:
   | #cfg(not(any(target="native", target="wasm")))
   | let _ignore_unused_import : Unit = {
   |   ignore(@debug.to_string(0))
19 |   ignore(@async.sleep)
   |                 ^^^^^
   |   ignore(@utf8.encode(""))
   |   ignore((_ : @gzip_stream.Encoder[&@io.Writer]) => ())

<WORKDIR>/src/http/unimplemented_wbtest.mbt:21:17-21:22:
   |   ignore(@debug.to_string(0))
   |   let _ : (@gzip_stream.Decoder[&@io.Reader]) -> Unit = ignore
   |   ignore(() => @test.assert_raise(() => ()))
21 |   ignore(@async.sleep)
   |                 ^^^^^
   |   ignore(@fs.unimplemented)
   |   ignore(@bytes_util.ascii_to_string)

<WORKDIR>/src/internal/event_loop/starvation_test.mbt:20:14-20:19:
   |   let log = []
   |   @async.with_task_group() <| group => {
   |     group.spawn_bg() <| () => {
20 |       @async.sleep(50)
   |              ^^^^^
   |       log.push("sleep completed")
   |     }

<WORKDIR>/src/internal/event_loop/unimplemented_test.mbt:18:17-18:22:
   | ///|
   | #cfg(not(any(target="native", target="wasm")))
   | let _ignore_unused_import : Unit = {
18 |   ignore(@async.sleep)
   |                 ^^^^^
   |   ignore(@fs.unimplemented)
   |   ignore(@utf8.encode(""))

<WORKDIR>/src/internal/gzip_internal/gzip_internal_test.mbt:361:17-361:22:
    | ///|
    | #cfg(not(any(target="native", target="wasm")))
    | let _unused : Unit = {
361 |   ignore(@async.sleep)
    |                 ^^^^^
    |   ignore(@fs.unimplemented)
    | }

<WORKDIR>/src/io/README.mbt.md:36:14-36:19:
   |     root.spawn_bg(() => {
   |       defer writer.close()
   |       writer.write(b"Hello, ")
36 |       @async.sleep(10)
   |              ^^^^^
   |       writer.write(b"MoonBit")
   |       @async.sleep(10)

<WORKDIR>/src/io/README.mbt.md:38:14-38:19:
   |       writer.write(b"Hello, ")
   |       @async.sleep(10)
   |       writer.write(b"MoonBit")
38 |       @async.sleep(10)
   |              ^^^^^
   |       writer.write(b"!\n")
   |     })

<WORKDIR>/src/io/README.mbt.md:178:14-178:19:
    |       defer w.close()
    |       // the writer supplieds data in two chunks
    |       w.write("abcd")
178 |       @async.sleep(200)
    |              ^^^^^
    |       w.write("efgh")
    |       @async.sleep(200)

<WORKDIR>/src/io/README.mbt.md:180:14-180:19:
    |       w.write("abcd")
    |       @async.sleep(200)
    |       w.write("efgh")
180 |       @async.sleep(200)
    |              ^^^^^
    |       w.write("ijkl")
    |     })

<WORKDIR>/src/io/README.mbt.md:316:12-316:17:
    | async test "MemoryReader - generate reader content in memory" {
    |   let r = @io.MemoryReader() <| w => {
    |     w.write("hello, ")
316 |     @async.sleep(10)
    |            ^^^^^
    |     w.write("MoonBit")
    |   }

<WORKDIR>/src/io/README.mbt.md:328:14-328:19:
    |   let r = @io.MemoryReader() <| w => {
    |     for part in ["ab", "cd", "ef"] {
    |       w.write(part)
328 |       @async.sleep(10)
    |              ^^^^^
    |     }
    |   }

<WORKDIR>/src/io/README.mbt.md:441:14-441:19:
    |       // Simulate a producer that emits three frames with pauses in between.
    |       log <+ "sending 4 bytes\n"
    |       w2.write(b"abcd")
441 |       @async.sleep(300)
    |              ^^^^^
    |       log <+ "sending 4 bytes\n"
    |       w2.write(b"efgh")

<WORKDIR>/src/io/README.mbt.md:444:14-444:19:
    |       @async.sleep(300)
    |       log <+ "sending 4 bytes\n"
    |       w2.write(b"efgh")
444 |       @async.sleep(300)
    |              ^^^^^
    |       log <+ "sending 4 bytes\n"
    |       w2.write(b"ijkl")

<WORKDIR>/src/io/README.mbt.md:495:14-495:19:
    |       let w = @io.BufferedWriter::new(w, size=4)
    |       log <+ "2 bytes written\n"
    |       w.write("ab")
495 |       @async.sleep(20)
    |              ^^^^^
    |       log <+ "2 bytes written\n"
    |       w.write("cd")

<WORKDIR>/src/io/README.mbt.md:498:14-498:19:
    |       @async.sleep(20)
    |       log <+ "2 bytes written\n"
    |       w.write("cd")
498 |       @async.sleep(20)
    |              ^^^^^
    |       log <+ "2 bytes written\n"
    |       w.write("ef")

<WORKDIR>/src/io/README.mbt.md:586:14-586:19:
    |       defer w2.close()
    |       log <+ "sending 4 bytes\n"
    |       w2.write(b"abcd")
586 |       @async.sleep(100)
    |              ^^^^^
    |       log <+ "sending 4 bytes\n"
    |       w2.write(b"efgh")

<WORKDIR>/src/io/README.mbt.md:589:14-589:19:
    |       @async.sleep(100)
    |       log <+ "sending 4 bytes\n"
    |       w2.write(b"efgh")
589 |       @async.sleep(100)
    |              ^^^^^
    |       log <+ "sending 4 bytes\n"
    |       w2.write(b"ijkl")

<WORKDIR>/src/io/buffered_writer_test.mbt:25:14-25:19:
   |       let w = @io.BufferedWriter::new(w, size=4)
   |       log <+ "2 bytes written\n"
   |       w.write("ab")
25 |       @async.sleep(20)
   |              ^^^^^
   |       log <+ "2 bytes written\n"
   |       w.write("cd")

<WORKDIR>/src/io/buffered_writer_test.mbt:28:14-28:19:
   |       @async.sleep(20)
   |       log <+ "2 bytes written\n"
   |       w.write("cd")
28 |       @async.sleep(20)
   |              ^^^^^
   |       log <+ "2 bytes written\n"
   |       w.write("ef")

<WORKDIR>/src/io/buffered_writer_test.mbt:77:14-77:19:
   |       defer w2.close()
   |       log <+ "sending 4 bytes\n"
   |       w2.write(b"abcd")
77 |       @async.sleep(100)
   |              ^^^^^
   |       log <+ "sending 4 bytes\n"
   |       w2.write(b"efgh")

<WORKDIR>/src/io/buffered_writer_test.mbt:80:14-80:19:
   |       @async.sleep(100)
   |       log <+ "sending 4 bytes\n"
   |       w2.write(b"efgh")
80 |       @async.sleep(100)
   |              ^^^^^
   |       log <+ "sending 4 bytes\n"
   |       w2.write(b"ijkl")

<WORKDIR>/src/io/memory_reader_test.mbt:22:14-22:19:
   |     for data in ["abcd", "1234", "xyzw"] {
   |       log.push("writing \{data}")
   |       w.write(data)
22 |       @async.sleep(150)
   |              ^^^^^
   |     }
   |   }

<WORKDIR>/src/io/memory_reader_test.mbt:51:12-51:17:
   |   }
   |   for _ in 0..<3 {
   |     guard r.read_some() is Some(data) else { break }
51 |     @async.sleep(50)
   |            ^^^^^
   |     log.push("received \{@utf8.decode(data)}")
   |   }

<WORKDIR>/src/io/memory_reader_test.mbt:55:10-55:15:
   |     log.push("received \{@utf8.decode(data)}")
   |   }
   |   r.close()
55 |   @async.sleep(50)
   |          ^^^^^
   |   json_inspect(log, content=[
   |     "written #0 successfully", "received #0", "written #1 successfully", "received #1",

<WORKDIR>/src/io/memory_reader_test.mbt:65:12-65:17:
   | ///|
   | async test "MemoryReader failure" {
   |   let r = @io.MemoryReader() <| _ => {
65 |     @async.sleep(150)
   |            ^^^^^
   |     raise Failure::Failure("failure")
   |   }

<WORKDIR>/src/io/read_all_test.mbt:18:10-18:15:
   | ///|
   | async fn writer(log : StringBuilder, w : @io.PipeWrite) -> Unit {
   |   defer w.close()
18 |   @async.sleep(20)
   |          ^^^^^
   |   log <+ "writing 4 bytes of data\n"
   |   w.write(b"abcd")

<WORKDIR>/src/io/read_all_test.mbt:21:10-21:15:
   |   @async.sleep(20)
   |   log <+ "writing 4 bytes of data\n"
   |   w.write(b"abcd")
21 |   @async.sleep(20)
   |          ^^^^^
   |   log <+ "writing 4 bytes of data\n"
   |   w.write(b"efgh")

<WORKDIR>/src/io/read_all_test.mbt:24:10-24:15:
   |   @async.sleep(20)
   |   log <+ "writing 4 bytes of data\n"
   |   w.write(b"efgh")
24 |   @async.sleep(20)
   |          ^^^^^
   |   log <+ "writing 4 bytes of data\n"
   |   w.write(b"ijkl")

<WORKDIR>/src/io/writer_test.mbt:53:14-53:19:
   |       defer w2.close()
   |       log <+ "sending 4 bytes\n"
   |       w2.write(b"abcd")
53 |       @async.sleep(300)
   |              ^^^^^
   |       log <+ "sending 4 bytes\n"
   |       w2.write(b"efgh")

<WORKDIR>/src/io/writer_test.mbt:56:14-56:19:
   |       @async.sleep(300)
   |       log <+ "sending 4 bytes\n"
   |       w2.write(b"efgh")
56 |       @async.sleep(300)
   |              ^^^^^
   |       log <+ "sending 4 bytes\n"
   |       w2.write(b"ijkl")

<WORKDIR>/src/io/writer_test.mbt:84:10-84:15:
   | ///|
   | impl @io.Writer for DummyWriter with fn write_once(self, buf, offset~, len~) {
   |   guard! offset + len <= buf.length()
84 |   @async.sleep(self.base_timeout)
   |          ^^^^^
   |   let logger = self.logger
   |   logger <+ "writing byte \{buf[offset]}\n"

<WORKDIR>/src/js_async/js_async_test.mbt:19:14-19:19:
   | async test "Promise::from_async" {
   |   let result = @js_async.run_promise(abort_signal => {
   |     @js_async.Promise::from_async(abort_signal~) <| () => {
19 |       @async.sleep(100)
   |              ^^^^^
   |       42
   |     }

<WORKDIR>/src/js_async/js_async_test.mbt:33:18-33:23:
   |     @async.with_timeout(100, () => {
   |       @js_async.run_promise() <| abort_signal => {
   |         @js_async.Promise::from_async(abort_signal~) <| () => {
33 |           @async.sleep(200)
   |                  ^^^^^
   |           worker_finished = true
   |         }

<WORKDIR>/src/js_async/js_async_test.mbt:47:12-47:17:
   | async test "Promise::from_async cancellation 2" {
   |   let controller = @js_async.AbortController::new()
   |   let p = @js_async.Promise::from_async(abort_signal=controller.signal(), () => {
47 |     @async.sleep(200)
   |            ^^^^^
   |   })
   |   @async.sleep(100)

<WORKDIR>/src/js_async/js_async_test.mbt:49:10-49:15:
   |   let p = @js_async.Promise::from_async(abort_signal=controller.signal(), () => {
   |     @async.sleep(200)
   |   })
49 |   @async.sleep(100)
   |          ^^^^^
   |   controller.abort()
   |   debug_inspect(

<WORKDIR>/src/js_async/js_async_test.mbt:63:12-63:17:
   | async test "Promise::from_async cancellation 3" {
   |   let controller = @js_async.AbortController::new()
   |   let p = @js_async.Promise::from_async(abort_signal=controller.signal(), () => {
63 |     @async.sleep(100)
   |            ^^^^^
   |   })
   |   @async.sleep(200)

<WORKDIR>/src/js_async/js_async_test.mbt:65:10-65:15:
   |   let p = @js_async.Promise::from_async(abort_signal=controller.signal(), () => {
   |     @async.sleep(100)
   |   })
65 |   @async.sleep(200)
   |          ^^^^^
   |   controller.abort()
   |   p.wait()

<WORKDIR>/src/js_async/js_async_test.mbt:92:12-92:17:
   |   let controller = @js_async.AbortController::new()
   |   let signal = controller.signal()
   |   let promise = @js_async.Promise::from_async(abort_signal=signal, () => {
92 |     @async.sleep(100)
   |            ^^^^^
   |   })
   |   inspect(abort_listener_count(signal), content="1")

<WORKDIR>/src/js_async/js_async_test.mbt:106:14-106:19:
    |   let promise : @js_async.Promise[Unit] = @js_async.Promise::from_async(
    |     abort_signal=signal,
    |     () => {
106 |       @async.sleep(100)
    |              ^^^^^
    |       raise Failure::Failure("expected")
    |     },

<WORKDIR>/src/js_async/js_async_test.mbt:124:12-124:17:
    |   let mut worker_finished = false
    |   let promise = @js_async.Promise::from_async(abort_signal=signal, () => {
    |     worker_started = true
124 |     @async.sleep(100)
    |            ^^^^^
    |     worker_finished = true
    |   })

<WORKDIR>/src/js_async/readable_stream_test.mbt:35:14-35:19:
   |       write("message2")
   |       // there should be back pressure here
   |       write("message3")
35 |       @async.sleep(400)
   |              ^^^^^
   |       write("message4")
   |     }

<WORKDIR>/src/js_async/readable_stream_test.mbt:40:14-40:19:
   |     }
   |     group.spawn_bg() <| () => {
   |       defer r.close()
40 |       @async.sleep(200)
   |              ^^^^^
   |       while r.read_some() is Some(data) {
   |         log.push("reader: \{@utf8.decode(data)} at tick #\{tick()}")

<WORKDIR>/src/js_async/unimplemented_test.mbt:18:17-18:22:
   | ///|
   | #coverage.skip
   | let _ignore_unused_import : Unit = {
18 |   ignore(@async.sleep)
   |                 ^^^^^
   |   ignore(@utf8.encode(""))
   |   ignore((f : async () -> Unit) => @test_util.assert_raise_async(f))

<WORKDIR>/src/lazy_init_test.mbt:25:12-25:17:
   | 
   |   let x = @async.Lazy(() => {
   |     log.push("lazy init started at tick \{current_tick()}")
25 |     @async.sleep(200)
   |            ^^^^^
   |     log.push("lazy init completed at tick \{current_tick()}")
   |   })

<WORKDIR>/src/lazy_init_test.mbt:28:10-28:15:
   |     @async.sleep(200)
   |     log.push("lazy init completed at tick \{current_tick()}")
   |   })
28 |   @async.sleep(200)
   |          ^^^^^
   |   x.wait()
   |   log.push("got lazy init result at tick \{current_tick()}")

<WORKDIR>/src/lazy_init_test.mbt:42:12-42:17:
   | ///|
   | async test "lazy init failure" {
   |   let x : @async.Lazy[Unit] = Lazy(() => {
42 |     @async.sleep(200)
   |            ^^^^^
   |     raise Failure::Failure("msg")
   |   })

<WORKDIR>/src/lazy_init_test.mbt:78:51-78:56:
   | 
   |   let x = @async.Lazy(() => {
   |     log.push("lazy init started at tick \{current_tick()}")
78 |     match @async.handle_cancellation(() => @async.sleep(400)) {
   |                                                   ^^^^^
   |       None => {
   |         log.push("lazy init cancelled at tick \{current_tick()}")

<WORKDIR>/src/lazy_init_test.mbt:87:10-87:15:
   |     }
   |   })
   |   debug_inspect(@async.with_timeout_opt(200, () => x.wait()), content="None")
87 |   @async.sleep(100)
   |          ^^^^^
   |   // the previous attempt is already cancelled,
   |   // this `wait` will trigger a new attempt

<WORKDIR>/src/lazy_init_test.mbt:107:51-107:56:
    | 
    |   let x = @async.Lazy(() => {
    |     log.push("lazy init started at tick \{current_tick()}")
107 |     match @async.handle_cancellation(() => @async.sleep(400)) {
    |                                                   ^^^^^
    |       None => log.push("lazy init cancelled at tick \{current_tick()}")
    |       Some(_) => log.push("lazy init completed at tick \{current_tick()}")

<WORKDIR>/src/lazy_init_test.mbt:135:51-135:56:
    | 
    |   let x = @async.Lazy(() => {
    |     log.push("lazy init started at tick \{current_tick()}")
135 |     match @async.handle_cancellation(() => @async.sleep(600)) {
    |                                                   ^^^^^
    |       None => log.push("lazy init cancelled at tick \{current_tick()}")
    |       Some(_) => log.push("lazy init completed at tick \{current_tick()}")

<WORKDIR>/src/mutex_test.mbt:24:16-24:21:
   |       group.spawn_bg() <| () => {
   |         mutex.acquire()
   |         log.push("task \{i} acquired mutex")
24 |         @async.sleep(300)
   |                ^^^^^
   |         mutex.release()
   |       }

<WORKDIR>/src/mutex_test.mbt:28:12-28:17:
   |         mutex.release()
   |       }
   |     }
28 |     @async.sleep(150)
   |            ^^^^^
   |     for _ in 0..<3 {
   |       log.push("tick")

<WORKDIR>/src/mutex_test.mbt:31:14-31:19:
   |     @async.sleep(150)
   |     for _ in 0..<3 {
   |       log.push("tick")
31 |       @async.sleep(300)
   |              ^^^^^
   |     }
   |   }

<WORKDIR>/src/mutex_test.mbt:46:14-46:19:
   |     let mutex = @async.Mutex()
   |     group.spawn_bg() <| () => {
   |       mutex.acquire()
46 |       @async.sleep(500)
   |              ^^^^^
   |       mutex.release()
   |     }

<WORKDIR>/src/mutex_test.mbt:55:12-55:17:
   |       },
   |       content="TimeoutError",
   |     )
55 |     @async.sleep(500)
   |            ^^^^^
   |     inspect(mutex.try_acquire(), content="true")
   |   }

<WORKDIR>/src/mutex_test.mbt:70:12-70:17:
   |       mutex.acquire()
   |       log.push("acquire() succeed")
   |     })
70 |     @async.sleep(100)
   |            ^^^^^
   |     mutex.release()
   |     acquire_taskire_task.cancel()

<WORKDIR>/src/mutex_test.mbt:73:12-73:17:
   |     @async.sleep(100)
   |     mutex.release()
   |     acquire_taskire_task.cancel()
73 |     @async.sleep(100)
   |            ^^^^^
   |     inspect(mutex.try_acquire(), content="false")
   |   }

<WORKDIR>/src/mutex_test.mbt:88:16-88:21:
   |       for _ in 0..<3 {
   |         mutex.acquire()
   |         log.push("task 1 acquired mutex")
88 |         @async.sleep(200)
   |                ^^^^^
   |         mutex.release()
   |       }

<WORKDIR>/src/mutex_test.mbt:93:14-93:19:
   |       }
   |     }
   |     group.spawn_bg() <| () => {
93 |       @async.sleep(100)
   |              ^^^^^
   |       for _ in 0..<3 {
   |         mutex.acquire()

<WORKDIR>/src/mutex_test.mbt:97:16-97:21:
   |       for _ in 0..<3 {
   |         mutex.acquire()
   |         log.push("task 2 acquired mutex")
97 |         @async.sleep(200)
   |                ^^^^^
   |         mutex.release()
   |       }

<WORKDIR>/src/no_wait_test.mbt:20:53-20:58:
   |   let buf = StringBuilder()
   |   @async.with_task_group() <| root => {
   |     root.spawn_bg(no_wait=true) <| () => {
20 |       match @async.handle_cancellation(() => @async.sleep(1000)) {
   |                                                     ^^^^^
   |         None => buf.write_string("`no_wait` task cancelled\n")
   |         Some(_) => buf <+ "`no_wait` task finished successfully\n"

<WORKDIR>/src/no_wait_test.mbt:25:12-25:17:
   |         Some(_) => buf <+ "`no_wait` task finished successfully\n"
   |       }
   |     }
25 |     @async.sleep(100)
   |            ^^^^^
   |     buf <+ "main task terminate\n"
   |   }

<WORKDIR>/src/no_wait_test.mbt:43:53-43:58:
   |   let buf = StringBuilder()
   |   @async.with_task_group() <| root => {
   |     root.spawn_bg(no_wait=true) <| () => {
43 |       match @async.handle_cancellation(() => @async.sleep(100)) {
   |                                                     ^^^^^
   |         None => buf.write_string("`no_wait` task cancelled\n")
   |         Some(_) => buf <+ "`no_wait` task finished successfully\n"

<WORKDIR>/src/no_wait_test.mbt:48:12-48:17:
   |         Some(_) => buf <+ "`no_wait` task finished successfully\n"
   |       }
   |     }
48 |     @async.sleep(200)
   |            ^^^^^
   |     buf <+ "main task terminate\n"
   |   }

<WORKDIR>/src/os_error/unimplemented_test.mbt:18:17-18:22:
   | ///|
   | #cfg(not(any(target="native", target="wasm")))
   | let _ignore_unused_import : Unit = {
18 |   ignore(@async.sleep)
   |                 ^^^^^
   |   ignore(@fs.unimplemented)
   |   ignore((f : async () -> Unit) => @test_util.assert_raise_async(f))

<WORKDIR>/src/pipe/unimplemented_test.mbt:18:17-18:22:
   | ///|
   | #cfg(not(target="native"))
   | let _ignore_unused_import : Unit = {
18 |   ignore(@async.sleep)
   |                 ^^^^^
   |   ignore(@utf8.encode(""))
   |   ignore((f : async () -> Unit) => @test_util.assert_raise_async(f))

<WORKDIR>/src/process/unimplemented.mbt:21:17-21:22:
   | #coverage.skip
   | pub let unimplemented : Unit = {
   |   ignore(@io.pipe)
21 |   ignore(@async.sleep)
   |                 ^^^^^
   |   ignore(@event_loop.Timer::new)
   |   ignore(@coroutine.Coroutine::wake)

<WORKDIR>/src/protect_from_cancel_test.mbt:21:55-21:60:
   |   @async.with_task_group(root => {
   |     root.spawn_bg() <| () => {
   |       @async.protect_from_cancel <| () => {
21 |         match @async.handle_cancellation(() => @async.sleep(400)) {
   |                                                       ^^^^^
   |           None => log.write_string("critial job cancelled\n")
   |           Some(_) => log <+ "critical job finished\n"

<WORKDIR>/src/protect_from_cancel_test.mbt:26:53-26:58:
   |           Some(_) => log <+ "critical job finished\n"
   |         }
   |       }
26 |       match @async.handle_cancellation(() => @async.sleep(200)) {
   |                                                     ^^^^^
   |         None => log <+ "job cancelled after critical part\n"
   |         Some(_) => log <+ "non-critial part of job finished\n"

<WORKDIR>/src/protect_from_cancel_test.mbt:32:53-32:58:
   |       }
   |     }
   |     root.spawn_bg() <| () => {
32 |       match @async.handle_cancellation(() => @async.sleep(400)) {
   |                                                     ^^^^^
   |         None => log.write_string("non-critial job cancelled\n")
   |         Some(_) => log <+ "non-critical job finished\n"

<WORKDIR>/src/protect_from_cancel_test.mbt:37:12-37:17:
   |         Some(_) => log <+ "non-critical job finished\n"
   |       }
   |     }
37 |     @async.sleep(200)
   |            ^^^^^
   |     raise Err
   |   }) catch {

<WORKDIR>/src/protect_from_cancel_test.mbt:58:14-58:19:
   |   let log = StringBuilder()
   |   @async.with_task_group(root => {
   |     root.spawn_bg() <| () => {
58 |       @async.sleep(200)
   |              ^^^^^
   |       log <+ "200ms tick\n"
   |       @async.sleep(200)

<WORKDIR>/src/protect_from_cancel_test.mbt:60:14-60:19:
   |     root.spawn_bg() <| () => {
   |       @async.sleep(200)
   |       log <+ "200ms tick\n"
60 |       @async.sleep(200)
   |              ^^^^^
   |       log <+ "400ms tick\n"
   |     }

<WORKDIR>/src/protect_from_cancel_test.mbt:65:16-65:21:
   |     }
   |     @async.with_task_group(group => {
   |       group.spawn_bg() <| () => {
65 |         @async.sleep(300)
   |                ^^^^^
   |         log.write_string("trying to cancel the group containing critial job\n")
   |         raise Err

<WORKDIR>/src/protect_from_cancel_test.mbt:70:16-70:21:
   |         raise Err
   |       }
   |       @async.protect_from_cancel() <| () => {
70 |         @async.sleep(500)
   |                ^^^^^
   |         log <+ "critial job finished\n"
   |       }

<WORKDIR>/src/protect_from_cancel_test.mbt:96:14-96:19:
   |   let log = StringBuilder()
   |   @async.with_task_group() <| root => {
   |     root.spawn_bg() <| () => {
96 |       @async.sleep(200)
   |              ^^^^^
   |       log <+ "200ms tick\n"
   |       @async.sleep(200)

<WORKDIR>/src/protect_from_cancel_test.mbt:98:14-98:19:
   |     root.spawn_bg() <| () => {
   |       @async.sleep(200)
   |       log <+ "200ms tick\n"
98 |       @async.sleep(200)
   |              ^^^^^
   |       log <+ "400ms tick\n"
   |     }

<WORKDIR>/src/protect_from_cancel_test.mbt:103:16-103:21:
    |     }
    |     @async.with_timeout_opt(300, () => {
    |       @async.protect_from_cancel() <| () => {
103 |         @async.sleep(500)
    |                ^^^^^
    |         log <+ "critial job finished\n"
    |       }

<WORKDIR>/src/protect_from_cancel_test.mbt:129:18-129:23:
    |     (
    |       @async.with_task_group(root => {
    |         root.spawn_bg() <| () => {
129 |           @async.sleep(200)
    |                  ^^^^^
    |           log <+ "200ms tick\n"
    |           @async.sleep(200)

<WORKDIR>/src/protect_from_cancel_test.mbt:131:18-131:23:
    |         root.spawn_bg() <| () => {
    |           @async.sleep(200)
    |           log <+ "200ms tick\n"
131 |           @async.sleep(200)
    |                  ^^^^^
    |           log <+ "400ms tick\n"
    |         }

<WORKDIR>/src/protect_from_cancel_test.mbt:136:20-136:25:
    |         }
    |         @async.with_timeout(300, () => {
    |           @async.protect_from_cancel() <| () => {
136 |             @async.sleep(500)
    |                    ^^^^^
    |             log <+ "critial job fail\n"
    |             raise Err

<WORKDIR>/src/protect_from_cancel_test.mbt:160:14-160:19:
    |   let log = StringBuilder()
    |   @async.with_task_group() <| root => {
    |     root.spawn_bg() <| () => {
160 |       @async.sleep(200)
    |              ^^^^^
    |       log <+ "200ms tick\n"
    |       @async.sleep(200)

<WORKDIR>/src/protect_from_cancel_test.mbt:162:14-162:19:
    |     root.spawn_bg() <| () => {
    |       @async.sleep(200)
    |       log <+ "200ms tick\n"
162 |       @async.sleep(200)
    |              ^^^^^
    |       log <+ "400ms tick\n"
    |     }

<WORKDIR>/src/protect_from_cancel_test.mbt:168:18-168:23:
    |     @async.with_timeout_opt(300, () => {
    |       @async.protect_from_cancel() <| () => {
    |         @async.protect_from_cancel() <| () => {
168 |           @async.sleep(500)
    |                  ^^^^^
    |           log <+ "critial job finished\n"
    |         }

<WORKDIR>/src/protect_from_cancel_test.mbt:193:14-193:19:
    |   let log = StringBuilder()
    |   @async.with_task_group() <| root => {
    |     root.spawn_bg() <| () => {
193 |       @async.sleep(200)
    |              ^^^^^
    |       log <+ "200ms tick\n"
    |       @async.sleep(200)

<WORKDIR>/src/protect_from_cancel_test.mbt:195:14-195:19:
    |     root.spawn_bg() <| () => {
    |       @async.sleep(200)
    |       log <+ "200ms tick\n"
195 |       @async.sleep(200)
    |              ^^^^^
    |       log <+ "400ms tick\n"
    |       @async.sleep(200)

<WORKDIR>/src/protect_from_cancel_test.mbt:197:14-197:19:
    |       log <+ "200ms tick\n"
    |       @async.sleep(200)
    |       log <+ "400ms tick\n"
197 |       @async.sleep(200)
    |              ^^^^^
    |       log <+ "600ms tick\n"
    |     }

<WORKDIR>/src/protect_from_cancel_test.mbt:203:18-203:23:
    |     @async.with_timeout_opt(100, () => {
    |       @async.protect_from_cancel() <| () => {
    |         @async.protect_from_cancel() <| () => {
203 |           @async.sleep(300)
    |                  ^^^^^
    |           log <+ "inner critial job finished\n"
    |         }

<WORKDIR>/src/protect_from_cancel_test.mbt:206:16-206:21:
    |           @async.sleep(300)
    |           log <+ "inner critial job finished\n"
    |         }
206 |         @async.sleep(200)
    |                ^^^^^
    |         log <+ "outer critial job finished\n"
    |       }

<WORKDIR>/src/protect_from_cancel_test.mbt:232:53-232:58:
    |   let log = StringBuilder()
    |   @async.with_task_group(root => {
    |     root.spawn_bg(no_wait=true) <| () => {
232 |       match @async.handle_cancellation(() => @async.sleep(400)) {
    |                                                     ^^^^^
    |         None => {
    |           log.write_string("cancelled\n")

<WORKDIR>/src/protect_from_cancel_test.mbt:236:20-236:25:
    |         None => {
    |           log.write_string("cancelled\n")
    |           @async.protect_from_cancel() <| () => {
236 |             @async.sleep(200)
    |                    ^^^^^
    |             log <+ "critial cancellation handler terminated\n"
    |           }

<WORKDIR>/src/protect_from_cancel_test.mbt:243:12-243:17:
    |         Some(_) => () (escaped)
    |       }
    |     }
243 |     @async.sleep(200)
    |            ^^^^^
    |     log <+ "start cancellation\n"
    |   })

<WORKDIR>/src/protect_from_cancel_test.mbt:263:16-263:21:
    |   @async.with_task_group() <| root => {
    |     root.spawn_bg() <| () => {
    |       for _ in 0..<2 {
263 |         @async.sleep(200)
    |                ^^^^^
    |         log <+ "tick\n"
    |       }

<WORKDIR>/src/protect_from_cancel_test.mbt:279:20-279:25:
    |             // However, since current coroutine is still in `run_later`,
    |             // the scheduler will wakeup current coroutine immediately,
    |             // before the timer expires.
279 |             @async.sleep(300)
    |                    ^^^^^
    |             log <+ "async cleanup finished\n"
    |           }

<WORKDIR>/src/protect_from_cancel_test.mbt:306:16-306:21:
    |   @async.with_task_group() <| root => {
    |     root.spawn_bg() <| () => {
    |       for _ in 0..<2 {
306 |         @async.sleep(300)
    |                ^^^^^
    |         log <+ "tick\n"
    |       }

<WORKDIR>/src/protect_from_cancel_test.mbt:315:20-315:25:
    |         errdefer {
    |           log <+ "performing async cleanup\n"
    |           @async.protect_from_cancel() <| () => {
315 |             @async.sleep(300)
    |                    ^^^^^
    |             log <+ "raising error from async cleanup\n"
    |             raise Err

<WORKDIR>/src/protect_from_cancel_test.mbt:320:16-320:21:
    |             raise Err
    |           }
    |         }
320 |         @async.sleep(1000)
    |                ^^^^^
    |       }
    |       @async.sleep(150)

<WORKDIR>/src/protect_from_cancel_test.mbt:322:14-322:19:
    |         }
    |         @async.sleep(1000)
    |       }
322 |       @async.sleep(150)
    |              ^^^^^
    |       log <+ "main task of inner group done\n"
    |     })

<WORKDIR>/src/retry_test.mbt:86:14-86:19:
   |   let mut i = 0
   |   @async.with_timeout(500, () => {
   |     @async.retry(Immediate) <| () => {
86 |       @async.sleep(200)
   |              ^^^^^
   |       log.write_string("loop \{i}\n")
   |       i = i + 1

<WORKDIR>/src/retry_test.mbt:142:45-142:50:
    |     log.write_string("worker run #\{i}\n")
    |     i = i + 1
    |     if i < 3 {
142 |       @async.with_timeout(100, () => @async.sleep(1000))
    |                                             ^^^^^
    |     } else {
    |       raise Failure::Failure("fatal error")

<WORKDIR>/src/return_immediately_test.mbt:19:14-19:19:
   | async test "return_immediately basic" {
   |   @async.with_task_group(root => {
   |     root.spawn_bg() <| () => {
19 |       @async.sleep(200)
   |              ^^^^^
   |       root.return_immediately(())
   |     }

<WORKDIR>/src/return_immediately_test.mbt:22:39-22:44:
   |       @async.sleep(200)
   |       root.return_immediately(())
   |     }
22 |     root.spawn_bg() <| () => { @async.sleep(300) }
   |                                       ^^^^^
   |   })
   | }

<WORKDIR>/src/return_immediately_test.mbt:29:39-29:44:
   | ///|
   | async test "return_immediately nested" {
   |   @async.with_task_group(root => {
29 |     root.spawn_bg() <| () => { @async.sleep(300) }
   |                                       ^^^^^
   |     @async.with_task_group() <| fn(group) {
   |       group.spawn_bg() <| () => {

<WORKDIR>/src/return_immediately_test.mbt:32:16-32:21:
   |     root.spawn_bg() <| () => { @async.sleep(300) }
   |     @async.with_task_group() <| fn(group) {
   |       group.spawn_bg() <| () => {
32 |         @async.sleep(200)
   |                ^^^^^
   |         root.return_immediately(())
   |       }

<WORKDIR>/src/return_immediately_test.mbt:35:42-35:47:
   |         @async.sleep(200)
   |         root.return_immediately(())
   |       }
35 |       group.spawn_bg() <| () => { @async.sleep(300) }
   |                                          ^^^^^
   |     }
   |   })

<WORKDIR>/src/return_immediately_test.mbt:46:16-46:21:
   |   let err = @test_util.expect_error_async <| () => {
   |     @async.with_task_group(root => {
   |       root.spawn_bg() <| () => {
46 |         @async.sleep(200)
   |                ^^^^^
   |         root.return_immediately(())
   |       }

<WORKDIR>/src/return_immediately_test.mbt:50:55-50:60:
   |         root.return_immediately(())
   |       }
   |       root.spawn_bg() <| () => {
50 |         match @async.handle_cancellation(() => @async.sleep(300)) {
   |                                                       ^^^^^
   |           None => {
   |             log <+ "task cancelled, causing other error\n"

<WORKDIR>/src/return_immediately_test.mbt:75:14-75:19:
   |   let log = []
   |   @async.with_task_group() <| group => {
   |     group.spawn_bg() <| () => {
75 |       @async.sleep(100)
   |              ^^^^^
   |       log.push("100ms tick")
   |     }

<WORKDIR>/src/return_immediately_test.mbt:79:20-79:25:
   |       log.push("100ms tick")
   |     }
   |     @async.with_task_group <| group => {
79 |       defer @async.sleep(200)
   |                    ^^^^^
   |       group.return_immediately(())
   |     }

<WORKDIR>/src/return_immediately_test.mbt:92:14-92:19:
   |   let log = []
   |   @async.with_task_group() <| outer => {
   |     outer.spawn_bg() <| () => {
92 |       @async.sleep(100)
   |              ^^^^^
   |       log.push("100ms tick")
   |     }

<WORKDIR>/src/semaphore/README.mbt.md:50:16-50:21:
   |         mutex.acquire()
   |         defer mutex.release()
   |         log.push("task \{i}: enter")
50 |         @async.sleep(50)
   |                ^^^^^
   |         log.push("task \{i}: leave")
   |       }

<WORKDIR>/src/semaphore/README.mbt.md:94:16-94:21:
   |         if active > peak {
   |           peak = active
   |         }
94 |         @async.sleep(30)
   |                ^^^^^
   |         active = active - 1
   |       }

<WORKDIR>/src/semaphore/README.mbt.md:137:14-137:19:
    |     }
    |     group.spawn_bg() <| () => {
    |       log.push("signaller: setup")
137 |       @async.sleep(50)
    |              ^^^^^
    |       log.push("signaller: release")
    |       ready.release()

<WORKDIR>/src/semaphore/README.mbt.md:167:16-167:21:
    |   @async.with_task_group <| group => {
    |     for i in 0..<n {
    |       group.spawn_bg() <| () => {
167 |         @async.sleep(20 * (i + 1))
    |                ^^^^^
    |         log.push("worker \{i} done")
    |         done.release()

<WORKDIR>/src/semaphore/README.mbt.md:242:14-242:19:
    |     }
    |     // Task B starts waiting at ~50 ms.
    |     group.spawn_bg() <| () => {
242 |       @async.sleep(50)
    |              ^^^^^
    |       sem.acquire()
    |       log.push("B acquired")

<WORKDIR>/src/semaphore/README.mbt.md:247:12-247:17:
    |       log.push("B acquired")
    |       sem.release()
    |     }
247 |     @async.sleep(100)
    |            ^^^^^
    |     sem.release() // main hands off the permit
    |   }

<WORKDIR>/src/semaphore/semaphore_test.mbt:24:16-24:21:
   |       root.spawn_bg() <| () => {
   |         semaphore.acquire()
   |         log.write_string("task \{i} obtained resource\n")
24 |         @async.sleep(300)
   |                ^^^^^
   |         semaphore.release()
   |       }

<WORKDIR>/src/semaphore/semaphore_test.mbt:28:12-28:17:
   |         semaphore.release()
   |       }
   |     }
28 |     @async.sleep(150)
   |            ^^^^^
   |     for _ in 0..<3 {
   |       log <+ "tick\n"

<WORKDIR>/src/semaphore/semaphore_test.mbt:31:14-31:19:
   |     @async.sleep(150)
   |     for _ in 0..<3 {
   |       log <+ "tick\n"
31 |       @async.sleep(300)
   |              ^^^^^
   |     }
   |   }

<WORKDIR>/src/semaphore/semaphore_test.mbt:57:16-57:21:
   |       root.spawn_bg() <| () => {
   |         semaphore.acquire()
   |         log.write_string("task \{i} obtained resource\n")
57 |         @async.sleep(300)
   |                ^^^^^
   |         semaphore.release()
   |       }

<WORKDIR>/src/semaphore/semaphore_test.mbt:61:12-61:17:
   |         semaphore.release()
   |       }
   |     }
61 |     @async.sleep(150)
   |            ^^^^^
   |     for _ in 0..<3 {
   |       log <+ "tick\n"

<WORKDIR>/src/semaphore/semaphore_test.mbt:64:14-64:19:
   |     @async.sleep(150)
   |     for _ in 0..<3 {
   |       log <+ "tick\n"
64 |       @async.sleep(300)
   |              ^^^^^
   |     }
   |   }

<WORKDIR>/src/semaphore/semaphore_test.mbt:90:14-90:19:
   |     let semaphore = @semaphore.Semaphore(1)
   |     root.spawn_bg() <| () => {
   |       semaphore.acquire()
90 |       @async.sleep(500)
   |              ^^^^^
   |       semaphore.release()
   |     }

<WORKDIR>/src/semaphore/semaphore_test.mbt:99:12-99:17:
   |       },
   |       content="TimeoutError",
   |     )
99 |     @async.sleep(500)
   |            ^^^^^
   |     inspect(semaphore.try_acquire(), content="true")
   |   }

<WORKDIR>/src/semaphore/semaphore_test.mbt:114:12-114:17:
    |       semaphore.acquire()
    |       log <+ "acquire() succeed\n"
    |     })
114 |     @async.sleep(100)
    |            ^^^^^
    |     semaphore.release()
    |     acquire_taskire_task.cancel()

<WORKDIR>/src/semaphore/semaphore_test.mbt:117:12-117:17:
    |     @async.sleep(100)
    |     semaphore.release()
    |     acquire_taskire_task.cancel()
117 |     @async.sleep(100)
    |            ^^^^^
    |     inspect(semaphore.try_acquire(), content="false")
    |   }

<WORKDIR>/src/semaphore/semaphore_test.mbt:138:16-138:21:
    |       for _ in 0..<3 {
    |         semaphore.acquire()
    |         log <+ "task 1 acquired resource\n"
138 |         @async.sleep(200)
    |                ^^^^^
    |         semaphore.release()
    |       }

<WORKDIR>/src/semaphore/semaphore_test.mbt:143:14-143:19:
    |       }
    |     }
    |     root.spawn_bg() <| () => {
143 |       @async.sleep(100)
    |              ^^^^^
    |       for _ in 0..<3 {
    |         semaphore.acquire()

<WORKDIR>/src/semaphore/semaphore_test.mbt:147:16-147:21:
    |       for _ in 0..<3 {
    |         semaphore.acquire()
    |         log <+ "task 2 acquired resource\n"
147 |         @async.sleep(200)
    |                ^^^^^
    |         semaphore.release()
    |       }

<WORKDIR>/src/signal/unimplemented_test.mbt:19:17-19:22:
   | #cfg(not(any(target="native", target="wasm")))
   | let _ignore_unused_import : Unit = {
   |   ignore(@utf8.encode(""))
19 |   ignore(@async.sleep)
   |                 ^^^^^
   |   ignore(@process.unimplemented)
   | }

<WORKDIR>/src/socket/unimplemented.mbt:23:17-23:22:
   |   ignore(() => @string.parse_int("0"))
   |   ignore(@io.pipe)
   |   ignore(@event_loop.Timer::new)
23 |   ignore(@async.sleep)
   |                 ^^^^^
   |   ignore(@os_error.unimplemented)
   |   ignore(@fd_util.unimplemented)

<WORKDIR>/src/spawn_test.mbt:21:16-21:21:
   |   let result = @test_util.expect_error_async <| () => {
   |     @async.with_task_group(root => {
   |       root.spawn_bg() <| () => {
21 |         @async.sleep(1000)
   |                ^^^^^
   |         buf <+ "task 1 finished\n"
   |       }

<WORKDIR>/src/spawn_test.mbt:25:16-25:21:
   |         buf <+ "task 1 finished\n"
   |       }
   |       root.spawn_bg() <| () => {
25 |         @async.sleep(200)
   |                ^^^^^
   |         raise Err
   |       }

<WORKDIR>/src/spawn_test.mbt:45:16-45:21:
   |   let result = @test_util.expect_error_async <| () => {
   |     @async.with_task_group(root => {
   |       root.spawn_bg() <| () => {
45 |         @async.sleep(200)
   |                ^^^^^
   |         raise Err
   |       }

<WORKDIR>/src/spawn_test.mbt:49:16-49:21:
   |         raise Err
   |       }
   |       root.spawn_bg() <| () => {
49 |         @async.sleep(1000)
   |                ^^^^^
   |         buf <+ "task 1 finished\n"
   |       }

<WORKDIR>/src/spawn_test.mbt:73:51-73:56:
   |           // emulate a non-cancellable job,
   |           // or a job that happens to be completed on cancellation,
   |           // such that discarding the result may lead to data loss
73 |           @async.protect_from_cancel(() => @async.sleep(300))
   |                                                   ^^^^^
   |           // even if control flow enters here normally,
   |           // current task and the whole group may be in a cancelled state

<WORKDIR>/src/spawn_test.mbt:78:20-78:25:
   |           // current task and the whole group may be in a cancelled state
   |           group.spawn_bg(allow_failure=true) <| () => {
   |             log.push("enter child task after cancelled")
78 |             @async.sleep(100)
   |                    ^^^^^
   |             log.push("child task completed")
   |           }

<WORKDIR>/src/spawn_test.mbt:82:16-82:21:
   |             log.push("child task completed")
   |           }
   |         }
82 |         @async.sleep(150)
   |                ^^^^^
   |         raise Failure::Failure("failure")
   |       }) : Unit)

<WORKDIR>/src/stdio/unimplemented_test.mbt:18:17-18:22:
   | ///|
   | #cfg(not(any(target="native", target="wasm")))
   | let _ignore_unused_import : Unit = {
18 |   ignore(@async.sleep)
   |                 ^^^^^
   |   ignore(@fs.unimplemented)
   |   ignore(@process.unimplemented)

<WORKDIR>/src/timer_test.mbt:20:14-20:19:
   |   let buf = StringBuilder()
   |   @async.with_task_group() <| root => {
   |     root.spawn_bg() <| () => {
20 |       @async.sleep(100)
   |              ^^^^^
   |       buf <+ "task 1, tick 1\n"
   |       @async.sleep(200)

<WORKDIR>/src/timer_test.mbt:22:14-22:19:
   |     root.spawn_bg() <| () => {
   |       @async.sleep(100)
   |       buf <+ "task 1, tick 1\n"
22 |       @async.sleep(200)
   |              ^^^^^
   |       buf <+ "task 1, tick 2\n"
   |       @async.sleep(200)

<WORKDIR>/src/timer_test.mbt:24:14-24:19:
   |       buf <+ "task 1, tick 1\n"
   |       @async.sleep(200)
   |       buf <+ "task 1, tick 2\n"
24 |       @async.sleep(200)
   |              ^^^^^
   |       buf <+ "task 1, tick 3\n"
   |     }

<WORKDIR>/src/timer_test.mbt:28:14-28:19:
   |       buf <+ "task 1, tick 3\n"
   |     }
   |     root.spawn_bg() <| () => {
28 |       @async.sleep(200)
   |              ^^^^^
   |       buf <+ "task 2, tick 1\n"
   |       @async.sleep(200)

<WORKDIR>/src/timer_test.mbt:30:14-30:19:
   |     root.spawn_bg() <| () => {
   |       @async.sleep(200)
   |       buf <+ "task 2, tick 1\n"
30 |       @async.sleep(200)
   |              ^^^^^
   |       buf <+ "task 2, tick 2\n"
   |       @async.sleep(200)

<WORKDIR>/src/timer_test.mbt:32:14-32:19:
   |       buf <+ "task 2, tick 1\n"
   |       @async.sleep(200)
   |       buf <+ "task 2, tick 2\n"
32 |       @async.sleep(200)
   |              ^^^^^
   |       buf <+ "task 2, tick 3\n"
   |     }

<WORKDIR>/src/timer_test.mbt:55:14-55:19:
   |   let log = []
   |   @async.with_task_group() <| group => {
   |     group.spawn_bg() <| () => {
55 |       @async.sleep(150)
   |              ^^^^^
   |       log.push("sleep: tick #1")
   |       @async.sleep(300)

<WORKDIR>/src/timer_test.mbt:57:14-57:19:
   |     group.spawn_bg() <| () => {
   |       @async.sleep(150)
   |       log.push("sleep: tick #1")
57 |       @async.sleep(300)
   |              ^^^^^
   |       log.push("sleep: tick #2")
   |       @async.sleep(300)

<WORKDIR>/src/timer_test.mbt:59:14-59:19:
   |       log.push("sleep: tick #1")
   |       @async.sleep(300)
   |       log.push("sleep: tick #2")
59 |       @async.sleep(300)
   |              ^^^^^
   |       log.push("sleep: tick #3")
   |     }

<WORKDIR>/src/timer_test.mbt:62:12-62:17:
   |       @async.sleep(300)
   |       log.push("sleep: tick #3")
   |     }
62 |     @async.sleep(300)
   |            ^^^^^
   |     log.push("creating timer")
   |     let timer = @async.Timer(300)

<WORKDIR>/src/timer_test.mbt:85:10-85:15:
   | ///|
   | async test "Timer no waiter" {
   |   let timer = @async.Timer(200)
85 |   @async.sleep(400)
   |          ^^^^^
   |   debug_inspect(
   |     @async.with_timeout_opt(0, () => timer.wait()),

<WORKDIR>/src/timer_test.mbt:104:10-104:15:
    | async test "Timer waiter cancelled 1" {
    |   let timer = @async.Timer(600)
    |   assert_true(@async.with_timeout_opt(200, () => timer.wait()) is None)
104 |   @async.sleep(200)
    |          ^^^^^
    |   assert_false(@async.with_timeout_opt(300, () => timer.wait()) is None)
    | }

<WORKDIR>/src/timer_test.mbt:112:10-112:15:
    | async test "Timer waiter cancelled 2" {
    |   let timer = @async.Timer(300)
    |   assert_true(@async.with_timeout_opt(200, () => timer.wait()) is None)
112 |   @async.sleep(200)
    |          ^^^^^
    |   assert_false(@async.with_timeout_opt(0, () => timer.wait()) is None)
    | }

<WORKDIR>/src/timer_test.mbt:126:14-126:19:
    |   let timer = @async.Timer(450)
    |   @async.with_task_group() <| group => {
    |     group.spawn_bg() <| () => {
126 |       @async.sleep(150)
    |              ^^^^^
    |       timer.cancel()
    |     }

<WORKDIR>/src/timer_test.mbt:133:12-133:17:
    |       let result = @test_util.expect_error_async(() => timer.wait())
    |       log.push("Timer::wait(): \{@debug.to_string(result)} at tick #\{tick()}")
    |     }
133 |     @async.sleep(600)
    |            ^^^^^
    |     let err = @test_util.expect_error_async(() => timer.wait())
    |     log.push("at tick #\{tick()}: Timer::wait(): \{@debug.to_string(err)}")

<WORKDIR>/src/timer_test.mbt:161:14-161:19:
    |       log.push("Timer::wait() completed at tick #\{tick()}")
    |     }
    |     group.spawn_bg() <| () => {
161 |       @async.sleep(150)
    |              ^^^^^
    |       log.push("refresh timer at #\{tick()}")
    |       timer.refresh()

<WORKDIR>/src/timer_test.mbt:166:14-166:19:
    |       timer.refresh()
    |     }
    |     group.spawn_bg() <| () => {
166 |       @async.sleep(300)
    |              ^^^^^
    |       log.push("refresh timer at #\{tick()}")
    |       timer.refresh()

<WORKDIR>/src/timer_test.mbt:185:10-185:15:
    |   }
    | 
    |   let timer = @async.Timer(300)
185 |   @async.sleep(150)
    |          ^^^^^
    |   timer.refresh()
    |   log.push("refresh timer at tick #\{tick()}")

<WORKDIR>/src/timer_test.mbt:204:10-204:15:
    |   }
    | 
    |   let timer = @async.Timer(300)
204 |   @async.sleep(450)
    |          ^^^^^
    |   timer.refresh()
    |   log.push("refresh timer at tick #\{tick()}")

<WORKDIR>/src/tls/unimplemented_test.mbt:19:17-19:22:
   | #cfg(not(any(target="native", target="wasm")))
   | let _ignore_unused_import : Unit = {
   |   ignore(@utf8.encode(""))
19 |   ignore(@async.sleep)
   |                 ^^^^^
   |   ignore(@socket.unimplemented)
   |   ignore((f : async () -> Unit) => @test_util.assert_raise_async(f))

<WORKDIR>/src/wait_test.mbt:20:14-20:19:
   |   let buf = StringBuilder()
   |   @async.with_task_group(root => {
   |     root.spawn_bg() <| () => {
20 |       @async.sleep(200)
   |              ^^^^^
   |       buf <+ "200ms tick\n"
   |       @async.sleep(200)

<WORKDIR>/src/wait_test.mbt:22:14-22:19:
   |     root.spawn_bg() <| () => {
   |       @async.sleep(200)
   |       buf <+ "200ms tick\n"
22 |       @async.sleep(200)
   |              ^^^^^
   |       buf <+ "400ms tick\n"
   |     }

<WORKDIR>/src/wait_test.mbt:26:14-26:19:
   |       buf <+ "400ms tick\n"
   |     }
   |     let task = root.spawn(no_wait=true, () => {
26 |       @async.sleep(300)
   |              ^^^^^
   |       buf <+ "task finished\n"
   |     })

<WORKDIR>/src/wait_test.mbt:49:14-49:19:
   |   let buf = StringBuilder()
   |   @async.with_task_group(root => {
   |     let task = root.spawn(() => {
49 |       @async.sleep(1000)
   |              ^^^^^
   |       buf <+ "task finished\n"
   |     })

<WORKDIR>/src/wait_test.mbt:58:12-58:17:
   |         Some(_) => () (escaped)
   |       }
   |     }
58 |     @async.sleep(20)
   |            ^^^^^
   |     raise Err
   |   }) catch {

<WORKDIR>/src/wait_test.mbt:77:14-77:19:
   |   let log = StringBuilder()
   |   @async.with_task_group() <| root => {
   |     let task = root.spawn(no_wait=true, () => {
77 |       @async.sleep(450)
   |              ^^^^^
   |       42
   |     })

<WORKDIR>/src/wait_test.mbt:81:14-81:19:
   |       42
   |     })
   |     root.spawn_bg() <| () => {
81 |       @async.sleep(300)
   |              ^^^^^
   |       log.write_string("300ms: \{@debug.to_string(task.try_wait())}\n")
   |       @async.sleep(300)

<WORKDIR>/src/wait_test.mbt:83:14-83:19:
   |     root.spawn_bg() <| () => {
   |       @async.sleep(300)
   |       log.write_string("300ms: \{@debug.to_string(task.try_wait())}\n")
83 |       @async.sleep(300)
   |              ^^^^^
   |       log.write_string("600ms: \{@debug.to_string(task.try_wait())}\n")
   |     }

<WORKDIR>/src/websocket/unimplemented_test.mbt:19:17-19:22:
   | #cfg(any(target="js", target="wasm-gc"))
   | fn init {
   |   ignore(@debug.to_string(0))
19 |   ignore(@async.sleep)
   |                 ^^^^^
   |   ignore(@socket.unimplemented)
   |   ignore(@process.unimplemented)

<WORKDIR>/src/with_timeout_test.mbt:20:14-20:19:
   |   let log = []
   |   @async.with_task_group(root => {
   |     root.spawn_bg() <| () => {
20 |       @async.sleep(300)
   |              ^^^^^
   |       log.push("300ms tick")
   |     }

<WORKDIR>/src/with_timeout_test.mbt:24:14-24:19:
   |       log.push("300ms tick")
   |     }
   |     @async.with_timeout(400) <| () => {
24 |       @async.sleep(200)
   |              ^^^^^
   |       log.push("task finished after 200ms")
   |     }

<WORKDIR>/src/with_timeout_test.mbt:40:14-40:19:
   |   let log = StringBuilder()
   |   @async.with_task_group(root => {
   |     root.spawn_bg() <| () => {
40 |       @async.sleep(200)
   |              ^^^^^
   |       log <+ "200ms tick\n"
   |     }

<WORKDIR>/src/with_timeout_test.mbt:44:14-44:19:
   |       log <+ "200ms tick\n"
   |     }
   |     @async.with_timeout(300, () => {
44 |       @async.sleep(100)
   |              ^^^^^
   |       raise Err
   |     }) catch {

<WORKDIR>/src/with_timeout_test.mbt:69:14-69:19:
   |   let log = StringBuilder()
   |   @async.with_task_group(root => {
   |     root.spawn_bg() <| () => {
69 |       @async.sleep(300)
   |              ^^^^^
   |       log <+ "300ms tick\n"
   |     }

<WORKDIR>/src/with_timeout_test.mbt:73:53-73:58:
   |       log <+ "300ms tick\n"
   |     }
   |     @async.with_timeout(200, () => {
73 |       match @async.handle_cancellation(() => @async.sleep(400)) {
   |                                                     ^^^^^
   |         None => log <+ "task cancelled\n"
   |         Some(_) => log <+ "task finished\n"

<WORKDIR>/src/with_timeout_test.mbt:99:14-99:19:
   |   let log = StringBuilder()
   |   @async.with_task_group(root => {
   |     root.spawn_bg() <| () => {
99 |       @async.sleep(200)
   |              ^^^^^
   |       log <+ "200ms tick\n"
   |       @async.sleep(200)

<WORKDIR>/src/with_timeout_test.mbt:101:14-101:19:
    |     root.spawn_bg() <| () => {
    |       @async.sleep(200)
    |       log <+ "200ms tick\n"
101 |       @async.sleep(200)
    |              ^^^^^
    |       log <+ "400ms tick\n"
    |     }

<WORKDIR>/src/with_timeout_test.mbt:107:57-107:62:
    |     @async.with_timeout(300, () => {
    |       let result = @async.handle_cancellation() <| () => {
    |         @async.with_timeout(500) <| () => {
107 |           match @async.handle_cancellation(() => @async.sleep(2000)) {
    |                                                         ^^^^^
    |             None => log <+ "task cancelled\n"
    |             Some(_) => log <+ "task finished after 2s\n"

<WORKDIR>/src/with_timeout_test.mbt:141:14-141:19:
    |   let log = StringBuilder()
    |   @async.with_task_group(root => {
    |     root.spawn_bg() <| () => {
141 |       @async.sleep(300)
    |              ^^^^^
    |       log <+ "300ms tick\n"
    |       @async.sleep(300)

<WORKDIR>/src/with_timeout_test.mbt:143:14-143:19:
    |     root.spawn_bg() <| () => {
    |       @async.sleep(300)
    |       log <+ "300ms tick\n"
143 |       @async.sleep(300)
    |              ^^^^^
    |       log <+ "600ms tick\n"
    |     }

<WORKDIR>/src/with_timeout_test.mbt:148:55-148:60:
    |     }
    |     @async.with_timeout(750, () => {
    |       @async.with_timeout(450, () => {
148 |         match @async.handle_cancellation(() => @async.sleep(2000)) {
    |                                                       ^^^^^
    |           None => log <+ "task cancelled\n"
    |           Some(_) => log <+ "task finished after 2s\n"

<WORKDIR>/src/with_timeout_test.mbt:179:16-179:21:
    |   let err = @test_util.expect_error_async <| () => {
    |     @async.with_task_group(root => {
    |       root.spawn_bg() <| () => {
179 |         @async.sleep(200)
    |                ^^^^^
    |         log <+ "200ms tick\n"
    |       }

<WORKDIR>/src/with_timeout_test.mbt:183:55-183:60:
    |         log <+ "200ms tick\n"
    |       }
    |       @async.with_timeout(100) <| () => {
183 |         match @async.handle_cancellation(() => @async.sleep(2000)) {
    |                                                       ^^^^^
    |           None => {
    |             log <+ "causing other error on cancellation\n"

<WORKDIR>/src/with_timeout_test.mbt:210:16-210:21:
    |   let err = @test_util.expect_error_async <| () => {
    |     @async.with_task_group(root => {
    |       root.spawn_bg() <| () => {
210 |         @async.sleep(200)
    |                ^^^^^
    |         log <+ "200ms tick\n"
    |       }

<WORKDIR>/src/with_timeout_test.mbt:215:55-215:60:
    |       }
    |       defer log.write_string("main task terminates\n")
    |       @async.with_timeout(100, error=Err) <| () => {
215 |         match @async.handle_cancellation(() => @async.sleep(2000)) {
    |                                                       ^^^^^
    |           None => log <+ "task cancelled\n"
    |           Some(_) => log <+ "task finished after 2s\n"

<WORKDIR>/src/with_timeout_test.mbt:238:14-238:19:
    |   let log = []
    |   @async.with_task_group(root => {
    |     root.spawn_bg() <| () => {
238 |       @async.sleep(200)
    |              ^^^^^
    |       log.push("200ms tick")
    |     }

<WORKDIR>/src/with_timeout_test.mbt:242:14-242:19:
    |       log.push("200ms tick")
    |     }
    |     let result = @async.with_timeout_opt(1000, () => {
242 |       @async.sleep(100)
    |              ^^^^^
    |       log.push("task finished after 100ms")
    |       42

<WORKDIR>/src/with_timeout_test.mbt:259:14-259:19:
    |   let log = StringBuilder()
    |   @async.with_task_group(root => {
    |     root.spawn_bg() <| () => {
259 |       @async.sleep(200)
    |              ^^^^^
    |       log <+ "200ms tick\n"
    |     }

<WORKDIR>/src/with_timeout_test.mbt:263:14-263:19:
    |       log <+ "200ms tick\n"
    |     }
    |     @async.with_timeout(1000, () => {
263 |       @async.sleep(100)
    |              ^^^^^
    |       raise Err
    |     }) catch {

<WORKDIR>/src/with_timeout_test.mbt:288:14-288:19:
    |   let log = []
    |   @async.with_task_group() <| root => {
    |     root.spawn_bg() <| () => {
288 |       @async.sleep(200)
    |              ^^^^^
    |       log.push("200ms tick")
    |     }

<WORKDIR>/src/with_timeout_test.mbt:292:53-292:58:
    |       log.push("200ms tick")
    |     }
    |     let result = @async.with_timeout_opt(100, () => {
292 |       match @async.handle_cancellation(() => @async.sleep(2000)) {
    |                                                     ^^^^^
    |         None => log.push("task cancelled")
    |         Some(_) => log.push("task finished after 2s")

```
