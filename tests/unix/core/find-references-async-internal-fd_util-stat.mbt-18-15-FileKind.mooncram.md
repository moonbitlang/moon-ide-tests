# core find-references FileKind async/internal/fd_util/stat.mbt:18:15

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' find-references 'FileKind' --loc 'async/internal/fd_util/stat.mbt:18:15'
Found 20 references for symbol 'FileKind':
<WORKDIR>/async/fs/constants.mbt:34:50-34:58:
   | ///|
   | // currently we cannot re-export constructors,
   | // so we have to use a hack to make the `FileKind` type available to users.
34 | fn FileKind::from_fd_util_file_kind(k : @fd_util.FileKind) -> FileKind = "%identity"
   |                                                  ^^^^^^^^

<WORKDIR>/async/internal/event_loop/fs.mbt:77:27-77:35:
   |           context="\{context}: \{path.escape()}",
   |         )
   |       }
77 |       let kind = @fd_util.FileKind::from_int(kind.to_int())
   |                           ^^^^^^^^
   |       let io = IoHandle::from_fd(
   |         fd,

<WORKDIR>/async/internal/event_loop/fs.mbt:257:15-257:23:
    | pub async fn kind_of_fd(
    |   fd : @fd_util.Fd,
    |   context~ : String,
257 | ) -> @fd_util.FileKind {
    |               ^^^^^^^^
    |   guard! fstatx_single(fd, STAT_FILE_KIND, 1, context~) is [u64le(kind)]
    |   @fd_util.FileKind::from_int(kind.to_int())

<WORKDIR>/async/internal/event_loop/fs.mbt:259:12-259:20:
    |   context~ : String,
    | ) -> @fd_util.FileKind {
    |   guard! fstatx_single(fd, STAT_FILE_KIND, 1, context~) is [u64le(kind)]
259 |   @fd_util.FileKind::from_int(kind.to_int())
    |            ^^^^^^^^
    | }
    | 

<WORKDIR>/async/internal/event_loop/fs.mbt:272:15-272:23:
    |   parent~ : @fd_util.Fd,
    |   follow_symlink~ : Bool,
    |   context~ : String,
272 | ) -> @fd_util.FileKind {
    |               ^^^^^^^^
    |   guard! statx_single(
    |       path,

<WORKDIR>/async/internal/event_loop/fs.mbt:282:12-282:20:
    |       context~,
    |     )
    |     is [u64le(kind)]
282 |   @fd_util.FileKind::from_int(kind.to_int())
    |            ^^^^^^^^
    | }
    | 

