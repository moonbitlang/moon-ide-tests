# toml-parser find-references tokens internal\tokenize\lexer_test.mbt:4:7

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\toml-parser' moon ide find-references 'tokens' --loc 'internal\tokenize\lexer_test.mbt:4:7'
Found 1 references for symbol 'tokens':
<WORKDIR>/internal\tokenize\lexer_test.mbt:10:5-10:11:
   |     ),
   |   )
   |   debug_inspect(
10 |     tokens,
   |     ^^^^^^
   |     content=(
   |       #|[

```
