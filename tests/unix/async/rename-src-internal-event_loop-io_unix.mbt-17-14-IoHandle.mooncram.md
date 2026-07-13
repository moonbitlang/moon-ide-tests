# async rename IoHandle src/internal/event_loop/io_unix.mbt:17:14

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
$ run_moon_ide moon ide rename 'IoHandle' 'IoHandleRenamed' --loc 'src/internal/event_loop/io_unix.mbt:17:14'
*** Begin Patch
*** Update File: <WORKDIR>/src/fs/dir.mbt
@@
 ///|
 /// A directory in file system
 struct Directory {
-  io : @event_loop.IoHandle
+  io : @event_loop.IoHandleRenamed
   buf : DirectoryBuffer
   buf_len : Int
   // The offset of the next entry in the buffer
@@
 }
 
 ///|
-fn Directory::from_io_handle(io : @event_loop.IoHandle) -> Directory {
+fn Directory::from_io_handle(io : @event_loop.IoHandleRenamed) -> Directory {
   let buf_len = @cmp.maximum(1024, Directory::min_buffer_size())
   {
     io,
*** Update File: <WORKDIR>/src/fs/file.mbt
@@
 
 ///|
 struct File {
-  io : @event_loop.IoHandle
+  io : @event_loop.IoHandleRenamed
   read_buf : @io.ReaderBuffer
 }
 
*** Update File: <WORKDIR>/src/fs/watch.mbt
@@
 #cfg(not(platform="windows"))
 fn Watcher::new_backend(
   self : Watcher,
-  root : @event_loop.IoHandle,
+  root : @event_loop.IoHandleRenamed,
   root_id~ : FileIdentity,
   debounce_timeout~ : Int,
   max_debounce_delay~ : Int,
*** Update File: <WORKDIR>/src/fs/watch_inotify.mbt
@@
 ///|
 #cfg(not(platform="windows"))
 priv struct InotifyWatcher {
-  inotify : @event_loop.IoHandle
+  inotify : @event_loop.IoHandleRenamed
   watched : Map[@fd_util.Fd, FileIdentity]
   watcher : Watcher
   mut event_processor : @coroutine.Coroutine?
@@
     @os_error.check_errno(context)
   }
   let self = {
-    inotify: @event_loop.IoHandle::from_fd(
+    inotify: @event_loop.IoHandleRenamed::from_fd(
       inotify_fd,
       kind=Unknown,
       is_async=true,
*** Update File: <WORKDIR>/src/fs/watch_kqueue.mbt
@@
 #cfg(not(platform="windows"))
 priv struct KqueueWatchedFile {
   file_id : FileIdentity
-  io : @event_loop.IoHandle
+  io : @event_loop.IoHandleRenamed
 }
 
 ///|
 #cfg(not(platform="windows"))
 priv struct KqueueWatcher {
-  kqueue : @event_loop.IoHandle
+  kqueue : @event_loop.IoHandleRenamed
   watched : Map[@fd_util.Fd, KqueueWatchedFile]
   watcher : Watcher
   event_buffer : KqueueEventBuffer
@@
   }
   let event_buffer_len = KqueueEventBuffer::size()
   {
-    kqueue: @event_loop.IoHandle::from_fd(
+    kqueue: @event_loop.IoHandleRenamed::from_fd(
       kqueue,
       kind=Unknown,
       is_async=true,
*** Update File: <WORKDIR>/src/internal/event_loop/event_loop.mbt
@@
 ///|
 priv struct EventLoop {
   bus : EventBus
-  fds : Map[@fd_util.Fd, IoHandle]
+  fds : Map[@fd_util.Fd, IoHandleRenamed]
   extra : PlatformEventLoopExtra
   /// a special file descriptor used to indicate job completion message from thread pool
   notify_recv : @fd_util.Fd
*** Update File: <WORKDIR>/src/internal/event_loop/fs.mbt
@@
   // permission for file when new file is created
   mode~ : Int,
   context~ : String,
-) -> (IoHandle, FileIdentity) {
+) -> (IoHandleRenamed, FileIdentity) {
   let path_bytes = @os_string.encode(path)
   let job = Job::open(path_bytes, access, create~, append~, sync~, mode~)
   defer job.0.free()
@@
     _ => {
       let fd = job.fd()
       let kind = job.kind()
-      let io = IoHandle::from_fd(
+      let io = IoHandleRenamed::from_fd(
         fd,
         kind~,
         is_async=access is 3 || (!(platform is Windows) && kind.can_poll()),
@@
 }
 
 ///|
-pub async fn IoHandle::fsync(
+pub async fn IoHandleRenamed::fsync(
-  handle : IoHandle,
+  handle : IoHandleRenamed,
   only_data~ : Bool,
   context~ : String,
 ) -> Unit {
@@
 }
 
 ///|
-pub async fn IoHandle::lock(
+pub async fn IoHandleRenamed::lock(
-  handle : IoHandle,
+  handle : IoHandleRenamed,
   exclusive~ : Bool,
   context~ : String,
 ) -> Unit {
@@
 }
 
 ///|
-pub async fn IoHandle::readdir(
+pub async fn IoHandleRenamed::readdir(
-  dir : IoHandle,
+  dir : IoHandleRenamed,
   buf : @c_buffer.Buffer,
   len : Int,
   restart~ : Bool,
*** Update File: <WORKDIR>/src/internal/event_loop/io.mbt
@@
 ///|
 /// A managed file descriptor/`HANDLE`,
 /// capable of performing async IO operations.
-struct IoHandle {
+struct IoHandleRenamed {
   mut fd : @fd_util.Fd
   kind : @fd_util.FileKind
   /// - `is_async=true`: support native async operations through the event bus.
@@
 }
 
 ///|
-pub fn IoHandle::fd(handle : IoHandle) -> @fd_util.Fd {
+pub fn IoHandleRenamed::fd(handle : IoHandleRenamed) -> @fd_util.Fd {
   handle.fd
 }
 
 ///|
-pub fn IoHandle::kind(handle : IoHandle) -> @fd_util.FileKind {
+pub fn IoHandleRenamed::kind(handle : IoHandleRenamed) -> @fd_util.FileKind {
   handle.kind
 }
 
@@
 /// Detach a file descriptor from the event loop,
 /// but does not close the file descriptor itself.
 /// The underlying file descriptor is returned.
-pub fn IoHandle::detach_from_event_loop(handle : IoHandle) -> Unit {
+pub fn IoHandleRenamed::detach_from_event_loop(handle : IoHandleRenamed) -> Unit {
   guard curr_loop.val is Some(evloop)
   guard @fd_util.fd_is_valid(handle.fd) else { return }
   evloop.fds.remove(handle.fd)
@@
 ///|
 /// Close a file descriptor and detach it from the event loop.
 /// This function is idempotent: it is safe to call `.close()` multiple times.
-pub fn IoHandle::close(handle : IoHandle) -> Unit {
+pub fn IoHandleRenamed::close(handle : IoHandleRenamed) -> Unit {
   handle.detach_from_event_loop()
   if @fd_util.fd_is_valid(handle.fd) {
     @fd_util.close(handle.fd, kind=handle.kind, context="") catch {
@@
 /// - `read_only` indicates whether the handle has the concept of writing.
 ///   By default, `IoHandle::from_fd` will register both read/write events for the file descriptor,
 ///   If `read_only=true`, only read event will be registered.
-pub fn IoHandle::from_fd(
+pub fn IoHandleRenamed::from_fd(
   fd : @fd_util.Fd,
   kind~ : @fd_util.FileKind,
   is_async? : Bool = true,
   read_only? : Bool = false,
-) -> IoHandle raise {
+) -> IoHandleRenamed raise {
   let context = "@event_loop.IoHandle::from_fd()"
   guard curr_loop.val is Some(evloop)
   guard evloop.fds.get(fd) is None
@@
 ///|
 /// Perform a read operation on the IO handle via the thread pool.
 /// Used for handling objects that do not support native async reading.
-async fn IoHandle::read_via_worker(
+async fn IoHandleRenamed::read_via_worker(
-  handle : IoHandle,
+  handle : IoHandleRenamed,
   buf : FixedArray[Byte],
   offset~ : Int,
   len~ : Int,
@@
 }
 
 ///|
-pub async fn IoHandle::read(
+pub async fn IoHandleRenamed::read(
-  handle : IoHandle,
+  handle : IoHandleRenamed,
   buf : FixedArray[Byte],
   offset~ : Int,
   len~ : Int,
@@
 ///|
 /// Perform a write operation on the IO handle via the thread pool.
 /// Used for handling objects that do not support native async writing.
-async fn IoHandle::write_via_worker(
+async fn IoHandleRenamed::write_via_worker(
-  handle : IoHandle,
+  handle : IoHandleRenamed,
   buf : Bytes,
   offset~ : Int,
   len~ : Int,
@@
 }
 
 ///|
-pub async fn IoHandle::write(
+pub async fn IoHandleRenamed::write(
-  handle : IoHandle,
+  handle : IoHandleRenamed,
   buf : Bytes,
   offset~ : Int,
   len~ : Int,
@@
 /// Perform a random access read on the IO handle.
 /// Since only regular files support random access IO,
 /// `read_at` is always dispatched to the thread pool.
-pub async fn IoHandle::read_at(
+pub async fn IoHandleRenamed::read_at(
-  handle : IoHandle,
+  handle : IoHandleRenamed,
   buf : FixedArray[Byte],
   offset~ : Int,
   len~ : Int,
@@
 /// Perform a random access write on the IO handle.
 /// Since only regular files support random access IO,
 /// `write_at` is always dispatched to the thread pool.
-pub async fn IoHandle::write_at(
+pub async fn IoHandleRenamed::write_at(
-  handle : IoHandle,
+  handle : IoHandleRenamed,
   buf : Bytes,
   offset~ : Int,
   len~ : Int,
*** Update File: <WORKDIR>/src/internal/event_loop/io_unix.mbt
@@
 
 ///|
 #cfg(not(platform="windows"))
-pub async fn IoHandle::wait_read(handle : IoHandle) -> Unit {
+pub async fn IoHandleRenamed::wait_read(handle : IoHandleRenamed) -> Unit {
   guard @fd_util.fd_is_valid(handle.fd) else {
     abort("file descriptor already closed")
   }
@@
 
 ///|
 #cfg(not(platform="windows"))
-async fn IoHandle::wait_write(handle : IoHandle) -> Unit {
+async fn IoHandleRenamed::wait_write(handle : IoHandleRenamed) -> Unit {
   guard @fd_util.fd_is_valid(handle.fd) else {
     abort("file descriptor already closed")
   }
@@
 
 ///|
 #cfg(not(platform="windows"))
-async fn IoHandle::read_via_event_bus_unix(
+async fn IoHandleRenamed::read_via_event_bus_unix(
-  handle : IoHandle,
+  handle : IoHandleRenamed,
   buf : FixedArray[Byte],
   offset~ : Int,
   len~ : Int,
@@
 
 ///|
 #cfg(all(target="native", not(platform="windows")))
-async fn IoHandle::read_via_event_bus(
+async fn IoHandleRenamed::read_via_event_bus(
-  handle : IoHandle,
+  handle : IoHandleRenamed,
   buf : FixedArray[Byte],
   offset~ : Int,
   len~ : Int,
@@
 
 ///|
 #cfg(not(platform="windows"))
-async fn IoHandle::write_via_event_bus_unix(
+async fn IoHandleRenamed::write_via_event_bus_unix(
-  handle : IoHandle,
+  handle : IoHandleRenamed,
   buf : Bytes,
   offset~ : Int,
   len~ : Int,
@@
 
 ///|
 #cfg(all(target="native", not(platform="windows")))
-async fn IoHandle::write_via_event_bus(
+async fn IoHandleRenamed::write_via_event_bus(
-  handle : IoHandle,
+  handle : IoHandleRenamed,
   buf : Bytes,
   offset~ : Int,
   len~ : Int,
*** Update File: <WORKDIR>/src/internal/event_loop/network.mbt
@@
 }
 
 ///|
-pub async fn IoHandle::bind(
+pub async fn IoHandleRenamed::bind(
-  handle : IoHandle,
+  handle : IoHandleRenamed,
   addr : Bytes,
   context~ : String,
 ) -> Unit {
*** Update File: <WORKDIR>/src/internal/event_loop/network_unix.mbt
@@
 
 ///|
 #cfg(not(platform="windows"))
-async fn IoHandle::recvfrom_unix(
+async fn IoHandleRenamed::recvfrom_unix(
-  handle : IoHandle,
+  handle : IoHandleRenamed,
   buf : FixedArray[Byte],
   offset~ : Int,
   len~ : Int,
@@
 
 ///|
 #cfg(all(target="native", not(platform="windows")))
-pub async fn IoHandle::recvfrom(
+pub async fn IoHandleRenamed::recvfrom(
-  handle : IoHandle,
+  handle : IoHandleRenamed,
   buf : FixedArray[Byte],
   offset~ : Int,
   len~ : Int,
@@
 
 ///|
 #cfg(not(platform="windows"))
-async fn IoHandle::sendto_unix(
+async fn IoHandleRenamed::sendto_unix(
-  handle : IoHandle,
+  handle : IoHandleRenamed,
   buf : Bytes,
   offset~ : Int,
   len~ : Int,
@@
 
 ///|
 #cfg(all(target="native", not(platform="windows")))
-pub async fn IoHandle::sendto(
+pub async fn IoHandleRenamed::sendto(
-  handle : IoHandle,
+  handle : IoHandleRenamed,
   buf : Bytes,
   offset~ : Int,
   len~ : Int,
@@
 
 ///|
 #cfg(not(platform="windows"))
-async fn IoHandle::connect_unix(
+async fn IoHandleRenamed::connect_unix(
-  handle : IoHandle,
+  handle : IoHandleRenamed,
   addr : Bytes,
   context~ : String,
 ) -> Unit {
@@
 
 ///|
 #cfg(all(target="native", not(platform="windows")))
-pub async fn IoHandle::connect(
+pub async fn IoHandleRenamed::connect(
-  handle : IoHandle,
+  handle : IoHandleRenamed,
   addr : Bytes,
   context~ : String,
 ) -> Unit {
@@
 
 ///|
 #cfg(not(platform="windows"))
-pub async fn IoHandle::accept_unix(
+pub async fn IoHandleRenamed::accept_unix(
-  handle : IoHandle,
+  handle : IoHandleRenamed,
   addr : Bytes,
   context~ : String,
-) -> IoHandle {
+) -> IoHandleRenamed {
   @coroutine.check_cancellation()
   let conn = accept_unix_ffi(handle.fd, addr)
   let conn = if @fd_util.fd_is_valid(conn) {
@@
   if !@fd_util.fd_is_valid(conn) {
     @os_error.check_errno(context)
   }
-  IoHandle::from_fd(conn, kind=Socket)
+  IoHandleRenamed::from_fd(conn, kind=Socket)
 }
*** Update File: <WORKDIR>/src/internal/event_loop/process.mbt
@@
 #valtype
 pub struct Process {
   pid : Int
-  priv handle : IoHandle?
+  priv handle : IoHandleRenamed?
 }
 
 ///|
@@
     @os_error.check_errno(context)
     None
   } else {
-    IoHandle::from_fd(
+    IoHandleRenamed::from_fd(
       handle,
       kind=Unknown,
       is_async=platform is Linux,
*** Update File: <WORKDIR>/src/internal/event_loop/process_unix.mbt
@@
   let handle = if !@fd_util.fd_is_valid(pidfd) {
     None
   } else {
-    Some(IoHandle::from_fd(pidfd, kind=Unknown, read_only=true))
+    Some(IoHandleRenamed::from_fd(pidfd, kind=Unknown, read_only=true))
   }
   { pid, handle }
 }
*** Update File: <WORKDIR>/src/internal/event_loop/stdio.mbt
@@
 fn get_stdio_handle(id : Int) -> @fd_util.Fd = "moonbitlang/async" "stdio/get_stdio_handle"
 
 ///|
-let stdio_handles : Map[@fd_util.Fd, IoHandle] = {}
+let stdio_handles : Map[@fd_util.Fd, IoHandleRenamed] = {}
 
 ///|
-fn setup_stdio(id : Int, context~ : String) -> IoHandle raise {
+fn setup_stdio(id : Int, context~ : String) -> IoHandleRenamed raise {
   let fd = get_stdio_handle(id)
   if !@fd_util.fd_is_valid(fd) {
     @os_error.check_errno(context)
@@
 }
 
 ///|
-pub let stdin : Result[IoHandle, Error] = try
+pub let stdin : Result[IoHandleRenamed, Error] = try
   setup_stdio(0, context="initialize `stdin`")
 catch {
   err => Err(err)
@@
 }
 
 ///|
-pub let stdout : Result[IoHandle, Error] = try
+pub let stdout : Result[IoHandleRenamed, Error] = try
   setup_stdio(1, context="initialize `stdout`")
 catch {
   err => Err(err)
@@
 }
 
 ///|
-pub let stderr : Result[IoHandle, Error] = try
+pub let stderr : Result[IoHandleRenamed, Error] = try
   setup_stdio(2, context="initialize `stderr`")
 catch {
   err => Err(err)
*** Update File: <WORKDIR>/src/pipe/pipe.mbt
@@
 ///|
 /// The read end of a pipe
 struct PipeRead {
-  io : @event_loop.IoHandle
+  io : @event_loop.IoHandleRenamed
   read_buf : @io.ReaderBuffer
 }
 
@@
 
 ///|
 /// The write end of a pipe
-struct PipeWrite(@event_loop.IoHandle)
+struct PipeWrite(@event_loop.IoHandleRenamed)
 
 ///|
 pub fn PipeWrite::fd(self : PipeWrite) -> @fd_util.Fd {
@@
     context~,
   )
   let r = {
-    io: @event_loop.IoHandle::from_fd(r, kind=Pipe),
+    io: @event_loop.IoHandleRenamed::from_fd(r, kind=Pipe),
     read_buf: @io.ReaderBuffer::new(),
   }
-  (r, PipeWrite(@event_loop.IoHandle::from_fd(w, kind=Pipe)))
+  (r, PipeWrite(@event_loop.IoHandleRenamed::from_fd(w, kind=Pipe)))
 }
 
 ///|
*** Update File: <WORKDIR>/src/process/redirect.mbt
@@
 ///|
 /// A temporary pipe used to read output from a spawned process
 struct ReadFromProcess {
-  io : @event_loop.IoHandle
+  io : @event_loop.IoHandleRenamed
   read_buf : @io.ReaderBuffer
 }
 
 ///|
 /// A temporary pipe used to write data to a spawned process
-struct WriteToProcess(@event_loop.IoHandle)
+struct WriteToProcess(@event_loop.IoHandleRenamed)
 
 ///|
 /// Create a temporary pipe for reading from stdout/stderr of a process.
@@
     write_end_is_async=false,
     context~,
   )
-  let r = @event_loop.IoHandle::from_fd(r, kind=Pipe)
+  let r = @event_loop.IoHandleRenamed::from_fd(r, kind=Pipe)
-  let w = @event_loop.IoHandle::from_fd(w, kind=Pipe, is_async=false)
+  let w = @event_loop.IoHandleRenamed::from_fd(w, kind=Pipe, is_async=false)
   (
     { io: r, read_buf: @io.ReaderBuffer::new() },
     TempPipeWrite::{ pipe: w, closed: false },
@@
     write_end_is_async=true,
     context~,
   )
-  let r = @event_loop.IoHandle::from_fd(r, kind=Pipe, is_async=false)
+  let r = @event_loop.IoHandleRenamed::from_fd(r, kind=Pipe, is_async=false)
-  let w = @event_loop.IoHandle::from_fd(w, kind=Pipe)
+  let w = @event_loop.IoHandleRenamed::from_fd(w, kind=Pipe)
   (TempPipeRead::{ pipe: r, closed: false }, w)
 }
 
@@
 
 ///|
 priv struct TempPipeRead {
-  pipe : @event_loop.IoHandle
+  pipe : @event_loop.IoHandleRenamed
   mut closed : Bool
 }
 
 ///|
 priv struct TempPipeWrite {
-  pipe : @event_loop.IoHandle
+  pipe : @event_loop.IoHandleRenamed
   mut closed : Bool
 }
 
@@
 }
 
 ///|
-priv struct RedirectToFile(@event_loop.IoHandle)
+priv struct RedirectToFile(@event_loop.IoHandleRenamed)
 
 ///|
 impl ProcessOutput for RedirectToFile with fn fd(self) {
*** Update File: <WORKDIR>/src/raw_fd/raw_fd.mbt
@@
 /// that are not natively supported by `moonbitlang/async`.
 pub struct RawFd {
   fd : @fd_util.Fd
-  priv io : @event_loop.IoHandle
+  priv io : @event_loop.IoHandleRenamed
 }
 
 ///|
@@
   let context = "@raw_fd.RawFd::new()"
   let kind = @event_loop.kind_of_fd(fd, context~)
   let is_async = @fd_util.fd_is_nonblocking(fd, context~)
-  { fd, io: @event_loop.IoHandle::from_fd(fd, kind~, is_async~) }
+  { fd, io: @event_loop.IoHandleRenamed::from_fd(fd, kind~, is_async~) }
 }
 
 ///|
@@
 /// that are not natively supported by `moonbitlang/async`.
 pub struct RawFdStream {
   fd : @fd_util.Fd
-  priv io : @event_loop.IoHandle
+  priv io : @event_loop.IoHandleRenamed
   priv read_buf : @io.ReaderBuffer
 }
 
@@
   let kind = @event_loop.kind_of_fd(fd, context~)
   let is_async = @fd_util.fd_is_nonblocking(fd, context~)
   let read_buf = @io.ReaderBuffer::new()
-  { fd, io: @event_loop.IoHandle::from_fd(fd, kind~, is_async~), read_buf }
+  { fd, io: @event_loop.IoHandleRenamed::from_fd(fd, kind~, is_async~), read_buf }
 }
 
 ///|
*** Update File: <WORKDIR>/src/socket/tcp.mbt
@@
 pub struct Tcp {
   /// The local address of a TCP connection
   addr : Addr
-  priv io : @event_loop.IoHandle
+  priv io : @event_loop.IoHandleRenamed
   priv read_buf : @io.ReaderBuffer
 }
 
@@
 pub struct TcpServer {
   /// The actual listen address of the server
   addr : Addr
-  priv io : @event_loop.IoHandle
+  priv io : @event_loop.IoHandleRenamed
 }
 
 ///|
@@
   let context = "@socket.TcpServer::new()"
   let family = addr.family()
   let sock = make_tcp_socket(family, context~)
-  let io = @event_loop.IoHandle::from_fd(sock, kind=Socket, read_only=true)
+  let io = @event_loop.IoHandleRenamed::from_fd(sock, kind=Socket, read_only=true)
   try {
     if addr.is_ipv6() && addr.is_ipv6_wildcard() {
       if 0 != set_ipv6_only(sock, !dual_stack) {
@@
   let context = "@socket.Tcp::connect()"
   let family = addr.family()
   let sock = make_tcp_socket(family, context~)
-  let conn = @event_loop.IoHandle::from_fd(sock, kind=Socket)
+  let conn = @event_loop.IoHandleRenamed::from_fd(sock, kind=Socket)
   try {
     if disable_nagle(sock) < 0 {
       @os_error.check_errno("@socket.Tcp::connect(): set TCP_NODELAY")
*** Update File: <WORKDIR>/src/socket/udp.mbt
@@
 pub struct UdpClient {
   /// Local address of the client
   addr : Addr
-  priv io : @event_loop.IoHandle
+  priv io : @event_loop.IoHandleRenamed
   priv mut dst_addr : Addr?
 }
 
@@
   let context = "@socket.UdpClient::new()"
   let family = addr.family()
   let sock = make_udp_socket(family, multicast=false, context~)
-  let io = @event_loop.IoHandle::from_fd(sock, kind=Socket, read_only=true)
+  let io = @event_loop.IoHandleRenamed::from_fd(sock, kind=Socket, read_only=true)
   try {
     let dst_addr = if addr.is_multicast() {
       if @event_loop.platform is Windows {
@@
 /// The essence of `UdpServer` is a UDP socket with a fixed/well-known port.
 pub struct UdpServer {
   addr : Addr
-  priv io : @event_loop.IoHandle
+  priv io : @event_loop.IoHandleRenamed
   priv is_multicast_only : Bool
 }
 
@@
   let context = "@socket.UdpServer::new()"
   let family = addr.family()
   let sock = make_udp_socket(family, multicast=false, context~)
-  let io = @event_loop.IoHandle::from_fd(sock, kind=Socket)
+  let io = @event_loop.IoHandleRenamed::from_fd(sock, kind=Socket)
   try {
     if addr.is_ipv6() && addr.is_ipv6_wildcard() {
       if 0 != set_ipv6_only(sock, !dual_stack) {
@@
     abort("@socket.UdpServer::multicast() is IPv4 only")
   }
   let sock = make_udp_socket(family, multicast=true, context~)
-  let io = @event_loop.IoHandle::from_fd(sock, kind=Socket)
+  let io = @event_loop.IoHandleRenamed::from_fd(sock, kind=Socket)
   try {
     if @event_loop.platform is Windows {
       let local_addr = Addr::new(0, multi_addr.port())
*** Update File: <WORKDIR>/src/stdio/stdio.mbt
@@
 
 ///|
 struct Input {
-  io : Result[@event_loop.IoHandle, Error]
+  io : Result[@event_loop.IoHandleRenamed, Error]
   read_buf : @io.ReaderBuffer
 }
 
@@
 }
 
 ///|
-struct Output(Result[@event_loop.IoHandle, Error])
+struct Output(Result[@event_loop.IoHandleRenamed, Error])
 
 ///|
 /// Return the file descriptor of an output channel.
*** End Patch

```
