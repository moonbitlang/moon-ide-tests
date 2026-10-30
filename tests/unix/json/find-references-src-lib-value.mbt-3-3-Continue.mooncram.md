# json find-references Continue src/lib/value.mbt:3:3

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
$ run_moon_ide moon ide find-references 'Continue' --loc 'src/lib/value.mbt:3:3'
Found 9 references for symbol 'Continue':
<WORKDIR>/src/lib/json.mbt:37:5-37:13:
   |   match value(ctx) { (escaped)
   |     Finish({ value, rest: [], .. }) => value (escaped)
   |     Finish({ rest, .. }) => raise invalid_byte([..rest], 0) (escaped)
37 |     Continue({ stack: [], checkpoint: Checkpoint::NumberI(n), .. }) => Json(n)
   |     ^^^^^^^^ (escaped)
   |     Continue({ stack: [], checkpoint: Checkpoint::NumberD(n), .. }) => Json(n)
   |     Continue({ checkpoint: Checkpoint::FloatError(token, skip), .. }) =>

<WORKDIR>/src/lib/json.mbt:38:5-38:13:
   |     Finish({ value, rest: [], .. }) => value
   |     Finish({ rest, .. }) => raise invalid_byte([..rest], 0)
   |     Continue({ stack: [], checkpoint: Checkpoint::NumberI(n), .. }) => Json(n)
38 |     Continue({ stack: [], checkpoint: Checkpoint::NumberD(n), .. }) => Json(n)
   |     ^^^^^^^^
   |     Continue({ checkpoint: Checkpoint::FloatError(token, skip), .. }) =>
   |       raise ParseError(UnexpectedSequence(token.to_owned(), skip))

<WORKDIR>/src/lib/json.mbt:39:5-39:13:
   |     Finish({ rest, .. }) => raise invalid_byte([..rest], 0) (escaped)
   |     Continue({ stack: [], checkpoint: Checkpoint::NumberI(n), .. }) => Json(n)
   |     Continue({ stack: [], checkpoint: Checkpoint::NumberD(n), .. }) => Json(n)
39 |     Continue({ checkpoint: Checkpoint::FloatError(token, skip), .. }) =>
   |     ^^^^^^^^ (escaped)
   |       raise ParseError(UnexpectedSequence(token.to_owned(), skip)) (escaped)
   |     Continue({ checkpoint: cp, .. }) => raise ParseError(UnexpectedEnd(cp)) (escaped)

<WORKDIR>/src/lib/json.mbt:41:5-41:13:
   |     Continue({ stack: [], checkpoint: Checkpoint::NumberD(n), .. }) => Json(n)
   |     Continue({ checkpoint: Checkpoint::FloatError(token, skip), .. }) => (escaped)
   |       raise ParseError(UnexpectedSequence(token.to_owned(), skip)) (escaped)
41 |     Continue({ checkpoint: cp, .. }) => raise ParseError(UnexpectedEnd(cp))
   |     ^^^^^^^^ (escaped)
   |   } (escaped)
   | } (escaped)

<WORKDIR>/src/lib/json.mbt:623:12-623:20:
    |   let original_size = original.length() (escaped)
    |   if original_size <= required_size { (escaped)
    |     let rest = original[skip:] (escaped)
623 |     Value::Continue(ContinueValue::{
    |            ^^^^^^^^ (escaped)
    |       rest, (escaped)
    |       arr_acc, (escaped)

<WORKDIR>/src/tests/incr.mbt:10:24-10:32:
   | fn continue_chunks(chunks : ArrayView[String], value : Value) -> Value raise {
   |   match (chunks, value) {
   |     ([], value) => value
10 |     ([chunk, .. rest], Continue(state)) =>
   |                        ^^^^^^^^
   |       continue_chunks(rest, decode_continue(chunk, state))
   |     ([_, ..], Finish(_)) =>

<WORKDIR>/src/tests/incr.mbt:41:5-41:13:
   |         ", got " +
   |         String::from_array([..rest]),
   |       )
41 |     Continue(_) => incr_fail("expected chunked JSON to finish: " + name)
   |     ^^^^^^^^
   |   }
   | }

<WORKDIR>/src/tests/incr.mbt:57:5-57:13:
   |         "expected chunked parser rejection, got non-parser error: " + name,
   |       )
   |   } noraise {
57 |     Continue(_) =>
   |     ^^^^^^^^
   |       incr_fail("expected chunked parser rejection, got continuation: " + name)
   |     Finish(_) =>

<WORKDIR>/src/tests/incr.mbt:139:5-139:13:
    |       @debug.assert_eq(value, Json::object({ "a": Json::number(1.0) }))
    |       assert_eq(String::from_array([..rest]), " trailing")
    |     }
139 |     Continue(_) =>
    |     ^^^^^^^^
    |       incr_fail("expected chunked parser to finish with trailing rest")
    |   }

```
