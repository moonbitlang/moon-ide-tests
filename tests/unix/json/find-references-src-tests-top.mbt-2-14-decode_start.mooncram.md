# json find-references decode_start src/tests/top.mbt:2:14

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
$ run_moon_ide moon ide find-references 'decode_start' --loc 'src/tests/top.mbt:2:14'
Found 2 references for symbol 'decode_start':
<WORKDIR>/src/tests/incr.mbt:21:31-21:43:
   | fn decode_chunks(chunks : ArrayView[String]) -> Value raise {
   |   match chunks {
   |     [first_chunk, .. chunks] =>
21 |       continue_chunks(chunks, decode_start(first_chunk))
   |                               ^^^^^^^^^^^^
   |     [] => raise InspectError::InspectError("expected at least one chunk")
   |   }

<WORKDIR>/src/tests/incr.mbt:71:34-71:46:
   |   guard! compelet_json.to_array().chunks(6).map(String::from_array)
   |     is [first_chunk, .. chunks]
   |   // start parsing from `first_chunk`
71 |   guard! continue_chunks(chunks, decode_start(first_chunk))
   |                                  ^^^^^^^^^^^^
   |     is Finish({ value, .. })
   |   let expected = Json::object({

```
