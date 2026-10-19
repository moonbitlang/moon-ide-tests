# async peek-def

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\async' moon ide peek-def 'log' --loc 'src\aqueue\blocking_test.mbt:17:7'
Definition found at file <WORKDIR>/src\aqueue\blocking_test.mbt
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
$ run_moon_ide '..\..\..\fixtures\repos\async' moon ide peek-def 'with_task_group' --loc 'src\aqueue\blocking_test.mbt:18:10'
Definition found at file <WORKDIR>/src\task_group.mbt
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
$ run_moon_ide '..\..\..\fixtures\repos\async' moon ide peek-def 'fstatx_sync' --loc 'src\internal\event_loop\stdio.mbt:18:15'
Definition found at file <WORKDIR>/src\internal\event_loop\stdio.mbt
   | // limitations under the License.
   | 
   | ///|
   | #cfg(target="native")
   | #borrow(buf)
18 | extern "C" fn fstatx_sync(
   |               ^^^^^^^^^^^
   |   fd : @fd_util.Fd,
   |   request : UInt32,
   |   buf : FixedArray[Byte],
   |   buf_len : Int32,
   | ) -> Int32 = "moonbitlang_async_fstatx_sync"
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
$ run_moon_ide '..\..\..\fixtures\repos\async' moon ide peek-def 'fd' --loc 'src\internal\event_loop\stdio.mbt:19:3'
Definition found at file <WORKDIR>/src\internal\event_loop\stdio.mbt
   | 
   | ///|
   | #cfg(target="native")
   | #borrow(buf)
   | extern "C" fn fstatx_sync(
19 |   fd : @fd_util.Fd,
   |   ^^
   |   request : UInt32,
   |   buf : FixedArray[Byte],
   |   buf_len : Int32,
   | ) -> Int32 = "moonbitlang_async_fstatx_sync"
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
$ run_moon_ide '..\..\..\fixtures\repos\async' moon ide peek-def '_ignore_unused_import' --loc 'src\internal\event_loop\unimplemented_test.mbt:17:5' --target js
Definition found at file <WORKDIR>/src\internal\event_loop\unimplemented_test.mbt
   | // See the License for the specific language governing permissions and
   | // limitations under the License.
   | 
   | ///|
   | #cfg(not(any(target="native", target="wasm")))
17 | let _ignore_unused_import : Unit = {
   |     ^^^^^^^^^^^^^^^^^^^^^
   |   ignore(@async.sleep)
   |   ignore(@fs.unimplemented)
   |   ignore(@utf8.encode(""))
   |   ignore(@io.Encoding::UTF8)
   | }
   | 
   | ///|
   | #cfg(target="wasm")
   | let _ignore_pipe_import : Unit = ignore(@pipe.pipe)
   | 
   | ///|
   | #cfg(not(any(target="native", target="wasm")))
   | let _ignore_pipe_import : Unit = ignore(@pipe.unimplemented)
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\async' moon ide peek-def 'sleep' --loc 'src\internal\event_loop\unimplemented_test.mbt:18:17' --target js
Definition found at file <WORKDIR>/src\timer.mbt
   | 
   | ///|
   | /// `sleep` will wait for the given time (in milliseconds) before returning.
   | /// Other task can still run while current task is sleeping.
   | /// If current task is cancelled, `sleep` will return early with an error.
19 | pub using @event_loop {sleep}
   |                        ^^^^^
   | 
   | ///|
   | priv enum TimerState {
   |   // The timer is active, and there is some one waiting for it
   |   Running(@event_loop.Timer)
   |   // The timer is active, but no one is waiting for it.
   |   // So we do not keep track of the timer in the event loop to save resource
   |   Detached
   |   // The timer has terminated normally
   |   Terminated
   |   // The timer is manually cancelled
   |   Cancelled(Error)
   | }
   | 
Definition found at file <WORKDIR>/src\internal\event_loop\timer.js.mbt
   | ///|
   | pub extern "js" fn Timer::cancel(self : Timer) =
   |   #| (timer) => clearTimeout(timer)
   | 
   | ///|
