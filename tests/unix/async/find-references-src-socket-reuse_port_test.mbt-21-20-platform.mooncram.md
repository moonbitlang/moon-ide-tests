# async find-references platform src/socket/reuse_port_test.mbt:21:20

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
$ run_moon_ide moon ide find-references 'platform' --loc 'src/socket/reuse_port_test.mbt:21:20'
Found 45 references for symbol 'platform':
<WORKDIR>/src/fs/access_test.mbt:45:18-45:26:
   | async test "can_execute" {
   |   // POSIX execute-bit checks do not match Windows access semantics. Wasm learns
   |   // the host platform at runtime instead of through MoonBit target cfg.
45 |   if @event_loop.platform is Windows {
   |                  ^^^^^^^^
   |     return
   |   }

<WORKDIR>/src/fs/access_test.mbt:55:18-55:26:
   | async test "chmod" {
   |   // POSIX permission-bit transitions do not match Windows chmod semantics. Wasm
   |   // learns the host platform at runtime instead of through MoonBit target cfg.
55 |   if @event_loop.platform is Windows {
   |                  ^^^^^^^^
   |     return
   |   }

<WORKDIR>/src/fs/dir.mbt:34:29-34:37:
   |     @os_error.OSError(_) as err if recursive && err.is_ENOENT() => {
   |       let last_path_sep_index = match path.rev_find("/") {
   |         Some(index) => index
34 |         None if @event_loop.platform is Windows &&
   |                             ^^^^^^^^
   |           path.rev_find("\\") is Some(index) => index
   |         None => raise err

<WORKDIR>/src/fs/dir.mbt:39:35-39:43:
   |         None => raise err
   |       }
   |       let parent = path[:last_path_sep_index].trim_end(chars="/")
39 |       let parent = if @event_loop.platform is Windows {
   |                                   ^^^^^^^^
   |         parent.trim_end(chars="\\")
   |       } else {

<WORKDIR>/src/fs/dir.mbt:65:31-65:39:
   | ) -> Unit nocancel {
   |   let context = "@fs.rmdir()"
   |   if recursive {
65 |     let base = if @event_loop.platform is Windows {
   |                               ^^^^^^^^
   |       path.trim_end(chars="/\\")
   |     } else {

<WORKDIR>/src/fs/dir.mbt:303:43-303:51:
    |   let offset = dir.offset
    |   dir.offset += entry_len
    |   dir.count += 1
303 |   let need_more_entry = match @event_loop.platform {
    |                                           ^^^^^^^^
    |     Linux => dir.offset >= dir.job_ret
    |     MacOS => dir.count >= dir.job_ret

<WORKDIR>/src/fs/mkdir_test.mbt:54:20-54:28:
   | async test "mkdir recursive windows" {
   |   // Wasm learns the host platform at runtime instead of through MoonBit target
   |   // cfg, so keep this test present and select it using moonrun's host platform.
54 |   if !(@event_loop.platform is Windows) {
   |                    ^^^^^^^^
   |     return
   |   }

<WORKDIR>/src/fs/realpath_test.mbt:30:18-30:26:
   | // These symlink scenarios are not supported on Windows. Wasm learns the host
   | // platform at runtime instead of through MoonBit target cfg.
   | async test "realpath link to absolute" {
30 |   if @event_loop.platform is Windows {
   |                  ^^^^^^^^
   |     return
   |   }

<WORKDIR>/src/fs/realpath_test.mbt:48:18-48:26:
   | 
   | ///|
   | async test "realpath link to relative" {
48 |   if @event_loop.platform is Windows {
   |                  ^^^^^^^^
   |     return
   |   }

<WORKDIR>/src/fs/realpath_test.mbt:81:18-81:26:
   | 
   | ///|
   | async test "realpath link to dir relative" {
81 |   if @event_loop.platform is Windows {
   |                  ^^^^^^^^
   |     return
   |   }

<WORKDIR>/src/fs/timestamp_test.mbt:27:18-27:26:
   |   // Windows may avoid updating access time eagerly, so keep the POSIX-style
   |   // atime/mtime/ctime assertions to non-Windows hosts. Wasm learns that host
   |   // platform at runtime instead of through MoonBit target cfg.
27 |   if @event_loop.platform is Windows {
   |                  ^^^^^^^^
   |     return
   |   }

<WORKDIR>/src/fs/timestamp_test.mbt:62:20-62:28:
   | // `atime` is not reliable on Windows, so this keeps Windows coverage to mtime.
   | // Wasm learns the host platform at runtime instead of through MoonBit target cfg.
   | async test "mtime for path" {
62 |   if !(@event_loop.platform is Windows) {
   |                    ^^^^^^^^
   |     return
   |   }

<WORKDIR>/src/fs/timestamp_test.mbt:83:18-83:26:
   |   // Windows may avoid updating access time eagerly, so keep the POSIX-style
   |   // atime/mtime/ctime assertions to non-Windows hosts. Wasm learns that host
   |   // platform at runtime instead of through MoonBit target cfg.
83 |   if @event_loop.platform is Windows {
   |                  ^^^^^^^^
   |     return
   |   }

<WORKDIR>/src/fs/timestamp_test.mbt:121:20-121:28:
    | // `atime` is not reliable on Windows, so this keeps Windows coverage to mtime.
    | // Wasm learns the host platform at runtime instead of through MoonBit target cfg.
    | async test "mtime for opened file" {
121 |   if !(@event_loop.platform is Windows) {
    |                    ^^^^^^^^
    |     return
    |   }

<WORKDIR>/src/fs/watch.mbt:190:21-190:29:
    | ) -> &WatcherBackend raise {
    |   ignore(root_id)
    |   root.close()
190 |   match @event_loop.platform {
    |                     ^^^^^^^^
    |     Linux =>
    |       InotifyWatcher(self, debounce_timeout~, max_debounce_delay~, context~)

<WORKDIR>/src/fs/watch.mbt:290:20-290:28:
    |   let path = if path is "" { "/" } else { path.to_owned() }
    |   let (root_file, root_id) = @event_loop.open(
    |     path,
290 |     if @event_loop.platform is Windows {
    |                    ^^^^^^^^
    |       3
    |     } else {

<WORKDIR>/src/internal/event_loop/dev_null_test.mbt:18:18-18:26:
   | ///|
   | #cfg(any(target="native", target="wasm"))
   | async test "/dev/null" {
18 |   if @event_loop.platform is Windows {
   |                  ^^^^^^^^
   |     return
   |   }

<WORKDIR>/src/internal/event_loop/fs.mbt:70:36-70:44:
   |       let io = IoHandle::from_fd(
   |         fd,
   |         kind~,
70 |         is_async=access is 3 || (!(platform is Windows) && kind.can_poll()),
   |                                    ^^^^^^^^
   |         read_only=access is 0,
   |       )

<WORKDIR>/src/internal/event_loop/io.mbt:146:17-146:25:
    |   perform_job_in_worker(
    |     job,
    |     context~,
146 |     cancellable=platform is Windows || handle.kind.can_poll(),
    |                 ^^^^^^^^
    |   )
    | }

<WORKDIR>/src/internal/event_loop/io.mbt:198:17-198:25:
    |   perform_job_in_worker(
    |     job,
    |     context~,
198 |     cancellable=platform is Windows || handle.kind.can_poll(),
    |                 ^^^^^^^^
    |   )
    | }

<WORKDIR>/src/internal/event_loop/io.mbt:240:52-240:60:
    |   guard! !handle.is_async
    |   let job = Job::read(handle.fd, buf, offset, len, position~)
    |   defer job.free()
240 |   perform_job_in_worker(job, context~, cancellable=platform is Windows)
    |                                                    ^^^^^^^^
    | }
    | 

<WORKDIR>/src/internal/event_loop/io.mbt:264:59-264:67:
    |   }
    |   let job = Job::write(handle.fd, buf, offset, len, position~)
    |   defer job.free()
264 |   ignore(perform_job_in_worker(job, context~, cancellable=platform is Windows))
    |                                                           ^^^^^^^^
    | }

<WORKDIR>/src/internal/event_loop/process.mbt:48:16-48:24:
   |     IoHandle::from_fd(
   |       handle,
   |       kind=Unknown,
48 |       is_async=platform is Linux,
   |                ^^^^^^^^
   |       read_only=true,
   |     )

<WORKDIR>/src/internal/event_loop/process_unix.mbt:57:6-57:14:
   | 
   |   let out = Ref(0)
   | 
57 |   if platform is Linux && self.handle is Some(io) {
   |      ^^^^^^^^
   |     let ret = get_process_result(handle, self.pid, out)
   |     if ret >= 0 {

<WORKDIR>/src/internal/event_loop/process_unix.mbt:66:13-66:21:
   |       @os_error.check_errno(context)
   |     }
   |     io.wait_read()
66 |   } else if platform is MacOS {
   |             ^^^^^^^^
   |     // MacOS/BSD, use `kqueue` with `EVFILT_PROC`
   |     if evloop.bus.register_pid(self.pid) {

<WORKDIR>/src/process/cancellation.mbt:39:54-39:62:
   | pub(all) struct CancellationHandler(async (Int) -> Unit)
   | 
   | ///|
39 | let default_signal : @signal.Signal = if @event_loop.platform is Windows {
   |                                                      ^^^^^^^^
   |   SIGBREAK
   | } else {

<WORKDIR>/src/process/commands_for_test.mbt:17:37-17:45:
   | // limitations under the License.
   | 
   | ///|
17 | let is_windows : Bool = @event_loop.platform is Windows
   |                                     ^^^^^^^^
   | 
   | ///|

<WORKDIR>/src/process/wait_test.mbt:74:21-74:29:
   | 
   | ///|
   | async test "spawn without standard handles on Windows" {
74 |   guard @event_loop.platform is Windows else {  }
   |                     ^^^^^^^^
   |   let spawn = spawn_prog.wait()
   |   let sleep = sleep_prog.wait()

<WORKDIR>/src/process/wait_test.mbt:85:21-85:29:
   | 
   | ///|
   | async test "wait exitcode STILL_ACTIVE" {
85 |   guard @event_loop.platform is Windows else {  }
   |                     ^^^^^^^^
   |   // `259` is the special value for `STILL_ACTIVE`,
   |   // wihch is returned by `GetExitCodeProcess` when the process is still running on Windows.

<WORKDIR>/src/process/wait_test.mbt:100:23-100:31:
    | 
    | ///|
    | async test "signal exit code" {
100 |   guard !(@event_loop.platform is Windows) else {  }
    |                       ^^^^^^^^
    |   let sleep = sleep_prog.wait()
    |   let exit_code = @async.with_task_group <| group => {

<WORKDIR>/src/socket/ifname.mbt:19:20-19:28:
   | let global_ifname_socket : Ref[@fd_util.Fd] = {
   |   let context = "creating global socket object for interface name lookup"
   |   let sock = Ref(
19 |     if @event_loop.platform is Linux {
   |                    ^^^^^^^^
   |       make_udp_socket(IPv4, multicast=false, context~) catch {
   |         err => abort(err.to_string())

<WORKDIR>/src/socket/ifname.mbt:31:22-31:30:
   |     init=() => {
   |       // In some tests there may be multiple event loops spawned in a single program run,
   |       // ensure the global socket object is valid after the last event loop disposed it
31 |       if @event_loop.platform is Linux && !@fd_util.fd_is_valid(sock.val) {
   |                      ^^^^^^^^
   |         sock.val = make_udp_socket(IPv4, multicast=false, context~)
   |       }

<WORKDIR>/src/socket/multicast_test.mbt:102:18-102:26:
    | 
    | ///|
    | async test "multicast no loopback" {
102 |   if @event_loop.platform is MacOS {
    |                  ^^^^^^^^
    |     // MacOS requires the user clicking a GUI alertbox for UDP multicast since MacOS 15
    |     return

<WORKDIR>/src/socket/multicast_test.mbt:118:24-118:32:
    |         let (n, _) = server.recvfrom(buf)
    |         let data = buf.unsafe_reinterpret_as_bytes()[:n]
    |         log.push("server received: \{@utf8.decode(data)}")
118 |         if @event_loop.platform is Windows {
    |                        ^^^^^^^^
    |           server.set_multicast_loopback(false)
    |         }

<WORKDIR>/src/socket/multicast_test.mbt:130:22-130:30:
    |     client.set_multicast_ttl(0)
    |     log.push("client sending: abcd")
    |     let _ = client.send(b"abcd")
130 |     if !(@event_loop.platform is Windows) {
    |                      ^^^^^^^^
    |       client.set_multicast_loopback(false)
    |     }

<WORKDIR>/src/socket/multicast_test.mbt:145:18-145:26:
    | 
    | ///|
    | async test "multicast discovery then unicast v6" {
145 |   if @event_loop.platform is MacOS {
    |                  ^^^^^^^^
    |     // MacOS requires the user clicking a GUI alertbox for UDP multicast since MacOS 15
    |     return

<WORKDIR>/src/socket/multicast_test.mbt:201:18-201:26:
    | 
    | ///|
    | async test "multicast no loopback v6" {
201 |   if @event_loop.platform is MacOS {
    |                  ^^^^^^^^
    |     // MacOS requires the user clicking a GUI alertbox for UDP multicast since MacOS 15
    |     return

<WORKDIR>/src/socket/multicast_test.mbt:221:24-221:32:
    |         let (n, _) = server.recvfrom(buf)
    |         let data = buf.unsafe_reinterpret_as_bytes()[:n]
    |         log.push("server received: \{@utf8.decode(data)}")
221 |         if @event_loop.platform is Windows {
    |                        ^^^^^^^^
    |           server.set_multicast_loopback(false)
    |         }

<WORKDIR>/src/socket/multicast_test.mbt:235:22-235:30:
    |     client.set_multicast_ttl(0)
    |     log.push("client sending: abcd")
    |     let _ = client.send(b"abcd")
235 |     if !(@event_loop.platform is Windows) {
    |                      ^^^^^^^^
    |       client.set_multicast_loopback(false)
    |     }

<WORKDIR>/src/socket/reuse_port_test.mbt:21:20-21:28:
   |   // and MacOS too, but there which socket accepts a given connection is
   |   // unspecified, so there is nothing to observe. `#cfg(platform=..)` cannot
   |   // express this — it only knows `windows` — so the check is made at runtime.
21 |   if !(@event_loop.platform is Linux) {
   |                    ^^^^^^^^
   |     return
   |   }

<WORKDIR>/src/socket/tcp.mbt:101:20-101:28:
    |       @os_error.check_errno(context)
    |     }
    |   }
101 |   if !(@event_loop.platform is Windows) && reuse_addr {
    |                    ^^^^^^^^
    |     guard allow_reuse_addr(sock) >= 0 else { @os_error.check_errno(context) }
    |   }

<WORKDIR>/src/socket/tcp.mbt:104:18-104:26:
    |   if !(@event_loop.platform is Windows) && reuse_addr {
    |     guard allow_reuse_addr(sock) >= 0 else { @os_error.check_errno(context) }
    |   }
104 |   if @event_loop.platform is Linux && reuse_port_lb {
    |                  ^^^^^^^^
    |     guard allow_reuse_port(sock) >= 0 else { @os_error.check_errno(context) }
    |   }

<WORKDIR>/src/socket/udp.mbt:51:20-51:28:
   |   let io = @event_loop.IoHandle::from_fd(sock, kind=Socket, read_only=true)
   |   errdefer io.close()
   |   let dst_addr = if addr.is_multicast() {
51 |     if @event_loop.platform is Windows {
   |                    ^^^^^^^^
   |       let local_addr = Addr::any(family)
   |       io.bind(local_addr.0, context~)

<WORKDIR>/src/socket/udp.mbt:266:18-266:26:
    |   let sock = make_udp_socket(family, multicast=true, context~)
    |   let io = @event_loop.IoHandle::from_fd(sock, kind=Socket)
    |   errdefer io.close()
266 |   if @event_loop.platform is Windows {
    |                  ^^^^^^^^
    |     let local_addr = Addr::new(0, multi_addr.port())
    |     io.bind(local_addr.0, context~)

<WORKDIR>/src/tls/tls.mbt:31:58-31:66:
   | 
   | ///|
   | // Wasm TLS dispatches server credential shape from the host runtime platform.
31 | let _target_specific_imports : Unit = ignore(@event_loop.platform)
   |                                                          ^^^^^^^^
   | 
   | ///|

```
