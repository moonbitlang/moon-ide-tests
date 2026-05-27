# toml-parser rename

```mooncram
$ export MOON_HOME="${MOON_HOME:-$HOME/.moon}"
```

```mooncram
$ export TEST_REPO_ROOT="$PWD"
```

```mooncram
$ normalize_moon_ide_output() { sed -e "s|$TEST_REPO_ROOT|<WORKDIR>|g" -e "s|$MOON_HOME|<MOON_HOME>|g"; }
```

```mooncram
$ run_moon_ide() { status_file="${TMPDIR:-/tmp}/moon-ide-status.$$"; ( "$@"; echo "$?" > "$status_file" ) 2>&1 | normalize_moon_ide_output; status=$(cat "$status_file"); rm -f "$status_file"; return "$status"; }
```

```mooncram
$ run_moon_ide moon ide rename 'str_val' 'str_val_renamed' --loc 'cmd/main/main.mbt:7:7'
*** Begin Patch
*** Update File: <WORKDIR>/cmd/main/main.mbt
@@
 
   // Demo 1: Basic value types
   println("\n--- Basic Value Types ---")
-  let str_val = @toml.TomlString("Hello, TOML!")
+  let str_val_renamed = @toml.TomlString("Hello, TOML!")
   let int_val = @toml.TomlInteger(42L)
   let bool_val = @toml.TomlBoolean(true)
-  println("String value: \{str_val}")
+  println("String value: \{str_val_renamed}")
   println("Integer value: \{int_val}")
   println("Boolean value: \{bool_val}")
 
*** End Patch

```

