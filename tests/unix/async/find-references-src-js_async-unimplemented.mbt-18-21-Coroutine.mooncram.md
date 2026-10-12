# async find-references Coroutine src/js_async/unimplemented.mbt:18:21

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
$ run_moon_ide moon ide find-references 'Coroutine' --loc 'src/js_async/unimplemented.mbt:18:21'
Found 44 references for symbol 'Coroutine':
<WORKDIR>/src/aqueue/aqueue.mbt:29:21-29:30:
   |   /// - `Some(_)` otherwise
   |   mut value : X?
   |   /// `None` indicates that the reader is cancelled
29 |   coro : @coroutine.Coroutine
   |                     ^^^^^^^^^
   |   /// For intrusive cancellable queue
   |   mut index : Int

<WORKDIR>/src/cond_var/cond_var.mbt:17:21-17:30:
   | 
   | ///|
   | priv struct Waiter {
17 |   coro : @coroutine.Coroutine
   |                     ^^^^^^^^^
   |   /// For intrusive cancellable queue
   |   mut index : Int

<WORKDIR>/src/fs/watch.mbt:150:37-150:46:
    |   pending_remove : Set[FileIdentity]
    |   ignored_paths : (String) -> Bool
    |   report_child_event : Bool
150 |   mut synchronize_task : @coroutine.Coroutine?
    |                                     ^^^^^^^^^
    | }
    | 

<WORKDIR>/src/fs/watch_inotify.mbt:21:36-21:45:
   |   inotify : @event_loop.IoHandle
   |   watched : Map[@fd_util.Fd, FileIdentity]
   |   watcher : Watcher
21 |   mut event_processor : @coroutine.Coroutine?
   |                                    ^^^^^^^^^
   |   mut err : Error?
   |   mut waiter : @coroutine.Coroutine?

<WORKDIR>/src/fs/watch_inotify.mbt:23:27-23:36:
   |   watcher : Watcher
   |   mut event_processor : @coroutine.Coroutine?
   |   mut err : Error?
23 |   mut waiter : @coroutine.Coroutine?
   |                           ^^^^^^^^^
   |   debounce_timer : @async.Timer
   |   max_debounce_delay : Int

<WORKDIR>/src/internal/coroutine/coroutine.mbt:37:25-37:34:
   |   priv mut shielded : Bool
   |   priv mut cancelled : Bool
   |   priv mut ready : Bool
37 |   priv downstream : Set[Coroutine]
   |                         ^^^^^^^^^
   |   loc : SourceLoc
   | }

<WORKDIR>/src/internal/coroutine/coroutine.mbt:42:17-42:26:
   | }
   | 
   | ///|
42 | pub impl Eq for Coroutine with fn equal(c1, c2) {
   |                 ^^^^^^^^^
   |   c1.coro_id == c2.coro_id
   | }

<WORKDIR>/src/internal/coroutine/coroutine.mbt:47:19-47:28:
   | }
   | 
   | ///|
47 | pub impl Hash for Coroutine with fn hash_combine(self, hasher) {
   |                   ^^^^^^^^^
   |   Hash::hash_combine(self.coro_id, hasher)
   | }

<WORKDIR>/src/internal/coroutine/coroutine.mbt:52:8-52:17:
   | }
   | 
   | ///|
52 | pub fn Coroutine::wake(self : Coroutine) -> Unit {
   |        ^^^^^^^^^
   |   // Only a suspended coroutine can be resumed: a running one observes
   |   // `cancelled` at its next suspension point, and a finished one never runs

<WORKDIR>/src/internal/coroutine/coroutine.mbt:52:31-52:40:
   | }
   | 
   | ///|
52 | pub fn Coroutine::wake(self : Coroutine) -> Unit {
   |                               ^^^^^^^^^
   |   // Only a suspended coroutine can be resumed: a running one observes
   |   // `cancelled` at its next suspension point, and a finished one never runs

<WORKDIR>/src/internal/coroutine/coroutine.mbt:76:8-76:17:
   | }
   | 
   | ///|
