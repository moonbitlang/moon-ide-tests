# async outline

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
$ run_moon_ide moon ide outline 'src/aqueue/blocking_test.mbt'
 16 |async test "blocking unbuffered" {
    |...
 40 |async test "blocking buffered" {
    |...
 65 |async test "blocking fairness" {
    |...
 96 |async test "blocking cancellation" {
    |...
124 |async test "blocking fairness2" {
    |...
158 |async test "blocking immediate cancellation" {
    |...
182 |async test "blocking zero buffered" {
    |...
207 |async test "zero buffered try_put" {
    |...
214 |test "blocking try_put" {
    |...
236 |async test "blocked zero buffered try_get" {
    |...
260 |async test "blocked zero buffered try_put" {
    |...
288 |async test "blocked zero buffered discard oldest try_get" {
    |...
310 |async test "blocked zero buffered discard oldest try_put" {
    |...
338 |async test "blocked zero buffered discard latest try_put" {
    |...

```

```mooncram
$ run_moon_ide moon ide outline 'src/fs/named_pipe_test.mbt'
 16 |#cfg(not(platform="windows"))
 17 |#borrow(path)
 18 |extern "C" fn mkfifo(path : @os_string.OsString, mode : Int) -> Int = "mkfifo"
    |...
 21 |#cfg(not(platform="windows"))
    |...
 37 |#cfg(platform="windows")
    |...
 58 |#cfg(not(platform="windows"))
    |...
 87 |#cfg(platform="windows")
    |...
122 |#cfg(platform="windows")
    |...

```

```mooncram
$ run_moon_ide moon ide outline 'src/internal/event_loop/io_unix.mbt'
 16 |#cfg(not(platform="windows"))
 17 |pub async fn IoHandle::wait_read(handle : IoHandle) -> Unit {
    |...
 31 |#cfg(not(platform="windows"))
 32 |async fn IoHandle::wait_write(handle : IoHandle) -> Unit {
    |...
 47 |#cfg(all(target="native", not(platform="windows")))
 48 |#borrow(buf)
 49 |extern "C" fn read_unix_ffi(
 50 |  fd : @fd_util.Fd,
 51 |  buf : FixedArray[Byte],
 52 |  offset~ : Int,
 53 |  len~ : Int,
 54 |) -> Int = "moonbitlang_async_read"
    |...
 57 |#cfg(target="wasm")
 58 |#unsafe_skip_stub_check
 59 |#borrow(buf)
 60 |fn read_unix_ffi(
 61 |  fd : @fd_util.Fd,
 62 |  buf : FixedArray[Byte],
 63 |  offset~ : Int,
 64 |  len~ : Int,
 65 |) -> Int = "moonbitlang/async" "io/read/unix"
    |...
 68 |#cfg(not(platform="windows"))
 69 |async fn IoHandle::read_via_event_bus_unix(
 70 |  handle : IoHandle,
 71 |  buf : FixedArray[Byte],
 72 |  offset~ : Int,
 73 |  len~ : Int,
 74 |  context~ : String,
 75 |) -> Int {
    |...
 96 |#cfg(all(target="native", not(platform="windows")))
 97 |async fn IoHandle::read_via_event_bus(
 98 |  handle : IoHandle,
 99 |  buf : FixedArray[Byte],
100 |  offset~ : Int,
101 |  len~ : Int,
102 |  context~ : String,
103 |) -> Int {
    |...
108 |#cfg(all(target="native", not(platform="windows")))
109 |#borrow(buf)
110 |extern "C" fn write_unix_ffi(
111 |  fd : @fd_util.Fd,
112 |  buf : Bytes,
113 |  offset~ : Int,
114 |  len~ : Int,
115 |) -> Int = "moonbitlang_async_write"
    |...
118 |#cfg(target="wasm")
119 |#unsafe_skip_stub_check
120 |#borrow(buf)
121 |fn write_unix_ffi(
122 |  fd : @fd_util.Fd,
123 |  buf : Bytes,
124 |  offset~ : Int,
125 |  len~ : Int,
126 |) -> Int = "moonbitlang/async" "io/write/unix"
    |...
129 |#cfg(not(platform="windows"))
130 |async fn IoHandle::write_via_event_bus_unix(
131 |  handle : IoHandle,
132 |  buf : Bytes,
133 |  offset~ : Int,
134 |  len~ : Int,
135 |  context~ : String,
136 |) -> Int {
    |...
157 |#cfg(all(target="native", not(platform="windows")))
158 |async fn IoHandle::write_via_event_bus(
159 |  handle : IoHandle,
160 |  buf : Bytes,
161 |  offset~ : Int,
162 |  len~ : Int,
163 |  context~ : String,
164 |) -> Int {
    |...

```

```mooncram
$ run_moon_ide moon ide outline 'src/internal/event_loop/stdio.mbt'
 16 |#cfg(target="native")
 17 |extern "C" fn kind_of_fd_sync_ffi(fd : @fd_util.Fd) -> Int = "moonbitlang_async_kind_of_fd"
    |...
 20 |#cfg(target="wasm")
 21 |#unsafe_skip_stub_check
 22 |fn kind_of_fd_sync_ffi(fd : @fd_util.Fd) -> Int = "moonbitlang/async" "fd_util/kind_of_fd"
    |...
 25 |fn kind_of_fd_sync(
 26 |  fd : @fd_util.Fd,
 27 |  context~ : String,
 28 |) -> @fd_util.FileKind raise {
    |...
 37 |#cfg(target="native")
 38 |extern "C" fn get_stdio_handle(id : Int) -> @fd_util.Fd = "moonbitlang_async_get_stdio_handle"
    |...
 41 |#cfg(target="wasm")
 42 |#unsafe_skip_stub_check
 43 |fn get_stdio_handle(id : Int) -> @fd_util.Fd = "moonbitlang/async" "stdio/get_stdio_handle"
    |...
 46 |let stdio_handles : Map[@fd_util.Fd, IoHandle] = Map([])
    |...
 49 |fn setup_stdio(id : Int, context~ : String) -> IoHandle raise {
    |...
 97 |pub let stdin : Result[IoHandle, Error] = try
    |...
106 |pub let stdout : Result[IoHandle, Error] = try
    |...
115 |pub let stderr : Result[IoHandle, Error] = try
    |...

```

```mooncram
$ run_moon_ide moon ide outline 'src/js_async/unimplemented.mbt'
 16 |#coverage.skip
    |...
 24 |#external
 25 |#internal(unimplemented, "unimplemented in native backend")
 26 |#coverage.skip
 27 |pub type Promise[X]
    |...
 31 |#internal(unimplemented, "unimplemented in native backend")
 32 |#coverage.skip
 33 |suberror JsError {
    |...
 38 |#internal(unimplemented, "unimplemented in native backend")
 39 |#coverage.skip
 40 |pub impl Show for JsError with fn output(self, _logger) {
    |...
 48 |#external
 49 |#internal(unimplemented, "unimplemented in native backend")
 50 |#coverage.skip
 51 |pub type AbortController
    |...
 55 |#external
 56 |#internal(unimplemented, "unimplemented in native backend")
 57 |#coverage.skip
 58 |pub type AbortSignal
    |...
 62 |#internal(unimplemented, "unimplemented in native backend")
 63 |#coverage.skip
 64 |pub fn AbortController::new() -> AbortController {
    |...
 71 |#internal(unimplemented, "unimplemented in native backend")
 72 |#coverage.skip
 73 |pub fn AbortController::signal(self : Self) -> AbortSignal {
    |...
 81 |#internal(unimplemented, "unimplemented in native backend")
 82 |#coverage.skip
 83 |pub fn AbortController::abort(self : Self) -> Unit {
    |...
 98 |#internal(unimplemented, "unimplemented in native backend")
 99 |#warnings("-unused_async")
100 |#coverage.skip
101 |pub async fn[X] Promise::wait(
102 |  promise : Promise[X],
103 |  abort_controller? : AbortController,
104 |) -> X {
    |...
122 |#internal(unimplemented, "unimplemented in native backend")
123 |#warnings("-unused_async")
124 |#coverage.skip
125 |pub async fn[X] run_promise(f : (AbortSignal) -> Promise[X]) -> X {
    |...
147 |#internal(unimplemented, "unimplemented in native backend")
148 |#warnings("-unused_async")
149 |#coverage.skip
150 |pub fn[X] Promise::from_async(
151 |  f : async () -> X,
152 |  abort_signal? : AbortSignal,
153 |) -> Promise[X] {
    |...
166 |#internal(unimplemented, "unimplemented in native backend")
167 |type JsReadableStream
    |...
176 |#internal(unimplemented, "unimplemented in native backend")
177 |type ReadableStream
    |...
184 |#internal(unimplemented, "unimplemented in native backend")
185 |#coverage.skip
186 |pub fn ReadableStream::from_js(stream : JsReadableStream) -> ReadableStream {
    |...
193 |#internal(unimplemented, "unimplemented in native backend")
194 |#coverage.skip
195 |pub fn ReadableStream::close(self : ReadableStream) -> Unit {
    |...
201 |#coverage.skip
202 |pub impl @io.Reader for ReadableStream with fn _get_internal_buffer(_) {
    |...
207 |#coverage.skip
208 |pub impl @io.Reader for ReadableStream with fn _direct_read(
209 |  _,
210 |  _,
211 |  offset~,
212 |  max_len~,
213 |) {
    |...
229 |#internal(unimplemented, "unimplemented in native backend")
230 |#coverage.skip
231 |pub fn JsReadableStream::new_pipe() -> (JsReadableStream, @io.PipeWrite) {
    |...

```

```mooncram
$ run_moon_ide moon ide outline 'src/pipe/read_exactly_test.mbt'
16 |async test "read_exactly" {
   |...
58 |async test "read_exactly failure" {
   |...

```

```mooncram
$ run_moon_ide moon ide outline 'src/pipe/unimplemented_test.mbt'
16 |#cfg(not(target="native"))
   |...

```

```mooncram
$ run_moon_ide moon ide outline 'src/process/redirect.mbt'
 17 |struct ReadFromProcess {
    |...
 24 |struct WriteToProcess(@event_loop.IoHandle)
    |...
 34 |pub fn read_from_process() -> (ReadFromProcess, &ProcessOutput) raise {
    |...
 54 |pub fn write_to_process() -> (&ProcessInput, WriteToProcess) raise {
    |...
 67 |pub fn ReadFromProcess::close(self : ReadFromProcess) -> Unit {
    |...
 72 |pub impl @io.Reader for ReadFromProcess with fn _get_internal_buffer(self) {
    |...
 77 |pub impl @io.Reader for ReadFromProcess with fn _direct_read(
 78 |  self,
 79 |  buf,
 80 |  offset~,
 81 |  max_len~,
 82 |) {
    |...
 92 |pub fn WriteToProcess::close(self : WriteToProcess) -> Unit {
    |...
 98 |pub impl @io.Writer for WriteToProcess with fn write_once(
 99 |  self,
100 |  buf,
101 |  offset~,
102 |  len~,
103 |) {
    |...
109 |fn @fs.CreateMode::to_int(self : @fs.CreateMode) -> Int = "%identity"
    |...
115 |#label_migration(create, fill=false, msg="the option `create` is deprecated, use `create_mode` and `permission` instead")
116 |#label_migration(truncate, fill=false, msg="the option `truncate` is deprecated, use `create_mode` instead")
117 |pub async fn redirect_to_file(
118 |  path : String,
119 |  append? : Bool = false,
120 |  create_mode? : @fs.CreateMode,
121 |  permission? : Int,
122 |  create? : Int,
123 |  truncate? : Bool = false,
124 |) -> &ProcessOutput {
    |...
154 |pub async fn redirect_from_file(path : String) -> &ProcessInput {
    |...
169 |trait ProcessInput {
    |...
175 |impl ProcessInput with fn after_spawn(_) {
    |...
180 |pub impl ProcessInput for @pipe.PipeRead with fn fd(self) {
    |...
185 |pub impl ProcessInput for @stdio.Input with fn fd(self) {
    |...
191 |trait ProcessOutput {
    |...
197 |impl ProcessOutput with fn after_spawn(_) {
    |...
202 |pub impl ProcessOutput for @pipe.PipeWrite with fn fd(self) {
    |...
207 |pub impl ProcessOutput for @stdio.Output with fn fd(self) {
    |...
212 |priv struct TempPipeRead {
    |...
218 |priv struct TempPipeWrite {
    |...
224 |impl ProcessOutput for TempPipeWrite with fn fd(self) {
    |...
229 |impl ProcessOutput for TempPipeWrite with fn after_spawn(self) {
    |...
237 |impl ProcessInput for TempPipeRead with fn fd(self) {
    |...
242 |impl ProcessInput for TempPipeRead with fn after_spawn(self) {
    |...
250 |priv struct RedirectToFile(@event_loop.IoHandle)
    |...
253 |impl ProcessOutput for RedirectToFile with fn fd(self) {
    |...
258 |impl ProcessOutput for RedirectToFile with fn after_spawn(self) {
    |...
263 |impl ProcessInput for RedirectToFile with fn fd(self) {
    |...
268 |impl ProcessInput for RedirectToFile with fn after_spawn(self) {
    |...

```

```mooncram
$ run_moon_ide moon ide outline 'src/socket/unimplemented.mbt'
17 |#cfg(not(target="native"))
   |...

```

```mooncram
$ run_moon_ide moon ide outline 'src/tls/unimplemented_test.mbt'
16 |#cfg(not(target="native"))
   |...
24 |#cfg(target="wasm")
   |...
28 |#cfg(not(any(target="native", target="wasm")))
   |...

```
