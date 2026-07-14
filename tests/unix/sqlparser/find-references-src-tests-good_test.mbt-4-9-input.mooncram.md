# sqlparser find-references input src/tests/good_test.mbt:4:9

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
$ run_moon_ide moon ide find-references 'input' --loc 'src/tests/good_test.mbt:4:9'
Found 2 references for symbol 'input':
<WORKDIR>/src/tests/good_test.mbt:4:9-4:14:
  | // These tests are copied from https://github.com/hyrise/sql-parser/blob/main/test/queries/queries-good.sql (escaped)
  |  (escaped)
  | ///| (escaped)
4 | fn pass(input : String) -> Unit { (escaped)
  |         ^^^^^ (escaped)
  |   (@sqlparser.parse_sql(input) catch { (escaped)
  |     e => { (escaped)

<WORKDIR>/src/tests/good_test.mbt:5:25-5:30:
  |  (escaped)
  | ///| (escaped)
  | fn pass(input : String) -> Unit { (escaped)
5 |   (@sqlparser.parse_sql(input) catch { (escaped)
  |                         ^^^^^ (escaped)
  |     e => { (escaped)
  |       println(e) (escaped)

```
