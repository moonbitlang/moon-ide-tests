# async peek-def

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
$ run_moon_ide moon ide peek-def 'log' --loc 'src/aqueue/blocking_test.mbt:17:7'
Definition found at file <WORKDIR>/src/aqueue/blocking_test.mbt
   | // See the License for the specific language governing permissions and
   | // limitations under the License.
   | 
   | ///|
   | async test "blocking unbuffered" {
17 |   let log = []
   |       ^^^
   |   @async.with_task_group() <| group => {
   |     let q = @async.Queue(kind=Blocking(1))
   |     group.spawn_bg() <| () => {
   |       for i in 0..<3 {
   |         q.put(i)
   |         log.push("put(\{i})")
   |       }
   |     }
   |     group.spawn_bg() <| () => {
   |       for _ in 0..<3 {
   |         let x = q.get()
   |         log.push("get() => \{x}")
   |         @async.sleep(100)
   |       }
```

```mooncram
$ run_moon_ide moon ide peek-def 'with_task_group' --loc 'src/aqueue/blocking_test.mbt:18:10'
Definition found at file <WORKDIR>/src/task_group.mbt
    | /// `with_task_group` exits after all the whole group terminates,
    | /// which means all child tasks in the group have terminated, including `f`.
    | ///
    | /// If all children task terminate successfully,
    | /// `with_task_group` will return the result of `f`.
223 | pub async fn[X] with_task_group(f : async (TaskGroup[X]) -> X) -> X {
    |                 ^^^^^^^^^^^^^^^
    |   let tg = {
    |     children: Set([]),
    |     parent: @coroutine.current_coroutine(),
    |     waiting: 0,
    |     state: Running,
    |     result: None,
    |     group_defer: [],
    |   }
    |   tg.spawn_bg() <| () => {
    |     let value = f(tg)
    |     if tg.result is None {
    |       tg.result = Some(value)
    |     }
    |   }
```

```mooncram
$ run_moon_ide moon ide peek-def 'mkfifo' --loc 'src/fs/named_pipe_test.mbt:18:15'
Definition found at file <WORKDIR>/src/fs/named_pipe_test.mbt
   | // limitations under the License.
   | 
   | ///|
   | #cfg(not(platform="windows"))
   | #borrow(path)
18 | extern "C" fn mkfifo(path : @os_string.OsString, mode : Int) -> Int = "mkfifo"
   |               ^^^^^^
   | 
   | ///|
   | #cfg(not(platform="windows"))
   | async test "cancel named fifo open" {
   |   @async.with_task_group() <| group => {
   |     let path = "_build/cancel_open_test"
   |     if mkfifo(@os_string.encode(path), 0o644) < 0 {
   |       @os_error.check_errno("mkfifo")
   |     }
   |     group.add_defer(() => @fs.remove(path))
   |     let result = @async.with_timeout_opt(500, () => {
   |       @fs.open(path, mode=ReadOnly).close()
   |     })
   |     debug_inspect(result, content="None")
```

```mooncram
$ run_moon_ide moon ide peek-def 'path' --loc 'src/fs/named_pipe_test.mbt:18:22'
Definition found at file <WORKDIR>/src/fs/named_pipe_test.mbt
   | // limitations under the License.
   | 
   | ///|
   | #cfg(not(platform="windows"))
   | #borrow(path)
18 | extern "C" fn mkfifo(path : @os_string.OsString, mode : Int) -> Int = "mkfifo"
   |                      ^^^^
   | 
   | ///|
   | #cfg(not(platform="windows"))
   | async test "cancel named fifo open" {
   |   @async.with_task_group() <| group => {
   |     let path = "_build/cancel_open_test"
   |     if mkfifo(@os_string.encode(path), 0o644) < 0 {
   |       @os_error.check_errno("mkfifo")
   |     }
   |     group.add_defer(() => @fs.remove(path))
   |     let result = @async.with_timeout_opt(500, () => {
   |       @fs.open(path, mode=ReadOnly).close()
   |     })
   |     debug_inspect(result, content="None")
```

```mooncram
$ run_moon_ide moon ide peek-def 'IoHandle' --loc 'src/internal/event_loop/io_unix.mbt:17:14'
Definition found at file <WORKDIR>/src/internal/event_loop/io.mbt
   | }
   | 
   | ///|
   | /// A managed file descriptor/`HANDLE`,
   | /// capable of performing async IO operations.
27 | struct IoHandle {
   |        ^^^^^^^^
   |   mut fd : @fd_util.Fd
   |   kind : @fd_util.FileKind
   |   /// - `is_async=true`: support native async operations through the event bus.
   |   ///   This usually means the fd is non blocking (Unix) or overlapped (Windows)
   |   /// - `is_async=false`: all operations are blocking and go through the thread pool
   |   is_async : Bool
   |   mut read : IoStatus
   |   /// The current offset for reading.
   |   /// A negative value indicates that the underlying object does not support random access.
   |   ///
   |   /// We manually maintain `read_offset`,
   |   /// because the semantic of native file pointer is undesirable:
   |   ///
   |   /// - On Unix-like systems, read/write share the same file pointer.
```

```mooncram
$ run_moon_ide moon ide peek-def 'wait_read' --loc 'src/internal/event_loop/io_unix.mbt:17:24'
Definition found at file <WORKDIR>/src/internal/event_loop/io_unix.mbt
   | // See the License for the specific language governing permissions and
   | // limitations under the License.
   | 
   | ///|
   | #cfg(not(platform="windows"))
17 | pub async fn IoHandle::wait_read(handle : IoHandle) -> Unit {
   |                        ^^^^^^^^^
   |   guard @fd_util.fd_is_valid(handle.fd) else {
   |     abort("file descriptor already closed")
   |   }
   |   guard handle.read is Idle
   |   handle.read = Waiting(@coroutine.current_coroutine())
   |   defer {
   |     handle.read = Idle
   |   }
   |   @coroutine.suspend()
   | }
   | 
   | ///|
   | #cfg(not(platform="windows"))
   | async fn IoHandle::wait_write(handle : IoHandle) -> Unit {
```

```mooncram
$ run_moon_ide moon ide peek-def 'kind_of_fd_sync_ffi' --loc 'src/internal/event_loop/stdio.mbt:17:15'
Definition found at file <WORKDIR>/src/internal/event_loop/stdio.mbt
   | // See the License for the specific language governing permissions and
   | // limitations under the License.
   | 
   | ///|
   | #cfg(target="native")
17 | extern "C" fn kind_of_fd_sync_ffi(fd : @fd_util.Fd) -> Int = "moonbitlang_async_kind_of_fd"
   |               ^^^^^^^^^^^^^^^^^^^
   | 
   | ///|
   | #cfg(target="wasm")
   | #unsafe_skip_stub_check
   | fn kind_of_fd_sync_ffi(fd : @fd_util.Fd) -> Int = "moonbitlang/async" "fd_util/kind_of_fd"
   | 
   | ///|
   | fn kind_of_fd_sync(
   |   fd : @fd_util.Fd,
   |   context~ : String,
   | ) -> @fd_util.FileKind raise {
   |   let kind = kind_of_fd_sync_ffi(fd)
   |   if kind < 0 {
   |     @os_error.check_errno(context)
```

```mooncram
$ run_moon_ide moon ide peek-def 'fd' --loc 'src/internal/event_loop/stdio.mbt:17:35'
Definition found at file <WORKDIR>/src/internal/event_loop/stdio.mbt
   | // See the License for the specific language governing permissions and
   | // limitations under the License.
   | 
   | ///|
   | #cfg(target="native")
17 | extern "C" fn kind_of_fd_sync_ffi(fd : @fd_util.Fd) -> Int = "moonbitlang_async_kind_of_fd"
   |                                   ^^
   | 
   | ///|
   | #cfg(target="wasm")
   | #unsafe_skip_stub_check
   | fn kind_of_fd_sync_ffi(fd : @fd_util.Fd) -> Int = "moonbitlang/async" "fd_util/kind_of_fd"
   | 
   | ///|
   | fn kind_of_fd_sync(
   |   fd : @fd_util.Fd,
   |   context~ : String,
   | ) -> @fd_util.FileKind raise {
   |   let kind = kind_of_fd_sync_ffi(fd)
   |   if kind < 0 {
   |     @os_error.check_errno(context)
```

```mooncram
$ run_moon_ide moon ide peek-def '_ignore_unused_import' --loc 'src/js_async/unimplemented.mbt:17:5'
Definition found at file <WORKDIR>/src/js_async/unimplemented.mbt
   | // See the License for the specific language governing permissions and
   | // limitations under the License.
   | 
   | ///|
   | #coverage.skip
17 | let _ignore_unused_import : Unit = {
   |     ^^^^^^^^^^^^^^^^^^^^^
   |   ignore(@coroutine.spawn)
   |   ignore(@event_loop.Timer::new)
   | }
   | 
   | ///|
   | /// A JavaScript promise that resolves to a value of type `X`
   | #external
   | #internal(unimplemented, "unimplemented in native backend")
   | #coverage.skip
   | pub type Promise[X]
   | 
   | ///|
   | /// A JavaScript exception wrapped in MoonBit error
   | #internal(unimplemented, "unimplemented in native backend")
```

```mooncram
$ run_moon_ide moon ide peek-def 'spawn' --loc 'src/js_async/unimplemented.mbt:18:21'
Definition found at file <WORKDIR>/src/internal/coroutine/coroutine.mbt
    |     coro.state = Suspend(ok_cont~, err_cont~)
    |   }
    | }
    | 
    | ///|
106 | pub fn spawn(f : async () -> Unit) -> Coroutine {
    |        ^^^^^
    |   scheduler.coro_id += 1
    |   let coro = {
    |     state: Running,
    |     ready: true,
    |     shielded: true,
    |     downstream: Set([]),
    |     coro_id: scheduler.coro_id,
    |     cancelled: false,
    |   }
    |   fn run(_) {
    |     run_async() <| () => {
    |       coro.shielded = false
    |       try f() catch {
    |         err => coro.state = Fail(err)
```

```mooncram
$ run_moon_ide moon ide peek-def 'buf' --loc 'src/pipe/read_exactly_test.mbt:17:7'
Definition found at file <WORKDIR>/src/pipe/read_exactly_test.mbt
   | // See the License for the specific language governing permissions and
   | // limitations under the License.
   | 
   | ///|
   | async test "read_exactly" {
17 |   let buf = StringBuilder::new()
   |       ^^^
   |   fn log(msg) {
   |     buf..write_string(msg).write_char('\n')
   |   }
   | 
   |   @async.with_task_group() <| root => {
   |     let (r, w) = @pipe.pipe()
   |     // reader
   |     root.spawn_bg() <| () => {
   |       defer r.close()
   |       let msg1 = r.read_exactly(4) |> @utf8.decode
   |       log("first message: \{msg1}")
   |       let msg2 = r.read_exactly(4) |> @utf8.decode
   |       log("second message: \{msg2}")
   |       let msg3 = r.read_exactly(4) |> @utf8.decode
```

```mooncram
$ run_moon_ide moon ide peek-def 'new' --loc 'src/pipe/read_exactly_test.mbt:17:28'
Definition found at file <MOON_HOME>/lib/core/builtin/stringbuilder_buffer.mbt
   | /// less than 1, a minimum capacity of 1 is used. Defaults to 0. It is the size of bytes, 
   | /// not the size of characters. `size_hint` may be ignored on some platforms, JS for example.
   | ///
   | /// Returns a new `StringBuilder` instance with the specified initial capacity.
   | ///
32 | #alias(new)
   |        ^^^
   | pub fn StringBuilder::StringBuilder(size_hint? : Int = 0) -> StringBuilder {
   |   let initial = if size_hint < 1 { 1 } else { (size_hint + 1) / 2 }
   |   let data : FixedArray[UInt16] = FixedArray::make(initial, 0)
   |   { data, len: 0 }
   | }
   | 
   | ///|
   | /// Return whether the given buffer is empty.
   | pub fn StringBuilder::is_empty(self : StringBuilder) -> Bool {
   |   self.len == 0
   | }
   | 
   | ///|
   | fn StringBuilder::grow_if_necessary(
Definition found at file <MOON_HOME>/lib/core/builtin/stringbuilder_buffer.mbt
   | /// not the size of characters. `size_hint` may be ignored on some platforms, JS for example.
   | ///
   | /// Returns a new `StringBuilder` instance with the specified initial capacity.
   | ///
   | #alias(new)
33 | pub fn StringBuilder::StringBuilder(size_hint? : Int = 0) -> StringBuilder {
   |                       ^^^^^^^^^^^^^
   |   let initial = if size_hint < 1 { 1 } else { (size_hint + 1) / 2 }
   |   let data : FixedArray[UInt16] = FixedArray::make(initial, 0)
   |   { data, len: 0 }
   | }
   | 
   | ///|
   | /// Return whether the given buffer is empty.
   | pub fn StringBuilder::is_empty(self : StringBuilder) -> Bool {
   |   self.len == 0
   | }
   | 
   | ///|
   | fn StringBuilder::grow_if_necessary(
   |   self : StringBuilder,
```

```mooncram
$ run_moon_ide moon ide peek-def '_ignore_unused_import' --loc 'src/pipe/unimplemented_test.mbt:17:5'
Error: could not find definition for symbol '_ignore_unused_import' at src/pipe/unimplemented_test.mbt:17:5
[1]
```

```mooncram
$ run_moon_ide moon ide peek-def 'sleep' --loc 'src/pipe/unimplemented_test.mbt:18:17'
Error: could not find definition for symbol 'sleep' at src/pipe/unimplemented_test.mbt:18:17
[1]
```

```mooncram
$ run_moon_ide moon ide peek-def 'ReadFromProcess' --loc 'src/process/redirect.mbt:17:8'
Definition found at file <WORKDIR>/src/process/redirect.mbt
   | // See the License for the specific language governing permissions and
   | // limitations under the License.
   | 
   | ///|
   | /// A temporary pipe used to read output from a spawned process
17 | struct ReadFromProcess {
   |        ^^^^^^^^^^^^^^^
   |   io : @event_loop.IoHandle
   |   read_buf : @io.ReaderBuffer
   | }
   | 
   | ///|
   | /// A temporary pipe used to write data to a spawned process
   | struct WriteToProcess(@event_loop.IoHandle)
   | 
   | ///|
   | /// Create a temporary pipe for reading from stdout/stderr of a process.
   | /// The return value is a pair `(r, w)`,
   | /// where `r` is a temporary pipe that can be used to read process output,
   | /// and `w` should be passed to `@process.run`.
   | ///
```

```mooncram
$ run_moon_ide moon ide peek-def 'io' --loc 'src/process/redirect.mbt:18:3'
Definition found at file <WORKDIR>/src/process/redirect.mbt
   | // limitations under the License.
   | 
   | ///|
   | /// A temporary pipe used to read output from a spawned process
   | struct ReadFromProcess {
18 |   io : @event_loop.IoHandle
   |   ^^
   |   read_buf : @io.ReaderBuffer
   | }
   | 
   | ///|
   | /// A temporary pipe used to write data to a spawned process
   | struct WriteToProcess(@event_loop.IoHandle)
   | 
   | ///|
   | /// Create a temporary pipe for reading from stdout/stderr of a process.
   | /// The return value is a pair `(r, w)`,
   | /// where `r` is a temporary pipe that can be used to read process output,
   | /// and `w` should be passed to `@process.run`.
   | ///
   | /// `w` is temporary: it can only be passed to one `@process.run` call.
```

```mooncram
$ run_moon_ide moon ide peek-def 'unimplemented' --loc 'src/socket/unimplemented.mbt:19:9'
Error: could not find definition for symbol 'unimplemented' at src/socket/unimplemented.mbt:19:9
[1]
```

```mooncram
$ run_moon_ide moon ide peek-def 'pipe' --loc 'src/socket/unimplemented.mbt:20:14'
Error: could not find definition for symbol 'pipe' at src/socket/unimplemented.mbt:20:14
[1]
```

```mooncram
$ run_moon_ide moon ide peek-def '_ignore_unused_import' --loc 'src/tls/unimplemented_test.mbt:17:5'
Error: could not find definition for symbol '_ignore_unused_import' at src/tls/unimplemented_test.mbt:17:5
[1]
```

```mooncram
$ run_moon_ide moon ide peek-def 'sleep' --loc 'src/tls/unimplemented_test.mbt:18:17'
Error: could not find definition for symbol 'sleep' at src/tls/unimplemented_test.mbt:18:17
[1]
```
