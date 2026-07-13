# toml-parser find-references tokens internal\tokenize\lexer_test.mbt:4:7

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\toml-parser' moon ide find-references 'tokens' --loc 'internal\tokenize\lexer_test.mbt:4:7'
Found 2 references for symbol 'tokens':
<WORKDIR>/internal\tokenize\lexer_test.mbt:4:7-4:13:
  | ///|
  | /// Tests for the TOML lexer
  | test "tokenize simple key-value" {
4 |   let tokens = @tokenize.tokenize(
  |       ^^^^^^
  |     (
  |       #|key = "value"

<WORKDIR>/internal\tokenize\lexer_test.mbt:10:5-10:11:
   |     ),
   |   )
   |   debug_inspect(
10 |     tokens,
   |     ^^^^^^
   |     content=(
   |       #|[

```
