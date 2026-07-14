# core rename name test/types.mbt:17:3

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
$ run_moon_ide moon ide rename 'name' 'name_renamed' --loc 'test/types.mbt:17:3'
*** Begin Patch
*** Update File: <WORKDIR>/test/test.mbt
@@
 ///|
 /// Return the name of the test.
 pub fn Test::name(self : Self) -> String {
-  self.name
+  self.name_renamed
 }
*** Update File: <WORKDIR>/test/types.mbt
@@
 
 ///|
 struct Test {
-  name : String
+  name_renamed : String
   buffer : StringBuilder
 } derive(@debug.Debug)
 
@@
 #as_free_fn
 #as_free_fn(new, deprecated="Use `Test()` instead")
 pub fn Test::Test(name : String) -> Test {
-  { name, buffer: StringBuilder() }
+  { name_renamed: name, buffer: StringBuilder() }
 }
*** End Patch

```
