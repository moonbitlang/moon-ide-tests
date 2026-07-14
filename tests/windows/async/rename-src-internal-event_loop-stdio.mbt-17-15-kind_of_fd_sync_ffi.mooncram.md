# async rename kind_of_fd_sync_ffi src\internal\event_loop\stdio.mbt:17:15

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\async' moon ide rename 'kind_of_fd_sync_ffi' 'kind_of_fd_sync_ffi_renamed' --loc 'src\internal\event_loop\stdio.mbt:17:15'
*** Begin Patch
*** Update File: <WORKDIR>/src\internal\event_loop\stdio.mbt
@@
 
 ///|
 #cfg(target="native")
-extern "C" fn kind_of_fd_sync_ffi(fd : @fd_util.Fd) -> Int = "moonbitlang_async_kind_of_fd"
+extern "C" fn kind_of_fd_sync_ffi_renamed(fd : @fd_util.Fd) -> Int = "moonbitlang_async_kind_of_fd"
 
 ///|
 #cfg(target="wasm")
@@
   fd : @fd_util.Fd,
   context~ : String,
 ) -> @fd_util.FileKind raise {
-  let kind = kind_of_fd_sync_ffi(fd)
+  let kind = kind_of_fd_sync_ffi_renamed(fd)
   if kind < 0 {
     @os_error.check_errno(context)
   }
*** End Patch

```
