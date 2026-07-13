# json find-references input src\tests\json_testsuite_n_test.mbt:8:7

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\json' moon ide find-references 'input' --loc 'src\tests\json_testsuite_n_test.mbt:8:7'
Found 2 references for symbol 'input':
<WORKDIR>/src\tests\json_testsuite_n_test.mbt:8:7-8:12:
  | 
  | ///|
  | test "json_testsuite n_array_1_true_without_comma" {
8 |   let input = "[1 true]"
  |       ^^^^^
  |   expect_reject("n_array_1_true_without_comma.json", input)
  | }

<WORKDIR>/src\tests\json_testsuite_n_test.mbt:9:54-9:59:
  | ///|
  | test "json_testsuite n_array_1_true_without_comma" {
  |   let input = "[1 true]"
9 |   expect_reject("n_array_1_true_without_comma.json", input)
  |                                                      ^^^^^
  | }
  | 

```
