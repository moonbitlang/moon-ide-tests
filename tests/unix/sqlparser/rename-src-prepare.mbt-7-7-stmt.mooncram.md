# sqlparser rename stmt src/prepare.mbt:7:7

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
$ run_moon_ide moon ide rename 'stmt' 'stmt_renamed' --loc 'src/prepare.mbt:7:7'
*** Begin Patch
*** Update File: <WORKDIR>/src/prepare.mbt
@@
 ///|
 test "PREPARE simple SELECT" {
   let sql = "PREPARE stmt AS SELECT * FROM users WHERE id = ?"
-  let stmt = parse_sql(sql)[0] |> pretty_print
+  let stmt_renamed = parse_sql(sql)[0] |> pretty_print
   inspect(
-    stmt,
+    stmt_renamed,
     content=(
       #|PREPARE stmt AS SELECT
       #|  *
*** End Patch

```
