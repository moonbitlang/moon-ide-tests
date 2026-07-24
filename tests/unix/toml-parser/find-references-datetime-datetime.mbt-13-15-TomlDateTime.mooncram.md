# toml-parser find-references TomlDateTime datetime/datetime.mbt:13:15

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
$ run_moon_ide moon ide find-references 'TomlDateTime' --loc 'datetime/datetime.mbt:13:15'
Found 19 references for symbol 'TomlDateTime':
<WORKDIR>/datetime/datetime.mbt:13:15-13:27:
   | /// Values are stored as their original string form. The parser preserves
   | /// the spelling supplied in the TOML source; it does not normalize or
   | /// validate the underlying calendar arithmetic.
13 | pub(all) enum TomlDateTime {
   |               ^^^^^^^^^^^^
   |   OffsetDateTime(String)
   |   LocalDateTime(String)

<WORKDIR>/datetime/datetime.mbt:22:12-22:24:
   | 
   | ///|
   | #deprecated("compare with `==`; the Eq impl is unaffected")
22 | pub extend TomlDateTime with Eq::{not_equal, equal}
   |            ^^^^^^^^^^^^
   | 
   | ///|

<WORKDIR>/datetime/datetime.mbt:26:12-26:24:
   | 
   | ///|
   | #deprecated("render via the Debug trait, e.g. `debug_inspect`")
26 | pub extend TomlDateTime with Debug::{to_repr}
   |            ^^^^^^^^^^^^
   | 
   | ///|

<WORKDIR>/datetime/datetime.mbt:29:12-29:24:
   | pub extend TomlDateTime with Debug::{to_repr}
   | 
   | ///|
29 | pub extend TomlDateTime with Show::{to_string}
   |            ^^^^^^^^^^^^
   | 
   | ///|

<WORKDIR>/datetime/datetime.mbt:33:12-33:24:
   | 
   | ///|
   | #deprecated("render via the Show trait, e.g. `inspect` or `\\{value}`")
33 | pub extend TomlDateTime with Show::{output}
   |            ^^^^^^^^^^^^
   | 
   | ///|

<WORKDIR>/datetime/datetime.mbt:38:19-38:31:
   | ///|
   | /// Render the variant for human-readable diagnostics:
   | /// `OffsetDateTime("1979-05-27T07:32:00Z")` etc.
38 | pub impl Show for TomlDateTime with fn output(self, logger) {
   |                   ^^^^^^^^^^^^
   |   match self {
   |     OffsetDateTime(s) =>

<WORKDIR>/internal/qc_model/gen_test.mbt:270:43-270:55:
    | }
    | 
    | ///|
270 | fn local_date_gen() -> @gen.Gen[@datetime.TomlDateTime] {
    |                                           ^^^^^^^^^^^^
    |   date_string_gen().fmap(fn(value) { LocalDate(value) })
    | }

<WORKDIR>/internal/qc_model/gen_test.mbt:275:43-275:55:
    | }
    | 
    | ///|
275 | fn local_time_gen() -> @gen.Gen[@datetime.TomlDateTime] {
    |                                           ^^^^^^^^^^^^
    |   time_string_gen().fmap(fn(value) { LocalTime(value) })
    | }

<WORKDIR>/internal/qc_model/gen_test.mbt:280:47-280:59:
    | }
    | 
    | ///|
280 | fn local_datetime_gen() -> @gen.Gen[@datetime.TomlDateTime] {
    |                                               ^^^^^^^^^^^^
    |   @gen.liftA2(
    |     fn(date : String, time : String) { LocalDateTime("\{date}T\{time}") },

<WORKDIR>/internal/qc_model/gen_test.mbt:289:48-289:60:
    | }
    | 
    | ///|
289 | fn offset_datetime_gen() -> @gen.Gen[@datetime.TomlDateTime] {
    |                                                ^^^^^^^^^^^^
    |   @gen.liftA3(
    |     fn(date : String, time : String, offset : String) {

<WORKDIR>/internal/qc_model/gen_test.mbt:301:46-301:58:
    | }
    | 
    | ///|
301 | fn toml_datetime_gen() -> @gen.Gen[@datetime.TomlDateTime] {
    |                                              ^^^^^^^^^^^^
    |   @gen.frequency([
    |     (2U, local_date_gen()),

<WORKDIR>/internal/qc_model/model.mbt:25:23-25:35:
   |   SString(String)
   |   SInteger(Int64)
   |   SBoolean(Bool)
25 |   SDateTime(@datetime.TomlDateTime)
   |                       ^^^^^^^^^^^^
   |   SDateTimeArray(Array[@datetime.TomlDateTime])
   |   SEmptyArray

<WORKDIR>/internal/qc_model/model.mbt:26:34-26:46:
   |   SInteger(Int64)
   |   SBoolean(Bool)
   |   SDateTime(@datetime.TomlDateTime)
26 |   SDateTimeArray(Array[@datetime.TomlDateTime])
   |                                  ^^^^^^^^^^^^
   |   SEmptyArray
   |   SStringArray(Array[String])

<WORKDIR>/internal/qc_model/model.mbt:116:59-116:71:
    | }
    | 
    | ///|
116 | fn project_datetime(value : @toml.TomlValue) -> @datetime.TomlDateTime? {
    |                                                           ^^^^^^^^^^^^
    |   match value {
    |     TomlDateTime(dt) => Some(dt)

<WORKDIR>/internal/qc_model/model.mbt:260:57-260:69:
    | }
    | 
    | ///|
260 | fn datetime_has_fractional_seconds(datetime : @datetime.TomlDateTime) -> Bool {
    |                                                         ^^^^^^^^^^^^
    |   match datetime {
    |     OffsetDateTime(text) | LocalDateTime(text) | LocalTime(text) =>

<WORKDIR>/internal/qc_model/shrink_test.mbt:52:28-52:40:
   | 
   | ///|
   | fn shrink_datetime_values(
52 |   values : Array[@datetime.TomlDateTime],
   |                            ^^^^^^^^^^^^
   | ) -> Iter[Array[@datetime.TomlDateTime]] {
   |   Array::makei(values.length(), fn(i) {

<WORKDIR>/internal/qc_model/shrink_test.mbt:53:27-53:39:
   | ///|
   | fn shrink_datetime_values(
   |   values : Array[@datetime.TomlDateTime],
53 | ) -> Iter[Array[@datetime.TomlDateTime]] {
   |                           ^^^^^^^^^^^^
   |   Array::makei(values.length(), fn(i) {
   |     let next = values.copy()

<WORKDIR>/internal/tokenize/token.mbt:30:27-30:39:
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
