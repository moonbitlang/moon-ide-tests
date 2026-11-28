# toml-parser find-references sb internal/tokenize/tokenize_bench_test.mbt:6:7

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' find-references 'sb' --loc 'internal/tokenize/tokenize_bench_test.mbt:6:7'
Found 12 references for symbol 'sb':
<WORKDIR>/internal/tokenize/tokenize_bench_test.mbt:8:5-8:7:
  | fn bench_document() -> String {
  |   let sb = StringBuilder()
  |   for i in 0..<500 {
8 |     sb.write_string("# section \{i}: a comment 😈\n")
  |     ^^
  |     sb.write_string("[table_\{i}.\"quoted key\"]\n")
  |     sb.write_string("key_\{i} = \"value 😈 \{i}\" # trailing comment\n")

<WORKDIR>/internal/tokenize/tokenize_bench_test.mbt:9:5-9:7:
  |   let sb = StringBuilder()
  |   for i in 0..<500 {
  |     sb.write_string("# section \{i}: a comment 😈\n")
9 |     sb.write_string("[table_\{i}.\"quoted key\"]\n")
  |     ^^
  |     sb.write_string("key_\{i} = \"value 😈 \{i}\" # trailing comment\n")
  |     sb.write_string("escaped = \"tab\\there \\u00e9 \\\"quoted\\\"\"\n")

<WORKDIR>/internal/tokenize/tokenize_bench_test.mbt:10:5-10:7:
   |   for i in 0..<500 {
   |     sb.write_string("# section \{i}: a comment 😈\n")
   |     sb.write_string("[table_\{i}.\"quoted key\"]\n")
10 |     sb.write_string("key_\{i} = \"value 😈 \{i}\" # trailing comment\n")
   |     ^^
   |     sb.write_string("escaped = \"tab\\there \\u00e9 \\\"quoted\\\"\"\n")
   |     sb.write_string("literal = 'C:\\Users\\nodejs\\templates'\n")

<WORKDIR>/internal/tokenize/tokenize_bench_test.mbt:11:5-11:7:
   |     sb.write_string("# section \{i}: a comment 😈\n")
   |     sb.write_string("[table_\{i}.\"quoted key\"]\n")
   |     sb.write_string("key_\{i} = \"value 😈 \{i}\" # trailing comment\n")
11 |     sb.write_string("escaped = \"tab\\there \\u00e9 \\\"quoted\\\"\"\n")
   |     ^^
   |     sb.write_string("literal = 'C:\\Users\\nodejs\\templates'\n")
   |     sb.write_string(

<WORKDIR>/internal/tokenize/tokenize_bench_test.mbt:12:5-12:7:
   |     sb.write_string("[table_\{i}.\"quoted key\"]\n")
   |     sb.write_string("key_\{i} = \"value 😈 \{i}\" # trailing comment\n")
   |     sb.write_string("escaped = \"tab\\there \\u00e9 \\\"quoted\\\"\"\n")
12 |     sb.write_string("literal = 'C:\\Users\\nodejs\\templates'\n")
   |     ^^
   |     sb.write_string(
   |       "multi = \"\"\"\nline one\nline two \\\n  continued\"\"\"\n",

<WORKDIR>/internal/tokenize/tokenize_bench_test.mbt:13:5-13:7:
   |     sb.write_string("key_\{i} = \"value 😈 \{i}\" # trailing comment\n")
   |     sb.write_string("escaped = \"tab\\there \\u00e9 \\\"quoted\\\"\"\n")
   |     sb.write_string("literal = 'C:\\Users\\nodejs\\templates'\n")
13 |     sb.write_string(
   |     ^^
   |       "multi = \"\"\"\nline one\nline two \\\n  continued\"\"\"\n",
   |     )

<WORKDIR>/internal/tokenize/tokenize_bench_test.mbt:16:5-16:7:
   |     sb.write_string(
   |       "multi = \"\"\"\nline one\nline two \\\n  continued\"\"\"\n",
   |     )
16 |     sb.write_string("raw = '''\nfirst\nsecond'''\n")
   |     ^^
   |     sb.write_string("int = 1_000_\{i}\nhex = 0xDEAD_BEEF\nneg = -\{i}\n")
   |     sb.write_string("float = 6.626e-34\nflag = true\n")

<WORKDIR>/internal/tokenize/tokenize_bench_test.mbt:17:5-17:7:
   |       "multi = \"\"\"\nline one\nline two \\\n  continued\"\"\"\n",
   |     )
   |     sb.write_string("raw = '''\nfirst\nsecond'''\n")
17 |     sb.write_string("int = 1_000_\{i}\nhex = 0xDEAD_BEEF\nneg = -\{i}\n")
   |     ^^
   |     sb.write_string("float = 6.626e-34\nflag = true\n")
   |     sb.write_string("when = 1979-05-27T07:32:00.999-07:00\nday = 1979-05-27\n")

<WORKDIR>/internal/tokenize/tokenize_bench_test.mbt:18:5-18:7:
   |     )
   |     sb.write_string("raw = '''\nfirst\nsecond'''\n")
   |     sb.write_string("int = 1_000_\{i}\nhex = 0xDEAD_BEEF\nneg = -\{i}\n")
18 |     sb.write_string("float = 6.626e-34\nflag = true\n")
   |     ^^
   |     sb.write_string("when = 1979-05-27T07:32:00.999-07:00\nday = 1979-05-27\n")
   |     sb.write_string("arr = [ 1, 2, 3, \"four\", { x = 5, y = 6 } ]\n")

<WORKDIR>/internal/tokenize/tokenize_bench_test.mbt:19:5-19:7:
   |     sb.write_string("raw = '''\nfirst\nsecond'''\n")
   |     sb.write_string("int = 1_000_\{i}\nhex = 0xDEAD_BEEF\nneg = -\{i}\n")
   |     sb.write_string("float = 6.626e-34\nflag = true\n")
19 |     sb.write_string("when = 1979-05-27T07:32:00.999-07:00\nday = 1979-05-27\n")
   |     ^^
   |     sb.write_string("arr = [ 1, 2, 3, \"four\", { x = 5, y = 6 } ]\n")
   |   }

<WORKDIR>/internal/tokenize/tokenize_bench_test.mbt:20:5-20:7:
   |     sb.write_string("int = 1_000_\{i}\nhex = 0xDEAD_BEEF\nneg = -\{i}\n")
   |     sb.write_string("float = 6.626e-34\nflag = true\n")
   |     sb.write_string("when = 1979-05-27T07:32:00.999-07:00\nday = 1979-05-27\n")
20 |     sb.write_string("arr = [ 1, 2, 3, \"four\", { x = 5, y = 6 } ]\n")
   |     ^^
   |   }
   |   sb.to_string()

<WORKDIR>/internal/tokenize/tokenize_bench_test.mbt:22:3-22:5:
   |     sb.write_string("when = 1979-05-27T07:32:00.999-07:00\nday = 1979-05-27\n")
   |     sb.write_string("arr = [ 1, 2, 3, \"four\", { x = 5, y = 6 } ]\n")
   |   }
22 |   sb.to_string()
   |   ^^
   | }
   | 
"" (escaped)
```
