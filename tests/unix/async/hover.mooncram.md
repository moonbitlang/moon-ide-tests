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
  async fn[X] @moonbitlang/async.with_task_group(f : async (@async.TaskGroup[X]) -> X, loc~ : SourceLoc = _) -> X
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

Known IDE limitation: extern function declaration hover reports no information; declaration navigation and rename work.

<!-- known-ide-limitation: extern-function-hover -->
```mooncram
$ run_moon_ide moon ide hover 'mkfifo' --loc 'src/fs/named_pipe_test.mbt:18:15'
No hover information found for symbol 'mkfifo' at src/fs/named_pipe_test.mbt:18:15
[1]
```

Known IDE limitation: extern function parameter hover reports no information; declaration navigation and rename work.

<!-- known-ide-limitation: extern-parameter-hover -->
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
               console_state: WindowsConsoleBuffer
               // private fields
             }
             ```
             ---
             
              A managed file descriptor/`HANDLE`,
              capable of performing async IO operations.
  guard! curr_loop.val is Some(evloop)
  guard @fd_util.fd_is_valid(handle.fd) else {
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
  guard! curr_loop.val is Some(evloop)
  guard @fd_util.fd_is_valid(handle.fd) else {
```

```mooncram
$ run_moon_ide moon ide hover 'from_core_stdio' --loc 'src/internal/event_loop/stdio.mbt:17:4'
No hover information found for symbol 'from_core_stdio' at src/internal/event_loop/stdio.mbt:17:4
[1]
```

```mooncram
$ run_moon_ide moon ide hover 'x' --loc 'src/internal/event_loop/stdio.mbt:18:3'
No hover information found for symbol 'x' at src/internal/event_loop/stdio.mbt:18:3
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
    
  ignore(@coroutine.Coroutine::wake)
  ignore(@event_loop.Timer::new)
```

```mooncram
$ run_moon_ide moon ide hover 'Coroutine' --loc 'src/js_async/unimplemented.mbt:18:21'
///|
#coverage.skip
let _ignore_unused_import : Unit = {
  ignore(@coroutine.Coroutine::wake)
         ^^^^^^^^^^^^^^^^^^^^
         ```moonbit
         struct @coroutine.Coroutine {
           loc: SourceLoc
           // private fields
         }
         ```
  ignore(@event_loop.Timer::new)
}
```

```mooncram
$ run_moon_ide moon ide hover 'buf' --loc 'src/pipe/read_exactly_test.mbt:17:7'
///|
async test "read_exactly" {
  let buf = StringBuilder()
      ^^^
      ```moonbit
      StringBuilder
      ```
  fn log(msg) {
    buf..write_string(msg).write_char('\n')
```

```mooncram
$ run_moon_ide moon ide hover 'log' --loc 'src/pipe/read_exactly_test.mbt:18:6'
///|
async test "read_exactly" {
  let buf = StringBuilder()
  fn log(msg) {
     ^^^
     ```moonbit
     (String) -> Unit
     ```
    buf..write_string(msg).write_char('\n')
  }
```

```mooncram
$ run_moon_ide moon ide hover '_ignore_unused_import' --loc 'src/pipe/unimplemented_test.mbt:17:5' --target js
///|
#cfg(not(target="native"))
let _ignore_unused_import : Unit = {
    ^^^^^^^^^^^^^^^^^^^^^
    ```moonbit
    Unit
    ```
    ---
    
  ignore(@async.sleep)
  ignore(@utf8.encode(""))
```

```mooncram
$ run_moon_ide moon ide hover 'sleep' --loc 'src/pipe/unimplemented_test.mbt:18:17' --target js
///|
#cfg(not(target="native"))
let _ignore_unused_import : Unit = {
  ignore(@async.sleep)
         ^^^^^^^^^^^^
         ```moonbit
         async fn @moonbitlang/async.sleep(duration : Int) -> Unit noraise
         ```
  ignore(@utf8.encode(""))
  ignore((f : async () -> Unit) => @test_util.assert_raise_async(f))
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
$ run_moon_ide moon ide hover 'platform' --loc 'src/socket/reuse_port_test.mbt:21:20'
  // and MacOS too, but there which socket accepts a given connection is
  // unspecified, so there is nothing to observe. `#cfg(platform=..)` cannot
  // express this — it only knows `windows` — so the check is made at runtime.
  if !(@event_loop.platform is Linux) {
       ^^^^^^^^^^^^^^^^^^^^
       ```moonbit
       let @moonbitlang/async/internal/event_loop.platform : @moonbitlang/async/types.Platform
       ```
    return
  }
```

```mooncram
$ run_moon_ide moon ide hover 'Linux' --loc 'src/socket/reuse_port_test.mbt:21:32'
  // and MacOS too, but there which socket accepts a given connection is
  // unspecified, so there is nothing to observe. `#cfg(platform=..)` cannot
  // express this — it only knows `windows` — so the check is made at runtime.
  if !(@event_loop.platform is Linux) {
                               ^^^^^
                               ```moonbit
                               @moonbitlang/async/types.Platform
                               ```
    return
  }
```

```mooncram
$ run_moon_ide moon ide hover 'unimplemented' --loc 'src/socket/unimplemented.mbt:19:9' --target js
/// This package currently does not support JavaScript backend
#cfg(not(any(target="native", target="wasm")))
#coverage.skip
pub let unimplemented : Unit = {
        ^^^^^^^^^^^^^
        ```moonbit
        Unit
        ```
        ---
        
         This package currently does not support JavaScript backend
  ignore(() => @string.parse_int("0"))
  ignore(@io.pipe)
```

```mooncram
$ run_moon_ide moon ide hover 'parse_int' --loc 'src/socket/unimplemented.mbt:20:24' --target js
#cfg(not(any(target="native", target="wasm")))
#coverage.skip
pub let unimplemented : Unit = {
  ignore(() => @string.parse_int("0"))
               ^^^^^^^^^^^^^^^^^
               ```moonbit
               fn @moonbitlang/core/string.parse_int(str : StringView, base? : Int) -> Int raise
               ```
               ---
               
                Parse a string in the given base (0, 2 to 36), return a Int number or an error.
                If the `base` argument is 0, the base will be inferred by the prefix.
  ignore(@io.pipe)
  ignore(@event_loop.Timer::new)
```
