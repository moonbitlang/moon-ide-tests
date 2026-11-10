# core rename FileKind async\internal\fd_util\stat.mbt:17:15

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\core' moon ide rename 'FileKind' 'FileKindRenamed' --loc 'async\internal\fd_util\stat.mbt:17:15'
*** Begin Patch
*** Update File: <WORKDIR>/async\fs\constants.mbt
@@
 ///|
 // currently we cannot re-export constructors,
 // so we have to use a hack to make the `FileKind` type available to users.
-fn FileKind::from_fd_util_file_kind(k : @fd_util.FileKind) -> FileKind = "%identity"
+fn FileKind::from_fd_util_file_kind(k : @fd_util.FileKindRenamed) -> FileKind = "%identity"
*** Update File: <WORKDIR>/async\internal\event_loop\fs.mbt
@@
           context="\{context}: \{path.escape()}",
         )
       }
-      let kind = @fd_util.FileKind::from_int(kind.to_int())
+      let kind = @fd_util.FileKindRenamed::from_int(kind.to_int())
       let io = IoHandle::from_fd(
         fd,
         kind~,
@@
 pub async fn kind_of_fd(
   fd : @fd_util.Fd,
   context~ : String,
-) -> @fd_util.FileKind {
+) -> @fd_util.FileKindRenamed {
   guard! fstatx_single(fd, STAT_FILE_KIND, 1, context~) is [u64le(kind)]
-  @fd_util.FileKind::from_int(kind.to_int())
+  @fd_util.FileKindRenamed::from_int(kind.to_int())
 }
 
 ///|
@@
   parent~ : @fd_util.Fd,
   follow_symlink~ : Bool,
   context~ : String,
-) -> @fd_util.FileKind {
+) -> @fd_util.FileKindRenamed {
   guard! statx_single(
       path,
       parent~,
@@
       context~,
     )
     is [u64le(kind)]
-  @fd_util.FileKind::from_int(kind.to_int())
+  @fd_util.FileKindRenamed::from_int(kind.to_int())
 }
 
 ///|
*** Update File: <WORKDIR>/async\internal\event_loop\io.mbt
@@
 /// capable of performing async IO operations.
 pub struct IoHandle {
   priv mut fd : @fd_util.Fd
-  priv kind : @fd_util.FileKind
+  priv kind : @fd_util.FileKindRenamed
   /// - `is_async=true`: support native async operations through the event bus.
   ///   This usually means the fd is non blocking (Unix) or overlapped (Windows)
   /// - `is_async=false`: all operations are blocking and go through the thread pool
@@
 
 ///|
 /// Get the kind of an `IoHandle`.
-pub fn IoHandle::kind(handle : IoHandle) -> @fd_util.FileKind {
+pub fn IoHandle::kind(handle : IoHandle) -> @fd_util.FileKindRenamed {
   handle.kind
 }
 
@@
 ///   If `read_only=true`, only read event will be registered.
 pub fn IoHandle::from_fd(
   fd : @fd_util.Fd,
-  kind~ : @fd_util.FileKind,
+  kind~ : @fd_util.FileKindRenamed,
   is_async~ : Bool = true,
   read_only~ : Bool = false,
 ) -> IoHandle raise {
*** Update File: <WORKDIR>/async\internal\event_loop\stdio.mbt
@@
 fn kind_of_fd_sync(
   fd : @fd_util.Fd,
   context~ : String,
-) -> @fd_util.FileKind raise {
+) -> @fd_util.FileKindRenamed raise {
   let kind = kind_of_fd_sync_ffi(fd)
   if kind < 0 {
     @os_error.check_errno(context)
   }
-  @fd_util.FileKind::from_int(kind)
+  @fd_util.FileKindRenamed::from_int(kind)
 }
 
 ///|
*** Update File: <WORKDIR>/async\internal\event_loop\windows_console.mbt
@@
 
 ///|
 fn WindowsConsoleBuffer::WindowsConsoleBuffer(
-  kind : @fd_util.FileKind,
+  kind : @fd_util.FileKindRenamed,
 ) -> WindowsConsoleBuffer {
   if kind is Console && platform is Windows {
     {
*** Update File: <WORKDIR>/async\internal\fd_util\deprecated.mbt
@@
 ///|
 #deprecated
 #doc(hidden)
-pub extend FileKind with Eq::{not_equal, equal}
+pub extend FileKindRenamed with Eq::{not_equal, equal}
 
 ///|
 #deprecated
 #doc(hidden)
-pub extend FileKind with @debug.Debug::{to_repr}
+pub extend FileKindRenamed with @debug.Debug::{to_repr}
*** Update File: <WORKDIR>/async\internal\fd_util\fd_util.wasm.mbt
@@
 /// Close a file descriptor.
 /// On Windows, socket handles must be closed with `closesocket` instead of `CloseHandle`,
 /// therefore the caller must supply the kind of the file descriptor.
-pub fn close(fd : Fd, kind~ : FileKind, context~ : String) -> Unit raise {
+pub fn close(fd : Fd, kind~ : FileKindRenamed, context~ : String) -> Unit raise {
   ignore(kind)
   if close_ffi(fd) < 0 {
     @os_error.check_errno(context)
*** Update File: <WORKDIR>/async\internal\fd_util\stat.mbt
@@
 
 ///|
 /// Kind of a file descriptor/Windows HANDLE.
-pub(all) enum FileKind {
+pub(all) enum FileKindRenamed {
   Unknown = 0
   Regular = 1
   Directory = 2
@@
 } derive(Eq, @debug.Debug)
 
 ///|
-let known_kinds : ReadOnlyArray[FileKind] = [
+let known_kinds : ReadOnlyArray[FileKindRenamed] = [
   Regular,
   Directory,
   SymLink,
@@
 ///|
 /// Create a `FileKind` from its raw integer representation.
 /// Return `Unknown` for unknown integer value.
-pub fn FileKind::from_int(value : Int32) -> FileKind {
+pub fn FileKindRenamed::from_int(value : Int32) -> FileKindRenamed {
   if value >= 1 && value - 1 < known_kinds.length() {
     known_kinds[value - 1]
   } else {
@@
 /// Return `true` if fd of the specific kind may be pollable.
 /// Note that file kind alone is not enough to detect if a fd is truly pollable,
 /// so this is just a fast approximation.
-pub fn FileKind::can_poll(self : FileKind) -> Bool {
+pub fn FileKindRenamed::can_poll(self : FileKindRenamed) -> Bool {
   match self {
     Socket | Pipe | CharDevice | Console => true
     Unknown | Regular | Directory | SymLink | BlockDevice => false
*** End Patch

```
