# json find-references Continue src\lib\value.mbt:3:3

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\json' moon ide find-references 'Continue' --loc 'src\lib\value.mbt:3:3'
Found 10 references for symbol 'Continue':
<WORKDIR>/src\lib\json.mbt:37:5-37:13:
   |   match value(ctx) {
   |     Finish({ value, rest: [], .. }) => value
   |     Finish({ rest, .. }) => raise invalid_byte([..rest], 0)
37 |     Continue({ stack: [], checkpoint: Checkpoint::NumberI(n), .. }) =>
   |     ^^^^^^^^
   |       n.to_json()
   |     Continue({ stack: [], checkpoint: Checkpoint::NumberD(n), .. }) =>

<WORKDIR>/src\lib\json.mbt:39:5-39:13:
   |     Finish({ rest, .. }) => raise invalid_byte([..rest], 0)
   |     Continue({ stack: [], checkpoint: Checkpoint::NumberI(n), .. }) =>
   |       n.to_json()
39 |     Continue({ stack: [], checkpoint: Checkpoint::NumberD(n), .. }) =>
   |     ^^^^^^^^
   |       n.to_json()
   |     Continue({ checkpoint: Checkpoint::FloatError(token, skip), .. }) =>

<WORKDIR>/src\lib\json.mbt:41:5-41:13:
   |       n.to_json()
   |     Continue({ stack: [], checkpoint: Checkpoint::NumberD(n), .. }) =>
   |       n.to_json()
41 |     Continue({ checkpoint: Checkpoint::FloatError(token, skip), .. }) =>
   |     ^^^^^^^^
   |       raise ParseError(UnexpectedSequence(token.to_owned(), skip))
   |     Continue({ checkpoint: cp, .. }) => raise ParseError(UnexpectedEnd(cp))

<WORKDIR>/src\lib\json.mbt:43:5-43:13:
   |       n.to_json()
   |     Continue({ checkpoint: Checkpoint::FloatError(token, skip), .. }) =>
   |       raise ParseError(UnexpectedSequence(token.to_owned(), skip))
43 |     Continue({ checkpoint: cp, .. }) => raise ParseError(UnexpectedEnd(cp))
   |     ^^^^^^^^
   |   }
   | }

<WORKDIR>/src\lib\json.mbt:625:12-625:20:
    |   let original_size = original.length()
    |   if original_size <= required_size {
    |     let rest = original[skip:]
625 |     Value::Continue(ContinueValue::{
    |            ^^^^^^^^
    |       rest,
    |       arr_acc,

<WORKDIR>/src\lib\value.mbt:3:3-3:11:
  | ///|
  | pub enum Value {
3 |   Continue(ContinueValue)
  |   ^^^^^^^^
  |   Finish(FinishValue)
  | }

<WORKDIR>/src\tests\incr.mbt:10:24-10:32:
   | fn continue_chunks(chunks : ArrayView[String], value : Value) -> Value raise {
   |   match (chunks, value) {
   |     ([], value) => value
10 |     ([chunk, .. rest], Continue(state)) =>
   |                        ^^^^^^^^
   |       continue_chunks(rest, decode_continue(chunk, state))
   |     ([_, ..], Finish(_)) =>

<WORKDIR>/src\tests\incr.mbt:41:5-41:13:
   |         ", got " +
   |         String::from_array([..rest]),
   |       )
41 |     Continue(_) => incr_fail("expected chunked JSON to finish: " + name)
   |     ^^^^^^^^
   |   }
   | }

<WORKDIR>/src\tests\incr.mbt:57:5-57:13:
   |         "expected chunked parser rejection, got non-parser error: " + name,
   |       )
   |   } noraise {
57 |     Continue(_) =>
   |     ^^^^^^^^
   |       incr_fail("expected chunked parser rejection, got continuation: " + name)
   |     Finish(_) =>

<WORKDIR>/src\tests\incr.mbt:139:5-139:13:
    |       @debug.assert_eq(value, Json::object({ "a": Json::number(1.0) }))
    |       assert_eq(String::from_array([..rest]), " trailing")
    |     }
139 |     Continue(_) =>
    |     ^^^^^^^^
    |       incr_fail("expected chunked parser to finish with trailing rest")
    |   }

```
