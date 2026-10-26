# core find-references QueueAlreadyClosed async/aqueue/deprecated.mbt:18:12

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
$ run_moon_ide moon ide find-references 'QueueAlreadyClosed' --loc 'async/aqueue/deprecated.mbt:18:12'
Found 3 references for symbol 'QueueAlreadyClosed':
<WORKDIR>/async/aqueue/aqueue.mbt:347:20-347:38:
    | /// But this error can be customized via the `error` parameter.
    | pub fn[X] Queue::close(
    |   self : Queue[X],
347 |   error~ : Error = QueueAlreadyClosed,
    |                    ^^^^^^^^^^^^^^^^^^
    |   clear~ : Bool = false,
    | ) -> Unit {

<WORKDIR>/async/aqueue/deprecated.mbt:18:12-18:30:
   | ///|
   | #deprecated
   | #doc(hidden)
18 | pub extend QueueAlreadyClosed with @debug.Debug::{to_repr}
   |            ^^^^^^^^^^^^^^^^^^
   | 
   | ///|

<WORKDIR>/async/aqueue/deprecated.mbt:23:12-23:30:
   | ///|
   | #deprecated
   | #doc(hidden)
23 | pub extend QueueAlreadyClosed with @json.ToJson::{to_json}
   |            ^^^^^^^^^^^^^^^^^^

```
