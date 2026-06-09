# toml-parser peek-def

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\toml-parser' moon ide peek-def 'version' --loc 'cmd\toml\main.mbt:2:5'
Definition found at file <WORKDIR>/cmd\toml\main.mbt
  | ///|
2 | let version : String = "0.2.3"
  |     ^^^^^^^
  | 
  | ///|
  | fn toml_command() -> @argparse.Command {
  |   Command(
  |     "toml",
  |     about="Parse, validate, and format TOML files.",
  |     version~,
  |     arg_required_else_help=true,
  |     positionals=[
  |       PositionArg("file", about="Parse TOML and print normalized TOML."),
  |     ],
  |     subcommands=[
  |       Command("format", about="Parse TOML and print normalized TOML.", positionals=[
  |         PositionArg(
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\toml-parser' moon ide peek-def 'toml_command' --loc 'cmd\toml\main.mbt:5:4'
Definition found at file <WORKDIR>/cmd\toml\main.mbt
  | ///|
  | let version : String = "0.2.3"
  | 
  | ///|
5 | fn toml_command() -> @argparse.Command {
  |    ^^^^^^^^^^^^
  |   Command(
  |     "toml",
  |     about="Parse, validate, and format TOML files.",
  |     version~,
  |     arg_required_else_help=true,
  |     positionals=[
  |       PositionArg("file", about="Parse TOML and print normalized TOML."),
  |     ],
  |     subcommands=[
  |       Command("format", about="Parse TOML and print normalized TOML.", positionals=[
  |         PositionArg(
  |           "file",
  |           about="TOML file to format.",
  |           num_args=@argparse.ValueRange::single(),
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\toml-parser' moon ide peek-def 'TestResult' --loc 'e2e\runner.mbt:7:12'
Definition found at file <WORKDIR>/e2e\runner.mbt
  | /// Aggregate of a test-suite run: counts and per-failure messages.
  | ///
  | /// `failures` carries one entry per failing case (typically including the
  | /// fixture path and a short reason) so that the test harness can print a
  | /// summary at the end without re-walking the corpus.
7 | pub struct TestResult {
  |            ^^^^^^^^^^
  |   passed : Int
  |   failed : Int
  |   failures : Array[String]
  | }
  | 
  | ///|
  | /// Create an empty `TestResult` with zero counts and no failures recorded.
  | pub fn TestResult::new() -> TestResult {
  |   { passed: 0, failed: 0, failures: [] }
  | }
  | 
  | ///|
  | /// Recursively collect all .toml files in a directory.
  | pub fn collect_toml_files(
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\toml-parser' moon ide peek-def 'passed' --loc 'e2e\runner.mbt:8:3'
Definition found at file <WORKDIR>/e2e\runner.mbt
  | ///
  | /// `failures` carries one entry per failing case (typically including the
  | /// fixture path and a short reason) so that the test harness can print a
  | /// summary at the end without re-walking the corpus.
  | pub struct TestResult {
8 |   passed : Int
  |   ^^^^^^
  |   failed : Int
  |   failures : Array[String]
  | }
  | 
  | ///|
  | /// Create an empty `TestResult` with zero counts and no failures recorded.
  | pub fn TestResult::new() -> TestResult {
  |   { passed: 0, failed: 0, failures: [] }
  | }
  | 
  | ///|
  | /// Recursively collect all .toml files in a directory.
  | pub fn collect_toml_files(
  |   dir : String,
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\toml-parser' moon ide peek-def 'to_test_json' --loc 'e2e\convert.mbt:5:8'
Definition found at file <WORKDIR>/e2e\convert.mbt
  | ///|
  | /// Convert a TomlValue to the toml-test JSON format.
  | /// Leaf values become {"type": "...", "value": "..."}
  | /// Tables become plain JSON objects, arrays become JSON arrays.
5 | pub fn to_test_json(value : @toml.TomlValue) -> Json {
  |        ^^^^^^^^^^^^
  |   match value {
  |     TomlString(s) => typed_value("string", s)
  |     TomlInteger(i) => typed_value("integer", i.to_string())
  |     TomlFloat(f) => typed_value("float", format_test_float(f))
  |     TomlBoolean(b) => typed_value("bool", if b { "true" } else { "false" })
  |     TomlDateTime(_) => {
  |       let (kind, s) = value.datetime_info().unwrap()
  |       match kind {
  |         "OffsetDateTime" => typed_value("datetime", normalize_datetime(s))
  |         "LocalDateTime" => typed_value("datetime-local", normalize_datetime(s))
  |         "LocalTime" => typed_value("time-local", normalize_time_value(s))
  |         _ => typed_value("date-local", s)
  |       }
  |     }
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\toml-parser' moon ide peek-def 'value' --loc 'e2e\convert.mbt:5:21'
Definition found at file <WORKDIR>/e2e\convert.mbt
  | ///|
  | /// Convert a TomlValue to the toml-test JSON format.
  | /// Leaf values become {"type": "...", "value": "..."}
  | /// Tables become plain JSON objects, arrays become JSON arrays.
5 | pub fn to_test_json(value : @toml.TomlValue) -> Json {
  |                     ^^^^^
  |   match value {
  |     TomlString(s) => typed_value("string", s)
  |     TomlInteger(i) => typed_value("integer", i.to_string())
  |     TomlFloat(f) => typed_value("float", format_test_float(f))
  |     TomlBoolean(b) => typed_value("bool", if b { "true" } else { "false" })
  |     TomlDateTime(_) => {
  |       let (kind, s) = value.datetime_info().unwrap()
  |       match kind {
  |         "OffsetDateTime" => typed_value("datetime", normalize_datetime(s))
  |         "LocalDateTime" => typed_value("datetime-local", normalize_datetime(s))
  |         "LocalTime" => typed_value("time-local", normalize_time_value(s))
  |         _ => typed_value("date-local", s)
  |       }
  |     }
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\toml-parser' moon ide peek-def 'files' --loc 'e2e\e2e_test.mbt:3:7'
Definition found at file <WORKDIR>/e2e\e2e_test.mbt
  | ///|
  | async test "valid toml-test suite" {
3 |   let files : Array[String] = []
  |       ^^^^^
  |   @e2e.collect_toml_files("e2e/testdata/valid", files)
  |   files.sort()
  |   let mut passed = 0
  |   let mut failed = 0
  |   let failures : Array[String] = []
  |   for toml_path in files {
  |     let json_path = "\{toml_path[:toml_path.length() - 5]}.json"
  |     if !@fs.path_exists(json_path) {
  |       continue
  |     }
  |     let toml_content = @fs.read_file_to_string(toml_path)
  |     let expected_json_str = @fs.read_file_to_string(json_path)
  |     let expected : Json = @json.parse(expected_json_str) catch {
  |       e => {
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\toml-parser' moon ide peek-def 'collect_toml_files' --loc 'e2e\e2e_test.mbt:4:8'
Definition found at file <WORKDIR>/e2e\runner.mbt
   |   { passed: 0, failed: 0, failures: [] }
   | }
   | 
   | ///|
   | /// Recursively collect all .toml files in a directory.
21 | pub fn collect_toml_files(
   |        ^^^^^^^^^^^^^^^^^^
   |   dir : String,
   |   files : Array[String],
   | ) -> Unit raise @fs.IOError {
   |   let entries = @fs.read_dir(dir)
   |   for entry in entries {
   |     let path = "\{dir}/\{entry}"
   |     if @fs.is_dir(path) {
   |       collect_toml_files(path, files)
   |     } else if entry.has_suffix(".toml") {
   |       files.push(path)
   |     }
   |   }
   | }
   | 
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\toml-parser' moon ide peek-def 'result' --loc 'e2e\known_failures_test.mbt:10:7'
Definition found at file <WORKDIR>/e2e\known_failures_test.mbt
   | // FIXED: Tokenizer infinite loop on dashed bare keys in table headers
   | // ============================================================
   | 
   | ///|
   | test "fixed: [a-a-a] table header parses correctly" {
10 |   let result = try @toml.parse("[a-a-a]\n_ = false\n") catch {
   |       ^^^^^^
   |     err => Err(err)
   |   } noraise {
   |     value => Ok(value)
   |   }
   |   debug_inspect(
   |     result,
   |     content=(
   |       #|Ok(TomlTable({ "a-a-a": TomlTable({ "_": TomlBoolean(false) }) }))
   |     ),
   |   )
   | }
   | 
   | ///|
   | test "fixed: leading underscore value rejected (not infinite loop)" {
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\toml-parser' moon ide peek-def 'parse' --loc 'e2e\known_failures_test.mbt:10:26'
Definition found at file <WORKDIR>/parser.mbt
    | /// escapes, inline-table newlines) are accepted.
    | ///
    | /// On any lexical or syntactic error, `parse` raises with a message
    | /// containing the source location. Wrap the call in `try?` to receive a
    | /// `Result[TomlValue, Error]` instead.
300 | pub fn parse(input : String) -> TomlValue raise {
    |        ^^^^^
    |   let tokens = @tokenize.tokenize(input)
    |   let parser = Parser::Parser(tokens)
    |   let main_table = {}
    |   for current_table = main_table {
    |     parser.skip_newlines()
    |     match parser.view() {
    |       [EOF, ..] => break
    |       [LeftBracket(loc=loc1), LeftBracket(loc=loc2), .. rest] => {
    |         if !loc1.adjacent(loc2) {
    |           parser.error("Invalid table header: space between '[' and '['")
    |         }
    |         parser.update_view(rest)
    |         let table_path = parser.parse_table_path()
    |         match parser.view() {
```
