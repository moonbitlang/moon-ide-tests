# toml-parser rename sb parse_bench_test.mbt:5:7

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../fixtures/repos/toml-parser' moon ide rename 'sb' 'sb_renamed' --loc 'parse_bench_test.mbt:5:7'
*** Begin Patch
*** Update File: <WORKDIR>/parse_bench_test.mbt
@@
 /// A document big enough (and with enough astral characters) to exercise the
 /// lexer's view handling end to end.
 fn bench_document() -> String {
-  let sb = StringBuilder()
+  let sb_renamed = StringBuilder()
   for i in 0..<800 {
-    sb.write_string("key_\{i} = \"value 😈 \{i}\"\n")
+    sb_renamed.write_string("key_\{i} = \"value 😈 \{i}\"\n")
-    sb.write_string("num_\{i} = \{i}.5\n")
+    sb_renamed.write_string("num_\{i} = \{i}.5\n")
-    sb.write_string("flag_\{i} = true\n")
+    sb_renamed.write_string("flag_\{i} = true\n")
-    sb.write_string("[table_\{i}]\n")
+    sb_renamed.write_string("[table_\{i}]\n")
-    sb.write_string("emoji = \"😈😈😈\"\n")
+    sb_renamed.write_string("emoji = \"😈😈😈\"\n")
-    sb.write_string("arr = [1, 2, 3, 400, 5000]\n")
+    sb_renamed.write_string("arr = [1, 2, 3, 400, 5000]\n")
   }
-  sb.to_string()
+  sb_renamed.to_string()
 }
 
 ///|
*** End Patch
"" (escaped)
```
