# json rename message src/tests/incr.mbt:2:14

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
$ run_moon_ide moon ide rename 'message' 'message_renamed' --loc 'src/tests/incr.mbt:2:14'
*** Begin Patch
*** Update File: <WORKDIR>/src/tests/incr.mbt
@@
 ///|
-fn incr_fail(message : String) -> Unit raise {
+fn incr_fail(message_renamed : String) -> Unit raise {
-  raise InspectError::InspectError(message)
+  raise InspectError::InspectError(message_renamed)
 }
 
 ///|
*** End Patch

```
