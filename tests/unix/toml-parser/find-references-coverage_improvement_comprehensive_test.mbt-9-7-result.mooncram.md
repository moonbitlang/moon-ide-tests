# toml-parser find-references result coverage_improvement_comprehensive_test.mbt:9:7

```mooncram
$ export MOON_HOME="${MOON_HOME:-$HOME/.moon}"
```

```mooncram
$ export TEST_REPO_ROOT="$(cd "$TESTDIR/../../../fixtures/repos/toml-parser" && pwd)"
```

```mooncram
$ normalize_moon_ide_output() { sed -e "s|$TEST_REPO_ROOT|<WORKDIR>|g" -e "s|$MOON_HOME|<MOON_HOME>|g"; }
```

```mooncram
$ run_moon_ide() { status_file="${TMPDIR:-/tmp}/moon-ide-status.$$"; ( cd "$TEST_REPO_ROOT" && "$@"; echo "$?" > "$status_file" ) 2>&1 | normalize_moon_ide_output; status=$(cat "$status_file"); rm -f "$status_file"; return "$status"; }
```

```mooncram
$ run_moon_ide moon ide find-references 'result' --loc 'coverage_improvement_comprehensive_test.mbt:9:7'
Found 2 references for symbol 'result':
<WORKDIR>/coverage_improvement_comprehensive_test.mbt:9:7-9:13:
  | /// Test EOF handling in parser - covered by creating empty token arrays
  | test "parser_eof_handling" {
  |   // Test empty parse input to exercise EOF conditions
9 |   let result = @toml.parse(
  |       ^^^^^^
  |     (
  |       #|

<WORKDIR>/coverage_improvement_comprehensive_test.mbt:15:5-15:11:
   |     ),
   |   )
   |   debug_inspect(
15 |     result,
   |     ^^^^^^
   |     content=(
   |       #|TomlTable({})

```
