# json rename decode_start src/tests/top.mbt:2:14

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
$ run_moon_ide moon ide rename 'decode_start' 'decode_start_renamed' --loc 'src/tests/top.mbt:2:14'
*** Begin Patch
*** Update File: <WORKDIR>/src/tests/incr.mbt
@@
 fn decode_chunks(chunks : ArrayView[String]) -> Value raise {
   match chunks {
     [first_chunk, .. chunks] => (escaped)
-      continue_chunks(chunks, decode_start(first_chunk))
+      continue_chunks(chunks, decode_start_renamed(first_chunk))
     [] => raise InspectError::InspectError("expected at least one chunk") (escaped)
   }
 }
@@
   guard compelet_json.to_array().chunks(6).map(String::from_array)
     is [first_chunk, .. chunks]
   // start parsing from `first_chunk`
-  guard continue_chunks(chunks, decode_start(first_chunk))
+  guard continue_chunks(chunks, decode_start_renamed(first_chunk))
     is Finish({ value, .. })
   let expected = Json::object({
     "foo": Json::object({ "bar": Json::number(1200.0) }),
*** Update File: <WORKDIR>/src/tests/top.mbt
@@
 ///|
-using @json {decode_start, decode_continue, type Value}
+using @json {decode_start_renamed, decode_continue, type Value}
*** End Patch

```
