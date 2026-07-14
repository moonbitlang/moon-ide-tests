# async find-references with_task_group src/aqueue/blocking_test.mbt:18:10

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
$ run_moon_ide moon ide find-references 'with_task_group' --loc 'src/aqueue/blocking_test.mbt:18:10'
Found 367 references for symbol 'with_task_group':
<WORKDIR>/examples/http_file_server/main.mbt:87:10-87:25:
   |   } else {
   |     path
   |   }
87 |   @async.with_task_group <| group => {
   |          ^^^^^^^^^^^^^^^
   |     let (we_read_from_zip, zip_write_to_us) = @process.read_from_process()
   |     defer we_read_from_zip.close()

<WORKDIR>/examples/http_file_server/server_wbtest.mbt:47:10-47:25:
   |   }
   | 
   |   let client_log = StringBuilder::new()
47 |   @async.with_task_group <| root => {
   |          ^^^^^^^^^^^^^^^
   |     let server = @http.Server(@socket.Addr::parse("127.0.0.1:0"))
   |     let addr = server.addr

<WORKDIR>/examples/idle_timeout/main.mbt:17:10-17:25:
   | 
   | ///|
   | async fn main {
17 |   @async.with_task_group <| group => {
   |          ^^^^^^^^^^^^^^^
   |     let idle_timer = @async.Timer(5000)
   |     group.spawn_bg(no_wait=true) <| () => {

<WORKDIR>/examples/tcp_ping_pong/main.mbt:74:10-74:25:
   | 
   | ///|
   | pub async fn main_prog(println : Printer) -> Unit {
74 |   @async.with_task_group(root => {
   |          ^^^^^^^^^^^^^^^
   |     let server = @socket.TcpServer(@socket.Addr::parse("127.0.0.1:0"))
   |     let addr = server.addr

<WORKDIR>/examples/tcp_ping_pong/main.mbt:79:14-79:29:
   |     let addr = server.addr
   |     root.spawn_bg(() => server_main(server, println))
   |     root.spawn_bg() <| () => {
79 |       @async.with_task_group <| ctx => {
   |              ^^^^^^^^^^^^^^^
   |         for i in 0..<6 {
   |           let msg = if i % 3 == 1 { "pong" } else { "ping" }

<WORKDIR>/examples/tcp_server_benchmark/main.mbt:28:10-28:25:
   | ) -> (Int64, Double) {
   |   let mut throughput_sum : Int64 = 0
   |   let mut latency_sum : UInt64 = 0
28 |   @async.with_task_group <| group => {
   |          ^^^^^^^^^^^^^^^
   |     let mut remaining = total_conn
   |     for _ in 0..<max_concurrent_conn {

<WORKDIR>/examples/tcp_server_benchmark/main.mbt:38:18-38:33:
   |           @async.sleep(rand.int(limit=conn_duration / 10))
   |           let conn = @socket.Tcp::connect(dst)
   |           defer conn.close()
38 |           @async.with_task_group <| conn_group => {
   |                  ^^^^^^^^^^^^^^^
   |             let mut send_count : Int64 = 0
   |             let mut recv_count : Int64 = 0

<WORKDIR>/examples/udp_echo_server/main.mbt:17:10-17:25:
   | 
   | ///|
   | async fn main {
17 |   @async.with_task_group <| root => {
   |          ^^^^^^^^^^^^^^^
   |     let server = @socket.UdpServer(@socket.Addr::parse("0.0.0.0:4200"))
   |     defer server.close()

<WORKDIR>/examples/udp_ping_pong/main.mbt:23:10-23:25:
   | 
   | ///|
   | async fn server_main(server : @socket.UdpServer, println : Printer) -> Unit {
23 |   @async.with_task_group(group => {
   |          ^^^^^^^^^^^^^^^
   |     defer server.close()
   |     let buf = FixedArray::make(1024, b'0')

<WORKDIR>/examples/udp_ping_pong/main.mbt:73:10-73:25:
   | 
   | ///|
   | pub async fn main_prog(println : Printer) -> Unit {
73 |   @async.with_task_group(root => {
   |          ^^^^^^^^^^^^^^^
   |     let server = @socket.UdpServer(@socket.Addr::parse("127.0.0.1:0"))
   |     let addr = server.addr

<WORKDIR>/examples/udp_ping_pong/main.mbt:78:14-78:29:
   |     let addr = server.addr
   |     root.spawn_bg(() => server_main(server, println))
   |     root.spawn_bg() <| () => {
78 |       @async.with_task_group <| ctx => {
   |              ^^^^^^^^^^^^^^^
   |         for i in 0..<6 {
   |           let msg = if i % 3 == 1 { "pong" } else { "ping" }

<WORKDIR>/examples/websocket_echo_server/server_wbtest.mbt:17:10-17:25:
   | 
   | ///|
   | async test "test server" {
17 |   @async.with_task_group <| group => {
   |          ^^^^^^^^^^^^^^^
   |     group.spawn_bg(no_wait=true, () => start_echo_server(port=49001))
   |     let client = @websocket.connect("ws://localhost:49001")

<WORKDIR>/examples/xargs/main.mbt:56:10-56:25:
   |     { "args": args, .. } => args
   |     _ => []
   |   }
56 |   @async.with_task_group <| group => {
   |          ^^^^^^^^^^^^^^^
   |     while @stdio.stdin.read_until("\n") is Some(line) {
   |       if max_jobs is Some(limit) {

<WORKDIR>/src/allow_failure_test.mbt:18:10-18:25:
   | ///|
   | async test "allow_failure ignored" {
   |   let buf = StringBuilder::new()
18 |   @async.with_task_group() <| root => {
   |          ^^^^^^^^^^^^^^^
   |     root.spawn_bg(allow_failure=true, () => raise Err)
   |     @async.sleep(100)

<WORKDIR>/src/allow_failure_test.mbt:36:12-36:27:
   | async test "allow_failure waited" {
   |   let buf = StringBuilder::new()
   |   let err = @test_util.expect_error_async <| () => {
36 |     @async.with_task_group(root => {
   |            ^^^^^^^^^^^^^^^
   |       let task = root.spawn(allow_failure=true, () => raise Err)
   |       @async.sleep(100)

<WORKDIR>/src/allow_failure_test.mbt:55:10-55:25:
   | ///|
   | async test "allow_failure no error" {
   |   let buf = StringBuilder::new()
55 |   @async.with_task_group(root => {
   |          ^^^^^^^^^^^^^^^
   |     root.spawn_bg(allow_failure=true) <| () => {
   |       @async.sleep(1000)

<WORKDIR>/src/aqueue/README.mbt.md:44:10-44:25:
   | ///|
   | async test "quick start" {
   |   let log = []
44 |   @async.with_task_group <| group => {
   |          ^^^^^^^^^^^^^^^
   |     let q : @aqueue.Queue[Int] = @aqueue.Queue(kind=Unbounded)
   |     group.spawn_bg() <| () => {

<WORKDIR>/src/aqueue/README.mbt.md:109:10-109:25:
    | ///|
    | async test "blocking creates backpressure" {
    |   let log = []
109 |   @async.with_task_group <| group => {
    |          ^^^^^^^^^^^^^^^
    |     let q = @aqueue.Queue(kind=Blocking(1))
    |     group.spawn_bg() <| () => {

<WORKDIR>/src/aqueue/README.mbt.md:140:10-140:25:
    | ///|
    | async test "blocking with zero capacity is a rendezvous" {
    |   let log = []
140 |   @async.with_task_group <| group => {
    |          ^^^^^^^^^^^^^^^
    |     let q = @aqueue.Queue(kind=Blocking(0))
    |     group.spawn_bg() <| () => {

<WORKDIR>/src/aqueue/README.mbt.md:292:10-292:25:
    | ///|
    | async test "close as end-of-stream signal" {
    |   let received = []
292 |   @async.with_task_group <| group => {
    |          ^^^^^^^^^^^^^^^
    |     // Capacity 1 forces the producer to suspend between puts,
    |     // so the consumer can drain each item before `close()` runs.

<WORKDIR>/src/aqueue/README.mbt.md:318:10-318:25:
    | ```moonbit check
    | ///|
    | async test "blocked put fails when queue is closed" {
318 |   @async.with_task_group(root => {
    |          ^^^^^^^^^^^^^^^
    |     let q = @aqueue.Queue(kind=Blocking(1))
    |     q.put(1) // fills the buffer

<WORKDIR>/src/aqueue/README.mbt.md:391:10-391:25:
    | ///|
    | async test "fan-in merges multiple producers" {
    |   let received = []
391 |   @async.with_task_group <| group => {
    |          ^^^^^^^^^^^^^^^
    |     let q : @aqueue.Queue[String] = @aqueue.Queue(kind=Unbounded)
    |     // Producer A puts items at time 0, 100, 200 ms.

<WORKDIR>/src/aqueue/README.mbt.md:430:10-430:25:
    | ///|
    | async test "fan-out distributes work to a pool" {
    |   let work_by_worker : Array[Array[Int]] = [[], [], []]
430 |   @async.with_task_group <| group => {
    |          ^^^^^^^^^^^^^^^
    |     let q : @aqueue.Queue[Int] = @aqueue.Queue(kind=Blocking(1))
    |     for w in 0..<3 {

<WORKDIR>/src/aqueue/README.mbt.md:470:10-470:25:
    | ///|
    | async test "readers are woken FIFO" {
    |   let log = []
470 |   @async.with_task_group(root => {
    |          ^^^^^^^^^^^^^^^
    |     let q : @aqueue.Queue[Int] = @aqueue.Queue(kind=Unbounded)
    |     // Reader 1 starts waiting at ~0 ms.

<WORKDIR>/src/aqueue/aqueue_test.mbt:18:10-18:25:
   | ///|
   | async test "aqueue basic" {
   |   let log = StringBuilder::new()
18 |   @async.with_task_group() <| root => {
   |          ^^^^^^^^^^^^^^^
   |     let queue = @aqueue.Queue(kind=Unbounded)
   |     root.spawn_bg() <| () => {

<WORKDIR>/src/aqueue/aqueue_test.mbt:56:10-56:25:
   | ///|
   | async test "aqueue multi-reader" {
   |   let log = StringBuilder::new()
56 |   @async.with_task_group() <| root => {
   |          ^^^^^^^^^^^^^^^
   |     let queue = @aqueue.Queue(kind=Unbounded)
   |     root.spawn_bg() <| () => {

<WORKDIR>/src/aqueue/aqueue_test.mbt:110:10-110:25:
    | async test "aqueue cancellation no_swallow" {
    |   // `get` should not swallow the value
    |   let log = StringBuilder::new()
110 |   @async.with_task_group() <| group => {
    |          ^^^^^^^^^^^^^^^
    |     let q = @aqueue.Queue(kind=Unbounded)
    |     let get_task = group.spawn(() => log.write_string("get() => \{q.get()}\n"))

<WORKDIR>/src/aqueue/aqueue_test.mbt:131:10-131:25:
    | ///|
    | async test "aqueue fairness" {
    |   let log = StringBuilder::new()
131 |   @async.with_task_group() <| root => {
    |          ^^^^^^^^^^^^^^^
    |     let queue = @aqueue.Queue(kind=Unbounded)
    |     root.spawn_bg() <| () => {

<WORKDIR>/src/aqueue/aqueue_test.mbt:167:10-167:25:
    | ///|
    | async test "aqueue fairness2" {
    |   let log = StringBuilder::new()
167 |   @async.with_task_group() <| root => {
    |          ^^^^^^^^^^^^^^^
    |     let queue = @aqueue.Queue(kind=Unbounded)
    |     queue.put(1)

<WORKDIR>/src/aqueue/blocking_test.mbt:18:10-18:25:
   | ///|
   | async test "blocking unbuffered" {
   |   let log = []
18 |   @async.with_task_group() <| group => {
   |          ^^^^^^^^^^^^^^^
   |     let q = @async.Queue(kind=Blocking(1))
   |     group.spawn_bg() <| () => {

<WORKDIR>/src/aqueue/blocking_test.mbt:42:10-42:25:
   | ///|
   | async test "blocking buffered" {
   |   let log = []
42 |   @async.with_task_group() <| group => {
   |          ^^^^^^^^^^^^^^^
   |     let q = @async.Queue(kind=Blocking(2))
   |     group.spawn_bg() <| () => {

<WORKDIR>/src/aqueue/blocking_test.mbt:67:10-67:25:
   | ///|
   | async test "blocking fairness" {
   |   let log = []
67 |   @async.with_task_group() <| group => {
   |          ^^^^^^^^^^^^^^^
   |     let q = @async.Queue(kind=Blocking(1))
   |     q.put(0)

<WORKDIR>/src/aqueue/blocking_test.mbt:98:10-98:25:
   | ///|
   | async test "blocking cancellation" {
   |   let log = []
98 |   @async.with_task_group() <| group => {
   |          ^^^^^^^^^^^^^^^
   |     let q = @async.Queue(kind=Blocking(1))
   |     q.put(0)

<WORKDIR>/src/aqueue/blocking_test.mbt:126:10-126:25:
    | ///|
    | async test "blocking fairness2" {
    |   let log = []
126 |   @async.with_task_group() <| root => {
    |          ^^^^^^^^^^^^^^^
    |     let queue = @async.Queue(kind=Blocking(1))
    |     queue.put(0)

<WORKDIR>/src/aqueue/blocking_test.mbt:160:10-160:25:
    | ///|
    | async test "blocking immediate cancellation" {
    |   let log = []
160 |   @async.with_task_group() <| group => {
    |          ^^^^^^^^^^^^^^^
    |     let q = @async.Queue(kind=Blocking(1))
    |     q.put(0)

<WORKDIR>/src/aqueue/blocking_test.mbt:184:10-184:25:
    | ///|
    | async test "blocking zero buffered" {
    |   let log = []
184 |   @async.with_task_group() <| group => {
    |          ^^^^^^^^^^^^^^^
    |     let q = @async.Queue(kind=Blocking(0))
    |     group.spawn_bg() <| () => {

<WORKDIR>/src/aqueue/blocking_test.mbt:238:10-238:25:
    | ///|
    | async test "blocked zero buffered try_get" {
    |   let log = []
238 |   @async.with_task_group() <| group => {
    |          ^^^^^^^^^^^^^^^
    |     let q = @async.Queue(kind=Blocking(0))
    |     @debug.assert_eq(None, q.try_get())

<WORKDIR>/src/aqueue/blocking_test.mbt:262:10-262:25:
    | ///|
    | async test "blocked zero buffered try_put" {
    |   let log = []
262 |   @async.with_task_group() <| group => {
    |          ^^^^^^^^^^^^^^^
    |     let q = @async.Queue(kind=Blocking(0))
    |     assert_eq(false, q.try_put(-1))

<WORKDIR>/src/aqueue/blocking_test.mbt:290:10-290:25:
    | ///|
    | async test "blocked zero buffered discard oldest try_get" {
    |   let log = []
290 |   @async.with_task_group() <| group => {
    |          ^^^^^^^^^^^^^^^
    |     let q = @async.Queue(kind=DiscardOldest(0))
    |     @debug.assert_eq(None, q.try_get())

<WORKDIR>/src/aqueue/blocking_test.mbt:312:10-312:25:
    | ///|
    | async test "blocked zero buffered discard oldest try_put" {
    |   let log = []
312 |   @async.with_task_group() <| group => {
    |          ^^^^^^^^^^^^^^^
    |     let q = @async.Queue(kind=DiscardOldest(0))
    |     @debug.assert_eq(false, q.try_put(-1))

<WORKDIR>/src/aqueue/blocking_test.mbt:340:10-340:25:
    | ///|
    | async test "blocked zero buffered discard latest try_put" {
    |   let log = []
340 |   @async.with_task_group() <| group => {
    |          ^^^^^^^^^^^^^^^
    |     let q = @async.Queue(kind=DiscardLatest(0))
    |     @debug.assert_eq(false, q.try_put(-1))

<WORKDIR>/src/aqueue/close_test.mbt:79:10-79:25:
   | async test "close with blocking put" {
   |   let q = @async.Queue(kind=Blocking(1))
   |   q.put(1)
79 |   @async.with_task_group() <| group => {
   |          ^^^^^^^^^^^^^^^
   |     let start = @env.now()
   |     group.spawn_bg() <| () => {

<WORKDIR>/src/aqueue/close_test.mbt:98:10-98:25:
   | ///|
   | async test "close zero buffered with blocking put" {
   |   let q = @async.Queue(kind=Blocking(0))
98 |   @async.with_task_group() <| group => {
   |          ^^^^^^^^^^^^^^^
   |     let start = @env.now()
   |     group.spawn_bg() <| () => {

<WORKDIR>/src/aqueue/close_test.mbt:117:10-117:25:
    | ///|
    | async test "close with blocking get" {
    |   let q : @aqueue.Queue[Int] = @async.Queue(kind=Unbounded)
117 |   @async.with_task_group() <| group => {
    |          ^^^^^^^^^^^^^^^
    |     let start = @env.now()
    |     group.spawn_bg() <| () => {

<WORKDIR>/src/aqueue/close_test.mbt:136:10-136:25:
    | ///|
    | async test "close with completed get" {
    |   let q : @aqueue.Queue[Int] = @async.Queue(kind=Unbounded)
136 |   @async.with_task_group() <| group => {
    |          ^^^^^^^^^^^^^^^
    |     group.spawn_bg() <| () => {
    |       debug_inspect(

<WORKDIR>/src/async.mbt:62:3-62:18:
   |   f : async () -> X,
   |   error? : Error = TimeoutError,
   | ) -> X {
62 |   with_task_group() <| group => {
   |   ^^^^^^^^^^^^^^^
   |     group.spawn_bg(no_wait=true) <| () => {
   |       sleep(time)

<WORKDIR>/src/async.mbt:82:3-82:18:
   | /// - If `f` is still running after `timeout` milliseconds,
   | /// ` with_timeout_opt` will return `None` immediately, and `f` will be cancelled.
   | pub async fn[X] with_timeout_opt(time : Int, f : async () -> X) -> X? {
82 |   with_task_group() <| group => {
   |   ^^^^^^^^^^^^^^^
   |     group.spawn_bg(no_wait=true) <| () => {
   |       sleep(time)

<WORKDIR>/src/async.mbt:251:3-251:18:
    |     None
    |   }
    |   let results = Array::make(tasks.length(), None)
251 |   with_task_group() <| tg => {
    |   ^^^^^^^^^^^^^^^
    |     for i, task in tasks {
    |       if semaphore is Some(sem) {

<WORKDIR>/src/async.mbt:299:3-299:18:
    |   }
    |   let mut result = None
    |   let mut last_err = None
299 |   with_task_group() <| tg => {
    |   ^^^^^^^^^^^^^^^
    |     for task in tasks {
    |       if semaphore is Some(sem) {

<WORKDIR>/src/cancellation_test.mbt:18:10-18:25:
   | ///|
   | async test "manual cancel" {
   |   let buf = StringBuilder::new()
18 |   @async.with_task_group(root => {
   |          ^^^^^^^^^^^^^^^
   |     let task = root.spawn(() => {
   |       try {

<WORKDIR>/src/cancellation_test.mbt:52:12-52:27:
   | async test "error propagation" {
   |   let buf = StringBuilder::new()
   |   let err = @test_util.expect_error_async <| () => {
52 |     @async.with_task_group(root => {
   |            ^^^^^^^^^^^^^^^
   |       root.spawn_bg() <| () => {
   |         @async.sleep(300)

<WORKDIR>/src/cancellation_test.mbt:88:10-88:25:
   | ///|
   | async test "multiple scope" {
   |   let buf = StringBuilder::new()
88 |   @async.with_task_group() <| root => {
   |          ^^^^^^^^^^^^^^^
   |     root.spawn_bg() <| () => {
   |       try

<WORKDIR>/src/cancellation_test.mbt:91:16-91:31:
   |   @async.with_task_group() <| root => {
   |     root.spawn_bg() <| () => {
   |       try
91 |         @async.with_task_group() <| fn(ctx) {
   |                ^^^^^^^^^^^^^^^
   |           ctx.spawn_bg() <| () => {
   |             @async.sleep(200)

<WORKDIR>/src/cancellation_test.mbt:119:16-119:31:
    |     }
    |     root.spawn_bg() <| () => {
    |       try
119 |         @async.with_task_group() <| fn(ctx) {
    |                ^^^^^^^^^^^^^^^
    |           ctx.spawn_bg() <| () => {
    |             @async.sleep(500)

<WORKDIR>/src/cancellation_test.mbt:161:10-161:25:
    | ///|
    | async test "recursive cancel" {
    |   let buf = StringBuilder::new()
161 |   @async.with_task_group(root => {
    |          ^^^^^^^^^^^^^^^
    |     root.spawn_bg() <| () => {
    |       for _ in 0..<2 {

<WORKDIR>/src/cancellation_test.mbt:199:12-199:27:
    | async test "spawn directly error" {
    |   let buf = StringBuilder::new()
    |   let err = @test_util.expect_error_async <| () => {
199 |     @async.with_task_group(root => {
    |            ^^^^^^^^^^^^^^^
    |       root.spawn_bg() <| () => {
    |         @async.with_task_group() <| group => {

<WORKDIR>/src/cancellation_test.mbt:201:16-201:31:
    |   let err = @test_util.expect_error_async <| () => {
    |     @async.with_task_group(root => {
    |       root.spawn_bg() <| () => {
201 |         @async.with_task_group() <| group => {
    |                ^^^^^^^^^^^^^^^
    |           @async.sleep(1)
    |           group.spawn_bg(() => raise Err)

<WORKDIR>/src/cancellation_test.mbt:226:12-226:27:
    | async test "error in cancellation" {
    |   let log = StringBuilder::new()
    |   let err = @test_util.expect_error_async <| () => {
226 |     @async.with_task_group(root => {
    |            ^^^^^^^^^^^^^^^
    |       root.spawn_bg(no_wait=true) <| () => {
    |         @async.sleep(1000) catch {

<WORKDIR>/src/cancellation_test.mbt:251:10-251:25:
    | ///|
    | async test "immediately cancelled" {
    |   let log = StringBuilder::new()
251 |   @async.with_task_group() <| root => {
    |          ^^^^^^^^^^^^^^^
    |     let task = root.spawn(() => {
    |       defer log.write_string("task terminated\n")

<WORKDIR>/src/cancellation_test.mbt:275:12-275:27:
    | ///|
    | async test "immediate failure" {
    |   let result = @test_util.expect_error_async <| () => {
275 |     @async.with_task_group(group => {
    |            ^^^^^^^^^^^^^^^
    |       group.spawn_bg(() => raise Failure::Failure("failure"))
    |       group.spawn_bg(() => group.spawn_bg(() => @async.sleep(100)))

<WORKDIR>/src/cancellation_test.mbt:293:10-293:25:
    | ///|
    | async test "task group cancel & complete at the same time" {
    |   let log = []
293 |   @async.with_task_group() <| outer => {
    |          ^^^^^^^^^^^^^^^
    |     @async.with_task_group() <| inner => {
    |       outer.spawn_bg(no_wait=true) <| () => {

<WORKDIR>/src/cancellation_test.mbt:294:12-294:27:
    | async test "task group cancel & complete at the same time" {
    |   let log = []
    |   @async.with_task_group() <| outer => {
294 |     @async.with_task_group() <| inner => {
    |            ^^^^^^^^^^^^^^^
    |       outer.spawn_bg(no_wait=true) <| () => {
    |         for i = 1; ; i = i + 1 {

<WORKDIR>/src/cond_var/README.mbt.md:50:10-50:25:
   | async test "broadcast wakes every parked waiter" {
   |   let cond = @cond_var.Cond()
   |   let log = []
50 |   @async.with_task_group <| group => {
   |          ^^^^^^^^^^^^^^^
   |     for i in 0..<3 {
   |       group.spawn_bg() <| () => {

<WORKDIR>/src/cond_var/README.mbt.md:107:10-107:25:
    | async test "signal wakes waiters FIFO" {
    |   let cond = @cond_var.Cond()
    |   let log = []
107 |   @async.with_task_group <| group => {
    |          ^^^^^^^^^^^^^^^
    |     // Task A parks at ~0 ms.
    |     group.spawn_bg() <| () => {

<WORKDIR>/src/cond_var/cond_var_test.mbt:17:10-17:25:
   | 
   | ///|
   | async test "cond var cancellation" {
17 |   @async.with_task_group() <| root => {
   |          ^^^^^^^^^^^^^^^
   |     let cond = @cond_var.Cond()
   |     root.spawn_bg() <| () => {

<WORKDIR>/src/cond_var/cond_var_test.mbt:35:10-35:25:
   | ///|
   | async test "cond var cancellation no_swallow" {
   |   let log = StringBuilder::new()
35 |   @async.with_task_group() <| root => {
   |          ^^^^^^^^^^^^^^^
   |     let cond = @cond_var.Cond()
   |     let wait_task = root.spawn(() => {

<WORKDIR>/src/cond_var/cond_var_test.mbt:62:10-62:25:
   | ///|
   | async test "cond var fairness" {
   |   let log = StringBuilder::new()
62 |   @async.with_task_group() <| root => {
   |          ^^^^^^^^^^^^^^^
   |     let cond = @cond_var.Cond()
   |     root.spawn_bg() <| () => {

<WORKDIR>/src/cond_var/cond_var_test.mbt:100:10-100:25:
    | ///|
    | async test "cond var broadcast" {
    |   let log = StringBuilder::new()
100 |   @async.with_task_group() <| root => {
    |          ^^^^^^^^^^^^^^^
    |     let cond = @cond_var.Cond()
    |     for i in 0..<3 {

<WORKDIR>/src/cond_var/cond_var_test.mbt:125:10-125:25:
    | ///|
    | async test "cond var broadcast cancellation" {
    |   let log = StringBuilder::new()
125 |   @async.with_task_group() <| root => {
    |          ^^^^^^^^^^^^^^^
    |     let cond = @cond_var.Cond()
    |     for i in 0..<3 {

<WORKDIR>/src/fs/access_test.mbt:59:10-59:25:
   |     return
   |   }
   |   let path = "_build/chmod_test"
59 |   @async.with_task_group() <| group => {
   |          ^^^^^^^^^^^^^^^
   |     @fs.write_file(path, "abcd", create_mode=CreateNew, permission=0o444)
   |     group.add_defer(() => @fs.remove(path))

<WORKDIR>/src/fs/create_test.mbt:76:10-76:25:
   | ///|
   | async test "create_mode test" {
   |   let path = "_build/create_exclusive_test"
76 |   @async.with_task_group() <| group => {
   |          ^^^^^^^^^^^^^^^
   |     for create_mode in [@fs.OpenExisting, @fs.TruncateExisting] {
   |       @test_util.assert_raise_async <| () => {

<WORKDIR>/src/fs/dir.mbt:423:10-423:25:
    |   let context = "@fs.walk()"
    |   guard max_concurrency > 0
    |   let sem = @async.Semaphore(max_concurrency)
423 |   @async.with_task_group() <| fn(group) {
    |          ^^^^^^^^^^^^^^^
    |     fn handle_path(path : String) {
    |       guard !exclude(path) else {  }

<WORKDIR>/src/fs/lock_test.mbt:56:10-56:25:
   | async test "flock exclusive vs exclusive" {
   |   let log = []
   |   let file_name = "_build/flock_ex_ex"
56 |   @async.with_task_group() <| group => {
   |          ^^^^^^^^^^^^^^^
   |     let file = @fs.open(file_name, create_mode=CreateOrTruncate, mode=ReadWrite)
   |     defer file.close()

<WORKDIR>/src/fs/lock_test.mbt:75:10-75:25:
   | async test "flock exclusive vs exclusive blocking" {
   |   let log = []
   |   let file_name = "_build/flock_ex_ex_blocking"
75 |   @async.with_task_group() <| group => {
   |          ^^^^^^^^^^^^^^^
   |     let file = @fs.open(file_name, create_mode=CreateOrTruncate, mode=ReadWrite)
   |     defer file.close()

<WORKDIR>/src/fs/lock_test.mbt:103:10-103:25:
    | async test "flock shared vs exclusive" {
    |   let log = []
    |   let file_name = "_build/flock_sh_ex"
103 |   @async.with_task_group() <| group => {
    |          ^^^^^^^^^^^^^^^
    |     let file = @fs.open(file_name, create_mode=CreateOrTruncate, mode=ReadWrite)
    |     defer file.close()

<WORKDIR>/src/fs/lock_test.mbt:122:10-122:25:
    | async test "flock shared vs exclusive blocking" {
    |   let log = []
    |   let file_name = "_build/flock_sh_ex_blocking"
122 |   @async.with_task_group() <| group => {
    |          ^^^^^^^^^^^^^^^
    |     let file = @fs.open(file_name, create_mode=CreateOrTruncate, mode=ReadWrite)
    |     defer file.close()

<WORKDIR>/src/fs/lock_test.mbt:144:10-144:25:
    | async test "flock exclusive vs shared" {
    |   let log = []
    |   let file_name = "_build/flock_ex_sh"
144 |   @async.with_task_group() <| group => {
    |          ^^^^^^^^^^^^^^^
    |     let file = @fs.open(file_name, create_mode=CreateOrTruncate, mode=ReadWrite)
    |     defer file.close()

<WORKDIR>/src/fs/lock_test.mbt:163:10-163:25:
    | async test "flock exclusive vs shared blocking" {
    |   let log = []
    |   let file_name = "_build/flock_ex_sh_blocking"
163 |   @async.with_task_group() <| group => {
    |          ^^^^^^^^^^^^^^^
    |     let file = @fs.open(file_name, create_mode=CreateOrTruncate, mode=ReadWrite)
    |     defer file.close()

<WORKDIR>/src/fs/lock_test.mbt:191:10-191:25:
    | async test "flock shared vs shared" {
    |   let log = []
    |   let file_name = "_build/flock_sh_sh"
191 |   @async.with_task_group() <| group => {
    |          ^^^^^^^^^^^^^^^
    |     let file = @fs.open(file_name, create_mode=CreateOrTruncate, mode=ReadWrite)
    |     defer file.close()

<WORKDIR>/src/fs/lock_test.mbt:208:10-208:25:
    | async test "flock shared vs shared blocking" {
    |   let log = []
    |   let file_name = "_build/flock_sh_sh_blocking"
208 |   @async.with_task_group() <| group => {
    |          ^^^^^^^^^^^^^^^
    |     let file = @fs.open(file_name, create_mode=CreateOrTruncate, mode=ReadWrite)
    |     defer file.close()

<WORKDIR>/src/fs/lock_test.mbt:229:10-229:25:
    | async test "flock shared vs shared vs exclusive" {
    |   let log = []
    |   let file_name = "_build/flock_sh_sh_ex"
229 |   @async.with_task_group() <| group => {
    |          ^^^^^^^^^^^^^^^
    |     let file = @fs.open(file_name, create_mode=CreateOrTruncate, mode=ReadWrite)
    |     defer file.close()

<WORKDIR>/src/fs/lock_test.mbt:266:10-266:25:
    | async test "flock shared vs shared vs exclusive blocking" {
    |   let log = []
    |   let file_name = "_build/flock_sh_sh_ex_blocking"
266 |   @async.with_task_group() <| group => {
    |          ^^^^^^^^^^^^^^^
    |     let file = @fs.open(file_name, create_mode=CreateOrTruncate, mode=ReadWrite)
    |     defer file.close()

<WORKDIR>/src/fs/lock_test.mbt:302:10-302:25:
    | async test "flock cancelled" {
    |   let log = []
    |   let file_name = "_build/flock_cancel"
302 |   @async.with_task_group() <| group => {
    |          ^^^^^^^^^^^^^^^
    |     let file = @fs.open(file_name, create_mode=CreateOrTruncate, mode=ReadWrite)
    |     defer file.close()

<WORKDIR>/src/fs/lock_test.mbt:331:10-331:25:
    | async test "flock advisory" {
    |   let log = []
    |   let file_name = "_build/flock_advisory"
331 |   @async.with_task_group() <| group => {
    |          ^^^^^^^^^^^^^^^
    |     @fs.write_file(file_name, create_mode=CreateOrTruncate, "abcd")
    |     let file = @fs.open(file_name, mode=ReadWrite)

<WORKDIR>/src/fs/mkdir_test.mbt:41:10-41:25:
   | 
   | ///|
   | async test "mkdir recursive" {
41 |   @async.with_task_group() <| group => {
   |          ^^^^^^^^^^^^^^^
   |     let base_path = "_build/recursive_mkdir"
   |     let path = "\{base_path}/test//directory"

<WORKDIR>/src/fs/named_pipe_test.mbt:23:10-23:25:
   | ///|
   | #cfg(not(platform="windows"))
   | async test "cancel named fifo open" {
23 |   @async.with_task_group() <| group => {
   |          ^^^^^^^^^^^^^^^
   |     let path = "_build/cancel_open_test"
   |     if mkfifo(@os_string.encode(path), 0o644) < 0 {

<WORKDIR>/src/fs/named_pipe_test.mbt:60:10-60:25:
   | ///|
   | #cfg(not(platform="windows"))
   | async test "named fifo" {
60 |   @async.with_task_group() <| group => {
   |          ^^^^^^^^^^^^^^^
   |     let path = "_build/named_pipe_test"
   |     if mkfifo(@os_string.encode(path), 0o644) < 0 {

<WORKDIR>/src/fs/realpath_test.mbt:29:10-29:25:
   | ///|
   | #cfg(not(platform="windows"))
   | async test "realpath link to absolute" {
29 |   @async.with_task_group() <| root => {
   |          ^^^^^^^^^^^^^^^
   |     guard @env.current_dir() is Some(cwd)
   |     let path = match cwd {

<WORKDIR>/src/fs/realpath_test.mbt:47:10-47:25:
   | ///|
   | #cfg(not(platform="windows"))
   | async test "realpath link to relative" {
47 |   @async.with_task_group() <| root => {
   |          ^^^^^^^^^^^^^^^
   |     guard @env.current_dir() is Some(cwd)
   |     let rel_path = "../src/fs/realpath_test.mbt"

<WORKDIR>/src/fs/realpath_test.mbt:61:10-61:25:
   | 
   | ///|
   | async test "realpath link to dir absolute" {
61 |   @async.with_task_group() <| root => {
   |          ^^^^^^^^^^^^^^^
   |     guard @env.current_dir() is Some(cwd)
   |     let path = match cwd {

<WORKDIR>/src/fs/realpath_test.mbt:83:10-83:25:
   | #cfg(not(platform="windows"))
   | async test "realpath link to dir relative" {
   |   guard @env.current_dir() is Some(cwd)
83 |   @async.with_task_group() <| root => {
   |          ^^^^^^^^^^^^^^^
   |     let rel_path = "../src/fs"
   |     let link_path = "_build/realpath_test_link_to_dir_relative.test"

<WORKDIR>/src/fs/stat_test.mbt:20:10-20:25:
   | async test "kind of symlink to regular" {
   |   let link_path = "_build/stat_symlink_to_regular_test"
   |   @fs.symlink(link_path, target="../LICENSE")
20 |   @async.with_task_group() <| group => {
   |          ^^^^^^^^^^^^^^^
   |     group.add_defer(() => @fs.remove(link_path))
   |     debug_inspect(@fs.kind(link_path), content="Regular")

<WORKDIR>/src/fs/stat_test.mbt:32:10-32:25:
   |   guard @env.current_dir() is Some(cwd)
   |   let link_path = "_build/stat_symlink_to_dir_test"
   |   @fs.symlink(link_path, target="\{cwd}/_build")
32 |   @async.with_task_group() <| group => {
   |          ^^^^^^^^^^^^^^^
   |     group.add_defer(() => @fs.remove(link_path))
   |     debug_inspect(@fs.kind(link_path), content="Directory")

<WORKDIR>/src/fs/text_file_test.mbt:17:10-17:25:
   | 
   | ///|
   | async test "text file" {
17 |   @async.with_task_group() <| root => {
   |          ^^^^^^^^^^^^^^^
   |     let path = "_build/basic_text_file_test"
   |     root.add_defer(() => @fs.remove(path))

<WORKDIR>/src/fs/timestamp_test.mbt:31:10-31:25:
   |     return
   |   }
   |   let path = "/tmp/timestamp_test"
31 |   @async.with_task_group() <| group => {
   |          ^^^^^^^^^^^^^^^
   |     @fs.write_file(path, "abcd", create_mode=CreateOrTruncate, sync=Full)
   |     group.add_defer(() => @fs.remove(path))

<WORKDIR>/src/fs/timestamp_test.mbt:88:10-88:25:
   |     return
   |   }
   |   let path = "/tmp/opened_file_timestamp_test"
88 |   @async.with_task_group() <| group => {
   |          ^^^^^^^^^^^^^^^
   |     @fs.write_file(path, "abcd", create_mode=CreateOrTruncate, sync=Full)
   |     group.add_defer(() => @fs.remove(path))

<WORKDIR>/src/fs/tmpdir_test.mbt:17:10-17:25:
   | 
   | ///|
   | async test "tmpdir" {
17 |   @async.with_task_group() <| group => {
   |          ^^^^^^^^^^^^^^^
   |     let t1 = @fs.tmpdir(prefix="tmp")
   |     group.add_defer() <| () => {

<WORKDIR>/src/fs/watch_test.mbt:37:10-37:25:
   | ///|
   | async test "watch basic" {
   |   let log = []
37 |   @async.with_task_group(group => {
   |          ^^^^^^^^^^^^^^^
   |     let path = "_build/watch_basic_test"
   |     let test_dir = Dir({

<WORKDIR>/src/fs/watch_test.mbt:163:10-163:25:
    | ///|
    | async test "watch rename within" {
    |   let log = []
163 |   @async.with_task_group(group => {
    |          ^^^^^^^^^^^^^^^
    |     let path = "_build/watch_rename_within_test"
    |     let test_dir = Dir({

<WORKDIR>/src/fs/watch_test.mbt:249:10-249:25:
    | ///|
    | async test "watch rename inout test" {
    |   let log = []
249 |   @async.with_task_group(group => {
    |          ^^^^^^^^^^^^^^^
    |     let base_path = "_build/watch_rename_inout_test"
    |     let test_dir = Dir({

<WORKDIR>/src/fs/watch_test.mbt:376:10-376:25:
    | ///|
    | async test "watch horizontal swap" {
    |   let log = []
376 |   @async.with_task_group(group => {
    |          ^^^^^^^^^^^^^^^
    |     let path = "_build/watch_swap_test"
    |     let test_dir = Dir({ "file1": File("abcd"), "file2": File("efgh") })

<WORKDIR>/src/fs/watch_test.mbt:403:10-403:25:
    | ///|
    | async test "watch vertical swap" {
    |   let log = []
403 |   @async.with_task_group(group => {
    |          ^^^^^^^^^^^^^^^
    |     let path = "_build/watch_vertical_swap_test"
    |     let test_dir = Dir({

<WORKDIR>/src/fs/watch_test.mbt:449:10-449:25:
    | ///|
    | async test "watch ignored path" {
    |   let log = []
449 |   @async.with_task_group(group => {
    |          ^^^^^^^^^^^^^^^
    |     let path = "_build/watch_ignored_path_test"
    |     let test_dir = Dir({

<WORKDIR>/src/group_defer_test.mbt:18:10-18:25:
   | ///|
   | async test "group defer basic" {
   |   let log = StringBuilder::new()
18 |   @async.with_task_group() <| fn(root) {
   |          ^^^^^^^^^^^^^^^
   |     root.add_defer(() => log <+ "first group defer\n")
   |     root.spawn_bg() <| () => {

<WORKDIR>/src/group_defer_test.mbt:59:12-59:27:
   | async test "group defer error" {
   |   let log = StringBuilder::new()
   |   let err = @test_util.expect_error_async <| () => {
59 |     @async.with_task_group(fn(root) {
   |            ^^^^^^^^^^^^^^^
   |       root.add_defer(() => log <+ "first group defer\n")
   |       root.spawn_bg() <| () => {

<WORKDIR>/src/group_defer_test.mbt:101:10-101:25:
    | ///|
    | async test "group defer cancelled" {
    |   let log = StringBuilder::new()
101 |   @async.with_task_group() <| root => {
    |          ^^^^^^^^^^^^^^^
    |     root.spawn_bg() <| () => {
    |       for _ in 0..<4 {

<WORKDIR>/src/group_defer_test.mbt:109:14-109:29:
    |       }
    |     }
    |     @async.with_timeout_opt(500, () => {
109 |       @async.with_task_group(group => {
    |              ^^^^^^^^^^^^^^^
    |         group.add_defer(() => {
    |           @async.protect_from_cancel() <| () => {

<WORKDIR>/src/gzip/gzip_test.mbt:18:10-18:25:
   | ///|
   | #cfg(target="native")
   | async fn node_gzip(mode : String, input : Bytes) -> Bytes {
18 |   @async.with_task_group() <| group => {
   |          ^^^^^^^^^^^^^^^
   |     let (stdin, we_write) = @process.write_to_process()
   |     let runner = group.spawn(() => {

<WORKDIR>/src/gzip/gzip_test.mbt:38:10-38:25:
   | #cfg(target="native")
   | async fn encode_with_moonbit(input : Bytes) -> Bytes {
   |   let (r, w) = @io.pipe()
38 |   @async.with_task_group() <| group => {
   |          ^^^^^^^^^^^^^^^
   |     group.spawn_bg() <| () => {
   |       defer w.close()

<WORKDIR>/src/gzip/gzip_test.mbt:52:10-52:25:
   | #cfg(target="native")
   | async fn decode_with_moonbit(input : Bytes) -> Bytes {
   |   let (r, w) = @io.pipe()
52 |   @async.with_task_group() <| group => {
   |          ^^^^^^^^^^^^^^^
   |     group.spawn_bg() <| () => {
   |       defer w.close()

<WORKDIR>/src/gzip/gzip_test.mbt:74:10-74:25:
   | 
   | ///|
   | async test "encode decode roundtrip" {
74 |   @async.with_task_group() <| root => {
   |          ^^^^^^^^^^^^^^^
   |     let source_chunks = ["hello ", "gzip ", "world"]
   |     let (compressed_r, compressed_w) = @io.pipe()

<WORKDIR>/src/gzip/gzip_test.mbt:99:10-99:25:
   | 
   | ///|
   | async test "encoder uses valid blocks across large writes" {
99 |   @async.with_task_group() <| root => {
   |          ^^^^^^^^^^^^^^^
   |     let payload = Bytes::makei(70000, i => (i % 251).to_byte())
   |     let (compressed_r, compressed_w) = @io.pipe()

<WORKDIR>/src/gzip/gzip_test.mbt:118:10-118:25:
    | ///|
    | async test "encoder emits output when flushed" {
    |   let log : Array[String] = []
118 |   @async.with_task_group() <| root => {
    |          ^^^^^^^^^^^^^^^
    |     let (r, w) = @io.pipe()
    |     root.spawn_bg() <| () => {

<WORKDIR>/src/gzip/gzip_test.mbt:152:10-152:25:
    | ///|
    | async test "decoder yields plain chunks lazily across delayed chunks" {
    |   let log : Array[String] = []
152 |   @async.with_task_group() <| root => {
    |          ^^^^^^^^^^^^^^^
    |     let (compressed_r, compressed_w) = @io.pipe()
    |     root.spawn_bg() <| () => {

<WORKDIR>/src/gzip/gzip_test.mbt:194:10-194:25:
    | 
    | ///|
    | async test "decoder supports reads smaller than writer chunks" {
194 |   @async.with_task_group() <| root => {
    |          ^^^^^^^^^^^^^^^
    |     let (compressed_r, compressed_w) = @io.pipe()
    |     root.spawn_bg() <| () => {

<WORKDIR>/src/http/client_test.mbt:95:10-95:25:
   | ///|
   | async test "request streaming" {
   |   let log = StringBuilder::new()
95 |   @async.with_task_group() <| group => {
   |          ^^^^^^^^^^^^^^^
   |     let port = test_server(group, log)
   |     async fn fetch_response(client : @http.Client) {

<WORKDIR>/src/http/parser_wbtest.mbt:37:10-37:25:
   | ///|
   | async test "read_request basic" {
   |   let log = StringBuilder::new()
37 |   @async.with_task_group() <| root => {
   |          ^^^^^^^^^^^^^^^
   |     let (r, w) = @io.pipe()
   |     root.spawn_bg() <| () => {

<WORKDIR>/src/http/parser_wbtest.mbt:66:10-66:25:
   | ///|
   | async test "read_request fixed body" {
   |   let log = StringBuilder::new()
66 |   @async.with_task_group() <| root => {
   |          ^^^^^^^^^^^^^^^
   |     let (r, w) = @io.pipe()
   |     root.spawn_bg() <| () => {

<WORKDIR>/src/http/parser_wbtest.mbt:97:10-97:25:
   | 
   | ///|
   | async test "read_request fixed body early EOF" {
97 |   @async.with_task_group() <| root => {
   |          ^^^^^^^^^^^^^^^
   |     let (r, w) = @io.pipe()
   |     root.spawn_bg() <| () => {

<WORKDIR>/src/http/parser_wbtest.mbt:123:10-123:25:
    | ///|
    | async test "read_request chunked" {
    |   let log = StringBuilder::new()
123 |   @async.with_task_group() <| root => {
    |          ^^^^^^^^^^^^^^^
    |     let (r, w) = @io.pipe()
    |     root.spawn_bg() <| () => {

<WORKDIR>/src/http/parser_wbtest.mbt:159:10-159:25:
    | ///|
    | async test "read_request stream" {
    |   let log = StringBuilder::new()
159 |   @async.with_task_group() <| root => {
    |          ^^^^^^^^^^^^^^^
    |     let (r, w) = @io.pipe()
    |     root.spawn_bg() <| () => {

<WORKDIR>/src/http/parser_wbtest.mbt:209:10-209:25:
    | ///|
    | async test "multiple request" {
    |   let log = StringBuilder::new()
209 |   @async.with_task_group() <| root => {
    |          ^^^^^^^^^^^^^^^
    |     let (r, w) = @io.pipe()
    |     root.spawn_bg() <| () => {

<WORKDIR>/src/http/parser_wbtest.mbt:271:10-271:25:
    | ///|
    | async test "read_response basic" {
    |   let log = StringBuilder::new()
271 |   @async.with_task_group() <| root => {
    |          ^^^^^^^^^^^^^^^
    |     let (r, w) = @io.pipe()
    |     root.spawn_bg() <| () => {

<WORKDIR>/src/http/parser_wbtest.mbt:302:10-302:25:
    | ///|
    | async test "read_response passthrough fallback (no length headers)" {
    |   let log = StringBuilder::new()
302 |   @async.with_task_group() <| root => {
    |          ^^^^^^^^^^^^^^^
    |     let (r, w) = @io.pipe()
    |     root.spawn_bg() <| () => {

<WORKDIR>/src/http/parser_wbtest.mbt:339:10-339:25:
    | ///|
    | async test "read_response 204 No Content (no body)" {
    |   let log = StringBuilder::new()
339 |   @async.with_task_group() <| root => {
    |          ^^^^^^^^^^^^^^^
    |     let (r, w) = @io.pipe()
    |     root.spawn_bg() <| () => {

<WORKDIR>/src/http/parser_wbtest.mbt:376:10-376:25:
    | ///|
    | async test "read_response 205 Reset Content (no body)" {
    |   let log = StringBuilder::new()
376 |   @async.with_task_group() <| root => {
    |          ^^^^^^^^^^^^^^^
    |     let (r, w) = @io.pipe()
    |     root.spawn_bg() <| () => {

<WORKDIR>/src/http/parser_wbtest.mbt:413:10-413:25:
    | ///|
    | async test "read_response 304 Not Modified (no body)" {
    |   let log = StringBuilder::new()
413 |   @async.with_task_group() <| root => {
    |          ^^^^^^^^^^^^^^^
    |     let (r, w) = @io.pipe()
    |     root.spawn_bg() <| () => {

<WORKDIR>/src/http/parser_wbtest.mbt:450:10-450:25:
    | ///|
    | async test "read_response 100 Continue (no body)" {
    |   let log = StringBuilder::new()
450 |   @async.with_task_group() <| root => {
    |          ^^^^^^^^^^^^^^^
    |     let (r, w) = @io.pipe()
    |     root.spawn_bg() <| () => {

<WORKDIR>/src/http/parser_wbtest.mbt:482:10-482:25:
    | ///|
    | async test "read_response CONNECT 200 (no body, tunnel mode)" {
    |   let log = StringBuilder::new()
482 |   @async.with_task_group() <| root => {
    |          ^^^^^^^^^^^^^^^
    |     let (r, w) = @io.pipe()
    |     root.spawn_bg() <| () => {

<WORKDIR>/src/http/parser_wbtest.mbt:516:10-516:25:
    | ///|
    | async test "read_response HEAD 200 (no body)" {
    |   let log = StringBuilder::new()
516 |   @async.with_task_group() <| root => {
    |          ^^^^^^^^^^^^^^^
    |     let (r, w) = @io.pipe()
    |     root.spawn_bg() <| () => {

<WORKDIR>/src/http/parser_wbtest.mbt:757:27-757:42:
    | 
    | ///|
    | async test "gzip split between chunks" {
757 |   let compressed = @async.with_task_group(group => {
    |                           ^^^^^^^^^^^^^^^
    |     let (r, w) = @io.pipe()
    |     group.spawn_bg() <| () => {

<WORKDIR>/src/http/parser_wbtest.mbt:767:10-767:25:
    |     r.read_all().binary()
    |   })
    |   let (r, w) = @io.pipe()
767 |   @async.with_task_group() <| group => {
    |          ^^^^^^^^^^^^^^^
    |     group.spawn_bg() <| () => {
    |       defer w.close()

<WORKDIR>/src/http/parser_wbtest.mbt:797:10-797:25:
    | 
    | ///|
    | async test "read_response parse cookie" {
797 |   @async.with_task_group() <| group => {
    |          ^^^^^^^^^^^^^^^
    |     let (r, w) = @io.pipe()
    |     group.spawn_bg() <| () => {

<WORKDIR>/src/http/proxy_test.mbt:18:10-18:25:
   | ///|
   | async test "passthrough mode" {
   |   let log = []
18 |   @async.with_task_group() <| group => {
   |          ^^^^^^^^^^^^^^^
   |     let server = @socket.TcpServer(@socket.Addr::parse("127.0.0.1:0"))
   |     let server_addr = server.addr

<WORKDIR>/src/http/proxy_test.mbt:55:10-55:25:
   | 
   | ///|
   | async test "passthrough mode remaining data" {
55 |   @async.with_task_group() <| group => {
   |          ^^^^^^^^^^^^^^^
   |     let server = @socket.TcpServer(@socket.Addr::parse("127.0.0.1:0"))
   |     let server_addr = server.addr

<WORKDIR>/src/http/proxy_test.mbt:106:10-106:25:
    |   log.push("proxy server: connected to \{request.path} successfully")
    |   conn..send_response(200, "OK").end_response()
    |   conn.enter_passthrough_mode()
106 |   @async.with_task_group() <| group => {
    |          ^^^^^^^^^^^^^^^
    |     group.spawn_bg(() => conn.write_reader(client))
    |     group.spawn_bg(() => client.write_reader(conn))

<WORKDIR>/src/http/proxy_test.mbt:115:10-115:25:
    | ///|
    | async test "proxied https request" {
    |   let log = []
115 |   @async.with_task_group() <| group => {
    |          ^^^^^^^^^^^^^^^
    |     let server = @http.Server(@socket.Addr::parse("127.0.0.1:0"))
    |     let port = server.addr.port()

<WORKDIR>/src/http/proxy_test.mbt:137:10-137:25:
    | ///|
    | async test "proxied http request" {
    |   let log = []
137 |   @async.with_task_group() <| group => {
    |          ^^^^^^^^^^^^^^^
    |     let server = @http.Server(@socket.Addr::parse("127.0.0.1:0"))
    |     let port = server.addr.port()

<WORKDIR>/src/http/proxy_test.mbt:163:10-163:25:
    |   let proxy_server_addr = proxy_server.addr
    |   let server = @socket.TcpServer(@socket.Addr::parse("127.0.0.1:0"))
    |   let port = server.addr.port()
163 |   @async.with_task_group() <| group => {
    |          ^^^^^^^^^^^^^^^
    |     group.spawn_bg(no_wait=true) <| () => {
    |       proxy_server.run_forever() <| ((req, body, conn) => {

<WORKDIR>/src/http/proxy_test.mbt:204:10-204:25:
    | async test "proxy error" {
    |   let proxy_server = @http.Server(@socket.Addr::parse("127.0.0.1:0"))
    |   let port = proxy_server.addr.port()
204 |   @async.with_task_group() <| group => {
    |          ^^^^^^^^^^^^^^^
    |     group.spawn_bg(no_wait=true) <| () => {
    |       proxy_server.run_forever() <| ((_, _, conn) => {

<WORKDIR>/src/http/request_test.mbt:50:10-50:25:
   | async test "manual Accept-Encoding" {
   |   let log = []
   |   let test_server = @http.Server(@socket.Addr::parse("127.0.0.1:0"))
50 |   @async.with_task_group <| group => {
   |          ^^^^^^^^^^^^^^^
   |     group.spawn_bg(no_wait=true) <| () => {
   |       test_server.run_forever() <| ((req, _body, conn) => {

<WORKDIR>/src/http/send_wbtest.mbt:17:10-17:25:
   | 
   | ///|
   | async test "send_request basic" {
17 |   @async.with_task_group() <| root => {
   |          ^^^^^^^^^^^^^^^
   |     let (r, w) = @io.pipe()
   |     root.spawn_bg() <| () => {

<WORKDIR>/src/http/send_wbtest.mbt:45:10-45:25:
   | 
   | ///|
   | async test "send_request stream" {
45 |   @async.with_task_group() <| root => {
   |          ^^^^^^^^^^^^^^^
   |     let (r, w) = @io.pipe()
   |     root.spawn_bg() <| () => {

<WORKDIR>/src/http/send_wbtest.mbt:304:10-304:25:
    | 
    | ///|
    | async test "send_request stream2" {
304 |   @async.with_task_group() <| root => {
    |          ^^^^^^^^^^^^^^^
    |     let (r, w) = @io.pipe()
    |     root.spawn_bg() <| () => {

<WORKDIR>/src/http/send_wbtest.mbt:346:10-346:25:
    | 
    | ///|
    | async test "send invalid header" {
346 |   @async.with_task_group() <| root => {
    |          ^^^^^^^^^^^^^^^
    |     let (r, w) = @io.pipe()
    |     root.spawn_bg() <| () => {

<WORKDIR>/src/http/send_wbtest.mbt:375:10-375:25:
    | 
    | ///|
    | async test "send fixed length" {
375 |   @async.with_task_group() <| group => {
    |          ^^^^^^^^^^^^^^^
    |     let (r, w) = @io.pipe()
    |     group.spawn_bg() <| () => {

<WORKDIR>/src/http/send_wbtest.mbt:616:10-616:25:
    | 
    | ///|
    | async test "sender write incorrect length" {
616 |   @async.with_task_group() <| group => {
    |          ^^^^^^^^^^^^^^^
    |     let (r, w) = @io.pipe()
    |     group.spawn_bg(no_wait=true) <| () => {

<WORKDIR>/src/http/send_wbtest.mbt:642:10-642:25:
    | 
    | ///|
    | async test "sender write_reader incorrect length" {
642 |   @async.with_task_group() <| group => {
    |          ^^^^^^^^^^^^^^^
    |     let (r, w) = @io.pipe()
    |     group.spawn_bg(no_wait=true) <| () => {

<WORKDIR>/src/http/send_wbtest.mbt:668:10-668:25:
    | 
    | ///|
    | async test "sender end_body incorrect length" {
668 |   @async.with_task_group() <| group => {
    |          ^^^^^^^^^^^^^^^
    |     let (r, w) = @io.pipe()
    |     group.spawn_bg(no_wait=true) <| () => {

<WORKDIR>/src/http/send_wbtest.mbt:710:10-710:25:
    |     ),
    |     Cookie("Cookie4", "value four", extensions=["ExtNoArg", "ExtWithArg=xxx"]),
    |   ]
710 |   @async.with_task_group() <| group => {
    |          ^^^^^^^^^^^^^^^
    |     let (r, w) = @io.pipe()
    |     group.spawn_bg() <| () => {

<WORKDIR>/src/http/send_wbtest.mbt:737:10-737:25:
    | 
    | ///|
    | async test "send_request empty body" {
737 |   @async.with_task_group <| group => {
    |          ^^^^^^^^^^^^^^^
    |     let (r, w) = @io.pipe()
    |     group.spawn_bg() <| () => {

<WORKDIR>/src/http/send_wbtest.mbt:771:10-771:25:
    | 
    | ///|
    | async test "send_response empty body" {
771 |   @async.with_task_group <| group => {
    |          ^^^^^^^^^^^^^^^
    |     let (r, w) = @io.pipe()
    |     group.spawn_bg() <| () => {

<WORKDIR>/src/http/send_wbtest.mbt:810:10-810:25:
    | 
    | ///|
    | async test "sender persistent header" {
810 |   @async.with_task_group() <| root => {
    |          ^^^^^^^^^^^^^^^
    |     let (r, w) = @io.pipe()
    |     root.spawn_bg() <| () => {

<WORKDIR>/src/internal/coroutine/pause_test.mbt:19:12-19:27:
   | test "coroutine ping-pong" {
   |   let log = StringBuilder::new()
   |   let coro = @coroutine.spawn(() => {
19 |     @async.with_task_group(group => {
   |            ^^^^^^^^^^^^^^^
   |       group.spawn_bg() <| () => {
   |         log <+ "ping\n"

<WORKDIR>/src/internal/event_loop/missing_close_test.mbt:20:12-20:27:
   |   let log = StringBuilder::new()
   |   @event_loop.check_fd_leak.val = false
   |   @event_loop.with_event_loop() <| () => {
20 |     @async.with_task_group() <| root => {
   |            ^^^^^^^^^^^^^^^
   |       let (r, w) = @pipe.pipe()
   |       root.spawn_bg() <| () => {

<WORKDIR>/src/internal/event_loop/starvation_test.mbt:18:10-18:25:
   | ///|
   | async test "starvation" {
   |   let log = []
18 |   @async.with_task_group() <| group => {
   |          ^^^^^^^^^^^^^^^
   |     group.spawn_bg() <| () => {
   |       @async.sleep(50)

<WORKDIR>/src/internal/event_loop/worker_wbtest.mbt:36:10-36:25:
   | ///|
   | async test "worker basic" {
   |   let log = StringBuilder::new()
36 |   @async.with_task_group() <| root => {
   |          ^^^^^^^^^^^^^^^
   |     root.spawn_bg() <| () => {
   |       for _ in 0..<3 {

<WORKDIR>/src/internal/event_loop/worker_wbtest.mbt:61:10-61:25:
   | ///|
   | async test "worker multiple" {
   |   let log = StringBuilder::new()
61 |   @async.with_task_group() <| root => {
   |          ^^^^^^^^^^^^^^^
   |     root.spawn_bg() <| () => {
   |       for _ in 0..<3 {

<WORKDIR>/src/internal/event_loop/worker_wbtest.mbt:92:10-92:25:
   | ///|
   | async test "worker cancel1" {
   |   let log = StringBuilder::new()
92 |   @async.with_task_group() <| root => {
   |          ^^^^^^^^^^^^^^^
   |     root.spawn_bg() <| () => {
   |       for _ in 0..<4 {

<WORKDIR>/src/internal/event_loop/worker_wbtest.mbt:130:10-130:25:
    | ///|
    | async test "worker cancel2" {
    |   let log = StringBuilder::new()
130 |   @async.with_task_group() <| root => {
    |          ^^^^^^^^^^^^^^^
    |     root.spawn_bg() <| () => {
    |       for _ in 0..<3 {

<WORKDIR>/src/io/README.mbt.md:28:10-28:25:
   | ```moonbit check
   | ///|
   | async test "quick start pipeline" {
28 |   @async.with_task_group(root => {
   |          ^^^^^^^^^^^^^^^
   |     // Create a pair of connected endpoints that speak the Reader/Writer protocols.
   |     // Data written to the write end (`writer`) can be read from the read end (`reader`)

<WORKDIR>/src/io/README.mbt.md:67:10-67:25:
   | ```moonbit check
   | ///|
   | async test "data as binary" {
67 |   @async.with_task_group(root => {
   |          ^^^^^^^^^^^^^^^
   |     let (r, w) = @io.pipe()
   |     defer r.close()

<WORKDIR>/src/io/README.mbt.md:83:10-83:25:
   | 
   | ///|
   | async test "data as text" {
83 |   @async.with_task_group(root => {
   |          ^^^^^^^^^^^^^^^
   |     let (r, w) = @io.pipe()
   |     defer r.close()

<WORKDIR>/src/io/README.mbt.md:99:10-99:25:
   | 
   | ///|
   | async test "data as json" {
99 |   @async.with_task_group(root => {
   |          ^^^^^^^^^^^^^^^
   |     let (r, w) = @io.pipe()
   |     defer r.close()

<WORKDIR>/src/io/README.mbt.md:131:10-131:25:
    | ```moonbit check
    | ///|
    | async test "read from reader" {
131 |   @async.with_task_group(root => {
    |          ^^^^^^^^^^^^^^^
    |     // Create connected endpoints. `r` is a Reader, `w` is a Writer.
    |     let (r, w) = @io.pipe()

<WORKDIR>/src/io/README.mbt.md:154:10-154:25:
    | 
    | ///|
    | async test "read_exactly - read exact number of bytes" {
154 |   @async.with_task_group(root => {
    |          ^^^^^^^^^^^^^^^
    |     let (r, w) = @io.pipe()
    |     defer r.close()

<WORKDIR>/src/io/README.mbt.md:172:10-172:25:
    | 
    | ///|
    | async test "read_some - read next chunk of data" {
172 |   @async.with_task_group(root => {
    |          ^^^^^^^^^^^^^^^
    |     let (r, w) = @io.pipe()
    |     defer r.close()

<WORKDIR>/src/io/README.mbt.md:217:10-217:25:
    | 
    | ///|
    | async test "read_all - read entire content" {
217 |   @async.with_task_group(root => {
    |          ^^^^^^^^^^^^^^^
    |     let (r, w) = @io.pipe()
    |     defer r.close()

<WORKDIR>/src/io/README.mbt.md:233:10-233:25:
    | 
    | ///|
    | async test "read_all large data" {
233 |   @async.with_task_group(root => {
    |          ^^^^^^^^^^^^^^^
    |     let (r, w) = @io.pipe()
    |     defer r.close()

<WORKDIR>/src/io/README.mbt.md:247:10-247:25:
    | 
    | ///|
    | async test "drop - advance stream by discarding data" {
247 |   @async.with_task_group(root => {
    |          ^^^^^^^^^^^^^^^
    |     let (r, w) = @io.pipe()
    |     defer r.close()

<WORKDIR>/src/io/README.mbt.md:264:10-264:25:
    | 
    | ///|
    | async test "read_until - read text from stream until a separator is found" {
264 |   @async.with_task_group(root => {
    |          ^^^^^^^^^^^^^^^
    |     let (r, w) = @io.pipe()
    |     defer r.close()

<WORKDIR>/src/io/README.mbt.md:368:10-368:25:
    | ```moonbit check
    | ///|
    | async test "write to writer" {
368 |   @async.with_task_group(root => {
    |          ^^^^^^^^^^^^^^^
    |     let (r, w) = @io.pipe()
    |     defer r.close()

<WORKDIR>/src/io/README.mbt.md:386:10-386:25:
    | 
    | ///|
    | async test "write_once - single write operation" {
386 |   @async.with_task_group(root => {
    |          ^^^^^^^^^^^^^^^
    |     let (r, w) = @io.pipe()
    |     defer r.close()

<WORKDIR>/src/io/README.mbt.md:403:10-403:25:
    | 
    | ///|
    | async test "write large data" {
403 |   @async.with_task_group(root => {
    |          ^^^^^^^^^^^^^^^
    |     let (r, w) = @io.pipe()
    |     root.spawn_bg(() => {

<WORKDIR>/src/io/README.mbt.md:421:10-421:25:
    | ///|
    | async test "write_reader - copy from reader to writer" {
    |   let log = StringBuilder::new()
421 |   @async.with_task_group(root => {
    |          ^^^^^^^^^^^^^^^
    |     let (r1, w1) = @io.pipe()
    |     let (r2, w2) = @io.pipe()

<WORKDIR>/src/io/README.mbt.md:466:10-466:25:
    | 
    | ///|
    | async test "write string" {
466 |   @async.with_task_group(root => {
    |          ^^^^^^^^^^^^^^^
    |     let (r, w) = @io.pipe()
    |     defer r.close()

<WORKDIR>/src/io/README.mbt.md:489:10-489:25:
    | ///|
    | async test "BufferedWriter - basic buffering" {
    |   let log = StringBuilder::new()
489 |   @async.with_task_group(root => {
    |          ^^^^^^^^^^^^^^^
    |     let (r, w) = @io.pipe()
    |     root.spawn_bg(() => {

<WORKDIR>/src/io/README.mbt.md:527:10-527:25:
    | 
    | ///|
    | async test "BufferedWriter::new with custom size" {
527 |   @async.with_task_group(root => {
    |          ^^^^^^^^^^^^^^^
    |     let (r, w) = @io.pipe()
    |     defer r.close()

<WORKDIR>/src/io/README.mbt.md:545:10-545:25:
    | 
    | ///|
    | async test "BufferedWriter::flush - commit buffered data" {
545 |   @async.with_task_group(root => {
    |          ^^^^^^^^^^^^^^^
    |     let (r, w) = @io.pipe()
    |     defer r.close()

<WORKDIR>/src/io/README.mbt.md:565:10-565:25:
    | ///|
    | async test "BufferedWriter::write_reader - buffered copy" {
    |   let log = StringBuilder::new()
565 |   @async.with_task_group(root => {
    |          ^^^^^^^^^^^^^^^
    |     let (r1, w1) = @io.pipe()
    |     let (r2, w2) = @io.pipe()

<WORKDIR>/src/io/buffered_writer_test.mbt:18:10-18:25:
   | ///|
   | async test "BufferedWriter" {
   |   let log = StringBuilder::new()
18 |   @async.with_task_group() <| fn(root) {
   |          ^^^^^^^^^^^^^^^
   |     let (r, w) = @io.pipe()
   |     root.spawn_bg() <| () => {

<WORKDIR>/src/io/buffered_writer_test.mbt:56:10-56:25:
   | ///|
   | async test "BufferedWriter::write_reader" {
   |   let log = StringBuilder::new()
56 |   @async.with_task_group() <| fn(root) {
   |          ^^^^^^^^^^^^^^^
   |     let (r1, w1) = @io.pipe()
   |     let (r2, w2) = @io.pipe()

<WORKDIR>/src/io/pipe_test.mbt:18:10-18:25:
   | ///|
   | async test "PipeRead blocked cancellation safety" {
   |   let (r, w) = @io.pipe()
18 |   @async.with_task_group <| group => {
   |          ^^^^^^^^^^^^^^^
   |     let reader = group.spawn() <| () => {
   |       defer r.close()

<WORKDIR>/src/io/pipe_test.mbt:40:10-40:25:
   | ///|
   | async test "PipeWrite blocked cancellation safety" {
   |   let (r, w) = @io.pipe()
40 |   @async.with_task_group <| group => {
   |          ^^^^^^^^^^^^^^^
   |     let writer = group.spawn() <| () => {
   |       defer w.close()

<WORKDIR>/src/io/pipe_test.mbt:67:10-67:25:
   | ///|
   | async test "PipeRead immediate cancellation safety" {
   |   let (r, w) = @io.pipe()
67 |   @async.with_task_group <| group => {
   |          ^^^^^^^^^^^^^^^
   |     let reader = group.spawn() <| () => {
   |       defer r.close()

<WORKDIR>/src/io/pipe_test.mbt:88:10-88:25:
   | ///|
   | async test "PipeWrite immediate cancellation safety" {
   |   let (r, w) = @io.pipe()
88 |   @async.with_task_group <| group => {
   |          ^^^^^^^^^^^^^^^
   |     let writer = group.spawn() <| () => {
   |       defer w.close()

<WORKDIR>/src/io/read_all_test.mbt:32:10-32:25:
   | ///|
   | async test "read_all basic" {
   |   let log = StringBuilder::new()
32 |   @async.with_task_group() <| root => {
   |          ^^^^^^^^^^^^^^^
   |     let (r, w) = @io.pipe()
   |     defer r.close()

<WORKDIR>/src/io/read_all_test.mbt:42:10-42:25:
   | 
   | ///|
   | async test "read_all large data" {
42 |   @async.with_task_group() <| root => {
   |          ^^^^^^^^^^^^^^^
   |     let (r, w) = @io.pipe()
   |     defer r.close()

<WORKDIR>/src/io/read_some_test.mbt:18:10-18:25:
   | ///|
   | async test "read_some basic" {
   |   let log = StringBuilder::new()
18 |   @async.with_task_group() <| root => {
   |          ^^^^^^^^^^^^^^^
   |     let (r, w) = @io.pipe()
   |     defer r.close()

<WORKDIR>/src/io/read_some_test.mbt:43:10-43:25:
   | ///|
   | async test "read_some length limit 1" {
   |   let log = StringBuilder::new()
43 |   @async.with_task_group() <| root => {
   |          ^^^^^^^^^^^^^^^
   |     let (r, w) = @io.pipe()
   |     defer r.close()

<WORKDIR>/src/io/read_some_test.mbt:71:10-71:25:
   | ///|
   | async test "read_some length limit 2" {
   |   let log = StringBuilder::new()
71 |   @async.with_task_group() <| root => {
   |          ^^^^^^^^^^^^^^^
   |     let (r, w) = @io.pipe()
   |     defer r.close()

<WORKDIR>/src/io/read_some_test.mbt:98:10-98:25:
   | ///|
   | async test "read_some length limit 3" {
   |   let log = StringBuilder::new()
98 |   @async.with_task_group() <| root => {
   |          ^^^^^^^^^^^^^^^
   |     let (r, w) = @io.pipe()
   |     defer r.close()

<WORKDIR>/src/io/writer_test.mbt:17:10-17:25:
   | 
   | ///|
   | async test "write large data" {
17 |   @async.with_task_group() <| root => {
   |          ^^^^^^^^^^^^^^^
   |     let (r, w) = @io.pipe()
   |     root.spawn_bg() <| () => {

<WORKDIR>/src/io/writer_test.mbt:34:10-34:25:
   | ///|
   | async test "write reader" {
   |   let log = StringBuilder::new()
34 |   @async.with_task_group() <| root => {
   |          ^^^^^^^^^^^^^^^
   |     let (r1, w1) = @io.pipe()
   |     let (r2, w2) = @io.pipe()

<WORKDIR>/src/io/writer_test.mbt:108:10-108:25:
    | 
    | ///|
    | async test "write_string" {
108 |   @async.with_task_group() <| root => {
    |          ^^^^^^^^^^^^^^^
    |     let (r, w) = @io.pipe()
    |     defer r.close()

<WORKDIR>/src/lazy_init_test.mbt:115:23-115:38:
    |     }
    |     log.push("lazy init completed at tick \{current_tick()}")
    |   })
115 |   let result = @async.with_task_group(group => {
    |                       ^^^^^^^^^^^^^^^
    |     group.spawn_bg() <| () => {
    |       x.wait()

<WORKDIR>/src/lazy_init_test.mbt:146:10-146:25:
    |     }
    |     log.push("lazy init completed at tick \{current_tick()}")
    |   })
146 |   @async.with_task_group() <| group => {
    |          ^^^^^^^^^^^^^^^
    |     group.spawn_bg() <| () => {
    |       debug_inspect(

<WORKDIR>/src/mutex_test.mbt:18:10-18:25:
   | ///|
   | async test "mutex basic" {
   |   let log = []
18 |   @async.with_task_group() <| group => {
   |          ^^^^^^^^^^^^^^^
   |     let mutex = @async.Mutex()
   |     for i in 0..<3 {

<WORKDIR>/src/mutex_test.mbt:42:10-42:25:
   | 
   | ///|
   | async test "mutex cancellation" {
42 |   @async.with_task_group() <| group => {
   |          ^^^^^^^^^^^^^^^
   |     let mutex = @async.Mutex()
   |     group.spawn_bg() <| () => {

<WORKDIR>/src/mutex_test.mbt:63:10-63:25:
   | ///|
   | async test "mutex cancellation no_swallow" {
   |   let log = []
63 |   @async.with_task_group() <| group => {
   |          ^^^^^^^^^^^^^^^
   |     let mutex = @async.Mutex()
   |     mutex.acquire()

<WORKDIR>/src/mutex_test.mbt:82:10-82:25:
   | ///|
   | async test "mutex fairness" {
   |   let log = []
82 |   @async.with_task_group() <| group => {
   |          ^^^^^^^^^^^^^^^
   |     let mutex = @async.Mutex()
   |     group.spawn_bg() <| () => {

<WORKDIR>/src/no_wait_test.mbt:18:10-18:25:
   | ///|
   | async test "no_wait cancelled" {
   |   let buf = StringBuilder::new()
18 |   @async.with_task_group() <| root => {
   |          ^^^^^^^^^^^^^^^
   |     root.spawn_bg(no_wait=true) <| () => {
   |       try @async.sleep(1000) catch {

<WORKDIR>/src/no_wait_test.mbt:45:10-45:25:
   | ///|
   | async test "no_wait normal exit" {
   |   let buf = StringBuilder::new()
45 |   @async.with_task_group() <| root => {
   |          ^^^^^^^^^^^^^^^
   |     root.spawn_bg(no_wait=true) <| () => {
   |       try @async.sleep(100) catch {

<WORKDIR>/src/pipe/read_exactly_test.mbt:22:10-22:25:
   |     buf..write_string(msg).write_char('\n')
   |   }
   | 
22 |   @async.with_task_group() <| root => {
   |          ^^^^^^^^^^^^^^^
   |     let (r, w) = @pipe.pipe()
   |     // reader

<WORKDIR>/src/pipe/read_exactly_test.mbt:64:11-64:26:
   |     buf..write_string(msg).write_char('\n')
   |   }
   | 
64 |   (@async.with_task_group() <| root => {
   |           ^^^^^^^^^^^^^^^
   |     let (r, w) = @pipe.pipe()
   |     // reader

<WORKDIR>/src/process/README.mbt.md:38:10-38:25:
   | ///|
   | #cfg(all(target="native", not(platform="windows")))
   | async test "spawn command in background" {
38 |   @async.with_task_group(group => {
   |          ^^^^^^^^^^^^^^^
   |     let process = @process.spawn(group, "sh", ["-c", "sleep 0.5; exit 42"])
   |     // do other stuff while the process is running in the background

<WORKDIR>/src/process/README.mbt.md:141:10-141:25:
    | ///|
    | #cfg(all(target="native", not(platform="windows")))
    | async test "read from process with pipe" {
141 |   @async.with_task_group(group => {
    |          ^^^^^^^^^^^^^^^
    |     let (reader, writer) = @process.read_from_process()
    |     defer reader.close()

<WORKDIR>/src/process/README.mbt.md:159:10-159:25:
    | ///|
    | #cfg(all(target="native", not(platform="windows")))
    | async test "write to process with pipe" {
159 |   @async.with_task_group(group => {
    |          ^^^^^^^^^^^^^^^
    |     let (cat_read, we_write) = @process.write_to_process()
    |     let (we_read, cat_write) = @process.read_from_process()

<WORKDIR>/src/process/README.mbt.md:192:10-192:25:
    | ///|
    | #cfg(all(target="native", not(platform="windows")))
    | async test "redirect input from file" {
192 |   @async.with_task_group(root => {
    |          ^^^^^^^^^^^^^^^
    |     let input_file = "_build/process_test_input.txt"
    |     @fs.write_file(input_file, "file content", create_mode=CreateOrTruncate)

<WORKDIR>/src/process/README.mbt.md:215:10-215:25:
    | ///|
    | #cfg(all(target="native", not(platform="windows")))
    | async test "redirect output to file" {
215 |   @async.with_task_group(root => {
    |          ^^^^^^^^^^^^^^^
    |     let output_file = "_build/process_test_output.txt"
    |     root.add_defer(() => @fs.remove(output_file))

<WORKDIR>/src/process/README.mbt.md:241:10-241:25:
    | ///|
    | #cfg(all(target="native", not(platform="windows")))
    | async test "file to file redirection" {
241 |   @async.with_task_group(root => {
    |          ^^^^^^^^^^^^^^^
    |     let input_file = "_build/process_redirect_in.txt"
    |     let output_file = "_build/process_redirect_out.txt"

<WORKDIR>/src/process/README.mbt.md:397:10-397:25:
    | ///|
    | #cfg(all(target="native", not(platform="windows")))
    | async test "merge stdout and stderr" {
397 |   @async.with_task_group(group => {
    |          ^^^^^^^^^^^^^^^
    |     let (reader, writer) = @process.read_from_process()
    |     defer reader.close()

<WORKDIR>/src/process/README.mbt.md:422:10-422:25:
    | ///|
    | #cfg(all(target="native", not(platform="windows")))
    | async test "multiple processes to one pipe" {
422 |   @async.with_task_group(root => {
    |          ^^^^^^^^^^^^^^^
    |     let (reader, writer) = @pipe.pipe()
    |     root.spawn_bg(no_wait=true, () => {

<WORKDIR>/src/process/README.mbt.md:431:12-431:27:
    |       inspect(output.contains("second"), content="true")
    |     })
    |     defer writer.close()
431 |     @async.with_task_group(group => {
    |            ^^^^^^^^^^^^^^^
    |       @process.spawn(group, "echo", ["first"], stdout=writer) |> ignore
    |       @process.spawn(group, "echo", ["second"], stdout=writer) |> ignore

<WORKDIR>/src/process/basic_test.mbt:18:10-18:25:
   | 
   | ///|
   | async test "basic_ls" {
18 |   @async.with_task_group() <| group => {
   |          ^^^^^^^^^^^^^^^
   |     let (r, w) = @process.read_from_process()
   |     defer r.close()

<WORKDIR>/src/process/basic_test.mbt:40:10-40:25:
   | ///|
   | async test "basic_cat" {
   |   let cat = cat.wait()
40 |   @async.with_task_group() <| group => {
   |          ^^^^^^^^^^^^^^^
   |     let (cat_read, we_write) = @process.write_to_process()
   |     let (we_read, cat_write) = @process.read_from_process()

<WORKDIR>/src/process/cancel_test.mbt:20:10-20:25:
   | async test "cancel process" {
   |   let test_prog = sleep_prog.wait()
   |   let log = StringBuilder::new()
20 |   @async.with_task_group() <| root => {
   |          ^^^^^^^^^^^^^^^
   |     let (r, w) = @process.read_from_process()
   |     let task = root.spawn(() => {

<WORKDIR>/src/process/cancel_test.mbt:51:10-51:25:
   | ///|
   | async test "cancel process timeout" {
   |   let test_prog = sleep_prog.wait()
51 |   @async.with_task_group() <| root => {
   |          ^^^^^^^^^^^^^^^
   |     let (r, w) = @process.read_from_process()
   |     let task = root.spawn(() => {

<WORKDIR>/src/process/cancel_test.mbt:87:10-87:25:
   | ///|
   | async test "cancel process hard" {
   |   let test_prog = sleep_prog.wait()
87 |   @async.with_task_group() <| root => {
   |          ^^^^^^^^^^^^^^^
   |     let (r, w) = @process.read_from_process()
   |     let task = root.spawn(() => {

<WORKDIR>/src/process/cancel_test.mbt:116:10-116:25:
    | ///|
    | async test "orphan process" {
    |   let log = StringBuilder::new()
116 |   @async.with_task_group() <| root => {
    |          ^^^^^^^^^^^^^^^
    |     let (r, w) = @process.read_from_process()
    |     let task = root.spawn(() => {

<WORKDIR>/src/process/cwd_test.mbt:18:10-18:25:
   | 
   | ///|
   | async test "set cwd" {
18 |   @async.with_task_group() <| root => {
   |          ^^^^^^^^^^^^^^^
   |     // FIXME(upstram): missing codelens here
   |     guard @env.current_dir() is Some(prev_cwd)

<WORKDIR>/src/process/env_test.mbt:18:10-18:25:
   | 
   | ///|
   | async test "set_env" {
18 |   @async.with_task_group() <| group => {
   |          ^^^^^^^^^^^^^^^
   |     let (r, w) = @process.read_from_process()
   |     defer r.close()

<WORKDIR>/src/process/env_test.mbt:36:10-36:25:
   | ///|
   | async test "set_env no inherit" {
   |   let test_prog = dump_env_prog.wait()
36 |   @async.with_task_group() <| group => {
   |          ^^^^^^^^^^^^^^^
   |     let (r, w) = @process.read_from_process()
   |     defer r.close()

<WORKDIR>/src/process/helper_test.mbt:60:10-60:25:
   | ///|
   | async test "collect_output blocked" {
   |   let test_prog = cat.wait()
60 |   @async.with_task_group() <| group => {
   |          ^^^^^^^^^^^^^^^
   |     let (cat_read, we_write) = @process.write_to_process()
   |     group.spawn_bg() <| () => {

<WORKDIR>/src/process/process.mbt:152:16-152:31:
    |   process.wait_pid(context~) catch {
    |     _ if @coroutine.is_being_cancelled() =>
    |       @async.protect_from_cancel() <| () => {
152 |         @async.with_task_group() <| group => {
    |                ^^^^^^^^^^^^^^^
    |           group.spawn_bg(no_wait=true, () => cancel_handler(pid))
    |           process.wait_pid(context~)

<WORKDIR>/src/process/process.mbt:238:18-238:33:
    |     process.wait_pid(context~) catch {
    |       _ if @coroutine.is_being_cancelled() =>
    |         @async.protect_from_cancel() <| () => {
238 |           @async.with_task_group() <| group => {
    |                  ^^^^^^^^^^^^^^^
    |             group.spawn_bg(no_wait=true, () => cancel_handler(pid))
    |             process.wait_pid(context~)

<WORKDIR>/src/process/process.mbt:265:10-265:25:
    |   no_console_window? : Bool,
    | ) -> (Int, &@io.Data) {
    |   let (r, w) = read_from_process()
265 |   @async.with_task_group() <| group => {
    |          ^^^^^^^^^^^^^^^
    |     defer r.close()
    |     let exit_code = group.spawn(() => {

<WORKDIR>/src/process/process.mbt:301:10-301:25:
    |   no_console_window? : Bool,
    | ) -> (Int, &@io.Data) {
    |   let (r, w) = read_from_process()
301 |   @async.with_task_group() <| group => {
    |          ^^^^^^^^^^^^^^^
    |     defer r.close()
    |     let exit_code = group.spawn(() => {

<WORKDIR>/src/process/process.mbt:338:10-338:25:
    | ) -> (Int, &@io.Data, &@io.Data) {
    |   let (r_out, w_out) = read_from_process()
    |   let (r_err, w_err) = read_from_process()
338 |   @async.with_task_group() <| group => {
    |          ^^^^^^^^^^^^^^^
    |     let exit_code = group.spawn(() => {
    |       run(

<WORKDIR>/src/process/process.mbt:380:10-380:25:
    |   no_console_window? : Bool,
    | ) -> (Int, &@io.Data) {
    |   let (r, w) = read_from_process()
380 |   @async.with_task_group() <| group => {
    |          ^^^^^^^^^^^^^^^
    |     defer r.close()
    |     let exit_code = group.spawn(() => {

<WORKDIR>/src/process/redirect_test.mbt:18:10-18:25:
   | 
   | ///|
   | async test "merge multiple" {
18 |   @async.with_task_group() <| root => {
   |          ^^^^^^^^^^^^^^^
   |     let (r, w) = @pipe.pipe()
   |     root.spawn_bg(no_wait=true) <| () => {

<WORKDIR>/src/process/redirect_test.mbt:25:12-25:27:
   |       inspect(r.read_all().text(), content="abcdefgh")
   |     }
   |     defer w.close()
25 |     @async.with_task_group() <| group => {
   |            ^^^^^^^^^^^^^^^
   |       @process.spawn(group, shell, ["-c", "\{write_stdout} abcd"], stdout=w, extra_env={
   |         "LANG": "en_US.UTF-8",

<WORKDIR>/src/process/redirect_test.mbt:45:10-45:25:
   | ///|
   | async test "redirect to file" {
   |   let cat = cat.wait()
45 |   @async.with_task_group() <| root => {
   |          ^^^^^^^^^^^^^^^
   |     let input_file = "_build/process_redirect_test_in.txt"
   |     let output_file = "_build/process_redirect_test_out.txt"

<WORKDIR>/src/process/redirect_test.mbt:66:10-66:25:
   | 
   | ///|
   | async test "merge stdout and stderr" {
66 |   @async.with_task_group() <| group => {
   |          ^^^^^^^^^^^^^^^
   |     let (r, w) = @process.read_from_process()
   |     defer r.close()

<WORKDIR>/src/process/spawn_in_group_test.mbt:20:10-20:25:
   |   let log = []
   |   let sleep = sleep_prog.wait()
   |   let t0 = @env.now()
20 |   @async.with_task_group() <| group => {
   |          ^^^^^^^^^^^^^^^
   |     let _ = @process.spawn(group, sleep, ["500"])
   |     @async.sleep(250)

<WORKDIR>/src/process/spawn_in_group_test.mbt:36:10-36:25:
   | ///|
   | async test "spawn_in_group cancel" {
   |   let sleep = sleep_prog.wait()
36 |   @async.with_task_group() <| outer => {
   |          ^^^^^^^^^^^^^^^
   |     let (r, w) = @process.read_from_process()
   |     outer.spawn_bg() <| () => {

<WORKDIR>/src/process/spawn_in_group_test.mbt:42:12-42:27:
   |       defer r.close()
   |       inspect(r.read_all().text().trim(), content="received termination signal")
   |     }
42 |     @async.with_task_group() <| inner => {
   |            ^^^^^^^^^^^^^^^
   |       let _ = @process.spawn(inner, sleep, ["10000"], stdout=w, no_wait=true)
   |       @async.sleep(300)

<WORKDIR>/src/process/spawn_in_group_test.mbt:53:10-53:25:
   | async test "Process::wait" {
   |   let sleep = sleep_prog.wait()
   |   let mut t0 = 0UL
53 |   @async.with_task_group() <| group => {
   |          ^^^^^^^^^^^^^^^
   |     let child = @process.spawn(group, sleep, ["500", "-exit-code", "42"])
   |     t0 = @env.now()

<WORKDIR>/src/process/spawn_in_group_test.mbt:68:10-68:25:
   | ///|
   | async test "Process::try_wait" {
   |   let sleep = sleep_prog.wait()
68 |   @async.with_task_group() <| group => {
   |          ^^^^^^^^^^^^^^^
   |     let child = @process.spawn(group, sleep, ["450", "-exit-code", "42"])
   |     @async.sleep(300)

<WORKDIR>/src/process/spawn_in_group_test.mbt:81:10-81:25:
   | async test "Process:cancel" {
   |   let sleep = sleep_prog.wait()
   |   let mut t0 = 0UL
81 |   @async.with_task_group() <| group => {
   |          ^^^^^^^^^^^^^^^
   |     let (r, w) = @process.read_from_process()
   |     group.spawn_bg() <| () => {

<WORKDIR>/src/process/wait_test.mbt:20:10-20:25:
   | async test "basic wait" {
   |   let log = StringBuilder::new()
   |   let test_prog = sleep_prog.wait()
20 |   @async.with_task_group() <| root => {
   |          ^^^^^^^^^^^^^^^
   |     root.spawn_bg() <| () => {
   |       for i in 0..<2 {

<WORKDIR>/src/process/wait_test.mbt:51:10-51:25:
   | async test "wait_pid" {
   |   let log = StringBuilder::new()
   |   let test_prog = sleep_prog.wait()
51 |   @async.with_task_group() <| group => {
   |          ^^^^^^^^^^^^^^^
   |     group.spawn_bg() <| () => {
   |       for _ in 0..<2 {

<WORKDIR>/src/protect_from_cancel_test.mbt:18:10-18:25:
   | ///|
   | async test "protect_from_cancel" {
   |   let log = StringBuilder::new()
18 |   @async.with_task_group(root => {
   |          ^^^^^^^^^^^^^^^
   |     root.spawn_bg() <| () => {
   |       @async.protect_from_cancel(() => {

<WORKDIR>/src/protect_from_cancel_test.mbt:65:10-65:25:
   | ///|
   | async test "protect_from_cancel wait" {
   |   let log = StringBuilder::new()
65 |   @async.with_task_group(root => {
   |          ^^^^^^^^^^^^^^^
   |     root.spawn_bg() <| () => {
   |       @async.sleep(200)

<WORKDIR>/src/protect_from_cancel_test.mbt:72:12-72:27:
   |       @async.sleep(200)
   |       log <+ "400ms tick\n"
   |     }
72 |     @async.with_task_group(group => {
   |            ^^^^^^^^^^^^^^^
   |       group.spawn_bg() <| () => {
   |         @async.sleep(300)

<WORKDIR>/src/protect_from_cancel_test.mbt:103:10-103:25:
    | ///|
    | async test "protect_from_cancel with_timeout" {
    |   let log = StringBuilder::new()
103 |   @async.with_task_group() <| root => {
    |          ^^^^^^^^^^^^^^^
    |     root.spawn_bg() <| () => {
    |       @async.sleep(200)

<WORKDIR>/src/protect_from_cancel_test.mbt:136:14-136:29:
    |   let log = StringBuilder::new()
    |   let result : Error = @test_util.expect_error_async <| () => {
    |     (
136 |       @async.with_task_group(root => {
    |              ^^^^^^^^^^^^^^^
    |         root.spawn_bg() <| () => {
    |           @async.sleep(200)

<WORKDIR>/src/protect_from_cancel_test.mbt:167:10-167:25:
    | ///|
    | async test "protect_from_cancel nested1" {
    |   let log = StringBuilder::new()
167 |   @async.with_task_group() <| root => {
    |          ^^^^^^^^^^^^^^^
    |     root.spawn_bg() <| () => {
    |       @async.sleep(200)

<WORKDIR>/src/protect_from_cancel_test.mbt:200:10-200:25:
    | ///|
    | async test "protect_from_cancel nested2" {
    |   let log = StringBuilder::new()
200 |   @async.with_task_group() <| root => {
    |          ^^^^^^^^^^^^^^^
    |     root.spawn_bg() <| () => {
    |       @async.sleep(200)

<WORKDIR>/src/protect_from_cancel_test.mbt:239:10-239:25:
    | ///|
    | async test "protect_from_cancel in cancellation handler" {
    |   let log = StringBuilder::new()
239 |   @async.with_task_group(root => {
    |          ^^^^^^^^^^^^^^^
    |     root.spawn_bg(no_wait=true) <| () => {
    |       @async.sleep(400) catch {

<WORKDIR>/src/protect_from_cancel_test.mbt:269:10-269:25:
    | ///|
    | async test "cancel while scheduled" {
    |   let log = StringBuilder::new()
269 |   @async.with_task_group() <| root => {
    |          ^^^^^^^^^^^^^^^
    |     root.spawn_bg() <| () => {
    |       for _ in 0..<2 {

<WORKDIR>/src/protect_from_cancel_test.mbt:312:10-312:25:
    | ///|
    | async test "error in async cancel" {
    |   let log = StringBuilder::new()
312 |   @async.with_task_group() <| root => {
    |          ^^^^^^^^^^^^^^^
    |     root.spawn_bg() <| () => {
    |       for _ in 0..<2 {

<WORKDIR>/src/protect_from_cancel_test.mbt:319:12-319:27:
    |         log <+ "tick\n"
    |       }
    |     }
319 |     @async.with_task_group(group => {
    |            ^^^^^^^^^^^^^^^
    |       group.spawn_bg(no_wait=true, allow_failure=true) <| () => {
    |         @async.sleep(1000) catch {

<WORKDIR>/src/raw_fd/raw_fd_test.mbt:25:10-25:25:
   |   )
   |   assert_true(@event_loop.kind_of_fd(r, context="kind_of_fd") is Pipe)
   |   assert_true(@event_loop.kind_of_fd(w, context="kind_of_fd") is Pipe)
25 |   @async.with_task_group <| group => {
   |          ^^^^^^^^^^^^^^^
   |     group.spawn_bg() <| () => {
   |       let r = @raw_fd.RawFd(r)

<WORKDIR>/src/raw_fd/raw_fd_test.mbt:67:10-67:25:
   |   )
   |   assert_true(@event_loop.kind_of_fd(r, context="kind_of_fd") is Pipe)
   |   assert_true(@event_loop.kind_of_fd(w, context="kind_of_fd") is Pipe)
67 |   @async.with_task_group <| group => {
   |          ^^^^^^^^^^^^^^^
   |     group.spawn_bg() <| () => {
   |       let r = @raw_fd.RawFdStream(r)

<WORKDIR>/src/raw_fd/raw_fd_test.mbt:156:10-156:25:
    |   let log = []
    |   let server = @socket.UdpServer(@socket.Addr::parse("127.0.0.1:0"))
    |   let port = server.addr.port()
156 |   @async.with_task_group <| group => {
    |          ^^^^^^^^^^^^^^^
    |     group.spawn_bg(no_wait=true) <| () => {
    |       defer server.close()

<WORKDIR>/src/return_immediately_test.mbt:17:10-17:25:
   | 
   | ///|
   | async test "return_immediately basic" {
17 |   @async.with_task_group(root => {
   |          ^^^^^^^^^^^^^^^
   |     root.spawn_bg() <| () => {
   |       @async.sleep(200)

<WORKDIR>/src/return_immediately_test.mbt:28:10-28:25:
   | 
   | ///|
   | async test "return_immediately nested" {
28 |   @async.with_task_group(root => {
   |          ^^^^^^^^^^^^^^^
   |     root.spawn_bg() <| () => { @async.sleep(300) }
   |     @async.with_task_group() <| fn(group) {

<WORKDIR>/src/return_immediately_test.mbt:30:12-30:27:
   | async test "return_immediately nested" {
   |   @async.with_task_group(root => {
   |     root.spawn_bg() <| () => { @async.sleep(300) }
30 |     @async.with_task_group() <| fn(group) {
   |            ^^^^^^^^^^^^^^^
   |       group.spawn_bg() <| () => {
   |         @async.sleep(200)

<WORKDIR>/src/return_immediately_test.mbt:44:12-44:27:
   | async test "return_immediately error on cancel" {
   |   let log = StringBuilder::new()
   |   let err = @test_util.expect_error_async <| () => {
44 |     @async.with_task_group(root => {
   |            ^^^^^^^^^^^^^^^
   |       root.spawn_bg() <| () => {
   |         @async.sleep(200)

<WORKDIR>/src/return_immediately_test.mbt:73:10-73:25:
   | ///|
   | async test "return_immediately recursive cancel" {
   |   let log = []
73 |   @async.with_task_group() <| group => {
   |          ^^^^^^^^^^^^^^^
   |     group.spawn_bg() <| () => {
   |       @async.sleep(100)

<WORKDIR>/src/return_immediately_test.mbt:78:12-78:27:
   |       @async.sleep(100)
   |       log.push("100ms tick")
   |     }
78 |     @async.with_task_group(group => {
   |            ^^^^^^^^^^^^^^^
   |       group.return_immediately(()) catch {
   |         _ => @async.sleep(200)

<WORKDIR>/src/return_immediately_test.mbt:93:10-93:25:
   | ///|
   | async test "return_immediately called outside" {
   |   let log = []
93 |   @async.with_task_group() <| outer => {
   |          ^^^^^^^^^^^^^^^
   |     outer.spawn_bg() <| () => {
   |       @async.sleep(100)

<WORKDIR>/src/return_immediately_test.mbt:98:12-98:27:
   |       @async.sleep(100)
   |       log.push("100ms tick")
   |     }
98 |     @async.with_task_group(inner => {
   |            ^^^^^^^^^^^^^^^
   |       outer.spawn_bg(() => inner.return_immediately(()))
   |     })

<WORKDIR>/src/semaphore/README.mbt.md:44:10-44:25:
   | async test "mutex serializes access" {
   |   let mutex = @semaphore.Semaphore(1)
   |   let log = []
44 |   @async.with_task_group <| group => {
   |          ^^^^^^^^^^^^^^^
   |     for i in 0..<3 {
   |       group.spawn_bg() <| () => {

<WORKDIR>/src/semaphore/README.mbt.md:85:10-85:25:
   |   let limit = @semaphore.Semaphore(3)
   |   let mut active = 0
   |   let mut peak = 0
85 |   @async.with_task_group <| group => {
   |          ^^^^^^^^^^^^^^^
   |     for _ in 0..<8 {
   |       group.spawn_bg() <| () => {

<WORKDIR>/src/semaphore/README.mbt.md:129:10-129:25:
    |   // size 1, but starts empty — acquire blocks until release().
    |   let ready = @semaphore.Semaphore(1, initial_value=0)
    |   let log = []
129 |   @async.with_task_group <| group => {
    |          ^^^^^^^^^^^^^^^
    |     group.spawn_bg() <| () => {
    |       log.push("waiter: parking")

<WORKDIR>/src/semaphore/README.mbt.md:164:10-164:25:
    |   let n = 3
    |   let done = @semaphore.Semaphore(n, initial_value=0)
    |   let log = []
164 |   @async.with_task_group <| group => {
    |          ^^^^^^^^^^^^^^^
    |     for i in 0..<n {
    |       group.spawn_bg() <| () => {

<WORKDIR>/src/semaphore/README.mbt.md:233:10-233:25:
    |   let sem = @semaphore.Semaphore(1)
    |   sem.acquire() // main holds the permit
    |   let log = []
233 |   @async.with_task_group <| group => {
    |          ^^^^^^^^^^^^^^^
    |     // Task A starts waiting at ~0 ms.
    |     group.spawn_bg() <| () => {

<WORKDIR>/src/semaphore/semaphore_test.mbt:18:10-18:25:
   | ///|
   | async test "semaphore mutex" {
   |   let log = StringBuilder::new()
18 |   @async.with_task_group() <| root => {
   |          ^^^^^^^^^^^^^^^
   |     let semaphore = @semaphore.Semaphore(1)
   |     for i in 0..<3 {

<WORKDIR>/src/semaphore/semaphore_test.mbt:51:10-51:25:
   | ///|
   | async test "semaphore multiple value" {
   |   let log = StringBuilder::new()
51 |   @async.with_task_group() <| root => {
   |          ^^^^^^^^^^^^^^^
   |     let semaphore = @semaphore.Semaphore(2)
   |     for i in 0..<6 {

<WORKDIR>/src/semaphore/semaphore_test.mbt:86:10-86:25:
   | 
   | ///|
   | async test "semaphore cancellation" {
86 |   @async.with_task_group() <| root => {
   |          ^^^^^^^^^^^^^^^
   |     let semaphore = @semaphore.Semaphore(1)
   |     root.spawn_bg() <| () => {

<WORKDIR>/src/semaphore/semaphore_test.mbt:107:10-107:25:
    | ///|
    | async test "semaphore cancellation no_swallow" {
    |   let log = StringBuilder::new()
107 |   @async.with_task_group() <| root => {
    |          ^^^^^^^^^^^^^^^
    |     let semaphore = @semaphore.Semaphore(1)
    |     semaphore.acquire()

<WORKDIR>/src/semaphore/semaphore_test.mbt:132:10-132:25:
    | ///|
    | async test "semaphore fairness" {
    |   let log = StringBuilder::new()
132 |   @async.with_task_group() <| root => {
    |          ^^^^^^^^^^^^^^^
    |     let semaphore = @semaphore.Semaphore(1)
    |     root.spawn_bg() <| () => {

<WORKDIR>/src/signal/signal_test.mbt:39:10-39:25:
   | async test "cancel with default signal" {
   |   let test_prog = sleep_prog.wait()
   |   let log = []
39 |   @async.with_task_group() <| group => {
   |          ^^^^^^^^^^^^^^^
   |     let (r, w) = @process.read_from_process()
   |     let task = group.spawn(() => {

<WORKDIR>/src/signal/signal_test.mbt:70:10-70:25:
   | async test "cancel with ctrl+c" {
   |   let test_prog = sleep_prog.wait()
   |   let log = []
70 |   @async.with_task_group() <| group => {
   |          ^^^^^^^^^^^^^^^
   |     let (r, w) = @process.read_from_process()
   |     let task = group.spawn(() => {

<WORKDIR>/src/signal/signal_test.mbt:105:10-105:25:
    | async test "cancel with SIGHUP" {
    |   let test_prog = sleep_prog.wait()
    |   let log = []
105 |   @async.with_task_group() <| group => {
    |          ^^^^^^^^^^^^^^^
    |     let (r, w) = @process.read_from_process()
    |     let task = group.spawn(() => {

<WORKDIR>/src/socket/connect_burst_test.mbt:46:10-46:25:
   | ///|
   | async test "connection burst" {
   |   let mut result = 0
46 |   @async.with_task_group() <| root => {
   |          ^^^^^^^^^^^^^^^
   |     let server = @socket.TcpServer(@socket.Addr::parse("127.0.0.1:0"))
   |     let addr = server.addr

<WORKDIR>/src/socket/connect_burst_test.mbt:51:14-51:29:
   |     let addr = server.addr
   |     root.spawn_bg(() => result = server_main(server))
   |     root.spawn_bg() <| () => {
51 |       @async.with_task_group() <| fn(ctx) {
   |              ^^^^^^^^^^^^^^^
   |         for _ in 0..<6 {
   |           ctx.spawn_bg(() => client(b"ping", addr))

<WORKDIR>/src/socket/connect_burst_test.mbt:65:10-65:25:
   | ///|
   | async test "connection burst with ipv6" {
   |   let mut result = 0
65 |   @async.with_task_group() <| root => {
   |          ^^^^^^^^^^^^^^^
   |     let server = @socket.TcpServer(
   |       @socket.Addr::parse("[::1]:0"),

<WORKDIR>/src/socket/connect_burst_test.mbt:73:14-73:29:
   |     let addr = server.addr
   |     root.spawn_bg(() => result = server_main(server))
   |     root.spawn_bg() <| () => {
73 |       @async.with_task_group() <| fn(ctx) {
   |              ^^^^^^^^^^^^^^^
   |         for _ in 0..<6 {
   |           ctx.spawn_bg(() => client(b"ping", addr))

<WORKDIR>/src/socket/dual_stack_test.mbt:26:10-26:25:
   | ///|
   | async test "Only_V4 server" {
   |   let log = StringBuilder::new()
26 |   @async.with_task_group() <| root => {
   |          ^^^^^^^^^^^^^^^
   |     let server = @socket.TcpServer(@socket.Addr::parse("0.0.0.0:0"))
   |     let port = server.addr.port()

<WORKDIR>/src/socket/dual_stack_test.mbt:80:10-80:25:
   | ///|
   | async test "Only_V6 server" {
   |   let log = StringBuilder::new()
80 |   @async.with_task_group() <| root => {
   |          ^^^^^^^^^^^^^^^
   |     let server = @socket.TcpServer(
   |       @socket.Addr::parse("[::]:0"),

<WORKDIR>/src/socket/dual_stack_test.mbt:137:10-137:25:
    | ///|
    | async test "dual stack server" {
    |   let log = StringBuilder::new()
137 |   @async.with_task_group() <| root => {
    |          ^^^^^^^^^^^^^^^
    |     let server = @socket.TcpServer(@socket.Addr::parse("[::]:0"))
    |     let port = server.addr.port()

<WORKDIR>/src/socket/dual_stack_test.mbt:188:10-188:25:
    | ///|
    | async test "Only_V4 UDP server" {
    |   let log = StringBuilder::new()
188 |   @async.with_task_group() <| root => {
    |          ^^^^^^^^^^^^^^^
    |     let server = @socket.UdpServer(@socket.Addr::parse("0.0.0.0:0"))
    |     let port = server.addr.port()

<WORKDIR>/src/socket/dual_stack_test.mbt:241:10-241:25:
    | ///|
    | async test "Only_V6 UDP server" {
    |   let log = StringBuilder::new()
241 |   @async.with_task_group() <| root => {
    |          ^^^^^^^^^^^^^^^
    |     let server = @socket.UdpServer(
    |       @socket.Addr::parse("[::]:0"),

<WORKDIR>/src/socket/dual_stack_test.mbt:297:10-297:25:
    | ///|
    | async test "dual stack UDP server" {
    |   let log = StringBuilder::new()
297 |   @async.with_task_group() <| root => {
    |          ^^^^^^^^^^^^^^^
    |     let server = @socket.UdpServer(@socket.Addr::parse("[::]:0"))
    |     let port = server.addr.port()

<WORKDIR>/src/socket/getsockname_test.mbt:17:10-17:25:
   | 
   | ///|
   | async test "getsockname TCP" {
17 |   @async.with_task_group() <| group => {
   |          ^^^^^^^^^^^^^^^
   |     let server = @socket.TcpServer(@socket.Addr::parse("127.0.0.1:0"))
   |     let server_addr = server.addr

<WORKDIR>/src/socket/getsockname_test.mbt:44:10-44:25:
   | 
   | ///|
   | async test "getsockname UDP" {
44 |   @async.with_task_group() <| group => {
   |          ^^^^^^^^^^^^^^^
   |     let server = @socket.UdpServer(@socket.Addr::parse("127.0.0.1:0"))
   |     let server_addr = server.addr

<WORKDIR>/src/socket/happy_eyeball.mbt:43:12-43:27:
   |   let mut result = None
   |   let mut conn_err = None
   |   async fn connect_with_protocol(protocol : IpProtocolPreference) {
43 |     @async.with_task_group() <| group => {
   |            ^^^^^^^^^^^^^^^
   |       for ai = ai; !ai.is_null(); ai = ai.next() {
   |         let addr = ai.to_addr(port)

<WORKDIR>/src/socket/multicast_test.mbt:30:10-30:25:
   | ///|
   | async test "multicast basic" {
   |   let log = []
30 |   @async.with_task_group <| group => {
   |          ^^^^^^^^^^^^^^^
   |     let addr = @socket.Addr::parse("239.0.0.1:4200")
   |     let interface_addr = @socket.Addr::parse("127.0.0.1:0")

<WORKDIR>/src/socket/multicast_test.mbt:70:10-70:25:
   | ///|
   | async test "multicast discovery then unicast" {
   |   let log = []
70 |   @async.with_task_group <| group => {
   |          ^^^^^^^^^^^^^^^
   |     let interface_addr = @socket.Addr::parse("127.0.0.1:0")
   |     let server = @socket.UdpServer(@socket.Addr::parse("0.0.0.0:0"))

<WORKDIR>/src/socket/multicast_test.mbt:122:10-122:25:
    |     return
    |   }
    |   let log = []
122 |   @async.with_task_group() <| group => {
    |          ^^^^^^^^^^^^^^^
    |     let server = @socket.UdpServer::multicast(
    |       @socket.Addr::parse("239.0.0.1:0"),

<WORKDIR>/src/socket/multicast_test.mbt:170:10-170:25:
    |     return
    |   }
    |   let log = []
170 |   @async.with_task_group <| group => {
    |          ^^^^^^^^^^^^^^^
    |     let server = @socket.UdpServer(@socket.Addr::parse("[::]:0"))
    |     defer server.close()

<WORKDIR>/src/socket/multicast_test.mbt:229:10-229:25:
    |     return
    |   }
    |   let log = []
229 |   @async.with_task_group() <| group => {
    |          ^^^^^^^^^^^^^^^
    |     let server = @socket.UdpServer(@socket.Addr::parse("[::]:0"))
    |     let port = server.addr.port()

<WORKDIR>/src/socket/read_exactly_test.mbt:22:10-22:25:
   |     buf..write_string(msg).write_char('\n')
   |   }
   | 
22 |   @async.with_task_group() <| root => {
   |          ^^^^^^^^^^^^^^^
   |     // server
   |     let server = @socket.TcpServer(@socket.Addr::parse("127.0.0.1:0"))

<WORKDIR>/src/socket/read_exactly_test.mbt:71:11-71:26:
   |     buf..write_string(msg).write_char('\n')
   |   }
   | 
71 |   (@async.with_task_group() <| root => {
   |           ^^^^^^^^^^^^^^^
   |     // server
   |     let server = @socket.TcpServer(@socket.Addr::parse("127.0.0.1:0"))

<WORKDIR>/src/socket/resolve_host_test.mbt:26:10-26:25:
   | ///|
   | async test "resolve cancel" {
   |   let log = StringBuilder::new()
26 |   @async.with_task_group() <| root => {
   |          ^^^^^^^^^^^^^^^
   |     let lock = @async.Semaphore(1, initial_value=1)
   |     let task = root.spawn(() => {

<WORKDIR>/src/socket/reuse_addr_test.mbt:18:10-18:25:
   | ///|
   | async test "reuse addr" {
   |   let mut port = 0
18 |   @async.with_task_group() <| group => {
   |          ^^^^^^^^^^^^^^^
   |     group.spawn_bg() <| () => {
   |       for _ in 0..<2 {

<WORKDIR>/src/socket/tcp.mbt:141:10-141:25:
    |     None => None
    |     Some(n) => Some(@async.Semaphore(n))
    |   }
141 |   @async.with_task_group() <| group => {
    |          ^^^^^^^^^^^^^^^
    |     for ;; {
    |       // only accept the connection if we have enough

<WORKDIR>/src/spawn_loop_test.mbt:18:10-18:25:
   | ///|
   | async test "spawn_loop basic" {
   |   let log = StringBuilder::new()
18 |   @async.with_task_group(root => {
   |          ^^^^^^^^^^^^^^^
   |     let mut i = 0
   |     root.spawn_loop() <| () => {

<WORKDIR>/src/spawn_loop_test.mbt:43:12-43:27:
   | async test "spawn_loop basic-error" {
   |   let log = StringBuilder::new()
   |   let err = @test_util.expect_error_async <| () => {
43 |     @async.with_task_group(root => {
   |            ^^^^^^^^^^^^^^^
   |       let mut i = 0
   |       root.spawn_loop() <| () => {

<WORKDIR>/src/spawn_loop_test.mbt:69:10-69:25:
   | ///|
   | async test "spawn_loop retry-exponential" {
   |   let log = []
69 |   @async.with_task_group() <| group => {
   |          ^^^^^^^^^^^^^^^
   |     let mut i = 0
   |     let start = @env.now()

<WORKDIR>/src/spawn_test.mbt:19:12-19:27:
   | async test "spawn error1" {
   |   let buf = StringBuilder::new()
   |   let result = @test_util.expect_error_async <| () => {
19 |     @async.with_task_group(root => {
   |            ^^^^^^^^^^^^^^^
   |       root.spawn_bg() <| () => {
   |         @async.sleep(1000)

<WORKDIR>/src/spawn_test.mbt:43:12-43:27:
   | async test "spawn error2" {
   |   let buf = StringBuilder::new()
   |   let result = @test_util.expect_error_async <| () => {
43 |     @async.with_task_group(root => {
   |            ^^^^^^^^^^^^^^^
   |       root.spawn_bg() <| () => {
   |         @async.sleep(200)

<WORKDIR>/src/spawn_test.mbt:68:14-68:29:
   |   let log = []
   |   @test_util.assert_raise_async <| () => {
   |     (
68 |       @async.with_task_group(group => {
   |              ^^^^^^^^^^^^^^^
   |         group.spawn_bg() <| () => {
   |           // emulate a non-cancellable job,

<WORKDIR>/src/stdio/stdio_test.mbt:48:10-48:25:
   | ///|
   | #cfg(target="native")
   | async test "redirect pipe" {
48 |   @async.with_task_group() <| root => {
   |          ^^^^^^^^^^^^^^^
   |     let cat = cat.wait()
   |     let (cat_read, we_write) = @process.write_to_process()

<WORKDIR>/src/stdio/stdio_test.mbt:78:10-78:25:
   | #cfg(target="native")
   | async test "stdio cancel" {
   |   let cat = cat.wait()
78 |   @async.with_task_group() <| group => {
   |          ^^^^^^^^^^^^^^^
   |     let (cat_read, we_write) = @process.write_to_process()
   |     let (we_read, cat_write) = @process.read_from_process()

<WORKDIR>/src/stdio/stdio_test.mbt:112:10-112:25:
    | async test "stdout and stderr are the same" {
    |   let cat = cat.wait()
    |   let (cat_read, we_write) = @process.write_to_process()
112 |   @async.with_task_group <| group => {
    |          ^^^^^^^^^^^^^^^
    |     let cat_task = group.spawn() <| () => {
    |       @process.collect_output_merged(cat, [], stdin=cat_read)

<WORKDIR>/src/task_group.mbt:223:17-223:32:
    | ///
    | /// If all children task terminate successfully,
    | /// `with_task_group` will return the result of `f`.
223 | pub async fn[X] with_task_group(f : async (TaskGroup[X]) -> X) -> X {
    |                 ^^^^^^^^^^^^^^^
    |   let tg = {
    |     children: Set([]),

<WORKDIR>/src/timer_test.mbt:18:10-18:25:
   | ///|
   | async test "basic sleep" {
   |   let buf = StringBuilder::new()
18 |   @async.with_task_group() <| root => {
   |          ^^^^^^^^^^^^^^^
   |     root.spawn_bg() <| () => {
   |       @async.sleep(100)

<WORKDIR>/src/timer_test.mbt:53:10-53:25:
   | ///|
   | async test "Timer basic" {
   |   let log = []
53 |   @async.with_task_group() <| group => {
   |          ^^^^^^^^^^^^^^^
   |     group.spawn_bg() <| () => {
   |       @async.sleep(150)

<WORKDIR>/src/timer_test.mbt:65:12-65:27:
   |     @async.sleep(300)
   |     log.push("creating timer")
   |     let timer = @async.Timer(300)
65 |     @async.with_task_group() <| group => {
   |            ^^^^^^^^^^^^^^^
   |       for _ in 0..<3 {
   |         group.spawn_bg() <| () => {

<WORKDIR>/src/timer_test.mbt:124:10-124:25:
    |     (@env.now() - start + 50).to_int() / 150
    |   }
    |   let timer = @async.Timer(450)
124 |   @async.with_task_group() <| group => {
    |          ^^^^^^^^^^^^^^^
    |     group.spawn_bg() <| () => {
    |       @async.sleep(150)

<WORKDIR>/src/timer_test.mbt:155:10-155:25:
    |   }
    | 
    |   let timer = @async.Timer(300)
155 |   @async.with_task_group() <| group => {
    |          ^^^^^^^^^^^^^^^
    |     group.spawn_bg() <| () => {
    |       timer.wait()

<WORKDIR>/src/tls/certificate_test.mbt:17:10-17:25:
   | 
   | ///|
   | async test "get_peer_certificate" {
17 |   @async.with_task_group() <| group => {
   |          ^^^^^^^^^^^^^^^
   |     let (client_read_from_server, server_write_to_client) = @pipe.pipe()
   |     let (server_read_from_client, client_write_to_server) = @pipe.pipe()

<WORKDIR>/src/tls/channel_binding_test.mbt:17:10-17:25:
   | 
   | ///|
   | async test "channel binding" {
17 |   @async.with_task_group() <| group => {
   |          ^^^^^^^^^^^^^^^
   |     let (client_read_from_server, server_write_to_client) = @pipe.pipe()
   |     let (server_read_from_client, client_write_to_server) = @pipe.pipe()

<WORKDIR>/src/tls/shutdown_test.mbt:17:10-17:25:
   | 
   | ///|
   | async test "peer close connection" {
17 |   @async.with_task_group() <| root => {
   |          ^^^^^^^^^^^^^^^
   |     // server
   |     let server = @socket.TcpServer(@socket.Addr::parse("127.0.0.1:0"))

<WORKDIR>/src/tls/tls_test.mbt:51:10-51:25:
   | ///|
   | async test "one way" {
   |   let log = StringBuilder::new()
51 |   @async.with_task_group() <| root => {
   |          ^^^^^^^^^^^^^^^
   |     let (client_read_from_server, server_write_to_client) = @pipe.pipe()
   |     let (server_read_from_client, client_write_to_server) = @pipe.pipe()

<WORKDIR>/src/tls/tls_test.mbt:104:10-104:25:
    | ///|
    | async test "echo" {
    |   let log = StringBuilder::new()
104 |   @async.with_task_group() <| root => {
    |          ^^^^^^^^^^^^^^^
    |     let (client_read_from_server, server_write_to_client) = @pipe.pipe()
    |     let (server_read_from_client, client_write_to_server) = @pipe.pipe()

<WORKDIR>/src/tls/tls_test.mbt:156:10-156:25:
    | 
    | ///|
    | async test "`connect` accidental close" {
156 |   @async.with_task_group() <| root => {
    |          ^^^^^^^^^^^^^^^
    |     let (client_read_from_server, server_write_to_client) = @pipe.pipe()
    |     let (server_read_from_client, client_write_to_server) = @pipe.pipe()

<WORKDIR>/src/tls/tls_test.mbt:190:10-190:25:
    | 
    | ///|
    | async test "`read` already closed" {
190 |   @async.with_task_group() <| root => {
    |          ^^^^^^^^^^^^^^^
    |     let (client_read_from_server, server_write_to_client) = @pipe.pipe()
    |     let (server_read_from_client, client_write_to_server) = @pipe.pipe()

<WORKDIR>/src/tls/tls_test.mbt:272:10-272:25:
    | 
    | ///|
    | async test "client custom root certificate" {
272 |   @async.with_task_group() <| root => {
    |          ^^^^^^^^^^^^^^^
    |     let (client_read_from_server, server_write_to_client) = @pipe.pipe()
    |     let (server_read_from_client, client_write_to_server) = @pipe.pipe()

<WORKDIR>/src/tls/tls_test.mbt:309:10-309:25:
    | 
    | ///|
    | async test "client custom root certificate rejects different root" {
309 |   @async.with_task_group() <| root => {
    |          ^^^^^^^^^^^^^^^
    |     let (client_read_from_server, server_write_to_client) = @pipe.pipe()
    |     let (server_read_from_client, client_write_to_server) = @pipe.pipe()

<WORKDIR>/src/wait_test.mbt:18:10-18:25:
   | ///|
   | async test "wait basic" {
   |   let buf = StringBuilder::new()
18 |   @async.with_task_group(root => {
   |          ^^^^^^^^^^^^^^^
   |     root.spawn_bg() <| () => {
   |       @async.sleep(200)

<WORKDIR>/src/wait_test.mbt:47:10-47:25:
   | ///|
   | async test "wait cancelled" {
   |   let buf = StringBuilder::new()
47 |   @async.with_task_group(root => {
   |          ^^^^^^^^^^^^^^^
   |     let task = root.spawn(() => {
   |       @async.sleep(1000)

<WORKDIR>/src/wait_test.mbt:77:10-77:25:
   | ///|
   | async test "try_wait" {
   |   let log = StringBuilder::new()
77 |   @async.with_task_group() <| root => {
   |          ^^^^^^^^^^^^^^^
   |     let task = root.spawn(no_wait=true, () => {
   |       @async.sleep(450)

<WORKDIR>/src/websocket/README.mbt.md:55:10-55:25:
   | ///|
   | #cfg(target="native")
   | async test "WebSocket client example" {
55 |   @async.with_task_group(group => {
   |          ^^^^^^^^^^^^^^^
   |     let port = 42080
   |     let addr = @socket.Addr::parse("127.0.0.1:\{port}")

<WORKDIR>/src/websocket/bad_client_test.mbt:17:10-17:25:
   | 
   | ///|
   | async test "bad client" {
17 |   @async.with_task_group() <| group => {
   |          ^^^^^^^^^^^^^^^
   |     let server = @http.Server(@socket.Addr::parse("127.0.0.1:0"))
   |     let port = server.addr.port()

<WORKDIR>/src/websocket/bad_client_test.mbt:41:14-41:29:
   |       defer http_client.close()
   |       let ws_client = @websocket.from_http_client(http_client, "/")
   |       defer ws_client.close()
41 |       @async.with_task_group() <| group => {
   |              ^^^^^^^^^^^^^^^
   |         group.spawn_bg() <| () => {
   |           for frame in frames {

<WORKDIR>/src/websocket/control_test.mbt:17:10-17:25:
   | 
   | ///|
   | async test "ping auto-reply" {
17 |   @async.with_task_group() <| group => {
   |          ^^^^^^^^^^^^^^^
   |     let server = @http.Server(@socket.Addr::parse("127.0.0.1:0"))
   |     let port = server.addr.port()

<WORKDIR>/src/websocket/control_test.mbt:42:10-42:25:
   | 
   | ///|
   | async test "pong ignored" {
42 |   @async.with_task_group() <| group => {
   |          ^^^^^^^^^^^^^^^
   |     let server = @http.Server(@socket.Addr::parse("127.0.0.1:0"))
   |     let port = server.addr.port()

<WORKDIR>/src/websocket/control_test.mbt:67:10-67:25:
   | 
   | ///|
   | async test "ping auto-reply race-with-write" {
67 |   @async.with_task_group() <| group => {
   |          ^^^^^^^^^^^^^^^
   |     let server = @http.Server(@socket.Addr::parse("127.0.0.1:0"))
   |     let port = server.addr.port()

<WORKDIR>/src/websocket/control_test.mbt:77:14-77:29:
   |       let request = conn.read_request()
   |       let ws = @websocket.from_http_server(request, conn)
   |       defer ws.close()
77 |       @async.with_task_group() <| group => {
   |              ^^^^^^^^^^^^^^^
   |         // currently, auto-reply is only triggered when the user is actually reading.
   |         group.spawn_bg(no_wait=true, () => ignore(ws.recv().read_all()))

<WORKDIR>/src/websocket/control_test.mbt:104:10-104:25:
    | 
    | ///|
    | async test "close test" {
104 |   @async.with_task_group() <| group => {
    |          ^^^^^^^^^^^^^^^
    |     let server = @http.Server(@socket.Addr::parse("127.0.0.1:0"))
    |     let port = server.addr.port()

<WORKDIR>/src/websocket/control_test.mbt:114:14-114:29:
    |       let request = conn.read_request()
    |       let ws = @websocket.from_http_server(request, conn)
    |       defer ws.close()
114 |       @async.with_task_group() <| group => {
    |              ^^^^^^^^^^^^^^^
    |         // currently, auto-reply is only triggered when the user is actually reading.
    |         group.spawn_bg() <| () => {

<WORKDIR>/src/websocket/control_test.mbt:147:10-147:25:
    | 
    | ///|
    | async test "send ping" {
147 |   @async.with_task_group() <| group => {
    |          ^^^^^^^^^^^^^^^
    |     let server = @http.Server(@socket.Addr::parse("127.0.0.1:0"))
    |     let port = server.addr.port()

<WORKDIR>/src/websocket/control_test.mbt:162:12-162:27:
    |     }
    |     let ws = @websocket.connect("ws://localhost:\{port}")
    |     defer ws.close()
162 |     @async.with_task_group() <| group => {
    |            ^^^^^^^^^^^^^^^
    |       group.spawn_bg() <| () => {
    |         ws.ping()

<WORKDIR>/src/websocket/control_test.mbt:174:10-174:25:
    | 
    | ///|
    | async test "ping inside message" {
174 |   @async.with_task_group() <| group => {
    |          ^^^^^^^^^^^^^^^
    |     let server = @http.Server(@socket.Addr::parse("127.0.0.1:0"))
    |     let port = server.addr.port()

<WORKDIR>/src/websocket/control_test.mbt:189:12-189:27:
    |     }
    |     let ws = @websocket.connect("ws://localhost:\{port}")
    |     defer ws.close()
189 |     @async.with_task_group() <| group => {
    |            ^^^^^^^^^^^^^^^
    |       group.spawn_bg() <| () => {
    |         ws..start_message(Text)..ping()..write("1234").end_message()

<WORKDIR>/src/websocket/control_test.mbt:200:10-200:25:
    | 
    | ///|
    | async test "multiple ping" {
200 |   @async.with_task_group() <| group => {
    |          ^^^^^^^^^^^^^^^
    |     let server = @http.Server(@socket.Addr::parse("127.0.0.1:0"))
    |     let port = server.addr.port()

<WORKDIR>/src/websocket/control_test.mbt:216:12-216:27:
    |     }
    |     let ws = @websocket.connect("ws://localhost:\{port}")
    |     defer ws.close()
216 |     @async.with_task_group() <| group => {
    |            ^^^^^^^^^^^^^^^
    |       group.spawn_bg() <| () => {
    |         @async.with_task_group() <| inner => {

<WORKDIR>/src/websocket/control_test.mbt:218:16-218:31:
    |     defer ws.close()
    |     @async.with_task_group() <| group => {
    |       group.spawn_bg() <| () => {
218 |         @async.with_task_group() <| inner => {
    |                ^^^^^^^^^^^^^^^
    |           inner.spawn_bg(() => ws.ping())
    |           inner.spawn_bg(() => ws.ping())

<WORKDIR>/src/websocket/control_test.mbt:231:10-231:25:
    | 
    | ///|
    | async test "ping cancelled" {
231 |   @async.with_task_group() <| group => {
    |          ^^^^^^^^^^^^^^^
    |     let server = @http.Server(@socket.Addr::parse("127.0.0.1:0"))
    |     let port = server.addr.port()

<WORKDIR>/src/websocket/control_test.mbt:247:12-247:27:
    |     }
    |     let ws = @websocket.connect("ws://localhost:\{port}")
    |     defer ws.close()
247 |     @async.with_task_group() <| group => {
    |            ^^^^^^^^^^^^^^^
    |       group.spawn_bg() <| () => {
    |         inspect(ws.recv().read_all().text(), content="abcd")

<WORKDIR>/src/websocket/control_test.mbt:263:10-263:25:
    | 
    | ///|
    | async test "duplicated ping" {
263 |   @async.with_task_group() <| group => {
    |          ^^^^^^^^^^^^^^^
    |     let server = @http.Server(@socket.Addr::parse("127.0.0.1:0"))
    |     let port = server.addr.port()

<WORKDIR>/src/websocket/control_test.mbt:279:12-279:27:
    |     }
    |     let ws = @websocket.connect("ws://localhost:\{port}")
    |     defer ws.close()
279 |     @async.with_task_group() <| group => {
    |            ^^^^^^^^^^^^^^^
    |       group.spawn_bg() <| () => {
    |         @async.with_task_group() <| inner => {

<WORKDIR>/src/websocket/control_test.mbt:281:16-281:31:
    |     defer ws.close()
    |     @async.with_task_group() <| group => {
    |       group.spawn_bg() <| () => {
281 |         @async.with_task_group() <| inner => {
    |                ^^^^^^^^^^^^^^^
    |           inner.spawn_bg(() => ws.ping(msg=b"1"))
    |           inner.spawn_bg() <| () => {

<WORKDIR>/src/websocket/external_client_test.mbt:18:10-18:25:
   | ///|
   | async test "external client" {
   |   let log = []
18 |   @async.with_task_group() <| group => {
   |          ^^^^^^^^^^^^^^^
   |     let server = @http.Server(@socket.Addr::parse("127.0.0.1:0"))
   |     let port = server.addr.port()

<WORKDIR>/src/websocket/utf8_validation_test.mbt:18:10-18:25:
   | ///|
   | async test "UTF8 validation" {
   |   let log = []
18 |   @async.with_task_group() <| group => {
   |          ^^^^^^^^^^^^^^^
   |     let server = @http.Server(@socket.Addr::parse("127.0.0.1:0"))
   |     let addr = server.addr

<WORKDIR>/src/websocket/utf8_validation_test.mbt:94:10-94:25:
   | 
   | ///|
   | async test "UTF8 validation large message" {
94 |   @async.with_task_group() <| group => {
   |          ^^^^^^^^^^^^^^^
   |     let server = @http.Server(@socket.Addr::parse("127.0.0.1:0"))
   |     let port = server.addr.port()

<WORKDIR>/src/websocket/utf8_validation_test.mbt:108:12-108:27:
    |     }
    |     let client = @websocket.connect("ws://localhost:\{port}")
    |     defer client.close()
108 |     @async.with_task_group() <| group => {
    |            ^^^^^^^^^^^^^^^
    |       let chunk_text = String::make(1024, '☺')
    |       let chunk_bin = @utf8.encode(chunk_text)

<WORKDIR>/src/websocket/websocket_test.mbt:17:10-17:25:
   | 
   | ///|
   | async test "websocket basic" {
17 |   @async.with_task_group() <| group => {
   |          ^^^^^^^^^^^^^^^
   |     let server = @http.Server(@socket.Addr::parse("127.0.0.1:0"))
   |     let addr = server.addr

<WORKDIR>/src/websocket/websocket_test.mbt:59:10-59:25:
   | 
   | ///|
   | async test "single frame multiple read" {
59 |   @async.with_task_group() <| group => {
   |          ^^^^^^^^^^^^^^^
   |     let server = @http.Server(@socket.Addr::parse("127.0.0.1:0"))
   |     let addr = server.addr

<WORKDIR>/src/websocket/websocket_test.mbt:88:10-88:25:
   | 
   | ///|
   | async test "ignored message" {
88 |   @async.with_task_group() <| group => {
   |          ^^^^^^^^^^^^^^^
   |     let server = @http.Server(@socket.Addr::parse("127.0.0.1:0"))
   |     let addr = server.addr

<WORKDIR>/src/websocket/websocket_test.mbt:118:10-118:25:
    | ///|
    | async test "write buffering" {
    |   let log = []
118 |   @async.with_task_group() <| group => {
    |          ^^^^^^^^^^^^^^^
    |     let server = @http.Server(@socket.Addr::parse("127.0.0.1:0"))
    |     let addr = server.addr

<WORKDIR>/src/websocket/websocket_test.mbt:157:10-157:25:
    | 
    | ///|
    | async test "large message" {
157 |   @async.with_task_group() <| group => {
    |          ^^^^^^^^^^^^^^^
    |     let server = @http.Server(@socket.Addr::parse("127.0.0.1:0"))
    |     let addr = server.addr

<WORKDIR>/src/with_timeout_test.mbt:18:10-18:25:
   | ///|
   | async test "with_timeout normal exit" {
   |   let log = []
18 |   @async.with_task_group(root => {
   |          ^^^^^^^^^^^^^^^
   |     root.spawn_bg() <| () => {
   |       @async.sleep(300)

<WORKDIR>/src/with_timeout_test.mbt:37:10-37:25:
   | ///|
   | async test "with_timeout failure" {
   |   let log = StringBuilder::new()
37 |   @async.with_task_group(root => {
   |          ^^^^^^^^^^^^^^^
   |     root.spawn_bg() <| () => {
   |       @async.sleep(200)

<WORKDIR>/src/with_timeout_test.mbt:66:10-66:25:
   | ///|
   | async test "with_timeout timeout" {
   |   let log = StringBuilder::new()
66 |   @async.with_task_group(root => {
   |          ^^^^^^^^^^^^^^^
   |     root.spawn_bg() <| () => {
   |       @async.sleep(300)

<WORKDIR>/src/with_timeout_test.mbt:99:10-99:25:
   | ///|
   | async test "with_timeout nested1" {
   |   let log = StringBuilder::new()
99 |   @async.with_task_group(root => {
   |          ^^^^^^^^^^^^^^^
   |     root.spawn_bg() <| () => {
   |       @async.sleep(200)

<WORKDIR>/src/with_timeout_test.mbt:140:10-140:25:
    | ///|
    | async test "with_timeout nested2" {
    |   let log = StringBuilder::new()
140 |   @async.with_task_group(root => {
    |          ^^^^^^^^^^^^^^^
    |     root.spawn_bg() <| () => {
    |       @async.sleep(300)

<WORKDIR>/src/with_timeout_test.mbt:181:12-181:27:
    | async test "with_timeout error_on_cancel" {
    |   let log = StringBuilder::new()
    |   let err = @test_util.expect_error_async <| () => {
181 |     @async.with_task_group(root => {
    |            ^^^^^^^^^^^^^^^
    |       root.spawn_bg() <| () => {
    |         @async.sleep(200)

<WORKDIR>/src/with_timeout_test.mbt:212:12-212:27:
    | async test "with_timeout error-on-timeout" {
    |   let log = StringBuilder::new()
    |   let err = @test_util.expect_error_async <| () => {
212 |     @async.with_task_group(root => {
    |            ^^^^^^^^^^^^^^^
    |       root.spawn_bg() <| () => {
    |         @async.sleep(200)

<WORKDIR>/src/with_timeout_test.mbt:243:10-243:25:
    | ///|
    | async test "with_timeout_opt normal exit" {
    |   let log = []
243 |   @async.with_task_group(root => {
    |          ^^^^^^^^^^^^^^^
    |     root.spawn_bg() <| () => {
    |       @async.sleep(200)

<WORKDIR>/src/with_timeout_test.mbt:263:10-263:25:
    | ///|
    | async test "with_timeout_opt failure" {
    |   let log = StringBuilder::new()
263 |   @async.with_task_group(root => {
    |          ^^^^^^^^^^^^^^^
    |     root.spawn_bg() <| () => {
    |       @async.sleep(200)

<WORKDIR>/src/with_timeout_test.mbt:292:10-292:25:
    | ///|
    | async test "with_timeout_opt timeout" {
    |   let log = []
292 |   @async.with_task_group() <| root => {
    |          ^^^^^^^^^^^^^^^
    |     root.spawn_bg() <| () => {
    |       @async.sleep(200)

```
