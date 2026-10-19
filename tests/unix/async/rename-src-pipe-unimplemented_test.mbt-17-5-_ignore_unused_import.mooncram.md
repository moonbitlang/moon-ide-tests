# async rename _ignore_unused_import src/pipe/unimplemented_test.mbt:17:5

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
$ run_moon_ide moon ide rename '_ignore_unused_import' '_ignore_unused_import_renamed' --loc 'src/pipe/unimplemented_test.mbt:17:5' --target js
*** Begin Patch
*** Update File: <WORKDIR>/src/pipe/unimplemented_test.mbt
@@
 
 ///|
 #cfg(not(target="native"))
-let _ignore_unused_import : Unit = {
+let _ignore_unused_import_renamed : Unit = {
   ignore(@async.sleep)
   ignore(@utf8.encode(""))
   ignore((f : async () -> Unit) => @test_util.assert_raise_async(f))
*** End Patch

```