36 | pub async fn sleep(duration : Int32) -> Unit noraise {
   |              ^^^^^
   |   let coro = @coroutine.current_coroutine()
   |   let timer = Timer::new(duration, () => coro.wake())
   |   defer timer.cancel()
   |   @coroutine.suspend()
   | }
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\async' moon ide peek-def '_ignore_unused_import' --loc 'src\js_async\unimplemented.mbt:17:5'
Definition found at file <WORKDIR>/src\js_async\unimplemented.mbt
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
$ run_moon_ide '..\..\..\fixtures\repos\async' moon ide peek-def 'Coroutine' --loc 'src\js_async\unimplemented.mbt:18:21'
Definition found at file <WORKDIR>/src\internal\coroutine\coroutine.mbt
   |   Running
   |   Suspend((SuspendResult) -> Unit)
   | }
   | 
   | ///|
31 | pub struct Coroutine {
   |            ^^^^^^^^^
   |   priv coro_id : Int32
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
$ run_moon_ide '..\..\..\fixtures\repos\async' moon ide peek-def 'buf' --loc 'src\pipe\read_exactly_test.mbt:17:7'
Definition found at file <WORKDIR>/src\pipe\read_exactly_test.mbt
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
$ run_moon_ide '..\..\..\fixtures\repos\async' moon ide peek-def 'log' --loc 'src\pipe\read_exactly_test.mbt:18:6'
Definition found at file <WORKDIR>/src\pipe\read_exactly_test.mbt
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
$ run_moon_ide '..\..\..\fixtures\repos\async' moon ide peek-def '_ignore_unused_import' --loc 'src\pipe\unimplemented_test.mbt:17:5' --target js
Definition found at file <WORKDIR>/src\pipe\unimplemented_test.mbt
   | // See the License for the specific language governing permissions and
   | // limitations under the License.
   | 
   | ///|
   | #cfg(not(target="native"))
17 | let _ignore_unused_import : Unit = {
   |     ^^^^^^^^^^^^^^^^^^^^^
   |   ignore(@async.sleep)
   |   ignore(@utf8.encode(""))
   |   ignore((f : async () -> Unit) => @test_util.assert_raise_async(f))
   | }
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\async' moon ide peek-def 'sleep' --loc 'src\pipe\unimplemented_test.mbt:18:17' --target js
Definition found at file <WORKDIR>/src\timer.mbt
   | 
   | ///|
   | /// `sleep` will wait for the given time (in milliseconds) before returning.
   | /// Other task can still run while current task is sleeping.
   | /// If current task is cancelled, `sleep` will return early with an error.
19 | pub using @event_loop {sleep}
   |                        ^^^^^
   | 
   | ///|
   | priv enum TimerState {
   |   // The timer is active, and there is some one waiting for it
   |   Running(@event_loop.Timer)
   |   // The timer is active, but no one is waiting for it.
   |   // So we do not keep track of the timer in the event loop to save resource
   |   Detached
   |   // The timer has terminated normally
   |   Terminated
   |   // The timer is manually cancelled
   |   Cancelled(Error)
   | }
   | 
Definition found at file <WORKDIR>/src\internal\event_loop\timer.js.mbt
   | ///|
   | pub extern "js" fn Timer::cancel(self : Timer) =
   |   #| (timer) => clearTimeout(timer)
   | 
   | ///|
36 | pub async fn sleep(duration : Int32) -> Unit noraise {
   |              ^^^^^
   |   let coro = @coroutine.current_coroutine()
   |   let timer = Timer::new(duration, () => coro.wake())
   |   defer timer.cancel()
   |   @coroutine.suspend()
   | }
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\async' moon ide peek-def 'ReadFromProcess' --loc 'src\process\redirect.mbt:17:8'
Definition found at file <WORKDIR>/src\process\redirect.mbt
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
$ run_moon_ide '..\..\..\fixtures\repos\async' moon ide peek-def 'io' --loc 'src\process\redirect.mbt:18:3'
Definition found at file <WORKDIR>/src\process\redirect.mbt
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
$ run_moon_ide '..\..\..\fixtures\repos\async' moon ide peek-def 'platform' --loc 'src\socket\reuse_port_test.mbt:21:20'
Definition found at file <WORKDIR>/src\internal\event_loop\event_loop.mbt
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
   |   max_worker_count : Int32
   |   mut job_id : Int32
   |   job_queue : Set[QueuedJob]
   |   idle_workers : @deque.Deque[Worker]
   |   running_workers : Map[Int32, Worker]
   |   jobs : Map[Int32, @coroutine.Coroutine]
Definition found at file <WORKDIR>/src\internal\env_util\env_util.mbt
   | #unsafe_skip_stub_check
   | fn get_platform() -> Platform = "moonbitlang/async" "runtime/get_platform"
   | 
   | ///|
   | #cfg(any(target="native", target="wasm"))
42 | pub let platform : Platform = get_platform()
   |         ^^^^^^^^
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\async' moon ide peek-def 'Linux' --loc 'src\socket\reuse_port_test.mbt:21:32'
Definition found at file <WORKDIR>/src\types\types.mbt
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
$ run_moon_ide '..\..\..\fixtures\repos\async' moon ide peek-def 'unimplemented' --loc 'src\socket\unimplemented.mbt:19:9' --target js
Definition found at file <WORKDIR>/src\socket\unimplemented.mbt
   | 
   | ///|
   | /// This package currently does not support JavaScript backend
   | #cfg(not(any(target="native", target="wasm")))
   | #coverage.skip
19 | pub let unimplemented : Unit = {
   |         ^^^^^^^^^^^^^
   |   ignore(() => @string.parse_int("0"))
   |   ignore(@io.pipe)
   |   ignore(@event_loop.Timer::new)
   |   ignore(@async.sleep)
   |   ignore(@os_error.unimplemented)
   |   ignore(@fd_util.unimplemented)
   |   ignore(@c_buffer.unimplemented)
   |   ignore(@os_string.unimplemented)
   | }
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\async' moon ide peek-def 'parse_int' --loc 'src\socket\unimplemented.mbt:20:24' --target js
Definition found at file <MOON_HOME>/lib\core\string\strconv.mbt
   | // limitations under the License.
   | 
   | ///|
   | pub using @internal/strconv {
   |   parse_int64,
18 |   parse_int,
   |   ^^^^^^^^^
   |   parse_uint64,
   |   parse_uint,
   |   parse_bool,
   |   parse_double,
   | }
Definition found at file <MOON_HOME>/lib\core\internal\strconv\strconv_int.mbt
    | }
    | 
    | ///|
    | /// Parse a string in the given base (0, 2 to 36), return a Int number or an error.
    | /// If the `base` argument is 0, the base will be inferred by the prefix.
