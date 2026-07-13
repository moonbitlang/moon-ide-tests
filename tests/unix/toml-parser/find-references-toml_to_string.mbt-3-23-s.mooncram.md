# toml-parser find-references s toml_to_string.mbt:3:23

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
$ run_moon_ide moon ide find-references 's' --loc 'toml_to_string.mbt:3:23'
Found 2 references for symbol 's':
<WORKDIR>/toml_to_string.mbt:3:23-3:24:
  | ///|
  | /// Helper function to escape strings according to TOML spec
3 | fn escape_toml_string(s : String) -> String {
  |                       ^
  |   let result = StringBuilder()
  |   for char in s {

<WORKDIR>/toml_to_string.mbt:290:30-290:31:
    |         output <+ "\{format_toml_key(key)}]\n"
    |         let new_path = path.copy()
    |         new_path.push(key)
290 |         write_table_contents(t, output, new_path)
    |                              ^
    |       }
    |       _ => () // Should not happen

```
