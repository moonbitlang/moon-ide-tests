# toml-parser find-references s toml_to_string.mbt:3:23

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\toml-parser' moon ide find-references 's' --loc 'toml_to_string.mbt:3:23'
Found 1 references for symbol 's':
<WORKDIR>/toml_to_string.mbt:5:15-5:16:
  | /// Helper function to escape strings according to TOML spec
  | fn escape_toml_string(s : String) -> String {
  |   let result = StringBuilder()
5 |   for char in s {
  |               ^
  |     match char {
  |       '\b' => result <+ "\\b"

```
