# async find-references new src\pipe\read_exactly_test.mbt:17:28

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\async' moon ide find-references 'new' --loc 'src\pipe\read_exactly_test.mbt:17:28'
Found 119 references for symbol 'new':
<MOON_HOME>/lib\core\builtin\stringbuilder_buffer.mbt:32:8-32:11:
   | ///
   | /// Returns a new `StringBuilder` instance with the specified initial capacity.
   | ///
32 | #alias(new)
   |        ^^^
   | pub fn StringBuilder::StringBuilder(size_hint? : Int = 0) -> StringBuilder {
   |   let initial = if size_hint < 1 { 1 } else { (size_hint + 1) / 2 }

<WORKDIR>/examples\http_file_server\server_wbtest.mbt:46:35-46:38:
   | 
   |   }
   | 
46 |   let client_log = StringBuilder::new()
   |                                   ^^^
   |   @async.with_task_group <| root => {
   |     let server = @http.Server(@socket.Addr::parse("127.0.0.1:0"))

<WORKDIR>/examples\tcp_ping_pong\main_wbtest.mbt:17:28-17:31:
   | 
   | ///|
   | async test "main" {
17 |   let log = StringBuilder::new()
   |                            ^^^
   |   fn println(msg) -> Unit {
   |     log..write_string(msg).write_string("\n")

<WORKDIR>/examples\udp_ping_pong\main_wbtest.mbt:17:28-17:31:
   | 
   | ///|
   | async test "main" {
17 |   let log = StringBuilder::new()
   |                            ^^^
   |   fn println(msg) -> Unit {
   |     log..write_string(msg).write_string("\n")

<WORKDIR>/src\allow_failure_test.mbt:17:28-17:31:
   | 
   | ///|
   | async test "allow_failure ignored" {
17 |   let buf = StringBuilder::new()
   |                            ^^^
   |   @async.with_task_group() <| root => {
   |     root.spawn_bg(allow_failure=true, () => raise Err)

<WORKDIR>/src\allow_failure_test.mbt:34:28-34:31:
   | 
   | ///|
   | async test "allow_failure waited" {
34 |   let buf = StringBuilder::new()
   |                            ^^^
   |   let err = @test_util.expect_error_async <| () => {
   |     @async.with_task_group(root => {

<WORKDIR>/src\allow_failure_test.mbt:54:28-54:31:
   | 
   | ///|
   | async test "allow_failure no error" {
54 |   let buf = StringBuilder::new()
   |                            ^^^
   |   @async.with_task_group(root => {
   |     root.spawn_bg(allow_failure=true) <| () => {

<WORKDIR>/src\aqueue\aqueue_test.mbt:17:28-17:31:
   | 
   | ///|
   | async test "aqueue basic" {
17 |   let log = StringBuilder::new()
   |                            ^^^
   |   @async.with_task_group() <| root => {
   |     let queue = @aqueue.Queue(kind=Unbounded)

<WORKDIR>/src\aqueue\aqueue_test.mbt:55:28-55:31:
   | 
   | ///|
   | async test "aqueue multi-reader" {
55 |   let log = StringBuilder::new()
   |                            ^^^
   |   @async.with_task_group() <| root => {
   |     let queue = @aqueue.Queue(kind=Unbounded)

<WORKDIR>/src\aqueue\aqueue_test.mbt:83:28-83:31:
   | 
   | ///|
   | async test "aqueue cancellation" {
83 |   let log = StringBuilder::new()
   |                            ^^^
   |   let queue : @aqueue.Queue[Int] = @aqueue.Queue(kind=Unbounded)
   |   @async.with_timeout(350, () => {

<WORKDIR>/src\aqueue\aqueue_test.mbt:109:28-109:31:
    | ///|
    | async test "aqueue cancellation no_swallow" {
    |   // `get` should not swallow the value
109 |   let log = StringBuilder::new()
    |                            ^^^
    |   @async.with_task_group() <| group => {
    |     let q = @aqueue.Queue(kind=Unbounded)

<WORKDIR>/src\aqueue\aqueue_test.mbt:130:28-130:31:
    | 
    | ///|
    | async test "aqueue fairness" {
130 |   let log = StringBuilder::new()
    |                            ^^^
    |   @async.with_task_group() <| root => {
    |     let queue = @aqueue.Queue(kind=Unbounded)

<WORKDIR>/src\aqueue\aqueue_test.mbt:166:28-166:31:
    | 
    | ///|
    | async test "aqueue fairness2" {
166 |   let log = StringBuilder::new()
    |                            ^^^
    |   @async.with_task_group() <| root => {
    |     let queue = @aqueue.Queue(kind=Unbounded)

<WORKDIR>/src\cancellation_test.mbt:17:28-17:31:
   | 
   | ///|
   | async test "manual cancel" {
17 |   let buf = StringBuilder::new()
   |                            ^^^
   |   @async.with_task_group(root => {
   |     let task = root.spawn(() => {

<WORKDIR>/src\cancellation_test.mbt:50:28-50:31:
   | 
   | ///|
   | async test "error propagation" {
50 |   let buf = StringBuilder::new()
   |                            ^^^
   |   let err = @test_util.expect_error_async <| () => {
   |     @async.with_task_group(root => {

<WORKDIR>/src\cancellation_test.mbt:87:28-87:31:
   | 
   | ///|
   | async test "multiple scope" {
87 |   let buf = StringBuilder::new()
   |                            ^^^
   |   @async.with_task_group() <| root => {
   |     root.spawn_bg() <| () => {

<WORKDIR>/src\cancellation_test.mbt:160:28-160:31:
    | 
    | ///|
    | async test "recursive cancel" {
160 |   let buf = StringBuilder::new()
    |                            ^^^
    |   @async.with_task_group(root => {
    |     root.spawn_bg() <| () => {

<WORKDIR>/src\cancellation_test.mbt:197:28-197:31:
    | 
    | ///|
    | async test "spawn directly error" {
197 |   let buf = StringBuilder::new()
    |                            ^^^
    |   let err = @test_util.expect_error_async <| () => {
    |     @async.with_task_group(root => {

<WORKDIR>/src\cancellation_test.mbt:224:28-224:31:
    | 
    | ///|
    | async test "error in cancellation" {
224 |   let log = StringBuilder::new()
    |                            ^^^
    |   let err = @test_util.expect_error_async <| () => {
    |     @async.with_task_group(root => {

<WORKDIR>/src\cancellation_test.mbt:250:28-250:31:
    | 
    | ///|
    | async test "immediately cancelled" {
250 |   let log = StringBuilder::new()
    |                            ^^^
    |   @async.with_task_group() <| root => {
    |     let task = root.spawn(() => {

<WORKDIR>/src\cond_var\cond_var_test.mbt:34:28-34:31:
   | 
   | ///|
   | async test "cond var cancellation no_swallow" {
34 |   let log = StringBuilder::new()
   |                            ^^^
   |   @async.with_task_group() <| root => {
   |     let cond = @cond_var.Cond()

<WORKDIR>/src\cond_var\cond_var_test.mbt:61:28-61:31:
   | 
   | ///|
   | async test "cond var fairness" {
61 |   let log = StringBuilder::new()
   |                            ^^^
   |   @async.with_task_group() <| root => {
   |     let cond = @cond_var.Cond()

<WORKDIR>/src\cond_var\cond_var_test.mbt:99:28-99:31:
   | 
   | ///|
   | async test "cond var broadcast" {
99 |   let log = StringBuilder::new()
   |                            ^^^
   |   @async.with_task_group() <| root => {
   |     let cond = @cond_var.Cond()

<WORKDIR>/src\cond_var\cond_var_test.mbt:124:28-124:31:
    | 
    | ///|
    | async test "cond var broadcast cancellation" {
124 |   let log = StringBuilder::new()
    |                            ^^^
    |   @async.with_task_group() <| root => {
    |     let cond = @cond_var.Cond()

<WORKDIR>/src\fs\tmpdir.mbt:59:31-59:34:
   |     hasher.combine_uint64(tmpdir_seed.uint64())
   |     hasher.combine_uint64(@env.now())
   |     let h = hasher.finalize().reinterpret_as_uint()
59 |     let path = StringBuilder::new()
   |                               ^^^
   |     path.write_string(tmp_base_path)
   |     path.write_stringview(prefix)

<WORKDIR>/src\fs\walk_test.mbt:32:28-32:31:
   | ///|
   | async test "walk parallel" {
   |   @async.sleep(300)
32 |   let log = StringBuilder::new()
   |                            ^^^
   |   let mut i = 0
   |   @fs.walk("test_directory", max_concurrency=2, (path, _) => {

<WORKDIR>/src\fs\walk_test.mbt:56:28-56:31:
   | 
   | ///|
   | async test "walk failure" {
56 |   let log = StringBuilder::new()
   |                            ^^^
   |   debug_inspect(
   |     @test_util.expect_error_async <| () => {

<WORKDIR>/src\fs\walk_test.mbt:79:28-79:31:
   | 
   | ///|
   | async test "walk allow_failure" {
79 |   let log = StringBuilder::new()
   |                            ^^^
   |   @fs.walk("test_directory", allow_failure=true, max_concurrency=1, (path, _) => {
   |     log.write_string("handling \{path}\n")

<WORKDIR>/src\group_defer_test.mbt:17:28-17:31:
   | 
   | ///|
   | async test "group defer basic" {
17 |   let log = StringBuilder::new()
   |                            ^^^
   |   @async.with_task_group() <| fn(root) {
   |     root.add_defer(() => log <+ "first group defer\n")

<WORKDIR>/src\group_defer_test.mbt:57:28-57:31:
   | 
   | ///|
   | async test "group defer error" {
57 |   let log = StringBuilder::new()
   |                            ^^^
   |   let err = @test_util.expect_error_async <| () => {
   |     @async.with_task_group(fn(root) {

<WORKDIR>/src\group_defer_test.mbt:100:28-100:31:
    | 
    | ///|
    | async test "group defer cancelled" {
100 |   let log = StringBuilder::new()
    |                            ^^^
    |   @async.with_task_group() <| root => {
    |     root.spawn_bg() <| () => {

<WORKDIR>/src\http\client_test.mbt:94:28-94:31:
   | 
   | ///|
   | async test "request streaming" {
94 |   let log = StringBuilder::new()
   |                            ^^^
   |   @async.with_task_group() <| group => {
   |     let port = test_server(group, log)

<WORKDIR>/src\http\parser_wbtest.mbt:36:28-36:31:
   | 
   | ///|
   | async test "read_request basic" {
36 |   let log = StringBuilder::new()
   |                            ^^^
   |   @async.with_task_group() <| root => {
   |     let (r, w) = @io.pipe()

<WORKDIR>/src\http\parser_wbtest.mbt:65:28-65:31:
   | 
   | ///|
   | async test "read_request fixed body" {
65 |   let log = StringBuilder::new()
   |                            ^^^
   |   @async.with_task_group() <| root => {
   |     let (r, w) = @io.pipe()

<WORKDIR>/src\http\parser_wbtest.mbt:122:28-122:31:
    | 
    | ///|
    | async test "read_request chunked" {
122 |   let log = StringBuilder::new()
    |                            ^^^
    |   @async.with_task_group() <| root => {
    |     let (r, w) = @io.pipe()

<WORKDIR>/src\http\parser_wbtest.mbt:158:28-158:31:
    | 
    | ///|
    | async test "read_request stream" {
158 |   let log = StringBuilder::new()
    |                            ^^^
    |   @async.with_task_group() <| root => {
    |     let (r, w) = @io.pipe()

<WORKDIR>/src\http\parser_wbtest.mbt:208:28-208:31:
    | 
    | ///|
    | async test "multiple request" {
208 |   let log = StringBuilder::new()
    |                            ^^^
    |   @async.with_task_group() <| root => {
    |     let (r, w) = @io.pipe()

<WORKDIR>/src\http\parser_wbtest.mbt:270:28-270:31:
    | 
    | ///|
    | async test "read_response basic" {
270 |   let log = StringBuilder::new()
    |                            ^^^
    |   @async.with_task_group() <| root => {
    |     let (r, w) = @io.pipe()

<WORKDIR>/src\http\parser_wbtest.mbt:301:28-301:31:
    | 
    | ///|
    | async test "read_response passthrough fallback (no length headers)" {
301 |   let log = StringBuilder::new()
    |                            ^^^
    |   @async.with_task_group() <| root => {
    |     let (r, w) = @io.pipe()

<WORKDIR>/src\http\parser_wbtest.mbt:338:28-338:31:
    | 
    | ///|
    | async test "read_response 204 No Content (no body)" {
338 |   let log = StringBuilder::new()
    |                            ^^^
    |   @async.with_task_group() <| root => {
    |     let (r, w) = @io.pipe()

<WORKDIR>/src\http\parser_wbtest.mbt:375:28-375:31:
    | 
    | ///|
    | async test "read_response 205 Reset Content (no body)" {
375 |   let log = StringBuilder::new()
    |                            ^^^
    |   @async.with_task_group() <| root => {
    |     let (r, w) = @io.pipe()

<WORKDIR>/src\http\parser_wbtest.mbt:412:28-412:31:
    | 
    | ///|
    | async test "read_response 304 Not Modified (no body)" {
412 |   let log = StringBuilder::new()
    |                            ^^^
    |   @async.with_task_group() <| root => {
    |     let (r, w) = @io.pipe()

<WORKDIR>/src\http\parser_wbtest.mbt:449:28-449:31:
    | 
    | ///|
    | async test "read_response 100 Continue (no body)" {
449 |   let log = StringBuilder::new()
    |                            ^^^
    |   @async.with_task_group() <| root => {
    |     let (r, w) = @io.pipe()

<WORKDIR>/src\http\parser_wbtest.mbt:481:28-481:31:
    | 
    | ///|
    | async test "read_response CONNECT 200 (no body, tunnel mode)" {
481 |   let log = StringBuilder::new()
    |                            ^^^
    |   @async.with_task_group() <| root => {
    |     let (r, w) = @io.pipe()

<WORKDIR>/src\http\parser_wbtest.mbt:515:28-515:31:
    | 
    | ///|
    | async test "read_response HEAD 200 (no body)" {
515 |   let log = StringBuilder::new()
    |                            ^^^
    |   @async.with_task_group() <| root => {
    |     let (r, w) = @io.pipe()

<WORKDIR>/src\internal\bytes_util\util.mbt:33:32-33:35:
   | /// }
   | /// ```
   | pub fn ascii_to_string(ascii : BytesView) -> String {
33 |   let builder = StringBuilder::new()
   |                                ^^^
   |   for byte in ascii {
   |     match byte {

<WORKDIR>/src\internal\coroutine\pause_test.mbt:17:28-17:31:
   | 
   | ///|
   | test "coroutine ping-pong" {
17 |   let log = StringBuilder::new()
   |                            ^^^
   |   let coro = @coroutine.spawn(() => {
   |     @async.with_task_group(group => {

<WORKDIR>/src\internal\event_loop\missing_close_test.mbt:17:28-17:31:
   | 
   | ///|
   | test "missing_close" {
17 |   let log = StringBuilder::new()
   |                            ^^^
   |   @event_loop.check_fd_leak.val = false
   |   @event_loop.with_event_loop() <| () => {

<WORKDIR>/src\internal\event_loop\worker_wbtest.mbt:35:28-35:31:
   | 
   | ///|
   | async test "worker basic" {
35 |   let log = StringBuilder::new()
   |                            ^^^
   |   @async.with_task_group() <| root => {
   |     root.spawn_bg() <| () => {

<WORKDIR>/src\internal\event_loop\worker_wbtest.mbt:60:28-60:31:
   | 
   | ///|
   | async test "worker multiple" {
60 |   let log = StringBuilder::new()
   |                            ^^^
   |   @async.with_task_group() <| root => {
   |     root.spawn_bg() <| () => {

<WORKDIR>/src\internal\event_loop\worker_wbtest.mbt:91:28-91:31:
   | 
   | ///|
   | async test "worker cancel1" {
91 |   let log = StringBuilder::new()
   |                            ^^^
   |   @async.with_task_group() <| root => {
   |     root.spawn_bg() <| () => {

<WORKDIR>/src\internal\event_loop\worker_wbtest.mbt:129:28-129:31:
    | 
    | ///|
    | async test "worker cancel2" {
129 |   let log = StringBuilder::new()
    |                            ^^^
    |   @async.with_task_group() <| root => {
    |     root.spawn_bg() <| () => {

<WORKDIR>/src\io\README.mbt.md:420:28-420:31:
    | 
    | ///|
    | async test "write_reader - copy from reader to writer" {
420 |   let log = StringBuilder::new()
    |                            ^^^
    |   @async.with_task_group(root => {
    |     let (r1, w1) = @io.pipe()

<WORKDIR>/src\io\README.mbt.md:488:28-488:31:
    | ```moonbit check
    | ///|
    | async test "BufferedWriter - basic buffering" {
488 |   let log = StringBuilder::new()
    |                            ^^^
    |   @async.with_task_group(root => {
    |     let (r, w) = @io.pipe()

<WORKDIR>/src\io\README.mbt.md:564:28-564:31:
    | 
    | ///|
    | async test "BufferedWriter::write_reader - buffered copy" {
564 |   let log = StringBuilder::new()
    |                            ^^^
    |   @async.with_task_group(root => {
    |     let (r1, w1) = @io.pipe()

<WORKDIR>/src\io\buffered_writer_test.mbt:17:28-17:31:
   | 
   | ///|
   | async test "BufferedWriter" {
17 |   let log = StringBuilder::new()
   |                            ^^^
   |   @async.with_task_group() <| fn(root) {
   |     let (r, w) = @io.pipe()

<WORKDIR>/src\io\buffered_writer_test.mbt:55:28-55:31:
   | 
   | ///|
   | async test "BufferedWriter::write_reader" {
55 |   let log = StringBuilder::new()
   |                            ^^^
   |   @async.with_task_group() <| fn(root) {
   |     let (r1, w1) = @io.pipe()

<WORKDIR>/src\io\read_all_test.mbt:31:28-31:31:
   | 
   | ///|
   | async test "read_all basic" {
31 |   let log = StringBuilder::new()
   |                            ^^^
   |   @async.with_task_group() <| root => {
   |     let (r, w) = @io.pipe()

<WORKDIR>/src\io\read_some_test.mbt:17:28-17:31:
   | 
   | ///|
   | async test "read_some basic" {
17 |   let log = StringBuilder::new()
   |                            ^^^
   |   @async.with_task_group() <| root => {
   |     let (r, w) = @io.pipe()

<WORKDIR>/src\io\read_some_test.mbt:42:28-42:31:
   | 
   | ///|
   | async test "read_some length limit 1" {
42 |   let log = StringBuilder::new()
   |                            ^^^
   |   @async.with_task_group() <| root => {
   |     let (r, w) = @io.pipe()

<WORKDIR>/src\io\read_some_test.mbt:70:28-70:31:
   | 
   | ///|
   | async test "read_some length limit 2" {
70 |   let log = StringBuilder::new()
   |                            ^^^
   |   @async.with_task_group() <| root => {
   |     let (r, w) = @io.pipe()

<WORKDIR>/src\io\read_some_test.mbt:97:28-97:31:
   | 
   | ///|
   | async test "read_some length limit 3" {
97 |   let log = StringBuilder::new()
   |                            ^^^
   |   @async.with_task_group() <| root => {
   |     let (r, w) = @io.pipe()

<WORKDIR>/src\io\writer_test.mbt:33:28-33:31:
   | 
   | ///|
   | async test "write reader" {
33 |   let log = StringBuilder::new()
   |                            ^^^
   |   @async.with_task_group() <| root => {
   |     let (r1, w1) = @io.pipe()

<WORKDIR>/src\io\writer_test.mbt:92:28-92:31:
   | 
   | ///|
   | async test "write cancel" {
92 |   let log = StringBuilder::new()
   |                            ^^^
   |   let writer = { logger: log, base_timeout: 300 }
   |   @async.with_timeout_opt(450, () => writer.write(b"abcd")) |> ignore

<WORKDIR>/src\no_wait_test.mbt:17:28-17:31:
   | 
   | ///|
   | async test "no_wait cancelled" {
17 |   let buf = StringBuilder::new()
   |                            ^^^
   |   @async.with_task_group() <| root => {
   |     root.spawn_bg(no_wait=true) <| () => {

<WORKDIR>/src\no_wait_test.mbt:44:28-44:31:
   | 
   | ///|
   | async test "no_wait normal exit" {
44 |   let buf = StringBuilder::new()
   |                            ^^^
   |   @async.with_task_group() <| root => {
   |     root.spawn_bg(no_wait=true) <| () => {

<WORKDIR>/src\pipe\read_exactly_test.mbt:17:28-17:31:
   | 
   | ///|
   | async test "read_exactly" {
17 |   let buf = StringBuilder::new()
   |                            ^^^
   |   fn log(msg) {
   |     buf..write_string(msg).write_char('\n')

<WORKDIR>/src\pipe\read_exactly_test.mbt:59:28-59:31:
   | 
   | ///|
   | async test "read_exactly failure" {
59 |   let buf = StringBuilder::new()
   |                            ^^^
   |   fn log(msg) {
   |     buf..write_string(msg).write_char('\n')

<WORKDIR>/src\process\cancel_test.mbt:19:28-19:31:
   | ///|
   | async test "cancel process" {
   |   let test_prog = sleep_prog.wait()
19 |   let log = StringBuilder::new()
   |                            ^^^
   |   @async.with_task_group() <| root => {
   |     let (r, w) = @process.read_from_process()

<WORKDIR>/src\process\cancel_test.mbt:115:28-115:31:
    | 
    | ///|
    | async test "orphan process" {
115 |   let log = StringBuilder::new()
    |                            ^^^
    |   @async.with_task_group() <| root => {
    |     let (r, w) = @process.read_from_process()

<WORKDIR>/src\process\wait_test.mbt:18:28-18:31:
   | 
   | ///|
   | async test "basic wait" {
18 |   let log = StringBuilder::new()
   |                            ^^^
   |   let test_prog = sleep_prog.wait()
   |   @async.with_task_group() <| root => {

<WORKDIR>/src\process\wait_test.mbt:49:28-49:31:
   | 
   | ///|
   | async test "wait_pid" {
49 |   let log = StringBuilder::new()
   |                            ^^^
   |   let test_prog = sleep_prog.wait()
   |   @async.with_task_group() <| group => {

<WORKDIR>/src\process\windows.mbt:123:37-123:40:
    |     | [.., '.', 'c' | 'C', 'o' | 'O', 'm' | 'M'] => cmd
    |     _ => cmd + ".exe"
    |   }
123 |   let command_line = StringBuilder::new()
    |                                     ^^^
    |   command_line.write_arg_with_windows_escape(cmd)
    |   for arg in args {

<WORKDIR>/src\process\windows_escape_wbtest.mbt:18:18-18:21:
   | ///|
   | #cfg(platform="windows")
   | fn test_arg(arg : String) -> String {
18 |   StringBuilder::new()..write_arg_with_windows_escape(arg).to_string()
   |                  ^^^
   | }
   | 

<WORKDIR>/src\protect_from_cancel_test.mbt:17:28-17:31:
   | 
   | ///|
   | async test "protect_from_cancel" {
17 |   let log = StringBuilder::new()
   |                            ^^^
   |   @async.with_task_group(root => {
   |     root.spawn_bg() <| () => {

<WORKDIR>/src\protect_from_cancel_test.mbt:64:28-64:31:
   | 
   | ///|
   | async test "protect_from_cancel wait" {
64 |   let log = StringBuilder::new()
   |                            ^^^
   |   @async.with_task_group(root => {
   |     root.spawn_bg() <| () => {

<WORKDIR>/src\protect_from_cancel_test.mbt:102:28-102:31:
    | 
    | ///|
    | async test "protect_from_cancel with_timeout" {
102 |   let log = StringBuilder::new()
    |                            ^^^
    |   @async.with_task_group() <| root => {
    |     root.spawn_bg() <| () => {

<WORKDIR>/src\protect_from_cancel_test.mbt:133:28-133:31:
    | 
    | ///|
    | async test "protect_from_cancel fail" {
133 |   let log = StringBuilder::new()
    |                            ^^^
    |   let result : Error = @test_util.expect_error_async <| () => {
    |     (

<WORKDIR>/src\protect_from_cancel_test.mbt:166:28-166:31:
    | 
    | ///|
    | async test "protect_from_cancel nested1" {
166 |   let log = StringBuilder::new()
    |                            ^^^
    |   @async.with_task_group() <| root => {
    |     root.spawn_bg() <| () => {

<WORKDIR>/src\protect_from_cancel_test.mbt:199:28-199:31:
    | 
    | ///|
    | async test "protect_from_cancel nested2" {
199 |   let log = StringBuilder::new()
    |                            ^^^
    |   @async.with_task_group() <| root => {
    |     root.spawn_bg() <| () => {

<WORKDIR>/src\protect_from_cancel_test.mbt:238:28-238:31:
    | 
    | ///|
    | async test "protect_from_cancel in cancellation handler" {
238 |   let log = StringBuilder::new()
    |                            ^^^
    |   @async.with_task_group(root => {
    |     root.spawn_bg(no_wait=true) <| () => {

<WORKDIR>/src\protect_from_cancel_test.mbt:268:28-268:31:
    | 
    | ///|
    | async test "cancel while scheduled" {
268 |   let log = StringBuilder::new()
    |                            ^^^
    |   @async.with_task_group() <| root => {
    |     root.spawn_bg() <| () => {

<WORKDIR>/src\protect_from_cancel_test.mbt:311:28-311:31:
    | 
    | ///|
    | async test "error in async cancel" {
311 |   let log = StringBuilder::new()
    |                            ^^^
    |   @async.with_task_group() <| root => {
    |     root.spawn_bg() <| () => {

<WORKDIR>/src\retry_test.mbt:17:28-17:31:
   | 
   | ///|
   | async test "retry immediate" {
17 |   let log = StringBuilder::new()
   |                            ^^^
   |   let mut i = 0
   |   @async.retry(Immediate) <| () => {

<WORKDIR>/src\retry_test.mbt:82:28-82:31:
   | 
   | ///|
   | async test "retry cancelled1" {
82 |   let log = StringBuilder::new()
   |                            ^^^
   |   let mut i = 0
   |   @async.with_timeout(500, () => {

<WORKDIR>/src\retry_test.mbt:107:28-107:31:
    | 
    | ///|
    | async test "retry cancelled2" {
107 |   let log = StringBuilder::new()
    |                            ^^^
    |   let mut i = 0
    |   @async.with_timeout(500, () => {

<WORKDIR>/src\retry_test.mbt:132:28-132:31:
    | 
    | ///|
    | async test "retry fatal_error" {
132 |   let log = StringBuilder::new()
    |                            ^^^
    |   fn fatal_error(err) {
    |     !(err is @async.TimeoutError)

<WORKDIR>/src\return_immediately_test.mbt:42:28-42:31:
   | 
   | ///|
   | async test "return_immediately error on cancel" {
42 |   let log = StringBuilder::new()
   |                            ^^^
   |   let err = @test_util.expect_error_async <| () => {
   |     @async.with_task_group(root => {

<WORKDIR>/src\semaphore\semaphore_test.mbt:17:28-17:31:
   | 
   | ///|
   | async test "semaphore mutex" {
17 |   let log = StringBuilder::new()
   |                            ^^^
   |   @async.with_task_group() <| root => {
   |     let semaphore = @semaphore.Semaphore(1)

<WORKDIR>/src\semaphore\semaphore_test.mbt:50:28-50:31:
   | 
   | ///|
   | async test "semaphore multiple value" {
50 |   let log = StringBuilder::new()
   |                            ^^^
   |   @async.with_task_group() <| root => {
   |     let semaphore = @semaphore.Semaphore(2)

<WORKDIR>/src\semaphore\semaphore_test.mbt:106:28-106:31:
    | 
    | ///|
    | async test "semaphore cancellation no_swallow" {
106 |   let log = StringBuilder::new()
    |                            ^^^
    |   @async.with_task_group() <| root => {
    |     let semaphore = @semaphore.Semaphore(1)

<WORKDIR>/src\semaphore\semaphore_test.mbt:131:28-131:31:
    | 
    | ///|
    | async test "semaphore fairness" {
131 |   let log = StringBuilder::new()
    |                            ^^^
    |   @async.with_task_group() <| root => {
    |     let semaphore = @semaphore.Semaphore(1)

<WORKDIR>/src\socket\dual_stack_test.mbt:25:28-25:31:
   | 
   | ///|
   | async test "Only_V4 server" {
25 |   let log = StringBuilder::new()
   |                            ^^^
   |   @async.with_task_group() <| root => {
   |     let server = @socket.TcpServer(@socket.Addr::parse("0.0.0.0:0"))

<WORKDIR>/src\socket\dual_stack_test.mbt:79:28-79:31:
   | 
   | ///|
   | async test "Only_V6 server" {
79 |   let log = StringBuilder::new()
   |                            ^^^
   |   @async.with_task_group() <| root => {
   |     let server = @socket.TcpServer(

<WORKDIR>/src\socket\dual_stack_test.mbt:136:28-136:31:
    | 
    | ///|
    | async test "dual stack server" {
136 |   let log = StringBuilder::new()
    |                            ^^^
    |   @async.with_task_group() <| root => {
    |     let server = @socket.TcpServer(@socket.Addr::parse("[::]:0"))

<WORKDIR>/src\socket\dual_stack_test.mbt:187:28-187:31:
    | 
    | ///|
    | async test "Only_V4 UDP server" {
187 |   let log = StringBuilder::new()
    |                            ^^^
    |   @async.with_task_group() <| root => {
    |     let server = @socket.UdpServer(@socket.Addr::parse("0.0.0.0:0"))

<WORKDIR>/src\socket\dual_stack_test.mbt:240:28-240:31:
    | 
    | ///|
    | async test "Only_V6 UDP server" {
240 |   let log = StringBuilder::new()
    |                            ^^^
    |   @async.with_task_group() <| root => {
    |     let server = @socket.UdpServer(

<WORKDIR>/src\socket\dual_stack_test.mbt:296:28-296:31:
    | 
    | ///|
    | async test "dual stack UDP server" {
296 |   let log = StringBuilder::new()
    |                            ^^^
    |   @async.with_task_group() <| root => {
    |     let server = @socket.UdpServer(@socket.Addr::parse("[::]:0"))

<WORKDIR>/src\socket\read_exactly_test.mbt:17:28-17:31:
   | 
   | ///|
   | async test "read_exactly" {
17 |   let buf = StringBuilder::new()
   |                            ^^^
   |   fn log(msg) {
   |     buf..write_string(msg).write_char('\n')

<WORKDIR>/src\socket\read_exactly_test.mbt:66:28-66:31:
   | 
   | ///|
   | async test "read_exactly failure" {
66 |   let buf = StringBuilder::new()
   |                            ^^^
   |   fn log(msg) {
   |     buf..write_string(msg).write_char('\n')

<WORKDIR>/src\socket\resolve_host_test.mbt:25:28-25:31:
   | 
   | ///|
   | async test "resolve cancel" {
25 |   let log = StringBuilder::new()
   |                            ^^^
   |   @async.with_task_group() <| root => {
   |     let lock = @async.Semaphore(1, initial_value=1)

<WORKDIR>/src\spawn_loop_test.mbt:17:28-17:31:
   | 
   | ///|
   | async test "spawn_loop basic" {
17 |   let log = StringBuilder::new()
   |                            ^^^
   |   @async.with_task_group(root => {
   |     let mut i = 0

<WORKDIR>/src\spawn_loop_test.mbt:41:28-41:31:
   | 
   | ///|
   | async test "spawn_loop basic-error" {
41 |   let log = StringBuilder::new()
   |                            ^^^
   |   let err = @test_util.expect_error_async <| () => {
   |     @async.with_task_group(root => {

<WORKDIR>/src\spawn_test.mbt:17:28-17:31:
   | 
   | ///|
   | async test "spawn error1" {
17 |   let buf = StringBuilder::new()
   |                            ^^^
   |   let result = @test_util.expect_error_async <| () => {
   |     @async.with_task_group(root => {

<WORKDIR>/src\spawn_test.mbt:41:28-41:31:
   | 
   | ///|
   | async test "spawn error2" {
41 |   let buf = StringBuilder::new()
   |                            ^^^
   |   let result = @test_util.expect_error_async <| () => {
   |     @async.with_task_group(root => {

<WORKDIR>/src\timer_test.mbt:17:28-17:31:
   | 
   | ///|
   | async test "basic sleep" {
17 |   let buf = StringBuilder::new()
   |                            ^^^
   |   @async.with_task_group() <| root => {
   |     root.spawn_bg() <| () => {

<WORKDIR>/src\tls\tls_test.mbt:50:28-50:31:
   | 
   | ///|
   | async test "one way" {
50 |   let log = StringBuilder::new()
   |                            ^^^
   |   @async.with_task_group() <| root => {
   |     let (client_read_from_server, server_write_to_client) = @pipe.pipe()

<WORKDIR>/src\tls\tls_test.mbt:103:28-103:31:
    | 
    | ///|
    | async test "echo" {
103 |   let log = StringBuilder::new()
    |                            ^^^
    |   @async.with_task_group() <| root => {
    |     let (client_read_from_server, server_write_to_client) = @pipe.pipe()

<WORKDIR>/src\wait_test.mbt:17:28-17:31:
   | 
   | ///|
   | async test "wait basic" {
17 |   let buf = StringBuilder::new()
   |                            ^^^
   |   @async.with_task_group(root => {
   |     root.spawn_bg() <| () => {

<WORKDIR>/src\wait_test.mbt:46:28-46:31:
   | 
   | ///|
   | async test "wait cancelled" {
46 |   let buf = StringBuilder::new()
   |                            ^^^
   |   @async.with_task_group(root => {
   |     let task = root.spawn(() => {

<WORKDIR>/src\wait_test.mbt:76:28-76:31:
   | 
   | ///|
   | async test "try_wait" {
76 |   let log = StringBuilder::new()
   |                            ^^^
   |   @async.with_task_group() <| root => {
   |     let task = root.spawn(no_wait=true, () => {

<WORKDIR>/src\with_timeout_test.mbt:36:28-36:31:
   | 
   | ///|
   | async test "with_timeout failure" {
36 |   let log = StringBuilder::new()
   |                            ^^^
   |   @async.with_task_group(root => {
   |     root.spawn_bg() <| () => {

<WORKDIR>/src\with_timeout_test.mbt:65:28-65:31:
   | 
   | ///|
   | async test "with_timeout timeout" {
65 |   let log = StringBuilder::new()
   |                            ^^^
   |   @async.with_task_group(root => {
   |     root.spawn_bg() <| () => {

<WORKDIR>/src\with_timeout_test.mbt:98:28-98:31:
   | 
   | ///|
   | async test "with_timeout nested1" {
98 |   let log = StringBuilder::new()
   |                            ^^^
   |   @async.with_task_group(root => {
   |     root.spawn_bg() <| () => {

<WORKDIR>/src\with_timeout_test.mbt:139:28-139:31:
    | 
    | ///|
    | async test "with_timeout nested2" {
139 |   let log = StringBuilder::new()
    |                            ^^^
    |   @async.with_task_group(root => {
    |     root.spawn_bg() <| () => {

<WORKDIR>/src\with_timeout_test.mbt:179:28-179:31:
    | 
    | ///|
    | async test "with_timeout error_on_cancel" {
179 |   let log = StringBuilder::new()
    |                            ^^^
    |   let err = @test_util.expect_error_async <| () => {
    |     @async.with_task_group(root => {

<WORKDIR>/src\with_timeout_test.mbt:210:28-210:31:
    | 
    | ///|
    | async test "with_timeout error-on-timeout" {
210 |   let log = StringBuilder::new()
    |                            ^^^
    |   let err = @test_util.expect_error_async <| () => {
    |     @async.with_task_group(root => {

<WORKDIR>/src\with_timeout_test.mbt:262:28-262:31:
    | 
    | ///|
    | async test "with_timeout_opt failure" {
262 |   let log = StringBuilder::new()
    |                            ^^^
    |   @async.with_task_group(root => {
    |     root.spawn_bg() <| () => {

<WORKDIR>/test_programs\setup_sanitizer_check\main.mbt:51:40-51:43:
   |       guard file is "moon.pkg" else {  }
   |       let full_path = "\{path}/\{file}"
   |       let content = @fs.read_file(full_path).text().split("\n")
51 |       let transformed = StringBuilder::new()
   |                                        ^^^
   |       let mut found = false
   |       for line in content {

```
