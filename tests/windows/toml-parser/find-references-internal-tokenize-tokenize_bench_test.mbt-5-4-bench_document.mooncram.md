# toml-parser find-references bench_document internal\tokenize\tokenize_bench_test.mbt:5:4

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' find-references 'bench_document' --loc 'internal\tokenize\tokenize_bench_test.mbt:5:4'
Found 1 references for symbol 'bench_document':
<WORKDIR>/internal\tokenize\tokenize_bench_test.mbt:27:13-27:27:
   | 
   | ///|
   | test "bench tokenize document" (it : @bench.T) {
27 |   let doc = bench_document()
   |             ^^^^^^^^^^^^^^
   |   it.bench(
   |     () => it.keep(Ok(@tokenize.tokenize(doc)) catch { e => Err(e) }),
"" (escaped)
```
