# json find-references incr_fail src\tests\incr.mbt:2:4

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\json' moon ide find-references 'incr_fail' --loc 'src\tests\incr.mbt:2:4'
Found 7 references for symbol 'incr_fail':
<WORKDIR>/src\tests\incr.mbt:2:4-2:13:
  | ///|
2 | fn incr_fail(message : String) -> Unit raise {
  |    ^^^^^^^^^
  |   raise InspectError::InspectError(message)
  | }

<WORKDIR>/src\tests\incr.mbt:35:7-35:16:
   |   match decode_chunks(chunks) {
   |     Finish({ value, rest: [], .. }) => @debug.assert_eq(value, expected)
   |     Finish({ rest, .. }) =>
35 |       incr_fail(
   |       ^^^^^^^^^
   |         "expected chunked JSON without trailing bytes: " +
   |         name +

<WORKDIR>/src\tests\incr.mbt:41:20-41:29:
   |         ", got " +
   |         String::from_array([..rest]),
   |       )
41 |     Continue(_) => incr_fail("expected chunked JSON to finish: " + name)
   |                    ^^^^^^^^^
   |   }
   | }

<WORKDIR>/src\tests\incr.mbt:53:7-53:16:
   |   try decode_chunks(chunks) catch {
   |     @lib.ParseError(_) => () (escaped)
   |     _ =>
53 |       incr_fail(
   |       ^^^^^^^^^
   |         "expected chunked parser rejection, got non-parser error: " + name,
   |       )

<WORKDIR>/src\tests\incr.mbt:58:7-58:16:
   |       )
   |   } noraise {
   |     Continue(_) =>
58 |       incr_fail("expected chunked parser rejection, got continuation: " + name)
   |       ^^^^^^^^^
   |     Finish(_) =>
   |       incr_fail("expected chunked parser rejection, parser accepted: " + name)

<WORKDIR>/src\tests\incr.mbt:60:7-60:16:
   |     Continue(_) =>
   |       incr_fail("expected chunked parser rejection, got continuation: " + name)
   |     Finish(_) =>
60 |       incr_fail("expected chunked parser rejection, parser accepted: " + name)
   |       ^^^^^^^^^
   |   }
   | }

<WORKDIR>/src\tests\incr.mbt:140:7-140:16:
    |       assert_eq(String::from_array([..rest]), " trailing")
    |     }
    |     Continue(_) =>
140 |       incr_fail("expected chunked parser to finish with trailing rest")
    |       ^^^^^^^^^
    |   }
    | }

```
