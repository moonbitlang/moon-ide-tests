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
    | /// which means all child tasks in the group have terminated, including `f`.
    | ///
    | /// If all children task terminate successfully,
    | /// `with_task_group` will return the result of `f`.
    | #callsite(autofill(loc))
231 | pub async fn[X] with_task_group(
    |                 ^^^^^^^^^^^^^^^
    |   f : async (TaskGroup[X]) -> X,
    |   loc~ : SourceLoc,
    | ) -> X {
    |   let tg = {
    |     children: Set([]),
    |     parent: @coroutine.current_coroutine(),
    |     waiting: 0,
    |     state: Running,
    |     result: None,
    |     group_defer: [],
    |   }
    |   tg.spawn_bg(loc~) <| () => {
    |     let value = f(tg)
    |     if tg.result is None {
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
   |   let path = "_build/cancel_open_test"
   |   if mkfifo(@os_string.encode(path), 0o644) < 0 {
   |     @os_error.check_errno("mkfifo")
   |   }
   |   defer @fs.remove(path)
   |   let result = @async.with_timeout_opt(500, () => {
   |     @fs.open(path, mode=ReadOnly).close()
   |   })
   |   debug_inspect(result, content="None")
   | }
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
   |   let path = "_build/cancel_open_test"
   |   if mkfifo(@os_string.encode(path), 0o644) < 0 {
   |     @os_error.check_errno("mkfifo")
   |   }
   |   defer @fs.remove(path)
   |   let result = @async.with_timeout_opt(500, () => {
   |     @fs.open(path, mode=ReadOnly).close()
   |   })
   |   debug_inspect(result, content="None")
   | }
```

```mooncram
$ run_moon_ide moon ide peek-def 'IoHandle' --loc 'src/internal/event_loop/io_unix.mbt:17:14'
Definition found at file <WORKDIR>/src/internal/event_loop/io.mbt
   | }
   | 
   | ///|
   | /// A managed file descriptor/`HANDLE`,
   | /// capable of performing async IO operations.
27 | pub struct IoHandle {
   |            ^^^^^^^^
   |   priv mut fd : @fd_util.Fd
   |   priv kind : @fd_util.FileKind
   |   /// - `is_async=true`: support native async operations through the event bus.
   |   ///   This usually means the fd is non blocking (Unix) or overlapped (Windows)
   |   /// - `is_async=false`: all operations are blocking and go through the thread pool
   |   priv is_async : Bool
   |   priv mut read : IoStatus
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
   |   guard! curr_loop.val is Some(evloop)
   |   guard @fd_util.fd_is_valid(handle.fd) else {
   |     abort("file descriptor already closed")
   |   }
   |   guard! handle.read is Idle
   |   handle.read = Waiting(@coroutine.current_coroutine())
   |   defer {
   |     handle.read = Idle
   |   }
   |   evloop.suspend()
   | }
   | 
   | ///|
   | #cfg(not(platform="windows"))
```

```mooncram
$ run_moon_ide moon ide peek-def 'fstatx_sync' --loc 'src/internal/event_loop/stdio.mbt:18:15'
Definition found at file <WORKDIR>/src/internal/event_loop/stdio.mbt
   | // limitations under the License.
   | 
   | ///|
   | #cfg(target="native")
   | #borrow(buf)
