# json find-references message src\tests\incr.mbt:2:14

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\json' moon ide find-references 'message' --loc 'src\tests\incr.mbt:2:14'
Found 2 references for symbol 'message':
<WORKDIR>/src\tests\incr.mbt:2:14-2:21:
  | ///|
2 | fn incr_fail(message : String) -> Unit raise {
  |              ^^^^^^^
  |   raise InspectError::InspectError(message)
  | }

<WORKDIR>/src\tests\incr.mbt:3:36-3:43:
  | ///|
  | fn incr_fail(message : String) -> Unit raise {
3 |   raise InspectError::InspectError(message)
  |                                    ^^^^^^^
  | }
  | 

```
