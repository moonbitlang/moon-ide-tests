# toml-parser rename Parser parser.mbt:3:4

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\toml-parser' moon ide rename 'Parser' 'ParserRenamed' --loc 'parser.mbt:3:4'
*** Begin Patch
*** Update File: <WORKDIR>/parser.mbt
@@
 ///|
 /// Skip newline tokens
-fn Parser::skip_newlines(self : Parser) -> Unit {
+fn ParserRenamed::skip_newlines(self : ParserRenamed) -> Unit {
   let next_view = for view = self.view() {
     match view {
       [Newline(..), .. rest] => continue rest
@@
 /// Try to consume a single bare key from the current position.
 /// Handles identifiers, strings, integers, booleans (true/false),
 /// and special float keywords (inf/nan) in key position.
-fn Parser::try_parse_single_key(self : Parser) -> String? {
+fn ParserRenamed::try_parse_single_key(self : ParserRenamed) -> String? {
   match self.view() {
     [Identifier(name, ..), .. rest] => {
       self.update_view(rest)
@@
 
 ///|
 /// Parse a primary value (string, number, boolean)
-fn Parser::parse_value(
+fn ParserRenamed::parse_value(
   self : Self,
   skip_newlines? : Bool = false,
 ) -> TomlValue raise {
@@
 
 ///|
 /// Parse an array [1, 2, 3]
-fn Parser::parse_array(self : Self) -> TomlValue raise {
+fn ParserRenamed::parse_array(self : Self) -> TomlValue raise {
   let values = []
   while true {
     if self.view(skip_newlines=true) is [RightBracket, .. rest] {
@@
 ///|
 /// Parse an inline table {key = value, key2 = value2}
 /// No trailing comma allowed unlike Array
-fn Parser::parse_inline_table(self : Parser) -> TomlValue raise {
+fn ParserRenamed::parse_inline_table(self : ParserRenamed) -> TomlValue raise {
   let table = {}
   self.skip_newlines() // TOML 1.1: allow newlines in inline tables
   if self.view() is [RightBrace, .. rest] {
@@
 
 ///|
 /// Parse a table path: section.subsection.key
-fn Parser::parse_table_path(self : Parser) -> Array[String] raise {
+fn ParserRenamed::parse_table_path(self : ParserRenamed) -> Array[String] raise {
   self.parse_dotted_key()
 }
 
 ///|
-fn[A] Parser::error(self : Parser, msg : String) -> A raise {
+fn[A] ParserRenamed::error(self : ParserRenamed, msg : String) -> A raise {
   match self.view() {
     [token, ..] => fail("\{msg} at \{@debug.to_string(token.loc())}")
     [] => fail("\{msg} at the end of input")
@@
 
 ///|
 /// Parse a dotted key path: key.subkey.subsubkey
-fn Parser::parse_dotted_key(self : Parser) -> Array[String] raise {
+fn ParserRenamed::parse_dotted_key(self : ParserRenamed) -> Array[String] raise {
   let path = Array::new()
 
   // Parse first key - handle the case where the tokenizer saw a float like "1.2"
@@
 
 ///|
 /// Parse a key-value pair with dotted key support: key.subkey = value
-fn Parser::parse_key_value(self : Parser) -> (Array[String], TomlValue) raise {
+fn ParserRenamed::parse_key_value(self : ParserRenamed) -> (Array[String], TomlValue) raise {
   // Parse dotted key
   let key_path = self.parse_dotted_key()
 
@@
 /// `Result[TomlValue, Error]` instead.
 pub fn parse(input : String) -> TomlValue raise {
   let tokens = @tokenize.tokenize(input)
-  let parser = Parser::Parser(tokens)
+  let parser = ParserRenamed::ParserRenamed(tokens)
   let main_table = {}
   for current_table = main_table {
     parser.skip_newlines()
*** Update File: <WORKDIR>/parser_wbtest.mbt
@@
 test "parse_dotted_key - simple identifier" {
   // Test parsing a simple identifier key
   let tokens = @tokenize.tokenize("simple")
-  let parser = Parser::Parser(tokens)
+  let parser = ParserRenamed::ParserRenamed(tokens)
   let result = parser.parse_dotted_key()
   debug_inspect(
     result,
@@
 test "parse_dotted_key - dotted identifiers" {
   // Test parsing dotted identifier keys
   let tokens = @tokenize.tokenize("server.host.name")
-  let parser = Parser::Parser(tokens)
+  let parser = ParserRenamed::ParserRenamed(tokens)
   let result = parser.parse_dotted_key()
   debug_inspect(
     result,
@@
 test "parse_dotted_key - string keys" {
   // Test parsing quoted string keys
   let tokens = @tokenize.tokenize("\"quoted key\".\"another quoted\"")
-  let parser = Parser::Parser(tokens)
+  let parser = ParserRenamed::ParserRenamed(tokens)
   let result = parser.parse_dotted_key()
   debug_inspect(
     result,
@@
 test "parse_dotted_key - integer keys" {
   // Test parsing integer keys - note these will be tokenized as floats
   let tokens = @tokenize.tokenize("123.456.789")
-  let parser = Parser::Parser(tokens)
+  let parser = ParserRenamed::ParserRenamed(tokens)
   let result = parser.parse_dotted_key()
   debug_inspect(
     result,
@@
 test "parse_dotted_key - string and integer mixed" {
   // Test parsing string followed by integer
   let tokens = @tokenize.tokenize("\"key\".123")
-  let parser = Parser::Parser(tokens)
+  let parser = ParserRenamed::ParserRenamed(tokens)
   let result = parser.parse_dotted_key()
   debug_inspect(
     result,
@@
 test "parse_dotted_key - mixed key types" {
   // Test parsing mixed key types
   let tokens = @tokenize.tokenize("server.\"port number\".config")
-  let parser = Parser::Parser(tokens)
+  let parser = ParserRenamed::ParserRenamed(tokens)
   let result = parser.parse_dotted_key()
   debug_inspect(
     result,
@@
   // Test the special case where tokenizer sees "1.2" as a float
   // but we need to treat it as dotted keys "1.2"
   let tokens = @tokenize.tokenize("1.2")
-  let parser = Parser::Parser(tokens)
+  let parser = ParserRenamed::ParserRenamed(tokens)
   let result = parser.parse_dotted_key()
   debug_inspect(
     result,
@@
 test "parse_dotted_key - float token with additional dots" {
   // Test float token followed by more dotted keys
   let tokens = @tokenize.tokenize("1.2.config.value")
-  let parser = Parser::Parser(tokens)
+  let parser = ParserRenamed::ParserRenamed(tokens)
   let result = parser.parse_dotted_key()
   debug_inspect(
     result,
@@
   // Test float token that doesn't actually contain a dot (edge case)
   // We'll use a simpler test with a float that gets parsed as a single key
   let tokens = @tokenize.tokenize("42.0")
-  let parser = Parser::Parser(tokens)
+  let parser = ParserRenamed::ParserRenamed(tokens)
   let result = parser.parse_dotted_key()
   debug_inspect(
     result,
@@
 test "parse_dotted_key - complex nested structure" {
   // Test a complex real-world-like dotted key
   let tokens = @tokenize.tokenize("database.connections.\"primary-db\".host")
-  let parser = Parser::Parser(tokens)
+  let parser = ParserRenamed::ParserRenamed(tokens)
   let result = parser.parse_dotted_key()
   debug_inspect(
     result,
@@
 test "parse_dotted_key - single quoted string" {
   // Test single quoted string key
   let tokens = @tokenize.tokenize("\"key\"")
-  let parser = Parser::Parser(tokens)
+  let parser = ParserRenamed::ParserRenamed(tokens)
   let result = parser.parse_dotted_key()
   debug_inspect(
     result,
@@
 test "parse_dotted_key - single integer" {
   // Test single integer key
   let tokens = @tokenize.tokenize("42")
-  let parser = Parser::Parser(tokens)
+  let parser = ParserRenamed::ParserRenamed(tokens)
   let result = parser.parse_dotted_key()
   debug_inspect(
     result,
@@
 test "parse_dotted_key - error cases" {
   // Test error when no key is found
   let tokens = @tokenize.tokenize("=")
-  let parser = Parser::Parser(tokens)
+  let parser = ParserRenamed::ParserRenamed(tokens)
   guard (try parser.parse_dotted_key() catch {
       err => Err(err)
     } noraise {
@@
 test "parse_dotted_key - error after dot" {
   // Test error when dot is followed by invalid token
   let tokens = @tokenize.tokenize("key.=")
-  let parser = Parser::Parser(tokens)
+  let parser = ParserRenamed::ParserRenamed(tokens)
   guard (try parser.parse_dotted_key() catch {
       err => Err(err)
     } noraise {
@@
 test "parse_dotted_key - numeric float with continuation" {
   // Test numeric float like "3.14" followed by more keys
   let tokens = @tokenize.tokenize("3.14.config")
-  let parser = Parser::Parser(tokens)
+  let parser = ParserRenamed::ParserRenamed(tokens)
   let result = parser.parse_dotted_key()
   debug_inspect(
     result,
@@
 test "parse_dotted_key - zero values" {
   // Test with zero values in keys
   let tokens = @tokenize.tokenize("0.0.config")
-  let parser = Parser::Parser(tokens)
+  let parser = ParserRenamed::ParserRenamed(tokens)
   let result = parser.parse_dotted_key()
   debug_inspect(
     result,
*** Update File: <WORKDIR>/toml.mbt
@@
 
 ///|
 /// Parser state (will implement methods later)
-priv struct Parser {
+priv struct ParserRenamed {
   tokens : Array[@tokenize.Token]
   mut position : Int
 }
@@
 /// breaks are insignificant (e.g. between top-level statements). The
 /// parser's position is not advanced — callers commit progress by passing
 /// the consumed tail back through `update_view`.
-fn Parser::view(
+fn ParserRenamed::view(
   self : Self,
   skip_newlines? : Bool = false,
 ) -> ArrayView[@tokenize.Token] {
@@
 /// from that point. The new position is read from the view's start offset
 /// in the underlying token array, so the input must be a slice of
 /// `self.tokens`.
-fn Parser::update_view(
+fn ParserRenamed::update_view(
-  self : Parser,
+  self : ParserRenamed,
   view : ArrayView[@tokenize.Token],
 ) -> Unit {
   let new_offset = view.start() // consistent
@@
 
 ///|
 /// Create a new parser
-fn Parser::Parser(tokens : Array[@tokenize.Token]) -> Parser {
+fn ParserRenamed::ParserRenamed(tokens : Array[@tokenize.Token]) -> ParserRenamed {
   { tokens, position: 0 }
 }
 
@@
     Equals(loc~),
     StringToken("value", loc~, multiline=false),
   ]
-  let parser = Parser::Parser(tokens)
+  let parser = ParserRenamed::ParserRenamed(tokens)
   debug_inspect(parser.position, content="0")
   debug_inspect(parser.tokens.length(), content="3")
 }
*** End Patch

```
