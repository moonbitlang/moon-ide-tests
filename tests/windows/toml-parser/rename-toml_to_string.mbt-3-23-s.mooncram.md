# toml-parser rename s toml_to_string.mbt:3:23

````mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../fixtures/repos/toml-parser' moon ide rename 's' 's_renamed' --loc 'toml_to_string.mbt:3:23'
*** Begin Patch
*** Update File: <WORKDIR>/toml_to_string.mbt
@@
 ///|
 /// Helper function to escape strings according to TOML spec
-fn escape_toml_string(s : String) -> String {
+fn escape_toml_string(s_renamed : String) -> String {
   let result = StringBuilder()
-  for char in s {
+  for char in s_renamed {
     match char {
       '\b' => result <+ "\\b"
       '\t' => result <+ "\\t"
*** End Patch
"" (escaped)
````
