# toml-parser find-references TomlDateTime datetime\datetime.mbt:14:15

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' find-references 'TomlDateTime' --loc 'datetime\datetime.mbt:14:15'
Found 19 references for symbol 'TomlDateTime':
<WORKDIR>/datetime\datetime.mbt:23:12-23:24:
   | 
   | ///|
   | #deprecated("compare with `==`; the Eq impl is unaffected")
23 | pub extend TomlDateTime with Eq::{not_equal, equal}
   |            ^^^^^^^^^^^^
   | 
   | ///|

<WORKDIR>/datetime\datetime.mbt:27:12-27:24:
   | 
   | ///|
   | #deprecated("render via the Debug trait, e.g. `debug_inspect`")
27 | pub extend TomlDateTime with Debug::{to_repr}
   |            ^^^^^^^^^^^^
   | 
   | ///|

<WORKDIR>/datetime\datetime.mbt:30:12-30:24:
   | pub extend TomlDateTime with Debug::{to_repr}
   | 
   | ///|
30 | pub extend TomlDateTime with Show::{to_string}
   |            ^^^^^^^^^^^^
   | 
   | ///|

<WORKDIR>/datetime\datetime.mbt:34:12-34:24:
   | 
   | ///|
   | #deprecated("render via the Show trait, e.g. `inspect` or `\\{value}`")
34 | pub extend TomlDateTime with Show::{output}
   |            ^^^^^^^^^^^^
   | 
   | ///|

<WORKDIR>/datetime\datetime.mbt:39:19-39:31:
   | ///|
   | /// Render the variant for human-readable diagnostics:
   | /// `OffsetDateTime("1979-05-27T07:32:00Z")` etc.
39 | pub impl Show for TomlDateTime with fn output(self, logger) {
   |                   ^^^^^^^^^^^^
   |   match self {
   |     OffsetDateTime(s) =>

<WORKDIR>/internal\qc_model\generator.mbt:256:48-256:60:
    | }
    | 
    | ///|
256 | fn local_date_gen() -> @qc.Generator[@datetime.TomlDateTime] {
    |                                                ^^^^^^^^^^^^
    |   date_string_gen().map(value => LocalDate(value))
    | }

<WORKDIR>/internal\qc_model\generator.mbt:261:48-261:60:
    | }
    | 
    | ///|
261 | fn local_time_gen() -> @qc.Generator[@datetime.TomlDateTime] {
    |                                                ^^^^^^^^^^^^
    |   time_string_gen().map(value => LocalTime(value))
    | }

<WORKDIR>/internal\qc_model\generator.mbt:266:52-266:64:
    | }
    | 
    | ///|
266 | fn local_datetime_gen() -> @qc.Generator[@datetime.TomlDateTime] {
    |                                                    ^^^^^^^^^^^^
    |   date_string_gen().zip_with(time_string_gen(), (date, time) => {
    |     LocalDateTime("\{date}T\{time}")

<WORKDIR>/internal\qc_model\generator.mbt:273:53-273:65:
    | }
    | 
    | ///|
273 | fn offset_datetime_gen() -> @qc.Generator[@datetime.TomlDateTime] {
    |                                                     ^^^^^^^^^^^^
    |   date_string_gen().zip_with3(time_string_gen(), offset_suffix_gen(), (
    |     date,

<WORKDIR>/internal\qc_model\generator.mbt:282:51-282:63:
    | }
    | 
    | ///|
282 | fn toml_datetime_gen() -> @qc.Generator[@datetime.TomlDateTime] {
    |                                                   ^^^^^^^^^^^^
    |   @qc.frequency([
    |     (2U, local_date_gen()),

<WORKDIR>/internal\qc_model\model.mbt:27:23-27:35:
   |   SString(String)
   |   SInteger(Int64)
   |   SBoolean(Bool)
27 |   SDateTime(@datetime.TomlDateTime)
   |                       ^^^^^^^^^^^^
   |   SDateTimeArray(Array[@datetime.TomlDateTime])
   |   SEmptyArray

<WORKDIR>/internal\qc_model\model.mbt:28:34-28:46:
   |   SInteger(Int64)
   |   SBoolean(Bool)
   |   SDateTime(@datetime.TomlDateTime)
28 |   SDateTimeArray(Array[@datetime.TomlDateTime])
   |                                  ^^^^^^^^^^^^
   |   SEmptyArray
   |   SStringArray(Array[String])

<WORKDIR>/internal\qc_model\model.mbt:100:59-100:71:
    | }
    | 
    | ///|
100 | fn project_datetime(value : @toml.TomlValue) -> @datetime.TomlDateTime? {
    |                                                           ^^^^^^^^^^^^
    |   match value {
    |     TomlDateTime(dt) => Some(dt)

<WORKDIR>/internal\qc_model\model.mbt:244:57-244:69:
    | }
    | 
    | ///|
244 | fn datetime_has_fractional_seconds(datetime : @datetime.TomlDateTime) -> Bool {
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

<WORKDIR>/internal\tokenize\token.mbt:32:27-32:39:
   |   IntegerToken(Int64, loc~ : Loc, raw~ : String)
   |   FloatToken(Double, loc~ : Loc, raw~ : String)
   |   BooleanToken(Bool, loc~ : Loc)
32 |   DateTimeToken(@datetime.TomlDateTime, loc~ : Loc)
   |                           ^^^^^^^^^^^^
   | 
   |   // Symbols

<WORKDIR>/internal\tokenize\tokenize.mbt:244:25-244:37:
    |   }
    |   validate_time(text.unsafe_view(start=11, end=offset_start))
    |   let datetime = text.unsafe_view(start=0, end=offset_start)
244 |   let value : @datetime.TomlDateTime = if offset_start == len {
    |                         ^^^^^^^^^^^^
    |     LocalDateTime(datetime.to_owned())
    |   } else if text[offset_start] is ('Z' | 'z') {

<WORKDIR>/toml.mbt:25:27-25:39:
   | ///|
   | /// Re-export `TomlDateTime` so consumers see the type as `@toml.TomlDateTime`
   | /// instead of having to import the `datetime` subpackage directly.
25 | pub using @datetime {type TomlDateTime}
   |                           ^^^^^^^^^^^^
   | 
   | ///|
"" (escaped)
```
