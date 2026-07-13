# sqlparser find-references read_and_parse src/tests/tpch_test.mbt:2:4

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
$ run_moon_ide moon ide find-references 'read_and_parse' --loc 'src/tests/tpch_test.mbt:2:4'
Found 23 references for symbol 'read_and_parse':
<WORKDIR>/src/tests/tpch_test.mbt:2:4-2:18:
  | ///| (escaped)
2 | fn read_and_parse(path : String) -> @sqlparser.Statements { (escaped)
  |    ^^^^^^^^^^^^^^ (escaped)
  |   let input = @fs.read_file_to_string(path) catch { (escaped)
  |     e => { (escaped)

<WORKDIR>/src/tests/tpch_test.mbt:23:14-23:28:
   |  (escaped)
   | ///| (escaped)
   | test "TPCH 1" { (escaped)
23 |   let stmt = read_and_parse("src/tests/tpch/1.sql") |> @sqlparser.pretty_print (escaped)
   |              ^^^^^^^^^^^^^^ (escaped)
   |   inspect( (escaped)
   |     stmt, (escaped)

<WORKDIR>/src/tests/tpch_test.mbt:54:14-54:28:
   |  (escaped)
   | ///| (escaped)
   | test "TPCH 2" { (escaped)
54 |   let stmt = read_and_parse("src/tests/tpch/2.sql") |> @sqlparser.pretty_print (escaped)
   |              ^^^^^^^^^^^^^^ (escaped)
   |   inspect( (escaped)
   |     stmt, (escaped)

<WORKDIR>/src/tests/tpch_test.mbt:107:14-107:28:
    |  (escaped)
    | ///| (escaped)
    | test "TPCH 3" { (escaped)
107 |   let stmt = read_and_parse("src/tests/tpch/3.sql") |> @sqlparser.pretty_print (escaped)
    |              ^^^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/tests/tpch_test.mbt:139:14-139:28:
    |  (escaped)
    | ///| (escaped)
    | test "TPCH 4" { (escaped)
139 |   let stmt = read_and_parse("src/tests/tpch/4.sql") |> @sqlparser.pretty_print (escaped)
    |              ^^^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/tests/tpch_test.mbt:170:14-170:28:
    |  (escaped)
    | ///| (escaped)
    | test "TPCH 5" { (escaped)
170 |   let stmt = read_and_parse("src/tests/tpch/5.sql") |> @sqlparser.pretty_print (escaped)
    |              ^^^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/tests/tpch_test.mbt:204:14-204:28:
    |  (escaped)
    | ///| (escaped)
    | test "TPCH 6" { (escaped)
204 |   let stmt = read_and_parse("src/tests/tpch/6.sql") |> @sqlparser.pretty_print (escaped)
    |              ^^^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/tests/tpch_test.mbt:223:14-223:28:
    |  (escaped)
    | ///| (escaped)
    | test "TPCH 7" { (escaped)
223 |   let stmt = read_and_parse("src/tests/tpch/7.sql") |> @sqlparser.pretty_print (escaped)
    |              ^^^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/tests/tpch_test.mbt:276:14-276:28:
    |  (escaped)
    | ///| (escaped)
    | test "TPCH 8" { (escaped)
276 |   let stmt = read_and_parse("src/tests/tpch/8.sql") |> @sqlparser.pretty_print (escaped)
    |              ^^^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/tests/tpch_test.mbt:323:14-323:28:
    |  (escaped)
    | ///| (escaped)
    | test "TPCH 9" { (escaped)
323 |   let stmt = read_and_parse("src/tests/tpch/9.sql") |> @sqlparser.pretty_print (escaped)
    |              ^^^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/tests/tpch_test.mbt:365:14-365:28:
    |  (escaped)
    | ///| (escaped)
    | test "TPCH 10" { (escaped)
365 |   let stmt = read_and_parse("src/tests/tpch/10.sql") |> @sqlparser.pretty_print (escaped)
    |              ^^^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/tests/tpch_test.mbt:406:14-406:28:
    |  (escaped)
    | ///| (escaped)
    | test "TPCH 11" { (escaped)
406 |   let stmt = read_and_parse("src/tests/tpch/11.sql") |> @sqlparser.pretty_print (escaped)
    |              ^^^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/tests/tpch_test.mbt:444:14-444:28:
    |  (escaped)
    | ///| (escaped)
    | test "TPCH 12" { (escaped)
444 |   let stmt = read_and_parse("src/tests/tpch/12.sql") |> @sqlparser.pretty_print (escaped)
    |              ^^^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/tests/tpch_test.mbt:480:14-480:28:
    |  (escaped)
    | ///| (escaped)
    | test "TPCH 13" { (escaped)
480 |   let stmt = read_and_parse("src/tests/tpch/13.sql") |> @sqlparser.pretty_print (escaped)
    |              ^^^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/tests/tpch_test.mbt:510:14-510:28:
    |  (escaped)
    | ///| (escaped)
    | test "TPCH 14" { (escaped)
510 |   let stmt = read_and_parse("src/tests/tpch/14.sql") |> @sqlparser.pretty_print (escaped)
    |              ^^^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/tests/tpch_test.mbt:532:14-532:28:
    |  (escaped)
    | ///| (escaped)
    | test "TPCH 15" { (escaped)
532 |   let stmt = read_and_parse("src/tests/tpch/15.sql") |> @sqlparser.pretty_print (escaped)
    |              ^^^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/tests/tpch_test.mbt:575:14-575:28:
    |  (escaped)
    | ///| (escaped)
    | test "TPCH 16" { (escaped)
575 |   let stmt = read_and_parse("src/tests/tpch/16.sql") |> @sqlparser.pretty_print (escaped)
    |              ^^^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/tests/tpch_test.mbt:615:14-615:28:
    |  (escaped)
    | ///| (escaped)
    | test "TPCH 17" { (escaped)
615 |   let stmt = read_and_parse("src/tests/tpch/17.sql") |> @sqlparser.pretty_print (escaped)
    |              ^^^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/tests/tpch_test.mbt:642:14-642:28:
    |  (escaped)
    | ///| (escaped)
    | test "TPCH 18" { (escaped)
642 |   let stmt = read_and_parse("src/tests/tpch/18.sql") |> @sqlparser.pretty_print (escaped)
    |              ^^^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/tests/tpch_test.mbt:685:14-685:28:
    |  (escaped)
    | ///| (escaped)
    | test "TPCH 19" { (escaped)
685 |   let stmt = read_and_parse("src/tests/tpch/19.sql") |> @sqlparser.pretty_print (escaped)
    |              ^^^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/tests/tpch_test.mbt:731:14-731:28:
    |  (escaped)
    | ///| (escaped)
    | test "TPCH 20" { (escaped)
731 |   let stmt = read_and_parse("src/tests/tpch/20.sql") |> @sqlparser.pretty_print (escaped)
    |              ^^^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/tests/tpch_test.mbt:778:14-778:28:
    |  (escaped)
    | ///| (escaped)
    | test "TPCH 21" { (escaped)
778 |   let stmt = read_and_parse("src/tests/tpch/21.sql") |> @sqlparser.pretty_print (escaped)
    |              ^^^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

<WORKDIR>/src/tests/tpch_test.mbt:827:14-827:28:
    |  (escaped)
    | ///| (escaped)
    | test "TPCH 22" { (escaped)
827 |   let stmt = read_and_parse("src/tests/tpch/22.sql") |> @sqlparser.pretty_print (escaped)
    |              ^^^^^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     stmt, (escaped)

```
