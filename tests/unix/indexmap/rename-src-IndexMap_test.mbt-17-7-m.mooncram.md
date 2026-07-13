# indexmap rename m src/IndexMap_test.mbt:17:7

```mooncram
$ export MOON_HOME="${MOON_HOME:-$HOME/.moon}"
```

```mooncram
$ export TEST_REPO_ROOT="$(cd "$TESTDIR/../../../fixtures/repos/indexmap" && pwd)"
```

```mooncram
$ normalize_moon_ide_output() { sed -e "s|$TEST_REPO_ROOT|<WORKDIR>|g" -e "s|$MOON_HOME|<MOON_HOME>|g"; }
```

```mooncram
$ run_moon_ide() { status_file="${TMPDIR:-/tmp}/moon-ide-status.$$"; ( cd "$TEST_REPO_ROOT" && "$@"; echo "$?" > "$status_file" ) 2>&1 | normalize_moon_ide_output; status=$(cat "$status_file"); rm -f "$status_file"; return "$status"; }
```

```mooncram
$ run_moon_ide moon ide rename 'm' 'm_renamed' --loc 'src/IndexMap_test.mbt:17:7'
*** Begin Patch
*** Update File: <WORKDIR>/src/IndexMap_test.mbt
@@
 
 ///|
 test "new" {
-  let m : @IndexMap.T[Int, Int] = @IndexMap.new()
+  let m_renamed : @IndexMap.T[Int, Int] = @IndexMap.new()
-  inspect(m.capacity(), content="8")
+  inspect(m_renamed.capacity(), content="8")
-  @debug.assert_eq(m.size(), 0)
+  @debug.assert_eq(m_renamed.size(), 0)
 }
 
 ///|
*** End Patch

```
