# toml-parser rename tokens parser_wbtest.mbt:7:7

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\toml-parser' moon ide rename 'tokens' 'tokens_renamed' --loc 'parser_wbtest.mbt:7:7'
*** Begin Patch
*** Update File: <WORKDIR>/parser_wbtest.mbt
@@
 ///|
 test "parse_dotted_key - simple identifier" {
   // Test parsing a simple identifier key
-  let tokens = @tokenize.tokenize("simple")
+  let tokens_renamed = @tokenize.tokenize("simple")
-  let parser = Parser::Parser(tokens)
+  let parser = Parser::Parser(tokens_renamed)
   let result = parser.parse_dotted_key()
   debug_inspect(
     result,
*** End Patch

```
