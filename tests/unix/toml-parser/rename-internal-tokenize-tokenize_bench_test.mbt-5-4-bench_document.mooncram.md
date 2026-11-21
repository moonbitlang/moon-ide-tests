# toml-parser rename bench_document internal/tokenize/tokenize_bench_test.mbt:5:4

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' rename 'bench_document' 'bench_document_renamed' --loc 'internal/tokenize/tokenize_bench_test.mbt:5:4'
*** Begin Patch
*** Update File: <WORKDIR>/internal/tokenize/tokenize_bench_test.mbt
@@
 /// A document that exercises every kind of token: bare and quoted keys,
 /// strings with and without escapes, multi-line strings, numbers in each
 /// radix, floats, booleans, datetimes, comments, tables and arrays.
-fn bench_document() -> String {
+fn bench_document_renamed() -> String {
   let sb = StringBuilder()
   for i in 0..<500 {
     sb.write_string("# section \{i}: a comment 😈\n")
@@
 
 ///|
 test "bench tokenize document" (it : @bench.T) {
-  let doc = bench_document()
+  let doc = bench_document_renamed()
   it.bench(
     () => it.keep(Ok(@tokenize.tokenize(doc)) catch { e => Err(e) }),
     count=20,
*** End Patch
"" (escaped)
```