76 | pub fn Coroutine::cancel(self : Coroutine) -> Unit {
   |        ^^^^^^^^^
   |   self.cancelled = true
   |   if !self.shielded {

<WORKDIR>/src/internal/coroutine/coroutine.mbt:76:33-76:42:
   | }
   | 
   | ///|
76 | pub fn Coroutine::cancel(self : Coroutine) -> Unit {
   |                                 ^^^^^^^^^
   |   self.cancelled = true
   |   if !self.shielded {

<WORKDIR>/src/internal/coroutine/coroutine.mbt:141:57-141:66:
    | 
    | ///|
    | #callsite(autofill(loc))
141 | pub fn spawn(f : async () -> Unit, loc~ : SourceLoc) -> Coroutine {
    |                                                         ^^^^^^^^^
    |   scheduler.coro_id += 1
    |   let coro = {

<WORKDIR>/src/internal/coroutine/coroutine.mbt:179:8-179:17:
    | }
    | 
    | ///|
179 | pub fn Coroutine::unwrap(self : Coroutine) -> SuspendResult raise {
    |        ^^^^^^^^^
    |   match self.state {
    |     Done => Continue

<WORKDIR>/src/internal/coroutine/coroutine.mbt:179:33-179:42:
    | }
    | 
    | ///|
179 | pub fn Coroutine::unwrap(self : Coroutine) -> SuspendResult raise {
    |                                 ^^^^^^^^^
    |   match self.state {
    |     Done => Continue

<WORKDIR>/src/internal/coroutine/coroutine.mbt:189:14-189:23:
    | }
    | 
    | ///|
189 | pub async fn Coroutine::wait(target : Coroutine) -> SuspendResult {
    |              ^^^^^^^^^
    |   guard! scheduler.curr_coro is Some(coro)
    |   guard! !physical_equal(coro, target)

<WORKDIR>/src/internal/coroutine/coroutine.mbt:189:39-189:48:
    | }
    | 
    | ///|
189 | pub async fn Coroutine::wait(target : Coroutine) -> SuspendResult {
    |                                       ^^^^^^^^^
    |   guard! scheduler.curr_coro is Some(coro)
    |   guard! !physical_equal(coro, target)

<WORKDIR>/src/internal/coroutine/coroutine.mbt:205:8-205:17:
    | }
    | 
    | ///|
205 | pub fn Coroutine::check_error(coro : Coroutine) -> Unit raise {
    |        ^^^^^^^^^
    |   match coro.state {
    |     Fail(err) => raise err

<WORKDIR>/src/internal/coroutine/coroutine.mbt:205:38-205:47:
    | }
    | 
    | ///|
205 | pub fn Coroutine::check_error(coro : Coroutine) -> Unit raise {
    |                                      ^^^^^^^^^
    |   match coro.state {
    |     Fail(err) => raise err

<WORKDIR>/src/internal/coroutine/deprecated.mbt:18:12-18:21:
   | ///|
   | #deprecated
   | #doc(hidden)
18 | pub extend Coroutine with Eq::{not_equal, equal}
   |            ^^^^^^^^^
   | 
   | ///|

<WORKDIR>/src/internal/coroutine/deprecated.mbt:23:12-23:21:
   | ///|
   | #deprecated
   | #doc(hidden)
23 | pub extend Coroutine with Hash::{hash, hash_combine}
   |            ^^^^^^^^^

<WORKDIR>/src/internal/coroutine/scheduler.mbt:18:19-18:28:
   | ///|
   | priv struct Scheduler {
   |   mut coro_id : Int
18 |   mut curr_coro : Coroutine?
   |                   ^^^^^^^^^
   |   run_later : @deque.Deque[Coroutine]
   |   all_coros : Set[Coroutine]

<WORKDIR>/src/internal/coroutine/scheduler.mbt:19:28-19:37:
   | priv struct Scheduler {
   |   mut coro_id : Int
   |   mut curr_coro : Coroutine?
19 |   run_later : @deque.Deque[Coroutine]
   |                            ^^^^^^^^^
   |   all_coros : Set[Coroutine]
   | }

<WORKDIR>/src/internal/coroutine/scheduler.mbt:20:19-20:28:
   |   mut coro_id : Int
   |   mut curr_coro : Coroutine?
   |   run_later : @deque.Deque[Coroutine]
20 |   all_coros : Set[Coroutine]
   |                   ^^^^^^^^^
   | }
   | 

<WORKDIR>/src/internal/coroutine/scheduler.mbt:32:31-32:40:
   | }
   | 
   | ///|
32 | pub fn current_coroutine() -> Coroutine {
   |                               ^^^^^^^^^
   |   scheduler.curr_coro.unwrap()
   | }

<WORKDIR>/src/internal/coroutine/scheduler.mbt:66:32-66:41:
   | }
   | 
   | ///|
66 | pub fn all_coroutines() -> Set[Coroutine] {
   |                                ^^^^^^^^^
   |   scheduler.all_coros
   | }

<WORKDIR>/src/internal/event_loop/event_loop.mbt:30:30-30:39:
   |   job_queue : Set[QueuedJob]
   |   idle_workers : @deque.Deque[Worker]
   |   running_workers : Map[Int, Worker]
30 |   jobs : Map[Int, @coroutine.Coroutine]
   |                              ^^^^^^^^^
   |   timers : @sorted_set.SortedSet[Timer]
   |   mut main : @coroutine.Coroutine?

<WORKDIR>/src/internal/event_loop/event_loop.mbt:32:25-32:34:
   |   running_workers : Map[Int, Worker]
   |   jobs : Map[Int, @coroutine.Coroutine]
   |   timers : @sorted_set.SortedSet[Timer]
32 |   mut main : @coroutine.Coroutine?
   |                         ^^^^^^^^^
   |   mut killed_by_signal : Int?
   |   mut blocked_tasks : Int

<WORKDIR>/src/internal/event_loop/event_loop.mbt:41:23-41:32:
   | priv struct QueuedJob {
   |   job_id : Int
   |   job : Job
41 |   waiter : @coroutine.Coroutine
   |                       ^^^^^^^^^
   | }
   | 

<WORKDIR>/src/internal/event_loop/event_loop_unix.mbt:20:30-20:39:
   | priv struct UnixEventLoopExtra {
   |   // On MacOS, PID waiting is implemented directly via kqueue, 
   |   // so we need to separately maintain waiters for each PID.
20 |   pids : Map[Int, @coroutine.Coroutine]
   |                              ^^^^^^^^^
   |   // On Linux/MacOS, notifications for completion of thread pool job
   |   // are transferred via a pipe, this buffer is used to read from the pipe.

<WORKDIR>/src/internal/event_loop/io.mbt:21:22-21:31:
   |   // a pending read/write operation is already submitted to thread pool
   |   Submitted
   |   // waiting for read/write readiness or completion from the event bus
21 |   Waiting(@coroutine.Coroutine)
   |                      ^^^^^^^^^
   | }
   | 

<WORKDIR>/src/io/memory_reader.mbt:20:23-20:32:
   | /// This is useful for passing in-memory to reader-receiving API.
   | struct MemoryReader {
   |   reader : PipeRead
20 |   writer : @coroutine.Coroutine
   |                       ^^^^^^^^^
   | }
   | 

<WORKDIR>/src/io/pipe.mbt:20:24-20:33:
   |   NoReader
   |   ReadEndClosed
   |   HasReader(
20 |     coro~ : @coroutine.Coroutine,
   |                        ^^^^^^^^^
   |     buf~ : FixedArray[Byte],
   |     offset~ : Int,

<WORKDIR>/src/io/pipe.mbt:33:24-33:33:
   |   NoWriter
   |   WriteEndClosed
   |   HasWriter(
33 |     coro~ : @coroutine.Coroutine,
   |                        ^^^^^^^^^
   |     buf~ : Bytes,
   |     offset~ : Int,

<WORKDIR>/src/js_async/unimplemented.mbt:18:21-18:30:
   | ///|
   | #coverage.skip
   | let _ignore_unused_import : Unit = {
18 |   ignore(@coroutine.Coroutine::wake)
   |                     ^^^^^^^^^
   |   ignore(@event_loop.Timer::new)
   | }

<WORKDIR>/src/lazy_init.mbt:18:22-18:31:
   | ///|
   | priv enum LazyValueState[X] {
   |   Uninitialized
18 |   Running(@coroutine.Coroutine)
   |                      ^^^^^^^^^
   |   Done(X)
   |   Fail(Error)

<WORKDIR>/src/lazy_init.mbt:31:28-31:37:
   | /// the initialization process will be cancelled automatically.
   | struct Lazy[X] {
   |   worker : async () -> X
31 |   waiters : Set[@coroutine.Coroutine]
   |                            ^^^^^^^^^
   |   mut state : LazyValueState[X]
   |   loc : SourceLoc

<WORKDIR>/src/semaphore/semaphore.mbt:18:21-18:30:
   | ///|
   | priv struct Waiter {
   |   // `None` indicates that the waiter is cancelled
18 |   coro : @coroutine.Coroutine
   |                     ^^^^^^^^^
   |   mut index : Int
   |   mut prev : Int

<WORKDIR>/src/task.mbt:20:21-20:30:
   | /// it can be used to wait and retrieve the result value of the task.
   | struct Task[X] {
   |   value : Ref[X?]
20 |   coro : @coroutine.Coroutine
   |                     ^^^^^^^^^
   | }
   | 

<WORKDIR>/src/task_group.mbt:39:29-39:38:
   | /// The type parameter `X` in `TaskGroup[X]` is the result type of the group,
   | /// see `with_task_group` for more detail.
   | struct TaskGroup[X] {
39 |   children : Set[@coroutine.Coroutine]
   |                             ^^^^^^^^^
   |   parent : @coroutine.Coroutine
   |   mut waiting : Int

<WORKDIR>/src/task_group.mbt:40:23-40:32:
   | /// see `with_task_group` for more detail.
   | struct TaskGroup[X] {
   |   children : Set[@coroutine.Coroutine]
40 |   parent : @coroutine.Coroutine
   |                       ^^^^^^^^^
   |   mut waiting : Int
   |   mut state : TaskGroupState

<WORKDIR>/src/task_group.mbt:54:17-54:26:
   |   no_wait~ : Bool,
   |   allow_failure~ : Bool,
   |   loc~ : SourceLoc,
54 | ) -> @coroutine.Coroutine {
   |                 ^^^^^^^^^
   |   guard self.state is Running || !self.children.is_empty() else {
   |     abort("trying to spawn from a terminated task group")

<WORKDIR>/src/timer.mbt:48:33-48:42:
   |   priv mut state : TimerState
   |   priv mut expire_time : Int64
   |   // invariant: `waiters` is non-empty iff `state` is `Running`
48 |   priv waiters : Set[@coroutine.Coroutine]
   |                                 ^^^^^^^^^
   | }
   | 

<WORKDIR>/src/websocket/conn.mbt:135:33-135:42:
    |   // PING should be replied with a PONG with exactly the same payload,
    |   // so here we use the payload of PING frames to identify
    |   // different PING requests.
135 |   pings : Map[Bytes, @coroutine.Coroutine]
    |                                 ^^^^^^^^^
    | }
    | 

```
