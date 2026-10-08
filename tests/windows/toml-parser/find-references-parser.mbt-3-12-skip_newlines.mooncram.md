# toml-parser find-references skip_newlines parser.mbt:3:12

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\toml-parser' moon ide find-references 'skip_newlines' --loc 'parser.mbt:3:12'
Found 5 references for symbol 'skip_newlines':
<WORKDIR>/parser.mbt:166:8-166:21:
    | /// No trailing comma allowed unlike Array
    | fn Parser::parse_inline_table(self : Parser) -> TomlValue raise {
    |   let table = Map([])
166 |   self.skip_newlines() // TOML 1.1: allow newlines in inline tables
    |        ^^^^^^^^^^^^^
    |   if self.view() is [RightBrace, .. rest] {
    |     self.update_view(rest)

<WORKDIR>/parser.mbt:173:10-173:23:
    |     return TomlTable(table)
    |   }
    |   while true {
173 |     self.skip_newlines()
    |          ^^^^^^^^^^^^^
    |     // Parse dotted key
    |     let key_path = self.parse_dotted_key()

<WORKDIR>/parser.mbt:188:10-188:23:
    |     set_dotted_key_value(table, key_path, value) catch {
    |       error => self.error("\{error}")
    |     }
188 |     self.skip_newlines()
    |          ^^^^^^^^^^^^^
    |     match self.view() {
    |       [Comma, .. rest] => {

<WORKDIR>/parser.mbt:192:14-192:27:
    |     match self.view() {
    |       [Comma, .. rest] => {
    |         self.update_view(rest)
192 |         self.skip_newlines()
    |              ^^^^^^^^^^^^^
    |         // Trailing comma: check for closing brace after comma
    |         if self.view() is [RightBrace, .. rest2] {

<WORKDIR>/parser.mbt:338:12-338:25:
    |   let parser = Parser::Parser(tokens)
    |   let main_table = Map([])
    |   for current_table = main_table {
338 |     parser.skip_newlines()
    |            ^^^^^^^^^^^^^
    |     match parser.view() {
    |       [EOF, ..] => break

```
