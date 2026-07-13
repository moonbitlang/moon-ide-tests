# json find-references input src\tests\json_testsuite_y_test.mbt:8:7

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\json' moon ide find-references 'input' --loc 'src\tests\json_testsuite_y_test.mbt:8:7'
Found 2 references for symbol 'input':
<WORKDIR>/src\tests\json_testsuite_y_test.mbt:8:7-8:12:
  | 
  | ///|
  | test "json_testsuite y_array_arraysWithSpaces" {
8 |   let input = "[[]   ]"
  |       ^^^^^
  |   expect_accept("y_array_arraysWithSpaces.json", input)
  | }

<WORKDIR>/src\tests\json_testsuite_y_test.mbt:9:50-9:55:
  | ///|
  | test "json_testsuite y_array_arraysWithSpaces" {
  |   let input = "[[]   ]"
9 |   expect_accept("y_array_arraysWithSpaces.json", input)
  |                                                  ^^^^^
  | }
  | 

```
