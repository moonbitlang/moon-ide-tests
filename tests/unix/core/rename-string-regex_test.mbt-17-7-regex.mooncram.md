# core rename regex string/regex_test.mbt:17:7

```mooncram
$ export MOON_HOME="${MOON_HOME:-$HOME/.moon}"
```

```mooncram
$ export TEST_REPO_ROOT="$(cd "$TESTDIR/../../../fixtures/repos/core" && pwd)"
```

```mooncram
$ normalize_moon_ide_output() { sed -e "s|$TEST_REPO_ROOT|<WORKDIR>|g" -e "s|$MOON_HOME|<MOON_HOME>|g"; }
```

```mooncram
$ run_moon_ide() { status_file="${TMPDIR:-/tmp}/moon-ide-status.$$"; ( cd "$TEST_REPO_ROOT" && "$@"; echo "$?" > "$status_file" ) 2>&1 | normalize_moon_ide_output; status=$(cat "$status_file"); rm -f "$status_file"; return "$status"; }
```

```mooncram
$ run_moon_ide moon ide rename 'regex' 'regex_renamed' --loc 'string/regex_test.mbt:17:7'
*** Begin Patch
*** Update File: <WORKDIR>/string/regex_test.mbt
@@
 
 ///|
 test "execute/non_capture_group" {
-  let regex = re"(?:ab)(c)(?:d)"
+  let regex_renamed = re"(?:ab)(c)(?:d)"
-  guard regex.execute("abcd") is Some(m) else { fail("Expected match") }
+  guard regex_renamed.execute("abcd") is Some(m) else { fail("Expected match") }
   debug_inspect(
     m,
     content=(
*** End Patch

```
