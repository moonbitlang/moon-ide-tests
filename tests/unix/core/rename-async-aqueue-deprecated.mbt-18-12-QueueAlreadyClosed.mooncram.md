# core rename QueueAlreadyClosed async/aqueue/deprecated.mbt:18:12

```mooncram
$ export MOON_HOME="${MOON_HOME:-$HOME/.moon}"
```

```mooncram
$ export TEST_REPO_ROOT="$(cd "$TESTDIR/../../../fixtures/repos/core" && pwd)"
```

```mooncram
$ normalize_moon_ide_output() { sed -e "s|$TEST_REPO_ROOT|<WORKDIR>|g" -e "s|$MOON_HOME|<MOON_HOME>|g"; }
```

```mooncram
$ run_moon_ide() { status_file="${TMPDIR:-/tmp}/moon-ide-status.$$"; ( cd "$TEST_REPO_ROOT" && "$@"; echo "$?" > "$status_file" ) 2>&1 | normalize_moon_ide_output; status=$(cat "$status_file"); rm -f "$status_file"; return "$status"; }
```

```mooncram
$ run_moon_ide moon ide rename 'QueueAlreadyClosed' 'QueueAlreadyClosedRenamed' --loc 'async/aqueue/deprecated.mbt:18:12'
*** Begin Patch
*** Update File: <WORKDIR>/async/aqueue/aqueue.mbt
@@
 
 ///|
 /// Default error raised when trying to access an already-closed queue
-pub suberror QueueAlreadyClosed derive(@debug.Debug, @json.ToJson)
+pub suberror QueueAlreadyClosedRenamed derive(@debug.Debug, @json.ToJson)
 
 ///|
 /// Close an async queue. After the queue is closed:
@@
 /// But this error can be customized via the `error` parameter.
 pub fn[X] Queue::close(
   self : Queue[X],
-  error~ : Error = QueueAlreadyClosed,
+  error~ : Error = QueueAlreadyClosedRenamed,
   clear~ : Bool = false,
 ) -> Unit {
   self.closed = Some(error)
*** Update File: <WORKDIR>/async/aqueue/deprecated.mbt
@@
 ///|
 #deprecated
 #doc(hidden)
-pub extend QueueAlreadyClosed with @debug.Debug::{to_repr}
+pub extend QueueAlreadyClosedRenamed with @debug.Debug::{to_repr}
 
 ///|
 #deprecated
 #doc(hidden)
-pub extend QueueAlreadyClosed with @json.ToJson::{to_json}
+pub extend QueueAlreadyClosedRenamed with @json.ToJson::{to_json}
*** End Patch

```
