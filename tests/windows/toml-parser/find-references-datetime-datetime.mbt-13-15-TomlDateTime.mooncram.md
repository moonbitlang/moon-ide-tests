# toml-parser find-references TomlDateTime datetime\datetime.mbt:13:15

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\toml-parser' moon ide find-references 'TomlDateTime' --loc 'datetime\datetime.mbt:13:15'
Found 18 references for symbol 'TomlDateTime':
<WORKDIR>/datetime\datetime.mbt:22:12-22:24:
   | 
   | ///|
   | #deprecated("compare with `==`; the Eq impl is unaffected")
22 | pub extend TomlDateTime with Eq::{not_equal, equal}
   |            ^^^^^^^^^^^^
   | 
   | ///|

<WORKDIR>/datetime\datetime.mbt:26:12-26:24:
   | 
   | ///|
   | #deprecated("render via the Debug trait, e.g. `debug_inspect`")
26 | pub extend TomlDateTime with Debug::{to_repr}
   |            ^^^^^^^^^^^^
   | 
   | ///|

<WORKDIR>/datetime\datetime.mbt:29:12-29:24:
   | pub extend TomlDateTime with Debug::{to_repr}
   | 
   | ///|
29 | pub extend TomlDateTime with Show::{to_string}
   |            ^^^^^^^^^^^^
   | 
   | ///|

<WORKDIR>/datetime\datetime.mbt:33:12-33:24:
   | 
   | ///|
   | #deprecated("render via the Show trait, e.g. `inspect` or `\\{value}`")
33 | pub extend TomlDateTime with Show::{output}
   |            ^^^^^^^^^^^^
   | 
   | ///|

<WORKDIR>/datetime\datetime.mbt:38:19-38:31:
   | ///|
   | /// Render the variant for human-readable diagnostics:
   | /// `OffsetDateTime("1979-05-27T07:32:00Z")` etc.
38 | pub impl Show for TomlDateTime with fn output(self, logger) {
   |                   ^^^^^^^^^^^^
   |   match self {
   |     OffsetDateTime(s) =>

<WORKDIR>/internal\qc_model\generator.mbt:268:48-268:60:
    | }
    | 
    | ///|
268 | fn local_date_gen() -> @qc.Generator[@datetime.TomlDateTime] {
    |                                                ^^^^^^^^^^^^
    |   date_string_gen().map(value => LocalDate(value))
    | }

<WORKDIR>/internal\qc_model\generator.mbt:273:48-273:60:
    | }
    | 
    | ///|
273 | fn local_time_gen() -> @qc.Generator[@datetime.TomlDateTime] {
    |                                                ^^^^^^^^^^^^
    |   time_string_gen().map(value => LocalTime(value))
    | }

<WORKDIR>/internal\qc_model\generator.mbt:278:52-278:64:
    | }
    | 
    | ///|
278 | fn local_datetime_gen() -> @qc.Generator[@datetime.TomlDateTime] {
    |                                                    ^^^^^^^^^^^^
    |   date_string_gen().zip_with(time_string_gen(), (date, time) => {
    |     LocalDateTime("\{date}T\{time}")

<WORKDIR>/internal\qc_model\generator.mbt:285:53-285:65:
    | }
    | 
    | ///|
285 | fn offset_datetime_gen() -> @qc.Generator[@datetime.TomlDateTime] {
    |                                                     ^^^^^^^^^^^^
    |   date_string_gen().zip_with3(time_string_gen(), offset_suffix_gen(), (
    |     date,

<WORKDIR>/internal\qc_model\generator.mbt:294:51-294:63:
    | }
    | 
    | ///|
294 | fn toml_datetime_gen() -> @qc.Generator[@datetime.TomlDateTime] {
    |                                                   ^^^^^^^^^^^^
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

<WORKDIR>/internal\qc_model\model.mbt:98:59-98:71:
   | }
   | 
   | ///|
98 | fn project_datetime(value : @toml.TomlValue) -> @datetime.TomlDateTime? {
   |                                                           ^^^^^^^^^^^^
   |   match value {
   |     TomlDateTime(dt) => Some(dt)

<WORKDIR>/internal\qc_model\model.mbt:242:57-242:69:
    | }
    | 
    | ///|
242 | fn datetime_has_fractional_seconds(datetime : @datetime.TomlDateTime) -> Bool {
    |                                                         ^^^^^^^^^^^^
    |   match datetime {
    |     OffsetDateTime(text) | LocalDateTime(text) | LocalTime(text) =>

<WORKDIR>/internal\qc_model\shrink.mbt:55:28-55:40:
   | 
   | ///|
   | fn shrink_datetime_values(
55 |   values : Array[@datetime.TomlDateTime],
   |                            ^^^^^^^^^^^^
   | ) -> Iter[Array[@datetime.TomlDateTime]] {
   |   Array::makei(values.length(), i => {

<WORKDIR>/internal\qc_model\shrink.mbt:56:27-56:39:
   | ///|
   | fn shrink_datetime_values(
   |   values : Array[@datetime.TomlDateTime],
56 | ) -> Iter[Array[@datetime.TomlDateTime]] {
   |                           ^^^^^^^^^^^^
   |   Array::makei(values.length(), i => {
   |     let next = values.copy()

<WORKDIR>/internal\tokenize\token.mbt:30:27-30:39:
   |   IntegerToken(Int64, loc~ : Loc, raw~ : String)
   |   FloatToken(Double, loc~ : Loc, raw~ : String)
   |   BooleanToken(Bool, loc~ : Loc)
30 |   DateTimeToken(@datetime.TomlDateTime, loc~ : Loc)
   |                           ^^^^^^^^^^^^
   | 
   |   // Symbols

<WORKDIR>/toml.mbt:24:27-24:39:
   | ///|
   | /// Re-export `TomlDateTime` so consumers see the type as `@toml.TomlDateTime`
   | /// instead of having to import the `datetime` subpackage directly.
24 | pub using @datetime {type TomlDateTime}
   |                           ^^^^^^^^^^^^
   | 
   | ///|

```
