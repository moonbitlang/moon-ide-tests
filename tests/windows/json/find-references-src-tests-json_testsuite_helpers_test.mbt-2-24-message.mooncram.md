# json find-references message src\tests\json_testsuite_helpers_test.mbt:2:24

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\json' moon ide find-references 'message' --loc 'src\tests\json_testsuite_helpers_test.mbt:2:24'
Found 2 references for symbol 'message':
<WORKDIR>/src\tests\json_testsuite_helpers_test.mbt:2:24-2:31:
  | ///|
2 | fn json_testsuite_fail(message : String) -> Unit raise {
  |                        ^^^^^^^
  |   raise InspectError::InspectError(message)
  | }

<WORKDIR>/src\tests\json_testsuite_helpers_test.mbt:3:36-3:43:
  | ///|
  | fn json_testsuite_fail(message : String) -> Unit raise {
3 |   raise InspectError::InspectError(message)
  |                                    ^^^^^^^
  | }
  | 

```
