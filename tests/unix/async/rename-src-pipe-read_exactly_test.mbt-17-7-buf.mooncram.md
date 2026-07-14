# async rename buf src/pipe/read_exactly_test.mbt:17:7

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
$ run_moon_ide moon ide rename 'buf' 'buf_renamed' --loc 'src/pipe/read_exactly_test.mbt:17:7'
*** Begin Patch
*** Update File: <WORKDIR>/src/pipe/read_exactly_test.mbt
@@
 
 ///|
 async test "read_exactly" {
-  let buf = StringBuilder::new()
+  let buf_renamed = StringBuilder::new()
   fn log(msg) {
-    buf..write_string(msg).write_char('\n')
+    buf_renamed..write_string(msg).write_char('\n')
   }
 
   @async.with_task_group() <| root => {
@@
     }
   }
   inspect(
-    buf.to_string(),
+    buf_renamed.to_string(),
     content=(
       #|first message sent
       #|first message: abcd
*** End Patch

```
