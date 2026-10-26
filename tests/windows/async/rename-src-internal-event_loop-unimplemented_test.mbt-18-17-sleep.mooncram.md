# async rename sleep src\internal\event_loop\unimplemented_test.mbt:18:17

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\async' moon ide rename 'sleep' 'sleep_renamed' --loc 'src\internal\event_loop\unimplemented_test.mbt:18:17' --target js
*** Begin Patch
*** Update File: <WORKDIR>/src\all_any_test.mbt
@@
   let start = @async.now()
   let results = @async.all([
     () => {
-      @async.sleep(400)
+      @async.sleep_renamed(400)
       1
     },
     () => {
-      @async.sleep(200)
+      @async.sleep_renamed(200)
       2
     },
     () => 3,
@@
   let log = []
   let results = @async.all([
     () => {
-      @async.sleep(300)
+      @async.sleep_renamed(300)
       log.push("task 0")
       0
     },
     () => {
-      @async.sleep(100)
+      @async.sleep_renamed(100)
       log.push("task 1")
       1
     },
@@
       () => {
         log.push("task #1 started")
         defer log.push("task #1 completed")
-        @async.sleep(200)
+        @async.sleep_renamed(200)
         0
       },
       () => {
         log.push("task #2 started")
         defer log.push("task #2 completed")
-        @async.sleep(100)
+        @async.sleep_renamed(100)
         1
       },
       () => {
         log.push("task #3 started")
         defer log.push("task #3 completed")
-        @async.sleep(200)
+        @async.sleep_renamed(200)
         2
       },
     ],
@@
   let result = @test_util.expect_error_async <| () => {
     @async.all([
       () => {
-        @async.sleep(100)
+        @async.sleep_renamed(100)
         log.push("task #1 completed")
       },
       () => {
-        @async.sleep(200)
+        @async.sleep_renamed(200)
         log.push("task #2 failing")
         raise Failure::Failure("Err")
       },
       () => {
-        match @async.handle_cancellation(() => @async.sleep(300)) {
+        match @async.handle_cancellation(() => @async.sleep_renamed(300)) {
           None => log.push("task #3 cancelled")
           Some(_) => log.push("task #3 completed")
         }
@@
 async test "all cancelled" {
   let log = []
   async fn task(idx : Int32, sleep_time : Int32) -> Int32 {
-    match @async.handle_cancellation(() => @async.sleep(sleep_time)) {
+    match @async.handle_cancellation(() => @async.sleep_renamed(sleep_time)) {
       None => log.push("task #\{idx} cancelled")
       Some(_) => log.push("task #\{idx} completed")
     }
@@
   let start = @async.now()
   let result = @async.any([
     () => {
-      @async.sleep(600)
+      @async.sleep_renamed(600)
       1
     },
     () => {
-      @async.sleep(200)
+      @async.sleep_renamed(200)
       2
     },
     () => {
-      @async.sleep(400)
+      @async.sleep_renamed(400)
       3
     },
   ])
@@
 async test "any returns first success" {
   let log = []
   async fn task(idx : Int32, sleep_time : Int32) -> Int32 {
-    match @async.handle_cancellation(() => @async.sleep(sleep_time)) {
+    match @async.handle_cancellation(() => @async.sleep_renamed(sleep_time)) {
       None => {
         log.push("task #\{idx} cancelled")
         @coroutine.check_cancellation()
@@
   let result = @test_util.expect_error_async <| () => {
     @async.any([
       () => {
-        match @async.handle_cancellation(() => @async.sleep(300)) {
+        match @async.handle_cancellation(() => @async.sleep_renamed(300)) {
           None => log.push("task #1 cancelled")
           Some(_) => log.push("task #1 completed")
         }
       },
       () => {
-        @async.sleep(150)
+        @async.sleep_renamed(150)
         raise Failure::Failure("Err")
       },
     ])
@@
   let result = @async.any(
     [
       () => {
-        @async.sleep(300)
+        @async.sleep_renamed(300)
         log.push("task #1 failing")
         raise Err
       },
       () => {
-        @async.sleep(150)
+        @async.sleep_renamed(150)
         log.push("task #2 failing")
         raise Failure::Failure("fail")
       },
       () => {
-        @async.sleep(450)
+        @async.sleep_renamed(450)
         log.push("task #3 completed")
         2
       },
@@
     @async.any(
       [
         () => {
-          @async.sleep(300)
+          @async.sleep_renamed(300)
           log.push("task #1 failing")
           raise Err
         },
         () => {
-          @async.sleep(150)
+          @async.sleep_renamed(150)
           log.push("task #2 failing")
           raise Failure::Failure("fail")
         },
@@
 async test "any cancelled" {
   let log = []
   async fn task(idx : Int32, sleep_time : Int32) -> Int32 {
-    match @async.handle_cancellation(() => @async.sleep(sleep_time)) {
+    match @async.handle_cancellation(() => @async.sleep_renamed(sleep_time)) {
       None => log.push("task #\{idx} cancelled")
       Some(_) => log.push("task #\{idx} completed")
     }
*** Update File: <WORKDIR>/src\allow_failure_test.mbt
@@
   let buf = StringBuilder()
   @async.with_task_group() <| root => {
     root.spawn_bg(allow_failure=true, () => raise Err)
-    @async.sleep(100)
+    @async.sleep_renamed(100)
     buf <+ "main task terminate\n"
   }
   inspect(
@@
   let err = @test_util.expect_error_async <| () => {
     @async.with_task_group(root => {
       let task = root.spawn(allow_failure=true, () => raise Err)
-      @async.sleep(100)
+      @async.sleep_renamed(100)
       task.wait()
       buf <+ "main task terminate\n"
     })
@@
   let buf = StringBuilder()
   @async.with_task_group(root => {
     root.spawn_bg(allow_failure=true) <| () => {
-      @async.sleep(1000)
+      @async.sleep_renamed(1000)
       buf <+ "`allow_failure` task terminate\n"
     }
-    @async.sleep(100)
+    @async.sleep_renamed(100)
     buf <+ "main task terminate\n"
   })
   inspect(
*** Update File: <WORKDIR>/src\aqueue\README.mbt.md
@@
       for _ in 0..<3 {
         let x = q.get()
         log.push("get() => \{x}")
-        @async.sleep(100)
+        @async.sleep_renamed(100)
       }
     }
   }
@@
       for _ in 0..<3 {
         let x = q.get()
         log.push("get() => \{x}")
-        @async.sleep(50)
+        @async.sleep_renamed(50)
       }
     }
   }
@@
     let q = @aqueue.Queue(kind=Blocking(1))
     q.put(1) // fills the buffer
     root.spawn_bg(() => {
-      @async.sleep(50)
+      @async.sleep_renamed(50)
       q.close()
     })
     // This `put` blocks because the buffer is full, then gets
@@
     group.spawn_bg() <| () => {
       for i in 0..<3 {
         q.put("A\{i}")
-        @async.sleep(100)
+        @async.sleep_renamed(100)
       }
     }
     // Producer B puts items at 50, 150, 250 ms.
     group.spawn_bg() <| () => {
-      @async.sleep(50)
+      @async.sleep_renamed(50)
       for i in 0..<3 {
         q.put("B\{i}")
-        @async.sleep(100)
+        @async.sleep_renamed(100)
       }
     }
     // Consumer drains 6 items.
@@
         for ;; {
           let item = q.get()
           work_by_worker[w].push(item)
-          @async.sleep(20) // simulate per-item processing cost
+          @async.sleep_renamed(20) // simulate per-item processing cost
         }
       }
     }
@@
     root.spawn_bg(() => log.push("r1 got \{q.get()}"))
     // Reader 2 starts waiting at ~50 ms.
     root.spawn_bg(() => {
-      @async.sleep(50)
+      @async.sleep_renamed(50)
       log.push("r2 got \{q.get()}")
     })
     // Producer puts two items at 100 ms.
-    @async.sleep(100)
+    @async.sleep_renamed(100)
     q.put(1)
     q.put(2)
   })
*** Update File: <WORKDIR>/src\aqueue\aqueue_test.mbt
@@
     }
     root.spawn_bg() <| () => {
       for x in 0..<6 {
-        @async.sleep(70)
+        @async.sleep_renamed(70)
         queue.put(x)
         log.write_string("put(\{x})\n")
       }
@@
   @async.with_task_group() <| root => {
     let queue = @aqueue.Queue(kind=Unbounded)
     root.spawn_bg() <| () => {
-      @async.sleep(70)
+      @async.sleep_renamed(70)
       let x = queue.get()
       log.write_string("task 1: get => \{x}\n")
     }
@@
       let x = queue.get()
       log.write_string("task 2: get => \{x}\n")
     }
-    @async.sleep(170)
+    @async.sleep_renamed(170)
     queue.put(1)
     queue.put(2)
   }
@@
   @async.with_task_group() <| group => {
     let q = @aqueue.Queue(kind=Unbounded)
     let get_task = group.spawn(() => log.write_string("get() => \{q.get()}\n"))
-    @async.sleep(100)
+    @async.sleep_renamed(100)
     q.put(42)
     get_task.cancel()
-    @async.sleep(100)
+    @async.sleep_renamed(100)
     debug_inspect(q.try_get(), content="None")
   }
   inspect(
@@
         log.write_string("task 2: get => \{x}\n")
       }
     }
-    @async.sleep(70)
+    @async.sleep_renamed(70)
     queue.put(1)
     queue.put(2)
-    @async.sleep(70)
+    @async.sleep_renamed(70)
     queue.put(3)
     queue.put(4)
   }
@@
       for _ in 0..<2 {
         let x = queue.get()
         log.write_string("task 1: get => \{x}\n")
-        @async.sleep(200)
+        @async.sleep_renamed(200)
         queue.put(x + 1)
       }
     }
     root.spawn_bg() <| () => {
-      @async.sleep(100)
+      @async.sleep_renamed(100)
       for _ in 0..<2 {
         let x = queue.get()
         log.write_string("task 2: get => \{x}\n")
-        @async.sleep(200)
+        @async.sleep_renamed(200)
         queue.put(x + 1)
       }
     }
*** Update File: <WORKDIR>/src\aqueue\blocking_test.mbt
@@
       for _ in 0..<3 {
         let x = q.get()
         log.push("get() => \{x}")
-        @async.sleep(100)
+        @async.sleep_renamed(100)
       }
     }
   }
@@
       for _ in 0..<4 {
         let x = q.get()
         log.push("get() => \{x}")
-        @async.sleep(100)
+        @async.sleep_renamed(100)
       }
     }
   }
@@
     }
     group.spawn_bg(no_wait=true) <| () => {
       for ;; {
-        @async.sleep(100)
+        @async.sleep_renamed(100)
         ignore(q.get())
       }
     }
@@
     let q = @async.Queue(kind=Blocking(1))
     q.put(0)
     group.spawn_bg(no_wait=true) <| () => {
-      @async.sleep(250)
+      @async.sleep_renamed(250)
       ignore(q.get())
     }
     @async.with_timeout(500, () => {
@@
       for i in 0..<2 {
         queue.put(i)
         log.push("task 1: put() completed")
-        @async.sleep(200)
+        @async.sleep_renamed(200)
         let x = queue.get()
         log.push("task 1: get() => \{x}")
       }
     }
     root.spawn_bg() <| () => {
-      @async.sleep(100)
+      @async.sleep_renamed(100)
       for i in 0..<2 {
         queue.put(i)
         log.push("task 2: put() completed")
-        @async.sleep(200)
+        @async.sleep_renamed(200)
         let x = queue.get()
         log.push("task 2: get() => \{x}")
       }
     }
-    @async.sleep(200)
+    @async.sleep_renamed(200)
     inspect(queue.get(), content="0")
   }
   json_inspect(log, content=[
@@
         Some(_) => log.push("put() completed")
       }
     })
-    @async.sleep(100)
+    @async.sleep_renamed(100)
     let _ = q.get()
     put_task.cancel()
-    @async.sleep(100)
+    @async.sleep_renamed(100)
     debug_inspect(q.try_get(), content="Some(1)")
   }
   json_inspect(log, content=["put() completed"])
@@
       for _ in 0..<4 {
         let x = q.get()
         log.push("get() => \{x}")
-        @async.sleep(100)
+        @async.sleep_renamed(100)
       }
     }
   }
*** Update File: <WORKDIR>/src\aqueue\close_test.mbt
@@
   @async.with_task_group() <| group => {
     let start = @async.now()
     group.spawn_bg() <| () => {
-      @async.sleep(300)
+      @async.sleep_renamed(300)
       q.close()
     }
     debug_inspect(
@@
   @async.with_task_group() <| group => {
     let start = @async.now()
     group.spawn_bg() <| () => {
-      @async.sleep(300)
+      @async.sleep_renamed(300)
       q.close()
     }
     debug_inspect(
@@
   @async.with_task_group() <| group => {
     let start = @async.now()
     group.spawn_bg() <| () => {
-      @async.sleep(300)
+      @async.sleep_renamed(300)
       q.close()
     }
     debug_inspect(
*** Update File: <WORKDIR>/src\async.mbt
@@
 ) -> X {
   with_task_group() <| group => {
     group.spawn_bg(no_wait=true) <| () => {
-      sleep(time)
+      sleep_renamed(time)
       raise error
     }
     f()
@@
 pub async fn[X] with_timeout_opt(time : Int32, f : async () -> X) -> X? {
   with_task_group() <| group => {
     group.spawn_bg(no_wait=true) <| () => {
-      sleep(time)
+      sleep_renamed(time)
       group.return_immediately(None)
     }
     Some(f())
@@
           err if fatal_error is Some(f) && f(err) => raise err
           err if @coroutine.is_being_cancelled() => raise err
           err if max_retry is Some(max) && i >= max => raise err
-          _ => sleep(t)
+          _ => sleep_renamed(t)
         } noraise {
           result => return result
         }
@@
           err if @coroutine.is_being_cancelled() => raise err
           err if max_retry is Some(max) && i >= max => raise err
           _ => {
-            sleep(timeout)
+            sleep_renamed(timeout)
             continue i + 1,
               @cmp.minimum(maximum, (timeout.to_double() * factor).to_int())
           }
*** Update File: <WORKDIR>/src\cancellation_test.mbt
@@
   let buf = StringBuilder()
   @async.with_task_group(root => {
     let task = root.spawn(() => {
-      match @async.handle_cancellation(() => @async.sleep(300)) {
+      match @async.handle_cancellation(() => @async.sleep_renamed(300)) {
         None => buf.write_string("cancelled\n")
         Some(_) => buf <+ "task finished\n"
       }
     })
-    @async.sleep(100)
+    @async.sleep_renamed(100)
     task.cancel()
-    @async.sleep(200)
+    @async.sleep_renamed(200)
     buf <+ "main task exit\n"
   })
   inspect(
@@
   let err = @test_util.expect_error_async <| () => {
     @async.with_task_group(root => {
       root.spawn_bg() <| () => {
-        @async.sleep(300)
+        @async.sleep_renamed(300)
         raise Err
       }
       root.spawn_bg() <| () => {
         let result = @async.handle_cancellation() <| () => {
-          @async.sleep(200)
+          @async.sleep_renamed(200)
           buf <+ "task 2, tick 1\n"
-          @async.sleep(200)
+          @async.sleep_renamed(200)
           buf <+ "task 2, tick 2\n"
         }
         match result {
@@
       try
         @async.with_task_group() <| fn(ctx) {
           ctx.spawn_bg() <| () => {
-            @async.sleep(200)
+            @async.sleep_renamed(200)
             raise Err
           }
           ctx.spawn_bg() <| () => {
-            match @async.handle_cancellation(() => @async.sleep(400)) {
+            match @async.handle_cancellation(() => @async.sleep_renamed(400)) {
               None => buf.write_string("ctx 1 task 2 cancelled\n")
               Some(_) => buf <+ "ctx 1 task 2 finished\n"
             }
@@
       try
         @async.with_task_group() <| fn(ctx) {
           ctx.spawn_bg() <| () => {
-            @async.sleep(500)
+            @async.sleep_renamed(500)
             raise Err
           }
           ctx.spawn_bg() <| () => {
-            match @async.handle_cancellation(() => @async.sleep(300)) {
+            match @async.handle_cancellation(() => @async.sleep_renamed(300)) {
               None => buf.write_string("ctx 2 task 2 cancelled\n")
               Some(_) => buf <+ "ctx 2 task 2 finished\n"
             }
@@
   @async.with_task_group(root => {
     root.spawn_bg() <| () => {
       for _ in 0..<2 {
-        @async.sleep(400)
+        @async.sleep_renamed(400)
         buf <+ "tick\n"
       }
     }
     let task = root.spawn(() => {
-      if @async.handle_cancellation(() => @async.sleep(1000)) is None {
+      if @async.handle_cancellation(() => @async.sleep_renamed(1000)) is None {
         buf.write_string("first sleep cancelled\n")
       }
-      if @async.handle_cancellation(() => @async.sleep(1000)) is None {
+      if @async.handle_cancellation(() => @async.sleep_renamed(1000)) is None {
         buf.write_string("second sleep cancelled\n")
       }
       buf <+ "task finished\n"
     })
-    @async.sleep(600)
+    @async.sleep_renamed(600)
     task.cancel()
     buf <+ "main task exit\n"
   })
@@
     @async.with_task_group(root => {
       root.spawn_bg() <| () => {
         @async.with_task_group() <| group => {
-          @async.sleep(1)
+          @async.sleep_renamed(1)
           group.spawn_bg(() => raise Err)
           buf <+ "after spawn\n"
-          @async.sleep(400)
+          @async.sleep_renamed(400)
           buf <+ "main task exit\n"
         }
       }
-      @async.sleep(200)
+      @async.sleep_renamed(200)
     })
   }
   buf.write_string(@debug.to_string(err))
@@
   let err = @test_util.expect_error_async <| () => {
     @async.with_task_group(root => {
       root.spawn_bg(no_wait=true) <| () => {
-        match @async.handle_cancellation(() => @async.sleep(1000)) {
+        match @async.handle_cancellation(() => @async.sleep_renamed(1000)) {
           None => {
             log <+ "causing other error in cancellation handler\n"
             raise Err
@@
           Some(_) => () (escaped)
         }
       }
-      @async.sleep(200)
+      @async.sleep_renamed(200)
     })
   }
   log.write_string(@debug.to_string(err))
@@
     let task = root.spawn(() => {
       defer log.write_string("task terminated\n")
       log <+ "task started\n"
-      @async.sleep(100)
+      @async.sleep_renamed(100)
       log <+ "task finished\n"
     })
     log <+ "task spawned\n"
@@
   let result = @test_util.expect_error_async <| () => {
     @async.with_task_group(group => {
       group.spawn_bg(() => raise Failure::Failure("failure"))
-      group.spawn_bg(() => group.spawn_bg(() => @async.sleep(100)))
+      group.spawn_bg(() => group.spawn_bg(() => @async.sleep_renamed(100)))
     })
   }
   debug_inspect(
*** Update File: <WORKDIR>/src\cond_var\README.mbt.md
@@
         log.push("waiter \{i}: unblocked")
       }
     }
-    @async.sleep(50) // ensure all three are parked
+    @async.sleep_renamed(50) // ensure all three are parked
     log.push("broadcast()")
     cond.broadcast()
   }
@@
     }
     // Task B parks at ~50 ms.
     group.spawn_bg() <| () => {
-      @async.sleep(50)
+      @async.sleep_renamed(50)
       cond.wait()
       log.push("B")
     }
     // Two signals, 50 ms apart.
-    @async.sleep(100)
+    @async.sleep_renamed(100)
     cond.signal()
-    @async.sleep(50)
+    @async.sleep_renamed(50)
     cond.signal()
   }
   json_inspect(log, content=["A", "B"])
*** Update File: <WORKDIR>/src\cond_var\cond_var_test.mbt
@@
   @async.with_task_group() <| root => {
     let cond = @cond_var.Cond()
     root.spawn_bg() <| () => {
-      @async.sleep(500)
+      @async.sleep_renamed(500)
       cond.signal()
     }
     debug_inspect(
@@
       cond.wait()
       log <+ "waiter 2 succeed\n"
     }
-    @async.sleep(100)
+    @async.sleep_renamed(100)
     cond.signal()
     wait_task.cancel()
-    @async.sleep(100)
+    @async.sleep_renamed(100)
   }
   inspect(
     log.to_string(),
@@
       }
     }
     root.spawn_bg() <| () => {
-      @async.sleep(100)
+      @async.sleep_renamed(100)
       for _ in 0..<3 {
         cond.wait()
         log <+ "task 2 received signal\n"
       }
     }
-    @async.sleep(200)
+    @async.sleep_renamed(200)
     for _ in 0..<6 {
       cond.signal()
-      @async.sleep(50)
+      @async.sleep_renamed(50)
     }
   }
   inspect(
@@
         log.write_string("task \{i} received signal\n")
       }
     }
-    @async.sleep(100)
+    @async.sleep_renamed(100)
     cond.broadcast()
   }
   inspect(
@@
         log.write_string("task \{i} received signal\n")
       }
     }
-    @async.sleep(500)
+    @async.sleep_renamed(500)
     cond.broadcast()
   }
   inspect(
*** Update File: <WORKDIR>/src\fs\unimplemented.mbt
@@
   ignore(@int.MAX_VALUE)
   ignore(@cmp.minimum(0, 0))
   ignore(@io.pipe)
-  ignore(@async.sleep)
+  ignore(@async.sleep_renamed)
   ignore(@event_loop.Timer::new)
   ignore(@os_error.unimplemented)
   ignore(@fd_util.unimplemented)
*** Update File: <WORKDIR>/src\group_defer_test.mbt
@@
     root.add_defer(() => log <+ "first group defer\n")
     root.spawn_bg() <| () => {
       defer log.write_string("defer for first task\n")
-      @async.sleep(200)
+      @async.sleep_renamed(200)
       root.add_defer(() => log <+ "third group defer\n")
-      @async.sleep(200)
+      @async.sleep_renamed(200)
       log <+ "first task finished\n"
     }
     root.spawn_bg() <| () => {
       defer log.write_string("defer for second task\n")
-      @async.sleep(100)
+      @async.sleep_renamed(100)
       root.add_defer(() => log <+ "second group defer\n")
-      @async.sleep(200)
+      @async.sleep_renamed(200)
       log <+ "second task finished\n"
     }
     root.spawn_bg(no_wait=true) <| () => {
       defer log.write_string("defer for cancelled task\n")
-      @async.sleep(1000)
+      @async.sleep_renamed(1000)
     }
   }
   inspect(
@@
       root.add_defer(() => log <+ "first group defer\n")
       root.spawn_bg() <| () => {
         defer log.write_string("defer for first task\n")
-        @async.sleep(200)
+        @async.sleep_renamed(200)
         root.add_defer(() => log <+ "third group defer\n")
-        @async.sleep(200)
+        @async.sleep_renamed(200)
         log <+ "first task finished\n"
       }
       root.spawn_bg() <| () => {
         defer log.write_string("defer for second task\n")
-        @async.sleep(100)
+        @async.sleep_renamed(100)
         root.add_defer(() => log <+ "second group defer\n")
-        @async.sleep(200)
+        @async.sleep_renamed(200)
         log <+ "second task raise error\n"
         raise Err
       }
       root.spawn_bg(no_wait=true) <| () => {
         defer log.write_string("defer for cancelled task\n")
-        @async.sleep(1000)
+        @async.sleep_renamed(1000)
       }
     })
   }
@@
   @async.with_task_group() <| root => {
     root.spawn_bg() <| () => {
       for _ in 0..<4 {
-        @async.sleep(200)
+        @async.sleep_renamed(200)
         log <+ "tick\n"
       }
     }
@@
       @async.with_task_group(group => {
         group.add_defer(() => {
           @async.protect_from_cancel() <| () => {
-            @async.sleep(200)
+            @async.sleep_renamed(200)
             log <+ "protected async defer completed\n"
           }
         })
         defer log.write_string("start group termination\n")
-        @async.sleep(2000)
+        @async.sleep_renamed(2000)
       })
     })
     |> ignore
*** Update File: <WORKDIR>/src\gzip\gzip_test.mbt
@@
       )
       for chunk in source_chunks {
         encoder.write(chunk)
-        @async.sleep(10)
+        @async.sleep_renamed(10)
       }
       encoder.end()
     }
@@
       log.push("write plain ab")
       encoder.write("ab")
       encoder.flush()
-      @async.sleep(60)
+      @async.sleep_renamed(60)
       log.push("write plain cd")
       encoder.write("cd")
       encoder.flush()
-      @async.sleep(60)
+      @async.sleep_renamed(60)
       log.push("end")
       encoder.end()
     }
@@
     root.spawn_bg() <| () => {
       defer compressed_w.close()
       compressed_w.write(b"\x1f\x8b\x08\x00\x00\x00\x00\x00\x00\xff")
-      @async.sleep(20)
+      @async.sleep_renamed(20)
       log.push("write plain ab")
       compressed_w.write(b"\x00\x02\x00\xfd\xffab")
-      @async.sleep(200)
+      @async.sleep_renamed(200)
       log.push("write plain cd")
       compressed_w.write(b"\x00\x02\x00\xfd\xffcd")
-      @async.sleep(200)
+      @async.sleep_renamed(200)
       log.push("write plain ef")
       compressed_w.write(b"\x00\x02\x00\xfd\xffef")
-      @async.sleep(200)
+      @async.sleep_renamed(200)
       log.push("finish")
       compressed_w.write(b"\x01\x00\x00\xff\xff")
       compressed_w.write(b"\xef\x39\x8e\x4b\x06\x00\x00\x00")
@@
       defer compressed_w.close()
       compressed_w.write(b"\x1f\x8b\x08\x00\x00\x00\x00\x00\x00\xff")
       compressed_w.write(b"\x00\x04\x00\xfb\xffabcd")
-      @async.sleep(200)
+      @async.sleep_renamed(200)
       compressed_w.write(b"\x00\x04\x00\xfb\xffefgh")
       compressed_w.write(b"\x01\x00\x00\xff\xff")
       compressed_w.write(b"\x50\x2a\xef\xae\x08\x00\x00\x00")
*** Update File: <WORKDIR>/src\http\client_test.mbt
@@
       log <+ "client sending PUT request\n"
       let client = @http.put_stream("http://127.0.0.1:\{port}/put-streaming")
       defer client.close()
-      @async.sleep(100)
+      @async.sleep_renamed(100)
       log <+ "client: sending PUT data part 1\n"
       client..write("PUT data part 1\n").flush()
-      @async.sleep(100)
+      @async.sleep_renamed(100)
       log <+ "client: sending PUT data part 2\n"
       client.write("PUT data part 2\n")
       let response = client.end_request()
@@
       log <+ "client sending POST request\n"
       let client = @http.post_stream("http://127.0.0.1:\{port}/post-streaming")
       defer client.close()
-      @async.sleep(100)
+      @async.sleep_renamed(100)
       log <+ "client: sending POST data part 1\n"
       client..write("POST data part 1\n").flush()
-      @async.sleep(100)
+      @async.sleep_renamed(100)
       log <+ "client: sending POST data part 2\n"
       client.write("POST data part 2\n")
       let response = client.end_request()
@@
     }
     // give some time for the client to close,
     // so that the port occupied by the server can be reused immediately.
-    @async.sleep(200)
+    @async.sleep_renamed(200)
   }
   if is_js {
     // On JS backend, streaming request body is not supported,
*** Update File: <WORKDIR>/src\http\unimplemented_test.mbt
@@
 #cfg(not(any(target="native", target="wasm")))
 let _ignore_unused_import : Unit = {
   ignore(@debug.to_string(0))
-  ignore(@async.sleep)
+  ignore(@async.sleep_renamed)
   ignore(@utf8.encode(""))
   ignore((_ : @gzip_stream.Encoder[&@io.Writer]) => ())
   ignore(@fs.unimplemented)
*** Update File: <WORKDIR>/src\http\unimplemented_wbtest.mbt
@@
   ignore(@debug.to_string(0))
   let _ : (@gzip_stream.Decoder[&@io.Reader]) -> Unit = ignore
   ignore(() => @test.assert_raise(() => ()))
-  ignore(@async.sleep)
+  ignore(@async.sleep_renamed)
   ignore(@fs.unimplemented)
   ignore(@bytes_util.ascii_to_string)
   ignore(@utf8.encode(""))
*** Update File: <WORKDIR>/src\internal\event_loop\starvation_test.mbt
@@
   let log = []
   @async.with_task_group() <| group => {
     group.spawn_bg() <| () => {
-      @async.sleep(50)
+      @async.sleep_renamed(50)
       log.push("sleep completed")
     }
     group.spawn_bg() <| () => {
*** Update File: <WORKDIR>/src\internal\event_loop\unimplemented_test.mbt
@@
 ///|
 #cfg(not(any(target="native", target="wasm")))
 let _ignore_unused_import : Unit = {
-  ignore(@async.sleep)
+  ignore(@async.sleep_renamed)
   ignore(@fs.unimplemented)
   ignore(@utf8.encode(""))
   ignore(@io.Encoding::UTF8)
*** Update File: <WORKDIR>/src\internal\event_loop\worker_wbtest.mbt
@@
 ///|
 #cfg(target="js")
 async fn perform_sleep_job(t : Int32) -> Unit {
-  @async.protect_from_cancel(() => @async.sleep(t))
+  @async.protect_from_cancel(() => @async.sleep_renamed(t))
 }
 
 ///|
@@
   @async.with_task_group() <| root => {
     root.spawn_bg() <| () => {
       for _ in 0..<3 {
-        @async.sleep(400)
+        @async.sleep_renamed(400)
         log <+ "tick\n"
       }
     }
@@
   @async.with_task_group() <| root => {
     root.spawn_bg() <| () => {
       for _ in 0..<4 {
-        @async.sleep(200)
+        @async.sleep_renamed(200)
         log <+ "tick\n"
       }
     }
@@
         Some(_) => log <+ "done\n"
       }
     })
-    @async.sleep(500)
+    @async.sleep_renamed(500)
     log <+ "trying to cancel\n"
     task.cancel()
   }
@@
   @async.with_task_group() <| root => {
     root.spawn_bg() <| () => {
       for _ in 0..<3 {
-        @async.sleep(400)
+        @async.sleep_renamed(400)
         log <+ "tick\n"
       }
     }
@@
         Some(_) => log <+ "done\n"
       }
     }
-    @async.sleep(600)
+    @async.sleep_renamed(600)
     log <+ "trying to terminate now\n"
     root.return_immediately(())
   }
*** Update File: <WORKDIR>/src\internal\gzip_internal\gzip_internal_test.mbt
@@
 ///|
 #cfg(not(any(target="native", target="wasm")))
 let _unused : Unit = {
-  ignore(@async.sleep)
+  ignore(@async.sleep_renamed)
   ignore(@fs.unimplemented)
 }
*** Update File: <WORKDIR>/src\io\README.mbt.md
@@
     root.spawn_bg(() => {
       defer writer.close()
       writer.write(b"Hello, ")
-      @async.sleep(10)
+      @async.sleep_renamed(10)
       writer.write(b"MoonBit")
-      @async.sleep(10)
+      @async.sleep_renamed(10)
       writer.write(b"!\n")
     })
 
@@
       defer w.close()
       // the writer supplieds data in two chunks
       w.write("abcd")
-      @async.sleep(200)
+      @async.sleep_renamed(200)
       w.write("efgh")
-      @async.sleep(200)
+      @async.sleep_renamed(200)
       w.write("ijkl")
     })
     debug_inspect(
@@
 async test "MemoryReader - generate reader content in memory" {
   let r = @io.MemoryReader() <| w => {
     w.write("hello, ")
-    @async.sleep(10)
+    @async.sleep_renamed(10)
     w.write("MoonBit")
   }
   defer r.close()
@@
   let r = @io.MemoryReader() <| w => {
     for part in ["ab", "cd", "ef"] {
       w.write(part)
-      @async.sleep(10)
+      @async.sleep_renamed(10)
     }
   }
   defer r.close()
@@
       // Simulate a producer that emits three frames with pauses in between.
       log <+ "sending 4 bytes\n"
       w2.write(b"abcd")
-      @async.sleep(300)
+      @async.sleep_renamed(300)
       log <+ "sending 4 bytes\n"
       w2.write(b"efgh")
-      @async.sleep(300)
+      @async.sleep_renamed(300)
       log <+ "sending 4 bytes\n"
       w2.write(b"ijkl")
     })
@@
       let w = @io.BufferedWriter::new(w, size=4)
       log <+ "2 bytes written\n"
       w.write("ab")
-      @async.sleep(20)
+      @async.sleep_renamed(20)
       log <+ "2 bytes written\n"
       w.write("cd")
-      @async.sleep(20)
+      @async.sleep_renamed(20)
       log <+ "2 bytes written\n"
       w.write("ef")
       // Force the remaining bytes out of the buffer.
@@
       defer w2.close()
       log <+ "sending 4 bytes\n"
       w2.write(b"abcd")
-      @async.sleep(100)
+      @async.sleep_renamed(100)
       log <+ "sending 4 bytes\n"
       w2.write(b"efgh")
-      @async.sleep(100)
+      @async.sleep_renamed(100)
       log <+ "sending 4 bytes\n"
       w2.write(b"ijkl")
     })
*** Update File: <WORKDIR>/src\io\buffered_writer_test.mbt
@@
       let w = @io.BufferedWriter::new(w, size=4)
       log <+ "2 bytes written\n"
       w.write("ab")
-      @async.sleep(20)
+      @async.sleep_renamed(20)
       log <+ "2 bytes written\n"
       w.write("cd")
-      @async.sleep(20)
+      @async.sleep_renamed(20)
       log <+ "2 bytes written\n"
       w.write("ef")
       w.flush()
@@
       defer w2.close()
       log <+ "sending 4 bytes\n"
       w2.write(b"abcd")
-      @async.sleep(100)
+      @async.sleep_renamed(100)
       log <+ "sending 4 bytes\n"
       w2.write(b"efgh")
-      @async.sleep(100)
+      @async.sleep_renamed(100)
       log <+ "sending 4 bytes\n"
       w2.write(b"ijkl")
     }
*** Update File: <WORKDIR>/src\io\memory_reader_test.mbt
@@
     for data in ["abcd", "1234", "xyzw"] {
       log.push("writing \{data}")
       w.write(data)
-      @async.sleep(150)
+      @async.sleep_renamed(150)
     }
   }
   defer r.close()
@@
   }
   for _ in 0..<3 {
     guard r.read_some() is Some(data) else { break }
-    @async.sleep(50)
+    @async.sleep_renamed(50)
     log.push("received \{@utf8.decode(data)}")
   }
   r.close()
-  @async.sleep(50)
+  @async.sleep_renamed(50)
   json_inspect(log, content=[
     "written #0 successfully", "received #0", "written #1 successfully", "received #1",
     "written #2 successfully", "received #2", "`write` cancelled",
@@
 ///|
 async test "MemoryReader failure" {
   let r = @io.MemoryReader() <| _ => {
-    @async.sleep(150)
+    @async.sleep_renamed(150)
     raise Failure::Failure("failure")
   }
   defer r.close()
*** Update File: <WORKDIR>/src\io\read_all_test.mbt
@@
 ///|
 async fn writer(log : StringBuilder, w : @io.PipeWrite) -> Unit {
   defer w.close()
-  @async.sleep(20)
+  @async.sleep_renamed(20)
   log <+ "writing 4 bytes of data\n"
   w.write(b"abcd")
-  @async.sleep(20)
+  @async.sleep_renamed(20)
   log <+ "writing 4 bytes of data\n"
   w.write(b"efgh")
-  @async.sleep(20)
+  @async.sleep_renamed(20)
   log <+ "writing 4 bytes of data\n"
   w.write(b"ijkl")
 }
*** Update File: <WORKDIR>/src\io\writer_test.mbt
@@
       defer w2.close()
       log <+ "sending 4 bytes\n"
       w2.write(b"abcd")
-      @async.sleep(300)
+      @async.sleep_renamed(300)
       log <+ "sending 4 bytes\n"
       w2.write(b"efgh")
-      @async.sleep(300)
+      @async.sleep_renamed(300)
       log <+ "sending 4 bytes\n"
       w2.write(b"ijkl")
     }
@@
 ///|
 impl @io.Writer for DummyWriter with fn write_once(self, buf, offset~, len~) {
   guard! offset + len <= buf.length()
-  @async.sleep(self.base_timeout)
+  @async.sleep_renamed(self.base_timeout)
   let logger = self.logger
   logger <+ "writing byte \{buf[offset]}\n"
   1
*** Update File: <WORKDIR>/src\js_async\js_async_test.mbt
@@
 async test "Promise::from_async" {
   let result = @js_async.run_promise(abort_signal => {
     @js_async.Promise::from_async(abort_signal~) <| () => {
-      @async.sleep(100)
+      @async.sleep_renamed(100)
       42
     }
   })
@@
     @async.with_timeout(100, () => {
       @js_async.run_promise() <| abort_signal => {
         @js_async.Promise::from_async(abort_signal~) <| () => {
-          @async.sleep(200)
+          @async.sleep_renamed(200)
           worker_finished = true
         }
       }
@@
 async test "Promise::from_async cancellation 2" {
   let controller = @js_async.AbortController::new()
   let p = @js_async.Promise::from_async(abort_signal=controller.signal(), () => {
-    @async.sleep(200)
+    @async.sleep_renamed(200)
   })
-  @async.sleep(100)
+  @async.sleep_renamed(100)
   controller.abort()
   debug_inspect(
     @test_util.expect_error_async(() => p.wait()),
@@
 async test "Promise::from_async cancellation 3" {
   let controller = @js_async.AbortController::new()
   let p = @js_async.Promise::from_async(abort_signal=controller.signal(), () => {
-    @async.sleep(100)
+    @async.sleep_renamed(100)
   })
-  @async.sleep(200)
+  @async.sleep_renamed(200)
   controller.abort()
   p.wait()
 }
@@
   let controller = @js_async.AbortController::new()
   let signal = controller.signal()
   let promise = @js_async.Promise::from_async(abort_signal=signal, () => {
-    @async.sleep(100)
+    @async.sleep_renamed(100)
   })
   inspect(abort_listener_count(signal), content="1")
   promise.wait()
@@
   let promise : @js_async.Promise[Unit] = @js_async.Promise::from_async(
     abort_signal=signal,
     () => {
-      @async.sleep(100)
+      @async.sleep_renamed(100)
       raise Failure::Failure("expected")
     },
   )
@@
   let mut worker_finished = false
   let promise = @js_async.Promise::from_async(abort_signal=signal, () => {
     worker_started = true
-    @async.sleep(100)
+    @async.sleep_renamed(100)
     worker_finished = true
   })
   inspect(rejection_name(promise).wait(), content="AbortError")
*** Update File: <WORKDIR>/src\js_async\readable_stream_test.mbt
@@
       write("message2")
       // there should be back pressure here
       write("message3")
-      @async.sleep(400)
+      @async.sleep_renamed(400)
       write("message4")
     }
     group.spawn_bg() <| () => {
       defer r.close()
-      @async.sleep(200)
+      @async.sleep_renamed(200)
       while r.read_some() is Some(data) {
         log.push("reader: \{@utf8.decode(data)} at tick #\{tick()}")
       }
*** Update File: <WORKDIR>/src\js_async\unimplemented_test.mbt
@@
 ///|
 #coverage.skip
 let _ignore_unused_import : Unit = {
-  ignore(@async.sleep)
+  ignore(@async.sleep_renamed)
   ignore(@utf8.encode(""))
   ignore((f : async () -> Unit) => @test_util.assert_raise_async(f))
 }
*** Update File: <WORKDIR>/src\lazy_init_test.mbt
@@
 
   let x = @async.Lazy(() => {
     log.push("lazy init started at tick \{current_tick()}")
-    @async.sleep(200)
+    @async.sleep_renamed(200)
     log.push("lazy init completed at tick \{current_tick()}")
   })
-  @async.sleep(200)
+  @async.sleep_renamed(200)
   x.wait()
   log.push("got lazy init result at tick \{current_tick()}")
   x.wait()
@@
 ///|
 async test "lazy init failure" {
   let x : @async.Lazy[Unit] = Lazy(() => {
-    @async.sleep(200)
+    @async.sleep_renamed(200)
     raise Failure::Failure("msg")
   })
   let start = @async.now()
@@
 
   let x = @async.Lazy(() => {
     log.push("lazy init started at tick \{current_tick()}")
-    match @async.handle_cancellation(() => @async.sleep(400)) {
+    match @async.handle_cancellation(() => @async.sleep_renamed(400)) {
       None => {
         log.push("lazy init cancelled at tick \{current_tick()}")
         @coroutine.check_cancellation()
@@
     }
   })
   debug_inspect(@async.with_timeout_opt(200, () => x.wait()), content="None")
-  @async.sleep(100)
+  @async.sleep_renamed(100)
   // the previous attempt is already cancelled,
   // this `wait` will trigger a new attempt
   x.wait()
@@
 
   let x = @async.Lazy(() => {
     log.push("lazy init started at tick \{current_tick()}")
-    match @async.handle_cancellation(() => @async.sleep(400)) {
+    match @async.handle_cancellation(() => @async.sleep_renamed(400)) {
       None => log.push("lazy init cancelled at tick \{current_tick()}")
       Some(_) => log.push("lazy init completed at tick \{current_tick()}")
     }
@@
 
   let x = @async.Lazy(() => {
     log.push("lazy init started at tick \{current_tick()}")
-    match @async.handle_cancellation(() => @async.sleep(600)) {
+    match @async.handle_cancellation(() => @async.sleep_renamed(600)) {
       None => log.push("lazy init cancelled at tick \{current_tick()}")
       Some(_) => log.push("lazy init completed at tick \{current_tick()}")
     }
*** Update File: <WORKDIR>/src\mutex_test.mbt
@@
       group.spawn_bg() <| () => {
         mutex.acquire()
         log.push("task \{i} acquired mutex")
-        @async.sleep(300)
+        @async.sleep_renamed(300)
         mutex.release()
       }
     }
-    @async.sleep(150)
+    @async.sleep_renamed(150)
     for _ in 0..<3 {
       log.push("tick")
-      @async.sleep(300)
+      @async.sleep_renamed(300)
     }
   }
   json_inspect(log, content=[
@@
     let mutex = @async.Mutex()
     group.spawn_bg() <| () => {
       mutex.acquire()
-      @async.sleep(500)
+      @async.sleep_renamed(500)
       mutex.release()
     }
     debug_inspect(
@@
       },
       content="TimeoutError",
     )
-    @async.sleep(500)
+    @async.sleep_renamed(500)
     inspect(mutex.try_acquire(), content="true")
   }
 }
@@
       mutex.acquire()
       log.push("acquire() succeed")
     })
-    @async.sleep(100)
+    @async.sleep_renamed(100)
     mutex.release()
     acquire_taskire_task.cancel()
-    @async.sleep(100)
+    @async.sleep_renamed(100)
     inspect(mutex.try_acquire(), content="false")
   }
   json_inspect(log, content=["acquire() succeed"])
@@
       for _ in 0..<3 {
         mutex.acquire()
         log.push("task 1 acquired mutex")
-        @async.sleep(200)
+        @async.sleep_renamed(200)
         mutex.release()
       }
     }
     group.spawn_bg() <| () => {
-      @async.sleep(100)
+      @async.sleep_renamed(100)
       for _ in 0..<3 {
         mutex.acquire()
         log.push("task 2 acquired mutex")
-        @async.sleep(200)
+        @async.sleep_renamed(200)
         mutex.release()
       }
     }
*** Update File: <WORKDIR>/src\no_wait_test.mbt
@@
   let buf = StringBuilder()
   @async.with_task_group() <| root => {
     root.spawn_bg(no_wait=true) <| () => {
-      match @async.handle_cancellation(() => @async.sleep(1000)) {
+      match @async.handle_cancellation(() => @async.sleep_renamed(1000)) {
         None => buf.write_string("`no_wait` task cancelled\n")
         Some(_) => buf <+ "`no_wait` task finished successfully\n"
       }
     }
-    @async.sleep(100)
+    @async.sleep_renamed(100)
     buf <+ "main task terminate\n"
   }
   inspect(
@@
   let buf = StringBuilder()
   @async.with_task_group() <| root => {
     root.spawn_bg(no_wait=true) <| () => {
-      match @async.handle_cancellation(() => @async.sleep(100)) {
+      match @async.handle_cancellation(() => @async.sleep_renamed(100)) {
         None => buf.write_string("`no_wait` task cancelled\n")
         Some(_) => buf <+ "`no_wait` task finished successfully\n"
       }
     }
-    @async.sleep(200)
+    @async.sleep_renamed(200)
     buf <+ "main task terminate\n"
   }
   inspect(
*** Update File: <WORKDIR>/src\os_error\unimplemented_test.mbt
@@
 ///|
 #cfg(not(any(target="native", target="wasm")))
 let _ignore_unused_import : Unit = {
-  ignore(@async.sleep)
+  ignore(@async.sleep_renamed)
   ignore(@fs.unimplemented)
   ignore((f : async () -> Unit) => @test_util.assert_raise_async(f))
 }
*** Update File: <WORKDIR>/src\pipe\unimplemented_test.mbt
@@
 ///|
 #cfg(not(target="native"))
 let _ignore_unused_import : Unit = {
-  ignore(@async.sleep)
+  ignore(@async.sleep_renamed)
   ignore(@utf8.encode(""))
   ignore((f : async () -> Unit) => @test_util.assert_raise_async(f))
 }
*** Update File: <WORKDIR>/src\process\unimplemented.mbt
@@
 #coverage.skip
 pub let unimplemented : Unit = {
   ignore(@io.pipe)
-  ignore(@async.sleep)
+  ignore(@async.sleep_renamed)
   ignore(@event_loop.Timer::new)
   ignore(@coroutine.Coroutine::wake)
   ignore(@stdio.unimplemented)
*** Update File: <WORKDIR>/src\protect_from_cancel_test.mbt
@@
   @async.with_task_group(root => {
     root.spawn_bg() <| () => {
       @async.protect_from_cancel <| () => {
-        match @async.handle_cancellation(() => @async.sleep(400)) {
+        match @async.handle_cancellation(() => @async.sleep_renamed(400)) {
           None => log.write_string("critial job cancelled\n")
           Some(_) => log <+ "critical job finished\n"
         }
       }
-      match @async.handle_cancellation(() => @async.sleep(200)) {
+      match @async.handle_cancellation(() => @async.sleep_renamed(200)) {
         None => log <+ "job cancelled after critical part\n"
         Some(_) => log <+ "non-critial part of job finished\n"
       }
     }
     root.spawn_bg() <| () => {
-      match @async.handle_cancellation(() => @async.sleep(400)) {
+      match @async.handle_cancellation(() => @async.sleep_renamed(400)) {
         None => log.write_string("non-critial job cancelled\n")
         Some(_) => log <+ "non-critical job finished\n"
       }
     }
-    @async.sleep(200)
+    @async.sleep_renamed(200)
     raise Err
   }) catch {
     err => log.write_string(@debug.to_string(err))
@@
   let log = StringBuilder()
   @async.with_task_group(root => {
     root.spawn_bg() <| () => {
-      @async.sleep(200)
+      @async.sleep_renamed(200)
       log <+ "200ms tick\n"
-      @async.sleep(200)
+      @async.sleep_renamed(200)
       log <+ "400ms tick\n"
     }
     @async.with_task_group(group => {
       group.spawn_bg() <| () => {
-        @async.sleep(300)
+        @async.sleep_renamed(300)
         log.write_string("trying to cancel the group containing critial job\n")
         raise Err
       }
       @async.protect_from_cancel() <| () => {
-        @async.sleep(500)
+        @async.sleep_renamed(500)
         log <+ "critial job finished\n"
       }
     }) catch {
@@
   let log = StringBuilder()
   @async.with_task_group() <| root => {
     root.spawn_bg() <| () => {
-      @async.sleep(200)
+      @async.sleep_renamed(200)
       log <+ "200ms tick\n"
-      @async.sleep(200)
+      @async.sleep_renamed(200)
       log <+ "400ms tick\n"
     }
     @async.with_timeout_opt(300, () => {
       @async.protect_from_cancel() <| () => {
-        @async.sleep(500)
+        @async.sleep_renamed(500)
         log <+ "critial job finished\n"
       }
     })
@@
     (
       @async.with_task_group(root => {
         root.spawn_bg() <| () => {
-          @async.sleep(200)
+          @async.sleep_renamed(200)
           log <+ "200ms tick\n"
-          @async.sleep(200)
+          @async.sleep_renamed(200)
           log <+ "400ms tick\n"
         }
         @async.with_timeout(300, () => {
           @async.protect_from_cancel() <| () => {
-            @async.sleep(500)
+            @async.sleep_renamed(500)
             log <+ "critial job fail\n"
             raise Err
           }
@@
   let log = StringBuilder()
   @async.with_task_group() <| root => {
     root.spawn_bg() <| () => {
-      @async.sleep(200)
+      @async.sleep_renamed(200)
       log <+ "200ms tick\n"
-      @async.sleep(200)
+      @async.sleep_renamed(200)
       log <+ "400ms tick\n"
     }
     @async.with_timeout_opt(300, () => {
       @async.protect_from_cancel() <| () => {
         @async.protect_from_cancel() <| () => {
-          @async.sleep(500)
+          @async.sleep_renamed(500)
           log <+ "critial job finished\n"
         }
       }
@@
   let log = StringBuilder()
   @async.with_task_group() <| root => {
     root.spawn_bg() <| () => {
-      @async.sleep(200)
+      @async.sleep_renamed(200)
       log <+ "200ms tick\n"
-      @async.sleep(200)
+      @async.sleep_renamed(200)
       log <+ "400ms tick\n"
-      @async.sleep(200)
+      @async.sleep_renamed(200)
       log <+ "600ms tick\n"
     }
     @async.with_timeout_opt(100, () => {
       @async.protect_from_cancel() <| () => {
         @async.protect_from_cancel() <| () => {
-          @async.sleep(300)
+          @async.sleep_renamed(300)
           log <+ "inner critial job finished\n"
         }
-        @async.sleep(200)
+        @async.sleep_renamed(200)
         log <+ "outer critial job finished\n"
       }
     })
@@
   let log = StringBuilder()
   @async.with_task_group(root => {
     root.spawn_bg(no_wait=true) <| () => {
-      match @async.handle_cancellation(() => @async.sleep(400)) {
+      match @async.handle_cancellation(() => @async.sleep_renamed(400)) {
         None => {
           log.write_string("cancelled\n")
           @async.protect_from_cancel() <| () => {
-            @async.sleep(200)
+            @async.sleep_renamed(200)
             log <+ "critial cancellation handler terminated\n"
           }
         }
@@
         Some(_) => () (escaped)
       }
     }
-    @async.sleep(200)
+    @async.sleep_renamed(200)
     log <+ "start cancellation\n"
   })
   inspect(
@@
   @async.with_task_group() <| root => {
     root.spawn_bg() <| () => {
       for _ in 0..<2 {
-        @async.sleep(200)
+        @async.sleep_renamed(200)
         log <+ "tick\n"
       }
     }
@@
             // However, since current coroutine is still in `run_later`,
             // the scheduler will wakeup current coroutine immediately,
             // before the timer expires.
-            @async.sleep(300)
+            @async.sleep_renamed(300)
             log <+ "async cleanup finished\n"
           }
         }
@@
   @async.with_task_group() <| root => {
     root.spawn_bg() <| () => {
       for _ in 0..<2 {
-        @async.sleep(300)
+        @async.sleep_renamed(300)
         log <+ "tick\n"
       }
     }
@@
         errdefer {
           log <+ "performing async cleanup\n"
           @async.protect_from_cancel() <| () => {
-            @async.sleep(300)
+            @async.sleep_renamed(300)
             log <+ "raising error from async cleanup\n"
             raise Err
           }
         }
-        @async.sleep(1000)
+        @async.sleep_renamed(1000)
       }
-      @async.sleep(150)
+      @async.sleep_renamed(150)
       log <+ "main task of inner group done\n"
     })
     log <+ "group terminates\n"
*** Update File: <WORKDIR>/src\retry_test.mbt
@@
   let mut i = 0
   @async.with_timeout(500, () => {
     @async.retry(Immediate) <| () => {
-      @async.sleep(200)
+      @async.sleep_renamed(200)
       log.write_string("loop \{i}\n")
       i = i + 1
       raise Err
@@
     log.write_string("worker run #\{i}\n")
     i = i + 1
     if i < 3 {
-      @async.with_timeout(100, () => @async.sleep(1000))
+      @async.with_timeout(100, () => @async.sleep_renamed(1000))
     } else {
       raise Failure::Failure("fatal error")
     }
*** Update File: <WORKDIR>/src\return_immediately_test.mbt
@@
 async test "return_immediately basic" {
   @async.with_task_group(root => {
     root.spawn_bg() <| () => {
-      @async.sleep(200)
+      @async.sleep_renamed(200)
       root.return_immediately(())
     }
-    root.spawn_bg() <| () => { @async.sleep(300) }
+    root.spawn_bg() <| () => { @async.sleep_renamed(300) }
   })
 }
 
@@
 ///|
 async test "return_immediately nested" {
   @async.with_task_group(root => {
-    root.spawn_bg() <| () => { @async.sleep(300) }
+    root.spawn_bg() <| () => { @async.sleep_renamed(300) }
     @async.with_task_group() <| fn(group) {
       group.spawn_bg() <| () => {
-        @async.sleep(200)
+        @async.sleep_renamed(200)
         root.return_immediately(())
       }
-      group.spawn_bg() <| () => { @async.sleep(300) }
+      group.spawn_bg() <| () => { @async.sleep_renamed(300) }
     }
   })
 }
@@
   let err = @test_util.expect_error_async <| () => {
     @async.with_task_group(root => {
       root.spawn_bg() <| () => {
-        @async.sleep(200)
+        @async.sleep_renamed(200)
         root.return_immediately(())
       }
       root.spawn_bg() <| () => {
-        match @async.handle_cancellation(() => @async.sleep(300)) {
+        match @async.handle_cancellation(() => @async.sleep_renamed(300)) {
           None => {
             log <+ "task cancelled, causing other error\n"
             raise Err
@@
   let log = []
   @async.with_task_group() <| group => {
     group.spawn_bg() <| () => {
-      @async.sleep(100)
+      @async.sleep_renamed(100)
       log.push("100ms tick")
     }
     @async.with_task_group <| group => {
-      defer @async.sleep(200)
+      defer @async.sleep_renamed(200)
       group.return_immediately(())
     }
     log.push("inner group finished")
@@
   let log = []
   @async.with_task_group() <| outer => {
     outer.spawn_bg() <| () => {
-      @async.sleep(100)
+      @async.sleep_renamed(100)
       log.push("100ms tick")
     }
     @async.with_task_group(inner => {
*** Update File: <WORKDIR>/src\semaphore\README.mbt.md
@@
         mutex.acquire()
         defer mutex.release()
         log.push("task \{i}: enter")
-        @async.sleep(50)
+        @async.sleep_renamed(50)
         log.push("task \{i}: leave")
       }
     }
@@
         if active > peak {
           peak = active
         }
-        @async.sleep(30)
+        @async.sleep_renamed(30)
         active = active - 1
       }
     }
@@
     }
     group.spawn_bg() <| () => {
       log.push("signaller: setup")
-      @async.sleep(50)
+      @async.sleep_renamed(50)
       log.push("signaller: release")
       ready.release()
     }
@@
   @async.with_task_group <| group => {
     for i in 0..<n {
       group.spawn_bg() <| () => {
-        @async.sleep(20 * (i + 1))
+        @async.sleep_renamed(20 * (i + 1))
         log.push("worker \{i} done")
         done.release()
       }
@@
     }
     // Task B starts waiting at ~50 ms.
     group.spawn_bg() <| () => {
-      @async.sleep(50)
+      @async.sleep_renamed(50)
       sem.acquire()
       log.push("B acquired")
       sem.release()
     }
-    @async.sleep(100)
+    @async.sleep_renamed(100)
     sem.release() // main hands off the permit
   }
   // A queued first, so A wakes first.
*** Update File: <WORKDIR>/src\semaphore\semaphore_test.mbt
@@
       root.spawn_bg() <| () => {
         semaphore.acquire()
         log.write_string("task \{i} obtained resource\n")
-        @async.sleep(300)
+        @async.sleep_renamed(300)
         semaphore.release()
       }
     }
-    @async.sleep(150)
+    @async.sleep_renamed(150)
     for _ in 0..<3 {
       log <+ "tick\n"
-      @async.sleep(300)
+      @async.sleep_renamed(300)
     }
   }
   inspect(
@@
       root.spawn_bg() <| () => {
         semaphore.acquire()
         log.write_string("task \{i} obtained resource\n")
-        @async.sleep(300)
+        @async.sleep_renamed(300)
         semaphore.release()
       }
     }
-    @async.sleep(150)
+    @async.sleep_renamed(150)
     for _ in 0..<3 {
       log <+ "tick\n"
-      @async.sleep(300)
+      @async.sleep_renamed(300)
     }
   }
   inspect(
@@
     let semaphore = @semaphore.Semaphore(1)
     root.spawn_bg() <| () => {
       semaphore.acquire()
-      @async.sleep(500)
+      @async.sleep_renamed(500)
       semaphore.release()
     }
     debug_inspect(
@@
       },
       content="TimeoutError",
     )
-    @async.sleep(500)
+    @async.sleep_renamed(500)
     inspect(semaphore.try_acquire(), content="true")
   }
 }
@@
       semaphore.acquire()
       log <+ "acquire() succeed\n"
     })
-    @async.sleep(100)
+    @async.sleep_renamed(100)
     semaphore.release()
     acquire_taskire_task.cancel()
-    @async.sleep(100)
+    @async.sleep_renamed(100)
     inspect(semaphore.try_acquire(), content="false")
   }
   inspect(
@@
       for _ in 0..<3 {
         semaphore.acquire()
         log <+ "task 1 acquired resource\n"
-        @async.sleep(200)
+        @async.sleep_renamed(200)
         semaphore.release()
       }
     }
     root.spawn_bg() <| () => {
-      @async.sleep(100)
+      @async.sleep_renamed(100)
       for _ in 0..<3 {
         semaphore.acquire()
         log <+ "task 2 acquired resource\n"
-        @async.sleep(200)
+        @async.sleep_renamed(200)
         semaphore.release()
       }
     }
*** Update File: <WORKDIR>/src\signal\unimplemented_test.mbt
@@
 #cfg(not(any(target="native", target="wasm")))
 let _ignore_unused_import : Unit = {
   ignore(@utf8.encode(""))
-  ignore(@async.sleep)
+  ignore(@async.sleep_renamed)
   ignore(@process.unimplemented)
 }
*** Update File: <WORKDIR>/src\socket\unimplemented.mbt
@@
   ignore(() => @string.parse_int("0"))
   ignore(@io.pipe)
   ignore(@event_loop.Timer::new)
-  ignore(@async.sleep)
+  ignore(@async.sleep_renamed)
   ignore(@os_error.unimplemented)
   ignore(@fd_util.unimplemented)
   ignore(@c_buffer.unimplemented)
*** Update File: <WORKDIR>/src\spawn_test.mbt
@@
   let result = @test_util.expect_error_async <| () => {
     @async.with_task_group(root => {
       root.spawn_bg() <| () => {
-        @async.sleep(1000)
+        @async.sleep_renamed(1000)
         buf <+ "task 1 finished\n"
       }
       root.spawn_bg() <| () => {
-        @async.sleep(200)
+        @async.sleep_renamed(200)
         raise Err
       }
     })
@@
   let result = @test_util.expect_error_async <| () => {
     @async.with_task_group(root => {
       root.spawn_bg() <| () => {
-        @async.sleep(200)
+        @async.sleep_renamed(200)
         raise Err
       }
       root.spawn_bg() <| () => {
-        @async.sleep(1000)
+        @async.sleep_renamed(1000)
         buf <+ "task 1 finished\n"
       }
     })
@@
           // emulate a non-cancellable job,
           // or a job that happens to be completed on cancellation,
           // such that discarding the result may lead to data loss
-          @async.protect_from_cancel(() => @async.sleep(300))
+          @async.protect_from_cancel(() => @async.sleep_renamed(300))
           // even if control flow enters here normally,
           // current task and the whole group may be in a cancelled state
           group.spawn_bg(allow_failure=true) <| () => {
             log.push("enter child task after cancelled")
-            @async.sleep(100)
+            @async.sleep_renamed(100)
             log.push("child task completed")
           }
         }
-        @async.sleep(150)
+        @async.sleep_renamed(150)
         raise Failure::Failure("failure")
       }) : Unit)
   }
*** Update File: <WORKDIR>/src\stdio\unimplemented_test.mbt
@@
 ///|
 #cfg(not(any(target="native", target="wasm")))
 let _ignore_unused_import : Unit = {
-  ignore(@async.sleep)
+  ignore(@async.sleep_renamed)
   ignore(@fs.unimplemented)
   ignore(@process.unimplemented)
   ignore(@fd_util.unimplemented)
*** Update File: <WORKDIR>/src\timer.mbt
@@
 /// `sleep` will wait for the given time (in milliseconds) before returning.
 /// Other task can still run while current task is sleeping.
 /// If current task is cancelled, `sleep` will return early with an error.
-pub using @event_loop {sleep}
+pub using @event_loop {sleep_renamed}
 
 ///|
 priv enum TimerState {
*** Update File: <WORKDIR>/src\timer_test.mbt
@@
   let buf = StringBuilder()
   @async.with_task_group() <| root => {
     root.spawn_bg() <| () => {
-      @async.sleep(100)
+      @async.sleep_renamed(100)
       buf <+ "task 1, tick 1\n"
-      @async.sleep(200)
+      @async.sleep_renamed(200)
       buf <+ "task 1, tick 2\n"
-      @async.sleep(200)
+      @async.sleep_renamed(200)
       buf <+ "task 1, tick 3\n"
     }
     root.spawn_bg() <| () => {
-      @async.sleep(200)
+      @async.sleep_renamed(200)
       buf <+ "task 2, tick 1\n"
-      @async.sleep(200)
+      @async.sleep_renamed(200)
       buf <+ "task 2, tick 2\n"
-      @async.sleep(200)
+      @async.sleep_renamed(200)
       buf <+ "task 2, tick 3\n"
     }
   }
@@
   let log = []
   @async.with_task_group() <| group => {
     group.spawn_bg() <| () => {
-      @async.sleep(150)
+      @async.sleep_renamed(150)
       log.push("sleep: tick #1")
-      @async.sleep(300)
+      @async.sleep_renamed(300)
       log.push("sleep: tick #2")
-      @async.sleep(300)
+      @async.sleep_renamed(300)
       log.push("sleep: tick #3")
     }
-    @async.sleep(300)
+    @async.sleep_renamed(300)
     log.push("creating timer")
     let timer = @async.Timer(300)
     @async.with_task_group() <| group => {
@@
 ///|
 async test "Timer no waiter" {
   let timer = @async.Timer(200)
-  @async.sleep(400)
+  @async.sleep_renamed(400)
   debug_inspect(
     @async.with_timeout_opt(0, () => timer.wait()),
     content=(
@@
 async test "Timer waiter cancelled 1" {
   let timer = @async.Timer(600)
   assert_true(@async.with_timeout_opt(200, () => timer.wait()) is None)
-  @async.sleep(200)
+  @async.sleep_renamed(200)
   assert_false(@async.with_timeout_opt(300, () => timer.wait()) is None)
 }
 
@@
 async test "Timer waiter cancelled 2" {
   let timer = @async.Timer(300)
   assert_true(@async.with_timeout_opt(200, () => timer.wait()) is None)
-  @async.sleep(200)
+  @async.sleep_renamed(200)
   assert_false(@async.with_timeout_opt(0, () => timer.wait()) is None)
 }
 
@@
   let timer = @async.Timer(450)
   @async.with_task_group() <| group => {
     group.spawn_bg() <| () => {
-      @async.sleep(150)
+      @async.sleep_renamed(150)
       timer.cancel()
     }
     group.spawn_bg() <| () => {
@@
       let result = @test_util.expect_error_async(() => timer.wait())
       log.push("Timer::wait(): \{@debug.to_string(result)} at tick #\{tick()}")
     }
-    @async.sleep(600)
+    @async.sleep_renamed(600)
     let err = @test_util.expect_error_async(() => timer.wait())
     log.push("at tick #\{tick()}: Timer::wait(): \{@debug.to_string(err)}")
     timer.cancel()
@@
       log.push("Timer::wait() completed at tick #\{tick()}")
     }
     group.spawn_bg() <| () => {
-      @async.sleep(150)
+      @async.sleep_renamed(150)
       log.push("refresh timer at #\{tick()}")
       timer.refresh()
     }
     group.spawn_bg() <| () => {
-      @async.sleep(300)
+      @async.sleep_renamed(300)
       log.push("refresh timer at #\{tick()}")
       timer.refresh()
     }
@@
   }
 
   let timer = @async.Timer(300)
-  @async.sleep(150)
+  @async.sleep_renamed(150)
   timer.refresh()
   log.push("refresh timer at tick #\{tick()}")
   timer.wait()
@@
   }
 
   let timer = @async.Timer(300)
-  @async.sleep(450)
+  @async.sleep_renamed(450)
   timer.refresh()
   log.push("refresh timer at tick #\{tick()}")
   timer.wait()
*** Update File: <WORKDIR>/src\tls\unimplemented_test.mbt
@@
 #cfg(not(any(target="native", target="wasm")))
 let _ignore_unused_import : Unit = {
   ignore(@utf8.encode(""))
-  ignore(@async.sleep)
+  ignore(@async.sleep_renamed)
   ignore(@socket.unimplemented)
   ignore((f : async () -> Unit) => @test_util.assert_raise_async(f))
 }
*** Update File: <WORKDIR>/src\wait_test.mbt
@@
   let buf = StringBuilder()
   @async.with_task_group(root => {
     root.spawn_bg() <| () => {
-      @async.sleep(200)
+      @async.sleep_renamed(200)
       buf <+ "200ms tick\n"
-      @async.sleep(200)
+      @async.sleep_renamed(200)
       buf <+ "400ms tick\n"
     }
     let task = root.spawn(no_wait=true, () => {
-      @async.sleep(300)
+      @async.sleep_renamed(300)
       buf <+ "task finished\n"
     })
     task.wait()
@@
   let buf = StringBuilder()
   @async.with_task_group(root => {
     let task = root.spawn(() => {
-      @async.sleep(1000)
+      @async.sleep_renamed(1000)
       buf <+ "task finished\n"
     })
     root.spawn_bg() <| () => {
@@
         Some(_) => () (escaped)
       }
     }
-    @async.sleep(20)
+    @async.sleep_renamed(20)
     raise Err
   }) catch {
     err => buf.write_string(@debug.to_string(err))
@@
   let log = StringBuilder()
   @async.with_task_group() <| root => {
     let task = root.spawn(no_wait=true, () => {
-      @async.sleep(450)
+      @async.sleep_renamed(450)
       42
     })
     root.spawn_bg() <| () => {
-      @async.sleep(300)
+      @async.sleep_renamed(300)
       log.write_string("300ms: \{@debug.to_string(task.try_wait())}\n")
-      @async.sleep(300)
+      @async.sleep_renamed(300)
       log.write_string("600ms: \{@debug.to_string(task.try_wait())}\n")
     }
     log.write_string("task finished with \{task.wait()}\n")
*** Update File: <WORKDIR>/src\websocket\unimplemented_test.mbt
@@
 #cfg(any(target="js", target="wasm-gc"))
 fn init {
   ignore(@debug.to_string(0))
-  ignore(@async.sleep)
+  ignore(@async.sleep_renamed)
   ignore(@socket.unimplemented)
   ignore(@process.unimplemented)
   ignore((f : async () -> Unit) => @test_util.assert_raise_async(f))
*** Update File: <WORKDIR>/src\with_timeout_test.mbt
@@
   let log = []
   @async.with_task_group(root => {
     root.spawn_bg() <| () => {
-      @async.sleep(300)
+      @async.sleep_renamed(300)
       log.push("300ms tick")
     }
     @async.with_timeout(400) <| () => {
-      @async.sleep(200)
+      @async.sleep_renamed(200)
       log.push("task finished after 200ms")
     }
     log.push("main task finished")
@@
   let log = StringBuilder()
   @async.with_task_group(root => {
     root.spawn_bg() <| () => {
-      @async.sleep(200)
+      @async.sleep_renamed(200)
       log <+ "200ms tick\n"
     }
     @async.with_timeout(300, () => {
-      @async.sleep(100)
+      @async.sleep_renamed(100)
       raise Err
     }) catch {
       err => {
@@
   let log = StringBuilder()
   @async.with_task_group(root => {
     root.spawn_bg() <| () => {
-      @async.sleep(300)
+      @async.sleep_renamed(300)
       log <+ "300ms tick\n"
     }
     @async.with_timeout(200, () => {
-      match @async.handle_cancellation(() => @async.sleep(400)) {
+      match @async.handle_cancellation(() => @async.sleep_renamed(400)) {
         None => log <+ "task cancelled\n"
         Some(_) => log <+ "task finished\n"
       }
@@
   let log = StringBuilder()
   @async.with_task_group(root => {
     root.spawn_bg() <| () => {
-      @async.sleep(200)
+      @async.sleep_renamed(200)
       log <+ "200ms tick\n"
-      @async.sleep(200)
+      @async.sleep_renamed(200)
       log <+ "400ms tick\n"
     }
     @async.with_timeout(300, () => {
       let result = @async.handle_cancellation() <| () => {
         @async.with_timeout(500) <| () => {
-          match @async.handle_cancellation(() => @async.sleep(2000)) {
+          match @async.handle_cancellation(() => @async.sleep_renamed(2000)) {
             None => log <+ "task cancelled\n"
             Some(_) => log <+ "task finished after 2s\n"
           }
@@
   let log = StringBuilder()
   @async.with_task_group(root => {
     root.spawn_bg() <| () => {
-      @async.sleep(300)
+      @async.sleep_renamed(300)
       log <+ "300ms tick\n"
-      @async.sleep(300)
+      @async.sleep_renamed(300)
       log <+ "600ms tick\n"
     }
     @async.with_timeout(750, () => {
       @async.with_timeout(450, () => {
-        match @async.handle_cancellation(() => @async.sleep(2000)) {
+        match @async.handle_cancellation(() => @async.sleep_renamed(2000)) {
           None => log <+ "task cancelled\n"
           Some(_) => log <+ "task finished after 2s\n"
         }
@@
   let err = @test_util.expect_error_async <| () => {
     @async.with_task_group(root => {
       root.spawn_bg() <| () => {
-        @async.sleep(200)
+        @async.sleep_renamed(200)
         log <+ "200ms tick\n"
       }
       @async.with_timeout(100) <| () => {
-        match @async.handle_cancellation(() => @async.sleep(2000)) {
+        match @async.handle_cancellation(() => @async.sleep_renamed(2000)) {
           None => {
             log <+ "causing other error on cancellation\n"
             raise Err
@@
   let err = @test_util.expect_error_async <| () => {
     @async.with_task_group(root => {
       root.spawn_bg() <| () => {
-        @async.sleep(200)
+        @async.sleep_renamed(200)
         log <+ "200ms tick\n"
       }
       defer log.write_string("main task terminates\n")
       @async.with_timeout(100, error=Err) <| () => {
-        match @async.handle_cancellation(() => @async.sleep(2000)) {
+        match @async.handle_cancellation(() => @async.sleep_renamed(2000)) {
           None => log <+ "task cancelled\n"
           Some(_) => log <+ "task finished after 2s\n"
         }
@@
   let log = []
   @async.with_task_group(root => {
     root.spawn_bg() <| () => {
-      @async.sleep(200)
+      @async.sleep_renamed(200)
       log.push("200ms tick")
     }
     let result = @async.with_timeout_opt(1000, () => {
-      @async.sleep(100)
+      @async.sleep_renamed(100)
       log.push("task finished after 100ms")
       42
     })
@@
   let log = StringBuilder()
   @async.with_task_group(root => {
     root.spawn_bg() <| () => {
-      @async.sleep(200)
+      @async.sleep_renamed(200)
       log <+ "200ms tick\n"
     }
     @async.with_timeout(1000, () => {
-      @async.sleep(100)
+      @async.sleep_renamed(100)
       raise Err
     }) catch {
       err => {
@@
   let log = []
   @async.with_task_group() <| root => {
     root.spawn_bg() <| () => {
-      @async.sleep(200)
+      @async.sleep_renamed(200)
       log.push("200ms tick")
     }
     let result = @async.with_timeout_opt(100, () => {
-      match @async.handle_cancellation(() => @async.sleep(2000)) {
+      match @async.handle_cancellation(() => @async.sleep_renamed(2000)) {
         None => log.push("task cancelled")
         Some(_) => log.push("task finished after 2s")
       }
*** End Patch

```
