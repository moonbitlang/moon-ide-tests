# toml-parser rename sb internal/tokenize/tokenize_bench_test.mbt:6:7

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' rename 'sb' 'sb_renamed' --loc 'internal/tokenize/tokenize_bench_test.mbt:6:7'
*** Begin Patch
*** Update File: <WORKDIR>/internal/tokenize/tokenize_bench_test.mbt
@@
 /// strings with and without escapes, multi-line strings, numbers in each
 /// radix, floats, booleans, datetimes, comments, tables and arrays.
 fn bench_document() -> String {
-  let sb = StringBuilder()
+  let sb_renamed = StringBuilder()
   for i in 0..<500 {
-    sb.write_string("# section \{i}: a comment 😈\n")
+    sb_renamed.write_string("# section \{i}: a comment 😈\n")
-    sb.write_string("[table_\{i}.\"quoted key\"]\n")
+    sb_renamed.write_string("[table_\{i}.\"quoted key\"]\n")
-    sb.write_string("key_\{i} = \"value 😈 \{i}\" # trailing comment\n")
+    sb_renamed.write_string("key_\{i} = \"value 😈 \{i}\" # trailing comment\n")
-    sb.write_string("escaped = \"tab\\there \\u00e9 \\\"quoted\\\"\"\n")
+    sb_renamed.write_string("escaped = \"tab\\there \\u00e9 \\\"quoted\\\"\"\n")
-    sb.write_string("literal = 'C:\\Users\\nodejs\\templates'\n")
+    sb_renamed.write_string("literal = 'C:\\Users\\nodejs\\templates'\n")
-    sb.write_string(
+    sb_renamed.write_string(
       "multi = \"\"\"\nline one\nline two \\\n  continued\"\"\"\n",
     )
-    sb.write_string("raw = '''\nfirst\nsecond'''\n")
+    sb_renamed.write_string("raw = '''\nfirst\nsecond'''\n")
-    sb.write_string("int = 1_000_\{i}\nhex = 0xDEAD_BEEF\nneg = -\{i}\n")
+    sb_renamed.write_string("int = 1_000_\{i}\nhex = 0xDEAD_BEEF\nneg = -\{i}\n")
-    sb.write_string("float = 6.626e-34\nflag = true\n")
+    sb_renamed.write_string("float = 6.626e-34\nflag = true\n")
-    sb.write_string("when = 1979-05-27T07:32:00.999-07:00\nday = 1979-05-27\n")
+    sb_renamed.write_string("when = 1979-05-27T07:32:00.999-07:00\nday = 1979-05-27\n")
-    sb.write_string("arr = [ 1, 2, 3, \"four\", { x = 5, y = 6 } ]\n")
+    sb_renamed.write_string("arr = [ 1, 2, 3, \"four\", { x = 5, y = 6 } ]\n")
   }
-  sb.to_string()
+  sb_renamed.to_string()
 }
 
 ///|
*** End Patch
"" (escaped)
```
