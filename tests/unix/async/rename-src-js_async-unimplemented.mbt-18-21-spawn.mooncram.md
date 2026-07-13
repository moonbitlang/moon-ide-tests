# async rename spawn src/js_async/unimplemented.mbt:18:21

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
$ run_moon_ide moon ide rename 'spawn' 'spawn_renamed' --loc 'src/js_async/unimplemented.mbt:18:21'
*** Begin Patch
*** Update File: <WORKDIR>/src/fs/watch.mbt
@@
     task.wait()
     return
   }
-  let task = @coroutine.spawn <| () => {
+  let task = @coroutine.spawn_renamed <| () => {
     defer {
       self.synchronize_task = None
     }
*** Update File: <WORKDIR>/src/fs/watch_inotify.mbt
@@
     max_debounce_delay,
   }
   self.event_processor = Some(
-    @coroutine.spawn(() => {
+    @coroutine.spawn_renamed(() => {
       self.process_events() catch {
         err => {
           self.err = Some(err)
*** Update File: <WORKDIR>/src/internal/coroutine/coroutine.mbt
@@
 }
 
 ///|
-pub fn spawn(f : async () -> Unit) -> Coroutine {
+pub fn spawn_renamed(f : async () -> Unit) -> Coroutine {
   scheduler.coro_id += 1
   let coro = {
     state: Running,
*** Update File: <WORKDIR>/src/internal/coroutine/pause_test.mbt
@@
 ///|
 test "coroutine ping-pong" {
   let log = StringBuilder::new()
-  let coro = @coroutine.spawn(() => {
+  let coro = @coroutine.spawn_renamed(() => {
     @async.with_task_group(group => {
       group.spawn_bg() <| () => {
         log <+ "ping\n"
*** Update File: <WORKDIR>/src/internal/event_loop/event_loop.mbt
@@
     }
   }
   let signal_handler = setup_signal_handler()
-  let main = @coroutine.spawn(() => {
+  let main = @coroutine.spawn_renamed(() => {
     try f() catch {
       err => {
         evloop.terminate_signal_handler(signal_handler)
*** Update File: <WORKDIR>/src/internal/event_loop/network.mbt
@@
   // let a background task wait for its completion and perform cleanup, 
   // while not waiting for the result in the main task
   try
-    @coroutine.spawn(() => {
+    @coroutine.spawn_renamed(() => {
       defer job.free()
       let ret = perform_job_in_worker(job, context~) catch {
         @os_error.OSError(errno, context~) =>
*** Update File: <WORKDIR>/src/internal/event_loop/signal.mbt
@@
   if !global_signal_handler_initialized.val {
     set_global_cancellation_signals(all_signals)
   }
-  @coroutine.spawn() <| () => {
+  @coroutine.spawn_renamed() <| () => {
     let context = "sigwait thread"
     fn cancel(job_id) raise {
       guard curr_loop.val is Some(evloop)
*** Update File: <WORKDIR>/src/io/memory_reader.mbt
@@
 /// the callback will be cancelled automatically.
 pub fn MemoryReader::MemoryReader(f : async (&Writer) -> Unit) -> MemoryReader {
   let (r, w) = pipe()
-  let writer = @coroutine.spawn() <| () => {
+  let writer = @coroutine.spawn_renamed() <| () => {
     defer w.close()
     f(w)
   }
*** Update File: <WORKDIR>/src/js_async/unimplemented.mbt
@@
 ///|
 #coverage.skip
 let _ignore_unused_import : Unit = {
-  ignore(@coroutine.spawn)
+  ignore(@coroutine.spawn_renamed)
   ignore(@event_loop.Timer::new)
 }
 
*** Update File: <WORKDIR>/src/lazy_init.mbt
@@
     Fail(err) => raise err
     Running(_) => () (escaped)
     Uninitialized => {
-      let coro = @coroutine.spawn(() => {
+      let coro = @coroutine.spawn_renamed(() => {
         try (self.worker)() catch {
           err =>
             if err is @coroutine.Cancelled && is_being_cancelled() {
*** Update File: <WORKDIR>/src/task_group.mbt
@@
     }
   }
 
-  let coro = @coroutine.spawn(worker)
+  let coro = @coroutine.spawn_renamed(worker)
   self.children.add(coro)
   if !(self.state is Running) {
     coro.cancel()
*** End Patch

```
