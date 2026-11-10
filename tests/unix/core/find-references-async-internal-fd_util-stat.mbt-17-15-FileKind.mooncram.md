# core find-references FileKind async/internal/fd_util/stat.mbt:17:15

```mooncram
$ export MOON_HOME="${MOON_HOME:-$HOME/.moon}"
```

```mooncram
$ export TEST_REPO_ROOT="$(cd "$TESTDIR/../../../fixtures/repos/core" && pwd)"
```

```mooncram
$ normalize_moon_ide_output() { sed -e "s|$TEST_REPO_ROOT|<WORKDIR>|g" -e "s|$MOON_HOME|<MOON_HOME>|g"; }
```

```mooncram
$ run_moon_ide() { status_file="${TMPDIR:-/tmp}/moon-ide-status.$$"; ( cd "$TEST_REPO_ROOT" && "$@"; echo "$?" > "$status_file" ) 2>&1 | normalize_moon_ide_output; status=$(cat "$status_file"); rm -f "$status_file"; return "$status"; }
```

```mooncram
$ run_moon_ide moon ide find-references 'FileKind' --loc 'async/internal/fd_util/stat.mbt:17:15'
Found 20 references for symbol 'FileKind':
<WORKDIR>/async/fs/constants.mbt:33:50-33:58:
   | ///|
   | // currently we cannot re-export constructors,
   | // so we have to use a hack to make the `FileKind` type available to users.
33 | fn FileKind::from_fd_util_file_kind(k : @fd_util.FileKind) -> FileKind = "%identity"
   |                                                  ^^^^^^^^

<WORKDIR>/async/internal/event_loop/fs.mbt:74:27-74:35:
   |           context="\{context}: \{path.escape()}",
   |         )
   |       }
74 |       let kind = @fd_util.FileKind::from_int(kind.to_int())
   |                           ^^^^^^^^
   |       let io = IoHandle::from_fd(
   |         fd,

<WORKDIR>/async/internal/event_loop/fs.mbt:254:15-254:23:
    | pub async fn kind_of_fd(
    |   fd : @fd_util.Fd,
    |   context~ : String,
254 | ) -> @fd_util.FileKind {
    |               ^^^^^^^^
    |   guard! fstatx_single(fd, STAT_FILE_KIND, 1, context~) is [u64le(kind)]
    |   @fd_util.FileKind::from_int(kind.to_int())

<WORKDIR>/async/internal/event_loop/fs.mbt:256:12-256:20:
    |   context~ : String,
    | ) -> @fd_util.FileKind {
    |   guard! fstatx_single(fd, STAT_FILE_KIND, 1, context~) is [u64le(kind)]
256 |   @fd_util.FileKind::from_int(kind.to_int())
    |            ^^^^^^^^
    | }
    | 

<WORKDIR>/async/internal/event_loop/fs.mbt:269:15-269:23:
    |   parent~ : @fd_util.Fd,
    |   follow_symlink~ : Bool,
    |   context~ : String,
269 | ) -> @fd_util.FileKind {
    |               ^^^^^^^^
    |   guard! statx_single(
    |       path,

<WORKDIR>/async/internal/event_loop/fs.mbt:279:12-279:20:
    |       context~,
    |     )
    |     is [u64le(kind)]
279 |   @fd_util.FileKind::from_int(kind.to_int())
    |            ^^^^^^^^
    | }
    | 

<WORKDIR>/async/internal/event_loop/io.mbt:29:24-29:32:
   | /// capable of performing async IO operations.
   | pub struct IoHandle {
   |   priv mut fd : @fd_util.Fd
29 |   priv kind : @fd_util.FileKind
   |                        ^^^^^^^^
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

<WORKDIR>/async/internal/event_loop/stdio.mbt:52:15-52:23:
   | fn kind_of_fd_sync(
   |   fd : @fd_util.Fd,
   |   context~ : String,
52 | ) -> @fd_util.FileKind raise {
   |               ^^^^^^^^
   |   let kind = kind_of_fd_sync_ffi(fd)
   |   if kind < 0 {

<WORKDIR>/async/internal/event_loop/stdio.mbt:57:12-57:20:
   |   if kind < 0 {
   |     @os_error.check_errno(context)
   |   }
57 |   @fd_util.FileKind::from_int(kind)
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

<WORKDIR>/async/internal/fd_util/fd_util.wasm.mbt:39:31-39:39:
   | /// Close a file descriptor.
   | /// On Windows, socket handles must be closed with `closesocket` instead of `CloseHandle`,
   | /// therefore the caller must supply the kind of the file descriptor.
39 | pub fn close(fd : Fd, kind~ : FileKind, context~ : String) -> Unit raise {
   |                               ^^^^^^^^
   |   ignore(kind)
   |   if close_ffi(fd) < 0 {

<WORKDIR>/async/internal/fd_util/stat.mbt:30:33-30:41:
   | } derive(Eq, @debug.Debug)
   | 
   | ///|
30 | let known_kinds : ReadOnlyArray[FileKind] = [
   |                                 ^^^^^^^^
   |   Regular,
   |   Directory,

<WORKDIR>/async/internal/fd_util/stat.mbt:44:8-44:16:
   | ///|
   | /// Create a `FileKind` from its raw integer representation.
   | /// Return `Unknown` for unknown integer value.
44 | pub fn FileKind::from_int(value : Int32) -> FileKind {
   |        ^^^^^^^^
   |   if value >= 1 && value - 1 < known_kinds.length() {
   |     known_kinds[value - 1]

<WORKDIR>/async/internal/fd_util/stat.mbt:44:45-44:53:
   | ///|
   | /// Create a `FileKind` from its raw integer representation.
   | /// Return `Unknown` for unknown integer value.
44 | pub fn FileKind::from_int(value : Int32) -> FileKind {
   |                                             ^^^^^^^^
   |   if value >= 1 && value - 1 < known_kinds.length() {
   |     known_kinds[value - 1]

<WORKDIR>/async/internal/fd_util/stat.mbt:56:8-56:16:
   | /// Return `true` if fd of the specific kind may be pollable.
   | /// Note that file kind alone is not enough to detect if a fd is truly pollable,
   | /// so this is just a fast approximation.
56 | pub fn FileKind::can_poll(self : FileKind) -> Bool {
   |        ^^^^^^^^
   |   match self {
   |     Socket | Pipe | CharDevice | Console => true

<WORKDIR>/async/internal/fd_util/stat.mbt:56:34-56:42:
   | /// Return `true` if fd of the specific kind may be pollable.
   | /// Note that file kind alone is not enough to detect if a fd is truly pollable,
   | /// so this is just a fast approximation.
56 | pub fn FileKind::can_poll(self : FileKind) -> Bool {
   |                                  ^^^^^^^^
   |   match self {
   |     Socket | Pipe | CharDevice | Console => true

```
