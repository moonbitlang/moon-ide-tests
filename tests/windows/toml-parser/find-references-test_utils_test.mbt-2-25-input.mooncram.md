# toml-parser find-references input test_utils_test.mbt:2:25

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\toml-parser' moon ide find-references 'input' --loc 'test_utils_test.mbt:2:25'
Found 2 references for symbol 'input':
<WORKDIR>/test_utils_test.mbt:2:25-2:30:
  | ///|
2 | fn parse_expect_to_fail(input : String) -> String {
  |                         ^^^^^
  |   try @toml.parse(input) catch {
  |     e => {

<WORKDIR>/test_utils_test.mbt:3:19-3:24:
  | ///|
  | fn parse_expect_to_fail(input : String) -> String {
3 |   try @toml.parse(input) catch {
  |                   ^^^^^
  |     e => {
  |       let s = e.to_string()

```
