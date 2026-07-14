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
$ run_moon_ide moon ide hover 'log' --loc 'src/aqueue/blocking_test.mbt:17:7'
///|
async test "blocking unbuffered" {
  let log = []
      ^^^
      ```moonbit
      Array[String]
      ```
  @async.with_task_group() <| group => {
    let q = @async.Queue(kind=Blocking(1))
```

```mooncram
$ run_moon_ide moon ide hover 'with_task_group' --loc 'src/aqueue/blocking_test.mbt:18:10'
///|
async test "blocking unbuffered" {
  let log = []
  @async.with_task_group() <| group => {
  ^^^^^^^^^^^^^^^^^^^^^^
  ```moonbit
  async fn[X] @moonbitlang/async.with_task_group(f : async (@async.TaskGroup[X]) -> X) -> X
  ```
  ---
  
   `with_task_group(f)` creates a new task group and run `f` with the new group.
   `f` itself will be run in a child task of the new group.
   `with_task_group` exits after all the whole group terminates,
   which means all child tasks in the group have terminated, including `f`.
  
   If all children task terminate successfully,
   `with_task_group` will return the result of `f`.
    let q = @async.Queue(kind=Blocking(1))
    group.spawn_bg() <| () => {
```

```mooncram
$ run_moon_ide moon ide hover 'mkfifo' --loc 'src/fs/named_pipe_test.mbt:18:15'
No hover information found for symbol 'mkfifo' at src/fs/named_pipe_test.mbt:18:15
[1]
```

```mooncram
$ run_moon_ide moon ide hover 'path' --loc 'src/fs/named_pipe_test.mbt:18:22'
No hover information found for symbol 'path' at src/fs/named_pipe_test.mbt:18:22
[1]
```

```mooncram
$ run_moon_ide moon ide hover 'IoHandle' --loc 'src/internal/event_loop/io_unix.mbt:17:14'
///|
#cfg(not(platform="windows"))
pub async fn IoHandle::wait_read(handle : IoHandle) -> Unit {
             ^^^^^^^^
             ```moonbit
             struct IoHandle {
               mut fd: Int
               kind: @fd_util.FileKind
               is_async: Bool
               mut read: IoStatus
               mut read_offset: Int64
               mut write: IoStatus
               mut write_offset: Int64
             }
             ```
             ---
             
              A managed file descriptor/`HANDLE`,
              capable of performing async IO operations.
  guard @fd_util.fd_is_valid(handle.fd) else {
    abort("file descriptor already closed")
```

```mooncram
$ run_moon_ide moon ide hover 'wait_read' --loc 'src/internal/event_loop/io_unix.mbt:17:24'
///|
#cfg(not(platform="windows"))
pub async fn IoHandle::wait_read(handle : IoHandle) -> Unit {
                       ^^^^^^^^^
                       ```moonbit
                       async fn IoHandle::wait_read(handle : IoHandle) -> Unit
                       ```
  guard @fd_util.fd_is_valid(handle.fd) else {
    abort("file descriptor already closed")
```

```mooncram
$ run_moon_ide moon ide hover 'kind_of_fd_sync_ffi' --loc 'src/internal/event_loop/stdio.mbt:17:15'
No hover information found for symbol 'kind_of_fd_sync_ffi' at src/internal/event_loop/stdio.mbt:17:15
[1]
```

```mooncram
$ run_moon_ide moon ide hover 'fd' --loc 'src/internal/event_loop/stdio.mbt:17:35'
No hover information found for symbol 'fd' at src/internal/event_loop/stdio.mbt:17:35
[1]
```

```mooncram
$ run_moon_ide moon ide hover '_ignore_unused_import' --loc 'src/js_async/unimplemented.mbt:17:5'
///|
#coverage.skip
let _ignore_unused_import : Unit = {
    ^^^^^^^^^^^^^^^^^^^^^
    ```moonbit
    Unit
    ```
    ---
    
  ignore(@coroutine.spawn)
  ignore(@event_loop.Timer::new)
```

```mooncram
$ run_moon_ide moon ide hover 'spawn' --loc 'src/js_async/unimplemented.mbt:18:21'
///|
#coverage.skip
let _ignore_unused_import : Unit = {
  ignore(@coroutine.spawn)
         ^^^^^^^^^^^^^^^^
         ```moonbit
         fn @moonbitlang/async/internal/coroutine.spawn(f : async () -> Unit) -> @coroutine.Coroutine
         ```
  ignore(@event_loop.Timer::new)
}
```

```mooncram
$ run_moon_ide moon ide hover 'buf' --loc 'src/pipe/read_exactly_test.mbt:17:7'
///|
async test "read_exactly" {
  let buf = StringBuilder::new()
      ^^^
      ```moonbit
      StringBuilder
      ```
  fn log(msg) {
    buf..write_string(msg).write_char('\n')
```

```mooncram
$ run_moon_ide moon ide hover 'new' --loc 'src/pipe/read_exactly_test.mbt:17:28'
///|
async test "read_exactly" {
  let buf = StringBuilder::new()
                           ^^^
                           ```moonbit
                           fn StringBuilder::new(size_hint? : Int) -> StringBuilder
                           ```
                           ---
                           
                            Creates a new string builder with an optional initial capacity hint.
                           
                            Parameters:
                           
                            * `size_hint` : An optional initial capacity hint for the internal buffer. If
                            less than 1, a minimum capacity of 1 is used. Defaults to 0. It is the size of bytes, 
                            not the size of characters. `size_hint` may be ignored on some platforms, JS for example.
                           
                            Returns a new `StringBuilder` instance with the specified initial capacity.
  fn log(msg) {
    buf..write_string(msg).write_char('\n')
```

```mooncram
$ run_moon_ide moon ide hover '_ignore_unused_import' --loc 'src/pipe/unimplemented_test.mbt:17:5'
No hover information found for symbol '_ignore_unused_import' at src/pipe/unimplemented_test.mbt:17:5
[1]
```

```mooncram
$ run_moon_ide moon ide hover 'sleep' --loc 'src/pipe/unimplemented_test.mbt:18:17'
No hover information found for symbol 'sleep' at src/pipe/unimplemented_test.mbt:18:17
[1]
```

```mooncram
$ run_moon_ide moon ide hover 'ReadFromProcess' --loc 'src/process/redirect.mbt:17:8'
///|
/// A temporary pipe used to read output from a spawned process
struct ReadFromProcess {
       ^^^^^^^^^^^^^^^
       ```moonbit
       struct ReadFromProcess {
         io: @event_loop.IoHandle
         read_buf: @io.ReaderBuffer
       }
       ```
       ---
       
        A temporary pipe used to read output from a spawned process
  io : @event_loop.IoHandle
  read_buf : @io.ReaderBuffer
```

```mooncram
$ run_moon_ide moon ide hover 'io' --loc 'src/process/redirect.mbt:18:3'
///|
/// A temporary pipe used to read output from a spawned process
struct ReadFromProcess {
  io : @event_loop.IoHandle
  ^^
  ```moonbit
  @event_loop.IoHandle
  ```
  read_buf : @io.ReaderBuffer
}
```

```mooncram
$ run_moon_ide moon ide hover 'unimplemented' --loc 'src/socket/unimplemented.mbt:19:9'
No hover information found for symbol 'unimplemented' at src/socket/unimplemented.mbt:19:9
[1]
```

```mooncram
$ run_moon_ide moon ide hover 'pipe' --loc 'src/socket/unimplemented.mbt:20:14'
No hover information found for symbol 'pipe' at src/socket/unimplemented.mbt:20:14
[1]
```

```mooncram
$ run_moon_ide moon ide hover '_ignore_unused_import' --loc 'src/tls/unimplemented_test.mbt:17:5'
No hover information found for symbol '_ignore_unused_import' at src/tls/unimplemented_test.mbt:17:5
[1]
```

```mooncram
$ run_moon_ide moon ide hover 'sleep' --loc 'src/tls/unimplemented_test.mbt:18:17'
No hover information found for symbol 'sleep' at src/tls/unimplemented_test.mbt:18:17
[1]
```
