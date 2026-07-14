# toml-parser find-references key_variations_toml additional_official_tests_test.mbt:8:7

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
$ run_moon_ide moon ide find-references 'key_variations_toml' --loc 'additional_official_tests_test.mbt:8:7'
Found 2 references for symbol 'key_variations_toml':
<WORKDIR>/additional_official_tests_test.mbt:8:7-8:26:
  | ///|
  | /// Test key names with various characters
  | test "key name variations" {
8 |   let key_variations_toml =
  |       ^^^^^^^^^^^^^^^^^^^
  |     #|bare_key = "value"
  |     #|bare-key = "value"

<WORKDIR>/additional_official_tests_test.mbt:17:17-17:36:
   |     #|"ʎǝʞ" = "value"
   |     #|
   |   debug_inspect(
17 |     @toml.parse(key_variations_toml),
   |                 ^^^^^^^^^^^^^^^^^^^
   |     content=(
   |       #|TomlTable(

```