<WORKDIR>/async/internal/event_loop/io.mbt:29:28-29:36:
   | /// capable of performing async IO operations.
   | pub struct IoHandle {
   |   priv mut fd : @fd_util.Fd
29 |   priv mut kind : @fd_util.FileKind
   |                            ^^^^^^^^
   |   /// - `is_async=true`: support native async operations through the event bus.
   |   ///   This usually means the fd is non blocking (Unix) or overlapped (Windows)

<WORKDIR>/async/internal/event_loop/io.mbt:58:54-58:62:
   | 
   | ///|
   | /// Get the kind of an `IoHandle`.
58 | pub fn IoHandle::kind(handle : IoHandle) -> @fd_util.FileKind {
   |                                                      ^^^^^^^^
   |   handle.kind
   | }

<WORKDIR>/async/internal/event_loop/io.mbt:104:20-104:28:
    | ///   If `read_only=true`, only read event will be registered.
    | pub fn IoHandle::from_fd(
    |   fd : @fd_util.Fd,
104 |   kind~ : @fd_util.FileKind,
    |                    ^^^^^^^^
    |   is_async~ : Bool = true,
    |   read_only~ : Bool = false,

<WORKDIR>/async/internal/event_loop/stdio.mbt:47:15-47:23:
   | fn kind_of_fd_sync(
   |   fd : @fd_util.Fd,
   |   context~ : String,
47 | ) -> @fd_util.FileKind raise {
   |               ^^^^^^^^
   |   let buf = FixedArray::make(16, b'\x00')
   |   let job = Job::fstatx(fd, STAT_FILE_KIND, buf, buf.length())

<WORKDIR>/async/internal/event_loop/stdio.mbt:56:12-56:20:
   |   guard (mask & STAT_FILE_KIND) != 0 else {
   |     raise @os_error.from_errno(@errno_util.not_supported, context~)
   |   }
56 |   @fd_util.FileKind::from_int(kind.to_int())
   |            ^^^^^^^^
   | }
   | 

<WORKDIR>/async/internal/event_loop/windows_console.mbt:48:19-48:27:
   | 
   | ///|
   | fn WindowsConsoleBuffer::WindowsConsoleBuffer(
48 |   kind : @fd_util.FileKind,
   |                   ^^^^^^^^
   | ) -> WindowsConsoleBuffer {
   |   if kind is Console && platform is Windows {

<WORKDIR>/async/internal/fd_util/deprecated.mbt:18:12-18:20:
   | ///|
   | #deprecated
   | #doc(hidden)
18 | pub extend FileKind with Eq::{not_equal, equal}
   |            ^^^^^^^^
   | 
   | ///|

<WORKDIR>/async/internal/fd_util/deprecated.mbt:23:12-23:20:
   | ///|
   | #deprecated
   | #doc(hidden)
23 | pub extend FileKind with @debug.Debug::{to_repr}
   |            ^^^^^^^^

<WORKDIR>/async/internal/fd_util/fd_util.wasm.mbt:41:31-41:39:
   | /// Close a file descriptor.
   | /// On Windows, socket handles must be closed with `closesocket` instead of `CloseHandle`,
   | /// therefore the caller must supply the kind of the file descriptor.
41 | pub fn close(fd : Fd, kind~ : FileKind, context~ : String) -> Unit raise {
   |                               ^^^^^^^^
   |   ignore(kind)
   |   if close_ffi(fd) < 0 {

<WORKDIR>/async/internal/fd_util/stat.mbt:31:33-31:41:
   | }
   | 
   | ///|
31 | let known_kinds : ReadOnlyArray[FileKind] = [
   |                                 ^^^^^^^^
   |   Regular,
   |   Directory,

<WORKDIR>/async/internal/fd_util/stat.mbt:45:8-45:16:
   | ///|
   | /// Create a `FileKind` from its raw integer representation.
   | /// Return `Unknown` for unknown integer value.
45 | pub fn FileKind::from_int(value : Int32) -> FileKind {
   |        ^^^^^^^^
   |   if value >= 1 && value - 1 < known_kinds.length() {
   |     known_kinds[value - 1]

<WORKDIR>/async/internal/fd_util/stat.mbt:45:45-45:53:
   | ///|
   | /// Create a `FileKind` from its raw integer representation.
   | /// Return `Unknown` for unknown integer value.
45 | pub fn FileKind::from_int(value : Int32) -> FileKind {
   |                                             ^^^^^^^^
   |   if value >= 1 && value - 1 < known_kinds.length() {
   |     known_kinds[value - 1]

<WORKDIR>/async/internal/fd_util/stat.mbt:57:8-57:16:
   | /// Return `true` if fd of the specific kind may be pollable.
   | /// Note that file kind alone is not enough to detect if a fd is truly pollable,
   | /// so this is just a fast approximation.
57 | pub fn FileKind::can_poll(self : FileKind) -> Bool {
   |        ^^^^^^^^
   |   match self {
   |     Socket | Pipe | CharDevice | Console => true

<WORKDIR>/async/internal/fd_util/stat.mbt:57:34-57:42:
   | /// Return `true` if fd of the specific kind may be pollable.
   | /// Note that file kind alone is not enough to detect if a fd is truly pollable,
   | /// so this is just a fast approximation.
57 | pub fn FileKind::can_poll(self : FileKind) -> Bool {
   |                                  ^^^^^^^^
   |   match self {
   |     Socket | Pipe | CharDevice | Console => true
"" (escaped)
```
