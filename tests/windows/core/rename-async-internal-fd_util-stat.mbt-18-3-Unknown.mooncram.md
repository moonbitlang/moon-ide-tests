# core rename Unknown async\internal\fd_util\stat.mbt:18:3

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\core' moon ide rename 'Unknown' 'UnknownRenamed' --loc 'async\internal\fd_util\stat.mbt:18:3'
*** Begin Patch
*** Update File: <WORKDIR>/async\fs\watch_inotify.mbt
@@
   let self = {
     inotify: @event_loop.IoHandle::from_fd(
       inotify_fd,
-      kind=Unknown,
+      kind=UnknownRenamed,
       is_async=true,
     ),
     watched: Map([]),
*** Update File: <WORKDIR>/async\fs\watch_kqueue.mbt
@@
   {
     kqueue: @event_loop.IoHandle::from_fd(
       kqueue,
-      kind=Unknown,
+      kind=UnknownRenamed,
       is_async=true,
       read_only=true,
     ),
*** Update File: <WORKDIR>/async\internal\event_loop\process.mbt
@@
   } else {
     IoHandle::from_fd(
       handle,
-      kind=Unknown,
+      kind=UnknownRenamed,
       is_async=platform is Linux,
       read_only=true,
     )
*** Update File: <WORKDIR>/async\internal\event_loop\process_unix.mbt
@@
   let handle = if !@fd_util.fd_is_valid(pidfd) {
     None
   } else {
-    Some(IoHandle::from_fd(pidfd, kind=Unknown, read_only=true))
+    Some(IoHandle::from_fd(pidfd, kind=UnknownRenamed, read_only=true))
   }
   { pid, handle, }
 }
*** Update File: <WORKDIR>/async\internal\event_loop\process_windows.mbt
@@
   let pid = perform_job_in_worker(job.0, context~)
   let handle = IoHandle::from_fd(
     job.result_handle(),
-    kind=Unknown,
+    kind=UnknownRenamed,
     is_async=false,
   )
   { pid, handle: Some(handle), }
*** Update File: <WORKDIR>/async\internal\fd_util\stat.mbt
@@
 ///|
 /// Kind of a file descriptor/Windows HANDLE.
 pub(all) enum FileKind {
-  Unknown = 0
+  UnknownRenamed = 0
   Regular = 1
   Directory = 2
   SymLink = 3
@@
   if value >= 1 && value - 1 < known_kinds.length() {
     known_kinds[value - 1]
   } else {
-    Unknown
+    UnknownRenamed
   }
 }
 
@@
 pub fn FileKind::can_poll(self : FileKind) -> Bool {
   match self {
     Socket | Pipe | CharDevice | Console => true
-    Unknown | Regular | Directory | SymLink | BlockDevice => false
+    UnknownRenamed | Regular | Directory | SymLink | BlockDevice => false
   }
 }
*** End Patch

```
