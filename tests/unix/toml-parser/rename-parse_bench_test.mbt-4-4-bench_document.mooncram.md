# toml-parser rename bench_document parse_bench_test.mbt:4:4

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../fixtures/repos/toml-parser' moon ide rename 'bench_document' 'bench_document_renamed' --loc 'parse_bench_test.mbt:4:4'
*** Begin Patch
*** Update File: <WORKDIR>/parse_bench_test.mbt
@@
 ///|
 /// A document big enough (and with enough astral characters) to exercise the
 /// lexer's view handling end to end.
-fn bench_document() -> String {
+fn bench_document_renamed() -> String {
   let sb = StringBuilder()
   for i in 0..<800 {
     sb.write_string("key_\{i} = \"value 😈 \{i}\"\n")
@@
 /// 2-3% faster than `clamped_view` (slicing), and within noise of `unsafe_view`,
 /// which would give up bounds checking for it.
 test "bench parse document" (it : @bench.T) {
-  let doc = bench_document()
+  let doc = bench_document_renamed()
   println(
     "document: \{doc.length()} code units, \{doc.char_length()} characters",
   )
*** End Patch
"" (escaped)
```
