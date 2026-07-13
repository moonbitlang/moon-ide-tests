# json find-references decode_continue src/tests/top.mbt:2:28

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
$ run_moon_ide moon ide find-references 'decode_continue' --loc 'src/tests/top.mbt:2:28'
Found 2 references for symbol 'decode_continue':
<WORKDIR>/src/tests/incr.mbt:11:29-11:44:
   |   match (chunks, value) { (escaped)
   |     ([], value) => value (escaped)
   |     ([chunk, .. rest], Continue(state)) => (escaped)
11 |       continue_chunks(rest, decode_continue(chunk, state)) (escaped)
   |                             ^^^^^^^^^^^^^^^ (escaped)
   |     ([_, ..], Finish(_)) => (escaped)
   |       raise InspectError::InspectError("parser finished before all chunks") (escaped)

<WORKDIR>/src/tests/top.mbt:2:28-2:43:
  | ///| (escaped)
2 | using @json {decode_start, decode_continue, type Value} (escaped)
  |                            ^^^^^^^^^^^^^^^ (escaped)

```
