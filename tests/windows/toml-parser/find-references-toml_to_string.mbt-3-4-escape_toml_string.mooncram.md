# toml-parser find-references escape_toml_string toml_to_string.mbt:3:4

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\toml-parser' moon ide find-references 'escape_toml_string' --loc 'toml_to_string.mbt:3:4'
Found 3 references for symbol 'escape_toml_string':
<WORKDIR>/toml_to_string.mbt:3:4-3:22:
  | ///|
  | /// Helper function to escape strings according to TOML spec
3 | fn escape_toml_string(s : String) -> String {
  |    ^^^^^^^^^^^^^^^^^^
  |   let result = StringBuilder()
  |   for char in s {

<WORKDIR>/toml_to_string.mbt:87:10-87:28:
   | /// Format a key for TOML output
   | fn format_toml_key(key : String) -> String {
   |   if needs_quoting(key) {
87 |     "\"\{escape_toml_string(key)}\""
   |          ^^^^^^^^^^^^^^^^^^
   |   } else {
   |     key

<WORKDIR>/toml_to_string.mbt:134:37-134:55:
    |   path : Array[String], // Current table path for nested tables
    | ) -> Unit {
    |   match self {
134 |     TomlString(s) => output <+ "\"\{escape_toml_string(s)}\""
    |                                     ^^^^^^^^^^^^^^^^^^
    |     TomlInteger(i) => output <+ "\{i}"
    |     TomlFloat(f) =>

```
