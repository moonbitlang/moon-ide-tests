# json rename json_testsuite_fail src/tests/json_testsuite_helpers_test.mbt:2:4

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
$ run_moon_ide moon ide rename 'json_testsuite_fail' 'json_testsuite_fail_renamed' --loc 'src/tests/json_testsuite_helpers_test.mbt:2:4'
*** Begin Patch
*** Update File: <WORKDIR>/src/tests/json_testsuite_helpers_test.mbt
@@
 ///|
-fn json_testsuite_fail(message : String) -> Unit raise {
+fn json_testsuite_fail_renamed(message : String) -> Unit raise {
   raise InspectError::InspectError(message)
 }
 
@@
 ///|
 fn expect_accept(name : String, input : String) -> Unit raise {
   try @json.decode(input) catch {
-    _ => json_testsuite_fail("expected JSONTestSuite accept: " + name)
+    _ => json_testsuite_fail_renamed("expected JSONTestSuite accept: " + name)
   } noraise {
     _ => () (escaped)
   }
@@
   try @json.decode(input) catch {
     @lib.ParseError(_) => () (escaped)
     _ =>
-      json_testsuite_fail(
+      json_testsuite_fail_renamed(
         "expected JSONTestSuite parser rejection, got non-parser error: " + name,
       )
   } noraise {
     _ =>
-      json_testsuite_fail(
+      json_testsuite_fail_renamed(
         "expected JSONTestSuite rejection, parser accepted: " + name,
       )
   }
@@
   try @json.decode(input) catch {
     @lib.ParseError(_) => () (escaped)
     _ =>
-      json_testsuite_fail(
+      json_testsuite_fail_renamed(
         "expected JSONTestSuite accept or parser rejection, got non-parser error: " +
         name,
       )
*** End Patch

```
