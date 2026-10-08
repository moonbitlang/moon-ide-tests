# async rename log src/pipe/read_exactly_test.mbt:18:6

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
$ run_moon_ide moon ide rename 'log' 'log_renamed' --loc 'src/pipe/read_exactly_test.mbt:18:6'
*** Begin Patch
*** Update File: <WORKDIR>/src/pipe/read_exactly_test.mbt
@@
 ///|
 async test "read_exactly" {
   let buf = StringBuilder()
-  fn log(msg) {
+  fn log_renamed(msg) {
     buf..write_string(msg).write_char('\n')
   }
 
@@
     root.spawn_bg() <| () => {
       defer r.close()
       let msg1 = r.read_exactly(4) |> @utf8.decode
-      log("first message: \{msg1}")
+      log_renamed("first message: \{msg1}")
       let msg2 = r.read_exactly(4) |> @utf8.decode
-      log("second message: \{msg2}")
+      log_renamed("second message: \{msg2}")
       let msg3 = r.read_exactly(4) |> @utf8.decode
-      log("third message: \{msg3}")
+      log_renamed("third message: \{msg3}")
     }
     // writer
     root.spawn_bg() <| () => {
       defer w.close()
-      log("first message sent")
+      log_renamed("first message sent")
       w.write("abcdef")
       @async.sleep(100)
-      log("second message sent")
+      log_renamed("second message sent")
       w.write("ghijkl")
     }
   }
*** End Patch

```
