# async rename _ignore_unused_import src/js_async/unimplemented.mbt:17:5

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
$ run_moon_ide moon ide rename '_ignore_unused_import' '_ignore_unused_import_renamed' --loc 'src/js_async/unimplemented.mbt:17:5'
*** Begin Patch
*** Update File: <WORKDIR>/src/js_async/unimplemented.mbt
@@
 
 ///|
 #coverage.skip
-let _ignore_unused_import : Unit = {
+let _ignore_unused_import_renamed : Unit = {
   ignore(@coroutine.Coroutine::wake)
   ignore(@event_loop.Timer::new)
 }
*** End Patch

```
