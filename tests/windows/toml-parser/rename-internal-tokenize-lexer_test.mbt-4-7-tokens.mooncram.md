# toml-parser rename tokens internal\tokenize\lexer_test.mbt:4:7

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\toml-parser' moon ide rename 'tokens' 'tokens_renamed' --loc 'internal\tokenize\lexer_test.mbt:4:7'
*** Begin Patch
*** Update File: <WORKDIR>/internal\tokenize\lexer_test.mbt
@@
 ///|
 /// Tests for the TOML lexer
 test "tokenize simple key-value" {
-  let tokens = @tokenize.tokenize(
+  let tokens_renamed = @tokenize.tokenize(
     (
       #|key = "value"
     ),
   )
   debug_inspect(
-    tokens,
+    tokens_renamed,
     content=(
       #|[
       #|  Identifier(
*** End Patch

```
