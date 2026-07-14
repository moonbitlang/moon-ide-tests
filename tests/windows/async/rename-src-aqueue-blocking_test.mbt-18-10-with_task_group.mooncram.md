# async rename with_task_group src\aqueue\blocking_test.mbt:18:10

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\async' moon ide rename 'with_task_group' 'with_task_group_renamed' --loc 'src\aqueue\blocking_test.mbt:18:10'
*** Begin Patch
*** Update File: <WORKDIR>/examples\http_file_server\main.mbt
@@
   } else {
     path
   }
-  @async.with_task_group <| group => {
+  @async.with_task_group_renamed <| group => {
     let (we_read_from_zip, zip_write_to_us) = @process.read_from_process()
     defer we_read_from_zip.close()
     if is_windows {
*** Update File: <WORKDIR>/examples\http_file_server\server_wbtest.mbt
@@
   }
 
   let client_log = StringBuilder::new()
-  @async.with_task_group <| root => {
+  @async.with_task_group_renamed <| root => {
     let server = @http.Server(@socket.Addr::parse("127.0.0.1:0"))
     let addr = server.addr
     root.spawn_bg(no_wait=true, () => server_main(server, path=".", log~))
*** Update File: <WORKDIR>/examples\idle_timeout\main.mbt
@@
 
 ///|
 async fn main {
-  @async.with_task_group <| group => {
+  @async.with_task_group_renamed <| group => {
     let idle_timer = @async.Timer(5000)
     group.spawn_bg(no_wait=true) <| () => {
       idle_timer.wait()
*** Update File: <WORKDIR>/examples\tcp_ping_pong\main.mbt
@@
 
 ///|
 pub async fn main_prog(println : Printer) -> Unit {
-  @async.with_task_group(root => {
+  @async.with_task_group_renamed(root => {
     let server = @socket.TcpServer(@socket.Addr::parse("127.0.0.1:0"))
     let addr = server.addr
     root.spawn_bg(() => server_main(server, println))
     root.spawn_bg() <| () => {
-      @async.with_task_group <| ctx => {
+      @async.with_task_group_renamed <| ctx => {
         for i in 0..<6 {
           let msg = if i % 3 == 1 { "pong" } else { "ping" }
           ctx.spawn_bg(() => client(addr, println, i, msg))
*** Update File: <WORKDIR>/examples\tcp_server_benchmark\main.mbt
@@
 ) -> (Int64, Double) {
   let mut throughput_sum : Int64 = 0
   let mut latency_sum : UInt64 = 0
-  @async.with_task_group <| group => {
+  @async.with_task_group_renamed <| group => {
     let mut remaining = total_conn
     for _ in 0..<max_concurrent_conn {
       group.spawn_bg() <| () => {
@@
           @async.sleep(rand.int(limit=conn_duration / 10))
           let conn = @socket.Tcp::connect(dst)
           defer conn.close()
-          @async.with_task_group <| conn_group => {
+          @async.with_task_group_renamed <| conn_group => {
             let mut send_count : Int64 = 0
             let mut recv_count : Int64 = 0
             let mut before : UInt64 = 0
*** Update File: <WORKDIR>/examples\udp_echo_server\main.mbt
@@
 
 ///|
 async fn main {
-  @async.with_task_group <| root => {
+  @async.with_task_group_renamed <| root => {
     let server = @socket.UdpServer(@socket.Addr::parse("0.0.0.0:4200"))
     defer server.close()
     for ;; {
*** Update File: <WORKDIR>/examples\udp_ping_pong\main.mbt
@@
 
 ///|
 async fn server_main(server : @socket.UdpServer, println : Printer) -> Unit {
-  @async.with_task_group(group => {
+  @async.with_task_group_renamed(group => {
     defer server.close()
     let buf = FixedArray::make(1024, b'0')
     while server.recvfrom(buf) is (n, addr) && n > 0 {
@@
 
 ///|
 pub async fn main_prog(println : Printer) -> Unit {
-  @async.with_task_group(root => {
+  @async.with_task_group_renamed(root => {
     let server = @socket.UdpServer(@socket.Addr::parse("127.0.0.1:0"))
     let addr = server.addr
     root.spawn_bg(() => server_main(server, println))
     root.spawn_bg() <| () => {
-      @async.with_task_group <| ctx => {
+      @async.with_task_group_renamed <| ctx => {
         for i in 0..<6 {
           let msg = if i % 3 == 1 { "pong" } else { "ping" }
           ctx.spawn_bg(() => client(addr, println, i, msg))
*** Update File: <WORKDIR>/examples\websocket_echo_server\server_wbtest.mbt
@@
 
 ///|
 async test "test server" {
-  @async.with_task_group <| group => {
+  @async.with_task_group_renamed <| group => {
     group.spawn_bg(no_wait=true, () => start_echo_server(port=49001))
     let client = @websocket.connect("ws://localhost:49001")
     defer client.close()
*** Update File: <WORKDIR>/examples\xargs\main.mbt
@@
     { "args": args, .. } => args
     _ => []
   }
-  @async.with_task_group <| group => {
+  @async.with_task_group_renamed <| group => {
     while @stdio.stdin.read_until("\n") is Some(line) {
       if max_jobs is Some(limit) {
         limit.acquire()
*** Update File: <WORKDIR>/src\allow_failure_test.mbt
@@
 ///|
 async test "allow_failure ignored" {
   let buf = StringBuilder::new()
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     root.spawn_bg(allow_failure=true, () => raise Err)
     @async.sleep(100)
     buf <+ "main task terminate\n"
@@
 async test "allow_failure waited" {
   let buf = StringBuilder::new()
   let err = @test_util.expect_error_async <| () => {
-    @async.with_task_group(root => {
+    @async.with_task_group_renamed(root => {
       let task = root.spawn(allow_failure=true, () => raise Err)
       @async.sleep(100)
       task.wait()
@@
 ///|
 async test "allow_failure no error" {
   let buf = StringBuilder::new()
-  @async.with_task_group(root => {
+  @async.with_task_group_renamed(root => {
     root.spawn_bg(allow_failure=true) <| () => {
       @async.sleep(1000)
       buf <+ "`allow_failure` task terminate\n"
*** Update File: <WORKDIR>/src\aqueue\README.mbt.md
@@
 ///|
 async test "quick start" {
   let log = []
-  @async.with_task_group <| group => {
+  @async.with_task_group_renamed <| group => {
     let q : @aqueue.Queue[Int] = @aqueue.Queue(kind=Unbounded)
     group.spawn_bg() <| () => {
       for i in 0..<3 {
@@
 ///|
 async test "blocking creates backpressure" {
   let log = []
-  @async.with_task_group <| group => {
+  @async.with_task_group_renamed <| group => {
     let q = @aqueue.Queue(kind=Blocking(1))
     group.spawn_bg() <| () => {
       for i in 0..<3 {
@@
 ///|
 async test "blocking with zero capacity is a rendezvous" {
   let log = []
-  @async.with_task_group <| group => {
+  @async.with_task_group_renamed <| group => {
     let q = @aqueue.Queue(kind=Blocking(0))
     group.spawn_bg() <| () => {
       for i in 0..<3 {
@@
 ///|
 async test "close as end-of-stream signal" {
   let received = []
-  @async.with_task_group <| group => {
+  @async.with_task_group_renamed <| group => {
     // Capacity 1 forces the producer to suspend between puts,
     // so the consumer can drain each item before `close()` runs.
     let q = @aqueue.Queue(kind=Blocking(1))
@@
 ```moonbit check
 ///|
 async test "blocked put fails when queue is closed" {
-  @async.with_task_group(root => {
+  @async.with_task_group_renamed(root => {
     let q = @aqueue.Queue(kind=Blocking(1))
     q.put(1) // fills the buffer
     root.spawn_bg(() => {
@@
 ///|
 async test "fan-in merges multiple producers" {
   let received = []
-  @async.with_task_group <| group => {
+  @async.with_task_group_renamed <| group => {
     let q : @aqueue.Queue[String] = @aqueue.Queue(kind=Unbounded)
     // Producer A puts items at time 0, 100, 200 ms.
     group.spawn_bg() <| () => {
@@
 ///|
 async test "fan-out distributes work to a pool" {
   let work_by_worker : Array[Array[Int]] = [[], [], []]
-  @async.with_task_group <| group => {
+  @async.with_task_group_renamed <| group => {
     let q : @aqueue.Queue[Int] = @aqueue.Queue(kind=Blocking(1))
     for w in 0..<3 {
       group.spawn_bg(allow_failure=true) <| () => {
@@
 ///|
 async test "readers are woken FIFO" {
   let log = []
-  @async.with_task_group(root => {
+  @async.with_task_group_renamed(root => {
     let q : @aqueue.Queue[Int] = @aqueue.Queue(kind=Unbounded)
     // Reader 1 starts waiting at ~0 ms.
     root.spawn_bg(() => log.push("r1 got \{q.get()}"))
*** Update File: <WORKDIR>/src\aqueue\aqueue_test.mbt
@@
 ///|
 async test "aqueue basic" {
   let log = StringBuilder::new()
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     let queue = @aqueue.Queue(kind=Unbounded)
     root.spawn_bg() <| () => {
       for _ in 0..<6 {
@@
 ///|
 async test "aqueue multi-reader" {
   let log = StringBuilder::new()
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     let queue = @aqueue.Queue(kind=Unbounded)
     root.spawn_bg() <| () => {
       @async.sleep(70)
@@
 async test "aqueue cancellation no_swallow" {
   // `get` should not swallow the value
   let log = StringBuilder::new()
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     let q = @aqueue.Queue(kind=Unbounded)
     let get_task = group.spawn(() => log.write_string("get() => \{q.get()}\n"))
     @async.sleep(100)
@@
 ///|
 async test "aqueue fairness" {
   let log = StringBuilder::new()
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     let queue = @aqueue.Queue(kind=Unbounded)
     root.spawn_bg() <| () => {
       for _ in 0..<2 {
@@
 ///|
 async test "aqueue fairness2" {
   let log = StringBuilder::new()
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     let queue = @aqueue.Queue(kind=Unbounded)
     queue.put(1)
     root.spawn_bg() <| () => {
*** Update File: <WORKDIR>/src\aqueue\blocking_test.mbt
@@
 ///|
 async test "blocking unbuffered" {
   let log = []
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     let q = @async.Queue(kind=Blocking(1))
     group.spawn_bg() <| () => {
       for i in 0..<3 {
@@
 ///|
 async test "blocking buffered" {
   let log = []
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     let q = @async.Queue(kind=Blocking(2))
     group.spawn_bg() <| () => {
       for i in 0..<4 {
@@
 ///|
 async test "blocking fairness" {
   let log = []
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     let q = @async.Queue(kind=Blocking(1))
     q.put(0)
     group.spawn_bg() <| () => {
@@
 ///|
 async test "blocking cancellation" {
   let log = []
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     let q = @async.Queue(kind=Blocking(1))
     q.put(0)
     group.spawn_bg(no_wait=true) <| () => {
@@
 ///|
 async test "blocking fairness2" {
   let log = []
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     let queue = @async.Queue(kind=Blocking(1))
     queue.put(0)
     root.spawn_bg() <| () => {
@@
 ///|
 async test "blocking immediate cancellation" {
   let log = []
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     let q = @async.Queue(kind=Blocking(1))
     q.put(0)
     let put_task = group.spawn(() => {
@@
 ///|
 async test "blocking zero buffered" {
   let log = []
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     let q = @async.Queue(kind=Blocking(0))
     group.spawn_bg() <| () => {
       for i in 0..<4 {
@@
 ///|
 async test "blocked zero buffered try_get" {
   let log = []
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     let q = @async.Queue(kind=Blocking(0))
     @debug.assert_eq(None, q.try_get())
     for i in 0..<3 {
@@
 ///|
 async test "blocked zero buffered try_put" {
   let log = []
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     let q = @async.Queue(kind=Blocking(0))
     assert_eq(false, q.try_put(-1))
     for _ in 0..<3 {
@@
 ///|
 async test "blocked zero buffered discard oldest try_get" {
   let log = []
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     let q = @async.Queue(kind=DiscardOldest(0))
     @debug.assert_eq(None, q.try_get())
     for i in 0..<3 {
@@
 ///|
 async test "blocked zero buffered discard oldest try_put" {
   let log = []
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     let q = @async.Queue(kind=DiscardOldest(0))
     @debug.assert_eq(false, q.try_put(-1))
     for _ in 0..<3 {
@@
 ///|
 async test "blocked zero buffered discard latest try_put" {
   let log = []
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     let q = @async.Queue(kind=DiscardLatest(0))
     @debug.assert_eq(false, q.try_put(-1))
     for _ in 0..<3 {
*** Update File: <WORKDIR>/src\aqueue\close_test.mbt
@@
 async test "close with blocking put" {
   let q = @async.Queue(kind=Blocking(1))
   q.put(1)
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     let start = @env.now()
     group.spawn_bg() <| () => {
       @async.sleep(300)
@@
 ///|
 async test "close zero buffered with blocking put" {
   let q = @async.Queue(kind=Blocking(0))
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     let start = @env.now()
     group.spawn_bg() <| () => {
       @async.sleep(300)
@@
 ///|
 async test "close with blocking get" {
   let q : @aqueue.Queue[Int] = @async.Queue(kind=Unbounded)
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     let start = @env.now()
     group.spawn_bg() <| () => {
       @async.sleep(300)
@@
 ///|
 async test "close with completed get" {
   let q : @aqueue.Queue[Int] = @async.Queue(kind=Unbounded)
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     group.spawn_bg() <| () => {
       debug_inspect(
         q.get(),
*** Update File: <WORKDIR>/src\async.mbt
@@
   f : async () -> X,
   error? : Error = TimeoutError,
 ) -> X {
-  with_task_group() <| group => {
+  with_task_group_renamed() <| group => {
     group.spawn_bg(no_wait=true) <| () => {
       sleep(time)
       raise error
@@
 /// - If `f` is still running after `timeout` milliseconds,
 /// ` with_timeout_opt` will return `None` immediately, and `f` will be cancelled.
 pub async fn[X] with_timeout_opt(time : Int, f : async () -> X) -> X? {
-  with_task_group() <| group => {
+  with_task_group_renamed() <| group => {
     group.spawn_bg(no_wait=true) <| () => {
       sleep(time)
       group.return_immediately(None)
@@
     None
   }
   let results = Array::make(tasks.length(), None)
-  with_task_group() <| tg => {
+  with_task_group_renamed() <| tg => {
     for i, task in tasks {
       if semaphore is Some(sem) {
         sem.acquire()
@@
   }
   let mut result = None
   let mut last_err = None
-  with_task_group() <| tg => {
+  with_task_group_renamed() <| tg => {
     for task in tasks {
       if semaphore is Some(sem) {
         sem.acquire()
*** Update File: <WORKDIR>/src\cancellation_test.mbt
@@
 ///|
 async test "manual cancel" {
   let buf = StringBuilder::new()
-  @async.with_task_group(root => {
+  @async.with_task_group_renamed(root => {
     let task = root.spawn(() => {
       try {
         @async.sleep(300)
@@
 async test "error propagation" {
   let buf = StringBuilder::new()
   let err = @test_util.expect_error_async <| () => {
-    @async.with_task_group(root => {
+    @async.with_task_group_renamed(root => {
       root.spawn_bg() <| () => {
         @async.sleep(300)
         raise Err
@@
 ///|
 async test "multiple scope" {
   let buf = StringBuilder::new()
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     root.spawn_bg() <| () => {
       try
-        @async.with_task_group() <| fn(ctx) {
+        @async.with_task_group_renamed() <| fn(ctx) {
           ctx.spawn_bg() <| () => {
             @async.sleep(200)
             raise Err
@@
     }
     root.spawn_bg() <| () => {
       try
-        @async.with_task_group() <| fn(ctx) {
+        @async.with_task_group_renamed() <| fn(ctx) {
           ctx.spawn_bg() <| () => {
             @async.sleep(500)
             raise Err
@@
 ///|
 async test "recursive cancel" {
   let buf = StringBuilder::new()
-  @async.with_task_group(root => {
+  @async.with_task_group_renamed(root => {
     root.spawn_bg() <| () => {
       for _ in 0..<2 {
         @async.sleep(400)
@@
 async test "spawn directly error" {
   let buf = StringBuilder::new()
   let err = @test_util.expect_error_async <| () => {
-    @async.with_task_group(root => {
+    @async.with_task_group_renamed(root => {
       root.spawn_bg() <| () => {
-        @async.with_task_group() <| group => {
+        @async.with_task_group_renamed() <| group => {
           @async.sleep(1)
           group.spawn_bg(() => raise Err)
           buf <+ "after spawn\n"
@@
 async test "error in cancellation" {
   let log = StringBuilder::new()
   let err = @test_util.expect_error_async <| () => {
-    @async.with_task_group(root => {
+    @async.with_task_group_renamed(root => {
       root.spawn_bg(no_wait=true) <| () => {
         @async.sleep(1000) catch {
           _ => {
@@
 ///|
 async test "immediately cancelled" {
   let log = StringBuilder::new()
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     let task = root.spawn(() => {
       defer log.write_string("task terminated\n")
       log <+ "task started\n"
@@
 ///|
 async test "immediate failure" {
   let result = @test_util.expect_error_async <| () => {
-    @async.with_task_group(group => {
+    @async.with_task_group_renamed(group => {
       group.spawn_bg(() => raise Failure::Failure("failure"))
       group.spawn_bg(() => group.spawn_bg(() => @async.sleep(100)))
     })
@@
 ///|
 async test "task group cancel & complete at the same time" {
   let log = []
-  @async.with_task_group() <| outer => {
+  @async.with_task_group_renamed() <| outer => {
-    @async.with_task_group() <| inner => {
+    @async.with_task_group_renamed() <| inner => {
       outer.spawn_bg(no_wait=true) <| () => {
         for i = 1; ; i = i + 1 {
           @async.pause()
*** Update File: <WORKDIR>/src\cond_var\README.mbt.md
@@
 async test "broadcast wakes every parked waiter" {
   let cond = @cond_var.Cond()
   let log = []
-  @async.with_task_group <| group => {
+  @async.with_task_group_renamed <| group => {
     for i in 0..<3 {
       group.spawn_bg() <| () => {
         cond.wait()
@@
 async test "signal wakes waiters FIFO" {
   let cond = @cond_var.Cond()
   let log = []
-  @async.with_task_group <| group => {
+  @async.with_task_group_renamed <| group => {
     // Task A parks at ~0 ms.
     group.spawn_bg() <| () => {
       cond.wait()
*** Update File: <WORKDIR>/src\cond_var\cond_var_test.mbt
@@
 
 ///|
 async test "cond var cancellation" {
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     let cond = @cond_var.Cond()
     root.spawn_bg() <| () => {
       @async.sleep(500)
@@
 ///|
 async test "cond var cancellation no_swallow" {
   let log = StringBuilder::new()
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     let cond = @cond_var.Cond()
     let wait_task = root.spawn(() => {
       cond.wait()
@@
 ///|
 async test "cond var fairness" {
   let log = StringBuilder::new()
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     let cond = @cond_var.Cond()
     root.spawn_bg() <| () => {
       for _ in 0..<3 {
@@
 ///|
 async test "cond var broadcast" {
   let log = StringBuilder::new()
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     let cond = @cond_var.Cond()
     for i in 0..<3 {
       root.spawn_bg() <| () => {
@@
 ///|
 async test "cond var broadcast cancellation" {
   let log = StringBuilder::new()
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     let cond = @cond_var.Cond()
     for i in 0..<3 {
       root.spawn_bg(allow_failure=true) <| () => {
*** Update File: <WORKDIR>/src\fs\access_test.mbt
@@
     return
   }
   let path = "_build/chmod_test"
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     @fs.write_file(path, "abcd", create_mode=CreateNew, permission=0o444)
     group.add_defer(() => @fs.remove(path))
     inspect(@fs.can_read(path), content="true")
*** Update File: <WORKDIR>/src\fs\create_test.mbt
@@
 ///|
 async test "create_mode test" {
   let path = "_build/create_exclusive_test"
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     for create_mode in [@fs.OpenExisting, @fs.TruncateExisting] {
       @test_util.assert_raise_async <| () => {
         @fs.open(path, mode=WriteOnly, create_mode~)
*** Update File: <WORKDIR>/src\fs\dir.mbt
@@
   let context = "@fs.walk()"
   guard max_concurrency > 0
   let sem = @async.Semaphore(max_concurrency)
-  @async.with_task_group() <| fn(group) {
+  @async.with_task_group_renamed() <| fn(group) {
     fn handle_path(path : String) {
       guard !exclude(path) else {  }
       group.spawn_bg(allow_failure~) <| () => {
*** Update File: <WORKDIR>/src\fs\lock_test.mbt
@@
 async test "flock exclusive vs exclusive" {
   let log = []
   let file_name = "_build/flock_ex_ex"
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     let file = @fs.open(file_name, create_mode=CreateOrTruncate, mode=ReadWrite)
     defer file.close()
     group.add_defer(() => @fs.remove(file_name))
@@
 async test "flock exclusive vs exclusive blocking" {
   let log = []
   let file_name = "_build/flock_ex_ex_blocking"
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     let file = @fs.open(file_name, create_mode=CreateOrTruncate, mode=ReadWrite)
     defer file.close()
     group.add_defer(() => @fs.remove(file_name))
@@
 async test "flock shared vs exclusive" {
   let log = []
   let file_name = "_build/flock_sh_ex"
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     let file = @fs.open(file_name, create_mode=CreateOrTruncate, mode=ReadWrite)
     defer file.close()
     group.add_defer(() => @fs.remove(file_name))
@@
 async test "flock shared vs exclusive blocking" {
   let log = []
   let file_name = "_build/flock_sh_ex_blocking"
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     let file = @fs.open(file_name, create_mode=CreateOrTruncate, mode=ReadWrite)
     defer file.close()
     group.add_defer(() => @fs.remove(file_name))
@@
 async test "flock exclusive vs shared" {
   let log = []
   let file_name = "_build/flock_ex_sh"
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     let file = @fs.open(file_name, create_mode=CreateOrTruncate, mode=ReadWrite)
     defer file.close()
     group.add_defer(() => @fs.remove(file_name))
@@
 async test "flock exclusive vs shared blocking" {
   let log = []
   let file_name = "_build/flock_ex_sh_blocking"
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     let file = @fs.open(file_name, create_mode=CreateOrTruncate, mode=ReadWrite)
     defer file.close()
     group.add_defer(() => @fs.remove(file_name))
@@
 async test "flock shared vs shared" {
   let log = []
   let file_name = "_build/flock_sh_sh"
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     let file = @fs.open(file_name, create_mode=CreateOrTruncate, mode=ReadWrite)
     defer file.close()
     group.add_defer(() => @fs.remove(file_name))
@@
 async test "flock shared vs shared blocking" {
   let log = []
   let file_name = "_build/flock_sh_sh_blocking"
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     let file = @fs.open(file_name, create_mode=CreateOrTruncate, mode=ReadWrite)
     defer file.close()
     group.add_defer(() => @fs.remove(file_name))
@@
 async test "flock shared vs shared vs exclusive" {
   let log = []
   let file_name = "_build/flock_sh_sh_ex"
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     let file = @fs.open(file_name, create_mode=CreateOrTruncate, mode=ReadWrite)
     defer file.close()
     group.add_defer(() => @fs.remove(file_name))
@@
 async test "flock shared vs shared vs exclusive blocking" {
   let log = []
   let file_name = "_build/flock_sh_sh_ex_blocking"
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     let file = @fs.open(file_name, create_mode=CreateOrTruncate, mode=ReadWrite)
     defer file.close()
     group.add_defer(() => @fs.remove(file_name))
@@
 async test "flock cancelled" {
   let log = []
   let file_name = "_build/flock_cancel"
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     let file = @fs.open(file_name, create_mode=CreateOrTruncate, mode=ReadWrite)
     defer file.close()
     group.add_defer(() => @fs.remove(file_name))
@@
 async test "flock advisory" {
   let log = []
   let file_name = "_build/flock_advisory"
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     @fs.write_file(file_name, create_mode=CreateOrTruncate, "abcd")
     let file = @fs.open(file_name, mode=ReadWrite)
     defer file.close()
*** Update File: <WORKDIR>/src\fs\mkdir_test.mbt
@@
 
 ///|
 async test "mkdir recursive" {
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     let base_path = "_build/recursive_mkdir"
     let path = "\{base_path}/test//directory"
     @fs.mkdir(path, recursive=true)
@@
 ///|
 #cfg(platform="windows")
 async test "mkdir recursive windows" {
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     let base_path = "_build\\recursive_mkdir_windows"
     let path = "\{base_path}\\test\\\\directory"
     @fs.mkdir(path, recursive=true)
*** Update File: <WORKDIR>/src\fs\named_pipe_test.mbt
@@
 ///|
 #cfg(platform="windows")
 async test "named pipe" {
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     let context = "named pipe test"
     let path = "\\\\.\\pipe\\moonbitlang_async_named_pipe_test"
     let w = @fd_util.create_named_pipe_server(
@@
 #cfg(platform="windows")
 async test "named pipe multiple client" {
   let log = []
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     let context = "named pipe test"
     let path = "\\\\.\\pipe\\moonbitlang_async_named_pipe_multiple_client_test"
     let w = @fd_util.create_named_pipe_server(
*** Update File: <WORKDIR>/src\fs\realpath_test.mbt
@@
 
 ///|
 async test "realpath link to dir absolute" {
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     guard @env.current_dir() is Some(cwd)
     let path = match cwd {
       [.., '/'] => cwd + "src/fs"
*** Update File: <WORKDIR>/src\fs\stat_test.mbt
@@
   guard @env.current_dir() is Some(cwd)
   let link_path = "_build/stat_symlink_to_dir_test"
   @fs.symlink(link_path, target="\{cwd}/_build")
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     group.add_defer(() => @fs.remove(link_path))
     debug_inspect(@fs.kind(link_path), content="Directory")
     debug_inspect(@fs.kind(link_path, follow_symlink=false), content="SymLink")
*** Update File: <WORKDIR>/src\fs\text_file_test.mbt
@@
 
 ///|
 async test "text file" {
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     let path = "_build/basic_text_file_test"
     root.add_defer(() => @fs.remove(path))
     @fs.write_file(path, "abcd", create_mode=CreateOrTruncate)
*** Update File: <WORKDIR>/src\fs\timestamp_test.mbt
@@
     return
   }
   let path = "/tmp/timestamp_test"
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     @fs.write_file(path, "abcd", create_mode=CreateOrTruncate, sync=Full)
     group.add_defer(() => @fs.remove(path))
     let mtime_1 = @fs.mtime(path)
@@
 #cfg(platform="windows")
 async test "mtime for path" {
   let path = "_build/timestamp_test"
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     @fs.write_file(path, "abcd", create_mode=CreateOrTruncate, sync=Full)
     group.add_defer(() => @fs.remove(path))
     let mtime_1 = @fs.mtime(path)
@@
     return
   }
   let path = "/tmp/opened_file_timestamp_test"
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     @fs.write_file(path, "abcd", create_mode=CreateOrTruncate, sync=Full)
     group.add_defer(() => @fs.remove(path))
     let file = @fs.open(path, mode=ReadWrite, sync=Full)
@@
 #cfg(platform="windows")
 async test "mtime for opened file" {
   let path = "_build/opened_file_timestamp_test"
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     @fs.write_file(path, "abcd", create_mode=CreateOrTruncate, sync=Full)
     group.add_defer(() => @fs.remove(path))
     let file = @fs.open(path, mode=ReadWrite, sync=Full)
*** Update File: <WORKDIR>/src\fs\tmpdir_test.mbt
@@
 
 ///|
 async test "tmpdir" {
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     let t1 = @fs.tmpdir(prefix="tmp")
     group.add_defer() <| () => {
       @async.protect_from_cancel(() => @fs.rmdir(t1, recursive=true))
*** Update File: <WORKDIR>/src\fs\watch_test.mbt
@@
 ///|
 async test "watch basic" {
   let log = []
-  @async.with_task_group(group => {
+  @async.with_task_group_renamed(group => {
     let path = "_build/watch_basic_test"
     let test_dir = Dir({
       "root_file": File("abcd"),
@@
 ///|
 async test "watch rename within" {
   let log = []
-  @async.with_task_group(group => {
+  @async.with_task_group_renamed(group => {
     let path = "_build/watch_rename_within_test"
     let test_dir = Dir({
       "root_file": File("abcd"),
@@
 ///|
 async test "watch rename inout test" {
   let log = []
-  @async.with_task_group(group => {
+  @async.with_task_group_renamed(group => {
     let base_path = "_build/watch_rename_inout_test"
     let test_dir = Dir({
       "watched": Dir({
@@
 ///|
 async test "watch horizontal swap" {
   let log = []
-  @async.with_task_group(group => {
+  @async.with_task_group_renamed(group => {
     let path = "_build/watch_swap_test"
     let test_dir = Dir({ "file1": File("abcd"), "file2": File("efgh") })
     test_dir.instantiate(path)
@@
 ///|
 async test "watch vertical swap" {
   let log = []
-  @async.with_task_group(group => {
+  @async.with_task_group_renamed(group => {
     let path = "_build/watch_vertical_swap_test"
     let test_dir = Dir({
       "outer": Dir({
@@
 ///|
 async test "watch ignored path" {
   let log = []
-  @async.with_task_group(group => {
+  @async.with_task_group_renamed(group => {
     let path = "_build/watch_ignored_path_test"
     let test_dir = Dir({
       "ignored": Dir({ "file": File("abcd") }),
*** Update File: <WORKDIR>/src\group_defer_test.mbt
@@
 ///|
 async test "group defer basic" {
   let log = StringBuilder::new()
-  @async.with_task_group() <| fn(root) {
+  @async.with_task_group_renamed() <| fn(root) {
     root.add_defer(() => log <+ "first group defer\n")
     root.spawn_bg() <| () => {
       defer log.write_string("defer for first task\n")
@@
 async test "group defer error" {
   let log = StringBuilder::new()
   let err = @test_util.expect_error_async <| () => {
-    @async.with_task_group(fn(root) {
+    @async.with_task_group_renamed(fn(root) {
       root.add_defer(() => log <+ "first group defer\n")
       root.spawn_bg() <| () => {
         defer log.write_string("defer for first task\n")
@@
 ///|
 async test "group defer cancelled" {
   let log = StringBuilder::new()
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     root.spawn_bg() <| () => {
       for _ in 0..<4 {
         @async.sleep(200)
@@
       }
     }
     @async.with_timeout_opt(500, () => {
-      @async.with_task_group(group => {
+      @async.with_task_group_renamed(group => {
         group.add_defer(() => {
           @async.protect_from_cancel() <| () => {
             @async.sleep(200)
*** Update File: <WORKDIR>/src\gzip\gzip_test.mbt
@@
 ///|
 #cfg(target="native")
 async fn node_gzip(mode : String, input : Bytes) -> Bytes {
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     let (stdin, we_write) = @process.write_to_process()
     let runner = group.spawn(() => {
       @process.collect_output("node", ["src/gzip/node_gzip.js", mode], stdin~)
@@
 #cfg(target="native")
 async fn encode_with_moonbit(input : Bytes) -> Bytes {
   let (r, w) = @io.pipe()
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     group.spawn_bg() <| () => {
       defer w.close()
       @gzip.Encoder(w)..write(input).end()
@@
 #cfg(target="native")
 async fn decode_with_moonbit(input : Bytes) -> Bytes {
   let (r, w) = @io.pipe()
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     group.spawn_bg() <| () => {
       defer w.close()
       w.write(input)
@@
 
 ///|
 async test "encode decode roundtrip" {
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     let source_chunks = ["hello ", "gzip ", "world"]
     let (compressed_r, compressed_w) = @io.pipe()
     root.spawn_bg() <| () => {
@@
 
 ///|
 async test "encoder uses valid blocks across large writes" {
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     let payload = Bytes::makei(70000, i => (i % 251).to_byte())
     let (compressed_r, compressed_w) = @io.pipe()
     root.spawn_bg() <| () => {
@@
 ///|
 async test "encoder emits output when flushed" {
   let log : Array[String] = []
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     let (r, w) = @io.pipe()
     root.spawn_bg() <| () => {
       defer w.close()
@@
 ///|
 async test "decoder yields plain chunks lazily across delayed chunks" {
   let log : Array[String] = []
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     let (compressed_r, compressed_w) = @io.pipe()
     root.spawn_bg() <| () => {
       defer compressed_w.close()
@@
 
 ///|
 async test "decoder supports reads smaller than writer chunks" {
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     let (compressed_r, compressed_w) = @io.pipe()
     root.spawn_bg() <| () => {
       defer compressed_w.close()
*** Update File: <WORKDIR>/src\http\client_test.mbt
@@
 ///|
 async test "request streaming" {
   let log = StringBuilder::new()
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     let port = test_server(group, log)
     async fn fetch_response(client : @http.Client) {
       while client.read_some() is Some(data) {
*** Update File: <WORKDIR>/src\http\parser_wbtest.mbt
@@
 ///|
 async test "read_request basic" {
   let log = StringBuilder::new()
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     let (r, w) = @io.pipe()
     root.spawn_bg() <| () => {
       defer w.close()
@@
 ///|
 async test "read_request fixed body" {
   let log = StringBuilder::new()
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     let (r, w) = @io.pipe()
     root.spawn_bg() <| () => {
       defer w.close()
@@
 
 ///|
 async test "read_request fixed body early EOF" {
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     let (r, w) = @io.pipe()
     root.spawn_bg() <| () => {
       defer w.close()
@@
 ///|
 async test "read_request chunked" {
   let log = StringBuilder::new()
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     let (r, w) = @io.pipe()
     root.spawn_bg() <| () => {
       defer w.close()
@@
 ///|
 async test "read_request stream" {
   let log = StringBuilder::new()
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     let (r, w) = @io.pipe()
     root.spawn_bg() <| () => {
       defer w.close()
@@
 ///|
 async test "multiple request" {
   let log = StringBuilder::new()
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     let (r, w) = @io.pipe()
     root.spawn_bg() <| () => {
       defer w.close()
@@
 ///|
 async test "read_response basic" {
   let log = StringBuilder::new()
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     let (r, w) = @io.pipe()
     root.spawn_bg() <| () => {
       defer w.close()
@@
 ///|
 async test "read_response passthrough fallback (no length headers)" {
   let log = StringBuilder::new()
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     let (r, w) = @io.pipe()
     root.spawn_bg() <| () => {
       defer w.close()
@@
 ///|
 async test "read_response 204 No Content (no body)" {
   let log = StringBuilder::new()
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     let (r, w) = @io.pipe()
     root.spawn_bg() <| () => {
       defer w.close()
@@
 ///|
 async test "read_response 205 Reset Content (no body)" {
   let log = StringBuilder::new()
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     let (r, w) = @io.pipe()
     root.spawn_bg() <| () => {
       defer w.close()
@@
 ///|
 async test "read_response 304 Not Modified (no body)" {
   let log = StringBuilder::new()
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     let (r, w) = @io.pipe()
     root.spawn_bg() <| () => {
       defer w.close()
@@
 ///|
 async test "read_response 100 Continue (no body)" {
   let log = StringBuilder::new()
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     let (r, w) = @io.pipe()
     root.spawn_bg() <| () => {
       defer w.close()
@@
 ///|
 async test "read_response CONNECT 200 (no body, tunnel mode)" {
   let log = StringBuilder::new()
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     let (r, w) = @io.pipe()
     root.spawn_bg() <| () => {
       defer w.close()
@@
 ///|
 async test "read_response HEAD 200 (no body)" {
   let log = StringBuilder::new()
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     let (r, w) = @io.pipe()
     root.spawn_bg() <| () => {
       defer w.close()
@@
 
 ///|
 async test "gzip split between chunks" {
-  let compressed = @async.with_task_group(group => {
+  let compressed = @async.with_task_group_renamed(group => {
     let (r, w) = @io.pipe()
     group.spawn_bg() <| () => {
       defer w.close()
@@
     r.read_all().binary()
   })
   let (r, w) = @io.pipe()
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     group.spawn_bg() <| () => {
       defer w.close()
       w
@@
 
 ///|
 async test "read_response parse cookie" {
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     let (r, w) = @io.pipe()
     group.spawn_bg() <| () => {
       defer w.close()
*** Update File: <WORKDIR>/src\http\proxy_test.mbt
@@
 ///|
 async test "passthrough mode" {
   let log = []
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     let server = @socket.TcpServer(@socket.Addr::parse("127.0.0.1:0"))
     let server_addr = server.addr
     group.spawn_bg() <| () => {
@@
 
 ///|
 async test "passthrough mode remaining data" {
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     let server = @socket.TcpServer(@socket.Addr::parse("127.0.0.1:0"))
     let server_addr = server.addr
     group.spawn_bg() <| () => {
@@
   log.push("proxy server: connected to \{request.path} successfully")
   conn..send_response(200, "OK").end_response()
   conn.enter_passthrough_mode()
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     group.spawn_bg(() => conn.write_reader(client))
     group.spawn_bg(() => client.write_reader(conn))
   }
@@
 ///|
 async test "proxied https request" {
   let log = []
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     let server = @http.Server(@socket.Addr::parse("127.0.0.1:0"))
     let port = server.addr.port()
     group.spawn_bg(no_wait=true) <| () => {
@@
 ///|
 async test "proxied http request" {
   let log = []
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     let server = @http.Server(@socket.Addr::parse("127.0.0.1:0"))
     let port = server.addr.port()
     group.spawn_bg(no_wait=true) <| () => {
@@
   let proxy_server_addr = proxy_server.addr
   let server = @socket.TcpServer(@socket.Addr::parse("127.0.0.1:0"))
   let port = server.addr.port()
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     group.spawn_bg(no_wait=true) <| () => {
       proxy_server.run_forever() <| ((req, body, conn) => {
         handle_connect(log, req, body, conn)
@@
 async test "proxy error" {
   let proxy_server = @http.Server(@socket.Addr::parse("127.0.0.1:0"))
   let port = proxy_server.addr.port()
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     group.spawn_bg(no_wait=true) <| () => {
       proxy_server.run_forever() <| ((_, _, conn) => {
         conn.send_response(407, "ProxyAuthenticationRequired")
*** Update File: <WORKDIR>/src\http\request_test.mbt
@@
 async test "manual Accept-Encoding" {
   let log = []
   let test_server = @http.Server(@socket.Addr::parse("127.0.0.1:0"))
-  @async.with_task_group <| group => {
+  @async.with_task_group_renamed <| group => {
     group.spawn_bg(no_wait=true) <| () => {
       test_server.run_forever() <| ((req, _body, conn) => {
         let accept_encoding = req.headers.get("accept-encoding")
*** Update File: <WORKDIR>/src\http\send_wbtest.mbt
@@
 
 ///|
 async test "send_request basic" {
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     let (r, w) = @io.pipe()
     root.spawn_bg() <| () => {
       defer w.close()
@@
 
 ///|
 async test "send_request stream" {
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     let (r, w) = @io.pipe()
     root.spawn_bg() <| () => {
       defer w.close()
@@
 
 ///|
 async test "send_request stream2" {
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     let (r, w) = @io.pipe()
     root.spawn_bg() <| () => {
       defer w.close()
@@
 
 ///|
 async test "send invalid header" {
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     let (r, w) = @io.pipe()
     root.spawn_bg() <| () => {
       defer w.close()
@@
 
 ///|
 async test "send fixed length" {
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     let (r, w) = @io.pipe()
     group.spawn_bg() <| () => {
       defer w.close()
@@
 
 ///|
 async test "sender write incorrect length" {
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     let (r, w) = @io.pipe()
     group.spawn_bg(no_wait=true) <| () => {
       defer r.close()
@@
 
 ///|
 async test "sender write_reader incorrect length" {
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     let (r, w) = @io.pipe()
     group.spawn_bg(no_wait=true) <| () => {
       defer r.close()
@@
 
 ///|
 async test "sender end_body incorrect length" {
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     let (r, w) = @io.pipe()
     group.spawn_bg(no_wait=true) <| () => {
       defer r.close()
@@
     ),
     Cookie("Cookie4", "value four", extensions=["ExtNoArg", "ExtWithArg=xxx"]),
   ]
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     let (r, w) = @io.pipe()
     group.spawn_bg() <| () => {
       defer w.close()
@@
 
 ///|
 async test "send_request empty body" {
-  @async.with_task_group <| group => {
+  @async.with_task_group_renamed <| group => {
     let (r, w) = @io.pipe()
     group.spawn_bg() <| () => {
       defer w.close()
@@
 
 ///|
 async test "send_response empty body" {
-  @async.with_task_group <| group => {
+  @async.with_task_group_renamed <| group => {
     let (r, w) = @io.pipe()
     group.spawn_bg() <| () => {
       defer w.close()
@@
 
 ///|
 async test "sender persistent header" {
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     let (r, w) = @io.pipe()
     root.spawn_bg() <| () => {
       defer w.close()
*** Update File: <WORKDIR>/src\internal\coroutine\pause_test.mbt
@@
 test "coroutine ping-pong" {
   let log = StringBuilder::new()
   let coro = @coroutine.spawn(() => {
-    @async.with_task_group(group => {
+    @async.with_task_group_renamed(group => {
       group.spawn_bg() <| () => {
         log <+ "ping\n"
         @async.pause()
*** Update File: <WORKDIR>/src\internal\event_loop\missing_close_test.mbt
@@
   let log = StringBuilder::new()
   @event_loop.check_fd_leak.val = false
   @event_loop.with_event_loop() <| () => {
-    @async.with_task_group() <| root => {
+    @async.with_task_group_renamed() <| root => {
       let (r, w) = @pipe.pipe()
       root.spawn_bg() <| () => {
         let data = r.read_exactly(4) |> @utf8.decode
*** Update File: <WORKDIR>/src\internal\event_loop\starvation_test.mbt
@@
 ///|
 async test "starvation" {
   let log = []
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     group.spawn_bg() <| () => {
       @async.sleep(50)
       log.push("sleep completed")
*** Update File: <WORKDIR>/src\internal\event_loop\worker_wbtest.mbt
@@
 ///|
 async test "worker basic" {
   let log = StringBuilder::new()
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     root.spawn_bg() <| () => {
       for _ in 0..<3 {
         @async.sleep(400)
@@
 ///|
 async test "worker multiple" {
   let log = StringBuilder::new()
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     root.spawn_bg() <| () => {
       for _ in 0..<3 {
         @async.sleep(200)
@@
 ///|
 async test "worker cancel1" {
   let log = StringBuilder::new()
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     root.spawn_bg() <| () => {
       for _ in 0..<4 {
         @async.sleep(200)
@@
 ///|
 async test "worker cancel2" {
   let log = StringBuilder::new()
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     root.spawn_bg() <| () => {
       for _ in 0..<3 {
         @async.sleep(400)
*** Update File: <WORKDIR>/src\io\README.mbt.md
@@
 ```moonbit check
 ///|
 async test "quick start pipeline" {
-  @async.with_task_group(root => {
+  @async.with_task_group_renamed(root => {
     // Create a pair of connected endpoints that speak the Reader/Writer protocols.
     // Data written to the write end (`writer`) can be read from the read end (`reader`)
     let (reader, writer) = @io.pipe()
@@
 ```moonbit check
 ///|
 async test "data as binary" {
-  @async.with_task_group(root => {
+  @async.with_task_group_renamed(root => {
     let (r, w) = @io.pipe()
     defer r.close()
     root.spawn_bg(() => {
@@
 
 ///|
 async test "data as text" {
-  @async.with_task_group(root => {
+  @async.with_task_group_renamed(root => {
     let (r, w) = @io.pipe()
     defer r.close()
     root.spawn_bg(() => {
@@
 
 ///|
 async test "data as json" {
-  @async.with_task_group(root => {
+  @async.with_task_group_renamed(root => {
     let (r, w) = @io.pipe()
     defer r.close()
     root.spawn_bg(() => {
@@
 ```moonbit check
 ///|
 async test "read from reader" {
-  @async.with_task_group(root => {
+  @async.with_task_group_renamed(root => {
     // Create connected endpoints. `r` is a Reader, `w` is a Writer.
     let (r, w) = @io.pipe()
     defer r.close()
@@
 
 ///|
 async test "read_exactly - read exact number of bytes" {
-  @async.with_task_group(root => {
+  @async.with_task_group_renamed(root => {
     let (r, w) = @io.pipe()
     defer r.close()
     root.spawn_bg(() => {
@@
 
 ///|
 async test "read_some - read next chunk of data" {
-  @async.with_task_group(root => {
+  @async.with_task_group_renamed(root => {
     let (r, w) = @io.pipe()
     defer r.close()
     root.spawn_bg(() => {
@@
 
 ///|
 async test "read_all - read entire content" {
-  @async.with_task_group(root => {
+  @async.with_task_group_renamed(root => {
     let (r, w) = @io.pipe()
     defer r.close()
     root.spawn_bg(() => {
@@
 
 ///|
 async test "read_all large data" {
-  @async.with_task_group(root => {
+  @async.with_task_group_renamed(root => {
     let (r, w) = @io.pipe()
     defer r.close()
     root.spawn_bg(() => {
@@
 
 ///|
 async test "drop - advance stream by discarding data" {
-  @async.with_task_group(root => {
+  @async.with_task_group_renamed(root => {
     let (r, w) = @io.pipe()
     defer r.close()
     root.spawn_bg(() => {
@@
 
 ///|
 async test "read_until - read text from stream until a separator is found" {
-  @async.with_task_group(root => {
+  @async.with_task_group_renamed(root => {
     let (r, w) = @io.pipe()
     defer r.close()
     root.spawn_bg(() => {
@@
 ```moonbit check
 ///|
 async test "write to writer" {
-  @async.with_task_group(root => {
+  @async.with_task_group_renamed(root => {
     let (r, w) = @io.pipe()
     defer r.close()
     root.spawn_bg(() => {
@@
 
 ///|
 async test "write_once - single write operation" {
-  @async.with_task_group(root => {
+  @async.with_task_group_renamed(root => {
     let (r, w) = @io.pipe()
     defer r.close()
     root.spawn_bg(() => {
@@
 
 ///|
 async test "write large data" {
-  @async.with_task_group(root => {
+  @async.with_task_group_renamed(root => {
     let (r, w) = @io.pipe()
     root.spawn_bg(() => {
       defer w.close()
@@
 ///|
 async test "write_reader - copy from reader to writer" {
   let log = StringBuilder::new()
-  @async.with_task_group(root => {
+  @async.with_task_group_renamed(root => {
     let (r1, w1) = @io.pipe()
     let (r2, w2) = @io.pipe()
     root.spawn_bg(() => {
@@
 
 ///|
 async test "write string" {
-  @async.with_task_group(root => {
+  @async.with_task_group_renamed(root => {
     let (r, w) = @io.pipe()
     defer r.close()
     root.spawn_bg(() => {
@@
 ///|
 async test "BufferedWriter - basic buffering" {
   let log = StringBuilder::new()
-  @async.with_task_group(root => {
+  @async.with_task_group_renamed(root => {
     let (r, w) = @io.pipe()
     root.spawn_bg(() => {
       defer w.close()
@@
 
 ///|
 async test "BufferedWriter::new with custom size" {
-  @async.with_task_group(root => {
+  @async.with_task_group_renamed(root => {
     let (r, w) = @io.pipe()
     defer r.close()
     root.spawn_bg(() => {
@@
 
 ///|
 async test "BufferedWriter::flush - commit buffered data" {
-  @async.with_task_group(root => {
+  @async.with_task_group_renamed(root => {
     let (r, w) = @io.pipe()
     defer r.close()
     root.spawn_bg(() => {
@@
 ///|
 async test "BufferedWriter::write_reader - buffered copy" {
   let log = StringBuilder::new()
-  @async.with_task_group(root => {
+  @async.with_task_group_renamed(root => {
     let (r1, w1) = @io.pipe()
     let (r2, w2) = @io.pipe()
     root.spawn_bg(() => {
*** Update File: <WORKDIR>/src\io\buffered_writer_test.mbt
@@
 ///|
 async test "BufferedWriter" {
   let log = StringBuilder::new()
-  @async.with_task_group() <| fn(root) {
+  @async.with_task_group_renamed() <| fn(root) {
     let (r, w) = @io.pipe()
     root.spawn_bg() <| () => {
       defer w.close()
@@
 ///|
 async test "BufferedWriter::write_reader" {
   let log = StringBuilder::new()
-  @async.with_task_group() <| fn(root) {
+  @async.with_task_group_renamed() <| fn(root) {
     let (r1, w1) = @io.pipe()
     let (r2, w2) = @io.pipe()
     root.spawn_bg() <| () => {
*** Update File: <WORKDIR>/src\io\pipe_test.mbt
@@
 ///|
 async test "PipeRead blocked cancellation safety" {
   let (r, w) = @io.pipe()
-  @async.with_task_group <| group => {
+  @async.with_task_group_renamed <| group => {
     let reader = group.spawn() <| () => {
       defer r.close()
       debug_inspect(
@@
 ///|
 async test "PipeWrite blocked cancellation safety" {
   let (r, w) = @io.pipe()
-  @async.with_task_group <| group => {
+  @async.with_task_group_renamed <| group => {
     let writer = group.spawn() <| () => {
       defer w.close()
       inspect(
@@
 ///|
 async test "PipeRead immediate cancellation safety" {
   let (r, w) = @io.pipe()
-  @async.with_task_group <| group => {
+  @async.with_task_group_renamed <| group => {
     let reader = group.spawn() <| () => {
       defer r.close()
       debug_inspect(
@@
 ///|
 async test "PipeWrite immediate cancellation safety" {
   let (r, w) = @io.pipe()
-  @async.with_task_group <| group => {
+  @async.with_task_group_renamed <| group => {
     let writer = group.spawn() <| () => {
       defer w.close()
       inspect(
*** Update File: <WORKDIR>/src\io\read_all_test.mbt
@@
 ///|
 async test "read_all basic" {
   let log = StringBuilder::new()
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     let (r, w) = @io.pipe()
     defer r.close()
     root.spawn_bg(() => writer(log, w))
@@
 
 ///|
 async test "read_all large data" {
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     let (r, w) = @io.pipe()
     defer r.close()
     root.spawn_bg() <| () => {
*** Update File: <WORKDIR>/src\io\read_some_test.mbt
@@
 ///|
 async test "read_some basic" {
   let log = StringBuilder::new()
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     let (r, w) = @io.pipe()
     defer r.close()
     root.spawn_bg(() => writer(log, w))
@@
 ///|
 async test "read_some length limit 1" {
   let log = StringBuilder::new()
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     let (r, w) = @io.pipe()
     defer r.close()
     root.spawn_bg(() => writer(log, w))
@@
 ///|
 async test "read_some length limit 2" {
   let log = StringBuilder::new()
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     let (r, w) = @io.pipe()
     defer r.close()
     root.spawn_bg(() => writer(log, w))
@@
 ///|
 async test "read_some length limit 3" {
   let log = StringBuilder::new()
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     let (r, w) = @io.pipe()
     defer r.close()
     root.spawn_bg() <| () => {
*** Update File: <WORKDIR>/src\io\writer_test.mbt
@@
 
 ///|
 async test "write large data" {
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     let (r, w) = @io.pipe()
     root.spawn_bg() <| () => {
       defer w.close()
@@
 ///|
 async test "write reader" {
   let log = StringBuilder::new()
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     let (r1, w1) = @io.pipe()
     let (r2, w2) = @io.pipe()
     root.spawn_bg() <| () => {
@@
 
 ///|
 async test "write_string" {
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     let (r, w) = @io.pipe()
     defer r.close()
     root.spawn_bg() <| () => {
*** Update File: <WORKDIR>/src\lazy_init_test.mbt
@@
     }
     log.push("lazy init completed at tick \{current_tick()}")
   })
-  let result = @async.with_task_group(group => {
+  let result = @async.with_task_group_renamed(group => {
     group.spawn_bg() <| () => {
       x.wait()
       log.push("got lazy init value at tick \{current_tick()}")
@@
     }
     log.push("lazy init completed at tick \{current_tick()}")
   })
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     group.spawn_bg() <| () => {
       debug_inspect(
         @async.with_timeout_opt(200, () => x.wait()),
*** Update File: <WORKDIR>/src\mutex_test.mbt
@@
 ///|
 async test "mutex basic" {
   let log = []
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     let mutex = @async.Mutex()
     for i in 0..<3 {
       group.spawn_bg() <| () => {
@@
 
 ///|
 async test "mutex cancellation" {
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     let mutex = @async.Mutex()
     group.spawn_bg() <| () => {
       mutex.acquire()
@@
 ///|
 async test "mutex cancellation no_swallow" {
   let log = []
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     let mutex = @async.Mutex()
     mutex.acquire()
     let acquire_taskire_task = group.spawn(() => {
@@
 ///|
 async test "mutex fairness" {
   let log = []
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     let mutex = @async.Mutex()
     group.spawn_bg() <| () => {
       for _ in 0..<3 {
*** Update File: <WORKDIR>/src\no_wait_test.mbt
@@
 ///|
 async test "no_wait cancelled" {
   let buf = StringBuilder::new()
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     root.spawn_bg(no_wait=true) <| () => {
       try @async.sleep(1000) catch {
         err => {
@@
 ///|
 async test "no_wait normal exit" {
   let buf = StringBuilder::new()
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     root.spawn_bg(no_wait=true) <| () => {
       try @async.sleep(100) catch {
         err => {
*** Update File: <WORKDIR>/src\pipe\read_exactly_test.mbt
@@
     buf..write_string(msg).write_char('\n')
   }
 
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     let (r, w) = @pipe.pipe()
     // reader
     root.spawn_bg() <| () => {
@@
     buf..write_string(msg).write_char('\n')
   }
 
-  (@async.with_task_group() <| root => {
+  (@async.with_task_group_renamed() <| root => {
     let (r, w) = @pipe.pipe()
     // reader
     root.spawn_bg() <| () => {
*** Update File: <WORKDIR>/src\process\basic_test.mbt
@@
 
 ///|
 async test "basic_ls" {
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     let (r, w) = @process.read_from_process()
     defer r.close()
     @process.spawn(group, shell, ["-c", "\{ls} test_directory"], stdout=w, extra_env={
@@
 ///|
 async test "basic_cat" {
   let cat = cat.wait()
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     let (cat_read, we_write) = @process.write_to_process()
     let (we_read, cat_write) = @process.read_from_process()
     @process.spawn(group, cat, [], stdin=cat_read, stdout=cat_write) |> ignore
*** Update File: <WORKDIR>/src\process\cancel_test.mbt
@@
 async test "cancel process" {
   let test_prog = sleep_prog.wait()
   let log = StringBuilder::new()
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     let (r, w) = @process.read_from_process()
     let task = root.spawn(() => {
       defer log.write_string("process terminates\n")
@@
 ///|
 async test "cancel process timeout" {
   let test_prog = sleep_prog.wait()
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     let (r, w) = @process.read_from_process()
     let task = root.spawn(() => {
       @process.run(
@@
 ///|
 async test "cancel process hard" {
   let test_prog = sleep_prog.wait()
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     let (r, w) = @process.read_from_process()
     let task = root.spawn(() => {
       @process.run(
@@
 ///|
 async test "orphan process" {
   let log = StringBuilder::new()
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     let (r, w) = @process.read_from_process()
     let task = root.spawn(() => {
       defer log.write_string("process terminates\n")
*** Update File: <WORKDIR>/src\process\cwd_test.mbt
@@
 
 ///|
 async test "set cwd" {
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     // FIXME(upstram): missing codelens here
     guard @env.current_dir() is Some(prev_cwd)
     let (r, w) = @process.read_from_process()
*** Update File: <WORKDIR>/src\process\env_test.mbt
@@
 
 ///|
 async test "set_env" {
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     let (r, w) = @process.read_from_process()
     defer r.close()
     let env_var = if is_windows { "$env:MAGIC_VAR" } else { "$MAGIC_VAR" }
@@
 ///|
 async test "set_env no inherit" {
   let test_prog = dump_env_prog.wait()
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     let (r, w) = @process.read_from_process()
     defer r.close()
     let _ = @process.spawn(
*** Update File: <WORKDIR>/src\process\helper_test.mbt
@@
 ///|
 async test "collect_output blocked" {
   let test_prog = cat.wait()
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     let (cat_read, we_write) = @process.write_to_process()
     group.spawn_bg() <| () => {
       defer we_write.close()
*** Update File: <WORKDIR>/src\process\process.mbt
@@
   process.wait_pid(context~) catch {
     _ if @coroutine.is_being_cancelled() =>
       @async.protect_from_cancel() <| () => {
-        @async.with_task_group() <| group => {
+        @async.with_task_group_renamed() <| group => {
           group.spawn_bg(no_wait=true, () => cancel_handler(pid))
           process.wait_pid(context~)
         }
@@
     process.wait_pid(context~) catch {
       _ if @coroutine.is_being_cancelled() =>
         @async.protect_from_cancel() <| () => {
-          @async.with_task_group() <| group => {
+          @async.with_task_group_renamed() <| group => {
             group.spawn_bg(no_wait=true, () => cancel_handler(pid))
             process.wait_pid(context~)
           }
@@
   no_console_window? : Bool,
 ) -> (Int, &@io.Data) {
   let (r, w) = read_from_process()
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     defer r.close()
     let exit_code = group.spawn(() => {
       run(
@@
   no_console_window? : Bool,
 ) -> (Int, &@io.Data) {
   let (r, w) = read_from_process()
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     defer r.close()
     let exit_code = group.spawn(() => {
       run(
@@
 ) -> (Int, &@io.Data, &@io.Data) {
   let (r_out, w_out) = read_from_process()
   let (r_err, w_err) = read_from_process()
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     let exit_code = group.spawn(() => {
       run(
         cmd,
@@
   no_console_window? : Bool,
 ) -> (Int, &@io.Data) {
   let (r, w) = read_from_process()
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     defer r.close()
     let exit_code = group.spawn(() => {
       run(
*** Update File: <WORKDIR>/src\process\redirect_test.mbt
@@
 
 ///|
 async test "merge multiple" {
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     let (r, w) = @pipe.pipe()
     root.spawn_bg(no_wait=true) <| () => {
       defer r.close()
@@
       inspect(r.read_all().text(), content="abcdefgh")
     }
     defer w.close()
-    @async.with_task_group() <| group => {
+    @async.with_task_group_renamed() <| group => {
       @process.spawn(group, shell, ["-c", "\{write_stdout} abcd"], stdout=w, extra_env={
         "LANG": "en_US.UTF-8",
       })
@@
 ///|
 async test "redirect to file" {
   let cat = cat.wait()
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     let input_file = "_build/process_redirect_test_in.txt"
     let output_file = "_build/process_redirect_test_out.txt"
     root.add_defer(() => @fs.remove(input_file))
@@
 
 ///|
 async test "merge stdout and stderr" {
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     let (r, w) = @process.read_from_process()
     defer r.close()
     let _ = @process.spawn(
*** Update File: <WORKDIR>/src\process\spawn_in_group_test.mbt
@@
   let log = []
   let sleep = sleep_prog.wait()
   let t0 = @env.now()
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     let _ = @process.spawn(group, sleep, ["500"])
     @async.sleep(250)
     let t = (@env.now() - t0).to_int() / 250
@@
 ///|
 async test "spawn_in_group cancel" {
   let sleep = sleep_prog.wait()
-  @async.with_task_group() <| outer => {
+  @async.with_task_group_renamed() <| outer => {
     let (r, w) = @process.read_from_process()
     outer.spawn_bg() <| () => {
       defer r.close()
       inspect(r.read_all().text().trim(), content="received termination signal")
     }
-    @async.with_task_group() <| inner => {
+    @async.with_task_group_renamed() <| inner => {
       let _ = @process.spawn(inner, sleep, ["10000"], stdout=w, no_wait=true)
       @async.sleep(300)
     }
@@
 async test "Process::wait" {
   let sleep = sleep_prog.wait()
   let mut t0 = 0UL
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     let child = @process.spawn(group, sleep, ["500", "-exit-code", "42"])
     t0 = @env.now()
     let result = child.wait()
@@
 ///|
 async test "Process::try_wait" {
   let sleep = sleep_prog.wait()
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     let child = @process.spawn(group, sleep, ["450", "-exit-code", "42"])
     @async.sleep(300)
     debug_inspect(child.try_wait(), content="None")
@@
 async test "Process:cancel" {
   let sleep = sleep_prog.wait()
   let mut t0 = 0UL
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     let (r, w) = @process.read_from_process()
     group.spawn_bg() <| () => {
       defer r.close()
*** Update File: <WORKDIR>/src\process\wait_test.mbt
@@
 async test "basic wait" {
   let log = StringBuilder::new()
   let test_prog = sleep_prog.wait()
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     root.spawn_bg() <| () => {
       for i in 0..<2 {
         @async.sleep(750)
@@
 async test "wait_pid" {
   let log = StringBuilder::new()
   let test_prog = sleep_prog.wait()
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     group.spawn_bg() <| () => {
       for _ in 0..<2 {
         @async.sleep(800)
*** Update File: <WORKDIR>/src\protect_from_cancel_test.mbt
@@
 ///|
 async test "protect_from_cancel" {
   let log = StringBuilder::new()
-  @async.with_task_group(root => {
+  @async.with_task_group_renamed(root => {
     root.spawn_bg() <| () => {
       @async.protect_from_cancel(() => {
         @async.sleep(400) catch {
@@
 ///|
 async test "protect_from_cancel wait" {
   let log = StringBuilder::new()
-  @async.with_task_group(root => {
+  @async.with_task_group_renamed(root => {
     root.spawn_bg() <| () => {
       @async.sleep(200)
       log <+ "200ms tick\n"
@@
       @async.sleep(200)
       log <+ "400ms tick\n"
     }
-    @async.with_task_group(group => {
+    @async.with_task_group_renamed(group => {
       group.spawn_bg() <| () => {
         @async.sleep(300)
         log.write_string("trying to cancel the group containing critial job\n")
@@
 ///|
 async test "protect_from_cancel with_timeout" {
   let log = StringBuilder::new()
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     root.spawn_bg() <| () => {
       @async.sleep(200)
       log <+ "200ms tick\n"
@@
   let log = StringBuilder::new()
   let result : Error = @test_util.expect_error_async <| () => {
     (
-      @async.with_task_group(root => {
+      @async.with_task_group_renamed(root => {
         root.spawn_bg() <| () => {
           @async.sleep(200)
           log <+ "200ms tick\n"
@@
 ///|
 async test "protect_from_cancel nested1" {
   let log = StringBuilder::new()
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     root.spawn_bg() <| () => {
       @async.sleep(200)
       log <+ "200ms tick\n"
@@
 ///|
 async test "protect_from_cancel nested2" {
   let log = StringBuilder::new()
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     root.spawn_bg() <| () => {
       @async.sleep(200)
       log <+ "200ms tick\n"
@@
 ///|
 async test "protect_from_cancel in cancellation handler" {
   let log = StringBuilder::new()
-  @async.with_task_group(root => {
+  @async.with_task_group_renamed(root => {
     root.spawn_bg(no_wait=true) <| () => {
       @async.sleep(400) catch {
         err => {
@@
 ///|
 async test "cancel while scheduled" {
   let log = StringBuilder::new()
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     root.spawn_bg() <| () => {
       for _ in 0..<2 {
         @async.sleep(200)
@@
 ///|
 async test "error in async cancel" {
   let log = StringBuilder::new()
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     root.spawn_bg() <| () => {
       for _ in 0..<2 {
         @async.sleep(300)
@@
         log <+ "tick\n"
       }
     }
-    @async.with_task_group(group => {
+    @async.with_task_group_renamed(group => {
       group.spawn_bg(no_wait=true, allow_failure=true) <| () => {
         @async.sleep(1000) catch {
           _ => {
*** Update File: <WORKDIR>/src\raw_fd\raw_fd_test.mbt
@@
   )
   assert_true(@event_loop.kind_of_fd(r, context="kind_of_fd") is Pipe)
   assert_true(@event_loop.kind_of_fd(w, context="kind_of_fd") is Pipe)
-  @async.with_task_group <| group => {
+  @async.with_task_group_renamed <| group => {
     group.spawn_bg() <| () => {
       let r = @raw_fd.RawFd(r)
       defer r.close()
@@
   )
   assert_true(@event_loop.kind_of_fd(r, context="kind_of_fd") is Pipe)
   assert_true(@event_loop.kind_of_fd(w, context="kind_of_fd") is Pipe)
-  @async.with_task_group <| group => {
+  @async.with_task_group_renamed <| group => {
     group.spawn_bg() <| () => {
       let r = @raw_fd.RawFdStream(r)
       defer r.close()
@@
   let log = []
   let server = @socket.UdpServer(@socket.Addr::parse("127.0.0.1:0"))
   let port = server.addr.port()
-  @async.with_task_group <| group => {
+  @async.with_task_group_renamed <| group => {
     group.spawn_bg(no_wait=true) <| () => {
       defer server.close()
       let buf = FixedArray::make(1024, b'\x00')
*** Update File: <WORKDIR>/src\return_immediately_test.mbt
@@
 
 ///|
 async test "return_immediately basic" {
-  @async.with_task_group(root => {
+  @async.with_task_group_renamed(root => {
     root.spawn_bg() <| () => {
       @async.sleep(200)
       root.return_immediately(())
@@
 
 ///|
 async test "return_immediately nested" {
-  @async.with_task_group(root => {
+  @async.with_task_group_renamed(root => {
     root.spawn_bg() <| () => { @async.sleep(300) }
-    @async.with_task_group() <| fn(group) {
+    @async.with_task_group_renamed() <| fn(group) {
       group.spawn_bg() <| () => {
         @async.sleep(200)
         root.return_immediately(())
@@
 async test "return_immediately error on cancel" {
   let log = StringBuilder::new()
   let err = @test_util.expect_error_async <| () => {
-    @async.with_task_group(root => {
+    @async.with_task_group_renamed(root => {
       root.spawn_bg() <| () => {
         @async.sleep(200)
         root.return_immediately(())
@@
 ///|
 async test "return_immediately recursive cancel" {
   let log = []
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     group.spawn_bg() <| () => {
       @async.sleep(100)
       log.push("100ms tick")
     }
-    @async.with_task_group(group => {
+    @async.with_task_group_renamed(group => {
       group.return_immediately(()) catch {
         _ => @async.sleep(200)
       }
@@
 ///|
 async test "return_immediately called outside" {
   let log = []
-  @async.with_task_group() <| outer => {
+  @async.with_task_group_renamed() <| outer => {
     outer.spawn_bg() <| () => {
       @async.sleep(100)
       log.push("100ms tick")
     }
-    @async.with_task_group(inner => {
+    @async.with_task_group_renamed(inner => {
       outer.spawn_bg(() => inner.return_immediately(()))
     })
     log.push("inner group finished")
*** Update File: <WORKDIR>/src\semaphore\README.mbt.md
@@
 async test "mutex serializes access" {
   let mutex = @semaphore.Semaphore(1)
   let log = []
-  @async.with_task_group <| group => {
+  @async.with_task_group_renamed <| group => {
     for i in 0..<3 {
       group.spawn_bg() <| () => {
         mutex.acquire()
@@
   let limit = @semaphore.Semaphore(3)
   let mut active = 0
   let mut peak = 0
-  @async.with_task_group <| group => {
+  @async.with_task_group_renamed <| group => {
     for _ in 0..<8 {
       group.spawn_bg() <| () => {
         limit.acquire()
@@
   // size 1, but starts empty — acquire blocks until release().
   let ready = @semaphore.Semaphore(1, initial_value=0)
   let log = []
-  @async.with_task_group <| group => {
+  @async.with_task_group_renamed <| group => {
     group.spawn_bg() <| () => {
       log.push("waiter: parking")
       ready.acquire()
@@
   let n = 3
   let done = @semaphore.Semaphore(n, initial_value=0)
   let log = []
-  @async.with_task_group <| group => {
+  @async.with_task_group_renamed <| group => {
     for i in 0..<n {
       group.spawn_bg() <| () => {
         @async.sleep(20 * (i + 1))
@@
   let sem = @semaphore.Semaphore(1)
   sem.acquire() // main holds the permit
   let log = []
-  @async.with_task_group <| group => {
+  @async.with_task_group_renamed <| group => {
     // Task A starts waiting at ~0 ms.
     group.spawn_bg() <| () => {
       sem.acquire()
*** Update File: <WORKDIR>/src\semaphore\semaphore_test.mbt
@@
 ///|
 async test "semaphore mutex" {
   let log = StringBuilder::new()
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     let semaphore = @semaphore.Semaphore(1)
     for i in 0..<3 {
       root.spawn_bg() <| () => {
@@
 ///|
 async test "semaphore multiple value" {
   let log = StringBuilder::new()
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     let semaphore = @semaphore.Semaphore(2)
     for i in 0..<6 {
       root.spawn_bg() <| () => {
@@
 
 ///|
 async test "semaphore cancellation" {
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     let semaphore = @semaphore.Semaphore(1)
     root.spawn_bg() <| () => {
       semaphore.acquire()
@@
 ///|
 async test "semaphore cancellation no_swallow" {
   let log = StringBuilder::new()
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     let semaphore = @semaphore.Semaphore(1)
     semaphore.acquire()
     let acquire_taskire_task = root.spawn(() => {
@@
 ///|
 async test "semaphore fairness" {
   let log = StringBuilder::new()
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     let semaphore = @semaphore.Semaphore(1)
     root.spawn_bg() <| () => {
       for _ in 0..<3 {
*** Update File: <WORKDIR>/src\signal\signal_test.mbt
@@
 async test "cancel with default signal" {
   let test_prog = sleep_prog.wait()
   let log = []
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     let (r, w) = @process.read_from_process()
     let task = group.spawn(() => {
       defer log.push("process terminates")
*** Update File: <WORKDIR>/src\socket\connect_burst_test.mbt
@@
 ///|
 async test "connection burst" {
   let mut result = 0
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     let server = @socket.TcpServer(@socket.Addr::parse("127.0.0.1:0"))
     let addr = server.addr
     root.spawn_bg(() => result = server_main(server))
     root.spawn_bg() <| () => {
-      @async.with_task_group() <| fn(ctx) {
+      @async.with_task_group_renamed() <| fn(ctx) {
         for _ in 0..<6 {
           ctx.spawn_bg(() => client(b"ping", addr))
         }
@@
 ///|
 async test "connection burst with ipv6" {
   let mut result = 0
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     let server = @socket.TcpServer(
       @socket.Addr::parse("[::1]:0"),
       dual_stack=false,
@@
     let addr = server.addr
     root.spawn_bg(() => result = server_main(server))
     root.spawn_bg() <| () => {
-      @async.with_task_group() <| fn(ctx) {
+      @async.with_task_group_renamed() <| fn(ctx) {
         for _ in 0..<6 {
           ctx.spawn_bg(() => client(b"ping", addr))
         }
*** Update File: <WORKDIR>/src\socket\dual_stack_test.mbt
@@
 ///|
 async test "Only_V4 server" {
   let log = StringBuilder::new()
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     let server = @socket.TcpServer(@socket.Addr::parse("0.0.0.0:0"))
     let port = server.addr.port()
     root.spawn_bg(no_wait=true) <| () => {
@@
 ///|
 async test "Only_V6 server" {
   let log = StringBuilder::new()
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     let server = @socket.TcpServer(
       @socket.Addr::parse("[::]:0"),
       dual_stack=false,
@@
 ///|
 async test "dual stack server" {
   let log = StringBuilder::new()
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     let server = @socket.TcpServer(@socket.Addr::parse("[::]:0"))
     let port = server.addr.port()
     root.spawn_bg(no_wait=true) <| () => {
@@
 ///|
 async test "Only_V4 UDP server" {
   let log = StringBuilder::new()
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     let server = @socket.UdpServer(@socket.Addr::parse("0.0.0.0:0"))
     let port = server.addr.port()
     root.spawn_bg(no_wait=true) <| () => {
@@
 ///|
 async test "Only_V6 UDP server" {
   let log = StringBuilder::new()
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     let server = @socket.UdpServer(
       @socket.Addr::parse("[::]:0"),
       dual_stack=false,
@@
 ///|
 async test "dual stack UDP server" {
   let log = StringBuilder::new()
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     let server = @socket.UdpServer(@socket.Addr::parse("[::]:0"))
     let port = server.addr.port()
     root.spawn_bg(no_wait=true) <| () => {
*** Update File: <WORKDIR>/src\socket\getsockname_test.mbt
@@
 
 ///|
 async test "getsockname TCP" {
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     let server = @socket.TcpServer(@socket.Addr::parse("127.0.0.1:0"))
     let server_addr = server.addr
     guard server_addr.to_string() is [.. "127.0.0.1:", ..] else {
@@
 
 ///|
 async test "getsockname UDP" {
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     let server = @socket.UdpServer(@socket.Addr::parse("127.0.0.1:0"))
     let server_addr = server.addr
     guard server_addr.to_string() is [.. "127.0.0.1:", ..] else {
*** Update File: <WORKDIR>/src\socket\happy_eyeball.mbt
@@
   let mut result = None
   let mut conn_err = None
   async fn connect_with_protocol(protocol : IpProtocolPreference) {
-    @async.with_task_group() <| group => {
+    @async.with_task_group_renamed() <| group => {
       for ai = ai; !ai.is_null(); ai = ai.next() {
         let addr = ai.to_addr(port)
         match (protocol, addr.is_ipv6()) {
*** Update File: <WORKDIR>/src\socket\multicast_test.mbt
@@
 ///|
 async test "multicast basic" {
   let log = []
-  @async.with_task_group <| group => {
+  @async.with_task_group_renamed <| group => {
     let addr = @socket.Addr::parse("239.0.0.1:4200")
     let interface_addr = @socket.Addr::parse("127.0.0.1:0")
     group.spawn_bg(no_wait=true) <| () => {
@@
 ///|
 async test "multicast discovery then unicast" {
   let log = []
-  @async.with_task_group <| group => {
+  @async.with_task_group_renamed <| group => {
     let interface_addr = @socket.Addr::parse("127.0.0.1:0")
     let server = @socket.UdpServer(@socket.Addr::parse("0.0.0.0:0"))
     defer server.close()
@@
     return
   }
   let log = []
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     let server = @socket.UdpServer::multicast(
       @socket.Addr::parse("239.0.0.1:0"),
     )
@@
     return
   }
   let log = []
-  @async.with_task_group <| group => {
+  @async.with_task_group_renamed <| group => {
     let server = @socket.UdpServer(@socket.Addr::parse("[::]:0"))
     defer server.close()
     let port = server.addr.port()
@@
     return
   }
   let log = []
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     let server = @socket.UdpServer(@socket.Addr::parse("[::]:0"))
     let port = server.addr.port()
     let multicast_addr = @socket.Addr::parse("[ff02::1]:\{port}")
*** Update File: <WORKDIR>/src\socket\read_exactly_test.mbt
@@
     buf..write_string(msg).write_char('\n')
   }
 
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     // server
     let server = @socket.TcpServer(@socket.Addr::parse("127.0.0.1:0"))
     let addr = server.addr
@@
     buf..write_string(msg).write_char('\n')
   }
 
-  (@async.with_task_group() <| root => {
+  (@async.with_task_group_renamed() <| root => {
     // server
     let server = @socket.TcpServer(@socket.Addr::parse("127.0.0.1:0"))
     let addr = server.addr
*** Update File: <WORKDIR>/src\socket\resolve_host_test.mbt
@@
 ///|
 async test "resolve cancel" {
   let log = StringBuilder::new()
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     let lock = @async.Semaphore(1, initial_value=1)
     let task = root.spawn(() => {
       lock.release()
*** Update File: <WORKDIR>/src\socket\reuse_addr_test.mbt
@@
 ///|
 async test "reuse addr" {
   let mut port = 0
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     group.spawn_bg() <| () => {
       for _ in 0..<2 {
         let server = @socket.TcpServer(
*** Update File: <WORKDIR>/src\socket\tcp.mbt
@@
     None => None
     Some(n) => Some(@async.Semaphore(n))
   }
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     for ;; {
       // only accept the connection if we have enough
       // concurrency budget.
*** Update File: <WORKDIR>/src\spawn_loop_test.mbt
@@
 ///|
 async test "spawn_loop basic" {
   let log = StringBuilder::new()
-  @async.with_task_group(root => {
+  @async.with_task_group_renamed(root => {
     let mut i = 0
     root.spawn_loop() <| () => {
       log.write_string("tick \{i}\n")
@@
 async test "spawn_loop basic-error" {
   let log = StringBuilder::new()
   let err = @test_util.expect_error_async <| () => {
-    @async.with_task_group(root => {
+    @async.with_task_group_renamed(root => {
       let mut i = 0
       root.spawn_loop() <| () => {
         log.write_string("tick \{i}\n")
@@
 ///|
 async test "spawn_loop retry-exponential" {
   let log = []
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     let mut i = 0
     let start = @env.now()
     fn tick() {
*** Update File: <WORKDIR>/src\spawn_test.mbt
@@
 async test "spawn error1" {
   let buf = StringBuilder::new()
   let result = @test_util.expect_error_async <| () => {
-    @async.with_task_group(root => {
+    @async.with_task_group_renamed(root => {
       root.spawn_bg() <| () => {
         @async.sleep(1000)
         buf <+ "task 1 finished\n"
@@
 async test "spawn error2" {
   let buf = StringBuilder::new()
   let result = @test_util.expect_error_async <| () => {
-    @async.with_task_group(root => {
+    @async.with_task_group_renamed(root => {
       root.spawn_bg() <| () => {
         @async.sleep(200)
         raise Err
@@
   let log = []
   @test_util.assert_raise_async <| () => {
     (
-      @async.with_task_group(group => {
+      @async.with_task_group_renamed(group => {
         group.spawn_bg() <| () => {
           // emulate a non-cancellable job,
           // or a job that happens to be completed on cancellation,
*** Update File: <WORKDIR>/src\stdio\stdio_test.mbt
@@
 ///|
 #cfg(target="native")
 async test "redirect pipe" {
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     let cat = cat.wait()
     let (cat_read, we_write) = @process.write_to_process()
     let (we_read, cat_write) = @process.read_from_process()
@@
 #cfg(target="native")
 async test "stdio cancel" {
   let cat = cat.wait()
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     let (cat_read, we_write) = @process.write_to_process()
     let (we_read, cat_write) = @process.read_from_process()
     group.spawn_bg() <| () => {
@@
 async test "stdout and stderr are the same" {
   let cat = cat.wait()
   let (cat_read, we_write) = @process.write_to_process()
-  @async.with_task_group <| group => {
+  @async.with_task_group_renamed <| group => {
     let cat_task = group.spawn() <| () => {
       @process.collect_output_merged(cat, [], stdin=cat_read)
     }
*** Update File: <WORKDIR>/src\task_group.mbt
@@
 ///
 /// If all children task terminate successfully,
 /// `with_task_group` will return the result of `f`.
-pub async fn[X] with_task_group(f : async (TaskGroup[X]) -> X) -> X {
+pub async fn[X] with_task_group_renamed(f : async (TaskGroup[X]) -> X) -> X {
   let tg = {
     children: Set([]),
     parent: @coroutine.current_coroutine(),
*** Update File: <WORKDIR>/src\timer_test.mbt
@@
 ///|
 async test "basic sleep" {
   let buf = StringBuilder::new()
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     root.spawn_bg() <| () => {
       @async.sleep(100)
       buf <+ "task 1, tick 1\n"
@@
 ///|
 async test "Timer basic" {
   let log = []
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     group.spawn_bg() <| () => {
       @async.sleep(150)
       log.push("sleep: tick #1")
@@
     @async.sleep(300)
     log.push("creating timer")
     let timer = @async.Timer(300)
-    @async.with_task_group() <| group => {
+    @async.with_task_group_renamed() <| group => {
       for _ in 0..<3 {
         group.spawn_bg() <| () => {
           timer.wait()
@@
     (@env.now() - start + 50).to_int() / 150
   }
   let timer = @async.Timer(450)
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     group.spawn_bg() <| () => {
       @async.sleep(150)
       timer.cancel()
@@
   }
 
   let timer = @async.Timer(300)
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     group.spawn_bg() <| () => {
       timer.wait()
       log.push("Timer::wait() completed at tick #\{tick()}")
*** Update File: <WORKDIR>/src\tls\certificate_test.mbt
@@
 
 ///|
 async test "get_peer_certificate" {
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     let (client_read_from_server, server_write_to_client) = @pipe.pipe()
     let (server_read_from_client, client_write_to_server) = @pipe.pipe()
     // server
*** Update File: <WORKDIR>/src\tls\channel_binding_test.mbt
@@
 
 ///|
 async test "channel binding" {
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     let (client_read_from_server, server_write_to_client) = @pipe.pipe()
     let (server_read_from_client, client_write_to_server) = @pipe.pipe()
     // server
*** Update File: <WORKDIR>/src\tls\shutdown_test.mbt
@@
 
 ///|
 async test "peer close connection" {
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     // server
     let server = @socket.TcpServer(@socket.Addr::parse("127.0.0.1:0"))
     let addr = server.addr
*** Update File: <WORKDIR>/src\tls\tls_test.mbt
@@
 ///|
 async test "one way" {
   let log = StringBuilder::new()
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     let (client_read_from_server, server_write_to_client) = @pipe.pipe()
     let (server_read_from_client, client_write_to_server) = @pipe.pipe()
     // server
@@
 ///|
 async test "echo" {
   let log = StringBuilder::new()
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     let (client_read_from_server, server_write_to_client) = @pipe.pipe()
     let (server_read_from_client, client_write_to_server) = @pipe.pipe()
     // server
@@
 
 ///|
 async test "`connect` accidental close" {
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     let (client_read_from_server, server_write_to_client) = @pipe.pipe()
     let (server_read_from_client, client_write_to_server) = @pipe.pipe()
     // server
@@
 
 ///|
 async test "`read` already closed" {
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     let (client_read_from_server, server_write_to_client) = @pipe.pipe()
     let (server_read_from_client, client_write_to_server) = @pipe.pipe()
     // server
@@
 
 ///|
 async test "client custom root certificate" {
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     let (client_read_from_server, server_write_to_client) = @pipe.pipe()
     let (server_read_from_client, client_write_to_server) = @pipe.pipe()
     root.spawn_bg() <| () => {
@@
 
 ///|
 async test "client custom root certificate rejects different root" {
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     let (client_read_from_server, server_write_to_client) = @pipe.pipe()
     let (server_read_from_client, client_write_to_server) = @pipe.pipe()
     root.spawn_bg() <| () => {
*** Update File: <WORKDIR>/src\wait_test.mbt
@@
 ///|
 async test "wait basic" {
   let buf = StringBuilder::new()
-  @async.with_task_group(root => {
+  @async.with_task_group_renamed(root => {
     root.spawn_bg() <| () => {
       @async.sleep(200)
       buf <+ "200ms tick\n"
@@
 ///|
 async test "wait cancelled" {
   let buf = StringBuilder::new()
-  @async.with_task_group(root => {
+  @async.with_task_group_renamed(root => {
     let task = root.spawn(() => {
       @async.sleep(1000)
       buf <+ "task finished\n"
@@
 ///|
 async test "try_wait" {
   let log = StringBuilder::new()
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     let task = root.spawn(no_wait=true, () => {
       @async.sleep(450)
       42
*** Update File: <WORKDIR>/src\websocket\README.mbt.md
@@
 ///|
 #cfg(target="native")
 async test "WebSocket client example" {
-  @async.with_task_group(group => {
+  @async.with_task_group_renamed(group => {
     let port = 42080
     let addr = @socket.Addr::parse("127.0.0.1:\{port}")
     group.spawn_bg(no_wait=true, () => websocket_echo_server(addr))
*** Update File: <WORKDIR>/src\websocket\bad_client_test.mbt
@@
 
 ///|
 async test "bad client" {
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     let server = @http.Server(@socket.Addr::parse("127.0.0.1:0"))
     let port = server.addr.port()
     let server_result_queue = @async.Queue(kind=Unbounded)
@@
       defer http_client.close()
       let ws_client = @websocket.from_http_client(http_client, "/")
       defer ws_client.close()
-      @async.with_task_group() <| group => {
+      @async.with_task_group_renamed() <| group => {
         group.spawn_bg() <| () => {
           for frame in frames {
             http_client.write(frame)
*** Update File: <WORKDIR>/src\websocket\control_test.mbt
@@
 
 ///|
 async test "ping auto-reply" {
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     let server = @http.Server(@socket.Addr::parse("127.0.0.1:0"))
     let port = server.addr.port()
     group.spawn_bg() <| () => {
@@
 
 ///|
 async test "pong ignored" {
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     let server = @http.Server(@socket.Addr::parse("127.0.0.1:0"))
     let port = server.addr.port()
     group.spawn_bg() <| () => {
@@
 
 ///|
 async test "ping auto-reply race-with-write" {
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     let server = @http.Server(@socket.Addr::parse("127.0.0.1:0"))
     let port = server.addr.port()
     group.spawn_bg() <| () => {
@@
       let request = conn.read_request()
       let ws = @websocket.from_http_server(request, conn)
       defer ws.close()
-      @async.with_task_group() <| group => {
+      @async.with_task_group_renamed() <| group => {
         // currently, auto-reply is only triggered when the user is actually reading.
         group.spawn_bg(no_wait=true, () => ignore(ws.recv().read_all()))
         ws.start_message(Text)
@@
 
 ///|
 async test "close test" {
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     let server = @http.Server(@socket.Addr::parse("127.0.0.1:0"))
     let port = server.addr.port()
     group.spawn_bg() <| () => {
@@
       let request = conn.read_request()
       let ws = @websocket.from_http_server(request, conn)
       defer ws.close()
-      @async.with_task_group() <| group => {
+      @async.with_task_group_renamed() <| group => {
         // currently, auto-reply is only triggered when the user is actually reading.
         group.spawn_bg() <| () => {
           debug_inspect(
@@
 
 ///|
 async test "send ping" {
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     let server = @http.Server(@socket.Addr::parse("127.0.0.1:0"))
     let port = server.addr.port()
     group.spawn_bg() <| () => {
@@
     }
     let ws = @websocket.connect("ws://localhost:\{port}")
     defer ws.close()
-    @async.with_task_group() <| group => {
+    @async.with_task_group_renamed() <| group => {
       group.spawn_bg() <| () => {
         ws.ping()
         ws.send_text("1234")
@@
 
 ///|
 async test "ping inside message" {
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     let server = @http.Server(@socket.Addr::parse("127.0.0.1:0"))
     let port = server.addr.port()
     group.spawn_bg() <| () => {
@@
     }
     let ws = @websocket.connect("ws://localhost:\{port}")
     defer ws.close()
-    @async.with_task_group() <| group => {
+    @async.with_task_group_renamed() <| group => {
       group.spawn_bg() <| () => {
         ws..start_message(Text)..ping()..write("1234").end_message()
       }
@@
 
 ///|
 async test "multiple ping" {
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     let server = @http.Server(@socket.Addr::parse("127.0.0.1:0"))
     let port = server.addr.port()
     group.spawn_bg() <| () => {
@@
     }
     let ws = @websocket.connect("ws://localhost:\{port}")
     defer ws.close()
-    @async.with_task_group() <| group => {
+    @async.with_task_group_renamed() <| group => {
       group.spawn_bg() <| () => {
-        @async.with_task_group() <| inner => {
+        @async.with_task_group_renamed() <| inner => {
           inner.spawn_bg(() => ws.ping())
           inner.spawn_bg(() => ws.ping())
         }
@@
 
 ///|
 async test "ping cancelled" {
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     let server = @http.Server(@socket.Addr::parse("127.0.0.1:0"))
     let port = server.addr.port()
     group.spawn_bg() <| () => {
@@
     }
     let ws = @websocket.connect("ws://localhost:\{port}")
     defer ws.close()
-    @async.with_task_group() <| group => {
+    @async.with_task_group_renamed() <| group => {
       group.spawn_bg() <| () => {
         inspect(ws.recv().read_all().text(), content="abcd")
       }
@@
 
 ///|
 async test "duplicated ping" {
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     let server = @http.Server(@socket.Addr::parse("127.0.0.1:0"))
     let port = server.addr.port()
     group.spawn_bg() <| () => {
@@
     }
     let ws = @websocket.connect("ws://localhost:\{port}")
     defer ws.close()
-    @async.with_task_group() <| group => {
+    @async.with_task_group_renamed() <| group => {
       group.spawn_bg() <| () => {
-        @async.with_task_group() <| inner => {
+        @async.with_task_group_renamed() <| inner => {
           inner.spawn_bg(() => ws.ping(msg=b"1"))
           inner.spawn_bg() <| () => {
             debug_inspect(
*** Update File: <WORKDIR>/src\websocket\external_client_test.mbt
@@
 ///|
 async test "external client" {
   let log = []
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     let server = @http.Server(@socket.Addr::parse("127.0.0.1:0"))
     let port = server.addr.port()
     group.spawn_bg(no_wait=true) <| () => {
*** Update File: <WORKDIR>/src\websocket\utf8_validation_test.mbt
@@
 ///|
 async test "UTF8 validation" {
   let log = []
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     let server = @http.Server(@socket.Addr::parse("127.0.0.1:0"))
     let addr = server.addr
     group.spawn_bg(no_wait=true) <| () => {
@@
 
 ///|
 async test "UTF8 validation large message" {
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     let server = @http.Server(@socket.Addr::parse("127.0.0.1:0"))
     let port = server.addr.port()
     group.spawn_bg(no_wait=true) <| () => {
@@
     }
     let client = @websocket.connect("ws://localhost:\{port}")
     defer client.close()
-    @async.with_task_group() <| group => {
+    @async.with_task_group_renamed() <| group => {
       let chunk_text = String::make(1024, '☺')
       let chunk_bin = @utf8.encode(chunk_text)
       group.spawn_bg() <| () => {
*** Update File: <WORKDIR>/src\websocket\websocket_test.mbt
@@
 
 ///|
 async test "websocket basic" {
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     let server = @http.Server(@socket.Addr::parse("127.0.0.1:0"))
     let addr = server.addr
     group.spawn_bg() <| () => {
@@
 
 ///|
 async test "single frame multiple read" {
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     let server = @http.Server(@socket.Addr::parse("127.0.0.1:0"))
     let addr = server.addr
     group.spawn_bg() <| () => {
@@
 
 ///|
 async test "ignored message" {
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     let server = @http.Server(@socket.Addr::parse("127.0.0.1:0"))
     let addr = server.addr
     group.spawn_bg() <| () => {
@@
 ///|
 async test "write buffering" {
   let log = []
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     let server = @http.Server(@socket.Addr::parse("127.0.0.1:0"))
     let addr = server.addr
     group.spawn_bg() <| () => {
@@
 
 ///|
 async test "large message" {
-  @async.with_task_group() <| group => {
+  @async.with_task_group_renamed() <| group => {
     let server = @http.Server(@socket.Addr::parse("127.0.0.1:0"))
     let addr = server.addr
     let server_checksum = group.spawn(() => {
*** Update File: <WORKDIR>/src\with_timeout_test.mbt
@@
 ///|
 async test "with_timeout normal exit" {
   let log = []
-  @async.with_task_group(root => {
+  @async.with_task_group_renamed(root => {
     root.spawn_bg() <| () => {
       @async.sleep(300)
       log.push("300ms tick")
@@
 ///|
 async test "with_timeout failure" {
   let log = StringBuilder::new()
-  @async.with_task_group(root => {
+  @async.with_task_group_renamed(root => {
     root.spawn_bg() <| () => {
       @async.sleep(200)
       log <+ "200ms tick\n"
@@
 ///|
 async test "with_timeout timeout" {
   let log = StringBuilder::new()
-  @async.with_task_group(root => {
+  @async.with_task_group_renamed(root => {
     root.spawn_bg() <| () => {
       @async.sleep(300)
       log <+ "300ms tick\n"
@@
 ///|
 async test "with_timeout nested1" {
   let log = StringBuilder::new()
-  @async.with_task_group(root => {
+  @async.with_task_group_renamed(root => {
     root.spawn_bg() <| () => {
       @async.sleep(200)
       log <+ "200ms tick\n"
@@
 ///|
 async test "with_timeout nested2" {
   let log = StringBuilder::new()
-  @async.with_task_group(root => {
+  @async.with_task_group_renamed(root => {
     root.spawn_bg() <| () => {
       @async.sleep(300)
       log <+ "300ms tick\n"
@@
 async test "with_timeout error_on_cancel" {
   let log = StringBuilder::new()
   let err = @test_util.expect_error_async <| () => {
-    @async.with_task_group(root => {
+    @async.with_task_group_renamed(root => {
       root.spawn_bg() <| () => {
         @async.sleep(200)
         log <+ "200ms tick\n"
@@
 async test "with_timeout error-on-timeout" {
   let log = StringBuilder::new()
   let err = @test_util.expect_error_async <| () => {
-    @async.with_task_group(root => {
+    @async.with_task_group_renamed(root => {
       root.spawn_bg() <| () => {
         @async.sleep(200)
         log <+ "200ms tick\n"
@@
 ///|
 async test "with_timeout_opt normal exit" {
   let log = []
-  @async.with_task_group(root => {
+  @async.with_task_group_renamed(root => {
     root.spawn_bg() <| () => {
       @async.sleep(200)
       log.push("200ms tick")
@@
 ///|
 async test "with_timeout_opt failure" {
   let log = StringBuilder::new()
-  @async.with_task_group(root => {
+  @async.with_task_group_renamed(root => {
     root.spawn_bg() <| () => {
       @async.sleep(200)
       log <+ "200ms tick\n"
@@
 ///|
 async test "with_timeout_opt timeout" {
   let log = []
-  @async.with_task_group() <| root => {
+  @async.with_task_group_renamed() <| root => {
     root.spawn_bg() <| () => {
       @async.sleep(200)
       log.push("200ms tick")
*** End Patch

```
