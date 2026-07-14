# sqlparser rename obj src/ast.mbt:2:37

```mooncram
$ export MOON_HOME="${MOON_HOME:-$HOME/.moon}"
```

```mooncram
$ export TEST_REPO_ROOT="$(cd "$TESTDIR/../../../fixtures/repos/sqlparser" && pwd)"
```

```mooncram
$ normalize_moon_ide_output() { sed -e "s|$TEST_REPO_ROOT|<WORKDIR>|g" -e "s|$MOON_HOME|<MOON_HOME>|g"; }
```

```mooncram
$ run_moon_ide() { status_file="${TMPDIR:-/tmp}/moon-ide-status.$$"; ( cd "$TEST_REPO_ROOT" && "$@"; echo "$?" > "$status_file" ) 2>&1 | normalize_moon_ide_output; status=$(cat "$status_file"); rm -f "$status_file"; return "$status"; }
```

```mooncram
$ run_moon_ide moon ide rename 'obj' 'obj_renamed' --loc 'src/ast.mbt:2:37'
*** Begin Patch
*** Update File: <WORKDIR>/src/ast.mbt
@@
 ///|
-pub fn[T : @pp.Pretty] pretty_print(obj : T) -> String {
+pub fn[T : @pp.Pretty] pretty_print(obj_renamed : T) -> String {
-  @pp.pretty(obj).to_string()
+  @pp.pretty(obj_renamed).to_string()
 }
 
 ///|
*** End Patch

```
