# async rename Coroutine src/js_async/unimplemented.mbt:18:21

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
$ run_moon_ide moon ide rename 'Coroutine' 'CoroutineRenamed' --loc 'src/js_async/unimplemented.mbt:18:21'
*** Begin Patch
*** Update File: <WORKDIR>/src/aqueue/aqueue.mbt
@@
   /// `value` must be `Some(_)` when the reader is woken
   mut value : X?
   /// `None` indicates that the reader is cancelled
-  mut coro : @coroutine.Coroutine?
+  mut coro : @coroutine.CoroutineRenamed?
 }
 
 ///|
 priv struct Writer[X] {
   value : X
-  mut coro : @coroutine.Coroutine?
+  mut coro : @coroutine.CoroutineRenamed?
 }
 
 ///|
*** Update File: <WORKDIR>/src/cond_var/cond_var.mbt
@@
   // So we set `woken = true` after waking up a waiter,
   // and use this flag to protect against dangerous cancellation.
   mut woken : Bool
-  mut coro : @coroutine.Coroutine?
+  mut coro : @coroutine.CoroutineRenamed?
 }
 
 ///|
*** Update File: <WORKDIR>/src/fs/watch.mbt
@@
   pending_remove : Set[FileIdentity]
   ignored_paths : (String) -> Bool
   report_child_event : Bool
-  mut synchronize_task : @coroutine.Coroutine?
+  mut synchronize_task : @coroutine.CoroutineRenamed?
 }
 
 ///|
*** Update File: <WORKDIR>/src/fs/watch_inotify.mbt
@@
   inotify : @event_loop.IoHandle
   watched : Map[@fd_util.Fd, FileIdentity]
   watcher : Watcher
-  mut event_processor : @coroutine.Coroutine?
+  mut event_processor : @coroutine.CoroutineRenamed?
   mut err : Error?
-  mut waiter : @coroutine.Coroutine?
+  mut waiter : @coroutine.CoroutineRenamed?
   debounce_timer : @async.Timer
   max_debounce_delay : Int
 }
*** Update File: <WORKDIR>/src/internal/coroutine/coroutine.mbt
@@
 }
 
 ///|