```mooncram
$ run_moon_ide moon ide rename 'TomlString' 'TomlStringRenamed' --loc 'cmd/main/main.mbt:7:23'
*** Begin Patch
*** Update File: <WORKDIR>/README.mbt.md
@@
   guard config
     is TomlTable(
       {
-        "title": TomlString("My App"),
+        "title": TomlStringRenamed("My App"),
-        "version": TomlString("1.0.0"),
+        "version": TomlStringRenamed("1.0.0"),
         "database": TomlTable(
-          { "host": TomlString("localhost"), "port": TomlInteger(5432L), .. }
+          { "host": TomlStringRenamed("localhost"), "port": TomlInteger(5432L), .. }
         ),
         ..
       }
@@
 test {
   // Constructing TomlValue programmatically
   let table : Map[String, @toml.TomlValue] = {
-    "name": TomlString("Alice"),
+    "name": TomlStringRenamed("Alice"),
     "age": TomlInteger(30L),
     "active": TomlBoolean(true),
     "scores": TomlArray([TomlInteger(95L), TomlInteger(87L), TomlInteger(92L)]),
@@
       {
         "database": TomlTable(
           {
-            "host": TomlString("localhost"),
+            "host": TomlStringRenamed("localhost"),
             "port": TomlInteger(5432L),
             "enabled": TomlBoolean(true),
             ..
*** Update File: <WORKDIR>/additional_official_tests_test.mbt
@@
   // Invalid nested structure - outer array contains arrays but inner arrays have different types
   let invalid_nested_array = [
     @toml.TomlArray([TomlInteger(1L), TomlInteger(2L)]),
-    TomlArray([TomlString("hello"), TomlString("world")]),
+    TomlArray([TomlStringRenamed("hello"), TomlStringRenamed("world")]),
   ]
   debug_inspect(
     @toml.TomlValue::is_homogeneous_array(invalid_nested_array),
*** Update File: <WORKDIR>/cmd/main/main.mbt
@@
 
   // Demo 1: Basic value types
   println("\n--- Basic Value Types ---")
-  let str_val = @toml.TomlString("Hello, TOML!")
+  let str_val = @toml.TomlStringRenamed("Hello, TOML!")
   let int_val = @toml.TomlInteger(42L)
   let bool_val = @toml.TomlBoolean(true)
   println("String value: \{str_val}")
*** Update File: <WORKDIR>/coverage_improvement_comprehensive_test.mbt
@@
 /// Test nested validation failure in arrays
 test "nested_validation_failure_in_array" {
   // Create a heterogeneous nested array (which should be invalid)
-  let nested_arr = [@toml.TomlInteger(1L), TomlString("test")]
+  let nested_arr = [@toml.TomlInteger(1L), TomlStringRenamed("test")]
   let invalid_nested = @toml.TomlArray(nested_arr)
   let outer_arr = [invalid_nested]
   let outer_array_value = @toml.TomlArray(outer_arr)
@@
 /// Test to increase coverage of main function components
 test "main_function_components_coverage" {
   // This test exercises the same functions as main() to improve coverage
-  let str_val = @toml.TomlString("Hello, TOML!")
+  let str_val = @toml.TomlStringRenamed("Hello, TOML!")
   let int_val = @toml.TomlInteger(42L)
   let bool_val = @toml.TomlBoolean(true)
 
@@
 test "multiline_string_line_ending_backslash" {
   let toml_input = "multiline = \"\"\"\nLine 1 \\\n    Line 2\"\"\""
   let result = @toml.parse(toml_input)
-  guard result is TomlTable({ "multiline": TomlString(str), .. }) else {
+  guard result is TomlTable({ "multiline": TomlStringRenamed(str), .. }) else {
     fail("Expected table with multiline string")
   }
   // Should have whitespace trimmed after backslash
*** Update File: <WORKDIR>/datetime_test.mbt
@@
 /// Test datetime in complex nested structures
 test "datetime in nested structures" {
   let event_table : Map[String, @toml.TomlValue] = Map([])
-  event_table["name"] = TomlString("Conference 2023")
+  event_table["name"] = TomlStringRenamed("Conference 2023")
   event_table["start_date"] = TomlDateTime(LocalDate("2023-06-15"))
   event_table["start_time"] = TomlDateTime(LocalTime("09:00:00"))
   event_table["end_datetime"] = TomlDateTime(
@@
   )
   let sessions = Array::new()
   let session1 : Map[String, @toml.TomlValue] = Map([])
-  session1["title"] = TomlString("Opening Keynote")
+  session1["title"] = TomlStringRenamed("Opening Keynote")
   session1["scheduled_at"] = TomlDateTime(
     OffsetDateTime("2023-06-15T09:00:00+00:00"),
   )
   sessions.push(@toml.TomlTable(session1))
   let session2 : Map[String, @toml.TomlValue] = Map([])
-  session2["title"] = TomlString("Technical Workshop")
+  session2["title"] = TomlStringRenamed("Technical Workshop")
   session2["scheduled_at"] = TomlDateTime(
     OffsetDateTime("2023-06-15T14:00:00+00:00"),
   )
*** Update File: <WORKDIR>/e2e/convert.mbt
@@
 /// Tables become plain JSON objects, arrays become JSON arrays.
 pub fn to_test_json(value : @toml.TomlValue) -> Json {
   match value {
-    TomlString(s) => typed_value("string", s) (escaped)
+    TomlStringRenamed(s) => typed_value("string", s) (escaped)
     TomlInteger(i) => typed_value("integer", i.to_string()) (escaped)
     TomlFloat(f) => typed_value("float", format_test_float(f)) (escaped)
     TomlBoolean(b) => typed_value("bool", if b { "true" } else { "false" }) (escaped)
*** Update File: <WORKDIR>/internal/qc_model/model.mbt
@@
 /// re-projected via `from_toml`, must yield the original `SimpleValue`.
 pub fn SimpleValue::to_toml(self : SimpleValue) -> @toml.TomlValue {
   match self {
-    SString(s) => TomlString(s) (escaped)
+    SString(s) => TomlStringRenamed(s) (escaped)
     SInteger(n) => TomlInteger(n) (escaped)
     SBoolean(b) => TomlBoolean(b) (escaped)
     SDateTime(value) => TomlDateTime(value) (escaped)
     SDateTimeArray(values) => TomlArray([ for v in values => TomlDateTime(v) ]) (escaped)
     SEmptyArray => TomlArray([]) (escaped)
-    SStringArray(values) => TomlArray([ for v in values => TomlString(v) ]) (escaped)
+    SStringArray(values) => TomlArray([ for v in values => TomlStringRenamed(v) ]) (escaped)
     SIntegerArray(values) => TomlArray([ for v in values => TomlInteger(v) ]) (escaped)
     SBooleanArray(values) => TomlArray([ for v in values => TomlBoolean(v) ]) (escaped)
     STable(fields) => (escaped)
@@
 ///|
 fn project_string(value : @toml.TomlValue) -> String? {
   match value {
-    TomlString(s) => Some(s) (escaped)
+    TomlStringRenamed(s) => Some(s) (escaped)
     _ => None (escaped)
   }
 }
@@
 /// equal to the input; that property is what the round-trip test checks.
 pub fn SimpleValue::from_toml(value : @toml.TomlValue) -> SimpleValue? {
   match value {
-    TomlString(text) => Some(SString(text)) (escaped)
+    TomlStringRenamed(text) => Some(SString(text)) (escaped)
     TomlInteger(number) => Some(SInteger(number)) (escaped)
     TomlBoolean(boolean) => Some(SBoolean(boolean)) (escaped)
     TomlDateTime(datetime) => Some(SDateTime(datetime)) (escaped)
@@
           collect_toml_array(values, project_datetime).map(items => { (escaped)
             SDateTimeArray(items)
           })
-        [TomlString(_), ..] => (escaped)
+        [TomlStringRenamed(_), ..] => (escaped)
           collect_toml_array(values, project_string).map(items => { (escaped)
             SStringArray(items)
           })
*** Update File: <WORKDIR>/official_toml_test_suite_test.mbt
@@
   // which is required by the TOML specification
   let mixed_array = [
     @toml.TomlInteger(1L),
-    TomlString("hello"),
+    TomlStringRenamed("hello"),
     TomlBoolean(true),
   ]
   debug_inspect(
*** Update File: <WORKDIR>/parser.mbt
@@
   match self.view(skip_newlines~) {
     [StringToken(s, ..), .. rest] => { (escaped)
       self.update_view(rest)
-      TomlString(s)
+      TomlStringRenamed(s)
     }
     [IntegerToken(i, ..), .. rest] => { (escaped)
       self.update_view(rest)
*** Update File: <WORKDIR>/toml.mbt
@@
 ///|
 /// TOML Value types that represent different TOML data types
 pub(all) enum TomlValue {
-  TomlString(String)
+  TomlStringRenamed(String)
   TomlInteger(Int64)
   TomlFloat(Double)
   TomlBoolean(Bool)
@@
     [first, .. rest] => { (escaped)
       fn type_id(value : TomlValue) -> Int {
         match value {
-          TomlString(_) => 0 (escaped)
+          TomlStringRenamed(_) => 0 (escaped)
           TomlInteger(_) => 1 (escaped)
           TomlFloat(_) => 2 (escaped)
           TomlBoolean(_) => 3 (escaped)
@@
 /// Get the type name of a TomlValue for error messages
 pub fn TomlValue::type_name(self : TomlValue) -> String {
   match self {
-    TomlString(_) => "string" (escaped)
+    TomlStringRenamed(_) => "string" (escaped)
     TomlInteger(_) => "integer" (escaped)
     TomlFloat(_) => "float" (escaped)
     TomlBoolean(_) => "boolean" (escaped)
*** Update File: <WORKDIR>/toml_test.mbt
@@
 ///|
 /// Basic tests for TOML value types
 test "toml string value" {
-  let value = @toml.TomlString("hello world")
+  let value = @toml.TomlStringRenamed("hello world")
   debug_inspect(
     value.to_string(),
     content=(
@@
 ///|
 test "toml table value" {
   let table : Map[String, @toml.TomlValue] = Map([])
-  table["key1"] = TomlString("value1")
+  table["key1"] = TomlStringRenamed("value1")
   table["key2"] = TomlInteger(42L)
   let value = @toml.TomlTable(table)
   // Note: Map iteration order might vary, we'll test the contains functionality
@@
     @toml.TomlValue::is_homogeneous_array(int_array),
     content="true",
   )
-  let string_array = [@toml.TomlString("a"), TomlString("b"), TomlString("c")]
+  let string_array = [@toml.TomlStringRenamed("a"), TomlStringRenamed("b"), TomlStringRenamed("c")]
   debug_inspect(
     @toml.TomlValue::is_homogeneous_array(string_array),
     content="true",
@@
   // Mixed types (should be invalid)
   let mixed_array = [
     @toml.TomlInteger(1L),
-    TomlString("hello"),
+    TomlStringRenamed("hello"),
     TomlBoolean(true),
   ]
   debug_inspect(
@@
   // Mixed datetime and string (should be invalid)
   let mixed_dt_string = [
     @toml.TomlDateTime(LocalDate("2023-01-01")),
-    TomlString("not a date"),
+    TomlStringRenamed("not a date"),
   ]
   debug_inspect(
     @toml.TomlValue::is_homogeneous_array(mixed_dt_string),
@@
   debug_inspect(valid_toml_array.validate(), content="true")
 
   // Invalid heterogeneous array
-  let invalid_array = [@toml.TomlInteger(1L), TomlString("mixed")]
+  let invalid_array = [@toml.TomlInteger(1L), TomlStringRenamed("mixed")]
   let invalid_toml_array = @toml.TomlArray(invalid_array)
   debug_inspect(invalid_toml_array.validate(), content="false")
 
   // Valid nested structure
   let valid_table : Map[String, @toml.TomlValue] = Map([])
-  let nested_array = [@toml.TomlString("item1"), TomlString("item2")]
+  let nested_array = [@toml.TomlStringRenamed("item1"), TomlStringRenamed("item2")]
   valid_table["items"] = TomlArray(nested_array)
   valid_table["count"] = TomlInteger(2L)
   let valid_nested = @toml.TomlTable(valid_table)
@@
   // Invalid nested structure (contains invalid array)
   let invalid_table : Map[String, @toml.TomlValue] = Map([])
   let bad_nested_array = [
-    @toml.TomlString("item1"),
+    @toml.TomlStringRenamed("item1"),
     TomlInteger(42L), // Mixed types
   ]
   invalid_table["items"] = TomlArray(bad_nested_array)
@@
   debug_inspect(invalid_nested.validate(), content="false")
 
   // Simple values should always be valid
-  debug_inspect(@toml.TomlString("hello").validate(), content="true")
+  debug_inspect(@toml.TomlStringRenamed("hello").validate(), content="true")
   debug_inspect(@toml.TomlInteger(42L).validate(), content="true")
   debug_inspect(@toml.TomlFloat(3.14).validate(), content="true")
   debug_inspect(@toml.TomlBoolean(true).validate(), content="true")
*** Update File: <WORKDIR>/toml_to_string.mbt
@@
   path : Array[String], // Current table path for nested tables
 ) -> Unit {
   match self {
-    TomlString(s) => output <+ "\\"\\{escape_toml_string(s)}\\"" (escaped)
+    TomlStringRenamed(s) => output <+ "\\"\\{escape_toml_string(s)}\\"" (escaped)
     TomlInteger(i) => output <+ "\\{i}" (escaped)
     TomlFloat(f) => (escaped)
       // Handle special float values
*** Update File: <WORKDIR>/toml_to_string_test.mbt
@@
 ///|
 test "serialize simple string" {
-  let value = @toml.TomlString("hello world")
+  let value = @toml.TomlStringRenamed("hello world")
   inspect(value, content="\"hello world\"")
 }
 
 ///|
 test "serialize string with escapes" {
-  let value = @toml.TomlString("hello\nworld\t\"quoted\"\\backslash")
+  let value = @toml.TomlStringRenamed("hello\nworld\t\"quoted\"\\backslash")
   inspect(value, content="\"hello\\nworld\\t\\\"quoted\\\"\\\\backslash\"")
 }
 
 ///|
 test "serialize string with control characters" {
-  let value = @toml.TomlString("null:\u0000 bell:\u0007 delete:\u007F")
+  let value = @toml.TomlStringRenamed("null:\u0000 bell:\u0007 delete:\u007F")
   inspect(value, content="\"null:\\u0000 bell:\\u0007 delete:\\u007F\"")
 }
 
@@
 
 ///|
 test "serialize mixed type inline array" {
-  let array = @toml.TomlArray([TomlString("hello"), TomlString("world")])
+  let array = @toml.TomlArray([TomlStringRenamed("hello"), TomlStringRenamed("world")])
   inspect(array, content="[\"hello\", \"world\"]")
 }
 
@@
 ///|
 test "serialize simple table" {
   let table = Map::from_array([
-    ("name", @toml.TomlString("Alice")),
+    ("name", @toml.TomlStringRenamed("Alice")),
     ("age", TomlInteger(30L)),
     ("active", TomlBoolean(true)),
   ])
@@
 ///|
 test "serialize table with arrays" {
   let table = Map::from_array([
-    ("title", @toml.TomlString("Example")),
+    ("title", @toml.TomlStringRenamed("Example")),
     ("numbers", TomlArray([TomlInteger(1L), TomlInteger(2L), TomlInteger(3L)])),
   ])
   inspect(
@@
     ("y", TomlInteger(2L)),
   ])
   let outer_table = Map::from_array([
-    ("name", @toml.TomlString("test")),
+    ("name", @toml.TomlStringRenamed("test")),
     ("position", TomlTable(inner_table)),
   ])
   inspect(
@@
 
 ///|
 test "serialize deeply nested tables" {
-  let level3 = Map::from_array([("deep", @toml.TomlString("value"))])
+  let level3 = Map::from_array([("deep", @toml.TomlStringRenamed("value"))])
   let level2 = Map::from_array([("nested", @toml.TomlTable(level3))])
   let level1 = Map::from_array([
-    ("top", @toml.TomlString("level")),
+    ("top", @toml.TomlStringRenamed("level")),
     ("sub", TomlTable(level2)),
   ])
   inspect(
@@
 ///|
 test "serialize array of tables" {
   let table1 = Map::from_array([
-    ("name", @toml.TomlString("Alice")),
+    ("name", @toml.TomlStringRenamed("Alice")),
     ("score", TomlInteger(100L)),
   ])
   let table2 = Map::from_array([
-    ("name", @toml.TomlString("Bob")),
+    ("name", @toml.TomlStringRenamed("Bob")),
     ("score", TomlInteger(95L)),
   ])
   let root = Map::from_array([
-    ("title", @toml.TomlString("High Scores")),
+    ("title", @toml.TomlStringRenamed("High Scores")),
     ("players", TomlArray([TomlTable(table1), TomlTable(table2)])),
   ])
   inspect(
@@
 ///|
 test "serialize complex nested structure" {
   let database = Map::from_array([
-    ("host", @toml.TomlString("localhost")),
+    ("host", @toml.TomlStringRenamed("localhost")),
     ("port", TomlInteger(5432L)),
-    ("username", TomlString("admin")),
+    ("username", TomlStringRenamed("admin")),
-    ("password", TomlString("secret123")),
+    ("password", TomlStringRenamed("secret123")),
   ])
   let server = Map::from_array([
-    ("ip", @toml.TomlString("0.0.0.0")),
+    ("ip", @toml.TomlStringRenamed("0.0.0.0")),
     ("port", TomlInteger(8080L)),
     ("timeout", TomlInteger(30L)),
   ])
   let staging = Map::from_array([
-    ("url", @toml.TomlString("https://staging.example.com")),
+    ("url", @toml.TomlStringRenamed("https://staging.example.com")),
     ("debug", TomlBoolean(true)),
   ])
   let production = Map::from_array([
-    ("url", @toml.TomlString("https://example.com")),
+    ("url", @toml.TomlStringRenamed("https://example.com")),
     ("debug", TomlBoolean(false)),
   ])
   let environments = Map::from_array([
@@
     ("production", TomlTable(production)),
   ])
   let root = Map::from_array([
-    ("title", @toml.TomlString("Application Config")),
+    ("title", @toml.TomlStringRenamed("Application Config")),
-    ("version", TomlString("1.0.0")),
+    ("version", TomlStringRenamed("1.0.0")),
     ("database", TomlTable(database)),
     ("server", TomlTable(server)),
     ("environments", TomlTable(environments)),
@@
 ///|
 test "serialize table with special key names" {
   let table = Map::from_array([
-    ("normal-key", @toml.TomlString("value1")),
+    ("normal-key", @toml.TomlStringRenamed("value1")),
-    ("key with spaces", TomlString("value2")),
+    ("key with spaces", TomlStringRenamed("value2")),
-    ("key.with.dots", TomlString("value3")),
+    ("key.with.dots", TomlStringRenamed("value3")),
-    ("key\"with\"quotes", TomlString("value4")),
+    ("key\"with\"quotes", TomlStringRenamed("value4")),
-    ("key#with#hash", TomlString("value5")),
+    ("key#with#hash", TomlStringRenamed("value5")),
   ])
   inspect(
     @toml.TomlTable(table),
@@
 ///|
 test "serialize table with multiple array of tables" {
   let product1 = Map::from_array([
-    ("name", @toml.TomlString("Hammer")),
+    ("name", @toml.TomlStringRenamed("Hammer")),
     ("sku", TomlInteger(738594937L)),
   ])
   let product2 = Map::from_array([
-    ("name", @toml.TomlString("Nail")),
+    ("name", @toml.TomlStringRenamed("Nail")),
     ("sku", TomlInteger(284758393L)),
-    ("color", TomlString("gray")),
+    ("color", TomlStringRenamed("gray")),
   ])
   let root = Map::from_array([
     ("products", @toml.TomlArray([TomlTable(product1), TomlTable(product2)])),
@@
 ///|
 test "roundtrip simple example" {
   let doc = Map::from_array([
-    ("title", @toml.TomlString("TOML Example")),
+    ("title", @toml.TomlStringRenamed("TOML Example")),
     (
       "owner",
       TomlTable(
         Map::from_array([
-          ("name", TomlString("Tom Preston-Werner")),
+          ("name", TomlStringRenamed("Tom Preston-Werner")),
           ("dob", TomlDateTime(OffsetDateTime("1979-05-27T07:32:00-08:00"))),
         ]),
       ),
*** Update File: <WORKDIR>/toml_utils.mbt
@@
   let new_table = create_array_of_tables(root_table, ["servers"])
 
   // Add some data to the new table
-  new_table["name"] = TomlString("alpha")
+  new_table["name"] = TomlStringRenamed("alpha")
-  new_table["ip"] = TomlString("10.0.0.1")
+  new_table["ip"] = TomlStringRenamed("10.0.0.1")
   inspect(
     TomlTable(root_table),
     content=(
@@
 
   // Create first table
   let table1 = create_array_of_tables(root_table, ["products"])
-  table1["name"] = TomlString("Hammer")
+  table1["name"] = TomlStringRenamed("Hammer")
   table1["sku"] = TomlInteger(738594937)
 
   // Append second table to same array
   let table2 = create_array_of_tables(root_table, ["products"])
-  table2["name"] = TomlString("Nail")
+  table2["name"] = TomlStringRenamed("Nail")
   table2["sku"] = TomlInteger(284758393)
 
   // Append third table
   let table3 = create_array_of_tables(root_table, ["products"])
-  table3["name"] = TomlString("Screwdriver")
+  table3["name"] = TomlStringRenamed("Screwdriver")
   table3["sku"] = TomlInteger(987654321)
   inspect(
     TomlTable(root_table),
@@
   let color_table1 = create_array_of_tables(root_table, [
     "fruit", "physical", "color",
   ])
-  color_table1["name"] = TomlString("red")
+  color_table1["name"] = TomlStringRenamed("red")
-  color_table1["code"] = TomlString("#FF0000")
+  color_table1["code"] = TomlStringRenamed("#FF0000")
 
   // Add another color
   let color_table2 = create_array_of_tables(root_table, [
     "fruit", "physical", "color",
   ])
-  color_table2["name"] = TomlString("green")
+  color_table2["name"] = TomlStringRenamed("green")
-  color_table2["code"] = TomlString("#00FF00")
+  color_table2["code"] = TomlStringRenamed("#00FF00")
   inspect(
     TomlTable(root_table),
     content=(
@@
   let root_table : Map[String, TomlValue] = Map([])
 
   // First create a regular table structure
-  set_dotted_key_value(root_table, ["owner", "name"], TomlString("Tom"))
+  set_dotted_key_value(root_table, ["owner", "name"], TomlStringRenamed("Tom"))
-  set_dotted_key_value(root_table, ["owner", "dob"], TomlString("1979-05-27"))
+  set_dotted_key_value(root_table, ["owner", "dob"], TomlStringRenamed("1979-05-27"))
 
   // Now create array of tables at a different path
   let db1 = create_array_of_tables(root_table, ["database", "servers"])
-  db1["host"] = TomlString("192.168.1.1")
+  db1["host"] = TomlStringRenamed("192.168.1.1")
   db1["port"] = TomlInteger(5432)
   let db2 = create_array_of_tables(root_table, ["database", "servers"])
-  db2["host"] = TomlString("192.168.1.2")
+  db2["host"] = TomlStringRenamed("192.168.1.2")
   db2["port"] = TomlInteger(5433)
   debug_inspect(
     root_table,
@@
   let root_table : Map[String, TomlValue] = Map([])
 
   // Set a string value at "products"
-  root_table["products"] = TomlString("not a table")
+  root_table["products"] = TomlStringRenamed("not a table")
 
   // Try to create array of tables at ["products", "items"]
   // This should fail because "products" is not a table
@@
   set_dotted_key_value(
     root_table,
     ["servers", "alpha"],
-    TomlTable(Map::from_array([("name", TomlString("main"))])),
+    TomlTable(Map::from_array([("name", TomlStringRenamed("main"))])),
   )
 
   // Try to treat servers.alpha as array of tables
@@
 
   // Create first [[fruits]]
   let fruit1 = create_array_of_tables(root_table, ["fruits"])
-  fruit1["name"] = TomlString("apple")
+  fruit1["name"] = TomlStringRenamed("apple")
 
   // Create second [[fruits]]
   let fruit2 = create_array_of_tables(root_table, ["fruits"])
-  fruit2["name"] = TomlString("banana")
+  fruit2["name"] = TomlStringRenamed("banana")
 
   // Create [[vegetables]]
   let veg1 = create_array_of_tables(root_table, ["vegetables"])
-  veg1["name"] = TomlString("carrot")
+  veg1["name"] = TomlStringRenamed("carrot")
-  veg1["color"] = TomlString("orange")
+  veg1["color"] = TomlStringRenamed("orange")
   let veg2 = create_array_of_tables(root_table, ["vegetables"])
-  veg2["name"] = TomlString("lettuce")
+  veg2["name"] = TomlStringRenamed("lettuce")
-  veg2["color"] = TomlString("green")
+  veg2["color"] = TomlStringRenamed("green")
   debug_inspect(
     root_table,
     content=(
@@
 test "set dotted key value - simple key" {
   // Test setting a simple key (path length 1)
   let table : Map[String, TomlValue] = Map([])
-  set_dotted_key_value(table, ["name"], TomlString("Alice"))
+  set_dotted_key_value(table, ["name"], TomlStringRenamed("Alice"))
   debug_inspect(
     table,
     content=(
@@
 test "set dotted key value - nested keys creating tables" {
   // Test creating nested tables automatically
   let table : Map[String, TomlValue] = Map([])
-  set_dotted_key_value(table, ["server", "host"], TomlString("localhost"))
+  set_dotted_key_value(table, ["server", "host"], TomlStringRenamed("localhost"))
   set_dotted_key_value(table, ["server", "port"], TomlInteger(8080))
   debug_inspect(
     table,
@@
   set_dotted_key_value(
     table,
     ["a", "b", "c", "d", "e"],
-    TomlString("deep value"),
+    TomlStringRenamed("deep value"),
   )
   debug_inspect(
     table,
@@
   let table : Map[String, TomlValue] = Map([])
 
   // Add multiple values at different levels
-  set_dotted_key_value(table, ["database", "server"], TomlString("postgres"))
+  set_dotted_key_value(table, ["database", "server"], TomlStringRenamed("postgres"))
   set_dotted_key_value(table, ["database", "port"], TomlInteger(5432))
   set_dotted_key_value(
     table,
     ["database", "credentials", "user"],
-    TomlString("admin"),
+    TomlStringRenamed("admin"),
   )
   set_dotted_key_value(
     table,
     ["database", "credentials", "password"],
-    TomlString("secret"),
+    TomlStringRenamed("secret"),
   )
   set_dotted_key_value(table, ["database", "options", "ssl"], TomlBoolean(true))
   debug_inspect(
@@
   let table : Map[String, TomlValue] = Map([])
 
   // Create initial structure
-  set_dotted_key_value(table, ["app", "name"], TomlString("MyApp"))
+  set_dotted_key_value(table, ["app", "name"], TomlStringRenamed("MyApp"))
-  set_dotted_key_value(table, ["app", "version"], TomlString("1.0.0"))
+  set_dotted_key_value(table, ["app", "version"], TomlStringRenamed("1.0.0"))
 
   // Add more values to the same table later
-  set_dotted_key_value(table, ["app", "author"], TomlString("Developer"))
+  set_dotted_key_value(table, ["app", "author"], TomlStringRenamed("Developer"))
-  set_dotted_key_value(table, ["app", "license"], TomlString("MIT"))
+  set_dotted_key_value(table, ["app", "license"], TomlStringRenamed("MIT"))
   debug_inspect(
     table,
     content=(
@@
   let table : Map[String, TomlValue] = {}
 
   // Set a string value at "config"
-  set_dotted_key_value(table, ["config"], TomlString("simple value"))
+  set_dotted_key_value(table, ["config"], TomlStringRenamed("simple value"))
 
   // Try to treat "config" as a table - this should raise an error
   try
-    set_dotted_key_value(table, ["config", "nested"], TomlString("value"))
+    set_dotted_key_value(table, ["config", "nested"], TomlStringRenamed("value"))
   catch {
     err => (escaped)
       debug_inspect(
@@
   let table : Map[String, TomlValue] = Map([])
 
   // Set a value first
-  set_dotted_key_value(table, ["key"], TomlString("value"))
+  set_dotted_key_value(table, ["key"], TomlStringRenamed("value"))
 
   // Try with empty path - currently does nothing
-  set_dotted_key_value(table, [], TomlString("should not appear"))
+  set_dotted_key_value(table, [], TomlStringRenamed("should not appear"))
 
   // Table should only have the first key
   debug_inspect(table, content="")
*** End Patch

```

