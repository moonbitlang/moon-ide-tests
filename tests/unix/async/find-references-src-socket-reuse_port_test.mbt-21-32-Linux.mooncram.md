# async find-references Linux src/socket/reuse_port_test.mbt:21:32

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
$ run_moon_ide moon ide find-references 'Linux' --loc 'src/socket/reuse_port_test.mbt:21:32'
Found 19 references for symbol 'Linux':
<WORKDIR>/src/fs/dir.mbt:304:5-304:10:
    |   dir.offset += entry_len
    |   dir.count += 1
    |   let need_more_entry = match @event_loop.platform {
304 |     Linux => dir.offset >= dir.job_ret
    |     ^^^^^
    |     MacOS => dir.count >= dir.job_ret
    |     Windows => entry_len is 0

<WORKDIR>/src/fs/watch.mbt:191:5-191:10:
    |   ignore(root_id)
    |   root.close()
    |   match @event_loop.platform {
191 |     Linux =>
    |     ^^^^^
    |       InotifyWatcher(self, debounce_timeout~, max_debounce_delay~, context~)
    |       as &WatcherBackend

<WORKDIR>/src/internal/event_loop/process.mbt:48:28-48:33:
   |     IoHandle::from_fd(
   |       handle,
   |       kind=Unknown,
48 |       is_async=platform is Linux,
   |                            ^^^^^
   |       read_only=true,
   |     )

<WORKDIR>/src/internal/event_loop/process_unix.mbt:57:18-57:23:
   | 
   |   let out = Ref(0)
   | 
57 |   if platform is Linux && self.handle is Some(io) {
   |                  ^^^^^
   |     let ret = get_process_result(handle, self.pid, out)
   |     if ret >= 0 {

<WORKDIR>/src/internal/event_loop/process_unix.mbt:84:9-84:14:
   |   if ret < 0 {
   |     while @os_error.is_nonblocking_io_error() {
   |       match @env_util.platform {
84 |         Linux if self.handle is Some(io) =>
   |         ^^^^^
   |           // On Linux, if the child process is `ptrace`'ed,
   |           // we may receive spurious wakeup message from the pidfd.

<WORKDIR>/src/internal/event_loop/process_unix.mbt:94:9-94:14:
   |           // there is a small window where `waitpid(.., WNOHANG)` may still return zero.
   |           // Work around this race condition by waiting again after a small timeout.
   |           sleep(10)
94 |         Linux | Windows => break
   |         ^^^^^
   |       }
   |       let ret = get_process_result(handle, self.pid, out)

<WORKDIR>/src/os_error/error.mbt:27:5-27:10:
   | ///|
   | fn errno_is_nonblocking_io_error(errno : Int) -> Bool {
   |   match @env_util.platform {
27 |     Linux =>
   |     ^^^^^
   |       errno == linux_EAGAIN ||
   |       errno == linux_EINPROGRESS ||

<WORKDIR>/src/os_error/error.mbt:103:5-103:10:
    | pub fn OSError::is_EINTR(err : OSError) -> Bool {
    |   let OSError(errno, ..) = err
    |   match @env_util.platform {
103 |     Linux => errno == linux_EINTR
    |     ^^^^^
    |     MacOS => errno == macos_EINTR
    |     Windows => false

<WORKDIR>/src/os_error/error.mbt:114:5-114:10:
    | pub fn OSError::is_ENOENT(err : OSError) -> Bool {
    |   let OSError(errno, ..) = err
    |   match @env_util.platform {
114 |     Linux => errno == linux_ENOENT
    |     ^^^^^
    |     MacOS => errno == macos_ENOENT
    |     Windows =>

<WORKDIR>/src/os_error/error.mbt:127:5-127:10:
    | pub fn OSError::is_EEXIST(err : OSError) -> Bool {
    |   let OSError(errno, ..) = err
    |   match @env_util.platform {
127 |     Linux => errno == linux_EEXIST
    |     ^^^^^
    |     MacOS => errno == macos_EEXIST
    |     Windows =>

<WORKDIR>/src/os_error/error.mbt:140:5-140:10:
    | pub fn OSError::is_EACCES(err : OSError) -> Bool {
    |   let OSError(errno, ..) = err
    |   match @env_util.platform {
140 |     Linux => errno == linux_EACCES
    |     ^^^^^
    |     MacOS => errno == macos_EACCES
    |     Windows => errno == windows_ERROR_ACCESS_DENIED

<WORKDIR>/src/os_error/error.mbt:151:5-151:10:
    | pub fn OSError::is_ECONNREFUSED(err : OSError) -> Bool {
    |   let OSError(errno, ..) = err
    |   match @env_util.platform {
151 |     Linux => errno == linux_ECONNREFUSED
    |     ^^^^^
    |     MacOS => errno == macos_ECONNREFUSED
    |     Windows => errno == windows_ERROR_CONNECTION_REFUSED

<WORKDIR>/src/os_error/error.mbt:162:5-162:10:
    | pub fn OSError::is_ERROR_NOTIFY_ENUM_DIR(err : OSError) -> Bool {
    |   let OSError(errno, ..) = err
    |   match @env_util.platform {
162 |     Linux | MacOS => false
    |     ^^^^^
    |     Windows => errno == windows_ERROR_NOTIFY_ENUM_DIR
    |   }

<WORKDIR>/src/os_error/error.mbt:177:3-177:8:
    | 
    | ///|
    | pub let errno_ENOTDIR : Int = match @env_util.platform {
177 |   Linux => linux_ENOTDIR
    |   ^^^^^
    |   MacOS => macos_ENOTDIR
    |   Windows => windows_ERROR_DIRECTORY

<WORKDIR>/src/os_error/error.mbt:190:3-190:8:
    | 
    | ///|
    | pub let errno_ENOTSUP : Int = match @env_util.platform {
190 |   Linux => linux_ENOTSUP
    |   ^^^^^
    |   MacOS => macos_ENOTSUP
    |   Windows => windows_ERROR_NOT_SUPPORTED

<WORKDIR>/src/socket/ifname.mbt:19:32-19:37:
   | let global_ifname_socket : Ref[@fd_util.Fd] = {
   |   let context = "creating global socket object for interface name lookup"
   |   let sock = Ref(
19 |     if @event_loop.platform is Linux {
   |                                ^^^^^
   |       make_udp_socket(IPv4, multicast=false, context~) catch {
   |         err => abort(err.to_string())

<WORKDIR>/src/socket/ifname.mbt:31:34-31:39:
   |     init=() => {
   |       // In some tests there may be multiple event loops spawned in a single program run,
   |       // ensure the global socket object is valid after the last event loop disposed it
31 |       if @event_loop.platform is Linux && !@fd_util.fd_is_valid(sock.val) {
   |                                  ^^^^^
   |         sock.val = make_udp_socket(IPv4, multicast=false, context~)
   |       }

<WORKDIR>/src/socket/reuse_port_test.mbt:21:32-21:37:
   |   // and MacOS too, but there which socket accepts a given connection is
   |   // unspecified, so there is nothing to observe. `#cfg(platform=..)` cannot
   |   // express this — it only knows `windows` — so the check is made at runtime.
21 |   if !(@event_loop.platform is Linux) {
   |                                ^^^^^
   |     return
   |   }

<WORKDIR>/src/socket/tcp.mbt:104:30-104:35:
    |   if !(@event_loop.platform is Windows) && reuse_addr {
    |     guard allow_reuse_addr(sock) >= 0 else { @os_error.check_errno(context) }
    |   }
104 |   if @event_loop.platform is Linux && reuse_port_lb {
    |                              ^^^^^
    |     guard allow_reuse_port(sock) >= 0 else { @os_error.check_errno(context) }
    |   }

```
