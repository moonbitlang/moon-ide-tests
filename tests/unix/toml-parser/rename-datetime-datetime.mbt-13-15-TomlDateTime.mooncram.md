# toml-parser rename TomlDateTime datetime/datetime.mbt:13:15

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
$ run_moon_ide moon ide rename 'TomlDateTime' 'TomlDateTimeRenamed' --loc 'datetime/datetime.mbt:13:15'
*** Begin Patch
*** Update File: <WORKDIR>/datetime/datetime.mbt
@@
 /// Values are stored as their original string form. The parser preserves
 /// the spelling supplied in the TOML source; it does not normalize or
 /// validate the underlying calendar arithmetic.
-pub(all) enum TomlDateTime {
+pub(all) enum TomlDateTimeRenamed {
   OffsetDateTime(String)
   LocalDateTime(String)
   LocalDate(String)
@@
 
 ///|
 #deprecated("compare with `==`; the Eq impl is unaffected")
-pub extend TomlDateTime with Eq::{not_equal, equal}
+pub extend TomlDateTimeRenamed with Eq::{not_equal, equal}
 
 ///|
 #deprecated("render via the Debug trait, e.g. `debug_inspect`")
-pub extend TomlDateTime with Debug::{to_repr}
+pub extend TomlDateTimeRenamed with Debug::{to_repr}
 
 ///|
-pub extend TomlDateTime with Show::{to_string}
+pub extend TomlDateTimeRenamed with Show::{to_string}
 
 ///|
 #deprecated("render via the Show trait, e.g. `inspect` or `\\{value}`")
-pub extend TomlDateTime with Show::{output}
+pub extend TomlDateTimeRenamed with Show::{output}
 
 ///|
 /// Render the variant for human-readable diagnostics:
 /// `OffsetDateTime("1979-05-27T07:32:00Z")` etc.
-pub impl Show for TomlDateTime with fn output(self, logger) {
+pub impl Show for TomlDateTimeRenamed with fn output(self, logger) {
   match self {
     OffsetDateTime(s) =>
       logger <+
*** Update File: <WORKDIR>/internal/qc_model/gen_test.mbt
@@
 }
 
 ///|
-fn local_date_gen() -> @gen.Gen[@datetime.TomlDateTime] {
+fn local_date_gen() -> @gen.Gen[@datetime.TomlDateTimeRenamed] {
   date_string_gen().fmap(fn(value) { LocalDate(value) })
 }
 
 ///|
-fn local_time_gen() -> @gen.Gen[@datetime.TomlDateTime] {
+fn local_time_gen() -> @gen.Gen[@datetime.TomlDateTimeRenamed] {
   time_string_gen().fmap(fn(value) { LocalTime(value) })
 }
 
 ///|
-fn local_datetime_gen() -> @gen.Gen[@datetime.TomlDateTime] {
+fn local_datetime_gen() -> @gen.Gen[@datetime.TomlDateTimeRenamed] {
   @gen.liftA2(
     fn(date : String, time : String) { LocalDateTime("\{date}T\{time}") },
     date_string_gen(),
@@
 }
 
 ///|
-fn offset_datetime_gen() -> @gen.Gen[@datetime.TomlDateTime] {
+fn offset_datetime_gen() -> @gen.Gen[@datetime.TomlDateTimeRenamed] {
   @gen.liftA3(
     fn(date : String, time : String, offset : String) {
       OffsetDateTime("\{date}T\{time}\{offset}")
@@
 }
 
 ///|
-fn toml_datetime_gen() -> @gen.Gen[@datetime.TomlDateTime] {
+fn toml_datetime_gen() -> @gen.Gen[@datetime.TomlDateTimeRenamed] {
   @gen.frequency([
     (2U, local_date_gen()),
     (2U, local_time_gen()),
*** Update File: <WORKDIR>/internal/qc_model/model.mbt
@@
   SString(String)
   SInteger(Int64)
   SBoolean(Bool)
-  SDateTime(@datetime.TomlDateTime)
+  SDateTime(@datetime.TomlDateTimeRenamed)
-  SDateTimeArray(Array[@datetime.TomlDateTime])
+  SDateTimeArray(Array[@datetime.TomlDateTimeRenamed])
   SEmptyArray
   SStringArray(Array[String])
   SIntegerArray(Array[Int64])
@@
 }
 
 ///|
-fn project_datetime(value : @toml.TomlValue) -> @datetime.TomlDateTime? {
+fn project_datetime(value : @toml.TomlValue) -> @datetime.TomlDateTimeRenamed? {
   match value {
     TomlDateTime(dt) => Some(dt)
     _ => None
@@
 }
 
 ///|
-fn datetime_has_fractional_seconds(datetime : @datetime.TomlDateTime) -> Bool {
+fn datetime_has_fractional_seconds(datetime : @datetime.TomlDateTimeRenamed) -> Bool {
   match datetime {
     OffsetDateTime(text) | LocalDateTime(text) | LocalTime(text) =>
       text.contains(".")
*** Update File: <WORKDIR>/internal/qc_model/shrink_test.mbt
@@
 
 ///|
 fn shrink_datetime_values(
-  values : Array[@datetime.TomlDateTime],
+  values : Array[@datetime.TomlDateTimeRenamed],
-) -> Iter[Array[@datetime.TomlDateTime]] {
+) -> Iter[Array[@datetime.TomlDateTimeRenamed]] {
   Array::makei(values.length(), fn(i) {
     let next = values.copy()
     next.remove(i) |> ignore
*** Update File: <WORKDIR>/internal/tokenize/token.mbt
@@
   IntegerToken(Int64, loc~ : Loc, raw~ : String)
   FloatToken(Double, loc~ : Loc, raw~ : String)
   BooleanToken(Bool, loc~ : Loc)
-  DateTimeToken(@datetime.TomlDateTime, loc~ : Loc)
+  DateTimeToken(@datetime.TomlDateTimeRenamed, loc~ : Loc)
 
   // Symbols
   LeftBracket(loc~ : Loc) // [
*** Update File: <WORKDIR>/toml.mbt
@@
 ///|
 /// Re-export `TomlDateTime` so consumers see the type as `@toml.TomlDateTime`
 /// instead of having to import the `datetime` subpackage directly.
-pub using @datetime {type TomlDateTime}
+pub using @datetime {type TomlDateTimeRenamed}
 
 ///|
 /// Extract datetime variant name and value string from a TomlDateTime value.
*** End Patch

```