```mooncram
$ run_moon_ide moon ide rename 'passed' 'passed_renamed' --loc 'e2e/runner.mbt:8:3'
*** Begin Patch
*** Update File: <WORKDIR>/e2e/runner.mbt
@@
 /// fixture path and a short reason) so that the test harness can print a
 /// summary at the end without re-walking the corpus.
 pub struct TestResult {
-  passed : Int
+  passed_renamed : Int
   failed : Int
   failures : Array[String]
 }
@@
 ///|
 /// Create an empty `TestResult` with zero counts and no failures recorded.
 pub fn TestResult::new() -> TestResult {
-  { passed: 0, failed: 0, failures: [] }
+  { passed_renamed: 0, failed: 0, failures: [] }
 }
 
 ///|
*** End Patch

```

```mooncram
$ run_moon_ide moon ide rename 'failed' 'failed_renamed' --loc 'e2e/runner.mbt:9:3'
*** Begin Patch
*** Update File: <WORKDIR>/e2e/runner.mbt
@@
 /// summary at the end without re-walking the corpus.
 pub struct TestResult {
   passed : Int
-  failed : Int
+  failed_renamed : Int
   failures : Array[String]
 }
 
@@
 ///|
 /// Create an empty `TestResult` with zero counts and no failures recorded.
 pub fn TestResult::new() -> TestResult {
-  { passed: 0, failed: 0, failures: [] }
+  { passed: 0, failed_renamed: 0, failures: [] }
 }
 
 ///|
*** End Patch

```

```mooncram
$ run_moon_ide moon ide rename 'to_test_json' 'to_test_json_renamed' --loc 'e2e/convert.mbt:5:8'
*** Begin Patch
*** Update File: <WORKDIR>/e2e/convert.mbt
@@
 /// Convert a TomlValue to the toml-test JSON format.
 /// Leaf values become {"type": "...", "value": "..."}
 /// Tables become plain JSON objects, arrays become JSON arrays.
-pub fn to_test_json(value : @toml.TomlValue) -> Json {
+pub fn to_test_json_renamed(value : @toml.TomlValue) -> Json {
   match value {
     TomlString(s) => typed_value("string", s) (escaped)
     TomlInteger(i) => typed_value("integer", i.to_string()) (escaped)
@@
         _ => typed_value("date-local", s) (escaped)
       }
     }
-    TomlArray(arr) => Json::array([ for v in arr => to_test_json(v) ]) (escaped)
+    TomlArray(arr) => Json::array([ for v in arr => to_test_json_renamed(v) ]) (escaped)
     TomlTable(table) => (escaped)
       Json::object(
-        Map::from_array([ for k, v in table => (k, to_test_json(v)) ]), (escaped)
+        Map::from_array([ for k, v in table => (k, to_test_json_renamed(v)) ]), (escaped)
       )
   }
 }
*** Update File: <WORKDIR>/e2e/e2e_test.mbt
@@
         failed += 1
       }
       Ok(value) => { (escaped)
-        let actual = @e2e.to_test_json(value)
+        let actual = @e2e.to_test_json_renamed(value)
         if !@e2e.json_equal(actual, expected) {
           failures.push(
             "[MISMATCH] \{toml_path}\n    expected: \{expected.stringify()}\n    actual:   \{actual.stringify()}",
*** Update File: <WORKDIR>/e2e/runner.mbt
@@
   match parsed {
     Err(e) => Some("[PARSE-ERROR] \\{toml_path}: \\{e}") (escaped)
     Ok(value) => { (escaped)
-      let actual = to_test_json(value)
+      let actual = to_test_json_renamed(value)
       if !json_equal(actual, expected) {
         Some(
           "[MISMATCH] \{toml_path}\n    expected: \{expected.stringify()}\n    actual:   \{actual.stringify()}",
*** End Patch

```

