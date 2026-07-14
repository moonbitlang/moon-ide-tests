# async find-references spawn src\js_async\unimplemented.mbt:18:21

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\async' moon ide find-references 'spawn' --loc 'src\js_async\unimplemented.mbt:18:21'
Found 10 references for symbol 'spawn':
<WORKDIR>/src\fs\watch.mbt:357:25-357:30:
    |     task.wait()
    |     return
    |   }
357 |   let task = @coroutine.spawn <| () => {
    |                         ^^^^^
    |     defer {
    |       self.synchronize_task = None

<WORKDIR>/src\fs\watch_windows.mbt:48:16-48:21:
   |     max_debounce_delay,
   |   }
   |   self.event_processor = Some(
48 |     @coroutine.spawn(() => {
   |                ^^^^^
   |       self.event_handler() catch {
   |         err => {

<WORKDIR>/src\internal\coroutine\coroutine.mbt:106:8-106:13:
    | }
    | 
    | ///|
106 | pub fn spawn(f : async () -> Unit) -> Coroutine {
    |        ^^^^^
    |   scheduler.coro_id += 1
    |   let coro = {

<WORKDIR>/src\internal\coroutine\pause_test.mbt:18:25-18:30:
   | ///|
   | test "coroutine ping-pong" {
   |   let log = StringBuilder::new()
18 |   let coro = @coroutine.spawn(() => {
   |                         ^^^^^
   |     @async.with_task_group(group => {
   |       group.spawn_bg() <| () => {

<WORKDIR>/src\internal\event_loop\event_loop.mbt:132:25-132:30:
    |     }
    |   }
    |   let signal_handler = setup_signal_handler()
132 |   let main = @coroutine.spawn(() => {
    |                         ^^^^^
    |     try f() catch {
    |       err => {

<WORKDIR>/src\internal\event_loop\network.mbt:43:16-43:21:
   |   // let a background task wait for its completion and perform cleanup, 
   |   // while not waiting for the result in the main task
   |   try
43 |     @coroutine.spawn(() => {
   |                ^^^^^
   |       defer job.free()
   |       let ret = perform_job_in_worker(job, context~) catch {

<WORKDIR>/src\io\memory_reader.mbt:38:27-38:32:
   | /// the callback will be cancelled automatically.
   | pub fn MemoryReader::MemoryReader(f : async (&Writer) -> Unit) -> MemoryReader {
   |   let (r, w) = pipe()
38 |   let writer = @coroutine.spawn() <| () => {
   |                           ^^^^^
   |     defer w.close()
   |     f(w)

<WORKDIR>/src\js_async\unimplemented.mbt:18:21-18:26:
   | ///|
   | #coverage.skip
   | let _ignore_unused_import : Unit = {
18 |   ignore(@coroutine.spawn)
   |                     ^^^^^
   |   ignore(@event_loop.Timer::new)
   | }

<WORKDIR>/src\lazy_init.mbt:49:29-49:34:
   |     Fail(err) => raise err
   |     Running(_) => () (escaped)
   |     Uninitialized => {
49 |       let coro = @coroutine.spawn(() => {
   |                             ^^^^^
   |         try (self.worker)() catch {
   |           err =>

<WORKDIR>/src\task_group.mbt:91:25-91:30:
   |     }
   |   }
   | 
91 |   let coro = @coroutine.spawn(worker)
   |                         ^^^^^
   |   self.children.add(coro)
   |   if !(self.state is Running) {

```
