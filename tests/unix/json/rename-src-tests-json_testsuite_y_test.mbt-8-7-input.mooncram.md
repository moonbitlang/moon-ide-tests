# json rename input src/tests/json_testsuite_y_test.mbt:8:7

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
$ run_moon_ide moon ide rename 'input' 'input_renamed' --loc 'src/tests/json_testsuite_y_test.mbt:8:7'
*** Begin Patch
*** Update File: <WORKDIR>/src/tests/json_testsuite_y_test.mbt
@@
 
 ///|
 test "json_testsuite y_array_arraysWithSpaces" {
-  let input = "[[]   ]"
+  let input_renamed = "[[]   ]"
-  expect_accept("y_array_arraysWithSpaces.json", input)
+  expect_accept("y_array_arraysWithSpaces.json", input_renamed)
 }
 
 ///|
*** End Patch

```
