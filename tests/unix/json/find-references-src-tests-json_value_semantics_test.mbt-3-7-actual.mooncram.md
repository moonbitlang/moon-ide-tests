# json find-references actual src/tests/json_value_semantics_test.mbt:3:7

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
$ run_moon_ide moon ide find-references 'actual' --loc 'src/tests/json_value_semantics_test.mbt:3:7'
Found 2 references for symbol 'actual':
<WORKDIR>/src/tests/json_value_semantics_test.mbt:3:7-3:13:
  | ///|
  | test "json value semantics basics" {
3 |   let actual = @json.decode("[false,1,\"x\",null,{\"a\":true}]")
  |       ^^^^^^
  |   let expected = Json::array([
  |     Json::boolean(false),

<WORKDIR>/src/tests/json_value_semantics_test.mbt:11:20-11:26:
   |     Json::null(),
   |     Json::object({ "a": Json::boolean(true) }),
   |   ])
11 |   @debug.assert_eq(actual, expected)
   |                    ^^^^^^
   | }
   | 

```
