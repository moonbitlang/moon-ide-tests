# toml-parser rename key_variations_toml additional_official_tests_test.mbt:8:7

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\toml-parser' moon ide rename 'key_variations_toml' 'key_variations_toml_renamed' --loc 'additional_official_tests_test.mbt:8:7'
*** Begin Patch
*** Update File: <WORKDIR>/additional_official_tests_test.mbt
@@
 ///|
 /// Test key names with various characters
 test "key name variations" {
-  let key_variations_toml =
+  let key_variations_toml_renamed =
     #|bare_key = "value"
     #|bare-key = "value"
     #|bare_key2 = "value"
@@
     #|"ʎǝʞ" = "value"
     #|
   debug_inspect(
-    @toml.parse(key_variations_toml),
+    @toml.parse(key_variations_toml_renamed),
     content=(
       #|TomlTable(
       #|  {
*** End Patch

```
