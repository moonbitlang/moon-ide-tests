# toml-parser find-references tokens parser_wbtest.mbt:7:7

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\toml-parser' moon ide find-references 'tokens' --loc 'parser_wbtest.mbt:7:7'
Found 2 references for symbol 'tokens':
<WORKDIR>/parser_wbtest.mbt:7:7-7:13:
  | ///|
  | test "parse_dotted_key - simple identifier" {
  |   // Test parsing a simple identifier key
7 |   let tokens = @tokenize.tokenize("simple")
  |       ^^^^^^
  |   let parser = Parser::Parser(tokens)
  |   let result = parser.parse_dotted_key()

<WORKDIR>/parser_wbtest.mbt:8:31-8:37:
  | test "parse_dotted_key - simple identifier" {
  |   // Test parsing a simple identifier key
  |   let tokens = @tokenize.tokenize("simple")
8 |   let parser = Parser::Parser(tokens)
  |                               ^^^^^^
  |   let result = parser.parse_dotted_key()
  |   debug_inspect(

```
