# toml-parser peek-def

```mooncram
$ export MOON_HOME="${MOON_HOME:-$HOME/.moon}"
```

```mooncram
$ export TEST_REPO_ROOT="$(cd "$TESTDIR/../../../fixtures/repos/toml-parser" && pwd)"
```

```mooncram
$ normalize_moon_ide_output() { sed -e "s|$TEST_REPO_ROOT|<WORKDIR>|g" -e "s|$MOON_HOME|<MOON_HOME>|g"; }
```

```mooncram
$ run_moon_ide() { status_file="${TMPDIR:-/tmp}/moon-ide-status.$$"; ( cd "$TEST_REPO_ROOT" && "$@"; echo "$?" > "$status_file" ) 2>&1 | normalize_moon_ide_output; status=$(cat "$status_file"); rm -f "$status_file"; return "$status"; }
```

```mooncram
$ run_moon_ide moon ide peek-def 'version' --loc 'cmd/toml/main.mbt:2:5'
Definition found at file <WORKDIR>/cmd/toml/main.mbt
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
$ run_moon_ide moon ide peek-def 'toml_command' --loc 'cmd/toml/main.mbt:5:4'
Definition found at file <WORKDIR>/cmd/toml/main.mbt
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
$ run_moon_ide moon ide peek-def 'TestResult' --loc 'e2e/runner.mbt:7:12'
Definition found at file <WORKDIR>/e2e/runner.mbt
  | /// Aggregate of a test-suite run: counts and per-failure messages. (escaped)
  | /// (escaped)
  | /// `failures` carries one entry per failing case (typically including the (escaped)
  | /// fixture path and a short reason) so that the test harness can print a (escaped)
  | /// summary at the end without re-walking the corpus. (escaped)
7 | pub struct TestResult { (escaped)
  |            ^^^^^^^^^^ (escaped)
  |   passed : Int (escaped)
  |   failed : Int (escaped)
  |   failures : Array[String] (escaped)
  | } (escaped)
  |  (escaped)
  | ///| (escaped)
  | /// Create an empty `TestResult` with zero counts and no failures recorded. (escaped)
  | pub fn TestResult::new() -> TestResult { (escaped)
  |   { passed: 0, failed: 0, failures: [] } (escaped)
  | } (escaped)
  |  (escaped)
  | ///| (escaped)
  | /// Recursively collect all .toml files in a directory. (escaped)
  | pub fn collect_toml_files( (escaped)
```

```mooncram
$ run_moon_ide moon ide peek-def 'passed' --loc 'e2e/runner.mbt:8:3'
Definition found at file <WORKDIR>/e2e/runner.mbt
  | /// (escaped)
  | /// `failures` carries one entry per failing case (typically including the (escaped)
  | /// fixture path and a short reason) so that the test harness can print a (escaped)
  | /// summary at the end without re-walking the corpus. (escaped)
  | pub struct TestResult { (escaped)
8 |   passed : Int (escaped)
  |   ^^^^^^ (escaped)
  |   failed : Int (escaped)
  |   failures : Array[String] (escaped)
  | } (escaped)
  |  (escaped)
  | ///| (escaped)
  | /// Create an empty `TestResult` with zero counts and no failures recorded. (escaped)
  | pub fn TestResult::new() -> TestResult { (escaped)
  |   { passed: 0, failed: 0, failures: [] } (escaped)
  | } (escaped)
  |  (escaped)
  | ///| (escaped)
  | /// Recursively collect all .toml files in a directory. (escaped)
  | pub fn collect_toml_files( (escaped)
  |   dir : String, (escaped)
```

```mooncram
$ run_moon_ide moon ide peek-def 'to_test_json' --loc 'e2e/convert.mbt:5:8'
Definition found at file <WORKDIR>/e2e/convert.mbt
  | ///| (escaped)
  | /// Convert a TomlValue to the toml-test JSON format. (escaped)
  | /// Leaf values become {"type": "...", "value": "..."} (escaped)
  | /// Tables become plain JSON objects, arrays become JSON arrays. (escaped)
5 | pub fn to_test_json(value : @toml.TomlValue) -> Json { (escaped)
  |        ^^^^^^^^^^^^ (escaped)
  |   match value { (escaped)
  |     TomlString(s) => typed_value("string", s) (escaped)
  |     TomlInteger(i) => typed_value("integer", i.to_string()) (escaped)
  |     TomlFloat(f) => typed_value("float", format_test_float(f)) (escaped)
  |     TomlBoolean(b) => typed_value("bool", if b { "true" } else { "false" }) (escaped)
  |     TomlDateTime(_) => { (escaped)
  |       let (kind, s) = value.datetime_info().unwrap() (escaped)
  |       match kind { (escaped)
  |         "OffsetDateTime" => typed_value("datetime", normalize_datetime(s)) (escaped)
  |         "LocalDateTime" => typed_value("datetime-local", normalize_datetime(s)) (escaped)
  |         "LocalTime" => typed_value("time-local", normalize_time_value(s)) (escaped)
  |         _ => typed_value("date-local", s) (escaped)
  |       } (escaped)
  |     } (escaped)
```

