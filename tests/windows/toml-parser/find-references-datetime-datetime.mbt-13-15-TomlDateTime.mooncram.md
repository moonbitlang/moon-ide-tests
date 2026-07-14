# toml-parser find-references TomlDateTime datetime\datetime.mbt:13:15

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\toml-parser' moon ide find-references 'TomlDateTime' --loc 'datetime\datetime.mbt:13:15'
Found 15 references for symbol 'TomlDateTime':
<WORKDIR>/datetime\datetime.mbt:13:15-13:27:
   | /// Values are stored as their original string form. The parser preserves
   | /// the spelling supplied in the TOML source; it does not normalize or
   | /// validate the underlying calendar arithmetic.
13 | pub(all) enum TomlDateTime {
   |               ^^^^^^^^^^^^
   |   OffsetDateTime(String)
   |   LocalDateTime(String)

<WORKDIR>/datetime\datetime.mbt:23:19-23:31:
   | ///|
   | /// Render the variant for human-readable diagnostics:
   | /// `OffsetDateTime("1979-05-27T07:32:00Z")` etc.
23 | pub impl Show for TomlDateTime with fn output(self, logger) {
   |                   ^^^^^^^^^^^^
   |   match self {
   |     OffsetDateTime(s) =>

<WORKDIR>/internal\qc_model\gen_test.mbt:270:42-270:54:
    | }
    | 
    | ///|
270 | fn local_date_gen() -> @qc.Gen[@datetime.TomlDateTime] {
    |                                          ^^^^^^^^^^^^
    |   date_string_gen().fmap(fn(value) { LocalDate(value) })
    | }

<WORKDIR>/internal\qc_model\gen_test.mbt:275:42-275:54:
    | }
    | 
    | ///|
275 | fn local_time_gen() -> @qc.Gen[@datetime.TomlDateTime] {
    |                                          ^^^^^^^^^^^^
    |   time_string_gen().fmap(fn(value) { LocalTime(value) })
    | }

<WORKDIR>/internal\qc_model\gen_test.mbt:280:46-280:58:
    | }
    | 
    | ///|
280 | fn local_datetime_gen() -> @qc.Gen[@datetime.TomlDateTime] {
    |                                              ^^^^^^^^^^^^
    |   @qc.liftA2(
    |     fn(date : String, time : String) { LocalDateTime("\{date}T\{time}") },

<WORKDIR>/internal\qc_model\gen_test.mbt:289:47-289:59:
    | }
    | 
    | ///|
289 | fn offset_datetime_gen() -> @qc.Gen[@datetime.TomlDateTime] {
    |                                               ^^^^^^^^^^^^
    |   @qc.liftA3(
    |     fn(date : String, time : String, offset : String) {

<WORKDIR>/internal\qc_model\gen_test.mbt:301:45-301:57:
    | }
    | 
    | ///|
301 | fn toml_datetime_gen() -> @qc.Gen[@datetime.TomlDateTime] {
    |                                             ^^^^^^^^^^^^
    |   @qc.frequency([
    |     (2U, local_date_gen()),

<WORKDIR>/internal\qc_model\model.mbt:25:23-25:35:
   |   SString(String)
   |   SInteger(Int64)
   |   SBoolean(Bool)
25 |   SDateTime(@datetime.TomlDateTime)
   |                       ^^^^^^^^^^^^
   |   SDateTimeArray(Array[@datetime.TomlDateTime])
   |   SEmptyArray

<WORKDIR>/internal\qc_model\model.mbt:26:34-26:46:
   |   SInteger(Int64)
   |   SBoolean(Bool)
   |   SDateTime(@datetime.TomlDateTime)
26 |   SDateTimeArray(Array[@datetime.TomlDateTime])
   |                                  ^^^^^^^^^^^^
   |   SEmptyArray
   |   SStringArray(Array[String])

<WORKDIR>/internal\qc_model\model.mbt:92:59-92:71:
   | }
   | 
   | ///|
92 | fn project_datetime(value : @toml.TomlValue) -> @datetime.TomlDateTime? {
   |                                                           ^^^^^^^^^^^^
   |   match value {
   |     TomlDateTime(dt) => Some(dt)

<WORKDIR>/internal\qc_model\model.mbt:236:57-236:69:
    | }
    | 
    | ///|
236 | fn datetime_has_fractional_seconds(datetime : @datetime.TomlDateTime) -> Bool {
    |                                                         ^^^^^^^^^^^^
    |   match datetime {
    |     OffsetDateTime(text) | LocalDateTime(text) | LocalTime(text) =>

<WORKDIR>/internal\qc_model\shrink_test.mbt:52:28-52:40:
   | 
   | ///|
   | fn shrink_datetime_values(
52 |   values : Array[@datetime.TomlDateTime],
   |                            ^^^^^^^^^^^^
   | ) -> Iter[Array[@datetime.TomlDateTime]] {
   |   Array::makei(values.length(), fn(i) {

<WORKDIR>/internal\qc_model\shrink_test.mbt:53:27-53:39:
   | ///|
   | fn shrink_datetime_values(
   |   values : Array[@datetime.TomlDateTime],
53 | ) -> Iter[Array[@datetime.TomlDateTime]] {
   |                           ^^^^^^^^^^^^
   |   Array::makei(values.length(), fn(i) {
   |     let next = values.copy()

<WORKDIR>/internal\tokenize\token.mbt:22:27-22:39:
   |   IntegerToken(Int64, loc~ : Loc)
   |   FloatToken(Double, loc~ : Loc, raw~ : String)
   |   BooleanToken(Bool, loc~ : Loc)
22 |   DateTimeToken(@datetime.TomlDateTime, loc~ : Loc)
   |                           ^^^^^^^^^^^^
   | 
   |   // Symbols

<WORKDIR>/toml.mbt:16:27-16:39:
   | ///|
   | /// Re-export `TomlDateTime` so consumers see the type as `@toml.TomlDateTime`
   | /// instead of having to import the `datetime` subpackage directly.
16 | pub using @datetime {type TomlDateTime}
   |                           ^^^^^^^^^^^^
   | 
   | ///|

```
