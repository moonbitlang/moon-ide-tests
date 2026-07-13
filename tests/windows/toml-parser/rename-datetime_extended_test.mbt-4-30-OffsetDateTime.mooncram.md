# toml-parser rename OffsetDateTime datetime_extended_test.mbt:4:30

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\toml-parser' moon ide rename 'OffsetDateTime' 'OffsetDateTimeRenamed' --loc 'datetime_extended_test.mbt:4:30'
*** Begin Patch
*** Update File: <WORKDIR>/coverage_improvement_comprehensive_test.mbt
@@
   debug_inspect(float_str.contains("3.14"), content="true")
 
   // Test datetime to_string variants
-  let offset_dt = @toml.TomlDateTime(OffsetDateTime("2023-05-15T10:30:00Z"))
+  let offset_dt = @toml.TomlDateTime(OffsetDateTimeRenamed("2023-05-15T10:30:00Z"))
   let offset_str = offset_dt.to_string()
   debug_inspect(
     offset_str,
*** Update File: <WORKDIR>/datetime\datetime.mbt
@@
 /// the spelling supplied in the TOML source; it does not normalize or
 /// validate the underlying calendar arithmetic.
 pub(all) enum TomlDateTime {
-  OffsetDateTime(String)
+  OffsetDateTimeRenamed(String)
   LocalDateTime(String)
   LocalDate(String)
   LocalTime(String)
@@
 /// `OffsetDateTime("1979-05-27T07:32:00Z")` etc.
 pub impl Show for TomlDateTime with fn output(self, logger) {
   match self {
-    OffsetDateTime(s) =>
+    OffsetDateTimeRenamed(s) =>
       logger <+
         $|OffsetDateTime("\{s}")
     LocalDateTime(s) =>
*** Update File: <WORKDIR>/datetime_extended_test.mbt
@@
 ///|
 /// Extended datetime tests for improved coverage
 test "test TomlDateTime types and equality" {
-  let offset_dt1 = @datetime.OffsetDateTime("1979-05-27T07:32:00Z")
+  let offset_dt1 = @datetime.OffsetDateTimeRenamed("1979-05-27T07:32:00Z")
-  let offset_dt2 = @datetime.OffsetDateTime("1979-05-27T07:32:00Z")
+  let offset_dt2 = @datetime.OffsetDateTimeRenamed("1979-05-27T07:32:00Z")
-  let offset_dt3 = @datetime.OffsetDateTime("1980-05-27T07:32:00Z")
+  let offset_dt3 = @datetime.OffsetDateTimeRenamed("1980-05-27T07:32:00Z")
   debug_inspect(offset_dt1 == offset_dt2, content="true")
   debug_inspect(offset_dt1 == offset_dt3, content="false")
   let local_dt = @datetime.LocalDateTime("1979-05-27T07:32:00")
@@
 
 ///|
 test "test datetime token debug representation" {
-  let offset_dt = @datetime.OffsetDateTime("1979-05-27T07:32:00+01:00")
+  let offset_dt = @datetime.OffsetDateTimeRenamed("1979-05-27T07:32:00+01:00")
   let token = @tokenize.DateTimeToken(offset_dt, loc=@tokenize.default_loc())
 
   // Test that datetime token has a debug representation
@@
   let local_dt = @datetime.LocalDateTime("1979-05-27T07:32:00")
   let local_date = @datetime.LocalDate("1979-05-27")
   let local_time = @datetime.LocalTime("07:32:00")
-  let offset_dt_z = @datetime.OffsetDateTime("1979-05-27T07:32:00Z")
+  let offset_dt_z = @datetime.OffsetDateTimeRenamed("1979-05-27T07:32:00Z")
-  let offset_dt_plus = @datetime.OffsetDateTime("1979-05-27T07:32:00+01:00")
+  let offset_dt_plus = @datetime.OffsetDateTimeRenamed("1979-05-27T07:32:00+01:00")
 
   // Test Show implementation
   debug_inspect(local_dt.to_string().contains("LocalDateTime"), content="true")
@@
 
 ///|
 test "test datetime token creation and usage" {
-  let dt = @datetime.OffsetDateTime("2023-12-25T00:00:00Z")
+  let dt = @datetime.OffsetDateTimeRenamed("2023-12-25T00:00:00Z")
   let loc = @tokenize.default_loc()
   let token = @tokenize.DateTimeToken(dt, loc~)
 
   // Test token equality
   let same_token = @tokenize.DateTimeToken(
-    OffsetDateTime("2023-12-25T00:00:00Z"),
+    OffsetDateTimeRenamed("2023-12-25T00:00:00Z"),
     loc~,
   )
   let diff_token = @tokenize.DateTimeToken(
-    OffsetDateTime("2023-12-26T00:00:00Z"),
+    OffsetDateTimeRenamed("2023-12-26T00:00:00Z"),
     loc~,
   )
   debug_inspect(token == same_token, content="true")
*** Update File: <WORKDIR>/datetime_test.mbt
@@
 /// Test TOML 1.0 spec examples for Offset Date-Time
 test "toml spec offset datetime examples" {
   // RFC 3339 examples from TOML spec
-  let odt1 = @toml.TomlDateTime(OffsetDateTime("1979-05-27T07:32:00Z"))
+  let odt1 = @toml.TomlDateTime(OffsetDateTimeRenamed("1979-05-27T07:32:00Z"))
   debug_inspect(
     odt1.to_string(),
     content=(
@@
       #|"1979-05-27T07:32:00Z"
     ),
   )
-  let odt2 = @toml.TomlDateTime(OffsetDateTime("1979-05-27T00:32:00-07:00"))
+  let odt2 = @toml.TomlDateTime(OffsetDateTimeRenamed("1979-05-27T00:32:00-07:00"))
   debug_inspect(
     odt2.to_string(),
     content=(
@@
     ),
   )
   let odt3 = @toml.TomlDateTime(
-    OffsetDateTime("1979-05-27T00:32:00.999999-07:00"),
+    OffsetDateTimeRenamed("1979-05-27T00:32:00.999999-07:00"),
   )
   debug_inspect(
     odt3.to_string(),
@@
 test "datetime arrays validation" {
   // Array of same datetime type (should be valid in TOML)
   let offset_array = [
-    @toml.TomlDateTime(OffsetDateTime("2023-01-01T00:00:00Z")),
+    @toml.TomlDateTime(OffsetDateTimeRenamed("2023-01-01T00:00:00Z")),
-    TomlDateTime(OffsetDateTime("2023-01-02T00:00:00Z")),
+    TomlDateTime(OffsetDateTimeRenamed("2023-01-02T00:00:00Z")),
-    TomlDateTime(OffsetDateTime("2023-01-03T00:00:00Z")),
+    TomlDateTime(OffsetDateTimeRenamed("2023-01-03T00:00:00Z")),
   ]
   let offset_arr_value = @toml.TomlArray(offset_array)
   let offset_str = offset_arr_value.to_string()
@@
   let session1 : Map[String, @toml.TomlValue] = Map([])
   session1["title"] = TomlString("Opening Keynote")
   session1["scheduled_at"] = TomlDateTime(
-    OffsetDateTime("2023-06-15T09:00:00+00:00"),
+    OffsetDateTimeRenamed("2023-06-15T09:00:00+00:00"),
   )
   sessions.push(@toml.TomlTable(session1))
   let session2 : Map[String, @toml.TomlValue] = Map([])
   session2["title"] = TomlString("Technical Workshop")
   session2["scheduled_at"] = TomlDateTime(
-    OffsetDateTime("2023-06-15T14:00:00+00:00"),
+    OffsetDateTimeRenamed("2023-06-15T14:00:00+00:00"),
   )
   sessions.push(TomlTable(session2))
   event_table["sessions"] = TomlArray(sessions)
@@
   )
 
   // Start of year  
-  let new_years_day = @toml.TomlDateTime(OffsetDateTime("2024-01-01T00:00:00Z"))
+  let new_years_day = @toml.TomlDateTime(OffsetDateTimeRenamed("2024-01-01T00:00:00Z"))
   debug_inspect(
     new_years_day.to_string(),
     content=(
@@
 
   // Various timezone offsets
   let tz_positive = @toml.TomlDateTime(
-    OffsetDateTime("2023-01-01T12:00:00+14:00"),
+    OffsetDateTimeRenamed("2023-01-01T12:00:00+14:00"),
   )
   debug_inspect(
     tz_positive.to_string(),
@@
     ),
   )
   let tz_negative = @toml.TomlDateTime(
-    OffsetDateTime("2023-01-01T12:00:00-12:00"),
+    OffsetDateTimeRenamed("2023-01-01T12:00:00-12:00"),
   )
   debug_inspect(
     tz_negative.to_string(),
@@
     ),
   )
   let tz_half_hour = @toml.TomlDateTime(
-    OffsetDateTime("2023-01-01T12:00:00+05:30"),
+    OffsetDateTimeRenamed("2023-01-01T12:00:00+05:30"),
   )
   debug_inspect(
     tz_half_hour.to_string(),
@@
 ///|
 /// Test datetime serialization and deserialization consistency
 test "datetime serialization consistency" {
-  let original_offset : @toml.TomlDateTime = OffsetDateTime(
+  let original_offset : @toml.TomlDateTime = OffsetDateTimeRenamed(
     "1979-05-27T07:32:00Z",
   )
   let toml_value = @toml.TomlDateTime(original_offset)
@@
 /// Test datetime comparison and equality  
 test "datetime comparison" {
   // Same datetime different representations should be equal
-  let dt1 = @toml.TomlDateTime(OffsetDateTime("2023-01-01T12:00:00Z"))
+  let dt1 = @toml.TomlDateTime(OffsetDateTimeRenamed("2023-01-01T12:00:00Z"))
-  let dt2 = @toml.TomlDateTime(OffsetDateTime("2023-01-01T12:00:00Z"))
+  let dt2 = @toml.TomlDateTime(OffsetDateTimeRenamed("2023-01-01T12:00:00Z"))
   debug_inspect(dt1 == dt2, content="true")
 
   // Different datetimes should not be equal
-  let dt3 = @toml.TomlDateTime(OffsetDateTime("2023-01-01T12:00:01Z"))
+  let dt3 = @toml.TomlDateTime(OffsetDateTimeRenamed("2023-01-01T12:00:01Z"))
   debug_inspect(dt1 == dt3, content="false")
 
   // Different datetime types should not be equal even with same time
   let local_dt = @toml.TomlDateTime(LocalDateTime("2023-01-01T12:00:00"))
-  let offset_dt = @toml.TomlDateTime(OffsetDateTime("2023-01-01T12:00:00Z"))
+  let offset_dt = @toml.TomlDateTime(OffsetDateTimeRenamed("2023-01-01T12:00:00Z"))
   debug_inspect(local_dt == offset_dt, content="false")
 }
 
@@
 /// Test historical and future dates
 test "datetime historical and future dates" {
   // Historical dates
-  let unix_epoch = @toml.TomlDateTime(OffsetDateTime("1970-01-01T00:00:00Z"))
+  let unix_epoch = @toml.TomlDateTime(OffsetDateTimeRenamed("1970-01-01T00:00:00Z"))
   debug_inspect(
     unix_epoch.to_string(),
     content=(
@@
 /// Test timezone boundary cases
 test "timezone boundary cases" {
   // UTC variants
-  let utc_z = @toml.TomlDateTime(OffsetDateTime("2023-01-01T12:00:00Z"))
+  let utc_z = @toml.TomlDateTime(OffsetDateTimeRenamed("2023-01-01T12:00:00Z"))
-  let utc_plus = @toml.TomlDateTime(OffsetDateTime("2023-01-01T12:00:00+00:00"))
+  let utc_plus = @toml.TomlDateTime(OffsetDateTimeRenamed("2023-01-01T12:00:00+00:00"))
   let utc_minus = @toml.TomlDateTime(
-    OffsetDateTime("2023-01-01T12:00:00-00:00"),
+    OffsetDateTimeRenamed("2023-01-01T12:00:00-00:00"),
   )
   debug_inspect(
     utc_z.to_string(),
@@
 
   // Extreme timezone offsets (valid in spec)
   let max_positive = @toml.TomlDateTime(
-    OffsetDateTime("2023-01-01T12:00:00+14:00"),
+    OffsetDateTimeRenamed("2023-01-01T12:00:00+14:00"),
   )
   let max_negative = @toml.TomlDateTime(
-    OffsetDateTime("2023-01-01T12:00:00-12:00"),
+    OffsetDateTimeRenamed("2023-01-01T12:00:00-12:00"),
   )
   debug_inspect(
     max_positive.to_string(),
@@
 
   // Deployment timestamp (offset datetime)
   config["deployed_at"] = TomlDateTime(
-    OffsetDateTime("2023-06-15T14:30:00+00:00"),
+    OffsetDateTimeRenamed("2023-06-15T14:30:00+00:00"),
   )
 
   // Scheduled maintenance (local datetime - timezone agnostic)
*** Update File: <WORKDIR>/internal\qc_model\gen_test.mbt
@@
 fn offset_datetime_gen() -> @qc.Gen[@datetime.TomlDateTime] {
   @qc.liftA3(
     fn(date : String, time : String, offset : String) {
-      OffsetDateTime("\{date}T\{time}\{offset}")
+      OffsetDateTimeRenamed("\{date}T\{time}\{offset}")
     },
     date_string_gen(),
     time_string_gen(),
*** Update File: <WORKDIR>/internal\qc_model\model.mbt
@@
 ///|
 fn datetime_has_fractional_seconds(datetime : @datetime.TomlDateTime) -> Bool {
   match datetime {
-    OffsetDateTime(text) | LocalDateTime(text) | LocalTime(text) =>
+    OffsetDateTimeRenamed(text) | LocalDateTime(text) | LocalTime(text) =>
       text.contains(".")
     LocalDate(_) => false
   }
*** Update File: <WORKDIR>/internal\tokenize\lexer_test.mbt
@@
 ///|
 /// Test uncovered Token JSON serialization methods
 test "test DateTimeToken JSON serialization" {
-  let dt = @datetime.OffsetDateTime("1979-05-27T07:32:00Z")
+  let dt = @datetime.OffsetDateTimeRenamed("1979-05-27T07:32:00Z")
   let token = @tokenize.DateTimeToken(dt, loc=@tokenize.default_loc())
   debug_inspect(
     token,
*** Update File: <WORKDIR>/internal\tokenize\tokenize.mbt
@@
           self.update_view(rest3)
           let end_pos = self.get_loc()
           DateTimeToken(
-            OffsetDateTime("\{datetime_str}Z"),
+            OffsetDateTimeRenamed("\{datetime_str}Z"),
             loc=make_loc(start_pos, end_pos),
           )
         } else if self.view() =~ (
@@
           validate_timezone_offset(offset)
           let end_pos = self.get_loc()
           DateTimeToken(
-            OffsetDateTime("\{datetime_str}\{offset}"),
+            OffsetDateTimeRenamed("\{datetime_str}\{offset}"),
             loc=make_loc(start_pos, end_pos),
           )
         } else {
*** Update File: <WORKDIR>/toml.mbt
@@
 /// "OffsetDateTime", "LocalDateTime", "LocalDate", "LocalTime"
 pub fn TomlValue::datetime_info(self : TomlValue) -> (String, String)? {
   match self {
-    TomlDateTime(OffsetDateTime(s)) => Some(("OffsetDateTime", s))
+    TomlDateTime(OffsetDateTimeRenamed(s)) => Some(("OffsetDateTime", s))
     TomlDateTime(LocalDateTime(s)) => Some(("LocalDateTime", s))
     TomlDateTime(LocalDate(s)) => Some(("LocalDate", s))
     TomlDateTime(LocalTime(s)) => Some(("LocalTime", s))
*** Update File: <WORKDIR>/toml_test.mbt
@@
 ///|
 /// Tests for datetime values - Offset DateTime
 test "toml offset datetime value" {
-  let offset_dt = @toml.TomlDateTime(OffsetDateTime("1979-05-27T07:32:00Z"))
+  let offset_dt = @toml.TomlDateTime(OffsetDateTimeRenamed("1979-05-27T07:32:00Z"))
   debug_inspect(
     offset_dt.to_string(),
     content=(
@@
     ),
   )
   let offset_dt_with_tz = @toml.TomlDateTime(
-    OffsetDateTime("1979-05-27T07:32:00+01:00"),
+    OffsetDateTimeRenamed("1979-05-27T07:32:00+01:00"),
   )
   debug_inspect(
     offset_dt_with_tz.to_string(),
@@
     ),
   )
   let offset_dt_negative = @toml.TomlDateTime(
-    OffsetDateTime("1979-05-27T07:32:00-05:00"),
+    OffsetDateTimeRenamed("1979-05-27T07:32:00-05:00"),
   )
   debug_inspect(
     offset_dt_negative.to_string(),
@@
 ///|
 /// Tests for datetime debug representation
 test "toml datetime debug" {
-  let offset_dt = @toml.TomlDateTime(OffsetDateTime("1979-05-27T07:32:00Z"))
+  let offset_dt = @toml.TomlDateTime(OffsetDateTimeRenamed("1979-05-27T07:32:00Z"))
   debug_inspect(
     offset_dt,
     content=(
@@
 ///|
 /// Tests for datetime equality
 test "toml datetime equality" {
-  let dt1 = @toml.TomlDateTime(OffsetDateTime("1979-05-27T07:32:00Z"))
+  let dt1 = @toml.TomlDateTime(OffsetDateTimeRenamed("1979-05-27T07:32:00Z"))
-  let dt2 = @toml.TomlDateTime(OffsetDateTime("1979-05-27T07:32:00Z"))
+  let dt2 = @toml.TomlDateTime(OffsetDateTimeRenamed("1979-05-27T07:32:00Z"))
-  let dt3 = @toml.TomlDateTime(OffsetDateTime("1979-05-27T07:32:01Z"))
+  let dt3 = @toml.TomlDateTime(OffsetDateTimeRenamed("1979-05-27T07:32:01Z"))
   debug_inspect(dt1 == dt2, content="true")
   debug_inspect(dt1 == dt3, content="false")
   let local_dt1 = @toml.TomlDateTime(LocalDateTime("2023-01-01T00:00:00"))
@@
 /// Tests for mixed datetime array
 test "toml mixed datetime array" {
   let arr = [
-    @toml.TomlDateTime(OffsetDateTime("1979-05-27T07:32:00Z")),
+    @toml.TomlDateTime(OffsetDateTimeRenamed("1979-05-27T07:32:00Z")),
     TomlDateTime(LocalDateTime("1979-05-27T07:32:00")),
     TomlDateTime(LocalDate("1979-05-27")),
     TomlDateTime(LocalTime("07:32:00")),
@@
 /// Tests for datetime in table
 test "toml datetime in table" {
   let table : Map[String, @toml.TomlValue] = Map([])
-  table["created_at"] = TomlDateTime(OffsetDateTime("2023-01-01T00:00:00Z"))
+  table["created_at"] = TomlDateTime(OffsetDateTimeRenamed("2023-01-01T00:00:00Z"))
   table["updated_at"] = TomlDateTime(LocalDateTime("2023-01-02T12:30:45"))
   table["birth_date"] = TomlDateTime(LocalDate("1990-05-15"))
   table["meeting_time"] = TomlDateTime(LocalTime("14:30:00"))
@@
 test "toml datetime edge cases" {
   // Test with fractional seconds
   let dt_with_millis = @toml.TomlDateTime(
-    OffsetDateTime("2023-01-01T00:00:00.123Z"),
+    OffsetDateTimeRenamed("2023-01-01T00:00:00.123Z"),
   )
   debug_inspect(
     dt_with_millis.to_string(),
@@
 
   // Test with different timezone formats
   let dt_with_tz_colon = @toml.TomlDateTime(
-    OffsetDateTime("2023-01-01T00:00:00+05:30"),
+    OffsetDateTimeRenamed("2023-01-01T00:00:00+05:30"),
   )
   debug_inspect(
     dt_with_tz_colon.to_string(),
@@
     ),
   )
   let dt_with_tz_no_colon = @toml.TomlDateTime(
-    OffsetDateTime("2023-01-01T00:00:00+0530"),
+    OffsetDateTimeRenamed("2023-01-01T00:00:00+0530"),
   )
   debug_inspect(
     dt_with_tz_no_colon.to_string(),
@@
 test "datetime token creation" {
   let loc = @tokenize.default_loc()
   let offset_dt_token = @tokenize.DateTimeToken(
-    OffsetDateTime("1979-05-27T07:32:00Z"),
+    OffsetDateTimeRenamed("1979-05-27T07:32:00Z"),
     loc~,
   )
   let local_dt_token = @tokenize.DateTimeToken(
@@
   let local_time_token = @tokenize.DateTimeToken(LocalTime("07:32:00"), loc~)
 
   // Test that tokens can be created (basic instantiation test)
-  guard offset_dt_token is DateTimeToken(OffsetDateTime("1979-05-27T07:32:00Z"))
+  guard offset_dt_token is DateTimeToken(OffsetDateTimeRenamed("1979-05-27T07:32:00Z"))
   guard local_dt_token is DateTimeToken(LocalDateTime("1979-05-27T07:32:00"))
   guard local_date_token is DateTimeToken(LocalDate("1979-05-27"))
   guard local_time_token is DateTimeToken(LocalTime("07:32:00"))
@@
     content="true",
   )
   let datetime_array = [
-    @toml.TomlDateTime(OffsetDateTime("2023-01-01T00:00:00Z")),
+    @toml.TomlDateTime(OffsetDateTimeRenamed("2023-01-01T00:00:00Z")),
     TomlDateTime(LocalDateTime("2023-01-02T00:00:00")),
     TomlDateTime(LocalDate("2023-01-03")),
   ]
@@
   debug_inspect(@toml.TomlFloat(3.14).validate(), content="true")
   debug_inspect(@toml.TomlBoolean(true).validate(), content="true")
   debug_inspect(
-    @toml.TomlDateTime(OffsetDateTime("2023-01-01T00:00:00Z")).validate(),
+    @toml.TomlDateTime(OffsetDateTimeRenamed("2023-01-01T00:00:00Z")).validate(),
     content="true",
   )
 }
*** Update File: <WORKDIR>/toml_to_string.mbt
@@
     TomlBoolean(b) => if b { output <+ "true" } else { output <+ "false" }
     TomlDateTime(dt) =>
       match dt {
-        OffsetDateTime(s) | LocalDateTime(s) | LocalDate(s) | LocalTime(s) =>
+        OffsetDateTimeRenamed(s) | LocalDateTime(s) | LocalDate(s) | LocalTime(s) =>
           output <+ "\{s}"
       }
     TomlArray(arr) =>
*** Update File: <WORKDIR>/toml_to_string_test.mbt
@@
 ///|
 test "serialize datetime values" {
   inspect(
-    @toml.TomlDateTime(OffsetDateTime("1979-05-27T07:32:00Z")),
+    @toml.TomlDateTime(OffsetDateTimeRenamed("1979-05-27T07:32:00Z")),
     content="1979-05-27T07:32:00Z",
   )
   inspect(
@@
       TomlTable(
         Map::from_array([
           ("name", TomlString("Tom Preston-Werner")),
-          ("dob", TomlDateTime(OffsetDateTime("1979-05-27T07:32:00-08:00"))),
+          ("dob", TomlDateTime(OffsetDateTimeRenamed("1979-05-27T07:32:00-08:00"))),
         ]),
       ),
     ),
*** Update File: <WORKDIR>/toml_utils.mbt
@@
   set_dotted_key_value(
     table,
     ["root", "nested", "datetime"],
-    TomlDateTime(OffsetDateTime("2024-01-01T12:00:00Z")),
+    TomlDateTime(OffsetDateTimeRenamed("2024-01-01T12:00:00Z")),
   )
   debug_inspect(
     table,
*** End Patch

```
