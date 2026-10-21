# json rename incr_fail src/tests/incr.mbt:2:4

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
$ run_moon_ide moon ide rename 'incr_fail' 'incr_fail_renamed' --loc 'src/tests/incr.mbt:2:4'
*** Begin Patch
*** Update File: <WORKDIR>/src/tests/incr.mbt
@@
 ///|
-fn incr_fail(message : String) -> Unit raise {
+fn incr_fail_renamed(message : String) -> Unit raise {
   raise InspectError::InspectError(message)
 }
 
@@
   match decode_chunks(chunks) {
     Finish({ value, rest: [], .. }) => @debug.assert_eq(value, expected)
     Finish({ rest, .. }) =>
-      incr_fail(
+      incr_fail_renamed(
         "expected chunked JSON without trailing bytes: " +
         name +
         ", got " +
         String::from_array([..rest]),
       )
-    Continue(_) => incr_fail("expected chunked JSON to finish: " + name)
+    Continue(_) => incr_fail_renamed("expected chunked JSON to finish: " + name)
   }
 }
 
@@
   try decode_chunks(chunks) catch {
     @lib.ParseError(_) => () (escaped)
     _ =>
-      incr_fail(
+      incr_fail_renamed(
         "expected chunked parser rejection, got non-parser error: " + name,
       )
   } noraise {
     Continue(_) =>
-      incr_fail("expected chunked parser rejection, got continuation: " + name)
+      incr_fail_renamed("expected chunked parser rejection, got continuation: " + name)
     Finish(_) =>
-      incr_fail("expected chunked parser rejection, parser accepted: " + name)
+      incr_fail_renamed("expected chunked parser rejection, parser accepted: " + name)
   }
 }
 
@@
       assert_eq(String::from_array([..rest]), " trailing")
     }
     Continue(_) =>
-      incr_fail("expected chunked parser to finish with trailing rest")
+      incr_fail_renamed("expected chunked parser to finish with trailing rest")
   }
 }
 
*** End Patch

```
