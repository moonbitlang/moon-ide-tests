# toml-parser find-references OffsetDateTime datetime\datetime.mbt:14:3

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\toml-parser' moon ide find-references 'OffsetDateTime' --loc 'datetime\datetime.mbt:14:3'
Found 62 references for symbol 'OffsetDateTime':
<WORKDIR>/coverage_improvement_comprehensive_test.mbt:246:38-246:52:
    |   debug_inspect(float_str.contains("3.14"), content="true")
    | 
    |   // Test datetime to_string variants
246 |   let offset_dt = @toml.TomlDateTime(OffsetDateTime("2023-05-15T10:30:00Z"))
    |                                      ^^^^^^^^^^^^^^
    |   let offset_str = offset_dt.to_string()
    |   debug_inspect(

<WORKDIR>/datetime\datetime.mbt:14:3-14:17:
   | /// the spelling supplied in the TOML source; it does not normalize or
   | /// validate the underlying calendar arithmetic.
   | pub(all) enum TomlDateTime {
14 |   OffsetDateTime(String)
   |   ^^^^^^^^^^^^^^
   |   LocalDateTime(String)
   |   LocalDate(String)

<WORKDIR>/datetime\datetime.mbt:25:5-25:19:
   | /// `OffsetDateTime("1979-05-27T07:32:00Z")` etc.
   | pub impl Show for TomlDateTime with fn output(self, logger) {
   |   match self {
25 |     OffsetDateTime(s) =>
   |     ^^^^^^^^^^^^^^
   |       logger <+
   |         $|OffsetDateTime("\{s}")

<WORKDIR>/datetime_extended_test.mbt:4:30-4:44:
  | ///|
  | /// Extended datetime tests for improved coverage
  | test "test TomlDateTime types and equality" {
4 |   let offset_dt1 = @datetime.OffsetDateTime("1979-05-27T07:32:00Z")
  |                              ^^^^^^^^^^^^^^
  |   let offset_dt2 = @datetime.OffsetDateTime("1979-05-27T07:32:00Z")
  |   let offset_dt3 = @datetime.OffsetDateTime("1980-05-27T07:32:00Z")

<WORKDIR>/datetime_extended_test.mbt:5:30-5:44:
  | /// Extended datetime tests for improved coverage
  | test "test TomlDateTime types and equality" {
  |   let offset_dt1 = @datetime.OffsetDateTime("1979-05-27T07:32:00Z")
5 |   let offset_dt2 = @datetime.OffsetDateTime("1979-05-27T07:32:00Z")
  |                              ^^^^^^^^^^^^^^
  |   let offset_dt3 = @datetime.OffsetDateTime("1980-05-27T07:32:00Z")
  |   debug_inspect(offset_dt1 == offset_dt2, content="true")

<WORKDIR>/datetime_extended_test.mbt:6:30-6:44:
  | test "test TomlDateTime types and equality" {
  |   let offset_dt1 = @datetime.OffsetDateTime("1979-05-27T07:32:00Z")
  |   let offset_dt2 = @datetime.OffsetDateTime("1979-05-27T07:32:00Z")
6 |   let offset_dt3 = @datetime.OffsetDateTime("1980-05-27T07:32:00Z")
  |                              ^^^^^^^^^^^^^^
  |   debug_inspect(offset_dt1 == offset_dt2, content="true")
  |   debug_inspect(offset_dt1 == offset_dt3, content="false")

<WORKDIR>/datetime_extended_test.mbt:19:29-19:43:
   | 
   | ///|
   | test "test datetime token debug representation" {
19 |   let offset_dt = @datetime.OffsetDateTime("1979-05-27T07:32:00+01:00")
   |                             ^^^^^^^^^^^^^^
   |   let token = @tokenize.DateTimeToken(offset_dt, loc=@tokenize.default_loc())
   | 

<WORKDIR>/datetime_extended_test.mbt:39:31-39:45:
   |   let local_dt = @datetime.LocalDateTime("1979-05-27T07:32:00")
   |   let local_date = @datetime.LocalDate("1979-05-27")
   |   let local_time = @datetime.LocalTime("07:32:00")
39 |   let offset_dt_z = @datetime.OffsetDateTime("1979-05-27T07:32:00Z")
   |                               ^^^^^^^^^^^^^^
   |   let offset_dt_plus = @datetime.OffsetDateTime("1979-05-27T07:32:00+01:00")
   | 

<WORKDIR>/datetime_extended_test.mbt:40:34-40:48:
   |   let local_date = @datetime.LocalDate("1979-05-27")
   |   let local_time = @datetime.LocalTime("07:32:00")
   |   let offset_dt_z = @datetime.OffsetDateTime("1979-05-27T07:32:00Z")
40 |   let offset_dt_plus = @datetime.OffsetDateTime("1979-05-27T07:32:00+01:00")
   |                                  ^^^^^^^^^^^^^^
   | 
   |   // Test Show implementation

<WORKDIR>/datetime_extended_test.mbt:58:22-58:36:
   | 
   | ///|
   | test "test datetime token creation and usage" {
58 |   let dt = @datetime.OffsetDateTime("2023-12-25T00:00:00Z")
   |                      ^^^^^^^^^^^^^^
   |   let loc = @tokenize.default_loc()
   |   let token = @tokenize.DateTimeToken(dt, loc~)

<WORKDIR>/datetime_extended_test.mbt:64:5-64:19:
   | 
   |   // Test token equality
   |   let same_token = @tokenize.DateTimeToken(
64 |     OffsetDateTime("2023-12-25T00:00:00Z"),
   |     ^^^^^^^^^^^^^^
   |     loc~,
   |   )

<WORKDIR>/datetime_extended_test.mbt:68:5-68:19:
   |     loc~,
   |   )
   |   let diff_token = @tokenize.DateTimeToken(
68 |     OffsetDateTime("2023-12-26T00:00:00Z"),
   |     ^^^^^^^^^^^^^^
   |     loc~,
   |   )

<WORKDIR>/datetime_test.mbt:7:33-7:47:
  | /// Test TOML 1.0 spec examples for Offset Date-Time
  | test "toml spec offset datetime examples" {
  |   // RFC 3339 examples from TOML spec
7 |   let odt1 = @toml.TomlDateTime(OffsetDateTime("1979-05-27T07:32:00Z"))
  |                                 ^^^^^^^^^^^^^^
  |   debug_inspect(
  |     odt1.to_string(),

<WORKDIR>/datetime_test.mbt:14:33-14:47:
   |       #|"1979-05-27T07:32:00Z"
   |     ),
   |   )
14 |   let odt2 = @toml.TomlDateTime(OffsetDateTime("1979-05-27T00:32:00-07:00"))
   |                                 ^^^^^^^^^^^^^^
   |   debug_inspect(
   |     odt2.to_string(),

<WORKDIR>/datetime_test.mbt:22:5-22:19:
   |     ),
   |   )
   |   let odt3 = @toml.TomlDateTime(
22 |     OffsetDateTime("1979-05-27T00:32:00.999999-07:00"),
   |     ^^^^^^^^^^^^^^
   |   )
   |   debug_inspect(

<WORKDIR>/datetime_test.mbt:101:24-101:38:
    | test "datetime arrays validation" {
    |   // Array of same datetime type (should be valid in TOML)
    |   let offset_array = [
101 |     @toml.TomlDateTime(OffsetDateTime("2023-01-01T00:00:00Z")),
    |                        ^^^^^^^^^^^^^^
    |     TomlDateTime(OffsetDateTime("2023-01-02T00:00:00Z")),
    |     TomlDateTime(OffsetDateTime("2023-01-03T00:00:00Z")),

<WORKDIR>/datetime_test.mbt:102:18-102:32:
    |   // Array of same datetime type (should be valid in TOML)
    |   let offset_array = [
    |     @toml.TomlDateTime(OffsetDateTime("2023-01-01T00:00:00Z")),
102 |     TomlDateTime(OffsetDateTime("2023-01-02T00:00:00Z")),
    |                  ^^^^^^^^^^^^^^
    |     TomlDateTime(OffsetDateTime("2023-01-03T00:00:00Z")),
    |   ]

<WORKDIR>/datetime_test.mbt:103:18-103:32:
    |   let offset_array = [
    |     @toml.TomlDateTime(OffsetDateTime("2023-01-01T00:00:00Z")),
    |     TomlDateTime(OffsetDateTime("2023-01-02T00:00:00Z")),
103 |     TomlDateTime(OffsetDateTime("2023-01-03T00:00:00Z")),
    |                  ^^^^^^^^^^^^^^
    |   ]
    |   let offset_arr_value = @toml.TomlArray(offset_array)

<WORKDIR>/datetime_test.mbt:138:5-138:19:
    |   let session1 : Map[String, @toml.TomlValue] = Map([])
    |   session1["title"] = TomlString("Opening Keynote")
    |   session1["scheduled_at"] = TomlDateTime(
138 |     OffsetDateTime("2023-06-15T09:00:00+00:00"),
    |     ^^^^^^^^^^^^^^
    |   )
    |   sessions.push(@toml.TomlTable(session1))

<WORKDIR>/datetime_test.mbt:144:5-144:19:
    |   let session2 : Map[String, @toml.TomlValue] = Map([])
    |   session2["title"] = TomlString("Technical Workshop")
    |   session2["scheduled_at"] = TomlDateTime(
144 |     OffsetDateTime("2023-06-15T14:00:00+00:00"),
    |     ^^^^^^^^^^^^^^
    |   )
    |   sessions.push(TomlTable(session2))

<WORKDIR>/datetime_test.mbt:181:42-181:56:
    |   )
    | 
    |   // Start of year  
181 |   let new_years_day = @toml.TomlDateTime(OffsetDateTime("2024-01-01T00:00:00Z"))
    |                                          ^^^^^^^^^^^^^^
    |   debug_inspect(
    |     new_years_day.to_string(),

<WORKDIR>/datetime_test.mbt:202:5-202:19:
    | 
    |   // Various timezone offsets
    |   let tz_positive = @toml.TomlDateTime(
202 |     OffsetDateTime("2023-01-01T12:00:00+14:00"),
    |     ^^^^^^^^^^^^^^
    |   )
    |   debug_inspect(

<WORKDIR>/datetime_test.mbt:211:5-211:19:
    |     ),
    |   )
    |   let tz_negative = @toml.TomlDateTime(
211 |     OffsetDateTime("2023-01-01T12:00:00-12:00"),
    |     ^^^^^^^^^^^^^^
    |   )
    |   debug_inspect(

<WORKDIR>/datetime_test.mbt:220:5-220:19:
    |     ),
    |   )
    |   let tz_half_hour = @toml.TomlDateTime(
220 |     OffsetDateTime("2023-01-01T12:00:00+05:30"),
    |     ^^^^^^^^^^^^^^
    |   )
    |   debug_inspect(

<WORKDIR>/datetime_test.mbt:233:46-233:60:
    | ///|
    | /// Test datetime serialization and deserialization consistency
    | test "datetime serialization consistency" {
233 |   let original_offset : @toml.TomlDateTime = OffsetDateTime(
    |                                              ^^^^^^^^^^^^^^
    |     "1979-05-27T07:32:00Z",
    |   )

<WORKDIR>/datetime_test.mbt:260:32-260:46:
    | /// Test datetime comparison and equality  
    | test "datetime comparison" {
    |   // Same datetime different representations should be equal
260 |   let dt1 = @toml.TomlDateTime(OffsetDateTime("2023-01-01T12:00:00Z"))
    |                                ^^^^^^^^^^^^^^
    |   let dt2 = @toml.TomlDateTime(OffsetDateTime("2023-01-01T12:00:00Z"))
    |   debug_inspect(dt1 == dt2, content="true")

<WORKDIR>/datetime_test.mbt:261:32-261:46:
    | test "datetime comparison" {
    |   // Same datetime different representations should be equal
    |   let dt1 = @toml.TomlDateTime(OffsetDateTime("2023-01-01T12:00:00Z"))
261 |   let dt2 = @toml.TomlDateTime(OffsetDateTime("2023-01-01T12:00:00Z"))
    |                                ^^^^^^^^^^^^^^
    |   debug_inspect(dt1 == dt2, content="true")
    | 

<WORKDIR>/datetime_test.mbt:265:32-265:46:
    |   debug_inspect(dt1 == dt2, content="true")
    | 
    |   // Different datetimes should not be equal
265 |   let dt3 = @toml.TomlDateTime(OffsetDateTime("2023-01-01T12:00:01Z"))
    |                                ^^^^^^^^^^^^^^
    |   debug_inspect(dt1 == dt3, content="false")
    | 

<WORKDIR>/datetime_test.mbt:270:38-270:52:
    | 
    |   // Different datetime types should not be equal even with same time
    |   let local_dt = @toml.TomlDateTime(LocalDateTime("2023-01-01T12:00:00"))
270 |   let offset_dt = @toml.TomlDateTime(OffsetDateTime("2023-01-01T12:00:00Z"))
    |                                      ^^^^^^^^^^^^^^
    |   debug_inspect(local_dt == offset_dt, content="false")
    | }

<WORKDIR>/datetime_test.mbt:278:39-278:53:
    | /// Test historical and future dates
    | test "datetime historical and future dates" {
    |   // Historical dates
278 |   let unix_epoch = @toml.TomlDateTime(OffsetDateTime("1970-01-01T00:00:00Z"))
    |                                       ^^^^^^^^^^^^^^
    |   debug_inspect(
    |     unix_epoch.to_string(),

<WORKDIR>/datetime_test.mbt:316:34-316:48:
    | /// Test timezone boundary cases
    | test "timezone boundary cases" {
    |   // UTC variants
316 |   let utc_z = @toml.TomlDateTime(OffsetDateTime("2023-01-01T12:00:00Z"))
    |                                  ^^^^^^^^^^^^^^
    |   let utc_plus = @toml.TomlDateTime(OffsetDateTime("2023-01-01T12:00:00+00:00"))
    |   let utc_minus = @toml.TomlDateTime(

<WORKDIR>/datetime_test.mbt:317:37-317:51:
    | test "timezone boundary cases" {
    |   // UTC variants
    |   let utc_z = @toml.TomlDateTime(OffsetDateTime("2023-01-01T12:00:00Z"))
317 |   let utc_plus = @toml.TomlDateTime(OffsetDateTime("2023-01-01T12:00:00+00:00"))
    |                                     ^^^^^^^^^^^^^^
    |   let utc_minus = @toml.TomlDateTime(
    |     OffsetDateTime("2023-01-01T12:00:00-00:00"),

<WORKDIR>/datetime_test.mbt:319:5-319:19:
    |   let utc_z = @toml.TomlDateTime(OffsetDateTime("2023-01-01T12:00:00Z"))
    |   let utc_plus = @toml.TomlDateTime(OffsetDateTime("2023-01-01T12:00:00+00:00"))
    |   let utc_minus = @toml.TomlDateTime(
319 |     OffsetDateTime("2023-01-01T12:00:00-00:00"),
    |     ^^^^^^^^^^^^^^
    |   )
    |   debug_inspect(

<WORKDIR>/datetime_test.mbt:342:5-342:19:
    | 
    |   // Extreme timezone offsets (valid in spec)
    |   let max_positive = @toml.TomlDateTime(
342 |     OffsetDateTime("2023-01-01T12:00:00+14:00"),
    |     ^^^^^^^^^^^^^^
    |   )
    |   let max_negative = @toml.TomlDateTime(

<WORKDIR>/datetime_test.mbt:345:5-345:19:
    |     OffsetDateTime("2023-01-01T12:00:00+14:00"),
    |   )
    |   let max_negative = @toml.TomlDateTime(
345 |     OffsetDateTime("2023-01-01T12:00:00-12:00"),
    |     ^^^^^^^^^^^^^^
    |   )
    |   debug_inspect(

<WORKDIR>/datetime_test.mbt:369:5-369:19:
    | 
    |   // Deployment timestamp (offset datetime)
    |   config["deployed_at"] = TomlDateTime(
369 |     OffsetDateTime("2023-06-15T14:30:00+00:00"),
    |     ^^^^^^^^^^^^^^
    |   )
    | 

<WORKDIR>/internal\qc_model\gen_test.mbt:292:7-292:21:
    | fn offset_datetime_gen() -> @qc.Gen[@datetime.TomlDateTime] {
    |   @qc.liftA3(
    |     fn(date : String, time : String, offset : String) {
292 |       OffsetDateTime("\{date}T\{time}\{offset}")
    |       ^^^^^^^^^^^^^^
    |     },
    |     date_string_gen(),

<WORKDIR>/internal\qc_model\model.mbt:238:5-238:19:
    | ///|
    | fn datetime_has_fractional_seconds(datetime : @datetime.TomlDateTime) -> Bool {
    |   match datetime {
238 |     OffsetDateTime(text) | LocalDateTime(text) | LocalTime(text) =>
    |     ^^^^^^^^^^^^^^
    |       text.contains(".")
    |     LocalDate(_) => false

<WORKDIR>/internal\tokenize\lexer_test.mbt:250:22-250:36:
    | ///|
    | /// Test uncovered Token JSON serialization methods
    | test "test DateTimeToken JSON serialization" {
250 |   let dt = @datetime.OffsetDateTime("1979-05-27T07:32:00Z")
    |                      ^^^^^^^^^^^^^^
    |   let token = @tokenize.DateTimeToken(dt, loc=@tokenize.default_loc())
    |   debug_inspect(

<WORKDIR>/internal\tokenize\tokenize.mbt:716:13-716:27:
    |           self.update_view(rest3)
    |           let end_pos = self.get_loc()
    |           DateTimeToken(
716 |             OffsetDateTime("\{datetime_str}Z"),
    |             ^^^^^^^^^^^^^^
    |             loc=make_loc(start_pos, end_pos),
    |           )

<WORKDIR>/internal\tokenize\tokenize.mbt:727:13-727:27:
    |           validate_timezone_offset(offset)
    |           let end_pos = self.get_loc()
    |           DateTimeToken(
727 |             OffsetDateTime("\{datetime_str}\{offset}"),
    |             ^^^^^^^^^^^^^^
    |             loc=make_loc(start_pos, end_pos),
    |           )

<WORKDIR>/toml.mbt:24:18-24:32:
   | /// "OffsetDateTime", "LocalDateTime", "LocalDate", "LocalTime"
   | pub fn TomlValue::datetime_info(self : TomlValue) -> (String, String)? {
   |   match self {
24 |     TomlDateTime(OffsetDateTime(s)) => Some(("OffsetDateTime", s))
   |                  ^^^^^^^^^^^^^^
   |     TomlDateTime(LocalDateTime(s)) => Some(("LocalDateTime", s))
   |     TomlDateTime(LocalDate(s)) => Some(("LocalDate", s))

<WORKDIR>/toml_test.mbt:83:38-83:52:
   | ///|
   | /// Tests for datetime values - Offset DateTime
   | test "toml offset datetime value" {
83 |   let offset_dt = @toml.TomlDateTime(OffsetDateTime("1979-05-27T07:32:00Z"))
   |                                      ^^^^^^^^^^^^^^
   |   debug_inspect(
   |     offset_dt.to_string(),

<WORKDIR>/toml_test.mbt:91:5-91:19:
   |     ),
   |   )
   |   let offset_dt_with_tz = @toml.TomlDateTime(
91 |     OffsetDateTime("1979-05-27T07:32:00+01:00"),
   |     ^^^^^^^^^^^^^^
   |   )
   |   debug_inspect(

<WORKDIR>/toml_test.mbt:100:5-100:19:
    |     ),
    |   )
    |   let offset_dt_negative = @toml.TomlDateTime(
100 |     OffsetDateTime("1979-05-27T07:32:00-05:00"),
    |     ^^^^^^^^^^^^^^
    |   )
    |   debug_inspect(

<WORKDIR>/toml_test.mbt:202:38-202:52:
    | ///|
    | /// Tests for datetime debug representation
    | test "toml datetime debug" {
202 |   let offset_dt = @toml.TomlDateTime(OffsetDateTime("1979-05-27T07:32:00Z"))
    |                                      ^^^^^^^^^^^^^^
    |   debug_inspect(
    |     offset_dt,

<WORKDIR>/toml_test.mbt:235:32-235:46:
    | ///|
    | /// Tests for datetime equality
    | test "toml datetime equality" {
235 |   let dt1 = @toml.TomlDateTime(OffsetDateTime("1979-05-27T07:32:00Z"))
    |                                ^^^^^^^^^^^^^^
    |   let dt2 = @toml.TomlDateTime(OffsetDateTime("1979-05-27T07:32:00Z"))
    |   let dt3 = @toml.TomlDateTime(OffsetDateTime("1979-05-27T07:32:01Z"))

<WORKDIR>/toml_test.mbt:236:32-236:46:
    | /// Tests for datetime equality
    | test "toml datetime equality" {
    |   let dt1 = @toml.TomlDateTime(OffsetDateTime("1979-05-27T07:32:00Z"))
236 |   let dt2 = @toml.TomlDateTime(OffsetDateTime("1979-05-27T07:32:00Z"))
    |                                ^^^^^^^^^^^^^^
    |   let dt3 = @toml.TomlDateTime(OffsetDateTime("1979-05-27T07:32:01Z"))
    |   debug_inspect(dt1 == dt2, content="true")

<WORKDIR>/toml_test.mbt:237:32-237:46:
    | test "toml datetime equality" {
    |   let dt1 = @toml.TomlDateTime(OffsetDateTime("1979-05-27T07:32:00Z"))
    |   let dt2 = @toml.TomlDateTime(OffsetDateTime("1979-05-27T07:32:00Z"))
237 |   let dt3 = @toml.TomlDateTime(OffsetDateTime("1979-05-27T07:32:01Z"))
    |                                ^^^^^^^^^^^^^^
    |   debug_inspect(dt1 == dt2, content="true")
    |   debug_inspect(dt1 == dt3, content="false")

<WORKDIR>/toml_test.mbt:249:24-249:38:
    | /// Tests for mixed datetime array
    | test "toml mixed datetime array" {
    |   let arr = [
249 |     @toml.TomlDateTime(OffsetDateTime("1979-05-27T07:32:00Z")),
    |                        ^^^^^^^^^^^^^^
    |     TomlDateTime(LocalDateTime("1979-05-27T07:32:00")),
    |     TomlDateTime(LocalDate("1979-05-27")),

<WORKDIR>/toml_test.mbt:268:38-268:52:
    | /// Tests for datetime in table
    | test "toml datetime in table" {
    |   let table : Map[String, @toml.TomlValue] = Map([])
268 |   table["created_at"] = TomlDateTime(OffsetDateTime("2023-01-01T00:00:00Z"))
    |                                      ^^^^^^^^^^^^^^
    |   table["updated_at"] = TomlDateTime(LocalDateTime("2023-01-02T12:30:45"))
    |   table["birth_date"] = TomlDateTime(LocalDate("1990-05-15"))

<WORKDIR>/toml_test.mbt:291:5-291:19:
    | test "toml datetime edge cases" {
    |   // Test with fractional seconds
    |   let dt_with_millis = @toml.TomlDateTime(
291 |     OffsetDateTime("2023-01-01T00:00:00.123Z"),
    |     ^^^^^^^^^^^^^^
    |   )
    |   debug_inspect(

<WORKDIR>/toml_test.mbt:311:5-311:19:
    | 
    |   // Test with different timezone formats
    |   let dt_with_tz_colon = @toml.TomlDateTime(
311 |     OffsetDateTime("2023-01-01T00:00:00+05:30"),
    |     ^^^^^^^^^^^^^^
    |   )
    |   debug_inspect(

<WORKDIR>/toml_test.mbt:320:5-320:19:
    |     ),
    |   )
    |   let dt_with_tz_no_colon = @toml.TomlDateTime(
320 |     OffsetDateTime("2023-01-01T00:00:00+0530"),
    |     ^^^^^^^^^^^^^^
    |   )
    |   debug_inspect(

<WORKDIR>/toml_test.mbt:335:5-335:19:
    | test "datetime token creation" {
    |   let loc = @tokenize.default_loc()
    |   let offset_dt_token = @tokenize.DateTimeToken(
335 |     OffsetDateTime("1979-05-27T07:32:00Z"),
    |     ^^^^^^^^^^^^^^
    |     loc~,
    |   )

<WORKDIR>/toml_test.mbt:346:42-346:56:
    |   let local_time_token = @tokenize.DateTimeToken(LocalTime("07:32:00"), loc~)
    | 
    |   // Test that tokens can be created (basic instantiation test)
346 |   guard offset_dt_token is DateTimeToken(OffsetDateTime("1979-05-27T07:32:00Z"))
    |                                          ^^^^^^^^^^^^^^
    |   guard local_dt_token is DateTimeToken(LocalDateTime("1979-05-27T07:32:00"))
    |   guard local_date_token is DateTimeToken(LocalDate("1979-05-27"))

<WORKDIR>/toml_test.mbt:367:24-367:38:
    |     content="true",
    |   )
    |   let datetime_array = [
367 |     @toml.TomlDateTime(OffsetDateTime("2023-01-01T00:00:00Z")),
    |                        ^^^^^^^^^^^^^^
    |     TomlDateTime(LocalDateTime("2023-01-02T00:00:00")),
    |     TomlDateTime(LocalDate("2023-01-03")),

<WORKDIR>/toml_test.mbt:461:24-461:38:
    |   debug_inspect(@toml.TomlFloat(3.14).validate(), content="true")
    |   debug_inspect(@toml.TomlBoolean(true).validate(), content="true")
    |   debug_inspect(
461 |     @toml.TomlDateTime(OffsetDateTime("2023-01-01T00:00:00Z")).validate(),
    |                        ^^^^^^^^^^^^^^
    |     content="true",
    |   )

<WORKDIR>/toml_to_string.mbt:158:9-158:23:
    |     TomlBoolean(b) => if b { output <+ "true" } else { output <+ "false" }
    |     TomlDateTime(dt) =>
    |       match dt {
158 |         OffsetDateTime(s) | LocalDateTime(s) | LocalDate(s) | LocalTime(s) =>
    |         ^^^^^^^^^^^^^^
    |           output <+ "\{s}"
    |       }

<WORKDIR>/toml_to_string_test.mbt:71:24-71:38:
   | ///|
   | test "serialize datetime values" {
   |   inspect(
71 |     @toml.TomlDateTime(OffsetDateTime("1979-05-27T07:32:00Z")),
   |                        ^^^^^^^^^^^^^^
   |     content="1979-05-27T07:32:00Z",
   |   )

<WORKDIR>/toml_to_string_test.mbt:524:32-524:46:
    |       TomlTable(
    |         Map::from_array([
    |           ("name", TomlString("Tom Preston-Werner")),
524 |           ("dob", TomlDateTime(OffsetDateTime("1979-05-27T07:32:00-08:00"))),
    |                                ^^^^^^^^^^^^^^
    |         ]),
    |       ),

<WORKDIR>/toml_utils.mbt:639:18-639:32:
    |   set_dotted_key_value(
    |     table,
    |     ["root", "nested", "datetime"],
639 |     TomlDateTime(OffsetDateTime("2024-01-01T12:00:00Z")),
    |                  ^^^^^^^^^^^^^^
    |   )
    |   debug_inspect(

```
