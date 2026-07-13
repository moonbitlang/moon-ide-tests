# async rename fd src/internal/event_loop/stdio.mbt:17:35

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
$ run_moon_ide moon ide rename 'fd' 'fd_renamed' --loc 'src/internal/event_loop/stdio.mbt:17:35'
*** Begin Patch
*** Update File: <WORKDIR>/src/internal/event_loop/stdio.mbt
@@
 
 ///|
 #cfg(target="native")
-extern "C" fn kind_of_fd_sync_ffi(fd : @fd_util.Fd) -> Int = "moonbitlang_async_kind_of_fd"
+extern "C" fn kind_of_fd_sync_ffi(fd_renamed : @fd_util.Fd) -> Int = "moonbitlang_async_kind_of_fd"
 
 ///|
 #cfg(target="wasm")
@@
 ///|
 fn setup_stdio(id : Int, context~ : String) -> IoHandle raise {
   let fd = get_stdio_handle(id)
-  if !@fd_util.fd_is_valid(fd) {
+  if !@fd_util.fd_is_valid(fd_renamed) {
     @os_error.check_errno(context)
   }
-  if stdio_handles.get(fd) is Some(handle) {
+  if stdio_handles.get(fd_renamed) is Some(handle) {
     // On Windows, when `stdout` and `stderr` are redirected to the same file/pipe,
     // `GetStdHande` will return the same handle for them.
     // In this case, avoid problem caused by duplicated handle value
     return handle
   }
-  let kind = kind_of_fd_sync(fd, context~)
+  let kind = kind_of_fd_sync(fd_renamed, context~)
   let handle = {
-    fd,
+    fd: fd_renamed,
     kind,
     // Stdio channels may be shared between many different processes,
     // and some (argubly misbehaving ones) of them may
@@
       -1
     },
   }
-  stdio_handles[fd] = handle
+  stdio_handles[fd_renamed] = handle
   register_hook(
     init=() => {
       guard curr_loop.val is Some(evloop)
-      guard evloop.fds.get(fd) is None
+      guard evloop.fds.get(fd_renamed) is None
-      evloop.fds[fd] = handle
+      evloop.fds[fd_renamed] = handle
     },
     exit=() => handle.detach_from_event_loop(),
   )
*** End Patch

```
