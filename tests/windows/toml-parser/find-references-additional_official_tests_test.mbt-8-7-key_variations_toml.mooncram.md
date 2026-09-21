# toml-parser find-references key_variations_toml additional_official_tests_test.mbt:8:7

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\toml-parser' moon ide find-references 'key_variations_toml' --loc 'additional_official_tests_test.mbt:8:7'
Found 1 references for symbol 'key_variations_toml':
<WORKDIR>/additional_official_tests_test.mbt:17:17-17:36:
   |     #|"ʎǝʞ" = "value"
   |     #|
   |   debug_inspect(
17 |     @toml.parse(key_variations_toml),
   |                 ^^^^^^^^^^^^^^^^^^^
   |     content=(
   |       #|TomlTable(

```
