# toml-parser find-references sb parse_bench_test.mbt:5:7

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' find-references 'sb' --loc 'parse_bench_test.mbt:5:7'
Found 7 references for symbol 'sb':
<WORKDIR>/parse_bench_test.mbt:7:5-7:7:
  | fn bench_document() -> String {
  |   let sb = StringBuilder()
  |   for i in 0..<800 {
7 |     sb.write_string("key_\{i} = \"value 😈 \{i}\"\n")
  |     ^^
  |     sb.write_string("num_\{i} = \{i}.5\n")
  |     sb.write_string("flag_\{i} = true\n")

<WORKDIR>/parse_bench_test.mbt:8:5-8:7:
  |   let sb = StringBuilder()
  |   for i in 0..<800 {
  |     sb.write_string("key_\{i} = \"value 😈 \{i}\"\n")
8 |     sb.write_string("num_\{i} = \{i}.5\n")
  |     ^^
  |     sb.write_string("flag_\{i} = true\n")
  |     sb.write_string("[table_\{i}]\n")

<WORKDIR>/parse_bench_test.mbt:9:5-9:7:
  |   for i in 0..<800 {
  |     sb.write_string("key_\{i} = \"value 😈 \{i}\"\n")
  |     sb.write_string("num_\{i} = \{i}.5\n")
9 |     sb.write_string("flag_\{i} = true\n")
  |     ^^
  |     sb.write_string("[table_\{i}]\n")
  |     sb.write_string("emoji = \"😈😈😈\"\n")

<WORKDIR>/parse_bench_test.mbt:10:5-10:7:
   |     sb.write_string("key_\{i} = \"value 😈 \{i}\"\n")
   |     sb.write_string("num_\{i} = \{i}.5\n")
   |     sb.write_string("flag_\{i} = true\n")
10 |     sb.write_string("[table_\{i}]\n")
   |     ^^
   |     sb.write_string("emoji = \"😈😈😈\"\n")
   |     sb.write_string("arr = [1, 2, 3, 400, 5000]\n")

<WORKDIR>/parse_bench_test.mbt:11:5-11:7:
   |     sb.write_string("num_\{i} = \{i}.5\n")
   |     sb.write_string("flag_\{i} = true\n")
   |     sb.write_string("[table_\{i}]\n")
11 |     sb.write_string("emoji = \"😈😈😈\"\n")
   |     ^^
   |     sb.write_string("arr = [1, 2, 3, 400, 5000]\n")
   |   }

<WORKDIR>/parse_bench_test.mbt:12:5-12:7:
   |     sb.write_string("flag_\{i} = true\n")
   |     sb.write_string("[table_\{i}]\n")
   |     sb.write_string("emoji = \"😈😈😈\"\n")
12 |     sb.write_string("arr = [1, 2, 3, 400, 5000]\n")
   |     ^^
   |   }
   |   sb.to_string()

<WORKDIR>/parse_bench_test.mbt:14:3-14:5:
   |     sb.write_string("emoji = \"😈😈😈\"\n")
   |     sb.write_string("arr = [1, 2, 3, 400, 5000]\n")
   |   }
14 |   sb.to_string()
   |   ^^
   | }
   | 
"" (escaped)
```
