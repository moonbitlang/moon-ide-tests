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
Found 3 references for symbol 'decode_start':
<WORKDIR>/src/tests/incr.mbt:21:31-21:43:
   | fn decode_chunks(chunks : ArrayView[String]) -> Value raise { (escaped)
   |   match chunks { (escaped)
   |     [first_chunk, .. chunks] => (escaped)
21 |       continue_chunks(chunks, decode_start(first_chunk)) (escaped)
   |                               ^^^^^^^^^^^^ (escaped)
   |     [] => raise InspectError::InspectError("expected at least one chunk") (escaped)
   |   } (escaped)

<WORKDIR>/src/tests/incr.mbt:71:33-71:45:
   |   guard compelet_json.to_array().chunks(6).map(String::from_array) (escaped)
   |     is [first_chunk, .. chunks] (escaped)
   |   // start parsing from `first_chunk` (escaped)
71 |   guard continue_chunks(chunks, decode_start(first_chunk)) (escaped)
   |                                 ^^^^^^^^^^^^ (escaped)
   |     is Finish({ value, .. }) (escaped)
   |   let expected = Json::object({ (escaped)

<WORKDIR>/src/tests/top.mbt:2:14-2:26:
  | ///| (escaped)
2 | using @json {decode_start, decode_continue, type Value} (escaped)
  |              ^^^^^^^^^^^^ (escaped)

```
