# toml-parser find-references Parser parser.mbt:3:4

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\toml-parser' moon ide find-references 'Parser' --loc 'parser.mbt:3:4'
Found 59 references for symbol 'Parser':
<WORKDIR>/parser.mbt:3:4-3:10:
  | ///|
  | /// Skip newline tokens
3 | fn Parser::skip_newlines(self : Parser) -> Unit {
  |    ^^^^^^
  |   let next_view = for view = self.view() {
  |     match view {

<WORKDIR>/parser.mbt:3:33-3:39:
  | ///|
  | /// Skip newline tokens
3 | fn Parser::skip_newlines(self : Parser) -> Unit {
  |                                 ^^^^^^
  |   let next_view = for view = self.view() {
  |     match view {

<WORKDIR>/parser.mbt:17:4-17:10:
   | /// Try to consume a single bare key from the current position.
   | /// Handles identifiers, strings, integers, booleans (true/false),
   | /// and special float keywords (inf/nan) in key position.
17 | fn Parser::try_parse_single_key(self : Parser) -> String? {
   |    ^^^^^^
   |   match self.view() {
   |     [Identifier(name, ..), .. rest] => {

<WORKDIR>/parser.mbt:17:40-17:46:
   | /// Try to consume a single bare key from the current position.
   | /// Handles identifiers, strings, integers, booleans (true/false),
   | /// and special float keywords (inf/nan) in key position.
17 | fn Parser::try_parse_single_key(self : Parser) -> String? {
   |                                        ^^^^^^
   |   match self.view() {
   |     [Identifier(name, ..), .. rest] => {

<WORKDIR>/parser.mbt:55:4-55:10:
   | 
   | ///|
   | /// Parse a primary value (string, number, boolean)
55 | fn Parser::parse_value(
   |    ^^^^^^
   |   self : Self,
   |   skip_newlines? : Bool = false,

<WORKDIR>/parser.mbt:115:4-115:10:
    | 
    | ///|
    | /// Parse an array [1, 2, 3]
115 | fn Parser::parse_array(self : Self) -> TomlValue raise {
    |    ^^^^^^
    |   let values = []
    |   while true {

<WORKDIR>/parser.mbt:139:4-139:10:
    | ///|
    | /// Parse an inline table {key = value, key2 = value2}
    | /// No trailing comma allowed unlike Array
139 | fn Parser::parse_inline_table(self : Parser) -> TomlValue raise {
    |    ^^^^^^
    |   let table = {}
    |   self.skip_newlines() // TOML 1.1: allow newlines in inline tables

<WORKDIR>/parser.mbt:139:38-139:44:
    | ///|
    | /// Parse an inline table {key = value, key2 = value2}
    | /// No trailing comma allowed unlike Array
139 | fn Parser::parse_inline_table(self : Parser) -> TomlValue raise {
    |                                      ^^^^^^
    |   let table = {}
    |   self.skip_newlines() // TOML 1.1: allow newlines in inline tables

<WORKDIR>/parser.mbt:187:4-187:10:
    | 
    | ///|
    | /// Parse a table path: section.subsection.key
187 | fn Parser::parse_table_path(self : Parser) -> Array[String] raise {
    |    ^^^^^^
    |   self.parse_dotted_key()
    | }

<WORKDIR>/parser.mbt:187:36-187:42:
    | 
    | ///|
    | /// Parse a table path: section.subsection.key
187 | fn Parser::parse_table_path(self : Parser) -> Array[String] raise {
    |                                    ^^^^^^
    |   self.parse_dotted_key()
    | }

<WORKDIR>/parser.mbt:192:7-192:13:
    | }
    | 
    | ///|
192 | fn[A] Parser::error(self : Parser, msg : String) -> A raise {
    |       ^^^^^^
    |   match self.view() {
    |     [token, ..] => fail("\{msg} at \{@debug.to_string(token.loc())}")

<WORKDIR>/parser.mbt:192:28-192:34:
    | }
    | 
    | ///|
192 | fn[A] Parser::error(self : Parser, msg : String) -> A raise {
    |                            ^^^^^^
    |   match self.view() {
    |     [token, ..] => fail("\{msg} at \{@debug.to_string(token.loc())}")

<WORKDIR>/parser.mbt:201:4-201:10:
    | 
    | ///|
    | /// Parse a dotted key path: key.subkey.subsubkey
201 | fn Parser::parse_dotted_key(self : Parser) -> Array[String] raise {
    |    ^^^^^^
    |   let path = Array::new()
    | 

<WORKDIR>/parser.mbt:201:36-201:42:
    | 
    | ///|
    | /// Parse a dotted key path: key.subkey.subsubkey
201 | fn Parser::parse_dotted_key(self : Parser) -> Array[String] raise {
    |                                    ^^^^^^
    |   let path = Array::new()
    | 

<WORKDIR>/parser.mbt:260:4-260:10:
    | 
    | ///|
    | /// Parse a key-value pair with dotted key support: key.subkey = value
260 | fn Parser::parse_key_value(self : Parser) -> (Array[String], TomlValue) raise {
    |    ^^^^^^
    |   // Parse dotted key
    |   let key_path = self.parse_dotted_key()

<WORKDIR>/parser.mbt:260:35-260:41:
    | 
    | ///|
    | /// Parse a key-value pair with dotted key support: key.subkey = value
260 | fn Parser::parse_key_value(self : Parser) -> (Array[String], TomlValue) raise {
    |                                   ^^^^^^
    |   // Parse dotted key
    |   let key_path = self.parse_dotted_key()

<WORKDIR>/parser.mbt:302:16-302:22:
    | /// `Result[TomlValue, Error]` instead.
    | pub fn parse(input : String) -> TomlValue raise {
    |   let tokens = @tokenize.tokenize(input)
302 |   let parser = Parser::Parser(tokens)
    |                ^^^^^^
    |   let main_table = {}
    |   for current_table = main_table {

<WORKDIR>/parser.mbt:302:24-302:30:
    | /// `Result[TomlValue, Error]` instead.
    | pub fn parse(input : String) -> TomlValue raise {
    |   let tokens = @tokenize.tokenize(input)
302 |   let parser = Parser::Parser(tokens)
    |                        ^^^^^^
    |   let main_table = {}
    |   for current_table = main_table {

<WORKDIR>/parser_wbtest.mbt:8:16-8:22:
  | test "parse_dotted_key - simple identifier" {
  |   // Test parsing a simple identifier key
  |   let tokens = @tokenize.tokenize("simple")
8 |   let parser = Parser::Parser(tokens)
  |                ^^^^^^
  |   let result = parser.parse_dotted_key()
  |   debug_inspect(

<WORKDIR>/parser_wbtest.mbt:8:24-8:30:
  | test "parse_dotted_key - simple identifier" {
  |   // Test parsing a simple identifier key
  |   let tokens = @tokenize.tokenize("simple")
8 |   let parser = Parser::Parser(tokens)
  |                        ^^^^^^
  |   let result = parser.parse_dotted_key()
  |   debug_inspect(

<WORKDIR>/parser_wbtest.mbt:22:16-22:22:
   | test "parse_dotted_key - dotted identifiers" {
   |   // Test parsing dotted identifier keys
   |   let tokens = @tokenize.tokenize("server.host.name")
22 |   let parser = Parser::Parser(tokens)
   |                ^^^^^^
   |   let result = parser.parse_dotted_key()
   |   debug_inspect(

<WORKDIR>/parser_wbtest.mbt:22:24-22:30:
   | test "parse_dotted_key - dotted identifiers" {
   |   // Test parsing dotted identifier keys
   |   let tokens = @tokenize.tokenize("server.host.name")
22 |   let parser = Parser::Parser(tokens)
   |                        ^^^^^^
   |   let result = parser.parse_dotted_key()
   |   debug_inspect(

<WORKDIR>/parser_wbtest.mbt:36:16-36:22:
   | test "parse_dotted_key - string keys" {
   |   // Test parsing quoted string keys
   |   let tokens = @tokenize.tokenize("\"quoted key\".\"another quoted\"")
36 |   let parser = Parser::Parser(tokens)
   |                ^^^^^^
   |   let result = parser.parse_dotted_key()
   |   debug_inspect(

<WORKDIR>/parser_wbtest.mbt:36:24-36:30:
   | test "parse_dotted_key - string keys" {
   |   // Test parsing quoted string keys
   |   let tokens = @tokenize.tokenize("\"quoted key\".\"another quoted\"")
36 |   let parser = Parser::Parser(tokens)
   |                        ^^^^^^
   |   let result = parser.parse_dotted_key()
   |   debug_inspect(

<WORKDIR>/parser_wbtest.mbt:50:16-50:22:
   | test "parse_dotted_key - integer keys" {
   |   // Test parsing integer keys - note these will be tokenized as floats
   |   let tokens = @tokenize.tokenize("123.456.789")
50 |   let parser = Parser::Parser(tokens)
   |                ^^^^^^
   |   let result = parser.parse_dotted_key()
   |   debug_inspect(

<WORKDIR>/parser_wbtest.mbt:50:24-50:30:
   | test "parse_dotted_key - integer keys" {
   |   // Test parsing integer keys - note these will be tokenized as floats
   |   let tokens = @tokenize.tokenize("123.456.789")
50 |   let parser = Parser::Parser(tokens)
   |                        ^^^^^^
   |   let result = parser.parse_dotted_key()
   |   debug_inspect(

<WORKDIR>/parser_wbtest.mbt:64:16-64:22:
   | test "parse_dotted_key - string and integer mixed" {
   |   // Test parsing string followed by integer
   |   let tokens = @tokenize.tokenize("\"key\".123")
64 |   let parser = Parser::Parser(tokens)
   |                ^^^^^^
   |   let result = parser.parse_dotted_key()
   |   debug_inspect(

<WORKDIR>/parser_wbtest.mbt:64:24-64:30:
   | test "parse_dotted_key - string and integer mixed" {
   |   // Test parsing string followed by integer
   |   let tokens = @tokenize.tokenize("\"key\".123")
64 |   let parser = Parser::Parser(tokens)
   |                        ^^^^^^
   |   let result = parser.parse_dotted_key()
   |   debug_inspect(

<WORKDIR>/parser_wbtest.mbt:78:16-78:22:
   | test "parse_dotted_key - mixed key types" {
   |   // Test parsing mixed key types
   |   let tokens = @tokenize.tokenize("server.\"port number\".config")
78 |   let parser = Parser::Parser(tokens)
   |                ^^^^^^
   |   let result = parser.parse_dotted_key()
   |   debug_inspect(

<WORKDIR>/parser_wbtest.mbt:78:24-78:30:
   | test "parse_dotted_key - mixed key types" {
   |   // Test parsing mixed key types
   |   let tokens = @tokenize.tokenize("server.\"port number\".config")
78 |   let parser = Parser::Parser(tokens)
   |                        ^^^^^^
   |   let result = parser.parse_dotted_key()
   |   debug_inspect(

<WORKDIR>/parser_wbtest.mbt:93:16-93:22:
   |   // Test the special case where tokenizer sees "1.2" as a float
   |   // but we need to treat it as dotted keys "1.2"
   |   let tokens = @tokenize.tokenize("1.2")
93 |   let parser = Parser::Parser(tokens)
   |                ^^^^^^
   |   let result = parser.parse_dotted_key()
   |   debug_inspect(

<WORKDIR>/parser_wbtest.mbt:93:24-93:30:
   |   // Test the special case where tokenizer sees "1.2" as a float
   |   // but we need to treat it as dotted keys "1.2"
   |   let tokens = @tokenize.tokenize("1.2")
93 |   let parser = Parser::Parser(tokens)
   |                        ^^^^^^
   |   let result = parser.parse_dotted_key()
   |   debug_inspect(

<WORKDIR>/parser_wbtest.mbt:107:16-107:22:
    | test "parse_dotted_key - float token with additional dots" {
    |   // Test float token followed by more dotted keys
    |   let tokens = @tokenize.tokenize("1.2.config.value")
107 |   let parser = Parser::Parser(tokens)
    |                ^^^^^^
    |   let result = parser.parse_dotted_key()
    |   debug_inspect(

<WORKDIR>/parser_wbtest.mbt:107:24-107:30:
    | test "parse_dotted_key - float token with additional dots" {
    |   // Test float token followed by more dotted keys
    |   let tokens = @tokenize.tokenize("1.2.config.value")
107 |   let parser = Parser::Parser(tokens)
    |                        ^^^^^^
    |   let result = parser.parse_dotted_key()
    |   debug_inspect(

<WORKDIR>/parser_wbtest.mbt:122:16-122:22:
    |   // Test float token that doesn't actually contain a dot (edge case)
    |   // We'll use a simpler test with a float that gets parsed as a single key
    |   let tokens = @tokenize.tokenize("42.0")
122 |   let parser = Parser::Parser(tokens)
    |                ^^^^^^
    |   let result = parser.parse_dotted_key()
    |   debug_inspect(

<WORKDIR>/parser_wbtest.mbt:122:24-122:30:
    |   // Test float token that doesn't actually contain a dot (edge case)
    |   // We'll use a simpler test with a float that gets parsed as a single key
    |   let tokens = @tokenize.tokenize("42.0")
122 |   let parser = Parser::Parser(tokens)
    |                        ^^^^^^
    |   let result = parser.parse_dotted_key()
    |   debug_inspect(

<WORKDIR>/parser_wbtest.mbt:136:16-136:22:
    | test "parse_dotted_key - complex nested structure" {
    |   // Test a complex real-world-like dotted key
    |   let tokens = @tokenize.tokenize("database.connections.\"primary-db\".host")
136 |   let parser = Parser::Parser(tokens)
    |                ^^^^^^
    |   let result = parser.parse_dotted_key()
    |   debug_inspect(

<WORKDIR>/parser_wbtest.mbt:136:24-136:30:
    | test "parse_dotted_key - complex nested structure" {
    |   // Test a complex real-world-like dotted key
    |   let tokens = @tokenize.tokenize("database.connections.\"primary-db\".host")
136 |   let parser = Parser::Parser(tokens)
    |                        ^^^^^^
    |   let result = parser.parse_dotted_key()
    |   debug_inspect(

<WORKDIR>/parser_wbtest.mbt:150:16-150:22:
    | test "parse_dotted_key - single quoted string" {
    |   // Test single quoted string key
    |   let tokens = @tokenize.tokenize("\"key\"")
150 |   let parser = Parser::Parser(tokens)
    |                ^^^^^^
    |   let result = parser.parse_dotted_key()
    |   debug_inspect(

<WORKDIR>/parser_wbtest.mbt:150:24-150:30:
    | test "parse_dotted_key - single quoted string" {
    |   // Test single quoted string key
    |   let tokens = @tokenize.tokenize("\"key\"")
150 |   let parser = Parser::Parser(tokens)
    |                        ^^^^^^
    |   let result = parser.parse_dotted_key()
    |   debug_inspect(

<WORKDIR>/parser_wbtest.mbt:164:16-164:22:
    | test "parse_dotted_key - single integer" {
    |   // Test single integer key
    |   let tokens = @tokenize.tokenize("42")
164 |   let parser = Parser::Parser(tokens)
    |                ^^^^^^
    |   let result = parser.parse_dotted_key()
    |   debug_inspect(

<WORKDIR>/parser_wbtest.mbt:164:24-164:30:
    | test "parse_dotted_key - single integer" {
    |   // Test single integer key
    |   let tokens = @tokenize.tokenize("42")
164 |   let parser = Parser::Parser(tokens)
    |                        ^^^^^^
    |   let result = parser.parse_dotted_key()
    |   debug_inspect(

<WORKDIR>/parser_wbtest.mbt:178:16-178:22:
    | test "parse_dotted_key - error cases" {
    |   // Test error when no key is found
    |   let tokens = @tokenize.tokenize("=")
178 |   let parser = Parser::Parser(tokens)
    |                ^^^^^^
    |   guard (try parser.parse_dotted_key() catch {
    |       err => Err(err)

<WORKDIR>/parser_wbtest.mbt:178:24-178:30:
    | test "parse_dotted_key - error cases" {
    |   // Test error when no key is found
    |   let tokens = @tokenize.tokenize("=")
178 |   let parser = Parser::Parser(tokens)
    |                        ^^^^^^
    |   guard (try parser.parse_dotted_key() catch {
    |       err => Err(err)

<WORKDIR>/parser_wbtest.mbt:203:16-203:22:
    | test "parse_dotted_key - error after dot" {
    |   // Test error when dot is followed by invalid token
    |   let tokens = @tokenize.tokenize("key.=")
203 |   let parser = Parser::Parser(tokens)
    |                ^^^^^^
    |   guard (try parser.parse_dotted_key() catch {
    |       err => Err(err)

<WORKDIR>/parser_wbtest.mbt:203:24-203:30:
    | test "parse_dotted_key - error after dot" {
    |   // Test error when dot is followed by invalid token
    |   let tokens = @tokenize.tokenize("key.=")
203 |   let parser = Parser::Parser(tokens)
    |                        ^^^^^^
    |   guard (try parser.parse_dotted_key() catch {
    |       err => Err(err)

<WORKDIR>/parser_wbtest.mbt:228:16-228:22:
    | test "parse_dotted_key - numeric float with continuation" {
    |   // Test numeric float like "3.14" followed by more keys
    |   let tokens = @tokenize.tokenize("3.14.config")
228 |   let parser = Parser::Parser(tokens)
    |                ^^^^^^
    |   let result = parser.parse_dotted_key()
    |   debug_inspect(

<WORKDIR>/parser_wbtest.mbt:228:24-228:30:
    | test "parse_dotted_key - numeric float with continuation" {
    |   // Test numeric float like "3.14" followed by more keys
    |   let tokens = @tokenize.tokenize("3.14.config")
228 |   let parser = Parser::Parser(tokens)
    |                        ^^^^^^
    |   let result = parser.parse_dotted_key()
    |   debug_inspect(

<WORKDIR>/parser_wbtest.mbt:242:16-242:22:
    | test "parse_dotted_key - zero values" {
    |   // Test with zero values in keys
    |   let tokens = @tokenize.tokenize("0.0.config")
242 |   let parser = Parser::Parser(tokens)
    |                ^^^^^^
    |   let result = parser.parse_dotted_key()
    |   debug_inspect(

<WORKDIR>/parser_wbtest.mbt:242:24-242:30:
    | test "parse_dotted_key - zero values" {
    |   // Test with zero values in keys
    |   let tokens = @tokenize.tokenize("0.0.config")
242 |   let parser = Parser::Parser(tokens)
    |                        ^^^^^^
    |   let result = parser.parse_dotted_key()
    |   debug_inspect(

<WORKDIR>/toml.mbt:34:13-34:19:
   | 
   | ///|
   | /// Parser state (will implement methods later)
34 | priv struct Parser {
   |             ^^^^^^
   |   tokens : Array[@tokenize.Token]
   |   mut position : Int

<WORKDIR>/toml.mbt:47:4-47:10:
   | /// breaks are insignificant (e.g. between top-level statements). The
   | /// parser's position is not advanced — callers commit progress by passing
   | /// the consumed tail back through `update_view`.
47 | fn Parser::view(
   |    ^^^^^^
   |   self : Self,
   |   skip_newlines? : Bool = false,

<WORKDIR>/toml.mbt:75:4-75:10:
   | /// from that point. The new position is read from the view's start offset
   | /// in the underlying token array, so the input must be a slice of
   | /// `self.tokens`.
75 | fn Parser::update_view(
   |    ^^^^^^
   |   self : Parser,
   |   view : ArrayView[@tokenize.Token],

<WORKDIR>/toml.mbt:76:10-76:16:
   | /// in the underlying token array, so the input must be a slice of
   | /// `self.tokens`.
   | fn Parser::update_view(
76 |   self : Parser,
   |          ^^^^^^
   |   view : ArrayView[@tokenize.Token],
   | ) -> Unit {

<WORKDIR>/toml.mbt:85:4-85:10:
   | 
   | ///|
   | /// Create a new parser
85 | fn Parser::Parser(tokens : Array[@tokenize.Token]) -> Parser {
   |    ^^^^^^
   |   { tokens, position: 0 }
   | }

<WORKDIR>/toml.mbt:85:12-85:18:
   | 
   | ///|
   | /// Create a new parser
85 | fn Parser::Parser(tokens : Array[@tokenize.Token]) -> Parser {
   |            ^^^^^^
   |   { tokens, position: 0 }
   | }

<WORKDIR>/toml.mbt:85:55-85:61:
   | 
   | ///|
   | /// Create a new parser
85 | fn Parser::Parser(tokens : Array[@tokenize.Token]) -> Parser {
   |                                                       ^^^^^^
   |   { tokens, position: 0 }
   | }

<WORKDIR>/toml.mbt:98:16-98:22:
   |     Equals(loc~),
   |     StringToken("value", loc~, multiline=false),
   |   ]
98 |   let parser = Parser::Parser(tokens)
   |                ^^^^^^
   |   debug_inspect(parser.position, content="0")
   |   debug_inspect(parser.tokens.length(), content="3")

<WORKDIR>/toml.mbt:98:24-98:30:
   |     Equals(loc~),
   |     StringToken("value", loc~, multiline=false),
   |   ]
98 |   let parser = Parser::Parser(tokens)
   |                        ^^^^^^
   |   debug_inspect(parser.position, content="0")
   |   debug_inspect(parser.tokens.length(), content="3")

```
