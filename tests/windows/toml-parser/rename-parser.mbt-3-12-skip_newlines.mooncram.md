# toml-parser rename skip_newlines parser.mbt:3:12

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\toml-parser' moon ide rename 'skip_newlines' 'skip_newlines_renamed' --loc 'parser.mbt:3:12'
*** Begin Patch
*** Update File: <WORKDIR>/parser.mbt
@@
 ///|
 /// Skip newline tokens
-fn Parser::skip_newlines(self : Parser) -> Unit {
+fn Parser::skip_newlines_renamed(self : Parser) -> Unit {
   let next_view = for view = self.view() {
     match view {
       [Newline(..), .. rest] => continue rest
@@
 /// No trailing comma allowed unlike Array
 fn Parser::parse_inline_table(self : Parser) -> TomlValue raise {
   let table = {}
-  self.skip_newlines() // TOML 1.1: allow newlines in inline tables
+  self.skip_newlines_renamed() // TOML 1.1: allow newlines in inline tables
   if self.view() is [RightBrace, .. rest] {
     self.update_view(rest)
     table[inline_table_marker] = TomlBoolean(true)
@@
     return TomlTable(table)
   }
   while true {
-    self.skip_newlines()
+    self.skip_newlines_renamed()
     // Parse dotted key
     let key_path = self.parse_dotted_key()
 
@@
     set_dotted_key_value(table, key_path, value) catch {
       error => self.error(error.to_string())
     }
-    self.skip_newlines()
+    self.skip_newlines_renamed()
     match self.view() {
       [Comma, .. rest] => {
         self.update_view(rest)
-        self.skip_newlines()
+        self.skip_newlines_renamed()
         // Trailing comma: check for closing brace after comma
         if self.view() is [RightBrace, .. rest2] {
           self.update_view(rest2)
@@
   let parser = Parser::Parser(tokens)
   let main_table = {}
   for current_table = main_table {
-    parser.skip_newlines()
+    parser.skip_newlines_renamed()
     match parser.view() {
       [EOF, ..] => break
       [LeftBracket(loc=loc1), LeftBracket(loc=loc2), .. rest] => {
*** End Patch

```