-pub struct Coroutine {
+pub struct CoroutineRenamed {
   priv coro_id : Int
   priv mut state : State
   priv mut shielded : Bool
   priv mut cancelled : Bool
   priv mut ready : Bool
-  priv downstream : Set[Coroutine]
+  priv downstream : Set[CoroutineRenamed]
   loc : SourceLoc
 }
 
 ///|
-pub impl Eq for Coroutine with fn equal(c1, c2) {
+pub impl Eq for CoroutineRenamed with fn equal(c1, c2) {
   c1.coro_id == c2.coro_id
 }
 
 ///|
-pub impl Hash for Coroutine with fn hash_combine(self, hasher) {
+pub impl Hash for CoroutineRenamed with fn hash_combine(self, hasher) {
   self.coro_id.hash_combine(hasher)
 }
 
 ///|
-pub fn Coroutine::wake(self : Coroutine) -> Unit {
+pub fn CoroutineRenamed::wake(self : CoroutineRenamed) -> Unit {
   if !self.ready {
     self.ready = true
     scheduler.run_later.push_back(self)
@@
 pub(all) suberror Cancelled derive(Debug)
 
 ///|
-pub fn Coroutine::cancel(self : Coroutine) -> Unit {
+pub fn CoroutineRenamed::cancel(self : CoroutineRenamed) -> Unit {
   self.cancelled = true
   if !self.shielded {
     self.wake()
@@
 
 ///|
 #callsite(autofill(loc))
-pub fn spawn(f : async () -> Unit, loc~ : SourceLoc) -> Coroutine {
+pub fn spawn(f : async () -> Unit, loc~ : SourceLoc) -> CoroutineRenamed {
   scheduler.coro_id += 1
   let coro = {
     state: Running,
@@
 }
 
 ///|
-pub fn Coroutine::unwrap(self : Coroutine) -> Unit raise {
+pub fn CoroutineRenamed::unwrap(self : CoroutineRenamed) -> Unit raise {
   match self.state {
     Done => () (escaped)
     Fail(err) => raise err
@@
 }
 
 ///|
-pub async fn Coroutine::wait(target : Coroutine) -> Unit {
+pub async fn CoroutineRenamed::wait(target : CoroutineRenamed) -> Unit {
   guard scheduler.curr_coro is Some(coro)
   guard !physical_equal(coro, target)
   match target.state {
@@
 }
 
 ///|
-pub fn Coroutine::check_error(coro : Coroutine) -> Unit raise {
+pub fn CoroutineRenamed::check_error(coro : CoroutineRenamed) -> Unit raise {
   match coro.state {
     Fail(err) => raise err
     Done | Running | Suspend(_) => () (escaped)
*** Update File: <WORKDIR>/src/internal/coroutine/scheduler.mbt
@@
 ///|
 priv struct Scheduler {
   mut coro_id : Int
-  mut curr_coro : Coroutine?
+  mut curr_coro : CoroutineRenamed?
-  run_later : @deque.Deque[Coroutine]
+  run_later : @deque.Deque[CoroutineRenamed]
-  all_coros : Set[Coroutine]
+  all_coros : Set[CoroutineRenamed]
 }
 
 ///|
@@
 }
 
 ///|
-pub fn current_coroutine() -> Coroutine {
+pub fn current_coroutine() -> CoroutineRenamed {
   scheduler.curr_coro.unwrap()
 }
 
@@
 }
 
 ///|
-pub fn all_coroutines() -> Set[Coroutine] {
+pub fn all_coroutines() -> Set[CoroutineRenamed] {
   scheduler.all_coros
 }
*** Update File: <WORKDIR>/src/internal/event_loop/event_loop.mbt
@@
   job_queue : @deque.Deque[QueuedJob]
   idle_workers : @deque.Deque[Worker]
   running_workers : Map[Int, Worker]
-  jobs : Map[Int, @coroutine.Coroutine]
+  jobs : Map[Int, @coroutine.CoroutineRenamed]
   timers : @sorted_set.SortedSet[Timer]
-  mut main : @coroutine.Coroutine?
+  mut main : @coroutine.CoroutineRenamed?
   mut signal_handler : SignalHandler?
   mut killed_by_signal : Int?
   mut blocked_tasks : Int
*** Update File: <WORKDIR>/src/internal/event_loop/event_loop_unix.mbt
@@
 priv struct UnixEventLoopExtra {
   // On MacOS, PID waiting is implemented directly via kqueue, 
   // so we need to separately maintain waiters for each PID.
-  pids : Map[Int, @coroutine.Coroutine]
+  pids : Map[Int, @coroutine.CoroutineRenamed]
   // On Linux/MacOS, notifications for completion of thread pool job
   // are transferred via a pipe, this buffer is used to read from the pipe.
   completed_jobs_buffer : FixedArray[Int]
*** Update File: <WORKDIR>/src/internal/event_loop/io.mbt
@@
   // a pending read/write operation is already submitted to thread pool
   Submitted
   // waiting for read/write readiness or completion from the event bus
-  Waiting(@coroutine.Coroutine)
+  Waiting(@coroutine.CoroutineRenamed)
 }
 
 ///|
*** Update File: <WORKDIR>/src/internal/event_loop/signal.mbt
@@
 ///|
 #warnings("-unused_constructor")
 priv enum SignalHandler {
-  SigwaitHandler(@coroutine.Coroutine)
+  SigwaitHandler(@coroutine.CoroutineRenamed)
   ConsoleControlHandler
 }
 
 ///|
 #cfg(not(platform="windows"))
-fn setup_signal_handler_unix() -> @coroutine.Coroutine {
+fn setup_signal_handler_unix() -> @coroutine.CoroutineRenamed {
   guard curr_loop.val is Some(evloop)
   if !global_signal_handler_initialized.val {
     set_global_cancellation_signals(all_signals)
@@
 #cfg(not(platform="windows"))
 async fn EventLoop::terminate_signal_handler_unix(
   evloop : EventLoop,
-  sigwait_task : @coroutine.Coroutine,
+  sigwait_task : @coroutine.CoroutineRenamed,
 ) -> Unit {
   sigwait_task.cancel()
   // Undo the `-= 1` in `setup_sigwait_signal_handler`.
*** Update File: <WORKDIR>/src/io/memory_reader.mbt
@@
 /// This is useful for passing in-memory to reader-receiving API.
 struct MemoryReader {
   reader : PipeRead
-  writer : @coroutine.Coroutine
+  writer : @coroutine.CoroutineRenamed
 }
 
 ///|
*** Update File: <WORKDIR>/src/io/pipe.mbt
@@
   NoReader
   ReadEndClosed
   HasReader(
-    coro~ : @coroutine.Coroutine,
+    coro~ : @coroutine.CoroutineRenamed,
     buf~ : FixedArray[Byte],
     offset~ : Int,
     max_len~ : Int,
@@
   NoWriter
   WriteEndClosed
   HasWriter(
-    coro~ : @coroutine.Coroutine,
+    coro~ : @coroutine.CoroutineRenamed,
     buf~ : Bytes,
     offset~ : Int,
     len~ : Int,
*** Update File: <WORKDIR>/src/js_async/unimplemented.mbt
@@
 ///|
 #coverage.skip
 let _ignore_unused_import : Unit = {
-  ignore(@coroutine.Coroutine::wake)
+  ignore(@coroutine.CoroutineRenamed::wake)
   ignore(@event_loop.Timer::new)
 }
 
*** Update File: <WORKDIR>/src/lazy_init.mbt
@@
 ///|
 priv enum LazyValueState[X] {
   Uninitialized
-  Running(@coroutine.Coroutine)
+  Running(@coroutine.CoroutineRenamed)
   Done(X)
   Fail(Error)
 }
@@
 /// the initialization process will be cancelled automatically.
 struct Lazy[X] {
   worker : async () -> X
-  waiters : Set[@coroutine.Coroutine]
+  waiters : Set[@coroutine.CoroutineRenamed]
   mut state : LazyValueState[X]
   loc : SourceLoc
 }
*** Update File: <WORKDIR>/src/semaphore/semaphore.mbt
@@
   // and use this flag to protect against dangerous cancellation.
   mut acquired : Bool
   // `None` indicates that the waiter is cancelled
-  mut coro : @coroutine.Coroutine?
+  mut coro : @coroutine.CoroutineRenamed?
 }
 
 ///|
*** Update File: <WORKDIR>/src/task.mbt
@@
 /// it can be used to wait and retrieve the result value of the task.
 struct Task[X] {
   value : Ref[X?]
-  coro : @coroutine.Coroutine
+  coro : @coroutine.CoroutineRenamed
 }
 
 ///|
*** Update File: <WORKDIR>/src/task_group.mbt
@@
 /// The type parameter `X` in `TaskGroup[X]` is the result type of the group,
 /// see `with_task_group` for more detail.
 struct TaskGroup[X] {
-  children : Set[@coroutine.Coroutine]
+  children : Set[@coroutine.CoroutineRenamed]
-  parent : @coroutine.Coroutine
+  parent : @coroutine.CoroutineRenamed
   mut waiting : Int
   mut state : TaskGroupState
   mut result : X?
@@
   no_wait~ : Bool,
   allow_failure~ : Bool,
   loc~ : SourceLoc,
-) -> @coroutine.Coroutine {
+) -> @coroutine.CoroutineRenamed {
   guard self.state is Running || !self.children.is_empty() else {
     abort("trying to spawn from a terminated task group")
   }
*** Update File: <WORKDIR>/src/timer.mbt
@@
   priv mut state : TimerState
   priv mut expire_time : Int64
   // invariant: `waiters` is non-empty iff `state` is `Running`
-  priv waiters : Set[@coroutine.Coroutine]
+  priv waiters : Set[@coroutine.CoroutineRenamed]
 }
 
 ///|
*** Update File: <WORKDIR>/src/websocket/conn.mbt
@@
   // PING should be replied with a PONG with exactly the same payload,
   // so here we use the payload of PING frames to identify
   // different PING requests.
-  pings : Map[Bytes, @coroutine.Coroutine]
+  pings : Map[Bytes, @coroutine.CoroutineRenamed]
 }
 
 ///|
*** End Patch

```
