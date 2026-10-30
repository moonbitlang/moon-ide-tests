# async rename x src/internal/event_loop/stdio.mbt:18:3

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
$ run_moon_ide moon ide rename 'x' 'x_renamed' --loc 'src/internal/event_loop/stdio.mbt:18:3'
*** Begin Patch
*** Update File: <WORKDIR>/src/internal/event_loop/stdio.mbt
@@
 ///|
 #warnings("-alert_internal-result_error_return")
 fn from_core_stdio(
-  x : @runtime_internal.StdioChannel,
+  x_renamed : @runtime_internal.StdioChannel,
 ) -> Result[IoHandle, Error] = "%identity"
 
 ///|
*** End Patch

```
