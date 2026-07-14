# json rename decode_continue src/tests/top.mbt:2:28

```mooncram
$ export MOON_HOME="${MOON_HOME:-$HOME/.moon}"
```

```mooncram
$ export TEST_REPO_ROOT="$(cd "$TESTDIR/../../../fixtures/repos/json" && pwd)"
```

```mooncram
$ normalize_moon_ide_output() { sed -e "s|$TEST_REPO_ROOT|<WORKDIR>|g" -e "s|$MOON_HOME|<MOON_HOME>|g"; }
```

```mooncram
$ run_moon_ide() { status_file="${TMPDIR:-/tmp}/moon-ide-status.$$"; ( cd "$TEST_REPO_ROOT" && "$@"; echo "$?" > "$status_file" ) 2>&1 | normalize_moon_ide_output; status=$(cat "$status_file"); rm -f "$status_file"; return "$status"; }
```

```mooncram
$ run_moon_ide moon ide rename 'decode_continue' 'decode_continue_renamed' --loc 'src/tests/top.mbt:2:28'
*** Begin Patch
*** Update File: <WORKDIR>/src/tests/incr.mbt
@@
   match (chunks, value) {
     ([], value) => value (escaped)
     ([chunk, .. rest], Continue(state)) => (escaped)
-      continue_chunks(rest, decode_continue(chunk, state))
+      continue_chunks(rest, decode_continue_renamed(chunk, state))
     ([_, ..], Finish(_)) => (escaped)
       raise InspectError::InspectError("parser finished before all chunks")
   }
*** Update File: <WORKDIR>/src/tests/top.mbt
@@
 ///|
-using @json {decode_start, decode_continue, type Value}
+using @json {decode_start, decode_continue_renamed, type Value}
*** End Patch

```
