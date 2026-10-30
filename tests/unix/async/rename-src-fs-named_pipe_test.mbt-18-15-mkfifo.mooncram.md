# async rename mkfifo src/fs/named_pipe_test.mbt:18:15

````mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../fixtures/repos/async' moon ide rename 'mkfifo' 'mkfifo_renamed' --loc 'src/fs/named_pipe_test.mbt:18:15'
*** Begin Patch
*** Update File: <WORKDIR>/src/fs/named_pipe_test.mbt
@@
 ///|
 #cfg(not(platform="windows"))
 #borrow(path)
-extern "C" fn mkfifo(path : @os_string.OsString, mode : Int32) -> Int32 = "mkfifo"
+extern "C" fn mkfifo_renamed(path : @os_string.OsString, mode : Int32) -> Int32 = "mkfifo"
 
 ///|
 #cfg(not(platform="windows"))
 async test "cancel named fifo open" {
   let path = "_build/cancel_open_test"
-  if mkfifo(@os_string.encode(path), 0o644) < 0 {
+  if mkfifo_renamed(@os_string.encode(path), 0o644) < 0 {
     @os_error.check_errno("mkfifo")
   }
   defer @fs.remove(path)
@@
 async test "named fifo" {
   @async.with_task_group() <| group => {
     let path = "_build/named_pipe_test"
-    if mkfifo(@os_string.encode(path), 0o644) < 0 {
+    if mkfifo_renamed(@os_string.encode(path), 0o644) < 0 {
       @os_error.check_errno("mkfifo")
     }
     group.add_defer(() => @fs.remove(path))
*** End Patch
"" (escaped)
````
