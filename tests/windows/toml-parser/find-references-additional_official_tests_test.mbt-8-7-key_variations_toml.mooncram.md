# toml-parser find-references key_variations_toml additional_official_tests_test.mbt:8:7

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\toml-parser' moon ide find-references 'key_variations_toml' --loc 'additional_official_tests_test.mbt:8:7'
Found 2 references for symbol 'key_variations_toml':
<WORKDIR>/additional_official_tests_test.mbt:8:7-8:26:
  | ///|
  | /// Test key names with various characters
  | test "key name variations" {
8 |   let key_variations_toml =
  |       ^^^^^^^^^^^^^^^^^^^
  |     #|bare_key = "value"
  |     #|bare-key = "value"

<WORKDIR>/additional_official_tests_test.mbt:17:17-17:36:
   |     #|"ʎǝʞ" = "value"
   |     #|
   |   debug_inspect(
17 |     @toml.parse(key_variations_toml),
   |                 ^^^^^^^^^^^^^^^^^^^
   |     content=(
   |       #|TomlTable(

```