148 | pub fn parse_int(str : StringView, base? : Int = 0) -> Int raise {
    |        ^^^^^^^^^
    |   let n = parse_int64(str, base~)
    |   if n < INT_MIN.to_int64() || n > INT_MAX.to_int64() {
    |     range_err()
    |   }
    |   n.to_int()
    | }
    | 
    | // Check whether the underscores are correct.
    | // Underscores must appear only between digits or between a base prefix and a digit.
    | 
    | ///|
    | fn check_underscore(str : StringView) -> Bool {
    |   // Fast path: underscores are rare in practice. Without any underscore the
    |   // per-character scan below can never reach a `break false` arm (those all
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\async' moon ide peek-def '_ignore_unused_import' --loc 'src\tls\unimplemented_test.mbt:17:5' --target js
Definition found at file <WORKDIR>/src\tls\unimplemented_test.mbt
   | // See the License for the specific language governing permissions and
   | // limitations under the License.
   | 
   | ///|
   | #cfg(not(any(target="native", target="wasm")))
17 | let _ignore_unused_import : Unit = {
   |     ^^^^^^^^^^^^^^^^^^^^^
   |   ignore(@utf8.encode(""))
   |   ignore(@async.sleep)
   |   ignore(@socket.unimplemented)
   |   ignore((f : async () -> Unit) => @test_util.assert_raise_async(f))
   | }
   | 
   | ///|
   | #cfg(target="wasm")
   | let _ignore_pipe_import : Unit = ignore(@pipe.pipe)
   | 
   | ///|
   | #cfg(not(any(target="native", target="wasm")))
   | let _ignore_pipe_import : Unit = ignore(@pipe.unimplemented)
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\async' moon ide peek-def 'encode' --loc 'src\tls\unimplemented_test.mbt:18:16' --target js
Definition found at file <MOON_HOME>/lib\core\encoding\utf8\encode_js.mbt
   | ///|
   | /// Encodes a string into a UTF-8 byte array.
   | ///
   | /// Unpaired surrogates are replaced with U+FFFD, matching `TextEncoder`.
   | /// The other backends panic on them instead.
44 | pub fn encode(str : StringView, bom? : Bool = false) -> Bytes {
   |        ^^^^^^
   |   encode_utf8_js(str.data(), str.start_offset(), str.length(), bom)
   | }
```
