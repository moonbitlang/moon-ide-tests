# sqlparser find-references obj src/show.mbt:2:34

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
$ run_moon_ide moon ide find-references 'obj' --loc 'src/show.mbt:2:34'
Found 2 references for symbol 'obj':
<WORKDIR>/src/show.mbt:2:34-2:37:
  | ///|
2 | fn[T : Debug] show_compact_debug(obj : T, logger : &Logger) -> Unit {
  |                                  ^^^
  |   let input = @debug.to_string(obj)
  |   let buffer = StringBuilder::new()

<WORKDIR>/src/show.mbt:3:32-3:35:
  | ///|
  | fn[T : Debug] show_compact_debug(obj : T, logger : &Logger) -> Unit {
3 |   let input = @debug.to_string(obj)
  |                                ^^^
  |   let buffer = StringBuilder::new()
  |   let mut in_string = false

```
