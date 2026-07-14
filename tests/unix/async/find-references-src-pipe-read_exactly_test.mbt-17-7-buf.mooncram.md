# async find-references buf src/pipe/read_exactly_test.mbt:17:7

```mooncram
$ export MOON_HOME="${MOON_HOME:-$HOME/.moon}"
```

```mooncram
$ export TEST_REPO_ROOT="$(cd "$TESTDIR/../../../fixtures/repos/async" && pwd)"
```

```mooncram
$ normalize_moon_ide_output() { sed -e "s|$TEST_REPO_ROOT|<WORKDIR>|g" -e "s|$MOON_HOME|<MOON_HOME>|g"; }
```

```mooncram
$ run_moon_ide() { status_file="${TMPDIR:-/tmp}/moon-ide-status.$$"; ( cd "$TEST_REPO_ROOT" && "$@"; echo "$?" > "$status_file" ) 2>&1 | normalize_moon_ide_output; status=$(cat "$status_file"); rm -f "$status_file"; return "$status"; }
```

```mooncram
$ run_moon_ide moon ide find-references 'buf' --loc 'src/pipe/read_exactly_test.mbt:17:7'
Found 3 references for symbol 'buf':
<WORKDIR>/src/pipe/read_exactly_test.mbt:17:7-17:10:
   | 
   | ///|
   | async test "read_exactly" {
17 |   let buf = StringBuilder::new()
   |       ^^^
   |   fn log(msg) {
   |     buf..write_string(msg).write_char('\n')

<WORKDIR>/src/pipe/read_exactly_test.mbt:19:5-19:8:
   | async test "read_exactly" {
   |   let buf = StringBuilder::new()
   |   fn log(msg) {
19 |     buf..write_string(msg).write_char('\n')
   |     ^^^
   |   }
   | 

<WORKDIR>/src/pipe/read_exactly_test.mbt:45:5-45:8:
   |     }
   |   }
   |   inspect(
45 |     buf.to_string(),
   |     ^^^
   |     content=(
   |       #|first message sent

```
