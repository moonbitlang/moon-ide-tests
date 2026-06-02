# toml-parser find-references

````mooncram
$ export MOON_HOME="${MOON_HOME:-$HOME/.moon}"
````

````mooncram
$ export TEST_REPO_ROOT="$(cd "$TESTDIR/../../../fixtures/repos/toml-parser" && pwd)"
````

````mooncram
$ normalize_moon_ide_output() { sed -e "s|$TEST_REPO_ROOT|<WORKDIR>|g" -e "s|$MOON_HOME|<MOON_HOME>|g"; }
````

````mooncram
$ run_moon_ide() { status_file="${TMPDIR:-/tmp}/moon-ide-status.$$"; ( cd "$TEST_REPO_ROOT" && "$@"; echo "$?" > "$status_file" ) 2>&1 | normalize_moon_ide_output; status=$(cat "$status_file"); rm -f "$status_file"; return "$status"; }
````

````mooncram
$ run_moon_ide moon ide find-references 'str_val' --loc 'cmd/main/main.mbt:7:7'
Found 2 references for symbol 'str_val':
<WORKDIR>/cmd/main/main.mbt:7:7-7:14:
  |  (escaped)
  |   // Demo 1: Basic value types (escaped)
  |   println("\\n--- Basic Value Types ---") (escaped)
7 |   let str_val = @toml.TomlString("Hello, TOML!") (escaped)
  |       ^^^^^^^ (escaped)
  |   let int_val = @toml.TomlInteger(42L) (escaped)
  |   let bool_val = @toml.TomlBoolean(true) (escaped)

<WORKDIR>/cmd/main/main.mbt:10:28-10:35:
   |   let str_val = @toml.TomlString("Hello, TOML!") (escaped)
   |   let int_val = @toml.TomlInteger(42L) (escaped)
   |   let bool_val = @toml.TomlBoolean(true) (escaped)
10 |   println("String value: \\{str_val}") (escaped)
   |                            ^^^^^^^ (escaped)
   |   println("Integer value: \\{int_val}") (escaped)
   |   println("Boolean value: \\{bool_val}") (escaped)

````