18 | extern "C" fn fstatx_sync(
   |               ^^^^^^^^^^^
   |   fd : @fd_util.Fd,
   |   request : UInt,
   |   buf : FixedArray[Byte],
   |   buf_len : Int,
   | ) -> Int = "moonbitlang_async_fstatx_sync"
   | 
   | ///|
   | #cfg(target="native")
   | fn kind_of_fd_sync(
   |   fd : @fd_util.Fd,
   |   context~ : String,
   | ) -> @fd_util.FileKind raise {
   |   let buf = FixedArray::make(16, b'\x00')
   |   if fstatx_sync(fd, STAT_FILE_KIND, buf, buf.length()) < 0 {
```

```mooncram
$ run_moon_ide moon ide peek-def 'fd' --loc 'src/internal/event_loop/stdio.mbt:19:3'
Definition found at file <WORKDIR>/src/internal/event_loop/stdio.mbt
   | 
   | ///|
   | #cfg(target="native")
   | #borrow(buf)
   | extern "C" fn fstatx_sync(
19 |   fd : @fd_util.Fd,
   |   ^^
   |   request : UInt,
   |   buf : FixedArray[Byte],
   |   buf_len : Int,
   | ) -> Int = "moonbitlang_async_fstatx_sync"
   | 
   | ///|
   | #cfg(target="native")
   | fn kind_of_fd_sync(
   |   fd : @fd_util.Fd,
   |   context~ : String,
   | ) -> @fd_util.FileKind raise {
   |   let buf = FixedArray::make(16, b'\x00')
   |   if fstatx_sync(fd, STAT_FILE_KIND, buf, buf.length()) < 0 {
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
   |   ignore(@coroutine.Coroutine::wake)
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
$ run_moon_ide moon ide peek-def 'Coroutine' --loc 'src/js_async/unimplemented.mbt:18:21'
Definition found at file <WORKDIR>/src/internal/coroutine/coroutine.mbt
   |   Running
   |   Suspend((SuspendResult) -> Unit)
   | }
   | 
   | ///|
31 | pub struct Coroutine {
   |            ^^^^^^^^^
   |   priv coro_id : Int
   |   priv mut state : State
   |   priv mut shielded : Bool
   |   priv mut cancelled : Bool
   |   priv mut ready : Bool
   |   priv downstream : Set[Coroutine]
   |   loc : SourceLoc
   | }
   | 
   | ///|
   | pub impl Eq for Coroutine with fn equal(c1, c2) {
   |   c1.coro_id == c2.coro_id
   | }
   | 
```

```mooncram
$ run_moon_ide moon ide peek-def 'buf' --loc 'src/pipe/read_exactly_test.mbt:17:7'
Definition found at file <WORKDIR>/src/pipe/read_exactly_test.mbt
   | // See the License for the specific language governing permissions and
   | // limitations under the License.
   | 
   | ///|
   | async test "read_exactly" {
17 |   let buf = StringBuilder()
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
$ run_moon_ide moon ide peek-def 'log' --loc 'src/pipe/read_exactly_test.mbt:18:6'
Definition found at file <WORKDIR>/src/pipe/read_exactly_test.mbt
   | // limitations under the License.
   | 
   | ///|
   | async test "read_exactly" {
   |   let buf = StringBuilder()
18 |   fn log(msg) {
   |      ^^^
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
   |       log("third message: \{msg3}")
```

```mooncram
$ run_moon_ide moon ide peek-def '_ignore_unused_import' --loc 'src/pipe/unimplemented_test.mbt:17:5'
Error: could not get package of loc src/pipe/unimplemented_test.mbt:17:5
[1]
```

```mooncram
$ run_moon_ide moon ide peek-def 'sleep' --loc 'src/pipe/unimplemented_test.mbt:18:17'
Error: could not get package of loc src/pipe/unimplemented_test.mbt:18:17
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
   | /// and `w` should be passed to `@process.run`, `@process.spawn` etc.
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
   | /// and `w` should be passed to `@process.run`, `@process.spawn` etc.
   | ///
   | /// `w` is temporary: it can only be passed to one `@process.run` call.
```

```mooncram
$ run_moon_ide moon ide peek-def 'platform' --loc 'src/socket/reuse_port_test.mbt:21:20'
Definition found at file <WORKDIR>/src/internal/event_loop/event_loop.mbt
   | // WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   | // See the License for the specific language governing permissions and
   | // limitations under the License.
   | 
   | ///|
16 | pub using @env_util {platform}
   |                      ^^^^^^^^
   | 
   | ///|
   | priv struct EventLoop {
   |   bus : EventBus
   |   fds : Map[@fd_util.Fd, IoHandle]
   |   extra : PlatformEventLoopExtra
   |   /// a special file descriptor used to indicate job completion message from thread pool
   |   notify_recv : @fd_util.Fd
   |   max_worker_count : Int
   |   mut job_id : Int
   |   job_queue : Set[QueuedJob]
   |   idle_workers : @deque.Deque[Worker]
   |   running_workers : Map[Int, Worker]
   |   jobs : Map[Int, @coroutine.Coroutine]
Definition found at file <WORKDIR>/src/internal/env_util/env_util.mbt
   | #unsafe_skip_stub_check
   | fn get_platform() -> Platform = "moonbitlang/async" "runtime/get_platform"
   | 
   | ///|
   | #cfg(any(target="native", target="wasm"))
53 | pub let platform : Platform = get_platform()
   |         ^^^^^^^^
```

```mooncram
$ run_moon_ide moon ide peek-def 'Linux' --loc 'src/socket/reuse_port_test.mbt:21:32'
Definition found at file <WORKDIR>/src/types/types.mbt
   | 
   | ///|
   | /// Current operating system running the program.
   | /// For Wasm backend, the actual operating system can only be known at runtime.
   | pub(all) enum Platform {
51 |   Linux = 0
   |   ^^^^^
   |   MacOS = 1
   |   Windows = 2
   | }
```

```mooncram
$ run_moon_ide moon ide peek-def 'unimplemented' --loc 'src/socket/unimplemented.mbt:19:9'
Error: could not find definition for symbol 'unimplemented' at src/socket/unimplemented.mbt:19:9
[1]
```

```mooncram
$ run_moon_ide moon ide peek-def 'parse_int' --loc 'src/socket/unimplemented.mbt:20:24'
Error: could not find definition for symbol 'parse_int' at src/socket/unimplemented.mbt:20:24
[1]
```
