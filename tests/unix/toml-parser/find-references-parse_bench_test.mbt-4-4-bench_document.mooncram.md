# toml-parser find-references bench_document parse_bench_test.mbt:4:4

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' find-references 'bench_document' --loc 'parse_bench_test.mbt:4:4'
Found 1 references for symbol 'bench_document':
<WORKDIR>/parse_bench_test.mbt:23:13-23:27:
   | /// 2-3% faster than `clamped_view` (slicing), and within noise of `unsafe_view`,
   | /// which would give up bounds checking for it.
   | test "bench parse document" (it : @bench.T) {
23 |   let doc = bench_document()
   |             ^^^^^^^^^^^^^^
   |   println(
   |     "document: \{doc.length()} code units, \{doc.char_length()} characters",
"" (escaped)
```
