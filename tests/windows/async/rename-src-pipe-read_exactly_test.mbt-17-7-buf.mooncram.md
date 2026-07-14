# async rename buf src\pipe\read_exactly_test.mbt:17:7

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\async' moon ide rename 'buf' 'buf_renamed' --loc 'src\pipe\read_exactly_test.mbt:17:7'
*** Begin Patch
*** Update File: <WORKDIR>/src\pipe\read_exactly_test.mbt
@@
 
 ///|
 async test "read_exactly" {
-  let buf = StringBuilder::new()
+  let buf_renamed = StringBuilder::new()
   fn log(msg) {
-    buf..write_string(msg).write_char('\n')
+    buf_renamed..write_string(msg).write_char('\n')
   }
 
   @async.with_task_group() <| root => {
@@
     }
   }
   inspect(
-    buf.to_string(),
+    buf_renamed.to_string(),
     content=(
       #|first message sent
       #|first message: abcd
*** End Patch

```