```mooncram
$ run_moon_ide moon ide peek-def 'value' --loc 'e2e/convert.mbt:5:21'
Definition found at file <WORKDIR>/e2e/convert.mbt
  | ///| (escaped)
  | /// Convert a TomlValue to the toml-test JSON format. (escaped)
  | /// Leaf values become {"type": "...", "value": "..."} (escaped)
  | /// Tables become plain JSON objects, arrays become JSON arrays. (escaped)
5 | pub fn to_test_json(value : @toml.TomlValue) -> Json { (escaped)
  |                     ^^^^^ (escaped)
  |   match value { (escaped)
  |     TomlString(s) => typed_value("string", s) (escaped)
  |     TomlInteger(i) => typed_value("integer", i.to_string()) (escaped)
  |     TomlFloat(f) => typed_value("float", format_test_float(f)) (escaped)
  |     TomlBoolean(b) => typed_value("bool", if b { "true" } else { "false" }) (escaped)
  |     TomlDateTime(_) => { (escaped)
  |       let (kind, s) = value.datetime_info().unwrap() (escaped)
  |       match kind { (escaped)
  |         "OffsetDateTime" => typed_value("datetime", normalize_datetime(s)) (escaped)
  |         "LocalDateTime" => typed_value("datetime-local", normalize_datetime(s)) (escaped)
  |         "LocalTime" => typed_value("time-local", normalize_time_value(s)) (escaped)
  |         _ => typed_value("date-local", s) (escaped)
  |       } (escaped)
  |     } (escaped)
```

```mooncram
$ run_moon_ide moon ide peek-def 'files' --loc 'e2e/e2e_test.mbt:3:7'
Definition found at file <WORKDIR>/e2e/e2e_test.mbt
  | ///| (escaped)
  | async test "valid toml-test suite" { (escaped)
3 |   let files : Array[String] = [] (escaped)
  |       ^^^^^ (escaped)
  |   @e2e.collect_toml_files("e2e/testdata/valid", files) (escaped)
  |   files.sort() (escaped)
  |   let mut passed = 0 (escaped)
  |   let mut failed = 0 (escaped)
  |   let failures : Array[String] = [] (escaped)
  |   for toml_path in files { (escaped)
  |     let json_path = "\\{toml_path[:toml_path.length() - 5]}.json" (escaped)
  |     if !@fs.path_exists(json_path) { (escaped)
  |       continue (escaped)
  |     } (escaped)
  |     let toml_content = @fs.read_file_to_string(toml_path) (escaped)
  |     let expected_json_str = @fs.read_file_to_string(json_path) (escaped)
  |     let expected : Json = @json.parse(expected_json_str) catch { (escaped)
  |       e => { (escaped)
```

```mooncram
$ run_moon_ide moon ide peek-def 'collect_toml_files' --loc 'e2e/e2e_test.mbt:4:8'
Definition found at file <WORKDIR>/e2e/runner.mbt
   |   { passed: 0, failed: 0, failures: [] } (escaped)
   | } (escaped)
   |  (escaped)
   | ///| (escaped)
   | /// Recursively collect all .toml files in a directory. (escaped)
21 | pub fn collect_toml_files( (escaped)
   |        ^^^^^^^^^^^^^^^^^^ (escaped)
   |   dir : String, (escaped)
   |   files : Array[String], (escaped)
   | ) -> Unit raise @fs.IOError { (escaped)
   |   let entries = @fs.read_dir(dir) (escaped)
   |   for entry in entries { (escaped)
   |     let path = "\\{dir}/\\{entry}" (escaped)
   |     if @fs.is_dir(path) { (escaped)
   |       collect_toml_files(path, files) (escaped)
   |     } else if entry.has_suffix(".toml") { (escaped)
   |       files.push(path) (escaped)
   |     } (escaped)
   |   } (escaped)
   | } (escaped)
   |  (escaped)
```

```mooncram
$ run_moon_ide moon ide peek-def 'result' --loc 'e2e/known_failures_test.mbt:10:7'
Definition found at file <WORKDIR>/e2e/known_failures_test.mbt
   | // FIXED: Tokenizer infinite loop on dashed bare keys in table headers (escaped)
   | // ============================================================ (escaped)
   |  (escaped)
   | ///| (escaped)
   | test "fixed: [a-a-a] table header parses correctly" { (escaped)
10 |   let result = try @toml.parse("[a-a-a]\n_ = false\n") catch {
   |       ^^^^^^ (escaped)
   |     err => Err(err)
   |   } noraise {
   |     value => Ok(value)
   |   }
   |   debug_inspect( (escaped)
   |     result, (escaped)
   |     content=( (escaped)
   |       #|Ok(TomlTable({ "a-a-a": TomlTable({ "_": TomlBoolean(false) }) })) (escaped)
   |     ), (escaped)
   |   ) (escaped)
   | } (escaped)
   |  (escaped)
   | ///| (escaped)
   | test "fixed: leading underscore value rejected (not infinite loop)" { (escaped)
```

```mooncram
$ run_moon_ide moon ide peek-def 'parse' --loc 'e2e/known_failures_test.mbt:10:26'
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
