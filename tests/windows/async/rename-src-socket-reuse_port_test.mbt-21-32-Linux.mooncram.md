# async rename Linux src\socket\reuse_port_test.mbt:21:32

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\async' moon ide rename 'Linux' 'LinuxRenamed' --loc 'src\socket\reuse_port_test.mbt:21:32'
*** Begin Patch
*** Update File: <WORKDIR>/src\fs\dir.mbt
@@
   dir.offset += entry_len
   dir.count += 1
   let need_more_entry = match @event_loop.platform {
-    Linux => dir.offset >= dir.job_ret
+    LinuxRenamed => dir.offset >= dir.job_ret
     MacOS => dir.count >= dir.job_ret
     Windows => entry_len is 0
   }
*** Update File: <WORKDIR>/src\internal\event_loop\process.mbt
@@
     IoHandle::from_fd(
       handle,
       kind=Unknown,
-      is_async=platform is Linux,
+      is_async=platform is LinuxRenamed,
       read_only=true,
     )
     |> Some
*** Update File: <WORKDIR>/src\os_error\error.mbt
@@
 ///|
 fn errno_is_nonblocking_io_error(errno : Int) -> Bool {
   match @env_util.platform {
-    Linux =>
+    LinuxRenamed =>
       errno == linux_EAGAIN ||
       errno == linux_EINPROGRESS ||
       errno == linux_EWOULDBLOCK
@@
 pub fn OSError::is_EINTR(err : OSError) -> Bool {
   let OSError(errno, ..) = err
   match @env_util.platform {
-    Linux => errno == linux_EINTR
+    LinuxRenamed => errno == linux_EINTR
     MacOS => errno == macos_EINTR
     Windows => false
   }
@@
 pub fn OSError::is_ENOENT(err : OSError) -> Bool {
   let OSError(errno, ..) = err
   match @env_util.platform {
-    Linux => errno == linux_ENOENT
+    LinuxRenamed => errno == linux_ENOENT
     MacOS => errno == macos_ENOENT
     Windows =>
       errno == windows_ERROR_FILE_NOT_FOUND ||
@@
 pub fn OSError::is_EEXIST(err : OSError) -> Bool {
   let OSError(errno, ..) = err
   match @env_util.platform {
-    Linux => errno == linux_EEXIST
+    LinuxRenamed => errno == linux_EEXIST
     MacOS => errno == macos_EEXIST
     Windows =>
       errno == windows_ERROR_FILE_EXISTS ||
@@
 pub fn OSError::is_EACCES(err : OSError) -> Bool {
   let OSError(errno, ..) = err
   match @env_util.platform {
-    Linux => errno == linux_EACCES
+    LinuxRenamed => errno == linux_EACCES
     MacOS => errno == macos_EACCES
     Windows => errno == windows_ERROR_ACCESS_DENIED
   }
@@
 pub fn OSError::is_ECONNREFUSED(err : OSError) -> Bool {
   let OSError(errno, ..) = err
   match @env_util.platform {
-    Linux => errno == linux_ECONNREFUSED
+    LinuxRenamed => errno == linux_ECONNREFUSED
     MacOS => errno == macos_ECONNREFUSED
     Windows => errno == windows_ERROR_CONNECTION_REFUSED
   }
@@
 pub fn OSError::is_ERROR_NOTIFY_ENUM_DIR(err : OSError) -> Bool {
   let OSError(errno, ..) = err
   match @env_util.platform {
-    Linux | MacOS => false
+    LinuxRenamed | MacOS => false
     Windows => errno == windows_ERROR_NOTIFY_ENUM_DIR
   }
 }
@@
 
 ///|
 pub let errno_ENOTDIR : Int = match @env_util.platform {
-  Linux => linux_ENOTDIR
+  LinuxRenamed => linux_ENOTDIR
   MacOS => macos_ENOTDIR
   Windows => windows_ERROR_DIRECTORY
 }
@@
 
 ///|
 pub let errno_ENOTSUP : Int = match @env_util.platform {
-  Linux => linux_ENOTSUP
+  LinuxRenamed => linux_ENOTSUP
   MacOS => macos_ENOTSUP
   Windows => windows_ERROR_NOT_SUPPORTED
 }
*** Update File: <WORKDIR>/src\socket\ifname.mbt
@@
 let global_ifname_socket : Ref[@fd_util.Fd] = {
   let context = "creating global socket object for interface name lookup"
   let sock = Ref(
-    if @event_loop.platform is Linux {
+    if @event_loop.platform is LinuxRenamed {
       make_udp_socket(IPv4, multicast=false, context~) catch {
         err => abort(err.to_string())
       }
@@
     init=() => {
       // In some tests there may be multiple event loops spawned in a single program run,
       // ensure the global socket object is valid after the last event loop disposed it
-      if @event_loop.platform is Linux && !@fd_util.fd_is_valid(sock.val) {
+      if @event_loop.platform is LinuxRenamed && !@fd_util.fd_is_valid(sock.val) {
         sock.val = make_udp_socket(IPv4, multicast=false, context~)
       }
     },
*** Update File: <WORKDIR>/src\socket\reuse_port_test.mbt
@@
   // and MacOS too, but there which socket accepts a given connection is
   // unspecified, so there is nothing to observe. `#cfg(platform=..)` cannot
   // express this — it only knows `windows` — so the check is made at runtime.
-  if !(@event_loop.platform is Linux) {
+  if !(@event_loop.platform is LinuxRenamed) {
     return
   }
   let mut accepted1 = 0
*** Update File: <WORKDIR>/src\socket\tcp.mbt
@@
   if !(@event_loop.platform is Windows) && reuse_addr {
     guard allow_reuse_addr(sock) >= 0 else { @os_error.check_errno(context) }
   }
-  if @event_loop.platform is Linux && reuse_port_lb {
+  if @event_loop.platform is LinuxRenamed && reuse_port_lb {
     guard allow_reuse_port(sock) >= 0 else { @os_error.check_errno(context) }
   }
   io.bind(addr.0, context~)
*** Update File: <WORKDIR>/src\types\types.mbt
@@
 /// Current operating system running the program.
 /// For Wasm backend, the actual operating system can only be known at runtime.
 pub(all) enum Platform {
-  Linux = 0
+  LinuxRenamed = 0
   MacOS = 1
   Windows = 2
 }
*** End Patch

```
