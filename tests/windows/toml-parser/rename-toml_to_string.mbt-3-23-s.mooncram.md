# toml-parser rename s toml_to_string.mbt:3:23

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\toml-parser' moon ide rename 's' 's_renamed' --loc 'toml_to_string.mbt:3:23'
*** Begin Patch
*** Update File: <WORKDIR>/toml_to_string.mbt
@@
 ///|
 /// Helper function to escape strings according to TOML spec
-fn escape_toml_string(s : String) -> String {
+fn escape_toml_string(s_renamed : String) -> String {
   let result = StringBuilder()
   for char in s {
     match char {
@@
         output <+ "\{format_toml_key(key)}]\n"
         let new_path = path.copy()
         new_path.push(key)
-        write_table_contents(t, output, new_path)
+        write_table_contents(s_renamed, output, new_path)
       }
       _ => () // Should not happen
     }
*** End Patch

```
