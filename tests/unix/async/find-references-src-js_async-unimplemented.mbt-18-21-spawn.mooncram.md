# async find-references spawn src/js_async/unimplemented.mbt:18:21

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
$ run_moon_ide moon ide find-references 'spawn' --loc 'src/js_async/unimplemented.mbt:18:21'
Found 11 references for symbol 'spawn':
<WORKDIR>/src/fs/watch.mbt:357:25-357:30:
    |     task.wait()
    |     return
    |   }
357 |   let task = @coroutine.spawn <| () => {
    |                         ^^^^^
    |     defer {
    |       self.synchronize_task = None

<WORKDIR>/src/fs/watch_inotify.mbt:59:16-59:21:
   |     max_debounce_delay,
   |   }
   |   self.event_processor = Some(
59 |     @coroutine.spawn(() => {
   |                ^^^^^
   |       self.process_events() catch {
   |         err => {

<WORKDIR>/src/internal/coroutine/coroutine.mbt:106:8-106:13:
    | }
    | 
    | ///|
106 | pub fn spawn(f : async () -> Unit) -> Coroutine {
    |        ^^^^^
    |   scheduler.coro_id += 1
    |   let coro = {

<WORKDIR>/src/internal/coroutine/pause_test.mbt:18:25-18:30:
   | ///|
   | test "coroutine ping-pong" {
   |   let log = StringBuilder::new()
18 |   let coro = @coroutine.spawn(() => {
   |                         ^^^^^
   |     @async.with_task_group(group => {
   |       group.spawn_bg() <| () => {

<WORKDIR>/src/internal/event_loop/event_loop.mbt:132:25-132:30:
    |     }
    |   }
    |   let signal_handler = setup_signal_handler()
132 |   let main = @coroutine.spawn(() => {
    |                         ^^^^^
    |     try f() catch {
    |       err => {

<WORKDIR>/src/internal/event_loop/network.mbt:43:16-43:21:
   |   // let a background task wait for its completion and perform cleanup, 
   |   // while not waiting for the result in the main task
   |   try
43 |     @coroutine.spawn(() => {
   |                ^^^^^
   |       defer job.free()
   |       let ret = perform_job_in_worker(job, context~) catch {

<WORKDIR>/src/internal/event_loop/signal.mbt:81:14-81:19:
   |   if !global_signal_handler_initialized.val {
   |     set_global_cancellation_signals(all_signals)
   |   }
81 |   @coroutine.spawn() <| () => {
   |              ^^^^^
   |     let context = "sigwait thread"
   |     fn cancel(job_id) raise {

<WORKDIR>/src/io/memory_reader.mbt:38:27-38:32:
   | /// the callback will be cancelled automatically.
   | pub fn MemoryReader::MemoryReader(f : async (&Writer) -> Unit) -> MemoryReader {
   |   let (r, w) = pipe()
38 |   let writer = @coroutine.spawn() <| () => {
   |                           ^^^^^
   |     defer w.close()
   |     f(w)

<WORKDIR>/src/js_async/unimplemented.mbt:18:21-18:26:
   | ///|
   | #coverage.skip
   | let _ignore_unused_import : Unit = {
18 |   ignore(@coroutine.spawn)
   |                     ^^^^^
   |   ignore(@event_loop.Timer::new)
   | }

<WORKDIR>/src/lazy_init.mbt:49:29-49:34:
   |     Fail(err) => raise err
   |     Running(_) => () (escaped)
   |     Uninitialized => {
49 |       let coro = @coroutine.spawn(() => {
   |                             ^^^^^
   |         try (self.worker)() catch {
   |           err =>

<WORKDIR>/src/task_group.mbt:91:25-91:30:
   |     }
   |   }
   | 
91 |   let coro = @coroutine.spawn(worker)
   |                         ^^^^^
   |   self.children.add(coro)
   |   if !(self.state is Running) {

```
