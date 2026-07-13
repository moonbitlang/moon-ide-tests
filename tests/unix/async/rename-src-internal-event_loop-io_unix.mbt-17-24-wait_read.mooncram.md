# async rename wait_read src/internal/event_loop/io_unix.mbt:17:24

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
$ run_moon_ide moon ide rename 'wait_read' 'wait_read_renamed' --loc 'src/internal/event_loop/io_unix.mbt:17:24'
*** Begin Patch
*** Update File: <WORKDIR>/src/fs/watch_inotify.mbt
@@
       if self.waiter is Some(coro) {
         coro.wake()
       }
-      self.inotify.wait_read()
+      self.inotify.wait_read_renamed()
       continue
     }
     self.debounce_timer.refresh()
*** Update File: <WORKDIR>/src/fs/watch_kqueue.mbt
@@
   }
   if n is 0 {
     match timeout {
-      None => self.kqueue.wait_read()
+      None => self.kqueue.wait_read_renamed()
-      Some(t) => @async.with_timeout(t, () => self.kqueue.wait_read())
+      Some(t) => @async.with_timeout(t, () => self.kqueue.wait_read_renamed())
     }
   }
   for i in 0..<n {
*** Update File: <WORKDIR>/src/internal/event_loop/io_unix.mbt
@@
 
 ///|
 #cfg(not(platform="windows"))
-pub async fn IoHandle::wait_read(handle : IoHandle) -> Unit {
+pub async fn IoHandle::wait_read_renamed(handle : IoHandle) -> Unit {
   guard @fd_util.fd_is_valid(handle.fd) else {
     abort("file descriptor already closed")
   }
@@
     return ret
   }
   let ret = if @os_error.is_nonblocking_io_error() {
-    handle.wait_read()
+    handle.wait_read_renamed()
     read_unix_ffi(handle.fd, buf, offset~, len~)
   } else {
     ret
*** Update File: <WORKDIR>/src/internal/event_loop/network_unix.mbt
@@
     return ret
   }
   let ret = if @os_error.is_nonblocking_io_error() {
-    handle.wait_read()
+    handle.wait_read_renamed()
     recvfrom_unix_ffi(handle.fd, buf, offset~, len~, addr~)
   } else {
     ret
@@
     @coroutine.protect_from_cancel(@coroutine.pause, resume_on_cancel=true)
     conn
   } else if @os_error.is_nonblocking_io_error() {
-    handle.wait_read()
+    handle.wait_read_renamed()
     accept_unix_ffi(handle.fd, addr)
   } else {
     conn
*** Update File: <WORKDIR>/src/internal/event_loop/process_unix.mbt
@@
     if !@os_error.is_nonblocking_io_error() {
       @os_error.check_errno(context)
     }
-    io.wait_read()
+    io.wait_read_renamed()
   } else if platform is MacOS {
     // MacOS/BSD, use `kqueue` with `EVFILT_PROC`
     if evloop.bus.register_pid(self.pid) {
*** End Patch

```
