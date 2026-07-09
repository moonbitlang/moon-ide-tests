# async hover

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
$ run_moon_ide moon ide hover 'mkdir' --loc 'src/fs/dir.mbt:24:14'
///
/// If `recursive=true` (`false` by default), non-existing parent directories
/// of `path` will be recursively created, too.
pub async fn mkdir(
             ^^^^^
             ```moonbit
             async fn mkdir(path : StringView, permission? : Int, recursive? : Bool) -> Unit
             ```
             ---
             
              Create a directory at `path`.
             
              The Unix-style permission of the created directory can be set in `permission`,
              the default value is `0o755` (anyone can read and traverse, only owner can write).
              The `permission` parameter is currently ignored on Windows.
             
              If `recursive=true` (`false` by default), non-existing parent directories
              of `path` will be recursively created, too.
  path : StringView,
  permission? : Int = 0o755,
```

```mooncram
$ run_moon_ide moon ide hover 'path' --loc 'src/fs/dir.mbt:25:3'
/// If `recursive=true` (`false` by default), non-existing parent directories
/// of `path` will be recursively created, too.
pub async fn mkdir(
  path : StringView,
  ^^^^
  ```moonbit
  StringView
  ```
  permission? : Int = 0o755,
  recursive? : Bool = false,
```

```mooncram
$ run_moon_ide moon ide hover 'File' --loc 'src/fs/file.mbt:16:8'
// limitations under the License.

///|
struct File {
       ^^^^
       ```moonbit
       struct File {
         io: @event_loop.IoHandle
         read_buf: @io.ReaderBuffer
       }
       ```
  io : @event_loop.IoHandle
  read_buf : @io.ReaderBuffer
```

```mooncram
$ run_moon_ide moon ide hover 'io' --loc 'src/fs/file.mbt:17:3'
///|
struct File {
  io : @event_loop.IoHandle
  ^^
  ```moonbit
  @event_loop.IoHandle
  ```
  read_buf : @io.ReaderBuffer
}
```

```mooncram
$ run_moon_ide moon ide hover 'kind' --loc 'src/fs/utils.mbt:19:14'
/// Get the kind of a file at `path`.
/// If `path` is a symbolic link and `follow_symlink` is `true` (`true` by default),
/// the kind of the target of the link will be returned.
pub async fn kind(path : StringView, follow_symlink? : Bool = true) -> FileKind {
             ^^^^
             ```moonbit
             async fn kind(path : StringView, follow_symlink? : Bool) -> FileKind
             ```
             ---
             
              Get the kind of a file at `path`.
              If `path` is a symbolic link and `follow_symlink` is `true` (`true` by default),
              the kind of the target of the link will be returned.
  @event_loop.file_kind_by_path(
    path,
```

```mooncram
$ run_moon_ide moon ide hover 'path' --loc 'src/fs/utils.mbt:19:19'
/// Get the kind of a file at `path`.
/// If `path` is a symbolic link and `follow_symlink` is `true` (`true` by default),
/// the kind of the target of the link will be returned.
pub async fn kind(path : StringView, follow_symlink? : Bool = true) -> FileKind {
                  ^^^^
                  ```moonbit
                  StringView
                  ```
  @event_loop.file_kind_by_path(
    path,
```

```mooncram
$ run_moon_ide moon ide hover 'FileIdentity' --loc 'src/fs/watch.mbt:16:25'
// limitations under the License.

///|
using @event_loop {type FileIdentity}
                        ^^^^^^^^^^^^
                        ```moonbit
                        #valtype
                        struct @event_loop.FileIdentity {
                          dev_id: UInt64
                          file_id: UInt64
                        } derive(Eq, Hash)
                        ```

///|
```

```mooncram
$ run_moon_ide moon ide hover 'WatchedFile' --loc 'src/fs/watch.mbt:19:13'
using @event_loop {type FileIdentity}

///|
priv struct WatchedFile {
            ^^^^^^^^^^^
            ```moonbit
            struct WatchedFile {
              wd: Int
              file_id: @event_loop.FileIdentity
              paths: @set.Set[(@event_loop.FileIdentity, String)]
              is_dir: Bool
              children: Map[String, @event_loop.FileIdentity]
              mut modified: Bool
              dirty_children: Map[String, @event_loop.FileIdentity]
            }
            ```
  wd : @fd_util.Fd
  file_id : FileIdentity
```

```mooncram
$ run_moon_ide moon ide hover 'tmpdir_seed' --loc 'src/fs/tmpdir.mbt:16:5'
// limitations under the License.

///|
let tmpdir_seed : @random.Rand = {
    ^^^^^^^^^^^
    ```moonbit
    @random.Rand
    ```
    ---
    
  let seed = Buffer()
  let now = @env.now()
```

```mooncram
$ run_moon_ide moon ide hover 'Rand' --loc 'src/fs/tmpdir.mbt:16:22'
// limitations under the License.

///|
let tmpdir_seed : @random.Rand = {
                  ^^^^^^^^^^^^
                  ```moonbit
                  type @random.Rand
                  ```
                  ---
                  
                   `Rand` is a pseudo-random number generator (PRNG) that provides various
                   methods to generate random numbers of different types.
  let seed = Buffer()
  let now = @env.now()
```
