# async rename log src\aqueue\blocking_test.mbt:17:7

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\async' moon ide rename 'log' 'log_renamed' --loc 'src\aqueue\blocking_test.mbt:17:7'
*** Begin Patch
*** Update File: <WORKDIR>/src\aqueue\blocking_test.mbt
@@
 
 ///|
 async test "blocking unbuffered" {
-  let log = []
+  let log_renamed = []
   @async.with_task_group() <| group => {
     let q = @async.Queue(kind=Blocking(1))
     group.spawn_bg() <| () => {
       for i in 0..<3 {
         q.put(i)
-        log.push("put(\{i})")
+        log_renamed.push("put(\{i})")
       }
     }
     group.spawn_bg() <| () => {
       for _ in 0..<3 {
         let x = q.get()
-        log.push("get() => \{x}")
+        log_renamed.push("get() => \{x}")
         @async.sleep(100)
       }
     }
   }
-  json_inspect(log, content=[
+  json_inspect(log_renamed, content=[
     "put(0)", "get() => 0", "put(1)", "get() => 1", "put(2)", "get() => 2",
   ])
 }
*** End Patch

```
