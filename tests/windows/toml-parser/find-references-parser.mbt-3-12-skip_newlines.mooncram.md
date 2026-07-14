# toml-parser find-references skip_newlines parser.mbt:3:12

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\toml-parser' moon ide find-references 'skip_newlines' --loc 'parser.mbt:3:12'
Found 6 references for symbol 'skip_newlines':
<WORKDIR>/parser.mbt:3:12-3:25:
  | ///|
  | /// Skip newline tokens
3 | fn Parser::skip_newlines(self : Parser) -> Unit {
  |            ^^^^^^^^^^^^^
  |   let next_view = for view = self.view() {
  |     match view {

<WORKDIR>/parser.mbt:141:8-141:21:
    | /// No trailing comma allowed unlike Array
    | fn Parser::parse_inline_table(self : Parser) -> TomlValue raise {
    |   let table = {}
141 |   self.skip_newlines() // TOML 1.1: allow newlines in inline tables
    |        ^^^^^^^^^^^^^
    |   if self.view() is [RightBrace, .. rest] {
    |     self.update_view(rest)

<WORKDIR>/parser.mbt:148:10-148:23:
    |     return TomlTable(table)
    |   }
    |   while true {
148 |     self.skip_newlines()
    |          ^^^^^^^^^^^^^
    |     // Parse dotted key
    |     let key_path = self.parse_dotted_key()

<WORKDIR>/parser.mbt:163:10-163:23:
    |     set_dotted_key_value(table, key_path, value) catch {
    |       error => self.error(error.to_string())
    |     }
163 |     self.skip_newlines()
    |          ^^^^^^^^^^^^^
    |     match self.view() {
    |       [Comma, .. rest] => {

<WORKDIR>/parser.mbt:167:14-167:27:
    |     match self.view() {
    |       [Comma, .. rest] => {
    |         self.update_view(rest)
167 |         self.skip_newlines()
    |              ^^^^^^^^^^^^^
    |         // Trailing comma: check for closing brace after comma
    |         if self.view() is [RightBrace, .. rest2] {

<WORKDIR>/parser.mbt:305:12-305:25:
    |   let parser = Parser::Parser(tokens)
    |   let main_table = {}
    |   for current_table = main_table {
305 |     parser.skip_newlines()
    |            ^^^^^^^^^^^^^
    |     match parser.view() {
    |       [EOF, ..] => break

```