```mooncram
$ run_moon_ide moon ide rename 'value' 'value_renamed' --loc 'e2e/convert.mbt:5:21'
*** Begin Patch
*** Update File: <WORKDIR>/e2e/convert.mbt
@@
 /// Convert a TomlValue to the toml-test JSON format.
 /// Leaf values become {"type": "...", "value": "..."}
 /// Tables become plain JSON objects, arrays become JSON arrays.
-pub fn to_test_json(value : @toml.TomlValue) -> Json {
+pub fn to_test_json(value_renamed : @toml.TomlValue) -> Json {
-  match value {
+  match value_renamed {
     TomlString(s) => typed_value("string", s) (escaped)
     TomlInteger(i) => typed_value("integer", i.to_string()) (escaped)
     TomlFloat(f) => typed_value("float", format_test_float(f)) (escaped)
     TomlBoolean(b) => typed_value("bool", if b { "true" } else { "false" }) (escaped)
     TomlDateTime(_) => { (escaped)
-      let (kind, s) = value.datetime_info().unwrap()
+      let (kind, s) = value_renamed.datetime_info().unwrap()
       match kind {
         "OffsetDateTime" => typed_value("datetime", normalize_datetime(s)) (escaped)
         "LocalDateTime" => typed_value("datetime-local", normalize_datetime(s)) (escaped)
*** Update File: <WORKDIR>/e2e/e2e_test.mbt
@@
         continue
       }
     }
-    let parsed = try? @toml.parse(toml_content)
+    let parsed = try? @toml.parse(value_renamed)
     match parsed {
       Err(e) => { (escaped)
         failures.push("[PARSE-ERROR] \{toml_path}: \{e}")
*** End Patch

```

```mooncram
$ run_moon_ide moon ide rename 'files' 'files_renamed' --loc 'e2e/e2e_test.mbt:3:7'
*** Begin Patch
*** Update File: <WORKDIR>/e2e/e2e_test.mbt
@@
 ///|
 async test "valid toml-test suite" {
-  let files : Array[String] = []
+  let files_renamed : Array[String] = []
-  @e2e.collect_toml_files("e2e/testdata/valid", files)
+  @e2e.collect_toml_files("e2e/testdata/valid", files_renamed)
-  files.sort()
+  files_renamed.sort()
   let mut passed = 0
   let mut failed = 0
   let failures : Array[String] = []
-  for toml_path in files {
+  for toml_path in files_renamed {
     let json_path = "\{toml_path[:toml_path.length() - 5]}.json"
     if !@fs.path_exists(json_path) {
       continue
*** End Patch

```

```mooncram
$ run_moon_ide moon ide rename 'collect_toml_files' 'collect_toml_files_renamed' --loc 'e2e/e2e_test.mbt:4:8'
*** Begin Patch
*** Update File: <WORKDIR>/e2e/e2e_test.mbt
@@
 ///|
 async test "valid toml-test suite" {
   let files : Array[String] = []
-  @e2e.collect_toml_files("e2e/testdata/valid", files)
+  @e2e.collect_toml_files_renamed("e2e/testdata/valid", files)
   files.sort()
   let mut passed = 0
   let mut failed = 0
@@
 ///|
 async test "invalid toml-test suite" {
   let files : Array[String] = []
-  @e2e.collect_toml_files("e2e/testdata/invalid", files)
+  @e2e.collect_toml_files_renamed("e2e/testdata/invalid", files)
   files.sort()
   let mut passed = 0
   let mut failed = 0
*** Update File: <WORKDIR>/e2e/runner.mbt
@@
 
 ///|
 /// Recursively collect all .toml files in a directory.
-pub fn collect_toml_files(
+pub fn collect_toml_files_renamed(
   dir : String,
   files : Array[String],
 ) -> Unit raise @fs.IOError {
@@
   for entry in entries {
     let path = "\{dir}/\{entry}"
     if @fs.is_dir(path) {
-      collect_toml_files(path, files)
+      collect_toml_files_renamed(path, files)
     } else if entry.has_suffix(".toml") {
       files.push(path)
     }
*** End Patch

```

```mooncram
$ run_moon_ide moon ide rename 'result' 'result_renamed' --loc 'e2e/known_failures_test.mbt:10:7'
*** Begin Patch
*** Update File: <WORKDIR>/e2e/known_failures_test.mbt
@@
 
 ///|
 test "fixed: [a-a-a] table header parses correctly" {
-  let result = try? @toml.parse("[a-a-a]\n_ = false\n")
+  let result_renamed = try? @toml.parse("[a-a-a]\n_ = false\n")
   debug_inspect(
-    result,
+    result_renamed,
     content=(
       #|Ok(TomlTable({ "a-a-a": TomlTable({ "_": TomlBoolean(false) }) }))
     ),
*** End Patch

```

```mooncram
$ run_moon_ide moon ide rename 'parse' 'parse_renamed' --loc 'e2e/known_failures_test.mbt:10:27'
*** Begin Patch
*** Update File: <WORKDIR>/README.mbt.md
@@
 ///|
 test {
   // Quick start example - parsing and accessing values
-  let config = @toml.parse(
+  let config = @toml.parse_renamed(
     (
       #|title = "My App"
       #|version = "1.0.0"
@@
 test {
   // Error handling with try-catch
   let invalid_toml = "invalid = [unclosed"
-  let config = @toml.parse(invalid_toml) catch {
+  let config = @toml.parse_renamed(invalid_toml) catch {
     _ => TomlTable(Map([])) // Return default value on error (escaped)
   }
   guard config is TomlTable(table) else { fail("Expected table") }
@@
   assert_eq(table.length(), 0) // Empty table from error handler
 
   // Error handling with try? - converts to Result type
-  let result = try? @toml.parse("key = \"value\"")
+  let result = try? @toml.parse_renamed("key = \"value\"")
   guard result is Ok(TomlTable({ "key": _, .. })) else {
     fail("Should have parsed successfully with key")
   }
 
   // Parsing error example
-  let bad_result = try? @toml.parse("bad syntax here")
+  let bad_result = try? @toml.parse_renamed("bad syntax here")
   assert_true(bad_result is Err(_))
 }
 ```
