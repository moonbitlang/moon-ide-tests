# async find-references IoHandle src/internal/event_loop/io_unix.mbt:17:14

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
$ run_moon_ide moon ide find-references 'IoHandle' --loc 'src/internal/event_loop/io_unix.mbt:17:14'
Found 108 references for symbol 'IoHandle':
<WORKDIR>/src/fs/dir.mbt:100:20-100:28:
    | ///|
    | /// A directory in file system
    | struct Directory {
100 |   io : @event_loop.IoHandle
    |                    ^^^^^^^^
    |   buf : DirectoryBuffer
    |   buf_len : Int

<WORKDIR>/src/fs/dir.mbt:159:47-159:55:
    | }
    | 
    | ///|
159 | fn Directory::from_io_handle(io : @event_loop.IoHandle) -> Directory {
    |                                               ^^^^^^^^
    |   let buf_len = @cmp.maximum(1024, Directory::min_buffer_size())
    |   {

<WORKDIR>/src/fs/file.mbt:17:20-17:28:
   | 
   | ///|
   | struct File {
17 |   io : @event_loop.IoHandle
   |                    ^^^^^^^^
   |   read_buf : @io.ReaderBuffer
   | }

<WORKDIR>/src/fs/watch.mbt:182:22-182:30:
    | #cfg(all(target="native", not(platform="windows")))
    | fn Watcher::new_backend(
    |   self : Watcher,
182 |   root : @event_loop.IoHandle,
    |                      ^^^^^^^^
    |   root_id~ : FileIdentity,
    |   debounce_timeout~ : Int,

<WORKDIR>/src/fs/watch_inotify.mbt:18:25-18:33:
   | ///|
   | #cfg(any(target="wasm", not(platform="windows")))
   | priv struct InotifyWatcher {
18 |   inotify : @event_loop.IoHandle
   |                         ^^^^^^^^
   |   watched : Map[@fd_util.Fd, FileIdentity]
   |   watcher : Watcher

<WORKDIR>/src/fs/watch_inotify.mbt:51:26-51:34:
   |     @os_error.check_errno(context)
   |   }
   |   let self = {
51 |     inotify: @event_loop.IoHandle::from_fd(
   |                          ^^^^^^^^
   |       inotify_fd,
   |       kind=Unknown,

<WORKDIR>/src/fs/watch_kqueue.mbt:19:20-19:28:
   | #cfg(any(target="wasm", not(platform="windows")))
   | priv struct KqueueWatchedFile {
   |   identity : FileIdentity
19 |   io : @event_loop.IoHandle
   |                    ^^^^^^^^
   | }
   | 

<WORKDIR>/src/fs/watch_kqueue.mbt:25:24-25:32:
   | ///|
   | #cfg(any(target="wasm", not(platform="windows")))
   | priv struct KqueueWatcher {
25 |   kqueue : @event_loop.IoHandle
   |                        ^^^^^^^^
   |   watched : Map[@fd_util.Fd, KqueueWatchedFile]
   |   watcher : Watcher

<WORKDIR>/src/fs/watch_kqueue.mbt:70:25-70:33:
   |   }
   |   let event_buffer_len = KqueueEventBuffer::size()
   |   {
70 |     kqueue: @event_loop.IoHandle::from_fd(
   |                         ^^^^^^^^
   |       kqueue,
   |       kind=Unknown,

<WORKDIR>/src/internal/event_loop/event_loop.mbt:21:26-21:34:
   | ///|
   | priv struct EventLoop {
   |   bus : EventBus
21 |   fds : Map[@fd_util.Fd, IoHandle]
   |                          ^^^^^^^^
   |   extra : PlatformEventLoopExtra
   |   /// a special file descriptor used to indicate job completion message from thread pool

<WORKDIR>/src/internal/event_loop/fs.mbt:35:7-35:15:
   |   // permission for file when new file is created
   |   mode~ : Int,
   |   context~ : String,
35 | ) -> (IoHandle, FileIdentity) {
   |       ^^^^^^^^
   |   let path_bytes = @os_string.encode(path)
   |   let stat_buf = FixedArray::make(32, b'\x00')

<WORKDIR>/src/internal/event_loop/fs.mbt:67:16-67:24:
   |         )
   |       }
   |       let kind = @fd_util.FileKind::unsafe_from_int(kind.to_int())
67 |       let io = IoHandle::from_fd(
   |                ^^^^^^^^
   |         fd,
   |         kind~,

<WORKDIR>/src/internal/event_loop/fs.mbt:313:14-313:22:
    | }
    | 
    | ///|
313 | pub async fn IoHandle::fsync(
    |              ^^^^^^^^
    |   handle : IoHandle,
    |   only_data~ : Bool,

<WORKDIR>/src/internal/event_loop/fs.mbt:314:12-314:20:
    | 
    | ///|
    | pub async fn IoHandle::fsync(
314 |   handle : IoHandle,
    |            ^^^^^^^^
    |   only_data~ : Bool,
    |   context~ : String,

<WORKDIR>/src/internal/event_loop/fs.mbt:324:14-324:22:
    | }
    | 
    | ///|
324 | pub async fn IoHandle::lock(
    |              ^^^^^^^^
    |   handle : IoHandle,
    |   exclusive~ : Bool,

<WORKDIR>/src/internal/event_loop/fs.mbt:325:12-325:20:
    | 
    | ///|
    | pub async fn IoHandle::lock(
325 |   handle : IoHandle,
    |            ^^^^^^^^
    |   exclusive~ : Bool,
    |   context~ : String,

<WORKDIR>/src/internal/event_loop/fs.mbt:427:14-427:22:
    | }
    | 
    | ///|
427 | pub async fn IoHandle::readdir(
    |              ^^^^^^^^
    |   dir : IoHandle,
    |   buf : @c_buffer.Buffer,

<WORKDIR>/src/internal/event_loop/fs.mbt:428:9-428:17:
    | 
    | ///|
    | pub async fn IoHandle::readdir(
428 |   dir : IoHandle,
    |         ^^^^^^^^
    |   buf : @c_buffer.Buffer,
    |   len : Int,

<WORKDIR>/src/internal/event_loop/io.mbt:50:8-50:16:
   | }
   | 
   | ///|
50 | pub fn IoHandle::fd(handle : IoHandle) -> @fd_util.Fd {
   |        ^^^^^^^^
   |   handle.fd
   | }

<WORKDIR>/src/internal/event_loop/io.mbt:50:30-50:38:
   | }
   | 
   | ///|
50 | pub fn IoHandle::fd(handle : IoHandle) -> @fd_util.Fd {
   |                              ^^^^^^^^
   |   handle.fd
   | }

<WORKDIR>/src/internal/event_loop/io.mbt:55:8-55:16:
   | }
   | 
   | ///|
55 | pub fn IoHandle::kind(handle : IoHandle) -> @fd_util.FileKind {
   |        ^^^^^^^^
   |   handle.kind
   | }

<WORKDIR>/src/internal/event_loop/io.mbt:55:32-55:40:
   | }
   | 
   | ///|
55 | pub fn IoHandle::kind(handle : IoHandle) -> @fd_util.FileKind {
   |                                ^^^^^^^^
   |   handle.kind
   | }

<WORKDIR>/src/internal/event_loop/io.mbt:63:8-63:16:
   | /// Detach a file descriptor from the event loop,
   | /// but does not close the file descriptor itself.
   | /// The underlying file descriptor is returned.
63 | pub fn IoHandle::detach_from_event_loop(handle : IoHandle) -> Unit {
   |        ^^^^^^^^
   |   guard! curr_loop.val is Some(evloop)
   |   guard @fd_util.fd_is_valid(handle.fd) else { return }

<WORKDIR>/src/internal/event_loop/io.mbt:63:50-63:58:
   | /// Detach a file descriptor from the event loop,
   | /// but does not close the file descriptor itself.
   | /// The underlying file descriptor is returned.
63 | pub fn IoHandle::detach_from_event_loop(handle : IoHandle) -> Unit {
   |                                                  ^^^^^^^^
   |   guard! curr_loop.val is Some(evloop)
   |   guard @fd_util.fd_is_valid(handle.fd) else { return }

<WORKDIR>/src/internal/event_loop/io.mbt:72:8-72:16:
   | ///|
   | /// Close a file descriptor and detach it from the event loop.
   | /// This function is idempotent: it is safe to call `.close()` multiple times.
72 | pub fn IoHandle::close(handle : IoHandle) -> Unit {
   |        ^^^^^^^^
   |   handle.detach_from_event_loop()
   |   if @fd_util.fd_is_valid(handle.fd) {

<WORKDIR>/src/internal/event_loop/io.mbt:72:33-72:41:
   | ///|
   | /// Close a file descriptor and detach it from the event loop.
   | /// This function is idempotent: it is safe to call `.close()` multiple times.
72 | pub fn IoHandle::close(handle : IoHandle) -> Unit {
   |                                 ^^^^^^^^
   |   handle.detach_from_event_loop()
   |   if @fd_util.fd_is_valid(handle.fd) {

<WORKDIR>/src/internal/event_loop/io.mbt:94:8-94:16:
   | /// - `read_only` indicates whether the handle has the concept of writing.
   | ///   By default, `IoHandle::from_fd` will register both read/write events for the file descriptor,
   | ///   If `read_only=true`, only read event will be registered.
94 | pub fn IoHandle::from_fd(
   |        ^^^^^^^^
   |   fd : @fd_util.Fd,
   |   kind~ : @fd_util.FileKind,

<WORKDIR>/src/internal/event_loop/io.mbt:99:6-99:14:
   |   kind~ : @fd_util.FileKind,
   |   is_async? : Bool = true,
   |   read_only? : Bool = false,
99 | ) -> IoHandle raise {
   |      ^^^^^^^^
   |   let context = "@event_loop.IoHandle::from_fd()"
   |   errdefer @fd_util.close(fd, kind~, context~)

<WORKDIR>/src/internal/event_loop/io.mbt:129:10-129:18:
    | ///|
    | /// Perform a read operation on the IO handle via the thread pool.
    | /// Used for handling objects that do not support native async reading.
129 | async fn IoHandle::read_via_worker(
    |          ^^^^^^^^
    |   handle : IoHandle,
    |   buf : FixedArray[Byte],

<WORKDIR>/src/internal/event_loop/io.mbt:130:12-130:20:
    | /// Perform a read operation on the IO handle via the thread pool.
    | /// Used for handling objects that do not support native async reading.
    | async fn IoHandle::read_via_worker(
130 |   handle : IoHandle,
    |            ^^^^^^^^
    |   buf : FixedArray[Byte],
    |   offset~ : Int,

<WORKDIR>/src/internal/event_loop/io.mbt:151:14-151:22:
    | }
    | 
    | ///|
151 | pub async fn IoHandle::read(
    |              ^^^^^^^^
    |   handle : IoHandle,
    |   buf : FixedArray[Byte],

<WORKDIR>/src/internal/event_loop/io.mbt:152:12-152:20:
    | 
    | ///|
    | pub async fn IoHandle::read(
152 |   handle : IoHandle,
    |            ^^^^^^^^
    |   buf : FixedArray[Byte],
    |   offset~ : Int,

<WORKDIR>/src/internal/event_loop/io.mbt:175:10-175:18:
    | ///|
    | /// Perform a write operation on the IO handle via the thread pool.
    | /// Used for handling objects that do not support native async writing.
175 | async fn IoHandle::write_via_worker(
    |          ^^^^^^^^
    |   handle : IoHandle,
    |   buf : Bytes,

<WORKDIR>/src/internal/event_loop/io.mbt:176:12-176:20:
    | /// Perform a write operation on the IO handle via the thread pool.
    | /// Used for handling objects that do not support native async writing.
    | async fn IoHandle::write_via_worker(
176 |   handle : IoHandle,
    |            ^^^^^^^^
    |   buf : Bytes,
    |   offset~ : Int,

<WORKDIR>/src/internal/event_loop/io.mbt:203:14-203:22:
    | }
    | 
    | ///|
203 | pub async fn IoHandle::write(
    |              ^^^^^^^^
    |   handle : IoHandle,
    |   buf : Bytes,

<WORKDIR>/src/internal/event_loop/io.mbt:204:12-204:20:
    | 
    | ///|
    | pub async fn IoHandle::write(
204 |   handle : IoHandle,
    |            ^^^^^^^^
    |   buf : Bytes,
    |   offset~ : Int,

<WORKDIR>/src/internal/event_loop/io.mbt:228:14-228:22:
    | /// Perform a random access read on the IO handle.
    | /// Since only regular files support random access IO,
    | /// `read_at` is always dispatched to the thread pool.
228 | pub async fn IoHandle::read_at(
    |              ^^^^^^^^
    |   handle : IoHandle,
    |   buf : FixedArray[Byte],

<WORKDIR>/src/internal/event_loop/io.mbt:229:12-229:20:
    | /// Since only regular files support random access IO,
    | /// `read_at` is always dispatched to the thread pool.
    | pub async fn IoHandle::read_at(
229 |   handle : IoHandle,
    |            ^^^^^^^^
    |   buf : FixedArray[Byte],
    |   offset~ : Int,

<WORKDIR>/src/internal/event_loop/io.mbt:247:14-247:22:
    | /// Perform a random access write on the IO handle.
    | /// Since only regular files support random access IO,
    | /// `write_at` is always dispatched to the thread pool.
247 | pub async fn IoHandle::write_at(
    |              ^^^^^^^^
    |   handle : IoHandle,
    |   buf : Bytes,

<WORKDIR>/src/internal/event_loop/io.mbt:248:12-248:20:
    | /// Since only regular files support random access IO,
    | /// `write_at` is always dispatched to the thread pool.
    | pub async fn IoHandle::write_at(
248 |   handle : IoHandle,
    |            ^^^^^^^^
    |   buf : Bytes,
    |   offset~ : Int,

<WORKDIR>/src/internal/event_loop/io_unix.mbt:17:14-17:22:
   | 
   | ///|
   | #cfg(not(platform="windows"))
17 | pub async fn IoHandle::wait_read(handle : IoHandle) -> Unit {
   |              ^^^^^^^^
   |   guard! curr_loop.val is Some(evloop)
   |   guard @fd_util.fd_is_valid(handle.fd) else {

<WORKDIR>/src/internal/event_loop/io_unix.mbt:17:43-17:51:
   | 
   | ///|
   | #cfg(not(platform="windows"))
17 | pub async fn IoHandle::wait_read(handle : IoHandle) -> Unit {
   |                                           ^^^^^^^^
   |   guard! curr_loop.val is Some(evloop)
   |   guard @fd_util.fd_is_valid(handle.fd) else {

<WORKDIR>/src/internal/event_loop/io_unix.mbt:32:10-32:18:
   | 
   | ///|
   | #cfg(not(platform="windows"))
32 | async fn IoHandle::wait_write(handle : IoHandle) -> Unit {
   |          ^^^^^^^^
   |   guard! curr_loop.val is Some(evloop)
   |   guard @fd_util.fd_is_valid(handle.fd) else {

<WORKDIR>/src/internal/event_loop/io_unix.mbt:32:40-32:48:
   | 
   | ///|
   | #cfg(not(platform="windows"))
32 | async fn IoHandle::wait_write(handle : IoHandle) -> Unit {
   |                                        ^^^^^^^^
   |   guard! curr_loop.val is Some(evloop)
   |   guard @fd_util.fd_is_valid(handle.fd) else {

<WORKDIR>/src/internal/event_loop/io_unix.mbt:69:10-69:18:
   | 
   | ///|
   | #cfg(not(platform="windows"))
69 | async fn IoHandle::read_via_event_bus_unix(
   |          ^^^^^^^^
   |   handle : IoHandle,
   |   buf : FixedArray[Byte],

<WORKDIR>/src/internal/event_loop/io_unix.mbt:70:12-70:20:
   | ///|
   | #cfg(not(platform="windows"))
   | async fn IoHandle::read_via_event_bus_unix(
70 |   handle : IoHandle,
   |            ^^^^^^^^
   |   buf : FixedArray[Byte],
   |   offset~ : Int,

<WORKDIR>/src/internal/event_loop/io_unix.mbt:97:10-97:18:
   | 
   | ///|
   | #cfg(all(target="native", not(platform="windows")))
97 | async fn IoHandle::read_via_event_bus(
   |          ^^^^^^^^
   |   handle : IoHandle,
   |   buf : FixedArray[Byte],

<WORKDIR>/src/internal/event_loop/io_unix.mbt:98:12-98:20:
   | ///|
   | #cfg(all(target="native", not(platform="windows")))
   | async fn IoHandle::read_via_event_bus(
98 |   handle : IoHandle,
   |            ^^^^^^^^
   |   buf : FixedArray[Byte],
   |   offset~ : Int,

<WORKDIR>/src/internal/event_loop/io_unix.mbt:130:10-130:18:
    | 
    | ///|
    | #cfg(not(platform="windows"))
130 | async fn IoHandle::write_via_event_bus_unix(
    |          ^^^^^^^^
    |   handle : IoHandle,
    |   buf : Bytes,

<WORKDIR>/src/internal/event_loop/io_unix.mbt:131:12-131:20:
    | ///|
    | #cfg(not(platform="windows"))
    | async fn IoHandle::write_via_event_bus_unix(
131 |   handle : IoHandle,
    |            ^^^^^^^^
    |   buf : Bytes,
    |   offset~ : Int,

<WORKDIR>/src/internal/event_loop/io_unix.mbt:158:10-158:18:
    | 
    | ///|
    | #cfg(all(target="native", not(platform="windows")))
158 | async fn IoHandle::write_via_event_bus(
    |          ^^^^^^^^
    |   handle : IoHandle,
    |   buf : Bytes,

<WORKDIR>/src/internal/event_loop/io_unix.mbt:159:12-159:20:
    | ///|
    | #cfg(all(target="native", not(platform="windows")))
    | async fn IoHandle::write_via_event_bus(
159 |   handle : IoHandle,
    |            ^^^^^^^^
    |   buf : Bytes,
    |   offset~ : Int,

<WORKDIR>/src/internal/event_loop/network.mbt:74:14-74:22:
   | }
   | 
   | ///|
74 | pub async fn IoHandle::bind(
   |              ^^^^^^^^
   |   handle : IoHandle,
   |   addr : Bytes,

<WORKDIR>/src/internal/event_loop/network.mbt:75:12-75:20:
   | 
   | ///|
   | pub async fn IoHandle::bind(
75 |   handle : IoHandle,
   |            ^^^^^^^^
   |   addr : Bytes,
   |   context~ : String,

<WORKDIR>/src/internal/event_loop/network_unix.mbt:51:10-51:18:
   | 
   | ///|
   | #cfg(not(platform="windows"))
51 | async fn IoHandle::recvfrom_unix(
   |          ^^^^^^^^
   |   handle : IoHandle,
   |   buf : FixedArray[Byte],

<WORKDIR>/src/internal/event_loop/network_unix.mbt:52:12-52:20:
   | ///|
   | #cfg(not(platform="windows"))
   | async fn IoHandle::recvfrom_unix(
52 |   handle : IoHandle,
   |            ^^^^^^^^
   |   buf : FixedArray[Byte],
   |   offset~ : Int,

<WORKDIR>/src/internal/event_loop/network_unix.mbt:80:14-80:22:
   | 
   | ///|
   | #cfg(all(target="native", not(platform="windows")))
80 | pub async fn IoHandle::recvfrom(
   |              ^^^^^^^^
   |   handle : IoHandle,
   |   buf : FixedArray[Byte],

<WORKDIR>/src/internal/event_loop/network_unix.mbt:81:12-81:20:
   | ///|
   | #cfg(all(target="native", not(platform="windows")))
   | pub async fn IoHandle::recvfrom(
81 |   handle : IoHandle,
   |            ^^^^^^^^
   |   buf : FixedArray[Byte],
   |   offset~ : Int,

<WORKDIR>/src/internal/event_loop/network_unix.mbt:118:10-118:18:
    | 
    | ///|
    | #cfg(not(platform="windows"))
118 | async fn IoHandle::sendto_unix(
    |          ^^^^^^^^
    |   handle : IoHandle,
    |   buf : Bytes,

<WORKDIR>/src/internal/event_loop/network_unix.mbt:119:12-119:20:
    | ///|
    | #cfg(not(platform="windows"))
    | async fn IoHandle::sendto_unix(
119 |   handle : IoHandle,
    |            ^^^^^^^^
    |   buf : Bytes,
    |   offset~ : Int,

<WORKDIR>/src/internal/event_loop/network_unix.mbt:145:14-145:22:
    | 
    | ///|
    | #cfg(all(target="native", not(platform="windows")))
145 | pub async fn IoHandle::sendto(
    |              ^^^^^^^^
    |   handle : IoHandle,
    |   buf : Bytes,

<WORKDIR>/src/internal/event_loop/network_unix.mbt:146:12-146:20:
    | ///|
    | #cfg(all(target="native", not(platform="windows")))
    | pub async fn IoHandle::sendto(
146 |   handle : IoHandle,
    |            ^^^^^^^^
    |   buf : Bytes,
    |   offset~ : Int,

<WORKDIR>/src/internal/event_loop/network_unix.mbt:183:10-183:18:
    | 
    | ///|
    | #cfg(not(platform="windows"))
183 | async fn IoHandle::connect_unix(
    |          ^^^^^^^^
    |   handle : IoHandle,
    |   addr : Bytes,

<WORKDIR>/src/internal/event_loop/network_unix.mbt:184:12-184:20:
    | ///|
    | #cfg(not(platform="windows"))
    | async fn IoHandle::connect_unix(
184 |   handle : IoHandle,
    |            ^^^^^^^^
    |   addr : Bytes,
    |   context~ : String,

<WORKDIR>/src/internal/event_loop/network_unix.mbt:206:14-206:22:
    | 
    | ///|
    | #cfg(all(target="native", not(platform="windows")))
206 | pub async fn IoHandle::connect(
    |              ^^^^^^^^
    |   handle : IoHandle,
    |   addr : Bytes,

<WORKDIR>/src/internal/event_loop/network_unix.mbt:207:12-207:20:
    | ///|
    | #cfg(all(target="native", not(platform="windows")))
    | pub async fn IoHandle::connect(
207 |   handle : IoHandle,
    |            ^^^^^^^^
    |   addr : Bytes,
    |   context~ : String,

<WORKDIR>/src/internal/event_loop/network_unix.mbt:235:14-235:22:
    | 
    | ///|
    | #cfg(not(platform="windows"))
235 | pub async fn IoHandle::accept_unix(
    |              ^^^^^^^^
    |   handle : IoHandle,
    |   addr : Bytes,

<WORKDIR>/src/internal/event_loop/network_unix.mbt:236:12-236:20:
    | ///|
    | #cfg(not(platform="windows"))
    | pub async fn IoHandle::accept_unix(
236 |   handle : IoHandle,
    |            ^^^^^^^^
    |   addr : Bytes,
    |   context~ : String,

<WORKDIR>/src/internal/event_loop/network_unix.mbt:239:6-239:14:
    |   handle : IoHandle,
    |   addr : Bytes,
    |   context~ : String,
239 | ) -> IoHandle {
    |      ^^^^^^^^
    |   @coroutine.check_cancellation()
    |   let conn = accept_unix_ffi(handle.fd, addr)

<WORKDIR>/src/internal/event_loop/network_unix.mbt:256:3-256:11:
    |   if !@fd_util.fd_is_valid(conn) {
    |     @os_error.check_errno(context)
    |   }
256 |   IoHandle::from_fd(conn, kind=Socket)
    |   ^^^^^^^^
    | }

<WORKDIR>/src/internal/event_loop/process.mbt:19:17-19:25:
   | #valtype
   | pub struct Process {
   |   pid : Int
19 |   priv handle : IoHandle?
   |                 ^^^^^^^^
   | }
   | 

<WORKDIR>/src/internal/event_loop/process.mbt:45:5-45:13:
   |     @os_error.check_errno(context)
   |     None
   |   } else {
45 |     IoHandle::from_fd(
   |     ^^^^^^^^
   |       handle,
   |       kind=Unknown,

<WORKDIR>/src/internal/event_loop/process_unix.mbt:44:10-44:18:
   |   let handle = if !@fd_util.fd_is_valid(pidfd) {
   |     None
   |   } else {
44 |     Some(IoHandle::from_fd(pidfd, kind=Unknown, read_only=true))
   |          ^^^^^^^^
   |   }
   |   { pid, handle, }

<WORKDIR>/src/internal/event_loop/stdio.mbt:70:38-70:46:
   | fn get_stdio_handle(id : Int) -> @fd_util.Fd = "moonbitlang/async" "stdio/get_stdio_handle"
   | 
   | ///|
70 | let stdio_handles : Map[@fd_util.Fd, IoHandle] = Map([])
   |                                      ^^^^^^^^
   | 
   | ///|

<WORKDIR>/src/internal/event_loop/stdio.mbt:73:48-73:56:
   | let stdio_handles : Map[@fd_util.Fd, IoHandle] = Map([])
   | 
   | ///|
73 | fn setup_stdio(id : Int, context~ : String) -> IoHandle raise {
   |                                                ^^^^^^^^
   |   let fd = get_stdio_handle(id)
   |   if !@fd_util.fd_is_valid(fd) {

<WORKDIR>/src/internal/event_loop/stdio.mbt:119:24-119:32:
    | }
    | 
    | ///|
119 | pub let stdin : Result[IoHandle, Error] = try
    |                        ^^^^^^^^
    |   setup_stdio(0, context="initialize `stdin`")
    | catch {

<WORKDIR>/src/internal/event_loop/stdio.mbt:128:25-128:33:
    | }
    | 
    | ///|
128 | pub let stdout : Result[IoHandle, Error] = try
    |                         ^^^^^^^^
    |   setup_stdio(1, context="initialize `stdout`")
    | catch {

<WORKDIR>/src/internal/event_loop/stdio.mbt:137:25-137:33:
    | }
    | 
    | ///|
137 | pub let stderr : Result[IoHandle, Error] = try
    |                         ^^^^^^^^
    |   setup_stdio(2, context="initialize `stderr`")
    | catch {

<WORKDIR>/src/pipe/pipe.mbt:18:20-18:28:
   | ///|
   | /// The read end of a pipe
   | struct PipeRead {
18 |   io : @event_loop.IoHandle
   |                    ^^^^^^^^
   |   read_buf : @io.ReaderBuffer
   | }

<WORKDIR>/src/pipe/pipe.mbt:29:30-29:38:
   | 
   | ///|
   | /// The write end of a pipe
29 | struct PipeWrite(@event_loop.IoHandle)
   |                              ^^^^^^^^
   | 
   | ///|

<WORKDIR>/src/pipe/pipe.mbt:48:21-48:29:
   |     context~,
   |   )
   |   let r = {
48 |     io: @event_loop.IoHandle::from_fd(r, kind=Pipe),
   |                     ^^^^^^^^
   |     read_buf: @io.ReaderBuffer::new(),
   |   }

<WORKDIR>/src/pipe/pipe.mbt:51:29-51:37:
   |     io: @event_loop.IoHandle::from_fd(r, kind=Pipe),
   |     read_buf: @io.ReaderBuffer::new(),
   |   }
51 |   (r, PipeWrite(@event_loop.IoHandle::from_fd(w, kind=Pipe)))
   |                             ^^^^^^^^
   | }
   | 

<WORKDIR>/src/process/redirect.mbt:18:20-18:28:
   | ///|
   | /// A temporary pipe used to read output from a spawned process
   | struct ReadFromProcess {
18 |   io : @event_loop.IoHandle
   |                    ^^^^^^^^
   |   read_buf : @io.ReaderBuffer
   | }

<WORKDIR>/src/process/redirect.mbt:24:35-24:43:
   | 
   | ///|
   | /// A temporary pipe used to write data to a spawned process
24 | struct WriteToProcess(@event_loop.IoHandle)
   |                                   ^^^^^^^^
   | 
   | ///|

<WORKDIR>/src/process/redirect.mbt:57:23-57:31:
   |     write_end_is_async=false,
   |     context~,
   |   )
57 |   let r = @event_loop.IoHandle::from_fd(r, kind=Pipe)
   |                       ^^^^^^^^
   |   let w = @event_loop.IoHandle::from_fd(w, kind=Pipe, is_async=false)
   |   (

<WORKDIR>/src/process/redirect.mbt:58:23-58:31:
   |     context~,
   |   )
   |   let r = @event_loop.IoHandle::from_fd(r, kind=Pipe)
58 |   let w = @event_loop.IoHandle::from_fd(w, kind=Pipe, is_async=false)
   |                       ^^^^^^^^
   |   (
   |     { io: r, read_buf: @io.ReaderBuffer::new(), },

<WORKDIR>/src/process/redirect.mbt:77:23-77:31:
   |     write_end_is_async=true,
   |     context~,
   |   )
77 |   let r = @event_loop.IoHandle::from_fd(r, kind=Pipe, is_async=false)
   |                       ^^^^^^^^
   |   let w = @event_loop.IoHandle::from_fd(w, kind=Pipe)
   |   (TempPipeRead::{ pipe: r, closed: false, }, w)

<WORKDIR>/src/process/redirect.mbt:78:23-78:31:
   |     context~,
   |   )
   |   let r = @event_loop.IoHandle::from_fd(r, kind=Pipe, is_async=false)
78 |   let w = @event_loop.IoHandle::from_fd(w, kind=Pipe)
   |                       ^^^^^^^^
   |   (TempPipeRead::{ pipe: r, closed: false, }, w)
   | }

<WORKDIR>/src/process/redirect.mbt:92:23-92:31:
   |     write_end_is_async=false,
   |     context~,
   |   )
92 |   let r = @event_loop.IoHandle::from_fd(r, kind=Pipe, is_async=false)
   |                       ^^^^^^^^
   |   let w = @event_loop.IoHandle::from_fd(w, kind=Pipe, is_async=false)
   |   (

<WORKDIR>/src/process/redirect.mbt:93:23-93:31:
   |     context~,
   |   )
   |   let r = @event_loop.IoHandle::from_fd(r, kind=Pipe, is_async=false)
93 |   let w = @event_loop.IoHandle::from_fd(w, kind=Pipe, is_async=false)
   |                       ^^^^^^^^
   |   (
   |     TempPipeRead::{ pipe: r, closed: false, },

<WORKDIR>/src/process/redirect.mbt:303:22-303:30:
    | 
    | ///|
    | priv struct TempPipeRead {
303 |   pipe : @event_loop.IoHandle
    |                      ^^^^^^^^
    |   mut closed : Bool
    | }

<WORKDIR>/src/process/redirect.mbt:309:22-309:30:
    | 
    | ///|
    | priv struct TempPipeWrite {
309 |   pipe : @event_loop.IoHandle
    |                      ^^^^^^^^
    |   shared : Bool
    |   mut closed : Bool

<WORKDIR>/src/process/redirect.mbt:354:20-354:28:
    | 
    | ///|
    | priv struct RedirectToFile {
354 |   io : @event_loop.IoHandle
    |                    ^^^^^^^^
    |   shared : Bool
    |   mut closed : Bool

<WORKDIR>/src/raw_fd/raw_fd.mbt:22:25-22:33:
   | /// that are not natively supported by `moonbitlang/async`.
   | pub struct RawFd {
   |   fd : @fd_util.Fd
22 |   priv io : @event_loop.IoHandle
   |                         ^^^^^^^^
   | }
   | 

<WORKDIR>/src/raw_fd/raw_fd.mbt:36:25-36:33:
   |   let context = "@raw_fd.RawFd::new()"
   |   let kind = @event_loop.kind_of_fd(fd, context~)
   |   let is_async = @fd_util.fd_is_nonblocking(fd, context~)
36 |   { fd, io: @event_loop.IoHandle::from_fd(fd, kind~, is_async~), }
   |                         ^^^^^^^^
   | }
   | 

<WORKDIR>/src/raw_fd/raw_fd.mbt:98:25-98:33:
   | /// that are not natively supported by `moonbitlang/async`.
   | pub struct RawFdStream {
   |   fd : @fd_util.Fd
98 |   priv io : @event_loop.IoHandle
   |                         ^^^^^^^^
   |   priv read_buf : @io.ReaderBuffer
   | }

<WORKDIR>/src/raw_fd/raw_fd.mbt:113:25-113:33:
    |   let kind = @event_loop.kind_of_fd(fd, context~)
    |   let is_async = @fd_util.fd_is_nonblocking(fd, context~)
    |   let read_buf = @io.ReaderBuffer::new()
113 |   { fd, io: @event_loop.IoHandle::from_fd(fd, kind~, is_async~), read_buf, }
    |                         ^^^^^^^^
    | }
    | 

<WORKDIR>/src/socket/tcp.mbt:20:25-20:33:
   | pub struct Tcp {
   |   /// The local address of a TCP connection
   |   addr : Addr
20 |   priv io : @event_loop.IoHandle
   |                         ^^^^^^^^
   |   priv read_buf : @io.ReaderBuffer
   | }

<WORKDIR>/src/socket/tcp.mbt:38:25-38:33:
   | pub struct TcpServer {
   |   /// The actual listen address of the server
   |   addr : Addr
38 |   priv io : @event_loop.IoHandle
   |                         ^^^^^^^^
   | }
   | 

<WORKDIR>/src/socket/tcp.mbt:94:24-94:32:
   |   let context = "@socket.TcpServer::new()"
   |   let family = addr.family()
   |   let sock = make_tcp_socket(family, context~)
94 |   let io = @event_loop.IoHandle::from_fd(sock, kind=Socket, read_only=true)
   |                        ^^^^^^^^
   |   errdefer io.close()
   |   if addr.is_ipv6() && addr.is_ipv6_wildcard() {

<WORKDIR>/src/socket/tcp.mbt:280:26-280:34:
    |   let context = "@socket.Tcp::connect()"
    |   let family = addr.family()
    |   let sock = make_tcp_socket(family, context~)
280 |   let conn = @event_loop.IoHandle::from_fd(sock, kind=Socket)
    |                          ^^^^^^^^
    |   errdefer conn.close()
    |   if disable_nagle(sock) < 0 {

<WORKDIR>/src/socket/udp.mbt:28:25-28:33:
   | pub struct UdpClient {
   |   /// Local address of the client
   |   addr : Addr
28 |   priv io : @event_loop.IoHandle
   |                         ^^^^^^^^
   |   priv mut dst_addr : Addr?
   | }

<WORKDIR>/src/socket/udp.mbt:48:24-48:32:
   |   let context = "@socket.UdpClient::new()"
   |   let family = addr.family()
   |   let sock = make_udp_socket(family, multicast=false, context~)
48 |   let io = @event_loop.IoHandle::from_fd(sock, kind=Socket, read_only=true)
   |                        ^^^^^^^^
   |   errdefer io.close()
   |   let dst_addr = if addr.is_multicast() {

<WORKDIR>/src/socket/udp.mbt:177:25-177:33:
    | /// The essence of `UdpServer` is a UDP socket with a fixed/well-known port.
    | pub struct UdpServer {
    |   addr : Addr
177 |   priv io : @event_loop.IoHandle
    |                         ^^^^^^^^
    |   priv is_multicast_only : Bool
    | }

<WORKDIR>/src/socket/udp.mbt:219:24-219:32:
    |   let context = "@socket.UdpServer::new()"
    |   let family = addr.family()
    |   let sock = make_udp_socket(family, multicast=false, context~)
219 |   let io = @event_loop.IoHandle::from_fd(sock, kind=Socket)
    |                        ^^^^^^^^
    |   errdefer io.close()
    |   if addr.is_ipv6() && addr.is_ipv6_wildcard() {

<WORKDIR>/src/socket/udp.mbt:264:24-264:32:
    |     abort("@socket.UdpServer::multicast() is IPv4 only")
    |   }
    |   let sock = make_udp_socket(family, multicast=true, context~)
264 |   let io = @event_loop.IoHandle::from_fd(sock, kind=Socket)
    |                        ^^^^^^^^
    |   errdefer io.close()
    |   if @event_loop.platform is Windows {

<WORKDIR>/src/stdio/stdio.mbt:17:27-17:35:
   | 
   | ///|
   | struct Input {
17 |   io : Result[@event_loop.IoHandle, Error]
   |                           ^^^^^^^^
   |   read_buf : @io.ReaderBuffer
   | }

<WORKDIR>/src/stdio/stdio.mbt:45:34-45:42:
   | }
   | 
   | ///|
45 | struct Output(Result[@event_loop.IoHandle, Error])
   |                                  ^^^^^^^^
   | 
   | ///|

```
