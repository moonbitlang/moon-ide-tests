# async find-references Linux src\socket\reuse_port_test.mbt:21:32

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' find-references 'Linux' --loc 'src\socket\reuse_port_test.mbt:21:32'
Found 20 references for symbol 'Linux':
<WORKDIR>/src\fs\dir.mbt:231:5-231:10:
    |   context~ : String,
    | ) -> String raise {
    |   match @event_loop.platform {
231 |     Linux | MacOS =>
    |     ^^^^^
    |       if path is ['/', ..] {
    |         raise Failure(

<WORKDIR>/src\fs\dir.mbt:246:5-246:10:
    |   }
    |   let result = StringBuilder()
    |   let sep = match @event_loop.platform {
246 |     Linux | MacOS => '/'
    |     ^^^^^
    |     Windows => '\\'
    |   }

<WORKDIR>/src\fs\dir.mbt:541:5-541:10:
    |   dir.offset += entry_len
    |   dir.count += 1
    |   let need_more_entry = match @event_loop.platform {
541 |     Linux => dir.offset >= dir.job_ret
    |     ^^^^^
    |     MacOS => dir.count >= dir.job_ret
    |     Windows => entry_len is 0

<WORKDIR>/src\fs\relative_open_wbtest.mbt:25:5-25:10:
   |     )
   |   }
   |   match @event_loop.platform {
25 |     Linux | MacOS => {
   |     ^^^^^
   |       inspect(check("file"), content="file")
   |       inspect(check("a/b//c/"), content="a/b/c")

<WORKDIR>/src\internal\event_loop\process.mbt:48:28-48:33:
   |     IoHandle::from_fd(
   |       handle,
   |       kind=Unknown,
48 |       is_async=platform is Linux,
   |                            ^^^^^
   |       read_only=true,
   |     )

<WORKDIR>/src\os_error\error.mbt:27:5-27:10:
   | ///|
   | fn errno_is_nonblocking_io_error(errno : Int32) -> Bool {
   |   match @env_util.platform {
27 |     Linux =>
   |     ^^^^^
   |       errno == linux_EAGAIN ||
   |       errno == linux_EINPROGRESS ||

<WORKDIR>/src\os_error\error.mbt:104:5-104:10:
    | pub fn OSError::is_EINTR(err : OSError) -> Bool {
    |   let OSError(errno, ..) = err
    |   match @env_util.platform {
104 |     Linux => errno == linux_EINTR
    |     ^^^^^
    |     MacOS => errno == macos_EINTR
    |     Windows => false

<WORKDIR>/src\os_error\error.mbt:118:5-118:10:
    | pub fn OSError::is_ENOENT(err : OSError) -> Bool {
    |   let OSError(errno, ..) = err
    |   match @env_util.platform {
118 |     Linux => errno == linux_ENOENT
    |     ^^^^^
    |     MacOS => errno == macos_ENOENT
    |     Windows =>

<WORKDIR>/src\os_error\error.mbt:131:5-131:10:
    | pub fn OSError::is_EEXIST(err : OSError) -> Bool {
    |   let OSError(errno, ..) = err
    |   match @env_util.platform {
131 |     Linux => errno == linux_EEXIST
    |     ^^^^^
    |     MacOS => errno == macos_EEXIST
    |     Windows =>

<WORKDIR>/src\os_error\error.mbt:144:5-144:10:
    | pub fn OSError::is_EACCES(err : OSError) -> Bool {
    |   let OSError(errno, ..) = err
    |   match @env_util.platform {
144 |     Linux => errno == linux_EACCES
    |     ^^^^^
    |     MacOS => errno == macos_EACCES
    |     Windows => errno == windows_ERROR_ACCESS_DENIED

<WORKDIR>/src\os_error\error.mbt:155:5-155:10:
    | pub fn OSError::is_ECONNREFUSED(err : OSError) -> Bool {
    |   let OSError(errno, ..) = err
    |   match @env_util.platform {
155 |     Linux => errno == linux_ECONNREFUSED
    |     ^^^^^
    |     MacOS => errno == macos_ECONNREFUSED
    |     Windows => errno == windows_ERROR_CONNECTION_REFUSED

<WORKDIR>/src\os_error\error.mbt:166:5-166:10:
    | pub fn OSError::is_ERROR_NOTIFY_ENUM_DIR(err : OSError) -> Bool {
    |   let OSError(errno, ..) = err
    |   match @env_util.platform {
166 |     Linux | MacOS => false
    |     ^^^^^
    |     Windows => errno == windows_ERROR_NOTIFY_ENUM_DIR
    |   }

<WORKDIR>/src\os_error\error.mbt:181:3-181:8:
    | 
    | ///|
    | pub let errno_ENOTDIR : Int32 = match @env_util.platform {
181 |   Linux => linux_ENOTDIR
    |   ^^^^^
    |   MacOS => macos_ENOTDIR
    |   Windows => windows_ERROR_DIRECTORY

<WORKDIR>/src\os_error\error.mbt:194:3-194:8:
    | 
    | ///|
    | pub let errno_ENOTSUP : Int32 = match @env_util.platform {
194 |   Linux => linux_ENOTSUP
    |   ^^^^^
    |   MacOS => macos_ENOTSUP
    |   Windows => windows_ERROR_NOT_SUPPORTED

<WORKDIR>/src\socket\ifname.mbt:19:32-19:37:
   | let global_ifname_socket : Ref[@fd_util.Fd] = {
   |   let context = "creating global socket object for interface name lookup"
   |   let sock = Ref(
19 |     if @event_loop.platform is Linux {
   |                                ^^^^^
   |       make_udp_socket(IPv4, multicast=false, context~) catch {
   |         err => abort(err.to_string())

<WORKDIR>/src\socket\ifname.mbt:31:34-31:39:
   |     init=() => {
   |       // In some tests there may be multiple event loops spawned in a single program run,
   |       // ensure the global socket object is valid after the last event loop disposed it
31 |       if @event_loop.platform is Linux && !@fd_util.fd_is_valid(sock.val) {
   |                                  ^^^^^
   |         sock.val = make_udp_socket(IPv4, multicast=false, context~)
   |       }

<WORKDIR>/src\socket\reuse_port_test.mbt:21:32-21:37:
   |   // and MacOS too, but there which socket accepts a given connection is
   |   // unspecified, so there is nothing to observe. `#cfg(platform=..)` cannot
   |   // express this — it only knows `windows` — so the check is made at runtime.
21 |   if !(@event_loop.platform is Linux) {
   |                                ^^^^^
   |     return
   |   }

<WORKDIR>/src\socket\reuse_port_test.mbt:69:32-69:37:
   | 
   | ///|
   | async test "udp reuse port lb" {
69 |   if !(@event_loop.platform is Linux) {
   |                                ^^^^^
   |     return
   |   }

<WORKDIR>/src\socket\tcp.mbt:104:30-104:35:
    |   if !(@event_loop.platform is Windows) && reuse_addr {
    |     guard allow_reuse_addr(sock) >= 0 else { @os_error.check_errno(context) }
    |   }
104 |   if @event_loop.platform is Linux && reuse_port_lb {
    |                              ^^^^^
    |     guard allow_reuse_port(sock) >= 0 else { @os_error.check_errno(context) }
    |   }

<WORKDIR>/src\socket\udp.mbt:240:30-240:35:
    |       @os_error.check_errno(context)
    |     }
    |   }
240 |   if @event_loop.platform is Linux && reuse_port_lb {
    |                              ^^^^^
    |     guard allow_reuse_port(sock) >= 0 else { @os_error.check_errno(context) }
    |   }
"" (escaped)
```
