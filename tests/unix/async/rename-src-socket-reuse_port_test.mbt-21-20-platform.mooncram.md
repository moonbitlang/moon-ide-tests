# async rename platform src/socket/reuse_port_test.mbt:21:20

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
$ run_moon_ide moon ide rename 'platform' 'platform_renamed' --loc 'src/socket/reuse_port_test.mbt:21:20'
*** Begin Patch
*** Update File: <WORKDIR>/src/fs/access_test.mbt
@@
 async test "can_execute" {
   // POSIX execute-bit checks do not match Windows access semantics. Wasm learns
   // the host platform at runtime instead of through MoonBit target cfg.
-  if @event_loop.platform is Windows {
+  if @event_loop.platform_renamed is Windows {
     return
   }
   assert_false(@fs.can_execute("moon.mod"))
@@
 async test "chmod" {
   // POSIX permission-bit transitions do not match Windows chmod semantics. Wasm
   // learns the host platform at runtime instead of through MoonBit target cfg.
-  if @event_loop.platform is Windows {
+  if @event_loop.platform_renamed is Windows {
     return
   }
   let path = "_build/chmod_test"
*** Update File: <WORKDIR>/src/fs/dir.mbt
@@
     @os_error.OSError(_) as err if recursive && err.is_ENOENT() => {
       let last_path_sep_index = match path.rev_find("/") {
         Some(index) => index
-        None if @event_loop.platform is Windows &&
+        None if @event_loop.platform_renamed is Windows &&
           path.rev_find("\\") is Some(index) => index
         None => raise err
       }
       let parent = path[:last_path_sep_index].trim_end(chars="/")
-      let parent = if @event_loop.platform is Windows {
+      let parent = if @event_loop.platform_renamed is Windows {
         parent.trim_end(chars="\\")
       } else {
         parent
@@
 ) -> Unit nocancel {
   let context = "@fs.rmdir()"
   if recursive {
-    let base = if @event_loop.platform is Windows {
+    let base = if @event_loop.platform_renamed is Windows {
       path.trim_end(chars="/\\")
     } else {
       path.trim_end(chars="/")
@@
   let offset = dir.offset
   dir.offset += entry_len
   dir.count += 1
-  let need_more_entry = match @event_loop.platform {
+  let need_more_entry = match @event_loop.platform_renamed {
     Linux => dir.offset >= dir.job_ret
     MacOS => dir.count >= dir.job_ret
     Windows => entry_len is 0
*** Update File: <WORKDIR>/src/fs/mkdir_test.mbt
@@
 async test "mkdir recursive windows" {
   // Wasm learns the host platform at runtime instead of through MoonBit target
   // cfg, so keep this test present and select it using moonrun's host platform.
-  if !(@event_loop.platform is Windows) {
+  if !(@event_loop.platform_renamed is Windows) {
     return
   }
   let base_path = "_build\\recursive_mkdir_windows"
*** Update File: <WORKDIR>/src/fs/realpath_test.mbt
@@
 // These symlink scenarios are not supported on Windows. Wasm learns the host
 // platform at runtime instead of through MoonBit target cfg.
 async test "realpath link to absolute" {
-  if @event_loop.platform is Windows {
+  if @event_loop.platform_renamed is Windows {
     return
   }
   guard! @env.current_dir() is Some(cwd)
@@
 
 ///|
 async test "realpath link to relative" {
-  if @event_loop.platform is Windows {
+  if @event_loop.platform_renamed is Windows {
     return
   }
   guard! @env.current_dir() is Some(cwd)
@@
 
 ///|
 async test "realpath link to dir relative" {
-  if @event_loop.platform is Windows {
+  if @event_loop.platform_renamed is Windows {
     return
   }
   guard! @env.current_dir() is Some(cwd)
*** Update File: <WORKDIR>/src/fs/timestamp_test.mbt
@@
   // Windows may avoid updating access time eagerly, so keep the POSIX-style
   // atime/mtime/ctime assertions to non-Windows hosts. Wasm learns that host
   // platform at runtime instead of through MoonBit target cfg.
-  if @event_loop.platform is Windows {
+  if @event_loop.platform_renamed is Windows {
     return
   }
   let path = "/tmp/timestamp_test"
@@
 // `atime` is not reliable on Windows, so this keeps Windows coverage to mtime.
 // Wasm learns the host platform at runtime instead of through MoonBit target cfg.
 async test "mtime for path" {
-  if !(@event_loop.platform is Windows) {
+  if !(@event_loop.platform_renamed is Windows) {
     return
   }
   let path = "_build/timestamp_test"
@@
   // Windows may avoid updating access time eagerly, so keep the POSIX-style
   // atime/mtime/ctime assertions to non-Windows hosts. Wasm learns that host
   // platform at runtime instead of through MoonBit target cfg.
-  if @event_loop.platform is Windows {
+  if @event_loop.platform_renamed is Windows {
     return
   }
   let path = "/tmp/opened_file_timestamp_test"
@@
 // `atime` is not reliable on Windows, so this keeps Windows coverage to mtime.
 // Wasm learns the host platform at runtime instead of through MoonBit target cfg.
 async test "mtime for opened file" {
-  if !(@event_loop.platform is Windows) {
+  if !(@event_loop.platform_renamed is Windows) {
     return
   }
   let path = "_build/opened_file_timestamp_test"
*** Update File: <WORKDIR>/src/fs/watch.mbt
@@
 ) -> &WatcherBackend raise {
   ignore(root_id)
   root.close()
-  match @event_loop.platform {
+  match @event_loop.platform_renamed {
     Linux =>
       InotifyWatcher(self, debounce_timeout~, max_debounce_delay~, context~)
       as &WatcherBackend
@@
   let path = if path is "" { "/" } else { path.to_owned() }
   let (root_file, root_id) = @event_loop.open(
     path,
-    if @event_loop.platform is Windows {
+    if @event_loop.platform_renamed is Windows {
       3
     } else {
       0
*** Update File: <WORKDIR>/src/internal/event_loop/dev_null_test.mbt
@@
 ///|
 #cfg(any(target="native", target="wasm"))
 async test "/dev/null" {
-  if @event_loop.platform is Windows {
+  if @event_loop.platform_renamed is Windows {
     return
   }
   let file = @fs.open("/dev/null", mode=ReadWrite)
*** Update File: <WORKDIR>/src/internal/event_loop/event_loop.mbt
@@
 // limitations under the License.
 
 ///|
-pub using @env_util {platform}
+pub using @env_util {platform_renamed}
 
 ///|
 priv struct EventLoop {
*** Update File: <WORKDIR>/src/internal/event_loop/fs.mbt
@@
       let io = IoHandle::from_fd(
         fd,
         kind~,
-        is_async=access is 3 || (!(platform is Windows) && kind.can_poll()),
+        is_async=access is 3 || (!(platform_renamed is Windows) && kind.can_poll()),
         read_only=access is 0,
       )
       if append {
*** Update File: <WORKDIR>/src/internal/event_loop/io.mbt
@@
   perform_job_in_worker(
     job,
     context~,
-    cancellable=platform is Windows || handle.kind.can_poll(),
+    cancellable=platform_renamed is Windows || handle.kind.can_poll(),
   )
 }
 
@@
   perform_job_in_worker(
     job,
     context~,
-    cancellable=platform is Windows || handle.kind.can_poll(),
+    cancellable=platform_renamed is Windows || handle.kind.can_poll(),
   )
 }
 
@@
   guard! !handle.is_async
   let job = Job::read(handle.fd, buf, offset, len, position~)
   defer job.free()
-  perform_job_in_worker(job, context~, cancellable=platform is Windows)
+  perform_job_in_worker(job, context~, cancellable=platform_renamed is Windows)
 }
 
 ///|
@@
   }
   let job = Job::write(handle.fd, buf, offset, len, position~)
   defer job.free()
-  ignore(perform_job_in_worker(job, context~, cancellable=platform is Windows))
+  ignore(perform_job_in_worker(job, context~, cancellable=platform_renamed is Windows))
 }
*** Update File: <WORKDIR>/src/internal/event_loop/process.mbt
@@
     IoHandle::from_fd(
       handle,
       kind=Unknown,
-      is_async=platform is Linux,
+      is_async=platform_renamed is Linux,
       read_only=true,
     )
     |> Some
*** Update File: <WORKDIR>/src/internal/event_loop/process_unix.mbt
@@
 
   let out = Ref(0)
 
-  if platform is Linux && self.handle is Some(io) {
+  if platform_renamed is Linux && self.handle is Some(io) {
     let ret = get_process_result(handle, self.pid, out)
     if ret >= 0 {
       return out.val
@@
       @os_error.check_errno(context)
     }
     io.wait_read()
-  } else if platform is MacOS {
+  } else if platform_renamed is MacOS {
     // MacOS/BSD, use `kqueue` with `EVFILT_PROC`
     if evloop.bus.register_pid(self.pid) {
       evloop.extra.wait_pid(evloop, self.pid)
*** Update File: <WORKDIR>/src/process/cancellation.mbt
@@
 pub(all) struct CancellationHandler(async (Int) -> Unit)
 
 ///|
-let default_signal : @signal.Signal = if @event_loop.platform is Windows {
+let default_signal : @signal.Signal = if @event_loop.platform_renamed is Windows {
   SIGBREAK
 } else {
   SIGTERM
*** Update File: <WORKDIR>/src/process/commands_for_test.mbt
@@
 // limitations under the License.
 
 ///|
-let is_windows : Bool = @event_loop.platform is Windows
+let is_windows : Bool = @event_loop.platform_renamed is Windows
 
 ///|
 let shell : String = if is_windows { "powershell" } else { "sh" }
*** Update File: <WORKDIR>/src/process/wait_test.mbt
@@
 
 ///|
 async test "spawn without standard handles on Windows" {
-  guard @event_loop.platform is Windows else {  }
+  guard @event_loop.platform_renamed is Windows else {  }
   let spawn = spawn_prog.wait()
   let sleep = sleep_prog.wait()
   inspect(
@@
 
 ///|
 async test "wait exitcode STILL_ACTIVE" {
-  guard @event_loop.platform is Windows else {  }
+  guard @event_loop.platform_renamed is Windows else {  }
   // `259` is the special value for `STILL_ACTIVE`,
   // wihch is returned by `GetExitCodeProcess` when the process is still running on Windows.
   // However, 259 can also be a valid exit code,
@@
 
 ///|
 async test "signal exit code" {
-  guard !(@event_loop.platform is Windows) else {  }
+  guard !(@event_loop.platform_renamed is Windows) else {  }
   let sleep = sleep_prog.wait()
   let exit_code = @async.with_task_group <| group => {
     let proc = @process.spawn(group, sleep, ["1000", "-use-default-handler"])
*** Update File: <WORKDIR>/src/socket/ifname.mbt
@@
 let global_ifname_socket : Ref[@fd_util.Fd] = {
   let context = "creating global socket object for interface name lookup"
   let sock = Ref(
-    if @event_loop.platform is Linux {
+    if @event_loop.platform_renamed is Linux {
       make_udp_socket(IPv4, multicast=false, context~) catch {
         err => abort(err.to_string())
       }
@@
     init=() => {
       // In some tests there may be multiple event loops spawned in a single program run,
       // ensure the global socket object is valid after the last event loop disposed it
-      if @event_loop.platform is Linux && !@fd_util.fd_is_valid(sock.val) {
+      if @event_loop.platform_renamed is Linux && !@fd_util.fd_is_valid(sock.val) {
         sock.val = make_udp_socket(IPv4, multicast=false, context~)
       }
     },
*** Update File: <WORKDIR>/src/socket/multicast_test.mbt
@@
 
 ///|
 async test "multicast no loopback" {
-  if @event_loop.platform is MacOS {
+  if @event_loop.platform_renamed is MacOS {
     // MacOS requires the user clicking a GUI alertbox for UDP multicast since MacOS 15
     return
   }
@@
         let (n, _) = server.recvfrom(buf)
         let data = buf.unsafe_reinterpret_as_bytes()[:n]
         log.push("server received: \{@utf8.decode(data)}")
-        if @event_loop.platform is Windows {
+        if @event_loop.platform_renamed is Windows {
           server.set_multicast_loopback(false)
         }
       }
@@
     client.set_multicast_ttl(0)
     log.push("client sending: abcd")
     let _ = client.send(b"abcd")
-    if !(@event_loop.platform is Windows) {
+    if !(@event_loop.platform_renamed is Windows) {
       client.set_multicast_loopback(false)
     }
     @async.sleep(200)
@@
 
 ///|
 async test "multicast discovery then unicast v6" {
-  if @event_loop.platform is MacOS {
+  if @event_loop.platform_renamed is MacOS {
     // MacOS requires the user clicking a GUI alertbox for UDP multicast since MacOS 15
     return
   }
@@
 
 ///|
 async test "multicast no loopback v6" {
-  if @event_loop.platform is MacOS {
+  if @event_loop.platform_renamed is MacOS {
     // MacOS requires the user clicking a GUI alertbox for UDP multicast since MacOS 15
     return
   }
@@
         let (n, _) = server.recvfrom(buf)
         let data = buf.unsafe_reinterpret_as_bytes()[:n]
         log.push("server received: \{@utf8.decode(data)}")
-        if @event_loop.platform is Windows {
+        if @event_loop.platform_renamed is Windows {
           server.set_multicast_loopback(false)
         }
       }
@@
     client.set_multicast_ttl(0)
     log.push("client sending: abcd")
     let _ = client.send(b"abcd")
-    if !(@event_loop.platform is Windows) {
+    if !(@event_loop.platform_renamed is Windows) {
       client.set_multicast_loopback(false)
     }
     @async.sleep(200)
*** Update File: <WORKDIR>/src/socket/reuse_port_test.mbt
@@
   // and MacOS too, but there which socket accepts a given connection is
   // unspecified, so there is nothing to observe. `#cfg(platform=..)` cannot
   // express this — it only knows `windows` — so the check is made at runtime.
-  if !(@event_loop.platform is Linux) {
+  if !(@event_loop.platform_renamed is Linux) {
     return
   }
   let mut accepted1 = 0
*** Update File: <WORKDIR>/src/socket/tcp.mbt
@@
       @os_error.check_errno(context)
     }
   }
-  if !(@event_loop.platform is Windows) && reuse_addr {
+  if !(@event_loop.platform_renamed is Windows) && reuse_addr {
     guard allow_reuse_addr(sock) >= 0 else { @os_error.check_errno(context) }
   }
-  if @event_loop.platform is Linux && reuse_port_lb {
+  if @event_loop.platform_renamed is Linux && reuse_port_lb {
     guard allow_reuse_port(sock) >= 0 else { @os_error.check_errno(context) }
   }
   io.bind(addr.0, context~)
*** Update File: <WORKDIR>/src/socket/udp.mbt
@@
   let io = @event_loop.IoHandle::from_fd(sock, kind=Socket, read_only=true)
   errdefer io.close()
   let dst_addr = if addr.is_multicast() {
-    if @event_loop.platform is Windows {
+    if @event_loop.platform_renamed is Windows {
       let local_addr = Addr::any(family)
       io.bind(local_addr.0, context~)
     }
@@
   let sock = make_udp_socket(family, multicast=true, context~)
   let io = @event_loop.IoHandle::from_fd(sock, kind=Socket)
   errdefer io.close()
-  if @event_loop.platform is Windows {
+  if @event_loop.platform_renamed is Windows {
     let local_addr = Addr::new(0, multi_addr.port())
     io.bind(local_addr.0, context~)
   } else {
*** Update File: <WORKDIR>/src/tls/tls.mbt
@@
 
 ///|
 // Wasm TLS dispatches server credential shape from the host runtime platform.
-let _target_specific_imports : Unit = ignore(@event_loop.platform)
+let _target_specific_imports : Unit = ignore(@event_loop.platform_renamed)
 
 ///|
 fn decode_pem_certificates(pem : String) -> Array[Bytes] raise TlsError {
*** End Patch

```