````mooncram
$ run_moon_ide moon ide find-references 'TomlString' --loc 'cmd/main/main.mbt:7:23'
Found 104 references for symbol 'TomlString':
<WORKDIR>/README.mbt.md:101:18-101:28:
    |   guard config (escaped)
    |     is TomlTable( (escaped)
    |       { (escaped)
101 |         "title": TomlString("My App"), (escaped)
    |                  ^^^^^^^^^^ (escaped)
    |         "version": TomlString("1.0.0"), (escaped)
    |         "database": TomlTable( (escaped)

<WORKDIR>/README.mbt.md:102:20-102:30:
    |     is TomlTable( (escaped)
    |       { (escaped)
    |         "title": TomlString("My App"), (escaped)
102 |         "version": TomlString("1.0.0"), (escaped)
    |                    ^^^^^^^^^^ (escaped)
    |         "database": TomlTable( (escaped)
    |           { "host": TomlString("localhost"), "port": TomlInteger(5432L), .. } (escaped)

<WORKDIR>/README.mbt.md:104:21-104:31:
    |         "title": TomlString("My App"), (escaped)
    |         "version": TomlString("1.0.0"), (escaped)
    |         "database": TomlTable( (escaped)
104 |           { "host": TomlString("localhost"), "port": TomlInteger(5432L), .. } (escaped)
    |                     ^^^^^^^^^^ (escaped)
    |         ), (escaped)
    |         .. (escaped)

<WORKDIR>/README.mbt.md:154:13-154:23:
    | test { (escaped)
    |   // Constructing TomlValue programmatically (escaped)
    |   let table : Map[String, @toml.TomlValue] = { (escaped)
154 |     "name": TomlString("Alice"), (escaped)
    |             ^^^^^^^^^^ (escaped)
    |     "age": TomlInteger(30L), (escaped)
    |     "active": TomlBoolean(true), (escaped)

<WORKDIR>/README.mbt.md:580:21-580:31:
    |       { (escaped)
    |         "database": TomlTable( (escaped)
    |           { (escaped)
580 |             "host": TomlString("localhost"), (escaped)
    |                     ^^^^^^^^^^ (escaped)
    |             "port": TomlInteger(5432L), (escaped)
    |             "enabled": TomlBoolean(true), (escaped)

<WORKDIR>/additional_official_tests_test.mbt:368:16-368:26:
    |   // Invalid nested structure - outer array contains arrays but inner arrays have different types (escaped)
    |   let invalid_nested_array = [ (escaped)
    |     @toml.TomlArray([TomlInteger(1L), TomlInteger(2L)]), (escaped)
368 |     TomlArray([TomlString("hello"), TomlString("world")]), (escaped)
    |                ^^^^^^^^^^ (escaped)
    |   ] (escaped)
    |   debug_inspect( (escaped)

<WORKDIR>/additional_official_tests_test.mbt:368:37-368:47:
    |   // Invalid nested structure - outer array contains arrays but inner arrays have different types (escaped)
    |   let invalid_nested_array = [ (escaped)
    |     @toml.TomlArray([TomlInteger(1L), TomlInteger(2L)]), (escaped)
368 |     TomlArray([TomlString("hello"), TomlString("world")]), (escaped)
    |                                     ^^^^^^^^^^ (escaped)
    |   ] (escaped)
    |   debug_inspect( (escaped)

<WORKDIR>/cmd/main/main.mbt:7:23-7:33:
  |  (escaped)
  |   // Demo 1: Basic value types (escaped)
  |   println("\\n--- Basic Value Types ---") (escaped)
7 |   let str_val = @toml.TomlString("Hello, TOML!") (escaped)
  |                       ^^^^^^^^^^ (escaped)
  |   let int_val = @toml.TomlInteger(42L) (escaped)
  |   let bool_val = @toml.TomlBoolean(true) (escaped)

<WORKDIR>/coverage_improvement_comprehensive_test.mbt:171:44-171:54:
    | /// Test nested validation failure in arrays (escaped)
    | test "nested_validation_failure_in_array" { (escaped)
    |   // Create a heterogeneous nested array (which should be invalid) (escaped)
171 |   let nested_arr = [@toml.TomlInteger(1L), TomlString("test")] (escaped)
    |                                            ^^^^^^^^^^ (escaped)
    |   let invalid_nested = @toml.TomlArray(nested_arr) (escaped)
    |   let outer_arr = [invalid_nested] (escaped)

<WORKDIR>/coverage_improvement_comprehensive_test.mbt:310:23-310:33:
    | /// Test to increase coverage of main function components (escaped)
    | test "main_function_components_coverage" { (escaped)
    |   // This test exercises the same functions as main() to improve coverage (escaped)
310 |   let str_val = @toml.TomlString("Hello, TOML!") (escaped)
    |                       ^^^^^^^^^^ (escaped)
    |   let int_val = @toml.TomlInteger(42L) (escaped)
    |   let bool_val = @toml.TomlBoolean(true) (escaped)

<WORKDIR>/coverage_improvement_comprehensive_test.mbt:454:44-454:54:
    | test "multiline_string_line_ending_backslash" { (escaped)
    |   let toml_input = "multiline = \\"\\"\\"\\nLine 1 \\\\\\n    Line 2\\"\\"\\"" (escaped)
    |   let result = @toml.parse(toml_input) (escaped)
454 |   guard result is TomlTable({ "multiline": TomlString(str), .. }) else { (escaped)
    |                                            ^^^^^^^^^^ (escaped)
    |     fail("Expected table with multiline string") (escaped)
    |   } (escaped)

<WORKDIR>/datetime_test.mbt:128:25-128:35:
    | /// Test datetime in complex nested structures (escaped)
    | test "datetime in nested structures" { (escaped)
    |   let event_table : Map[String, @toml.TomlValue] = Map([]) (escaped)
128 |   event_table["name"] = TomlString("Conference 2023") (escaped)
    |                         ^^^^^^^^^^ (escaped)
    |   event_table["start_date"] = TomlDateTime(LocalDate("2023-06-15")) (escaped)
    |   event_table["start_time"] = TomlDateTime(LocalTime("09:00:00")) (escaped)

<WORKDIR>/datetime_test.mbt:136:23-136:33:
    |   ) (escaped)
    |   let sessions = Array::new() (escaped)
    |   let session1 : Map[String, @toml.TomlValue] = Map([]) (escaped)
136 |   session1["title"] = TomlString("Opening Keynote") (escaped)
    |                       ^^^^^^^^^^ (escaped)
    |   session1["scheduled_at"] = TomlDateTime( (escaped)
    |     OffsetDateTime("2023-06-15T09:00:00+00:00"), (escaped)

<WORKDIR>/datetime_test.mbt:142:23-142:33:
    |   ) (escaped)
    |   sessions.push(@toml.TomlTable(session1)) (escaped)
    |   let session2 : Map[String, @toml.TomlValue] = Map([]) (escaped)
142 |   session2["title"] = TomlString("Technical Workshop") (escaped)
    |                       ^^^^^^^^^^ (escaped)
    |   session2["scheduled_at"] = TomlDateTime( (escaped)
    |     OffsetDateTime("2023-06-15T14:00:00+00:00"), (escaped)

<WORKDIR>/e2e/convert.mbt:7:5-7:15:
  | /// Tables become plain JSON objects, arrays become JSON arrays. (escaped)
  | pub fn to_test_json(value : @toml.TomlValue) -> Json { (escaped)
  |   match value { (escaped)
7 |     TomlString(s) => typed_value("string", s) (escaped)
  |     ^^^^^^^^^^ (escaped)
  |     TomlInteger(i) => typed_value("integer", i.to_string()) (escaped)
  |     TomlFloat(f) => typed_value("float", format_test_float(f)) (escaped)

<WORKDIR>/internal/qc_model/model.mbt:52:19-52:29:
   | /// re-projected via `from_toml`, must yield the original `SimpleValue`. (escaped)
   | pub fn SimpleValue::to_toml(self : SimpleValue) -> @toml.TomlValue { (escaped)
   |   match self { (escaped)
52 |     SString(s) => TomlString(s) (escaped)
   |                   ^^^^^^^^^^ (escaped)
   |     SInteger(n) => TomlInteger(n) (escaped)
   |     SBoolean(b) => TomlBoolean(b) (escaped)

<WORKDIR>/internal/qc_model/model.mbt:58:60-58:70:
   |     SDateTime(value) => TomlDateTime(value) (escaped)
   |     SDateTimeArray(values) => TomlArray([ for v in values => TomlDateTime(v) ]) (escaped)
   |     SEmptyArray => TomlArray([]) (escaped)
58 |     SStringArray(values) => TomlArray([ for v in values => TomlString(v) ]) (escaped)
   |                                                            ^^^^^^^^^^ (escaped)
   |     SIntegerArray(values) => TomlArray([ for v in values => TomlInteger(v) ]) (escaped)
   |     SBooleanArray(values) => TomlArray([ for v in values => TomlBoolean(v) ]) (escaped)

<WORKDIR>/internal/qc_model/model.mbt:102:5-102:15:
    | ///| (escaped)
    | fn project_string(value : @toml.TomlValue) -> String? { (escaped)
    |   match value { (escaped)
102 |     TomlString(s) => Some(s) (escaped)
    |     ^^^^^^^^^^ (escaped)
    |     _ => None (escaped)
    |   } (escaped)

<WORKDIR>/internal/qc_model/model.mbt:133:5-133:15:
    | /// equal to the input; that property is what the round-trip test checks. (escaped)
    | pub fn SimpleValue::from_toml(value : @toml.TomlValue) -> SimpleValue? { (escaped)
    |   match value { (escaped)
133 |     TomlString(text) => Some(SString(text)) (escaped)
    |     ^^^^^^^^^^ (escaped)
    |     TomlInteger(number) => Some(SInteger(number)) (escaped)
    |     TomlBoolean(boolean) => Some(SBoolean(boolean)) (escaped)

<WORKDIR>/internal/qc_model/model.mbt:144:10-144:20:
    |           collect_toml_array(values, project_datetime).map(items => { (escaped)
    |             SDateTimeArray(items) (escaped)
    |           }) (escaped)
144 |         [TomlString(_), ..] => (escaped)
    |          ^^^^^^^^^^ (escaped)
    |           collect_toml_array(values, project_string).map(items => { (escaped)
    |             SStringArray(items) (escaped)

<WORKDIR>/official_toml_test_suite_test.mbt:622:5-622:15:
    |   // which is required by the TOML specification (escaped)
    |   let mixed_array = [ (escaped)
    |     @toml.TomlInteger(1L), (escaped)
622 |     TomlString("hello"), (escaped)
    |     ^^^^^^^^^^ (escaped)
    |     TomlBoolean(true), (escaped)
    |   ] (escaped)

<WORKDIR>/parser.mbt:62:7-62:17:
   |   match self.view(skip_newlines~) { (escaped)
   |     [StringToken(s, ..), .. rest] => { (escaped)
   |       self.update_view(rest) (escaped)
62 |       TomlString(s) (escaped)
   |       ^^^^^^^^^^ (escaped)
   |     } (escaped)
   |     [IntegerToken(i, ..), .. rest] => { (escaped)

<WORKDIR>/toml.mbt:4:3-4:13:
  | ///| (escaped)
  | /// TOML Value types that represent different TOML data types (escaped)
  | pub(all) enum TomlValue { (escaped)
4 |   TomlString(String) (escaped)
  |   ^^^^^^^^^^ (escaped)
  |   TomlInteger(Int64) (escaped)
  |   TomlFloat(Double) (escaped)

<WORKDIR>/toml.mbt:92:11-92:21:
   |     [first, .. rest] => { (escaped)
   |       fn type_id(value : TomlValue) -> Int { (escaped)
   |         match value { (escaped)
92 |           TomlString(_) => 0 (escaped)
   |           ^^^^^^^^^^ (escaped)
   |           TomlInteger(_) => 1 (escaped)
   |           TomlFloat(_) => 2 (escaped)

<WORKDIR>/toml.mbt:112:5-112:15:
    | /// Get the type name of a TomlValue for error messages (escaped)
    | pub fn TomlValue::type_name(self : TomlValue) -> String { (escaped)
    |   match self { (escaped)
112 |     TomlString(_) => "string" (escaped)
    |     ^^^^^^^^^^ (escaped)
    |     TomlInteger(_) => "integer" (escaped)
    |     TomlFloat(_) => "float" (escaped)

<WORKDIR>/toml_test.mbt:4:21-4:31:
  | ///| (escaped)
  | /// Basic tests for TOML value types (escaped)
  | test "toml string value" { (escaped)
4 |   let value = @toml.TomlString("hello world") (escaped)
  |                     ^^^^^^^^^^ (escaped)
  |   debug_inspect( (escaped)
  |     value.to_string(), (escaped)

<WORKDIR>/toml_test.mbt:68:19-68:29:
   | ///| (escaped)
   | test "toml table value" { (escaped)
   |   let table : Map[String, @toml.TomlValue] = Map([]) (escaped)
68 |   table["key1"] = TomlString("value1") (escaped)
   |                   ^^^^^^^^^^ (escaped)
   |   table["key2"] = TomlInteger(42L) (escaped)
   |   let value = @toml.TomlTable(table) (escaped)

<WORKDIR>/toml_test.mbt:375:29-375:39:
    |     @toml.TomlValue::is_homogeneous_array(int_array), (escaped)
    |     content="true", (escaped)
    |   ) (escaped)
375 |   let string_array = [@toml.TomlString("a"), TomlString("b"), TomlString("c")] (escaped)
    |                             ^^^^^^^^^^ (escaped)
    |   debug_inspect( (escaped)
    |     @toml.TomlValue::is_homogeneous_array(string_array), (escaped)

<WORKDIR>/toml_test.mbt:375:46-375:56:
    |     @toml.TomlValue::is_homogeneous_array(int_array), (escaped)
    |     content="true", (escaped)
    |   ) (escaped)
375 |   let string_array = [@toml.TomlString("a"), TomlString("b"), TomlString("c")] (escaped)
    |                                              ^^^^^^^^^^ (escaped)
    |   debug_inspect( (escaped)
    |     @toml.TomlValue::is_homogeneous_array(string_array), (escaped)

<WORKDIR>/toml_test.mbt:375:63-375:73:
    |     @toml.TomlValue::is_homogeneous_array(int_array), (escaped)
    |     content="true", (escaped)
    |   ) (escaped)
375 |   let string_array = [@toml.TomlString("a"), TomlString("b"), TomlString("c")] (escaped)
    |                                                               ^^^^^^^^^^ (escaped)
    |   debug_inspect( (escaped)
    |     @toml.TomlValue::is_homogeneous_array(string_array), (escaped)

<WORKDIR>/toml_test.mbt:411:5-411:15:
    |   // Mixed types (should be invalid) (escaped)
    |   let mixed_array = [ (escaped)
    |     @toml.TomlInteger(1L), (escaped)
411 |     TomlString("hello"), (escaped)
    |     ^^^^^^^^^^ (escaped)
    |     TomlBoolean(true), (escaped)
    |   ] (escaped)

<WORKDIR>/toml_test.mbt:429:5-429:15:
    |   // Mixed datetime and string (should be invalid) (escaped)
    |   let mixed_dt_string = [ (escaped)
    |     @toml.TomlDateTime(LocalDate("2023-01-01")), (escaped)
429 |     TomlString("not a date"), (escaped)
    |     ^^^^^^^^^^ (escaped)
    |   ] (escaped)
    |   debug_inspect( (escaped)

<WORKDIR>/toml_test.mbt:446:47-446:57:
    |   debug_inspect(valid_toml_array.validate(), content="true") (escaped)
    |  (escaped)
    |   // Invalid heterogeneous array (escaped)
446 |   let invalid_array = [@toml.TomlInteger(1L), TomlString("mixed")] (escaped)
    |                                               ^^^^^^^^^^ (escaped)
    |   let invalid_toml_array = @toml.TomlArray(invalid_array) (escaped)
    |   debug_inspect(invalid_toml_array.validate(), content="false") (escaped)

<WORKDIR>/toml_test.mbt:452:29-452:39:
    |  (escaped)
    |   // Valid nested structure (escaped)
    |   let valid_table : Map[String, @toml.TomlValue] = Map([]) (escaped)
452 |   let nested_array = [@toml.TomlString("item1"), TomlString("item2")] (escaped)
    |                             ^^^^^^^^^^ (escaped)
    |   valid_table["items"] = TomlArray(nested_array) (escaped)
    |   valid_table["count"] = TomlInteger(2L) (escaped)

<WORKDIR>/toml_test.mbt:452:50-452:60:
    |  (escaped)
    |   // Valid nested structure (escaped)
    |   let valid_table : Map[String, @toml.TomlValue] = Map([]) (escaped)
452 |   let nested_array = [@toml.TomlString("item1"), TomlString("item2")] (escaped)
    |                                                  ^^^^^^^^^^ (escaped)
    |   valid_table["items"] = TomlArray(nested_array) (escaped)
    |   valid_table["count"] = TomlInteger(2L) (escaped)

<WORKDIR>/toml_test.mbt:461:11-461:21:
    |   // Invalid nested structure (contains invalid array) (escaped)
    |   let invalid_table : Map[String, @toml.TomlValue] = Map([]) (escaped)
    |   let bad_nested_array = [ (escaped)
461 |     @toml.TomlString("item1"), (escaped)
    |           ^^^^^^^^^^ (escaped)
    |     TomlInteger(42L), // Mixed types (escaped)
    |   ] (escaped)

<WORKDIR>/toml_test.mbt:470:23-470:33:
    |   debug_inspect(invalid_nested.validate(), content="false") (escaped)
    |  (escaped)
    |   // Simple values should always be valid (escaped)
470 |   debug_inspect(@toml.TomlString("hello").validate(), content="true") (escaped)
    |                       ^^^^^^^^^^ (escaped)
    |   debug_inspect(@toml.TomlInteger(42L).validate(), content="true") (escaped)
    |   debug_inspect(@toml.TomlFloat(3.14).validate(), content="true") (escaped)

<WORKDIR>/toml_to_string.mbt:134:5-134:15:
    |   path : Array[String], // Current table path for nested tables (escaped)
    | ) -> Unit { (escaped)
    |   match self { (escaped)
134 |     TomlString(s) => output <+ "\\"\\{escape_toml_string(s)}\\"" (escaped)
    |     ^^^^^^^^^^ (escaped)
    |     TomlInteger(i) => output <+ "\\{i}" (escaped)
    |     TomlFloat(f) => (escaped)

<WORKDIR>/toml_to_string_test.mbt:3:21-3:31:
  | ///| (escaped)
  | test "serialize simple string" { (escaped)
3 |   let value = @toml.TomlString("hello world") (escaped)
  |                     ^^^^^^^^^^ (escaped)
  |   inspect(value, content="\\"hello world\\"") (escaped)
  | } (escaped)

<WORKDIR>/toml_to_string_test.mbt:9:21-9:31:
  |  (escaped)
  | ///| (escaped)
  | test "serialize string with escapes" { (escaped)
9 |   let value = @toml.TomlString("hello\\nworld\\t\\"quoted\\"\\\\backslash") (escaped)
  |                     ^^^^^^^^^^ (escaped)
  |   inspect(value, content="\\"hello\\\\nworld\\\\t\\\\\\"quoted\\\\\\"\\\\\\\\backslash\\"") (escaped)
  | } (escaped)

<WORKDIR>/toml_to_string_test.mbt:15:21-15:31:
   |  (escaped)
   | ///| (escaped)
   | test "serialize string with control characters" { (escaped)
15 |   let value = @toml.TomlString("null:\\u0000 bell:\\u0007 delete:\\u007F") (escaped)
   |                     ^^^^^^^^^^ (escaped)
   |   inspect(value, content="\\"null:\\\\u0000 bell:\\\\u0007 delete:\\\\u007F\\"") (escaped)
   | } (escaped)

<WORKDIR>/toml_to_string_test.mbt:72:32-72:42:
   |  (escaped)
   | ///| (escaped)
   | test "serialize mixed type inline array" { (escaped)
72 |   let array = @toml.TomlArray([TomlString("hello"), TomlString("world")]) (escaped)
   |                                ^^^^^^^^^^ (escaped)
   |   inspect(array, content="[\\"hello\\", \\"world\\"]") (escaped)
   | } (escaped)

<WORKDIR>/toml_to_string_test.mbt:72:53-72:63:
   |  (escaped)
   | ///| (escaped)
   | test "serialize mixed type inline array" { (escaped)
72 |   let array = @toml.TomlArray([TomlString("hello"), TomlString("world")]) (escaped)
   |                                                     ^^^^^^^^^^ (escaped)
   |   inspect(array, content="[\\"hello\\", \\"world\\"]") (escaped)
   | } (escaped)

<WORKDIR>/toml_to_string_test.mbt:113:20-113:30:
    | ///| (escaped)
    | test "serialize simple table" { (escaped)
    |   let table = Map::from_array([ (escaped)
113 |     ("name", @toml.TomlString("Alice")), (escaped)
    |                    ^^^^^^^^^^ (escaped)
    |     ("age", TomlInteger(30L)), (escaped)
    |     ("active", TomlBoolean(true)), (escaped)

<WORKDIR>/toml_to_string_test.mbt:131:21-131:31:
    | ///| (escaped)
    | test "serialize table with arrays" { (escaped)
    |   let table = Map::from_array([ (escaped)
131 |     ("title", @toml.TomlString("Example")), (escaped)
    |                     ^^^^^^^^^^ (escaped)
    |     ("numbers", TomlArray([TomlInteger(1L), TomlInteger(2L), TomlInteger(3L)])), (escaped)
    |   ]) (escaped)

<WORKDIR>/toml_to_string_test.mbt:152:20-152:30:
    |     ("y", TomlInteger(2L)), (escaped)
    |   ]) (escaped)
    |   let outer_table = Map::from_array([ (escaped)
152 |     ("name", @toml.TomlString("test")), (escaped)
    |                    ^^^^^^^^^^ (escaped)
    |     ("position", TomlTable(inner_table)), (escaped)
    |   ]) (escaped)

<WORKDIR>/toml_to_string_test.mbt:170:48-170:58:
    |  (escaped)
    | ///| (escaped)
    | test "serialize deeply nested tables" { (escaped)
170 |   let level3 = Map::from_array([("deep", @toml.TomlString("value"))]) (escaped)
    |                                                ^^^^^^^^^^ (escaped)
    |   let level2 = Map::from_array([("nested", @toml.TomlTable(level3))]) (escaped)
    |   let level1 = Map::from_array([ (escaped)

<WORKDIR>/toml_to_string_test.mbt:173:19-173:29:
    |   let level3 = Map::from_array([("deep", @toml.TomlString("value"))]) (escaped)
    |   let level2 = Map::from_array([("nested", @toml.TomlTable(level3))]) (escaped)
    |   let level1 = Map::from_array([ (escaped)
173 |     ("top", @toml.TomlString("level")), (escaped)
    |                   ^^^^^^^^^^ (escaped)
    |     ("sub", TomlTable(level2)), (escaped)
    |   ]) (escaped)

<WORKDIR>/toml_to_string_test.mbt:192:20-192:30:
    | ///| (escaped)
    | test "serialize array of tables" { (escaped)
    |   let table1 = Map::from_array([ (escaped)
192 |     ("name", @toml.TomlString("Alice")), (escaped)
    |                    ^^^^^^^^^^ (escaped)
    |     ("score", TomlInteger(100L)), (escaped)
    |   ]) (escaped)

<WORKDIR>/toml_to_string_test.mbt:196:20-196:30:
    |     ("score", TomlInteger(100L)), (escaped)
    |   ]) (escaped)
    |   let table2 = Map::from_array([ (escaped)
196 |     ("name", @toml.TomlString("Bob")), (escaped)
    |                    ^^^^^^^^^^ (escaped)
    |     ("score", TomlInteger(95L)), (escaped)
    |   ]) (escaped)

<WORKDIR>/toml_to_string_test.mbt:200:21-200:31:
    |     ("score", TomlInteger(95L)), (escaped)
    |   ]) (escaped)
    |   let root = Map::from_array([ (escaped)
200 |     ("title", @toml.TomlString("High Scores")), (escaped)
    |                     ^^^^^^^^^^ (escaped)
    |     ("players", TomlArray([TomlTable(table1), TomlTable(table2)])), (escaped)
    |   ]) (escaped)

<WORKDIR>/toml_to_string_test.mbt:223:20-223:30:
    | ///| (escaped)
    | test "serialize complex nested structure" { (escaped)
    |   let database = Map::from_array([ (escaped)
223 |     ("host", @toml.TomlString("localhost")), (escaped)
    |                    ^^^^^^^^^^ (escaped)
    |     ("port", TomlInteger(5432L)), (escaped)
    |     ("username", TomlString("admin")), (escaped)

<WORKDIR>/toml_to_string_test.mbt:225:18-225:28:
    |   let database = Map::from_array([ (escaped)
    |     ("host", @toml.TomlString("localhost")), (escaped)
    |     ("port", TomlInteger(5432L)), (escaped)
225 |     ("username", TomlString("admin")), (escaped)
    |                  ^^^^^^^^^^ (escaped)
    |     ("password", TomlString("secret123")), (escaped)
    |   ]) (escaped)

<WORKDIR>/toml_to_string_test.mbt:226:18-226:28:
    |     ("host", @toml.TomlString("localhost")), (escaped)
    |     ("port", TomlInteger(5432L)), (escaped)
    |     ("username", TomlString("admin")), (escaped)
226 |     ("password", TomlString("secret123")), (escaped)
    |                  ^^^^^^^^^^ (escaped)
    |   ]) (escaped)
    |   let server = Map::from_array([ (escaped)

<WORKDIR>/toml_to_string_test.mbt:229:18-229:28:
    |     ("password", TomlString("secret123")), (escaped)
    |   ]) (escaped)
    |   let server = Map::from_array([ (escaped)
229 |     ("ip", @toml.TomlString("0.0.0.0")), (escaped)
    |                  ^^^^^^^^^^ (escaped)
    |     ("port", TomlInteger(8080L)), (escaped)
    |     ("timeout", TomlInteger(30L)), (escaped)

<WORKDIR>/toml_to_string_test.mbt:234:19-234:29:
    |     ("timeout", TomlInteger(30L)), (escaped)
    |   ]) (escaped)
    |   let staging = Map::from_array([ (escaped)
234 |     ("url", @toml.TomlString("https://staging.example.com")), (escaped)
    |                   ^^^^^^^^^^ (escaped)
    |     ("debug", TomlBoolean(true)), (escaped)
    |   ]) (escaped)

<WORKDIR>/toml_to_string_test.mbt:238:19-238:29:
    |     ("debug", TomlBoolean(true)), (escaped)
    |   ]) (escaped)
    |   let production = Map::from_array([ (escaped)
238 |     ("url", @toml.TomlString("https://example.com")), (escaped)
    |                   ^^^^^^^^^^ (escaped)
    |     ("debug", TomlBoolean(false)), (escaped)
    |   ]) (escaped)

<WORKDIR>/toml_to_string_test.mbt:246:21-246:31:
    |     ("production", TomlTable(production)), (escaped)
    |   ]) (escaped)
    |   let root = Map::from_array([ (escaped)
246 |     ("title", @toml.TomlString("Application Config")), (escaped)
    |                     ^^^^^^^^^^ (escaped)
    |     ("version", TomlString("1.0.0")), (escaped)
    |     ("database", TomlTable(database)), (escaped)

<WORKDIR>/toml_to_string_test.mbt:247:17-247:27:
    |   ]) (escaped)
    |   let root = Map::from_array([ (escaped)
    |     ("title", @toml.TomlString("Application Config")), (escaped)
247 |     ("version", TomlString("1.0.0")), (escaped)
    |                 ^^^^^^^^^^ (escaped)
    |     ("database", TomlTable(database)), (escaped)
    |     ("server", TomlTable(server)), (escaped)

<WORKDIR>/toml_to_string_test.mbt:285:26-285:36:
    | ///| (escaped)
    | test "serialize table with special key names" { (escaped)
    |   let table = Map::from_array([ (escaped)
285 |     ("normal-key", @toml.TomlString("value1")), (escaped)
    |                          ^^^^^^^^^^ (escaped)
    |     ("key with spaces", TomlString("value2")), (escaped)
    |     ("key.with.dots", TomlString("value3")), (escaped)

<WORKDIR>/toml_to_string_test.mbt:286:25-286:35:
    | test "serialize table with special key names" { (escaped)
    |   let table = Map::from_array([ (escaped)
    |     ("normal-key", @toml.TomlString("value1")), (escaped)
286 |     ("key with spaces", TomlString("value2")), (escaped)
    |                         ^^^^^^^^^^ (escaped)
    |     ("key.with.dots", TomlString("value3")), (escaped)
    |     ("key\\"with\\"quotes", TomlString("value4")), (escaped)

<WORKDIR>/toml_to_string_test.mbt:287:23-287:33:
    |   let table = Map::from_array([ (escaped)
    |     ("normal-key", @toml.TomlString("value1")), (escaped)
    |     ("key with spaces", TomlString("value2")), (escaped)
287 |     ("key.with.dots", TomlString("value3")), (escaped)
    |                       ^^^^^^^^^^ (escaped)
    |     ("key\\"with\\"quotes", TomlString("value4")), (escaped)
    |     ("key#with#hash", TomlString("value5")), (escaped)

<WORKDIR>/toml_to_string_test.mbt:288:27-288:37:
    |     ("normal-key", @toml.TomlString("value1")), (escaped)
    |     ("key with spaces", TomlString("value2")), (escaped)
    |     ("key.with.dots", TomlString("value3")), (escaped)
288 |     ("key\\"with\\"quotes", TomlString("value4")), (escaped)
    |                           ^^^^^^^^^^ (escaped)
    |     ("key#with#hash", TomlString("value5")), (escaped)
    |   ]) (escaped)

<WORKDIR>/toml_to_string_test.mbt:289:23-289:33:
    |     ("key with spaces", TomlString("value2")), (escaped)
    |     ("key.with.dots", TomlString("value3")), (escaped)
    |     ("key\\"with\\"quotes", TomlString("value4")), (escaped)
289 |     ("key#with#hash", TomlString("value5")), (escaped)
    |                       ^^^^^^^^^^ (escaped)
    |   ]) (escaped)
    |   inspect( (escaped)

<WORKDIR>/toml_to_string_test.mbt:329:20-329:30:
    | ///| (escaped)
    | test "serialize table with multiple array of tables" { (escaped)
    |   let product1 = Map::from_array([ (escaped)
329 |     ("name", @toml.TomlString("Hammer")), (escaped)
    |                    ^^^^^^^^^^ (escaped)
    |     ("sku", TomlInteger(738594937L)), (escaped)
    |   ]) (escaped)

<WORKDIR>/toml_to_string_test.mbt:333:20-333:30:
    |     ("sku", TomlInteger(738594937L)), (escaped)
    |   ]) (escaped)
    |   let product2 = Map::from_array([ (escaped)
333 |     ("name", @toml.TomlString("Nail")), (escaped)
    |                    ^^^^^^^^^^ (escaped)
    |     ("sku", TomlInteger(284758393L)), (escaped)
    |     ("color", TomlString("gray")), (escaped)

<WORKDIR>/toml_to_string_test.mbt:335:15-335:25:
    |   let product2 = Map::from_array([ (escaped)
    |     ("name", @toml.TomlString("Nail")), (escaped)
    |     ("sku", TomlInteger(284758393L)), (escaped)
335 |     ("color", TomlString("gray")), (escaped)
    |               ^^^^^^^^^^ (escaped)
    |   ]) (escaped)
    |   let root = Map::from_array([ (escaped)

<WORKDIR>/toml_to_string_test.mbt:496:21-496:31:
    | ///| (escaped)
    | test "roundtrip simple example" { (escaped)
    |   let doc = Map::from_array([ (escaped)
496 |     ("title", @toml.TomlString("TOML Example")), (escaped)
    |                     ^^^^^^^^^^ (escaped)
    |     ( (escaped)
    |       "owner", (escaped)

<WORKDIR>/toml_to_string_test.mbt:501:20-501:30:
    |       "owner", (escaped)
    |       TomlTable( (escaped)
    |         Map::from_array([ (escaped)
501 |           ("name", TomlString("Tom Preston-Werner")), (escaped)
    |                    ^^^^^^^^^^ (escaped)
    |           ("dob", TomlDateTime(OffsetDateTime("1979-05-27T07:32:00-08:00"))), (escaped)
    |         ]), (escaped)

<WORKDIR>/toml_utils.mbt:170:23-170:33:
    |   let new_table = create_array_of_tables(root_table, ["servers"]) (escaped)
    |  (escaped)
    |   // Add some data to the new table (escaped)
170 |   new_table["name"] = TomlString("alpha") (escaped)
    |                       ^^^^^^^^^^ (escaped)
    |   new_table["ip"] = TomlString("10.0.0.1") (escaped)
    |   inspect( (escaped)

<WORKDIR>/toml_utils.mbt:171:21-171:31:
    |  (escaped)
    |   // Add some data to the new table (escaped)
    |   new_table["name"] = TomlString("alpha") (escaped)
171 |   new_table["ip"] = TomlString("10.0.0.1") (escaped)
    |                     ^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     TomlTable(root_table), (escaped)

<WORKDIR>/toml_utils.mbt:190:20-190:30:
    |  (escaped)
    |   // Create first table (escaped)
    |   let table1 = create_array_of_tables(root_table, ["products"]) (escaped)
190 |   table1["name"] = TomlString("Hammer") (escaped)
    |                    ^^^^^^^^^^ (escaped)
    |   table1["sku"] = TomlInteger(738594937) (escaped)
    |  (escaped)

<WORKDIR>/toml_utils.mbt:195:20-195:30:
    |  (escaped)
    |   // Append second table to same array (escaped)
    |   let table2 = create_array_of_tables(root_table, ["products"]) (escaped)
195 |   table2["name"] = TomlString("Nail") (escaped)
    |                    ^^^^^^^^^^ (escaped)
    |   table2["sku"] = TomlInteger(284758393) (escaped)
    |  (escaped)

<WORKDIR>/toml_utils.mbt:200:20-200:30:
    |  (escaped)
    |   // Append third table (escaped)
    |   let table3 = create_array_of_tables(root_table, ["products"]) (escaped)
200 |   table3["name"] = TomlString("Screwdriver") (escaped)
    |                    ^^^^^^^^^^ (escaped)
    |   table3["sku"] = TomlInteger(987654321) (escaped)
    |   inspect( (escaped)

<WORKDIR>/toml_utils.mbt:230:26-230:36:
    |   let color_table1 = create_array_of_tables(root_table, [ (escaped)
    |     "fruit", "physical", "color", (escaped)
    |   ]) (escaped)
230 |   color_table1["name"] = TomlString("red") (escaped)
    |                          ^^^^^^^^^^ (escaped)
    |   color_table1["code"] = TomlString("#FF0000") (escaped)
    |  (escaped)

<WORKDIR>/toml_utils.mbt:231:26-231:36:
    |     "fruit", "physical", "color", (escaped)
    |   ]) (escaped)
    |   color_table1["name"] = TomlString("red") (escaped)
231 |   color_table1["code"] = TomlString("#FF0000") (escaped)
    |                          ^^^^^^^^^^ (escaped)
    |  (escaped)
    |   // Add another color (escaped)

<WORKDIR>/toml_utils.mbt:237:26-237:36:
    |   let color_table2 = create_array_of_tables(root_table, [ (escaped)
    |     "fruit", "physical", "color", (escaped)
    |   ]) (escaped)
237 |   color_table2["name"] = TomlString("green") (escaped)
    |                          ^^^^^^^^^^ (escaped)
    |   color_table2["code"] = TomlString("#00FF00") (escaped)
    |   inspect( (escaped)

<WORKDIR>/toml_utils.mbt:238:26-238:36:
    |     "fruit", "physical", "color", (escaped)
    |   ]) (escaped)
    |   color_table2["name"] = TomlString("green") (escaped)
238 |   color_table2["code"] = TomlString("#00FF00") (escaped)
    |                          ^^^^^^^^^^ (escaped)
    |   inspect( (escaped)
    |     TomlTable(root_table), (escaped)

<WORKDIR>/toml_utils.mbt:262:55-262:65:
    |   let root_table : Map[String, TomlValue] = Map([]) (escaped)
    |  (escaped)
    |   // First create a regular table structure (escaped)
262 |   set_dotted_key_value(root_table, ["owner", "name"], TomlString("Tom")) (escaped)
    |                                                       ^^^^^^^^^^ (escaped)
    |   set_dotted_key_value(root_table, ["owner", "dob"], TomlString("1979-05-27")) (escaped)
    |  (escaped)

<WORKDIR>/toml_utils.mbt:263:54-263:64:
    |  (escaped)
    |   // First create a regular table structure (escaped)
    |   set_dotted_key_value(root_table, ["owner", "name"], TomlString("Tom")) (escaped)
263 |   set_dotted_key_value(root_table, ["owner", "dob"], TomlString("1979-05-27")) (escaped)
    |                                                      ^^^^^^^^^^ (escaped)
    |  (escaped)
    |   // Now create array of tables at a different path (escaped)

<WORKDIR>/toml_utils.mbt:267:17-267:27:
    |  (escaped)
    |   // Now create array of tables at a different path (escaped)
    |   let db1 = create_array_of_tables(root_table, ["database", "servers"]) (escaped)
267 |   db1["host"] = TomlString("192.168.1.1") (escaped)
    |                 ^^^^^^^^^^ (escaped)
    |   db1["port"] = TomlInteger(5432) (escaped)
    |   let db2 = create_array_of_tables(root_table, ["database", "servers"]) (escaped)

<WORKDIR>/toml_utils.mbt:270:17-270:27:
    |   db1["host"] = TomlString("192.168.1.1") (escaped)
    |   db1["port"] = TomlInteger(5432) (escaped)
    |   let db2 = create_array_of_tables(root_table, ["database", "servers"]) (escaped)
270 |   db2["host"] = TomlString("192.168.1.2") (escaped)
    |                 ^^^^^^^^^^ (escaped)
    |   db2["port"] = TomlInteger(5433) (escaped)
    |   debug_inspect( (escaped)

<WORKDIR>/toml_utils.mbt:299:28-299:38:
    |   let root_table : Map[String, TomlValue] = Map([]) (escaped)
    |  (escaped)
    |   // Set a string value at "products" (escaped)
299 |   root_table["products"] = TomlString("not a table") (escaped)
    |                            ^^^^^^^^^^ (escaped)
    |  (escaped)
    |   // Try to create array of tables at ["products", "items"] (escaped)

<WORKDIR>/toml_utils.mbt:322:41-322:51:
    |   set_dotted_key_value( (escaped)
    |     root_table, (escaped)
    |     ["servers", "alpha"], (escaped)
322 |     TomlTable(Map::from_array([("name", TomlString("main"))])), (escaped)
    |                                         ^^^^^^^^^^ (escaped)
    |   ) (escaped)
    |  (escaped)

<WORKDIR>/toml_utils.mbt:342:20-342:30:
    |  (escaped)
    |   // Create first [[fruits]] (escaped)
    |   let fruit1 = create_array_of_tables(root_table, ["fruits"]) (escaped)
342 |   fruit1["name"] = TomlString("apple") (escaped)
    |                    ^^^^^^^^^^ (escaped)
    |  (escaped)
    |   // Create second [[fruits]] (escaped)

<WORKDIR>/toml_utils.mbt:346:20-346:30:
    |  (escaped)
    |   // Create second [[fruits]] (escaped)
    |   let fruit2 = create_array_of_tables(root_table, ["fruits"]) (escaped)
346 |   fruit2["name"] = TomlString("banana") (escaped)
    |                    ^^^^^^^^^^ (escaped)
    |  (escaped)
    |   // Create [[vegetables]] (escaped)

<WORKDIR>/toml_utils.mbt:350:18-350:28:
    |  (escaped)
    |   // Create [[vegetables]] (escaped)
    |   let veg1 = create_array_of_tables(root_table, ["vegetables"]) (escaped)
350 |   veg1["name"] = TomlString("carrot") (escaped)
    |                  ^^^^^^^^^^ (escaped)
    |   veg1["color"] = TomlString("orange") (escaped)
    |   let veg2 = create_array_of_tables(root_table, ["vegetables"]) (escaped)

<WORKDIR>/toml_utils.mbt:351:19-351:29:
    |   // Create [[vegetables]] (escaped)
    |   let veg1 = create_array_of_tables(root_table, ["vegetables"]) (escaped)
    |   veg1["name"] = TomlString("carrot") (escaped)
351 |   veg1["color"] = TomlString("orange") (escaped)
    |                   ^^^^^^^^^^ (escaped)
    |   let veg2 = create_array_of_tables(root_table, ["vegetables"]) (escaped)
    |   veg2["name"] = TomlString("lettuce") (escaped)

<WORKDIR>/toml_utils.mbt:353:18-353:28:
    |   veg1["name"] = TomlString("carrot") (escaped)
    |   veg1["color"] = TomlString("orange") (escaped)
    |   let veg2 = create_array_of_tables(root_table, ["vegetables"]) (escaped)
353 |   veg2["name"] = TomlString("lettuce") (escaped)
    |                  ^^^^^^^^^^ (escaped)
    |   veg2["color"] = TomlString("green") (escaped)
    |   debug_inspect( (escaped)

<WORKDIR>/toml_utils.mbt:354:19-354:29:
    |   veg1["color"] = TomlString("orange") (escaped)
    |   let veg2 = create_array_of_tables(root_table, ["vegetables"]) (escaped)
    |   veg2["name"] = TomlString("lettuce") (escaped)
354 |   veg2["color"] = TomlString("green") (escaped)
    |                   ^^^^^^^^^^ (escaped)
    |   debug_inspect( (escaped)
    |     root_table, (escaped)

<WORKDIR>/toml_utils.mbt:474:41-474:51:
    | test "set dotted key value - simple key" { (escaped)
    |   // Test setting a simple key (path length 1) (escaped)
    |   let table : Map[String, TomlValue] = Map([]) (escaped)
474 |   set_dotted_key_value(table, ["name"], TomlString("Alice")) (escaped)
    |                                         ^^^^^^^^^^ (escaped)
    |   debug_inspect( (escaped)
    |     table, (escaped)

<WORKDIR>/toml_utils.mbt:487:51-487:61:
    | test "set dotted key value - nested keys creating tables" { (escaped)
    |   // Test creating nested tables automatically (escaped)
    |   let table : Map[String, TomlValue] = Map([]) (escaped)
487 |   set_dotted_key_value(table, ["server", "host"], TomlString("localhost")) (escaped)
    |                                                   ^^^^^^^^^^ (escaped)
    |   set_dotted_key_value(table, ["server", "port"], TomlInteger(8080)) (escaped)
    |   debug_inspect( (escaped)

<WORKDIR>/toml_utils.mbt:504:5-504:15:
    |   set_dotted_key_value( (escaped)
    |     table, (escaped)
    |     ["a", "b", "c", "d", "e"], (escaped)
504 |     TomlString("deep value"), (escaped)
    |     ^^^^^^^^^^ (escaped)
    |   ) (escaped)
    |   debug_inspect( (escaped)

<WORKDIR>/toml_utils.mbt:520:55-520:65:
    |   let table : Map[String, TomlValue] = Map([]) (escaped)
    |  (escaped)
    |   // Add multiple values at different levels (escaped)
520 |   set_dotted_key_value(table, ["database", "server"], TomlString("postgres")) (escaped)
    |                                                       ^^^^^^^^^^ (escaped)
    |   set_dotted_key_value(table, ["database", "port"], TomlInteger(5432)) (escaped)
    |   set_dotted_key_value( (escaped)

<WORKDIR>/toml_utils.mbt:525:5-525:15:
    |   set_dotted_key_value( (escaped)
    |     table, (escaped)
    |     ["database", "credentials", "user"], (escaped)
525 |     TomlString("admin"), (escaped)
    |     ^^^^^^^^^^ (escaped)
    |   ) (escaped)
    |   set_dotted_key_value( (escaped)

<WORKDIR>/toml_utils.mbt:530:5-530:15:
    |   set_dotted_key_value( (escaped)
    |     table, (escaped)
    |     ["database", "credentials", "password"], (escaped)
530 |     TomlString("secret"), (escaped)
    |     ^^^^^^^^^^ (escaped)
    |   ) (escaped)
    |   set_dotted_key_value(table, ["database", "options", "ssl"], TomlBoolean(true)) (escaped)

<WORKDIR>/toml_utils.mbt:569:48-569:58:
    |   let table : Map[String, TomlValue] = Map([]) (escaped)
    |  (escaped)
    |   // Create initial structure (escaped)
569 |   set_dotted_key_value(table, ["app", "name"], TomlString("MyApp")) (escaped)
    |                                                ^^^^^^^^^^ (escaped)
    |   set_dotted_key_value(table, ["app", "version"], TomlString("1.0.0")) (escaped)
    |  (escaped)

<WORKDIR>/toml_utils.mbt:570:51-570:61:
    |  (escaped)
    |   // Create initial structure (escaped)
    |   set_dotted_key_value(table, ["app", "name"], TomlString("MyApp")) (escaped)
570 |   set_dotted_key_value(table, ["app", "version"], TomlString("1.0.0")) (escaped)
    |                                                   ^^^^^^^^^^ (escaped)
    |  (escaped)
    |   // Add more values to the same table later (escaped)

<WORKDIR>/toml_utils.mbt:573:50-573:60:
    |   set_dotted_key_value(table, ["app", "version"], TomlString("1.0.0")) (escaped)
    |  (escaped)
    |   // Add more values to the same table later (escaped)
573 |   set_dotted_key_value(table, ["app", "author"], TomlString("Developer")) (escaped)
    |                                                  ^^^^^^^^^^ (escaped)
    |   set_dotted_key_value(table, ["app", "license"], TomlString("MIT")) (escaped)
    |   debug_inspect( (escaped)

<WORKDIR>/toml_utils.mbt:574:51-574:61:
    |  (escaped)
    |   // Add more values to the same table later (escaped)
    |   set_dotted_key_value(table, ["app", "author"], TomlString("Developer")) (escaped)
574 |   set_dotted_key_value(table, ["app", "license"], TomlString("MIT")) (escaped)
    |                                                   ^^^^^^^^^^ (escaped)
    |   debug_inspect( (escaped)
    |     table, (escaped)

<WORKDIR>/toml_utils.mbt:597:43-597:53:
    |   let table : Map[String, TomlValue] = {} (escaped)
    |  (escaped)
    |   // Set a string value at "config" (escaped)
597 |   set_dotted_key_value(table, ["config"], TomlString("simple value")) (escaped)
    |                                           ^^^^^^^^^^ (escaped)
    |  (escaped)
    |   // Try to treat "config" as a table - this should raise an error (escaped)

<WORKDIR>/toml_utils.mbt:601:55-601:65:
    |  (escaped)
    |   // Try to treat "config" as a table - this should raise an error (escaped)
    |   try (escaped)
601 |     set_dotted_key_value(table, ["config", "nested"], TomlString("value")) (escaped)
    |                                                       ^^^^^^^^^^ (escaped)
    |   catch { (escaped)
    |     err => (escaped)

<WORKDIR>/toml_utils.mbt:659:40-659:50:
    |   let table : Map[String, TomlValue] = Map([]) (escaped)
    |  (escaped)
    |   // Set a value first (escaped)
659 |   set_dotted_key_value(table, ["key"], TomlString("value")) (escaped)
    |                                        ^^^^^^^^^^ (escaped)
    |  (escaped)
    |   // Try with empty path - currently does nothing (escaped)

<WORKDIR>/toml_utils.mbt:662:35-662:45:
    |   set_dotted_key_value(table, ["key"], TomlString("value")) (escaped)
    |  (escaped)
    |   // Try with empty path - currently does nothing (escaped)
662 |   set_dotted_key_value(table, [], TomlString("should not appear")) (escaped)
    |                                   ^^^^^^^^^^ (escaped)
    |  (escaped)
    |   // Table should only have the first key (escaped)

````

````mooncram
$ run_moon_ide moon ide find-references 'TestResult' --loc 'e2e/runner.mbt:7:12'
Found 3 references for symbol 'TestResult':
<WORKDIR>/e2e/runner.mbt:7:12-7:22:
  | /// `failures` carries one entry per failing case (typically including the (escaped)
  | /// fixture path and a short reason) so that the test harness can print a (escaped)
  | /// summary at the end without re-walking the corpus. (escaped)
7 | pub struct TestResult { (escaped)
  |            ^^^^^^^^^^ (escaped)
  |   passed : Int (escaped)
  |   failed : Int (escaped)

<WORKDIR>/e2e/runner.mbt:15:8-15:18:
   |  (escaped)
   | ///| (escaped)
   | /// Create an empty `TestResult` with zero counts and no failures recorded. (escaped)
15 | pub fn TestResult::new() -> TestResult { (escaped)
   |        ^^^^^^^^^^ (escaped)
   |   { passed: 0, failed: 0, failures: [] } (escaped)
   | } (escaped)

<WORKDIR>/e2e/runner.mbt:15:29-15:39:
   |  (escaped)
   | ///| (escaped)
   | /// Create an empty `TestResult` with zero counts and no failures recorded. (escaped)
15 | pub fn TestResult::new() -> TestResult { (escaped)
   |                             ^^^^^^^^^^ (escaped)
   |   { passed: 0, failed: 0, failures: [] } (escaped)
   | } (escaped)

````

````mooncram
$ run_moon_ide moon ide find-references 'passed' --loc 'e2e/runner.mbt:8:3'
Found 2 references for symbol 'passed':
<WORKDIR>/e2e/runner.mbt:8:3-8:9:
  | /// fixture path and a short reason) so that the test harness can print a (escaped)
  | /// summary at the end without re-walking the corpus. (escaped)
  | pub struct TestResult { (escaped)
8 |   passed : Int (escaped)
  |   ^^^^^^ (escaped)
  |   failed : Int (escaped)
  |   failures : Array[String] (escaped)

<WORKDIR>/e2e/runner.mbt:16:5-16:11:
   | ///| (escaped)
   | /// Create an empty `TestResult` with zero counts and no failures recorded. (escaped)
   | pub fn TestResult::new() -> TestResult { (escaped)
16 |   { passed: 0, failed: 0, failures: [] } (escaped)
   |     ^^^^^^ (escaped)
   | } (escaped)
   |  (escaped)

````

````mooncram
$ run_moon_ide moon ide find-references 'to_test_json' --loc 'e2e/convert.mbt:5:8'
Found 5 references for symbol 'to_test_json':
<WORKDIR>/e2e/convert.mbt:5:8-5:20:
  | /// Convert a TomlValue to the toml-test JSON format. (escaped)
  | /// Leaf values become {"type": "...", "value": "..."} (escaped)
  | /// Tables become plain JSON objects, arrays become JSON arrays. (escaped)
5 | pub fn to_test_json(value : @toml.TomlValue) -> Json { (escaped)
  |        ^^^^^^^^^^^^ (escaped)
  |   match value { (escaped)
  |     TomlString(s) => typed_value("string", s) (escaped)

<WORKDIR>/e2e/convert.mbt:20:53-20:65:
   |         _ => typed_value("date-local", s) (escaped)
   |       } (escaped)
   |     } (escaped)
20 |     TomlArray(arr) => Json::array([ for v in arr => to_test_json(v) ]) (escaped)
   |                                                     ^^^^^^^^^^^^ (escaped)
   |     TomlTable(table) => (escaped)
   |       Json::object( (escaped)

<WORKDIR>/e2e/convert.mbt:23:52-23:64:
   |     TomlArray(arr) => Json::array([ for v in arr => to_test_json(v) ]) (escaped)
   |     TomlTable(table) => (escaped)
   |       Json::object( (escaped)
23 |         Map::from_array([ for k, v in table => (k, to_test_json(v)) ]), (escaped)
   |                                                    ^^^^^^^^^^^^ (escaped)
   |       ) (escaped)
   |   } (escaped)

<WORKDIR>/e2e/e2e_test.mbt:30:27-30:39:
   |         failed += 1 (escaped)
   |       } (escaped)
   |       Ok(value) => { (escaped)
30 |         let actual = @e2e.to_test_json(value) (escaped)
   |                           ^^^^^^^^^^^^ (escaped)
   |         if !@e2e.json_equal(actual, expected) { (escaped)
   |           failures.push( (escaped)

<WORKDIR>/e2e/runner.mbt:53:20-53:32:
   |   match parsed { (escaped)
   |     Err(e) => Some("[PARSE-ERROR] \\{toml_path}: \\{e}") (escaped)
   |     Ok(value) => { (escaped)
53 |       let actual = to_test_json(value) (escaped)
   |                    ^^^^^^^^^^^^ (escaped)
   |       if !json_equal(actual, expected) { (escaped)
   |         Some( (escaped)

````

````mooncram
$ run_moon_ide moon ide find-references 'value' --loc 'e2e/convert.mbt:5:21'
Found 3 references for symbol 'value':
<WORKDIR>/e2e/convert.mbt:5:21-5:26:
  | /// Convert a TomlValue to the toml-test JSON format. (escaped)
  | /// Leaf values become {"type": "...", "value": "..."} (escaped)
  | /// Tables become plain JSON objects, arrays become JSON arrays. (escaped)
5 | pub fn to_test_json(value : @toml.TomlValue) -> Json { (escaped)
  |                     ^^^^^ (escaped)
  |   match value { (escaped)
  |     TomlString(s) => typed_value("string", s) (escaped)

<WORKDIR>/e2e/convert.mbt:6:9-6:14:
  | /// Leaf values become {"type": "...", "value": "..."} (escaped)
  | /// Tables become plain JSON objects, arrays become JSON arrays. (escaped)
  | pub fn to_test_json(value : @toml.TomlValue) -> Json { (escaped)
6 |   match value { (escaped)
  |         ^^^^^ (escaped)
  |     TomlString(s) => typed_value("string", s) (escaped)
  |     TomlInteger(i) => typed_value("integer", i.to_string()) (escaped)

<WORKDIR>/e2e/convert.mbt:12:23-12:28:
   |     TomlFloat(f) => typed_value("float", format_test_float(f)) (escaped)
   |     TomlBoolean(b) => typed_value("bool", if b { "true" } else { "false" }) (escaped)
   |     TomlDateTime(_) => { (escaped)
12 |       let (kind, s) = value.datetime_info().unwrap() (escaped)
   |                       ^^^^^ (escaped)
   |       match kind { (escaped)
   |         "OffsetDateTime" => typed_value("datetime", normalize_datetime(s)) (escaped)

````

````mooncram
$ run_moon_ide moon ide find-references 'files' --loc 'e2e/e2e_test.mbt:3:7'
Found 4 references for symbol 'files':
<WORKDIR>/e2e/e2e_test.mbt:3:7-3:12:
  | ///| (escaped)
  | async test "valid toml-test suite" { (escaped)
3 |   let files : Array[String] = [] (escaped)
  |       ^^^^^ (escaped)
  |   @e2e.collect_toml_files("e2e/testdata/valid", files) (escaped)
  |   files.sort() (escaped)

<WORKDIR>/e2e/e2e_test.mbt:4:49-4:54:
  | ///| (escaped)
  | async test "valid toml-test suite" { (escaped)
  |   let files : Array[String] = [] (escaped)
4 |   @e2e.collect_toml_files("e2e/testdata/valid", files) (escaped)
  |                                                 ^^^^^ (escaped)
  |   files.sort() (escaped)
  |   let mut passed = 0 (escaped)

<WORKDIR>/e2e/e2e_test.mbt:5:3-5:8:
  | async test "valid toml-test suite" { (escaped)
  |   let files : Array[String] = [] (escaped)
  |   @e2e.collect_toml_files("e2e/testdata/valid", files) (escaped)
5 |   files.sort() (escaped)
  |   ^^^^^ (escaped)
  |   let mut passed = 0 (escaped)
  |   let mut failed = 0 (escaped)

<WORKDIR>/e2e/e2e_test.mbt:9:20-9:25:
  |   let mut passed = 0 (escaped)
  |   let mut failed = 0 (escaped)
  |   let failures : Array[String] = [] (escaped)
9 |   for toml_path in files { (escaped)
  |                    ^^^^^ (escaped)
  |     let json_path = "\\{toml_path[:toml_path.length() - 5]}.json" (escaped)
  |     if !@fs.path_exists(json_path) { (escaped)

````

````mooncram
$ run_moon_ide moon ide find-references 'collect_toml_files' --loc 'e2e/e2e_test.mbt:4:8'
Found 4 references for symbol 'collect_toml_files':
<WORKDIR>/e2e/e2e_test.mbt:4:8-4:26:
  | ///| (escaped)
  | async test "valid toml-test suite" { (escaped)
  |   let files : Array[String] = [] (escaped)
4 |   @e2e.collect_toml_files("e2e/testdata/valid", files) (escaped)
  |        ^^^^^^^^^^^^^^^^^^ (escaped)
  |   files.sort() (escaped)
  |   let mut passed = 0 (escaped)

<WORKDIR>/e2e/e2e_test.mbt:60:8-60:26:
   | ///| (escaped)
   | async test "invalid toml-test suite" { (escaped)
   |   let files : Array[String] = [] (escaped)
60 |   @e2e.collect_toml_files("e2e/testdata/invalid", files) (escaped)
   |        ^^^^^^^^^^^^^^^^^^ (escaped)
   |   files.sort() (escaped)
   |   let mut passed = 0 (escaped)

<WORKDIR>/e2e/runner.mbt:21:8-21:26:
   |  (escaped)
   | ///| (escaped)
   | /// Recursively collect all .toml files in a directory. (escaped)
21 | pub fn collect_toml_files( (escaped)
   |        ^^^^^^^^^^^^^^^^^^ (escaped)
   |   dir : String, (escaped)
   |   files : Array[String], (escaped)

<WORKDIR>/e2e/runner.mbt:29:7-29:25:
   |   for entry in entries { (escaped)
   |     let path = "\\{dir}/\\{entry}" (escaped)
   |     if @fs.is_dir(path) { (escaped)
29 |       collect_toml_files(path, files) (escaped)
   |       ^^^^^^^^^^^^^^^^^^ (escaped)
   |     } else if entry.has_suffix(".toml") { (escaped)
   |       files.push(path) (escaped)

````

````mooncram
$ run_moon_ide moon ide find-references 'result' --loc 'e2e/known_failures_test.mbt:10:7'
Found 2 references for symbol 'result':
<WORKDIR>/e2e/known_failures_test.mbt:10:7-10:13:
   |  (escaped)
   | ///| (escaped)
   | test "fixed: [a-a-a] table header parses correctly" { (escaped)
10 |   let result = try? @toml.parse("[a-a-a]\\n_ = false\\n") (escaped)
   |       ^^^^^^ (escaped)
   |   debug_inspect( (escaped)
   |     result, (escaped)

<WORKDIR>/e2e/known_failures_test.mbt:12:5-12:11:
   | test "fixed: [a-a-a] table header parses correctly" { (escaped)
   |   let result = try? @toml.parse("[a-a-a]\\n_ = false\\n") (escaped)
   |   debug_inspect( (escaped)
12 |     result, (escaped)
   |     ^^^^^^ (escaped)
   |     content=( (escaped)
   |       #|Ok(TomlTable({ "a-a-a": TomlTable({ "_": TomlBoolean(false) }) })) (escaped)

````

````mooncram
$ run_moon_ide moon ide find-references 'parse' --loc 'e2e/known_failures_test.mbt:10:27'
Found 167 references for symbol 'parse':
<WORKDIR>/README.mbt.md:86:22-86:27:
   | ///| (escaped)
   | test { (escaped)
   |   // Quick start example - parsing and accessing values (escaped)
86 |   let config = @toml.parse( (escaped)
   |                      ^^^^^ (escaped)
   |     ( (escaped)
   |       #|title = "My App" (escaped)

<WORKDIR>/README.mbt.md:207:22-207:27:
    | test { (escaped)
    |   // Error handling with try-catch (escaped)
    |   let invalid_toml = "invalid = [unclosed" (escaped)
207 |   let config = @toml.parse(invalid_toml) catch { (escaped)
    |                      ^^^^^ (escaped)
    |     _ => TomlTable(Map([])) // Return default value on error (escaped)
    |   } (escaped)

<WORKDIR>/README.mbt.md:214:27-214:32:
    |   assert_eq(table.length(), 0) // Empty table from error handler (escaped)
    |  (escaped)
    |   // Error handling with try? - converts to Result type (escaped)
214 |   let result = try? @toml.parse("key = \\"value\\"") (escaped)
    |                           ^^^^^ (escaped)
    |   guard result is Ok(TomlTable({ "key": _, .. })) else { (escaped)
    |     fail("Should have parsed successfully with key") (escaped)

<WORKDIR>/README.mbt.md:220:31-220:36:
    |   } (escaped)
    |  (escaped)
    |   // Parsing error example (escaped)
220 |   let bad_result = try? @toml.parse("bad syntax here") (escaped)
    |                               ^^^^^ (escaped)
    |   assert_true(bad_result is Err(_)) (escaped)
    | } (escaped)

<WORKDIR>/README.mbt.md:250:11-250:16:
    |     #|max_connections = 100 (escaped)
    |     #| (escaped)
    |   debug_inspect( (escaped)
250 |     @toml.parse(toml), (escaped)
    |           ^^^^^ (escaped)
    |     content=( (escaped)
    |       #|TomlTable( (escaped)

<WORKDIR>/README.mbt.md:277:11-277:16:
    |     #|booleans = [true, false, true] (escaped)
    |     #| (escaped)
    |   debug_inspect( (escaped)
277 |     @toml.parse(toml_arrays), (escaped)
    |           ^^^^^ (escaped)
    |     content=( (escaped)
    |       #|TomlTable( (escaped)

<WORKDIR>/README.mbt.md:321:11-321:16:
    |     #|sku = 284758393 (escaped)
    |     #| (escaped)
    |   debug_inspect( (escaped)
321 |     @toml.parse(toml_tables), (escaped)
    |           ^^^^^ (escaped)
    |     content=( (escaped)
    |       #|TomlTable( (escaped)

<WORKDIR>/README.mbt.md:353:11-353:16:
    |     #|meeting_time = 14:30:00 (escaped)
    |     #| (escaped)
    |   debug_inspect( (escaped)
353 |     @toml.parse(toml_datetime), (escaped)
    |           ^^^^^ (escaped)
    |     content=( (escaped)
    |       #|TomlTable( (escaped)

<WORKDIR>/README.mbt.md:381:11-381:16:
    |     #|cache = {enabled = true, ttl = 300} (escaped)
    |     #| (escaped)
    |   debug_inspect( (escaped)
381 |     @toml.parse(toml_inline), (escaped)
    |           ^^^^^ (escaped)
    |     content=( (escaped)
    |       #|TomlTable( (escaped)

<WORKDIR>/README.mbt.md:419:22-419:27:
    |     #|  2023-08-20T02:00:00 (escaped)
    |     #|] (escaped)
    |     #| (escaped)
419 |   let result = @toml.parse(config) (escaped)
    |                      ^^^^^ (escaped)
    |   assert_true(result.validate()) (escaped)
    |   // Verify the structure contains expected keys (escaped)

<WORKDIR>/README.mbt.md:471:11-471:16:
    |     #|weight = 0.5 (escaped)
    |     #| (escaped)
    |   debug_inspect( (escaped)
471 |     @toml.parse(toml_advanced), (escaped)
    |           ^^^^^ (escaped)
    |     content=( (escaped)
    |       #|TomlTable( (escaped)

<WORKDIR>/README.mbt.md:564:27-564:32:
    | ///| (escaped)
    | test { (escaped)
    |   // Working with nested tables (escaped)
564 |   let parsed_toml = @toml.parse( (escaped)
    |                           ^^^^^ (escaped)
    |     ( (escaped)
    |       #|[database] (escaped)

<WORKDIR>/README.mbt.md:604:21-604:26:
    | ///| (escaped)
    | test { (escaped)
    |   // Valid: all integers (escaped)
604 |   let valid = @toml.parse("numbers = [1, 2, 3]") (escaped)
    |                     ^^^^^ (escaped)
    |   assert_true(valid.validate()) (escaped)
    |  (escaped)

<WORKDIR>/README.mbt.md:608:21-608:26:
    |   assert_true(valid.validate()) (escaped)
    |  (escaped)
    |   // Mixed types are allowed during parsing but fail validation (escaped)
608 |   let mixed = @toml.parse("mixed = [1, \\"two\\", 3.0]") (escaped)
    |                     ^^^^^ (escaped)
    |   assert_false(mixed.validate()) // Validation catches the type mismatch (escaped)
    | } (escaped)

<WORKDIR>/README.mbt.md:619:27-619:32:
    | ///| (escaped)
    | test { (escaped)
    |   // Working with all 4 datetime types (escaped)
619 |   let parsed_toml = @toml.parse( (escaped)
    |                           ^^^^^ (escaped)
    |     ( (escaped)
    |       #|offset_dt = 2023-01-15T10:30:00Z (escaped)

<WORKDIR>/additional_official_tests_test.mbt:17:11-17:16:
   |     #|"ʎǝʞ" = "value" (escaped)
   |     #| (escaped)
   |   debug_inspect( (escaped)
17 |     @toml.parse(key_variations_toml), (escaped)
   |           ^^^^^ (escaped)
   |     content=( (escaped)
   |       #|TomlTable( (escaped)

<WORKDIR>/additional_official_tests_test.mbt:40:11-40:16:
   |     #|0 = "zero" (escaped)
   |     #| (escaped)
   |   debug_inspect( (escaped)
40 |     @toml.parse(numeric_keys_toml), (escaped)
   |           ^^^^^ (escaped)
   |     content=( (escaped)
   |       #|TomlTable({ "1234": TomlString("value"), "0": TomlString("zero") }) (escaped)

<WORKDIR>/additional_official_tests_test.mbt:63:11-63:16:
   |     #|quote = "This has a quote: \\"" (escaped)
   |     #| (escaped)
   |   debug_inspect( (escaped)
63 |     @toml.parse(escape_sequences_toml), (escaped)
   |           ^^^^^ (escaped)
   |     content=( (escaped)
   |       #|TomlTable( (escaped)

<WORKDIR>/additional_official_tests_test.mbt:94:11-94:16:
   |     #|large_number = 9223372036854775807 (escaped)
   |     #| (escaped)
   |   debug_inspect( (escaped)
94 |     @toml.parse(numbers_toml), (escaped)
   |           ^^^^^ (escaped)
   |     content=( (escaped)
   |       #|TomlTable( (escaped)

<WORKDIR>/additional_official_tests_test.mbt:123:11-123:16:
    |     #|array_with_spaces = [ [ 1 , 2 ] , [ 3 , 4 ] ] (escaped)
    |     #| (escaped)
    |   debug_inspect( (escaped)
123 |     @toml.parse(nested_arrays_toml), (escaped)
    |           ^^^^^ (escaped)
    |     content=( (escaped)
    |       #|TomlTable( (escaped)

<WORKDIR>/additional_official_tests_test.mbt:174:11-174:16:
    |     #|spaces = { key1 = "value1" , key2 = "value2" } (escaped)
    |     #| (escaped)
    |   debug_inspect( (escaped)
174 |     @toml.parse(inline_tables_toml), (escaped)
    |           ^^^^^ (escaped)
    |     content=( (escaped)
    |       #|TomlTable( (escaped)

<WORKDIR>/additional_official_tests_test.mbt:229:11-229:16:
    |     #|features = {new_ui = true, beta_api = false, experimental = true} (escaped)
    |     #| (escaped)
    |   debug_inspect( (escaped)
229 |     @toml.parse(config_toml), (escaped)
    |           ^^^^^ (escaped)
    |     content=( (escaped)
    |       #|TomlTable( (escaped)

<WORKDIR>/additional_official_tests_test.mbt:291:11-291:16:
    |     #|table3= { a=1 , b=2 } (escaped)
    |     #| (escaped)
    |   debug_inspect( (escaped)
291 |     @toml.parse(whitespace_edge_toml), (escaped)
    |           ^^^^^ (escaped)
    |     content=( (escaped)
    |       #|TomlTable( (escaped)

<WORKDIR>/additional_official_tests_test.mbt:329:11-329:16:
    |     #|single_key_table = {key = "value"} (escaped)
    |     #| (escaped)
    |   debug_inspect( (escaped)
329 |     @toml.parse(boundary_toml), (escaped)
    |           ^^^^^ (escaped)
    |     content=( (escaped)
    |       #|TomlTable( (escaped)

<WORKDIR>/cmd/main/main.mbt:26:24-26:29:
   |   println("Input TOML:") (escaped)
   |   println(toml_input) (escaped)
   |   try { (escaped)
26 |     let result = @toml.parse(toml_input) (escaped)
   |                        ^^^^^ (escaped)
   |     println("\\nParsed result:") (escaped)
   |     println(result.to_string()) (escaped)

<WORKDIR>/cmd/main/main.mbt:39:24-39:29:
   |   println("Input TOML:") (escaped)
   |   println(toml_array) (escaped)
   |   try { (escaped)
39 |     let result = @toml.parse(toml_array) (escaped)
   |                        ^^^^^ (escaped)
   |     println("\\nParsed result:") (escaped)
   |     println(result.to_string()) (escaped)

<WORKDIR>/cmd/main/main.mbt:52:24-52:29:
   |   println("Input TOML:") (escaped)
   |   println(toml_table) (escaped)
   |   try { (escaped)
52 |     let result = @toml.parse(toml_table) (escaped)
   |                        ^^^^^ (escaped)
   |     println("\\nParsed result:") (escaped)
   |     println(result.to_string()) (escaped)

<WORKDIR>/comprehensive_test.mbt:13:11-13:16:
   |     #|ports = [8000, 8001, 8002] (escaped)
   |     #| (escaped)
   |   debug_inspect( (escaped)
13 |     @toml.parse(simple_toml), (escaped)
   |           ^^^^^ (escaped)
   |     content=( (escaped)
   |       #|TomlTable( (escaped)

<WORKDIR>/comprehensive_test.mbt:39:11-39:16:
   |     #|floats = [1.1, 2.2, 3.3] (escaped)
   |     #| (escaped)
   |   debug_inspect( (escaped)
39 |     @toml.parse(complex_toml), (escaped)
   |           ^^^^^ (escaped)
   |     content=( (escaped)
   |       #|TomlTable( (escaped)

<WORKDIR>/comprehensive_test.mbt:85:11-85:16:
   |     #|endpoints = ["/api/v1", "/api/v2", "/health"] (escaped)
   |     #| (escaped)
   |   debug_inspect( (escaped)
85 |     @toml.parse(inline_toml), (escaped)
   |           ^^^^^ (escaped)
   |     content=( (escaped)
   |       #|TomlTable( (escaped)

<WORKDIR>/comprehensive_test.mbt:123:11-123:16:
    |     #|features = {logging = true, metrics = false, caching = {enabled = true, ttl = 300}} (escaped)
    |     #| (escaped)
    |   debug_inspect( (escaped)
123 |     @toml.parse(app_config), (escaped)
    |           ^^^^^ (escaped)
    |     content=( (escaped)
    |       #|TomlTable( (escaped)

<WORKDIR>/comprehensive_test.mbt:166:11-166:16:
    |     #|mixed = ["double", 'single', "escaped\\"quote"] (escaped)
    |     #| (escaped)
    |   debug_inspect( (escaped)
166 |     @toml.parse(string_tests), (escaped)
    |           ^^^^^ (escaped)
    |     content=( (escaped)
    |       #|TomlTable( (escaped)

<WORKDIR>/comprehensive_test.mbt:202:11-202:16:
    |     #|mixed_numbers = [0, 1, 42, 3.14, 2.5, 0.0] (escaped)
    |     #| (escaped)
    |   debug_inspect( (escaped)
202 |     @toml.parse(number_tests), (escaped)
    |           ^^^^^ (escaped)
    |     content=( (escaped)
    |       #|TomlTable( (escaped)

<WORKDIR>/comprehensive_test.mbt:229:11-229:16:
    | ///| (escaped)
    | test "empty array" { (escaped)
    |   debug_inspect( (escaped)
229 |     @toml.parse( (escaped)
    |           ^^^^^ (escaped)
    |       ( (escaped)
    |         #|empty_array = [] (escaped)

<WORKDIR>/comprehensive_test.mbt:253:11-253:16:
    |     #|small_negative = -0.001 (escaped)
    |     #| (escaped)
    |   debug_inspect( (escaped)
253 |     @toml.parse(negative_toml), (escaped)
    |           ^^^^^ (escaped)
    |     content=( (escaped)
    |       #|TomlTable( (escaped)

<WORKDIR>/comprehensive_test.mbt:275:11-275:16:
    | test "negative numbers in context" { (escaped)
    |   // Single negative integer (escaped)
    |   debug_inspect( (escaped)
275 |     @toml.parse( (escaped)
    |           ^^^^^ (escaped)
    |       ( (escaped)
    |         #|count = -5 (escaped)

<WORKDIR>/comprehensive_test.mbt:287:11-287:16:
    |  (escaped)
    |   // Single negative float   (escaped)
    |   debug_inspect( (escaped)
287 |     @toml.parse( (escaped)
    |           ^^^^^ (escaped)
    |       ( (escaped)
    |         #|temperature = -15.5 (escaped)

<WORKDIR>/comprehensive_test.mbt:299:11-299:16:
    |  (escaped)
    |   // Array with mixed positive and negative numbers (escaped)
    |   debug_inspect( (escaped)
299 |     @toml.parse( (escaped)
    |           ^^^^^ (escaped)
    |       ( (escaped)
    |         #|values = [1, -2, 3.0, -4.5] (escaped)

<WORKDIR>/comprehensive_test.mbt:314:11-314:16:
    |     #|coords = {x = -10, y = 20, z = -5.5} (escaped)
    |     #| (escaped)
    |   debug_inspect( (escaped)
314 |     @toml.parse(coords_toml), (escaped)
    |           ^^^^^ (escaped)
    |     content=( (escaped)
    |       #|TomlTable({ "coords": TomlTable({ "x": TomlInteger(-10), "y": TomlInteger(20), "z": TomlFloat(-5.5) }) }) (escaped)

<WORKDIR>/comprehensive_test.mbt:327:11-327:16:
    |     #|adjustment = -0.1 (escaped)
    |     #| (escaped)
    |   debug_inspect( (escaped)
327 |     @toml.parse(multi_negative), (escaped)
    |           ^^^^^ (escaped)
    |     content=( (escaped)
    |       #|TomlTable( (escaped)

<WORKDIR>/comprehensive_test.mbt:356:11-356:16:
    |     #|rate_limiting = {enabled = true, requests_per_minute = 1000, burst = 50} (escaped)
    |     #| (escaped)
    |   debug_inspect( (escaped)
356 |     @toml.parse(microservice_config), (escaped)
    |           ^^^^^ (escaped)
    |     content=( (escaped)
    |       #|TomlTable( (escaped)

<WORKDIR>/comprehensive_test.mbt:655:16-655:21:
    |  (escaped)
    |   // Test 5: Invalid syntax after comma (escaped)
    |   debug_inspect( (escaped)
655 |     try? @toml.parse("table = {key1 = \\"val1\\", }"), (escaped)
    |                ^^^^^ (escaped)
    |     content=( (escaped)
    |       #|Ok(TomlTable({ "table": TomlTable({ "key1": TomlString("val1") }) })) (escaped)

<WORKDIR>/comprehensive_test.mbt:876:11-876:16:
    | test "edge cases" { (escaped)
    |   // Empty input should result in empty table (escaped)
    |   debug_inspect( (escaped)
876 |     @toml.parse( (escaped)
    |           ^^^^^ (escaped)
    |       ( (escaped)
    |         #| (escaped)

<WORKDIR>/comprehensive_test.mbt:893:11-893:16:
    |     #|# Another comment (escaped)
    |     #| (escaped)
    |   debug_inspect( (escaped)
893 |     @toml.parse(comments_only_toml), (escaped)
    |           ^^^^^ (escaped)
    |     content=( (escaped)
    |       #|TomlTable({}) (escaped)

<WORKDIR>/comprehensive_test.mbt:905:11-905:16:
    |     #|double = "value" (escaped)
    |     #| (escaped)
    |   debug_inspect( (escaped)
905 |     @toml.parse(mixed_quotes_toml), (escaped)
    |           ^^^^^ (escaped)
    |     content=( (escaped)
    |       #|TomlTable({ "single": TomlString("value"), "double": TomlString("value") }) (escaped)

<WORKDIR>/comprehensive_test.mbt:913:11-913:16:
    |  (escaped)
    |   // Whitespace around equals sign (escaped)
    |   debug_inspect( (escaped)
913 |     @toml.parse( (escaped)
    |           ^^^^^ (escaped)
    |       ( (escaped)
    |         #|spaced   =   "value"   (escaped)

<WORKDIR>/comprehensive_test.mbt:935:11-935:16:
    |     #|# End comment (escaped)
    |     #| (escaped)
    |   debug_inspect( (escaped)
935 |     @toml.parse(complex_whitespace), (escaped)
    |           ^^^^^ (escaped)
    |     content=( (escaped)
    |       #|TomlTable({ "key1": TomlString("value1"), "key2": TomlString("value2") }) (escaped)

<WORKDIR>/comprehensive_test.mbt:975:16-975:21:
    |     #|]   (escaped)
    |     #| (escaped)
    |   debug_inspect( (escaped)
975 |     try? @toml.parse(data3), (escaped)
    |                ^^^^^ (escaped)
    |     content=( (escaped)
    |       #|Ok(TomlTable({ "x": TomlArray([TomlInteger(1), TomlInteger(2)]) })) (escaped)

<WORKDIR>/coverage_improvement_comprehensive_test.mbt:9:22-9:27:
  | /// Test EOF handling in parser - covered by creating empty token arrays (escaped)
  | test "parser_eof_handling" { (escaped)
  |   // Test empty parse input to exercise EOF conditions (escaped)
9 |   let result = @toml.parse( (escaped)
  |                      ^^^^^ (escaped)
  |     ( (escaped)
  |       #| (escaped)

<WORKDIR>/coverage_improvement_comprehensive_test.mbt:26:22-26:27:
   | /// Test integer keys in inline tables (escaped)
   | test "inline_table_with_integer_key" { (escaped)
   |   let toml_input = "table = {123 = \\"value\\"}" (escaped)
26 |   let result = @toml.parse(toml_input) (escaped)
   |                      ^^^^^ (escaped)
   |   debug_inspect( (escaped)
   |     result, (escaped)

<WORKDIR>/coverage_improvement_comprehensive_test.mbt:39:22-39:27:
   | /// Test string keys in table paths (escaped)
   | test "table_path_with_string_key" { (escaped)
   |   let toml_input = "[\\"section\\".\\"subsection\\"]\\nkey = \\"value\\"" (escaped)
39 |   let result = @toml.parse(toml_input) (escaped)
   |                      ^^^^^ (escaped)
   |   debug_inspect( (escaped)
   |     result, (escaped)

<WORKDIR>/coverage_improvement_comprehensive_test.mbt:52:22-52:27:
   | /// Test integer keys in table paths (escaped)
   | test "table_path_with_integer_key" { (escaped)
   |   let toml_input = "[section.123]\\nkey = \\"value\\"" (escaped)
52 |   let result = @toml.parse(toml_input) (escaped)
   |                      ^^^^^ (escaped)
   |   debug_inspect( (escaped)
   |     result, (escaped)

<WORKDIR>/coverage_improvement_comprehensive_test.mbt:65:22-65:27:
   | /// Test string keys in array of tables paths (escaped)
   | test "array_of_tables_path_with_string_key" { (escaped)
   |   let toml_input = "[[\\"products\\"]]\\nname = \\"Hammer\\"" (escaped)
65 |   let result = @toml.parse(toml_input) (escaped)
   |                      ^^^^^ (escaped)
   |   debug_inspect( (escaped)
   |     result, (escaped)

<WORKDIR>/coverage_improvement_comprehensive_test.mbt:78:22-78:27:
   | /// Test integer keys in array of tables paths (escaped)
   | test "array_of_tables_path_with_integer_key" { (escaped)
   |   let toml_input = "[[section.123]]\\nvalue = 42" (escaped)
78 |   let result = @toml.parse(toml_input) (escaped)
   |                      ^^^^^ (escaped)
   |   debug_inspect( (escaped)
   |     result, (escaped)

<WORKDIR>/coverage_improvement_comprehensive_test.mbt:215:22-215:27:
    | /// Test empty inline table (escaped)
    | test "empty_inline_table" { (escaped)
    |   let toml_input = "table = {}" (escaped)
215 |   let result = @toml.parse(toml_input) (escaped)
    |                      ^^^^^ (escaped)
    |   debug_inspect( (escaped)
    |     result, (escaped)

<WORKDIR>/coverage_improvement_comprehensive_test.mbt:228:22-228:27:
    | /// Test empty array (escaped)
    | test "empty_array" { (escaped)
    |   let toml_input = "arr = []" (escaped)
228 |   let result = @toml.parse(toml_input) (escaped)
    |                      ^^^^^ (escaped)
    |   debug_inspect( (escaped)
    |     result, (escaped)

<WORKDIR>/coverage_improvement_comprehensive_test.mbt:284:22-284:27:
    | /// Test float token parsing to ensure coverage (escaped)
    | test "float_token_parsing" { (escaped)
    |   let toml_input = "pi = 3.14159" (escaped)
284 |   let result = @toml.parse(toml_input) (escaped)
    |                      ^^^^^ (escaped)
    |   debug_inspect( (escaped)
    |     result, (escaped)

<WORKDIR>/coverage_improvement_comprehensive_test.mbt:297:22-297:27:
    | /// Test array with trailing comma (escaped)
    | test "array_with_trailing_comma" { (escaped)
    |   let toml_input = "numbers = [1, 2, 3,]" (escaped)
297 |   let result = @toml.parse(toml_input) (escaped)
    |                      ^^^^^ (escaped)
    |   debug_inspect( (escaped)
    |     result, (escaped)

<WORKDIR>/coverage_improvement_comprehensive_test.mbt:346:23-346:28:
    |  (escaped)
    |   // Test parsing like in main function (escaped)
    |   let toml_input = "name = \\"John Doe\\"\\nage = 30\\nenabled = true" (escaped)
346 |   let result1 = @toml.parse(toml_input) (escaped)
    |                       ^^^^^ (escaped)
    |   debug_inspect(result1.to_string().contains("John Doe"), content="true") (escaped)
    |  (escaped)

<WORKDIR>/coverage_improvement_comprehensive_test.mbt:351:23-351:28:
    |  (escaped)
    |   // Test array parsing (escaped)
    |   let toml_array = "numbers = [1, 2, 3, 4, 5]" (escaped)
351 |   let result2 = @toml.parse(toml_array) (escaped)
    |                       ^^^^^ (escaped)
    |   debug_inspect(result2.to_string().contains("[1, 2, 3, 4, 5]"), content="true") (escaped)
    |  (escaped)

<WORKDIR>/coverage_improvement_comprehensive_test.mbt:356:23-356:28:
    |  (escaped)
    |   // Test inline table parsing (escaped)
    |   let toml_table = "person = {name = \\"Alice\\", age = 25}" (escaped)
356 |   let result3 = @toml.parse(toml_table) (escaped)
    |                       ^^^^^ (escaped)
    |   debug_inspect(result3.to_string().contains("Alice"), content="true") (escaped)
    | } (escaped)

<WORKDIR>/coverage_improvement_comprehensive_test.mbt:364:22-364:27:
    | /// Test binary number parsing via hex format (escaped)
    | test "hex_number_parsing_coverage" { (escaped)
    |   let toml_input = "hex_num = 0xDEADBEEF" (escaped)
364 |   let result = @toml.parse(toml_input) (escaped)
    |                      ^^^^^ (escaped)
    |   debug_inspect( (escaped)
    |     result, (escaped)

<WORKDIR>/coverage_improvement_comprehensive_test.mbt:377:22-377:27:
    | /// Test octal number parsing (escaped)
    | test "octal_number_parsing_coverage" { (escaped)
    |   let toml_input = "octal_num = 0o755" (escaped)
377 |   let result = @toml.parse(toml_input) (escaped)
    |                      ^^^^^ (escaped)
    |   debug_inspect( (escaped)
    |     result, (escaped)

<WORKDIR>/coverage_improvement_comprehensive_test.mbt:390:22-390:27:
    | /// Test binary number parsing (escaped)
    | test "binary_number_parsing_coverage" { (escaped)
    |   let toml_input = "binary_num = 0b1010" (escaped)
390 |   let result = @toml.parse(toml_input) (escaped)
    |                      ^^^^^ (escaped)
    |   debug_inspect( (escaped)
    |     result, (escaped)

<WORKDIR>/coverage_improvement_comprehensive_test.mbt:403:22-403:27:
    | /// Test multiple array of tables to exercise array appending logic (escaped)
    | test "multiple_array_of_tables" { (escaped)
    |   let toml_input = "[[products]]\\nname = \\"Hammer\\"\\n\\n[[products]]\\nname = \\"Nail\\"" (escaped)
403 |   let result = @toml.parse(toml_input) (escaped)
    |                      ^^^^^ (escaped)
    |   debug_inspect( (escaped)
    |     result, (escaped)

<WORKDIR>/coverage_improvement_comprehensive_test.mbt:425:22-425:27:
    | /// Test negative number parsing (escaped)
    | test "negative_number_parsing" { (escaped)
    |   let toml_input = "negative = -42" (escaped)
425 |   let result = @toml.parse(toml_input) (escaped)
    |                      ^^^^^ (escaped)
    |   debug_inspect( (escaped)
    |     result, (escaped)

<WORKDIR>/coverage_improvement_comprehensive_test.mbt:453:22-453:27:
    | /// Test multiline basic string with line ending backslash (escaped)
    | test "multiline_string_line_ending_backslash" { (escaped)
    |   let toml_input = "multiline = \\"\\"\\"\\nLine 1 \\\\\\n    Line 2\\"\\"\\"" (escaped)
453 |   let result = @toml.parse(toml_input) (escaped)
    |                      ^^^^^ (escaped)
    |   guard result is TomlTable({ "multiline": TomlString(str), .. }) else { (escaped)
    |     fail("Expected table with multiline string") (escaped)

<WORKDIR>/coverage_improvement_test.mbt:25:16-25:21:
   |     #| (escaped)
   |   // This now successfully parses with nested tables support (escaped)
   |   debug_inspect( (escaped)
25 |     try? @toml.parse(complex_toml), (escaped)
   |                ^^^^^ (escaped)
   |     content=( (escaped)
   |       #|Ok( (escaped)

<WORKDIR>/coverage_improvement_test.mbt:144:16-144:21:
    |     #|quote = "say \\"hello\\"" (escaped)
    |     #| (escaped)
    |   debug_inspect( (escaped)
144 |     try? @toml.parse(toml_with_escapes), (escaped)
    |                ^^^^^ (escaped)
    |     content=( (escaped)
    |       #|Ok( (escaped)

<WORKDIR>/coverage_improvement_test.mbt:170:16-170:21:
    |     #|key2 = "value2" (escaped)
    |     #| (escaped)
    |   debug_inspect( (escaped)
170 |     try? @toml.parse(toml_with_whitespace), (escaped)
    |                ^^^^^ (escaped)
    |     content=( (escaped)
    |       #|Ok(TomlTable({ "key1": TomlString("value1"), "key2": TomlString("value2") })) (escaped)

<WORKDIR>/e2e/e2e_test.mbt:23:29-23:34:
   |         continue (escaped)
   |       } (escaped)
   |     } (escaped)
23 |     let parsed = try? @toml.parse(toml_content) (escaped)
   |                             ^^^^^ (escaped)
   |     match parsed { (escaped)
   |       Err(e) => { (escaped)

<WORKDIR>/e2e/known_failures_test.mbt:10:27-10:32:
   |  (escaped)
   | ///| (escaped)
   | test "fixed: [a-a-a] table header parses correctly" { (escaped)
10 |   let result = try? @toml.parse("[a-a-a]\\n_ = false\\n") (escaped)
   |                           ^^^^^ (escaped)
   |   debug_inspect( (escaped)
   |     result, (escaped)

<WORKDIR>/e2e/known_failures_test.mbt:21:27-21:32:
   |  (escaped)
   | ///| (escaped)
   | test "fixed: leading underscore value rejected (not infinite loop)" { (escaped)
21 |   let result = try? @toml.parse("x = _1.2\\n") (escaped)
   |                           ^^^^^ (escaped)
   |   debug_inspect( (escaped)
   |     result, (escaped)

<WORKDIR>/e2e/known_failures_test.mbt:36:27-36:32:
   |  (escaped)
   | ///| (escaped)
   | test "fixed: positive prefix '+' tokenized for integers" { (escaped)
36 |   let result = try? @toml.parse("pos = +99\\n") (escaped)
   |                           ^^^^^ (escaped)
   |   debug_inspect( (escaped)
   |     result, (escaped)

<WORKDIR>/e2e/known_failures_test.mbt:47:27-47:32:
   |  (escaped)
   | ///| (escaped)
   | test "fixed: positive prefix '+' tokenized for floats" { (escaped)
47 |   let result = try? @toml.parse("pos = +1.0\\n") (escaped)
   |                           ^^^^^ (escaped)
   |   debug_inspect( (escaped)
   |     result, (escaped)

<WORKDIR>/e2e/known_failures_test.mbt:62:27-62:32:
   |  (escaped)
   | ///| (escaped)
   | test "fixed: CRLF line ending handled" { (escaped)
62 |   let result = try? @toml.parse("key = \\"val\\"\\r\\n") (escaped)
   |                           ^^^^^ (escaped)
   |   debug_inspect( (escaped)
   |     result, (escaped)

<WORKDIR>/e2e/known_failures_test.mbt:77:27-77:32:
   |  (escaped)
   | ///| (escaped)
   | test "fixed: datetime with space separator" { (escaped)
77 |   let result = try? @toml.parse("dt = 1987-07-05 17:45:00Z\\n") (escaped)
   |                           ^^^^^ (escaped)
   |   debug_inspect( (escaped)
   |     result, (escaped)

<WORKDIR>/e2e/known_failures_test.mbt:92:27-92:32:
   |  (escaped)
   | ///| (escaped)
   | test "fixed: numeric key leading zeros preserved" { (escaped)
92 |   let result = try? @toml.parse("0123 = true\\n") (escaped)
   |                           ^^^^^ (escaped)
   |   debug_inspect( (escaped)
   |     result, (escaped)

<WORKDIR>/e2e/known_failures_test.mbt:113:27-113:32:
    |     #| (escaped)
    |     #|  fox jumps over the lazy dog.""" (escaped)
    |     #| (escaped)
113 |   let result = try? @toml.parse(input) (escaped)
    |                           ^^^^^ (escaped)
    |   debug_inspect( (escaped)
    |     result, (escaped)

<WORKDIR>/e2e/known_failures_test.mbt:128:27-128:32:
    |  (escaped)
    | ///| (escaped)
    | test "fixed: hex escape \\\\xHH" { (escaped)
128 |   let result = try? @toml.parse("esc = \\"\\\\x41\\"\\n") (escaped)
    |                           ^^^^^ (escaped)
    |   debug_inspect( (escaped)
    |     result, (escaped)

<WORKDIR>/e2e/known_failures_test.mbt:139:27-139:32:
    |  (escaped)
    | ///| (escaped)
    | test "fixed: escape \\\\e (ESC)" { (escaped)
139 |   let result = try? @toml.parse("esc = \\"\\\\e\\"\\n") (escaped)
    |                           ^^^^^ (escaped)
    |   debug_inspect( (escaped)
    |     result, (escaped)

<WORKDIR>/e2e/known_failures_test.mbt:166:22-166:27:
    |     #|[[fruits]] (escaped)
    |     #|name = "banana" (escaped)
    |     #| (escaped)
166 |   let _ = try? @toml.parse(input) (escaped)
    |                      ^^^^^ (escaped)
    |   // Should parse without error (escaped)
    | } (escaped)

<WORKDIR>/e2e/known_failures_test.mbt:176:27-176:32:
    |  (escaped)
    | ///| (escaped)
    | test "fixed: keyword as table name" { (escaped)
176 |   let result = try? @toml.parse("[true]\\nx = 1\\n") (escaped)
    |                           ^^^^^ (escaped)
    |   debug_inspect( (escaped)
    |     result, (escaped)

<WORKDIR>/e2e/known_failures_test.mbt:199:22-199:27:
    |     #|  b = 2 (escaped)
    |     #|} (escaped)
    |     #| (escaped)
199 |   let _ = try? @toml.parse(input) (escaped)
    |                      ^^^^^ (escaped)
    | } (escaped)
    |  (escaped)

<WORKDIR>/e2e/known_failures_test.mbt:210:27-210:32:
    | ///| (escaped)
    | #skip (escaped)
    | test "bug: datetime millisecond trailing zeros" { (escaped)
210 |   let result = try? @toml.parse("dt = 1987-07-05T17:45:56.600Z\\n") (escaped)
    |                           ^^^^^ (escaped)
    |   // Should preserve .600, not truncate to .6 (escaped)
    |   debug_inspect(result, content="") (escaped)

<WORKDIR>/e2e/known_failures_test.mbt:224:27-224:32:
    |   let input = (escaped)
    |     #|str = """Here are two quotes: "". Cool.""" (escaped)
    |     #| (escaped)
224 |   let result = try? @toml.parse(input) (escaped)
    |                           ^^^^^ (escaped)
    |   debug_inspect( (escaped)
    |     result, (escaped)

<WORKDIR>/e2e/known_failures_test.mbt:239:27-239:32:
    |  (escaped)
    | ///| (escaped)
    | test "fixed: dashed bare key starting with dash" { (escaped)
239 |   let result = try? @toml.parse("-key = 1\\n") (escaped)
    |                           ^^^^^ (escaped)
    |   debug_inspect( (escaped)
    |     result, (escaped)

<WORKDIR>/e2e/runner.mbt:49:27-49:32:
   |   let expected : Json = @json.parse(expected_json_str) catch { (escaped)
   |     e => return Some("\\{toml_path}: failed to parse expected JSON: \\{e}") (escaped)
   |   } (escaped)
49 |   let parsed = try? @toml.parse(toml_content) (escaped)
   |                           ^^^^^ (escaped)
   |   match parsed { (escaped)
   |     Err(e) => Some("[PARSE-ERROR] \\{toml_path}: \\{e}") (escaped)

<WORKDIR>/e2e/runner.mbt:75:27-75:32:
   |     // Non-UTF-8 file: parser would reject this, count as pass (escaped)
   |     _ => return None (escaped)
   |   } (escaped)
75 |   let parsed = try? @toml.parse(toml_content) (escaped)
   |                           ^^^^^ (escaped)
   |   match parsed { (escaped)
   |     Ok(_) => Some("[PASS-BUT-SHOULD-FAIL] \\{toml_path}") (escaped)

<WORKDIR>/internal/qc_model/roundtrip_test.mbt:6:13-6:18:
  |   doc : @qc_model.SimpleDocument, (escaped)
  |   rendered : String, (escaped)
  | ) -> Result[Unit, String] { (escaped)
6 |   try @toml.parse(rendered) catch { (escaped)
  |             ^^^^^ (escaped)
  |     error => (escaped)
  |       Err( (escaped)

<WORKDIR>/official_toml_test_suite_test.mbt:14:11-14:16:
   |     #|basic = "value" (escaped)
   |     #| (escaped)
   |   debug_inspect( (escaped)
14 |     @toml.parse(basic_string_toml), (escaped)
   |           ^^^^^ (escaped)
   |     content=( (escaped)
   |       #|TomlTable({ "basic": TomlString("value") }) (escaped)

<WORKDIR>/official_toml_test_suite_test.mbt:28:11-28:16:
   |     #|escaped = "I'm a string. \\"You can quote me\\". Name\\tJosé\\nLocation\\tSF." (escaped)
   |     #| (escaped)
   |   debug_inspect( (escaped)
28 |     @toml.parse(escaped_string_toml), (escaped)
   |           ^^^^^ (escaped)
   |     content=( (escaped)
   |       #|TomlTable({ "escaped": TomlString("I'm a string. \\"You can quote me\\". Name\\tJosé\\nLocation\\tSF.") }) (escaped)

<WORKDIR>/official_toml_test_suite_test.mbt:44:11-44:16:
   |     #|zero = 0 (escaped)
   |     #| (escaped)
   |   debug_inspect( (escaped)
44 |     @toml.parse(integer_toml), (escaped)
   |           ^^^^^ (escaped)
   |     content=( (escaped)
   |       #|TomlTable( (escaped)

<WORKDIR>/official_toml_test_suite_test.mbt:66:11-66:16:
   |     #|positive = 5.0 (escaped)
   |     #| (escaped)
   |   debug_inspect( (escaped)
66 |     @toml.parse(float_toml), (escaped)
   |           ^^^^^ (escaped)
   |     content=( (escaped)
   |       #|TomlTable( (escaped)

<WORKDIR>/official_toml_test_suite_test.mbt:87:11-87:16:
   |     #|disabled = false (escaped)
   |     #| (escaped)
   |   debug_inspect( (escaped)
87 |     @toml.parse(boolean_toml), (escaped)
   |           ^^^^^ (escaped)
   |     content=( (escaped)
   |       #|TomlTable({ "enabled": TomlBoolean(true), "disabled": TomlBoolean(false) }) (escaped)

<WORKDIR>/official_toml_test_suite_test.mbt:104:11-104:16:
    |     #|floats = [1.1, 2.2, 3.3] (escaped)
    |     #| (escaped)
    |   debug_inspect( (escaped)
104 |     @toml.parse(array_toml), (escaped)
    |           ^^^^^ (escaped)
    |     content=( (escaped)
    |       #|TomlTable( (escaped)

<WORKDIR>/official_toml_test_suite_test.mbt:133:11-133:16:
    |     #|nested = [[1, 2], [3, 4, 5]] (escaped)
    |     #| (escaped)
    |   debug_inspect( (escaped)
133 |     @toml.parse(nested_array_toml), (escaped)
    |           ^^^^^ (escaped)
    |     content=( (escaped)
    |       #|TomlTable( (escaped)

<WORKDIR>/official_toml_test_suite_test.mbt:156:11-156:16:
    |     #|empty = [] (escaped)
    |     #| (escaped)
    |   debug_inspect( (escaped)
156 |     @toml.parse(empty_array_toml), (escaped)
    |           ^^^^^ (escaped)
    |     content=( (escaped)
    |       #|TomlTable({ "empty": TomlArray([]) }) (escaped)

<WORKDIR>/official_toml_test_suite_test.mbt:172:11-172:16:
    |     #|empty = {} (escaped)
    |     #| (escaped)
    |   debug_inspect( (escaped)
172 |     @toml.parse(inline_table_toml), (escaped)
    |           ^^^^^ (escaped)
    |     content=( (escaped)
    |       #|TomlTable( (escaped)

<WORKDIR>/official_toml_test_suite_test.mbt:197:11-197:16:
    |     #|tags = ["production", "web"] (escaped)
    |     #| (escaped)
    |   debug_inspect( (escaped)
197 |     @toml.parse(complex_toml), (escaped)
    |           ^^^^^ (escaped)
    |     content=( (escaped)
    |       #|TomlTable( (escaped)

<WORKDIR>/official_toml_test_suite_test.mbt:228:11-228:16:
    |     #|organization = "GitHub" (escaped)
    |     #| (escaped)
    |   debug_inspect( (escaped)
228 |     @toml.parse(table_toml), (escaped)
    |           ^^^^^ (escaped)
    |     content=( (escaped)
    |       #|TomlTable( (escaped)

<WORKDIR>/official_toml_test_suite_test.mbt:257:11-257:16:
    |     #|dc = "eqdc10" (escaped)
    |     #| (escaped)
    |   debug_inspect( (escaped)
257 |     @toml.parse(nested_table_toml), (escaped)
    |           ^^^^^ (escaped)
    |     content=( (escaped)
    |       #|TomlTable( (escaped)

<WORKDIR>/official_toml_test_suite_test.mbt:286:11-286:16:
    |     #|sku = 284758393 (escaped)
    |     #| (escaped)
    |   debug_inspect( (escaped)
286 |     @toml.parse(array_of_tables_toml), (escaped)
    |           ^^^^^ (escaped)
    |     content=( (escaped)
    |       #|TomlTable( (escaped)

<WORKDIR>/official_toml_test_suite_test.mbt:315:11-315:16:
    |     #|shape = "banana" (escaped)
    |     #| (escaped)
    |   debug_inspect( (escaped)
315 |     @toml.parse(nested_array_toml), (escaped)
    |           ^^^^^ (escaped)
    |     content=( (escaped)
    |       #|TomlTable( (escaped)

<WORKDIR>/official_toml_test_suite_test.mbt:357:11-357:16:
    |     #|port = 5432 (escaped)
    |     #| (escaped)
    |   debug_inspect( (escaped)
357 |     @toml.parse(mixed_toml), (escaped)
    |           ^^^^^ (escaped)
    |     content=( (escaped)
    |       #|TomlTable( (escaped)

<WORKDIR>/official_toml_test_suite_test.mbt:386:11-386:16:
    |     #|local_datetime = 1979-05-27T07:32:00 (escaped)
    |     #| (escaped)
    |   debug_inspect( (escaped)
386 |     @toml.parse(datetime_toml), (escaped)
    |           ^^^^^ (escaped)
    |     content=( (escaped)
    |       #|TomlTable( (escaped)

<WORKDIR>/official_toml_test_suite_test.mbt:410:11-410:16:
    |     #|Violets are blue""" (escaped)
    |     #| (escaped)
    |   debug_inspect( (escaped)
410 |     @toml.parse(multiline_basic_toml), (escaped)
    |           ^^^^^ (escaped)
    |     content=( (escaped)
    |       #|TomlTable({ "str1": TomlString("Roses are red\\nViolets are blue") }) (escaped)

<WORKDIR>/official_toml_test_suite_test.mbt:426:11-426:16:
    |     #|regex = '<\\i\\c*\\s*>' (escaped)
    |     #| (escaped)
    |   debug_inspect( (escaped)
426 |     @toml.parse(literal_string_toml), (escaped)
    |           ^^^^^ (escaped)
    |     content=( (escaped)
    |       #|TomlTable( (escaped)

<WORKDIR>/official_toml_test_suite_test.mbt:453:11-453:16:
    |     #|''' (escaped)
    |     #| (escaped)
    |   debug_inspect( (escaped)
453 |     @toml.parse(multiline_literal_toml), (escaped)
    |           ^^^^^ (escaped)
    |     content=( (escaped)
    |       #|TomlTable( (escaped)

<WORKDIR>/official_toml_test_suite_test.mbt:474:11-474:16:
    |     #|another = "# This is not a comment" (escaped)
    |     #| (escaped)
    |   debug_inspect( (escaped)
474 |     @toml.parse(comments_toml), (escaped)
    |           ^^^^^ (escaped)
    |     content=( (escaped)
    |       #|TomlTable( (escaped)

<WORKDIR>/official_toml_test_suite_test.mbt:498:11-498:16:
    |     #|bin1 = 0b11010110 (escaped)
    |     #| (escaped)
    |   debug_inspect( (escaped)
498 |     @toml.parse(integer_formats_toml), (escaped)
    |           ^^^^^ (escaped)
    |     content=( (escaped)
    |       #|TomlTable( (escaped)

<WORKDIR>/official_toml_test_suite_test.mbt:526:11-526:16:
    |     #| (escaped)
    |   // FIXME: json.inspect get null (escaped)
    |   debug_inspect( (escaped)
526 |     @toml.parse(float_special_toml), (escaped)
    |           ^^^^^ (escaped)
    |     content=( (escaped)
    |       #|TomlTable( (escaped)

<WORKDIR>/official_toml_test_suite_test.mbt:587:11-587:16:
    |     #|key2 = "value2" (escaped)
    |     #| (escaped)
    |   debug_inspect( (escaped)
587 |     @toml.parse(comment_test), (escaped)
    |           ^^^^^ (escaped)
    |     content=( (escaped)
    |       #|TomlTable({ "key1": TomlString("value1"), "key2": TomlString("value2") }) (escaped)

<WORKDIR>/official_toml_test_suite_test.mbt:601:11-601:16:
    |     #|neg_nan = -nan (escaped)
    |     #| (escaped)
    |   debug_inspect( (escaped)
601 |     @toml.parse(valid_inf_toml), (escaped)
    |           ^^^^^ (escaped)
    |     content=( (escaped)
    |       #|TomlTable( (escaped)

<WORKDIR>/official_toml_test_suite_test.mbt:643:11-643:16:
    |     #|key4="value4" (escaped)
    |     #| (escaped)
    |   debug_inspect( (escaped)
643 |     @toml.parse(whitespace_toml), (escaped)
    |           ^^^^^ (escaped)
    |     content=( (escaped)
    |       #|TomlTable( (escaped)

<WORKDIR>/official_toml_test_suite_test.mbt:669:11-669:16:
    |     #|array2 = [1, 2, 3,] (escaped)
    |     #| (escaped)
    |   debug_inspect( (escaped)
669 |     @toml.parse(array_formatting_toml), (escaped)
    |           ^^^^^ (escaped)
    |     content=( (escaped)
    |       #|TomlTable( (escaped)

<WORKDIR>/parser.mbt:300:8-300:13:
    | /// On any lexical or syntactic error, `parse` raises with a message (escaped)
    | /// containing the source location. Wrap the call in `try?` to receive a (escaped)
    | /// `Result[TomlValue, Error]` instead. (escaped)
300 | pub fn parse(input : String) -> TomlValue raise { (escaped)
    |        ^^^^^ (escaped)
    |   let tokens = @tokenize.tokenize(input) (escaped)
    |   let parser = Parser::new(tokens) (escaped)

<WORKDIR>/parser_test.mbt:4:22-4:27:
  | ///| (escaped)
  | /// Tests for the TOML parser (escaped)
  | test "parse simple key-value string" { (escaped)
4 |   let result = @toml.parse( (escaped)
  |                      ^^^^^ (escaped)
  |     ( (escaped)
  |       #|name = "John" (escaped)

<WORKDIR>/parser_test.mbt:19:22-19:27:
   |  (escaped)
   | ///| (escaped)
   | test "parse simple key-value integer" { (escaped)
19 |   let result = @toml.parse( (escaped)
   |                      ^^^^^ (escaped)
   |     ( (escaped)
   |       #|age = 25 (escaped)

<WORKDIR>/parser_test.mbt:34:22-34:27:
   |  (escaped)
   | ///| (escaped)
   | test "parse simple key-value boolean" { (escaped)
34 |   let result = @toml.parse( (escaped)
   |                      ^^^^^ (escaped)
   |     ( (escaped)
   |       #|enabled = true (escaped)

<WORKDIR>/parser_test.mbt:49:22-49:27:
   |  (escaped)
   | ///| (escaped)
   | test "parse simple key-value float" { (escaped)
49 |   let result = @toml.parse( (escaped)
   |                      ^^^^^ (escaped)
   |     ( (escaped)
   |       #|pi = 3.14 (escaped)

<WORKDIR>/parser_test.mbt:69:22-69:27:
   |     #|age = 30 (escaped)
   |     #|enabled = false (escaped)
   |     #| (escaped)
69 |   let result = @toml.parse(multiple_kvp_toml) (escaped)
   |                      ^^^^^ (escaped)
   |   debug_inspect( (escaped)
   |     result, (escaped)

<WORKDIR>/parser_test.mbt:86:22-86:27:
   |  (escaped)
   | ///| (escaped)
   | test "parse array" { (escaped)
86 |   let result = @toml.parse( (escaped)
   |                      ^^^^^ (escaped)
   |     ( (escaped)
   |       #|numbers = [1, 2, 3] (escaped)

<WORKDIR>/parser_test.mbt:101:27-101:32:
    |  (escaped)
    | ///| (escaped)
    | test "parse array ending with exponent float" { (escaped)
101 |   let result = try? @toml.parse( (escaped)
    |                           ^^^^^ (escaped)
    |     ( (escaped)
    |       #|numbers = [-1e2] (escaped)

<WORKDIR>/parser_test.mbt:119:22-119:27:
    |   let inline_table_toml = (escaped)
    |     #|person = {name = "Bob", age = 25} (escaped)
    |     #| (escaped)
119 |   let result = @toml.parse(inline_table_toml) (escaped)
    |                      ^^^^^ (escaped)
    |   debug_inspect( (escaped)
    |     result, (escaped)

<WORKDIR>/parser_test.mbt:142:16-142:21:
    | ///| (escaped)
    | test "test parser EOF handling in peek" { (escaped)
    |   debug_inspect( (escaped)
142 |     try? @toml.parse(""), (escaped)
    |                ^^^^^ (escaped)
    |     content=( (escaped)
    |       #|Ok(TomlTable({})) (escaped)

<WORKDIR>/parser_test.mbt:172:16-172:21:
    | ///| (escaped)
    | test "test inline table with string keys" { (escaped)
    |   debug_inspect( (escaped)
172 |     try? @toml.parse("table = {\\"string key\\" = \\"value\\"}"), (escaped)
    |                ^^^^^ (escaped)
    |     content=( (escaped)
    |       #|Ok(TomlTable({ "table": TomlTable({ "string key": TomlString("value") }) })) (escaped)

<WORKDIR>/parser_test.mbt:206:16-206:21:
    |     #|key = "value" (escaped)
    |     #| (escaped)
    |   debug_inspect( (escaped)
206 |     try? @toml.parse(string_table_name_toml), (escaped)
    |                ^^^^^ (escaped)
    |     content=( (escaped)
    |       #|Ok(TomlTable({ "table name": TomlTable({ "key": TomlString("value") }) })) (escaped)

<WORKDIR>/parser_test.mbt:220:16-220:21:
    |     #|key = "value" (escaped)
    |     #| (escaped)
    |   debug_inspect( (escaped)
220 |     try? @toml.parse(numeric_table_name_toml), (escaped)
    |                ^^^^^ (escaped)
    |     content=( (escaped)
    |       #|Ok(TomlTable({ "123": TomlTable({ "key": TomlString("value") }) })) (escaped)

<WORKDIR>/parser_test.mbt:314:16-314:21:
    |     #|-10e-1 = "d" (escaped)
    |     #| (escaped)
    |   debug_inspect( (escaped)
314 |     try? @toml.parse(exponent_like_keys_toml), (escaped)
    |                ^^^^^ (escaped)
    |     content=( (escaped)
    |       #|Ok( (escaped)

<WORKDIR>/parser_test.mbt:343:16-343:21:
    |     #|value = "d" (escaped)
    |     #| (escaped)
    |   debug_inspect( (escaped)
343 |     try? @toml.parse(exponent_like_table_names_toml), (escaped)
    |                ^^^^^ (escaped)
    |     content=( (escaped)
    |       #|Ok( (escaped)

<WORKDIR>/parser_test.mbt:381:16-381:21:
    | test "overflow float accepted as bare key" { (escaped)
    |   // The same overflow token is valid as a bare key (all chars are A-Za-z0-9_-) (escaped)
    |   debug_inspect( (escaped)
381 |     try? @toml.parse("-31e368 = \\"ok\\"\\n"), (escaped)
    |                ^^^^^ (escaped)
    |     content=( (escaped)
    |       #|Ok(TomlTable({ "-31e368": TomlString("ok") })) (escaped)

<WORKDIR>/parser_test.mbt:392:16-392:21:
    | test "special float keywords as keys" { (escaped)
    |   // inf, nan, +inf, -inf, etc. are valid bare keys in TOML (escaped)
    |   debug_inspect( (escaped)
392 |     try? @toml.parse("+inf = 1\\n"), (escaped)
    |                ^^^^^ (escaped)
    |     content=( (escaped)
    |       #|Ok(TomlTable({ "+inf": TomlInteger(1) })) (escaped)

<WORKDIR>/parser_test.mbt:398:16-398:21:
    |     ), (escaped)
    |   ) (escaped)
    |   debug_inspect( (escaped)
398 |     try? @toml.parse("-inf = 2\\n"), (escaped)
    |                ^^^^^ (escaped)
    |     content=( (escaped)
    |       #|Ok(TomlTable({ "-inf": TomlInteger(2) })) (escaped)

<WORKDIR>/parser_test.mbt:404:16-404:21:
    |     ), (escaped)
    |   ) (escaped)
    |   debug_inspect( (escaped)
404 |     try? @toml.parse("nan = 3\\n"), (escaped)
    |                ^^^^^ (escaped)
    |     content=( (escaped)
    |       #|Ok(TomlTable({ "nan": TomlInteger(3) })) (escaped)

<WORKDIR>/parser_test.mbt:415:16-415:21:
    | test "dotted key with float-like segments" { (escaped)
    |   // Float token with dot in raw string should split into dotted keys (escaped)
    |   debug_inspect( (escaped)
415 |     try? @toml.parse("1.2 = \\"a\\"\\n"), (escaped)
    |                ^^^^^ (escaped)
    |     content=( (escaped)
    |       #|Ok(TomlTable({ "1": TomlTable({ "2": TomlString("a") }) })) (escaped)

<WORKDIR>/parser_test.mbt:422:16-422:21:
    |   ) (escaped)
    |   // Float-like key followed by dotted sub-key (escaped)
    |   debug_inspect( (escaped)
422 |     try? @toml.parse("[-80e-2.sub]\\nval = 1\\n"), (escaped)
    |                ^^^^^ (escaped)
    |     content=( (escaped)
    |       #|Ok(TomlTable({ "-80e-2": TomlTable({ "sub": TomlTable({ "val": TomlInteger(1) }) }) })) (escaped)

<WORKDIR>/parser_test.mbt:464:16-464:21:
    | /// Tests for inline table edge cases   (escaped)
    | test "test empty inline table" { (escaped)
    |   debug_inspect( (escaped)
464 |     try? @toml.parse("empty = {}"), (escaped)
    |                ^^^^^ (escaped)
    |     content=( (escaped)
    |       #|Ok(TomlTable({ "empty": TomlTable({}) })) (escaped)

<WORKDIR>/parser_test.mbt:474:16-474:21:
    | ///| (escaped)
    | test "test nested inline tables" { (escaped)
    |   debug_inspect( (escaped)
474 |     try? @toml.parse("table = {inner = {key = \\"value\\"}}"), (escaped)
    |                ^^^^^ (escaped)
    |     content=( (escaped)
    |       #|Ok(TomlTable({ "table": TomlTable({ "inner": TomlTable({ "key": TomlString("value") }) }) })) (escaped)

<WORKDIR>/parser_test.mbt:484:16-484:21:
    | ///| (escaped)
    | test "test inline table with multiple key types" { (escaped)
    |   debug_inspect( (escaped)
484 |     try? @toml.parse("mixed = {\\"quoted\\" = 1, unquoted = 2}"), (escaped)
    |                ^^^^^ (escaped)
    |     content=( (escaped)
    |       #|Ok(TomlTable({ "mixed": TomlTable({ "quoted": TomlInteger(1), "unquoted": TomlInteger(2) }) })) (escaped)

<WORKDIR>/parser_test.mbt:494:16-494:21:
    | ///| (escaped)
    | test "test inline table with array values" { (escaped)
    |   debug_inspect( (escaped)
494 |     try? @toml.parse("table = {arr = [1, 2, 3], str = \\"test\\"}"), (escaped)
    |                ^^^^^ (escaped)
    |     content=( (escaped)
    |       #|Ok( (escaped)

<WORKDIR>/parser_test.mbt:515:22-515:27:
    | ///| (escaped)
    | /// Test dotted key notation - simple case (escaped)
    | test "dotted key notation simple" { (escaped)
515 |   let result = @toml.parse( (escaped)
    |                      ^^^^^ (escaped)
    |     ( (escaped)
    |       #|a.b.c = "value" (escaped)

<WORKDIR>/parser_test.mbt:538:11-538:16:
    |     #|f = "value4" (escaped)
    |     #| (escaped)
    |   debug_inspect( (escaped)
538 |     @toml.parse(dotted_multiple_toml), (escaped)
    |           ^^^^^ (escaped)
    |     content=( (escaped)
    |       #|TomlTable( (escaped)

<WORKDIR>/parser_test.mbt:566:11-566:16:
    |     #|server.tags = ["web", "api"] (escaped)
    |     #| (escaped)
    |   debug_inspect( (escaped)
566 |     @toml.parse(dotted_types_toml), (escaped)
    |           ^^^^^ (escaped)
    |     content=( (escaped)
    |       #|TomlTable( (escaped)

<WORKDIR>/parser_test.mbt:588:22-588:27:
    | ///| (escaped)
    | /// Test dotted key notation - quoted keys (escaped)
    | test "dotted key notation quoted keys" { (escaped)
588 |   let result = @toml.parse( (escaped)
    |                      ^^^^^ (escaped)
    |     ( (escaped)
    |       #|"first.part"."second.part" = "value" (escaped)

<WORKDIR>/parser_test.mbt:604:22-604:27:
    | ///| (escaped)
    | /// Test dotted key notation - integer keys (escaped)
    | test "dotted key notation integer keys" { (escaped)
604 |   let result = @toml.parse( (escaped)
    |                      ^^^^^ (escaped)
    |     ( (escaped)
    |       #|1.2.3 = "numeric path" (escaped)

<WORKDIR>/parser_test.mbt:626:11-626:16:
    |     #|c = "table" (escaped)
    |     #| (escaped)
    |   debug_inspect( (escaped)
626 |     @toml.parse(conflict_toml), (escaped)
    |           ^^^^^ (escaped)
    |     content=( (escaped)
    |       #|TomlTable({ "a": TomlTable({ "b": TomlString("dotted"), "c": TomlString("table") }) }) (escaped)

<WORKDIR>/parser_test.mbt:636:22-636:27:
    | ///| (escaped)
    | /// Test dotted key notation - deep nesting (escaped)
    | test "dotted key notation deep nesting" { (escaped)
636 |   let result = @toml.parse( (escaped)
    |                      ^^^^^ (escaped)
    |     ( (escaped)
    |       #|a.b.c.d.e.f = "deep" (escaped)

<WORKDIR>/parser_test.mbt:659:28-659:33:
    |     #|server."port number".8080.config = 3 (escaped)
    |     #| (escaped)
    |   // TODO: fix (escaped)
659 |   debug_inspect(try? @toml.parse(data), content="") (escaped)
    |                            ^^^^^ (escaped)
    | } (escaped)

<WORKDIR>/test_utils_test.mbt:3:13-3:18:
  | ///| (escaped)
  | fn parse_expect_to_fail(input : String) -> String { (escaped)
3 |   try @toml.parse(input) catch { (escaped)
  |             ^^^^^ (escaped)
  |     e => { (escaped)
  |       let s = e.to_string() (escaped)

<WORKDIR>/toml_to_string_test.mbt:364:22-364:27:
    |     #|debug = true (escaped)
    |     #|max_connections = 100 (escaped)
    |     #| (escaped)
364 |   let parsed = @toml.parse(toml) (escaped)
    |                      ^^^^^ (escaped)
    |   let roundtripped = @toml.parse(parsed.to_string()) (escaped)
    |   assert_eq(parsed, roundtripped) (escaped)

<WORKDIR>/toml_to_string_test.mbt:365:28-365:33:
    |     #|max_connections = 100 (escaped)
    |     #| (escaped)
    |   let parsed = @toml.parse(toml) (escaped)
365 |   let roundtripped = @toml.parse(parsed.to_string()) (escaped)
    |                            ^^^^^ (escaped)
    |   assert_eq(parsed, roundtripped) (escaped)
    | } (escaped)

<WORKDIR>/toml_to_string_test.mbt:380:22-380:27:
    |     #|user = "admin" (escaped)
    |     #|password = "secret" (escaped)
    |     #| (escaped)
380 |   let parsed = @toml.parse(toml) (escaped)
    |                      ^^^^^ (escaped)
    |   let roundtripped = @toml.parse(parsed.to_string()) (escaped)
    |   assert_eq(parsed, roundtripped) (escaped)

<WORKDIR>/toml_to_string_test.mbt:381:28-381:33:
    |     #|password = "secret" (escaped)
    |     #| (escaped)
    |   let parsed = @toml.parse(toml) (escaped)
381 |   let roundtripped = @toml.parse(parsed.to_string()) (escaped)
    |                            ^^^^^ (escaped)
    |   assert_eq(parsed, roundtripped) (escaped)
    | } (escaped)

<WORKDIR>/toml_to_string_test.mbt:396:22-396:27:
    |     #|name = "Nail" (escaped)
    |     #|sku = 284758393 (escaped)
    |     #| (escaped)
396 |   let parsed = @toml.parse(toml) (escaped)
    |                      ^^^^^ (escaped)
    |   let roundtripped = @toml.parse(parsed.to_string()) (escaped)
    |   assert_eq(parsed, roundtripped) (escaped)

<WORKDIR>/toml_to_string_test.mbt:397:28-397:33:
    |     #|sku = 284758393 (escaped)
    |     #| (escaped)
    |   let parsed = @toml.parse(toml) (escaped)
397 |   let roundtripped = @toml.parse(parsed.to_string()) (escaped)
    |                            ^^^^^ (escaped)
    |   assert_eq(parsed, roundtripped) (escaped)
    | } (escaped)

<WORKDIR>/toml_to_string_test.mbt:409:22-409:27:
    |     #|local_date = 2023-01-15 (escaped)
    |     #|local_time = 10:30:00 (escaped)
    |     #| (escaped)
409 |   let parsed = @toml.parse(toml) (escaped)
    |                      ^^^^^ (escaped)
    |   let roundtripped = @toml.parse(parsed.to_string()) (escaped)
    |   assert_eq(parsed, roundtripped) (escaped)

<WORKDIR>/toml_to_string_test.mbt:410:28-410:33:
    |     #|local_time = 10:30:00 (escaped)
    |     #| (escaped)
    |   let parsed = @toml.parse(toml) (escaped)
410 |   let roundtripped = @toml.parse(parsed.to_string()) (escaped)
    |                            ^^^^^ (escaped)
    |   assert_eq(parsed, roundtripped) (escaped)
    | } (escaped)

<WORKDIR>/toml_to_string_test.mbt:421:22-421:27:
    |     #|strings = ["hello", "world"] (escaped)
    |     #|nested = [[1, 2], [3, 4]] (escaped)
    |     #| (escaped)
421 |   let parsed = @toml.parse(toml) (escaped)
    |                      ^^^^^ (escaped)
    |   let roundtripped = @toml.parse(parsed.to_string()) (escaped)
    |   assert_eq(parsed, roundtripped) (escaped)

<WORKDIR>/toml_to_string_test.mbt:422:28-422:33:
    |     #|nested = [[1, 2], [3, 4]] (escaped)
    |     #| (escaped)
    |   let parsed = @toml.parse(toml) (escaped)
422 |   let roundtripped = @toml.parse(parsed.to_string()) (escaped)
    |                            ^^^^^ (escaped)
    |   assert_eq(parsed, roundtripped) (escaped)
    | } (escaped)

<WORKDIR>/toml_to_string_test.mbt:434:22-434:27:
    |     #|nan_val = nan (escaped)
    |     #|pi = 3.14 (escaped)
    |     #| (escaped)
434 |   let parsed = @toml.parse(toml) (escaped)
    |                      ^^^^^ (escaped)
    |   // NaN != NaN, so compare non-NaN values and check NaN separately (escaped)
    |   let serialized = parsed.to_string() (escaped)

<WORKDIR>/toml_to_string_test.mbt:437:28-437:33:
    |   let parsed = @toml.parse(toml) (escaped)
    |   // NaN != NaN, so compare non-NaN values and check NaN separately (escaped)
    |   let serialized = parsed.to_string() (escaped)
437 |   let roundtripped = @toml.parse(serialized) (escaped)
    |                            ^^^^^ (escaped)
    |   // Check that the serialized form re-parses correctly (escaped)
    |   inspect( (escaped)

<WORKDIR>/toml_to_string_test.mbt:478:22-478:27:
    |     #|name = "beta" (escaped)
    |     #|ip = "10.0.0.2" (escaped)
    |     #| (escaped)
478 |   let parsed = @toml.parse(toml) (escaped)
    |                      ^^^^^ (escaped)
    |   let roundtripped = @toml.parse(parsed.to_string()) (escaped)
    |   assert_eq(parsed, roundtripped) (escaped)

<WORKDIR>/toml_to_string_test.mbt:479:28-479:33:
    |     #|ip = "10.0.0.2" (escaped)
    |     #| (escaped)
    |   let parsed = @toml.parse(toml) (escaped)
479 |   let roundtripped = @toml.parse(parsed.to_string()) (escaped)
    |                            ^^^^^ (escaped)
    |   assert_eq(parsed, roundtripped) (escaped)
    | } (escaped)

<WORKDIR>/toml_to_string_test.mbt:488:22-488:27:
    |   let toml = (escaped)
    |     #|escaped = "hello\\nworld\\ttab\\\\backslash\\"quote" (escaped)
    |     #| (escaped)
488 |   let parsed = @toml.parse(toml) (escaped)
    |                      ^^^^^ (escaped)
    |   let roundtripped = @toml.parse(parsed.to_string()) (escaped)
    |   assert_eq(parsed, roundtripped) (escaped)

<WORKDIR>/toml_to_string_test.mbt:489:28-489:33:
    |     #|escaped = "hello\\nworld\\ttab\\\\backslash\\"quote" (escaped)
    |     #| (escaped)
    |   let parsed = @toml.parse(toml) (escaped)
489 |   let roundtripped = @toml.parse(parsed.to_string()) (escaped)
    |                            ^^^^^ (escaped)
    |   assert_eq(parsed, roundtripped) (escaped)
    | } (escaped)

<WORKDIR>/toml_to_string_test.mbt:554:28-554:33:
    |     ), (escaped)
    |   ) (escaped)
    |   // Verify roundtrip (escaped)
554 |   let roundtripped = @toml.parse(value.to_string()) (escaped)
    |                            ^^^^^ (escaped)
    |   assert_eq(value, roundtripped) (escaped)
    | } (escaped)

````