@@
     #|max_connections = 100
     #|
   debug_inspect(
-    @toml.parse(toml),
+    @toml.parse_renamed(toml),
     content=(
       #|TomlTable(
       #|  {
@@
     #|booleans = [true, false, true]
     #|
   debug_inspect(
-    @toml.parse(toml_arrays),
+    @toml.parse_renamed(toml_arrays),
     content=(
       #|TomlTable(
       #|  {
@@
     #|sku = 284758393
     #|
   debug_inspect(
-    @toml.parse(toml_tables),
+    @toml.parse_renamed(toml_tables),
     content=(
       #|TomlTable(
       #|  {
@@
     #|meeting_time = 14:30:00
     #|
   debug_inspect(
-    @toml.parse(toml_datetime),
+    @toml.parse_renamed(toml_datetime),
     content=(
       #|TomlTable(
       #|  {
@@
     #|cache = {enabled = true, ttl = 300}
     #|
   debug_inspect(
-    @toml.parse(toml_inline),
+    @toml.parse_renamed(toml_inline),
     content=(
       #|TomlTable(
       #|  {
@@
     #|  2023-08-20T02:00:00
     #|]
     #|
-  let result = @toml.parse(config)
+  let result = @toml.parse_renamed(config)
   assert_true(result.validate())
   // Verify the structure contains expected keys
   guard result
@@
     #|weight = 0.5
     #|
   debug_inspect(
-    @toml.parse(toml_advanced),
+    @toml.parse_renamed(toml_advanced),
     content=(
       #|TomlTable(
       #|  {
@@
 ///|
 test {
   // Working with nested tables
-  let parsed_toml = @toml.parse(
+  let parsed_toml = @toml.parse_renamed(
     (
       #|[database]
       #|host = "localhost"
@@
 ///|
 test {
   // Valid: all integers
-  let valid = @toml.parse("numbers = [1, 2, 3]")
+  let valid = @toml.parse_renamed("numbers = [1, 2, 3]")
   assert_true(valid.validate())
 
   // Mixed types are allowed during parsing but fail validation
-  let mixed = @toml.parse("mixed = [1, \"two\", 3.0]")
+  let mixed = @toml.parse_renamed("mixed = [1, \"two\", 3.0]")
   assert_false(mixed.validate()) // Validation catches the type mismatch
 }
 ```
@@
 ///|
 test {
   // Working with all 4 datetime types
-  let parsed_toml = @toml.parse(
+  let parsed_toml = @toml.parse_renamed(
     (
       #|offset_dt = 2023-01-15T10:30:00Z
       #|local_dt = 2023-01-15T10:30:00
*** Update File: <WORKDIR>/additional_official_tests_test.mbt
@@
     #|"ʎǝʞ" = "value"
     #|
   debug_inspect(
-    @toml.parse(key_variations_toml),
+    @toml.parse_renamed(key_variations_toml),
     content=(
       #|TomlTable(
       #|  {
@@
     #|0 = "zero"
     #|
   debug_inspect(
-    @toml.parse(numeric_keys_toml),
+    @toml.parse_renamed(numeric_keys_toml),
     content=(
       #|TomlTable({ "1234": TomlString("value"), "0": TomlString("zero") })
     ),
@@
     #|quote = "This has a quote: \""
     #|
   debug_inspect(
-    @toml.parse(escape_sequences_toml),
+    @toml.parse_renamed(escape_sequences_toml),
     content=(
       #|TomlTable(
       #|  {
@@
     #|large_number = 9223372036854775807
     #|
   debug_inspect(
-    @toml.parse(numbers_toml),
+    @toml.parse_renamed(numbers_toml),
     content=(
       #|TomlTable(
       #|  {
@@
     #|array_with_spaces = [ [ 1 , 2 ] , [ 3 , 4 ] ]
     #|
   debug_inspect(
-    @toml.parse(nested_arrays_toml),
+    @toml.parse_renamed(nested_arrays_toml),
     content=(
       #|TomlTable(
       #|  {
@@
     #|spaces = { key1 = "value1" , key2 = "value2" }
     #|
   debug_inspect(
-    @toml.parse(inline_tables_toml),
+    @toml.parse_renamed(inline_tables_toml),
     content=(
       #|TomlTable(
       #|  {
@@
     #|features = {new_ui = true, beta_api = false, experimental = true}
     #|
   debug_inspect(
-    @toml.parse(config_toml),
+    @toml.parse_renamed(config_toml),
     content=(
       #|TomlTable(
       #|  {
@@
     #|table3= { a=1 , b=2 }
     #|
   debug_inspect(
-    @toml.parse(whitespace_edge_toml),
+    @toml.parse_renamed(whitespace_edge_toml),
     content=(
       #|TomlTable(
       #|  {
@@
     #|single_key_table = {key = "value"}
     #|
   debug_inspect(
-    @toml.parse(boundary_toml),
+    @toml.parse_renamed(boundary_toml),
     content=(
       #|TomlTable(
       #|  {
*** Update File: <WORKDIR>/cmd/main/main.mbt
@@
   println("Input TOML:")
   println(toml_input)
   try {
-    let result = @toml.parse(toml_input)
+    let result = @toml.parse_renamed(toml_input)
     println("\nParsed result:")
     println(result.to_string())
   } catch {
@@
   println("Input TOML:")
   println(toml_array)
   try {
-    let result = @toml.parse(toml_array)
+    let result = @toml.parse_renamed(toml_array)
     println("\nParsed result:")
     println(result.to_string())
   } catch {
@@
   println("Input TOML:")
   println(toml_table)
   try {
-    let result = @toml.parse(toml_table)
+    let result = @toml.parse_renamed(toml_table)
     println("\nParsed result:")
     println(result.to_string())
   } catch {
*** Update File: <WORKDIR>/comprehensive_test.mbt
@@
     #|ports = [8000, 8001, 8002]
     #|
   debug_inspect(
-    @toml.parse(simple_toml),
+    @toml.parse_renamed(simple_toml),
     content=(
       #|TomlTable(
       #|  {
@@
     #|floats = [1.1, 2.2, 3.3]
     #|
   debug_inspect(
-    @toml.parse(complex_toml),
+    @toml.parse_renamed(complex_toml),
     content=(
       #|TomlTable(
       #|  {
@@
     #|endpoints = ["/api/v1", "/api/v2", "/health"]
     #|
   debug_inspect(
-    @toml.parse(inline_toml),
+    @toml.parse_renamed(inline_toml),
     content=(
       #|TomlTable(
       #|  {
@@
     #|features = {logging = true, metrics = false, caching = {enabled = true, ttl = 300}}
     #|
   debug_inspect(
-    @toml.parse(app_config),
+    @toml.parse_renamed(app_config),
     content=(
       #|TomlTable(
       #|  {
@@
     #|mixed = ["double", 'single', "escaped\"quote"]
     #|
   debug_inspect(
-    @toml.parse(string_tests),
+    @toml.parse_renamed(string_tests),
     content=(
       #|TomlTable(
       #|  {
@@
     #|mixed_numbers = [0, 1, 42, 3.14, 2.5, 0.0]
     #|
   debug_inspect(
-    @toml.parse(number_tests),
+    @toml.parse_renamed(number_tests),
     content=(
       #|TomlTable(
       #|  {
@@
 ///|
 test "empty array" {
   debug_inspect(
-    @toml.parse(
+    @toml.parse_renamed(
       (
         #|empty_array = []
       ),
@@
     #|small_negative = -0.001
     #|
   debug_inspect(
-    @toml.parse(negative_toml),
+    @toml.parse_renamed(negative_toml),
     content=(
       #|TomlTable(
       #|  {
@@
 test "negative numbers in context" {
   // Single negative integer
   debug_inspect(
-    @toml.parse(
+    @toml.parse_renamed(
       (
         #|count = -5
       ),
@@
 
   // Single negative float  
   debug_inspect(
-    @toml.parse(
+    @toml.parse_renamed(
       (
         #|temperature = -15.5
       ),
@@
 
   // Array with mixed positive and negative numbers
   debug_inspect(
-    @toml.parse(
+    @toml.parse_renamed(
       (
         #|values = [1, -2, 3.0, -4.5]
       ),
@@
     #|coords = {x = -10, y = 20, z = -5.5}
     #|
   debug_inspect(
-    @toml.parse(coords_toml),
+    @toml.parse_renamed(coords_toml),
     content=(
       #|TomlTable({ "coords": TomlTable({ "x": TomlInteger(-10), "y": TomlInteger(20), "z": TomlFloat(-5.5) }) })
     ),
@@
     #|adjustment = -0.1
     #|
   debug_inspect(
-    @toml.parse(multi_negative),
+    @toml.parse_renamed(multi_negative),
     content=(
       #|TomlTable(
       #|  {
@@
     #|rate_limiting = {enabled = true, requests_per_minute = 1000, burst = 50}
     #|
   debug_inspect(
-    @toml.parse(microservice_config),
+    @toml.parse_renamed(microservice_config),
     content=(
       #|TomlTable(
       #|  {
@@
 
   // Test 5: Invalid syntax after comma
   debug_inspect(
-    try? @toml.parse("table = {key1 = \"val1\", }"),
+    try? @toml.parse_renamed("table = {key1 = \"val1\", }"),
     content=(
       #|Ok(TomlTable({ "table": TomlTable({ "key1": TomlString("val1") }) }))
     ),
@@
 test "edge cases" {
   // Empty input should result in empty table
   debug_inspect(
-    @toml.parse(
+    @toml.parse_renamed(
       (
         #|
       ),
@@
     #|# Another comment
     #|
   debug_inspect(
-    @toml.parse(comments_only_toml),
+    @toml.parse_renamed(comments_only_toml),
     content=(
       #|TomlTable({})
     ),
@@
     #|double = "value"
     #|
   debug_inspect(
-    @toml.parse(mixed_quotes_toml),
+    @toml.parse_renamed(mixed_quotes_toml),
     content=(
       #|TomlTable({ "single": TomlString("value"), "double": TomlString("value") })
     ),
@@
 
   // Whitespace around equals sign
   debug_inspect(
-    @toml.parse(
+    @toml.parse_renamed(
       (
         #|spaced   =   "value"  
       ),
@@
     #|# End comment
     #|
   debug_inspect(
-    @toml.parse(complex_whitespace),
+    @toml.parse_renamed(complex_whitespace),
     content=(
       #|TomlTable({ "key1": TomlString("value1"), "key2": TomlString("value2") })
     ),
@@
     #|]  
     #|
   debug_inspect(
-    try? @toml.parse(data3),
+    try? @toml.parse_renamed(data3),
     content=(
       #|Ok(TomlTable({ "x": TomlArray([TomlInteger(1), TomlInteger(2)]) }))
     ),
*** Update File: <WORKDIR>/coverage_improvement_comprehensive_test.mbt
@@
 /// Test EOF handling in parser - covered by creating empty token arrays
 test "parser_eof_handling" {
   // Test empty parse input to exercise EOF conditions
-  let result = @toml.parse(
+  let result = @toml.parse_renamed(
     (
       #|
     ),
@@
 /// Test integer keys in inline tables
 test "inline_table_with_integer_key" {
   let toml_input = "table = {123 = \"value\"}"
-  let result = @toml.parse(toml_input)
+  let result = @toml.parse_renamed(toml_input)
   debug_inspect(
     result,
     content=(
@@
 /// Test string keys in table paths
 test "table_path_with_string_key" {
   let toml_input = "[\"section\".\"subsection\"]\nkey = \"value\""
-  let result = @toml.parse(toml_input)
+  let result = @toml.parse_renamed(toml_input)
   debug_inspect(
     result,
     content=(
@@
 /// Test integer keys in table paths
 test "table_path_with_integer_key" {
   let toml_input = "[section.123]\nkey = \"value\""
-  let result = @toml.parse(toml_input)
+  let result = @toml.parse_renamed(toml_input)
   debug_inspect(
     result,
     content=(
@@
 /// Test string keys in array of tables paths
 test "array_of_tables_path_with_string_key" {
   let toml_input = "[[\"products\"]]\nname = \"Hammer\""
-  let result = @toml.parse(toml_input)
+  let result = @toml.parse_renamed(toml_input)
   debug_inspect(
     result,
     content=(
@@
 /// Test integer keys in array of tables paths
 test "array_of_tables_path_with_integer_key" {
   let toml_input = "[[section.123]]\nvalue = 42"
-  let result = @toml.parse(toml_input)
+  let result = @toml.parse_renamed(toml_input)
   debug_inspect(
     result,
     content=(
@@
 /// Test empty inline table
 test "empty_inline_table" {
   let toml_input = "table = {}"
-  let result = @toml.parse(toml_input)
+  let result = @toml.parse_renamed(toml_input)
   debug_inspect(
     result,
     content=(
@@
 /// Test empty array
 test "empty_array" {
   let toml_input = "arr = []"
-  let result = @toml.parse(toml_input)
+  let result = @toml.parse_renamed(toml_input)
   debug_inspect(
     result,
     content=(
@@
 /// Test float token parsing to ensure coverage
 test "float_token_parsing" {
   let toml_input = "pi = 3.14159"
-  let result = @toml.parse(toml_input)
+  let result = @toml.parse_renamed(toml_input)
   debug_inspect(
     result,
     content=(
@@
 /// Test array with trailing comma
 test "array_with_trailing_comma" {
   let toml_input = "numbers = [1, 2, 3,]"
-  let result = @toml.parse(toml_input)
+  let result = @toml.parse_renamed(toml_input)
   debug_inspect(
     result,
     content=(
@@
 
   // Test parsing like in main function
   let toml_input = "name = \"John Doe\"\nage = 30\nenabled = true"
-  let result1 = @toml.parse(toml_input)
+  let result1 = @toml.parse_renamed(toml_input)
   debug_inspect(result1.to_string().contains("John Doe"), content="true")
 
   // Test array parsing
   let toml_array = "numbers = [1, 2, 3, 4, 5]"
-  let result2 = @toml.parse(toml_array)
+  let result2 = @toml.parse_renamed(toml_array)
   debug_inspect(result2.to_string().contains("[1, 2, 3, 4, 5]"), content="true")
 
   // Test inline table parsing
   let toml_table = "person = {name = \"Alice\", age = 25}"
-  let result3 = @toml.parse(toml_table)
+  let result3 = @toml.parse_renamed(toml_table)
   debug_inspect(result3.to_string().contains("Alice"), content="true")
 }
 
@@
 /// Test binary number parsing via hex format
 test "hex_number_parsing_coverage" {
   let toml_input = "hex_num = 0xDEADBEEF"
-  let result = @toml.parse(toml_input)
+  let result = @toml.parse_renamed(toml_input)
   debug_inspect(
     result,
     content=(
@@
 /// Test octal number parsing
 test "octal_number_parsing_coverage" {
   let toml_input = "octal_num = 0o755"
-  let result = @toml.parse(toml_input)
+  let result = @toml.parse_renamed(toml_input)
   debug_inspect(
     result,
     content=(
@@
 /// Test binary number parsing
 test "binary_number_parsing_coverage" {
   let toml_input = "binary_num = 0b1010"
-  let result = @toml.parse(toml_input)
+  let result = @toml.parse_renamed(toml_input)
   debug_inspect(
     result,
     content=(
@@
 /// Test multiple array of tables to exercise array appending logic
 test "multiple_array_of_tables" {
   let toml_input = "[[products]]\nname = \"Hammer\"\n\n[[products]]\nname = \"Nail\""
-  let result = @toml.parse(toml_input)
+  let result = @toml.parse_renamed(toml_input)
   debug_inspect(
     result,
     content=(
@@
 /// Test negative number parsing
 test "negative_number_parsing" {
   let toml_input = "negative = -42"
-  let result = @toml.parse(toml_input)
+  let result = @toml.parse_renamed(toml_input)
   debug_inspect(
     result,
     content=(
@@
 /// Test multiline basic string with line ending backslash
 test "multiline_string_line_ending_backslash" {
   let toml_input = "multiline = \"\"\"\nLine 1 \\\n    Line 2\"\"\""
-  let result = @toml.parse(toml_input)
+  let result = @toml.parse_renamed(toml_input)
   guard result is TomlTable({ "multiline": TomlString(str), .. }) else {
     fail("Expected table with multiline string")
   }
*** Update File: <WORKDIR>/coverage_improvement_test.mbt
@@
     #|
   // This now successfully parses with nested tables support
   debug_inspect(
-    try? @toml.parse(complex_toml),
+    try? @toml.parse_renamed(complex_toml),
     content=(
       #|Ok(
       #|  TomlTable(
@@
     #|quote = "say \"hello\""
     #|
   debug_inspect(
-    try? @toml.parse(toml_with_escapes),
+    try? @toml.parse_renamed(toml_with_escapes),
     content=(
       #|Ok(
       #|  TomlTable(
@@
     #|key2 = "value2"
     #|
   debug_inspect(
-    try? @toml.parse(toml_with_whitespace),
+    try? @toml.parse_renamed(toml_with_whitespace),
     content=(
       #|Ok(TomlTable({ "key1": TomlString("value1"), "key2": TomlString("value2") }))
     ),
*** Update File: <WORKDIR>/e2e/e2e_test.mbt
@@
         continue
       }
     }
-    let parsed = try? @toml.parse(toml_content)
+    let parsed = try? @toml.parse_renamed(toml_content)
     match parsed {
       Err(e) => { (escaped)
         failures.push("[PARSE-ERROR] \{toml_path}: \{e}")
*** Update File: <WORKDIR>/e2e/known_failures_test.mbt
@@
 
 ///|
 test "fixed: [a-a-a] table header parses correctly" {
-  let result = try? @toml.parse("[a-a-a]\n_ = false\n")
+  let result = try? @toml.parse_renamed("[a-a-a]\n_ = false\n")
   debug_inspect(
     result,
     content=(
@@
 
 ///|
 test "fixed: leading underscore value rejected (not infinite loop)" {
-  let result = try? @toml.parse("x = _1.2\n")
+  let result = try? @toml.parse_renamed("x = _1.2\n")
   debug_inspect(
     result,
     content=(
@@
 
 ///|
 test "fixed: positive prefix '+' tokenized for integers" {
-  let result = try? @toml.parse("pos = +99\n")
+  let result = try? @toml.parse_renamed("pos = +99\n")
   debug_inspect(
     result,
     content=(
@@
 
 ///|
 test "fixed: positive prefix '+' tokenized for floats" {
-  let result = try? @toml.parse("pos = +1.0\n")
+  let result = try? @toml.parse_renamed("pos = +1.0\n")
   debug_inspect(
     result,
     content=(
@@
 
 ///|
 test "fixed: CRLF line ending handled" {
-  let result = try? @toml.parse("key = \"val\"\r\n")
+  let result = try? @toml.parse_renamed("key = \"val\"\r\n")
   debug_inspect(
     result,
     content=(
@@
 
 ///|
 test "fixed: datetime with space separator" {
-  let result = try? @toml.parse("dt = 1987-07-05 17:45:00Z\n")
+  let result = try? @toml.parse_renamed("dt = 1987-07-05 17:45:00Z\n")
   debug_inspect(
     result,
     content=(
@@
 
 ///|
 test "fixed: numeric key leading zeros preserved" {
-  let result = try? @toml.parse("0123 = true\n")
+  let result = try? @toml.parse_renamed("0123 = true\n")
   debug_inspect(
     result,
     content=(
@@
     #|
     #|  fox jumps over the lazy dog."""
     #|
-  let result = try? @toml.parse(input)
+  let result = try? @toml.parse_renamed(input)
   debug_inspect(
     result,
     content=(
@@
 
 ///|
 test "fixed: hex escape \\xHH" {
-  let result = try? @toml.parse("esc = \"\\x41\"\n")
+  let result = try? @toml.parse_renamed("esc = \"\\x41\"\n")
   debug_inspect(
     result,
     content=(
@@
 
 ///|
 test "fixed: escape \\e (ESC)" {
-  let result = try? @toml.parse("esc = \"\\e\"\n")
+  let result = try? @toml.parse_renamed("esc = \"\\e\"\n")
   debug_inspect(
     result,
     content=(
@@
     #|[[fruits]]
     #|name = "banana"
     #|
-  let _ = try? @toml.parse(input)
+  let _ = try? @toml.parse_renamed(input)
   // Should parse without error
 }
 
@@
 
 ///|
 test "fixed: keyword as table name" {
-  let result = try? @toml.parse("[true]\nx = 1\n")
+  let result = try? @toml.parse_renamed("[true]\nx = 1\n")
   debug_inspect(
     result,
     content=(
@@
     #|  b = 2
     #|}
     #|
-  let _ = try? @toml.parse(input)
+  let _ = try? @toml.parse_renamed(input)
 }
 
 // ============================================================
@@
 ///|
 #skip
 test "bug: datetime millisecond trailing zeros" {
-  let result = try? @toml.parse("dt = 1987-07-05T17:45:56.600Z\n")
+  let result = try? @toml.parse_renamed("dt = 1987-07-05T17:45:56.600Z\n")
   // Should preserve .600, not truncate to .6
   debug_inspect(result, content="")
 }
@@
   let input =
     #|str = """Here are two quotes: "". Cool."""
     #|
-  let result = try? @toml.parse(input)
+  let result = try? @toml.parse_renamed(input)
   debug_inspect(
     result,
     content=(
@@
 
 ///|
 test "fixed: dashed bare key starting with dash" {
-  let result = try? @toml.parse("-key = 1\n")
+  let result = try? @toml.parse_renamed("-key = 1\n")
   debug_inspect(
     result,
     content=(
*** Update File: <WORKDIR>/e2e/runner.mbt
@@
   let expected : Json = @json.parse(expected_json_str) catch {
     e => return Some("\\{toml_path}: failed to parse expected JSON: \\{e}") (escaped)
   }
-  let parsed = try? @toml.parse(toml_content)
+  let parsed = try? @toml.parse_renamed(toml_content)
   match parsed {
     Err(e) => Some("[PARSE-ERROR] \\{toml_path}: \\{e}") (escaped)
     Ok(value) => { (escaped)
@@
     // Non-UTF-8 file: parser would reject this, count as pass
     _ => return None (escaped)
   }
-  let parsed = try? @toml.parse(toml_content)
+  let parsed = try? @toml.parse_renamed(toml_content)
   match parsed {
     Ok(_) => Some("[PASS-BUT-SHOULD-FAIL] \\{toml_path}") (escaped)
     Err(_) => None (escaped)
*** Update File: <WORKDIR>/internal/qc_model/roundtrip_test.mbt
@@
   doc : @qc_model.SimpleDocument,
   rendered : String,
 ) -> Result[Unit, String] {
-  try @toml.parse(rendered) catch {
+  try @toml.parse_renamed(rendered) catch {
     error => (escaped)
       Err(
         "parser rejected generated TOML\nrendered:\n\{rendered}\nerror:\n\{error}",
*** Update File: <WORKDIR>/official_toml_test_suite_test.mbt
@@
     #|basic = "value"
     #|
   debug_inspect(
-    @toml.parse(basic_string_toml),
+    @toml.parse_renamed(basic_string_toml),
     content=(
       #|TomlTable({ "basic": TomlString("value") })
     ),
@@
     #|escaped = "I'm a string. \"You can quote me\". Name\tJosé\nLocation\tSF."
     #|
   debug_inspect(
-    @toml.parse(escaped_string_toml),
+    @toml.parse_renamed(escaped_string_toml),
     content=(
       #|TomlTable({ "escaped": TomlString("I'm a string. \"You can quote me\". Name\tJosé\nLocation\tSF.") })
     ),
@@
     #|zero = 0
     #|
   debug_inspect(
-    @toml.parse(integer_toml),
+    @toml.parse_renamed(integer_toml),
     content=(
       #|TomlTable(
       #|  {
@@
     #|positive = 5.0
     #|
   debug_inspect(
-    @toml.parse(float_toml),
+    @toml.parse_renamed(float_toml),
     content=(
       #|TomlTable(
       #|  {
@@
     #|disabled = false
     #|
   debug_inspect(
-    @toml.parse(boolean_toml),
+    @toml.parse_renamed(boolean_toml),
     content=(
       #|TomlTable({ "enabled": TomlBoolean(true), "disabled": TomlBoolean(false) })
     ),
@@
     #|floats = [1.1, 2.2, 3.3]
     #|
   debug_inspect(
-    @toml.parse(array_toml),
+    @toml.parse_renamed(array_toml),
     content=(
       #|TomlTable(
       #|  {
@@
     #|nested = [[1, 2], [3, 4, 5]]
     #|
   debug_inspect(
-    @toml.parse(nested_array_toml),
+    @toml.parse_renamed(nested_array_toml),
     content=(
       #|TomlTable(
       #|  {
@@
     #|empty = []
     #|
   debug_inspect(
-    @toml.parse(empty_array_toml),
+    @toml.parse_renamed(empty_array_toml),
     content=(
       #|TomlTable({ "empty": TomlArray([]) })
     ),
@@
     #|empty = {}
     #|
   debug_inspect(
-    @toml.parse(inline_table_toml),
+    @toml.parse_renamed(inline_table_toml),
     content=(
       #|TomlTable(
       #|  {
@@
     #|tags = ["production", "web"]
     #|
   debug_inspect(
-    @toml.parse(complex_toml),
+    @toml.parse_renamed(complex_toml),
     content=(
       #|TomlTable(
       #|  {
@@
     #|organization = "GitHub"
     #|
   debug_inspect(
-    @toml.parse(table_toml),
+    @toml.parse_renamed(table_toml),
     content=(
       #|TomlTable(
       #|  {
@@
     #|dc = "eqdc10"
     #|
   debug_inspect(
-    @toml.parse(nested_table_toml),
+    @toml.parse_renamed(nested_table_toml),
     content=(
       #|TomlTable(
       #|  {
@@
     #|sku = 284758393
     #|
   debug_inspect(
-    @toml.parse(array_of_tables_toml),
+    @toml.parse_renamed(array_of_tables_toml),
     content=(
       #|TomlTable(
       #|  {
@@
     #|shape = "banana"
     #|
   debug_inspect(
-    @toml.parse(nested_array_toml),
+    @toml.parse_renamed(nested_array_toml),
     content=(
       #|TomlTable(
       #|  {
@@
     #|port = 5432
     #|
   debug_inspect(
-    @toml.parse(mixed_toml),
+    @toml.parse_renamed(mixed_toml),
     content=(
       #|TomlTable(
       #|  {
@@
     #|local_datetime = 1979-05-27T07:32:00
     #|
   debug_inspect(
-    @toml.parse(datetime_toml),
+    @toml.parse_renamed(datetime_toml),
     content=(
       #|TomlTable(
       #|  {
@@
     #|Violets are blue"""
     #|
   debug_inspect(
-    @toml.parse(multiline_basic_toml),
+    @toml.parse_renamed(multiline_basic_toml),
     content=(
       #|TomlTable({ "str1": TomlString("Roses are red\nViolets are blue") })
     ),
@@
     #|regex = '<\i\c*\s*>'
     #|
   debug_inspect(
-    @toml.parse(literal_string_toml),
+    @toml.parse_renamed(literal_string_toml),
     content=(
       #|TomlTable(
       #|  {
@@
     #|'''
     #|
   debug_inspect(
-    @toml.parse(multiline_literal_toml),
+    @toml.parse_renamed(multiline_literal_toml),
     content=(
       #|TomlTable(
       #|  {
@@
     #|another = "# This is not a comment"
     #|
   debug_inspect(
-    @toml.parse(comments_toml),
+    @toml.parse_renamed(comments_toml),
     content=(
       #|TomlTable(
       #|  {
@@
     #|bin1 = 0b11010110
     #|
   debug_inspect(
-    @toml.parse(integer_formats_toml),
+    @toml.parse_renamed(integer_formats_toml),
     content=(
       #|TomlTable(
       #|  {
@@
     #|
   // FIXME: json.inspect get null
   debug_inspect(
-    @toml.parse(float_special_toml),
+    @toml.parse_renamed(float_special_toml),
     content=(
       #|TomlTable(
       #|  {
@@
     #|key2 = "value2"
     #|
   debug_inspect(
-    @toml.parse(comment_test),
+    @toml.parse_renamed(comment_test),
     content=(
       #|TomlTable({ "key1": TomlString("value1"), "key2": TomlString("value2") })
     ),
@@
     #|neg_nan = -nan
     #|
   debug_inspect(
-    @toml.parse(valid_inf_toml),
+    @toml.parse_renamed(valid_inf_toml),
     content=(
       #|TomlTable(
       #|  {
@@
     #|key4="value4"
     #|
   debug_inspect(
-    @toml.parse(whitespace_toml),
+    @toml.parse_renamed(whitespace_toml),
     content=(
       #|TomlTable(
       #|  {
@@
     #|array2 = [1, 2, 3,]
     #|
   debug_inspect(
-    @toml.parse(array_formatting_toml),
+    @toml.parse_renamed(array_formatting_toml),
     content=(
       #|TomlTable(
       #|  {
*** Update File: <WORKDIR>/parser.mbt
@@
 /// On any lexical or syntactic error, `parse` raises with a message
 /// containing the source location. Wrap the call in `try?` to receive a
 /// `Result[TomlValue, Error]` instead.
-pub fn parse(input : String) -> TomlValue raise {
+pub fn parse_renamed(input : String) -> TomlValue raise {
   let tokens = @tokenize.tokenize(input)
   let parser = Parser::new(tokens)
   let main_table = {}
*** Update File: <WORKDIR>/parser_test.mbt
@@
 ///|
 /// Tests for the TOML parser
 test "parse simple key-value string" {
-  let result = @toml.parse(
+  let result = @toml.parse_renamed(
     (
       #|name = "John"
     ),
@@
 
 ///|
 test "parse simple key-value integer" {
-  let result = @toml.parse(
+  let result = @toml.parse_renamed(
     (
       #|age = 25
     ),
@@
 
 ///|
 test "parse simple key-value boolean" {
-  let result = @toml.parse(
+  let result = @toml.parse_renamed(
     (
       #|enabled = true
     ),
@@
 
 ///|
 test "parse simple key-value float" {
-  let result = @toml.parse(
+  let result = @toml.parse_renamed(
     (
       #|pi = 3.14
     ),
@@
     #|age = 30
     #|enabled = false
     #|
-  let result = @toml.parse(multiple_kvp_toml)
+  let result = @toml.parse_renamed(multiple_kvp_toml)
   debug_inspect(
     result,
     content=(
@@
 
 ///|
 test "parse array" {
-  let result = @toml.parse(
+  let result = @toml.parse_renamed(
     (
       #|numbers = [1, 2, 3]
     ),
@@
 
 ///|
 test "parse array ending with exponent float" {
-  let result = try? @toml.parse(
+  let result = try? @toml.parse_renamed(
     (
       #|numbers = [-1e2]
     ),
@@
   let inline_table_toml =
     #|person = {name = "Bob", age = 25}
     #|
-  let result = @toml.parse(inline_table_toml)
+  let result = @toml.parse_renamed(inline_table_toml)
   debug_inspect(
     result,
     content=(
@@
 ///|
 test "test parser EOF handling in peek" {
   debug_inspect(
-    try? @toml.parse(""),
+    try? @toml.parse_renamed(""),
     content=(
       #|Ok(TomlTable({}))
     ),
@@
 ///|
 test "test inline table with string keys" {
   debug_inspect(
-    try? @toml.parse("table = {\"string key\" = \"value\"}"),
+    try? @toml.parse_renamed("table = {\"string key\" = \"value\"}"),
     content=(
       #|Ok(TomlTable({ "table": TomlTable({ "string key": TomlString("value") }) }))
     ),
@@
     #|key = "value"
     #|
   debug_inspect(
-    try? @toml.parse(string_table_name_toml),
+    try? @toml.parse_renamed(string_table_name_toml),
     content=(
       #|Ok(TomlTable({ "table name": TomlTable({ "key": TomlString("value") }) }))
     ),
@@
     #|key = "value"
     #|
   debug_inspect(
-    try? @toml.parse(numeric_table_name_toml),
+    try? @toml.parse_renamed(numeric_table_name_toml),
     content=(
       #|Ok(TomlTable({ "123": TomlTable({ "key": TomlString("value") }) }))
     ),
@@
     #|-10e-1 = "d"
     #|
   debug_inspect(
-    try? @toml.parse(exponent_like_keys_toml),
+    try? @toml.parse_renamed(exponent_like_keys_toml),
     content=(
       #|Ok(
       #|  TomlTable(
@@
     #|value = "d"
     #|
   debug_inspect(
-    try? @toml.parse(exponent_like_table_names_toml),
+    try? @toml.parse_renamed(exponent_like_table_names_toml),
     content=(
       #|Ok(
       #|  TomlTable(
@@
 test "overflow float accepted as bare key" {
   // The same overflow token is valid as a bare key (all chars are A-Za-z0-9_-)
   debug_inspect(
-    try? @toml.parse("-31e368 = \"ok\"\n"),
+    try? @toml.parse_renamed("-31e368 = \"ok\"\n"),
     content=(
       #|Ok(TomlTable({ "-31e368": TomlString("ok") }))
     ),
@@
 test "special float keywords as keys" {
   // inf, nan, +inf, -inf, etc. are valid bare keys in TOML
   debug_inspect(
-    try? @toml.parse("+inf = 1\n"),
+    try? @toml.parse_renamed("+inf = 1\n"),
     content=(
       #|Ok(TomlTable({ "+inf": TomlInteger(1) }))
     ),
   )
   debug_inspect(
-    try? @toml.parse("-inf = 2\n"),
+    try? @toml.parse_renamed("-inf = 2\n"),
     content=(
       #|Ok(TomlTable({ "-inf": TomlInteger(2) }))
     ),
   )
   debug_inspect(
-    try? @toml.parse("nan = 3\n"),
+    try? @toml.parse_renamed("nan = 3\n"),
     content=(
       #|Ok(TomlTable({ "nan": TomlInteger(3) }))
     ),
@@
 test "dotted key with float-like segments" {
   // Float token with dot in raw string should split into dotted keys
   debug_inspect(
-    try? @toml.parse("1.2 = \"a\"\n"),
+    try? @toml.parse_renamed("1.2 = \"a\"\n"),
     content=(
       #|Ok(TomlTable({ "1": TomlTable({ "2": TomlString("a") }) }))
     ),
@@
   )
   // Float-like key followed by dotted sub-key
   debug_inspect(
-    try? @toml.parse("[-80e-2.sub]\nval = 1\n"),
+    try? @toml.parse_renamed("[-80e-2.sub]\nval = 1\n"),
     content=(
       #|Ok(TomlTable({ "-80e-2": TomlTable({ "sub": TomlTable({ "val": TomlInteger(1) }) }) }))
     ),
@@
 /// Tests for inline table edge cases  
 test "test empty inline table" {
   debug_inspect(
-    try? @toml.parse("empty = {}"),
+    try? @toml.parse_renamed("empty = {}"),
     content=(
       #|Ok(TomlTable({ "empty": TomlTable({}) }))
     ),
@@
 ///|
 test "test nested inline tables" {
   debug_inspect(
-    try? @toml.parse("table = {inner = {key = \"value\"}}"),
+    try? @toml.parse_renamed("table = {inner = {key = \"value\"}}"),
     content=(
       #|Ok(TomlTable({ "table": TomlTable({ "inner": TomlTable({ "key": TomlString("value") }) }) }))
     ),
@@
 ///|
 test "test inline table with multiple key types" {
   debug_inspect(
-    try? @toml.parse("mixed = {\"quoted\" = 1, unquoted = 2}"),
+    try? @toml.parse_renamed("mixed = {\"quoted\" = 1, unquoted = 2}"),
     content=(
       #|Ok(TomlTable({ "mixed": TomlTable({ "quoted": TomlInteger(1), "unquoted": TomlInteger(2) }) }))
     ),
@@
 ///|
 test "test inline table with array values" {
   debug_inspect(
-    try? @toml.parse("table = {arr = [1, 2, 3], str = \"test\"}"),
+    try? @toml.parse_renamed("table = {arr = [1, 2, 3], str = \"test\"}"),
     content=(
       #|Ok(
       #|  TomlTable(
@@
 ///|
 /// Test dotted key notation - simple case
 test "dotted key notation simple" {
-  let result = @toml.parse(
+  let result = @toml.parse_renamed(
     (
       #|a.b.c = "value"
     ),
@@
     #|f = "value4"
     #|
   debug_inspect(
-    @toml.parse(dotted_multiple_toml),
+    @toml.parse_renamed(dotted_multiple_toml),
     content=(
       #|TomlTable(
       #|  {
@@
     #|server.tags = ["web", "api"]
     #|
   debug_inspect(
-    @toml.parse(dotted_types_toml),
+    @toml.parse_renamed(dotted_types_toml),
     content=(
       #|TomlTable(
       #|  {
@@
 ///|
 /// Test dotted key notation - quoted keys
 test "dotted key notation quoted keys" {
-  let result = @toml.parse(
+  let result = @toml.parse_renamed(
     (
       #|"first.part"."second.part" = "value"
     ),
@@
 ///|
 /// Test dotted key notation - integer keys
 test "dotted key notation integer keys" {
-  let result = @toml.parse(
+  let result = @toml.parse_renamed(
     (
       #|1.2.3 = "numeric path"
     ),
@@
     #|c = "table"
     #|
   debug_inspect(
-    @toml.parse(conflict_toml),
+    @toml.parse_renamed(conflict_toml),
     content=(
       #|TomlTable({ "a": TomlTable({ "b": TomlString("dotted"), "c": TomlString("table") }) })
     ),
@@
 ///|
 /// Test dotted key notation - deep nesting
 test "dotted key notation deep nesting" {
-  let result = @toml.parse(
+  let result = @toml.parse_renamed(
     (
       #|a.b.c.d.e.f = "deep"
     ),
@@
     #|server."port number".8080.config = 3
     #|
   // TODO: fix
-  debug_inspect(try? @toml.parse(data), content="")
+  debug_inspect(try? @toml.parse_renamed(data), content="")
 }
*** Update File: <WORKDIR>/test_utils_test.mbt
@@
 ///|
 fn parse_expect_to_fail(input : String) -> String {
-  try @toml.parse(input) catch {
+  try @toml.parse_renamed(input) catch {
     e => { (escaped)
       let s = e.to_string()
       // e.to_string() gives: Failure("...FAILED: actual_message")
*** Update File: <WORKDIR>/toml_to_string_test.mbt
@@
     #|debug = true
     #|max_connections = 100
     #|
-  let parsed = @toml.parse(toml)
+  let parsed = @toml.parse_renamed(toml)
-  let roundtripped = @toml.parse(parsed.to_string())
+  let roundtripped = @toml.parse_renamed(parsed.to_string())
   assert_eq(parsed, roundtripped)
 }
 
@@
     #|user = "admin"
     #|password = "secret"
     #|
-  let parsed = @toml.parse(toml)
+  let parsed = @toml.parse_renamed(toml)
-  let roundtripped = @toml.parse(parsed.to_string())
+  let roundtripped = @toml.parse_renamed(parsed.to_string())
   assert_eq(parsed, roundtripped)
 }
 
@@
     #|name = "Nail"
     #|sku = 284758393
     #|
-  let parsed = @toml.parse(toml)
+  let parsed = @toml.parse_renamed(toml)
-  let roundtripped = @toml.parse(parsed.to_string())
+  let roundtripped = @toml.parse_renamed(parsed.to_string())
   assert_eq(parsed, roundtripped)
 }
 
@@
     #|local_date = 2023-01-15
     #|local_time = 10:30:00
     #|
-  let parsed = @toml.parse(toml)
+  let parsed = @toml.parse_renamed(toml)
-  let roundtripped = @toml.parse(parsed.to_string())
+  let roundtripped = @toml.parse_renamed(parsed.to_string())
   assert_eq(parsed, roundtripped)
 }
 
@@
     #|strings = ["hello", "world"]
     #|nested = [[1, 2], [3, 4]]
     #|
-  let parsed = @toml.parse(toml)
+  let parsed = @toml.parse_renamed(toml)
-  let roundtripped = @toml.parse(parsed.to_string())
+  let roundtripped = @toml.parse_renamed(parsed.to_string())
   assert_eq(parsed, roundtripped)
 }
 
@@
     #|nan_val = nan
     #|pi = 3.14
     #|
-  let parsed = @toml.parse(toml)
+  let parsed = @toml.parse_renamed(toml)
   // NaN != NaN, so compare non-NaN values and check NaN separately
   let serialized = parsed.to_string()
-  let roundtripped = @toml.parse(serialized)
+  let roundtripped = @toml.parse_renamed(serialized)
   // Check that the serialized form re-parses correctly
   inspect(
     serialized,
@@
     #|name = "beta"
     #|ip = "10.0.0.2"
     #|
-  let parsed = @toml.parse(toml)
+  let parsed = @toml.parse_renamed(toml)
-  let roundtripped = @toml.parse(parsed.to_string())
+  let roundtripped = @toml.parse_renamed(parsed.to_string())
   assert_eq(parsed, roundtripped)
 }
 
@@
   let toml =
     #|escaped = "hello\nworld\ttab\\backslash\"quote"
     #|
-  let parsed = @toml.parse(toml)
+  let parsed = @toml.parse_renamed(toml)
-  let roundtripped = @toml.parse(parsed.to_string())
+  let roundtripped = @toml.parse_renamed(parsed.to_string())
   assert_eq(parsed, roundtripped)
 }
 
@@
     ),
   )
   // Verify roundtrip
-  let roundtripped = @toml.parse(value.to_string())
+  let roundtripped = @toml.parse_renamed(value.to_string())
   assert_eq(value, roundtripped)
 }
*** End Patch

```

```mooncram
$ run_moon_ide moon ide rename 'TestResult' 'TestResultRenamed' --loc 'e2e/runner.mbt:7:12'
*** Begin Patch
*** Update File: <WORKDIR>/e2e/runner.mbt
@@
 /// `failures` carries one entry per failing case (typically including the
 /// fixture path and a short reason) so that the test harness can print a
 /// summary at the end without re-walking the corpus.
-pub struct TestResult {
+pub struct TestResultRenamed {
   passed : Int
   failed : Int
   failures : Array[String]
@@
 
 ///|
 /// Create an empty `TestResult` with zero counts and no failures recorded.
-pub fn TestResult::new() -> TestResult {
+pub fn TestResultRenamed::new() -> TestResultRenamed {
   { passed: 0, failed: 0, failures: [] }
 }
 
*** End Patch

```

```mooncram
$ run_moon_ide moon ide rename 'new' 'new_renamed' --loc 'e2e/runner.mbt:15:20'
*** Begin Patch
*** Update File: <WORKDIR>/e2e/runner.mbt
@@
 
 ///|
 /// Create an empty `TestResult` with zero counts and no failures recorded.
-pub fn TestResult::new() -> TestResult {
+pub fn TestResult::new_renamed() -> TestResult {
   { passed: 0, failed: 0, failures: [] }
 }
 
*** End Patch

```

```mooncram
$ run_moon_ide moon ide rename 'collect_toml_files' 'collect_toml_files_renamed' --loc 'e2e/runner.mbt:21:8'
*** Begin Patch
*** Update File: <WORKDIR>/e2e/e2e_test.mbt
@@
 ///|
 async test "valid toml-test suite" {
   let files : Array[String] = []
-  @e2e.collect_toml_files("e2e/testdata/valid", files)
+  @e2e.collect_toml_files_renamed("e2e/testdata/valid", files)
   files.sort()
   let mut passed = 0
   let mut failed = 0
@@
 ///|
 async test "invalid toml-test suite" {
   let files : Array[String] = []
-  @e2e.collect_toml_files("e2e/testdata/invalid", files)
+  @e2e.collect_toml_files_renamed("e2e/testdata/invalid", files)
   files.sort()
   let mut passed = 0
   let mut failed = 0
*** Update File: <WORKDIR>/e2e/runner.mbt
@@
 
 ///|
 /// Recursively collect all .toml files in a directory.
-pub fn collect_toml_files(
+pub fn collect_toml_files_renamed(
   dir : String,
   files : Array[String],
 ) -> Unit raise @fs.IOError {
@@
   for entry in entries {
     let path = "\{dir}/\{entry}"
     if @fs.is_dir(path) {
-      collect_toml_files(path, files)
+      collect_toml_files_renamed(path, files)
     } else if entry.has_suffix(".toml") {
       files.push(path)
     }
*** End Patch

```

```mooncram
$ run_moon_ide moon ide rename 'run_single_valid_test' 'run_single_valid_test_renamed' --loc 'e2e/runner.mbt:39:8'
*** Begin Patch
*** Update File: <WORKDIR>/e2e/runner.mbt
@@
 ///|
 /// Run a single valid test: parse .toml, convert to test JSON, compare with .json.
 /// Returns None on success, Some(error_message) on failure.
-pub fn run_single_valid_test(toml_path : String) -> String? raise @fs.IOError {
+pub fn run_single_valid_test_renamed(toml_path : String) -> String? raise @fs.IOError {
   let json_path = "\{toml_path[:toml_path.length() - 5]}.json"
   if !@fs.path_exists(json_path) {
     return None
*** End Patch

```

```mooncram
$ run_moon_ide moon ide rename 'run_single_invalid_test' 'run_single_invalid_test_renamed' --loc 'e2e/runner.mbt:68:8'
*** Begin Patch
*** Update File: <WORKDIR>/e2e/e2e_test.mbt
@@
   let mut failed = 0
   let failures : Array[String] = []
   for toml_path in files {
-    match @e2e.run_single_invalid_test(toml_path) {
+    match @e2e.run_single_invalid_test_renamed(toml_path) {
       None => passed += 1 (escaped)
       Some(msg) => { (escaped)
         failures.push(msg)
*** Update File: <WORKDIR>/e2e/runner.mbt
@@
 ///|
 /// Run a single invalid test: parse .toml and expect failure.
 /// Returns None on success (parse failed as expected), Some(error) if parse succeeded.
-pub fn run_single_invalid_test(toml_path : String) -> String? raise @fs.IOError {
+pub fn run_single_invalid_test_renamed(toml_path : String) -> String? raise @fs.IOError {
   let toml_bytes = @fs.read_file_to_bytes(toml_path)
   // Try decoding as UTF-8, skip non-UTF-8 files (they should fail anyway)
   let toml_content = @utf8.decode(toml_bytes) catch {
*** End Patch

```

```mooncram
$ run_moon_ide moon ide rename 'json_equal' 'json_equal_renamed' --loc 'e2e/runner.mbt:84:8'
*** Begin Patch
*** Update File: <WORKDIR>/e2e/e2e_test.mbt
@@
       }
       Ok(value) => { (escaped)
         let actual = @e2e.to_test_json(value)
-        if !@e2e.json_equal(actual, expected) {
+        if !@e2e.json_equal_renamed(actual, expected) {
           failures.push(
             "[MISMATCH] \{toml_path}\n    expected: \{expected.stringify()}\n    actual:   \{actual.stringify()}",
           )
*** Update File: <WORKDIR>/e2e/runner.mbt
@@
     Err(e) => Some("[PARSE-ERROR] \\{toml_path}: \\{e}") (escaped)
     Ok(value) => { (escaped)
       let actual = to_test_json(value)
-      if !json_equal(actual, expected) {
+      if !json_equal_renamed(actual, expected) {
         Some(
           "[MISMATCH] \{toml_path}\n    expected: \{expected.stringify()}\n    actual:   \{actual.stringify()}",
         )
@@
 
 ///|
 /// Compare two JSON values for equality.
-pub fn json_equal(a : Json, b : Json) -> Bool {
+pub fn json_equal_renamed(a : Json, b : Json) -> Bool {
   match (a, b) {
     (Object(ma), Object(mb)) => { (escaped)
       if ma.length() != mb.length() {
@@
         return datetime_values_equal(ma, mb)
       }
       for k, va in ma {
-        guard mb.get(k) is Some(vb) && json_equal(va, vb) else { return false }
+        guard mb.get(k) is Some(vb) && json_equal_renamed(va, vb) else { return false }
       }
       true
     }
@@
         return false
       }
       for i, va in aa {
-        if !json_equal(va, ab[i]) {
+        if !json_equal_renamed(va, ab[i]) {
           return false
         }
       }
*** End Patch

```
