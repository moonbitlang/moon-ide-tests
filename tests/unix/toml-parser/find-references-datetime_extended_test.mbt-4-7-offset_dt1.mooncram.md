# toml-parser find-references offset_dt1 datetime_extended_test.mbt:4:7

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
$ run_moon_ide moon ide find-references 'offset_dt1' --loc 'datetime_extended_test.mbt:4:7'
Found 4 references for symbol 'offset_dt1':
<WORKDIR>/datetime_extended_test.mbt:4:7-4:17:
  | ///|
  | /// Extended datetime tests for improved coverage
  | test "test TomlDateTime types and equality" {
4 |   let offset_dt1 = @datetime.OffsetDateTime("1979-05-27T07:32:00Z")
  |       ^^^^^^^^^^
  |   let offset_dt2 = @datetime.OffsetDateTime("1979-05-27T07:32:00Z")
  |   let offset_dt3 = @datetime.OffsetDateTime("1980-05-27T07:32:00Z")

<WORKDIR>/datetime_extended_test.mbt:7:17-7:27:
  |   let offset_dt1 = @datetime.OffsetDateTime("1979-05-27T07:32:00Z")
  |   let offset_dt2 = @datetime.OffsetDateTime("1979-05-27T07:32:00Z")
  |   let offset_dt3 = @datetime.OffsetDateTime("1980-05-27T07:32:00Z")
7 |   debug_inspect(offset_dt1 == offset_dt2, content="true")
  |                 ^^^^^^^^^^
  |   debug_inspect(offset_dt1 == offset_dt3, content="false")
  |   let local_dt = @datetime.LocalDateTime("1979-05-27T07:32:00")

<WORKDIR>/datetime_extended_test.mbt:8:17-8:27:
  |   let offset_dt2 = @datetime.OffsetDateTime("1979-05-27T07:32:00Z")
  |   let offset_dt3 = @datetime.OffsetDateTime("1980-05-27T07:32:00Z")
  |   debug_inspect(offset_dt1 == offset_dt2, content="true")
8 |   debug_inspect(offset_dt1 == offset_dt3, content="false")
  |                 ^^^^^^^^^^
  |   let local_dt = @datetime.LocalDateTime("1979-05-27T07:32:00")
  |   let local_date = @datetime.LocalDate("1979-05-27")

<WORKDIR>/datetime_extended_test.mbt:12:17-12:27:
   |   let local_dt = @datetime.LocalDateTime("1979-05-27T07:32:00")
   |   let local_date = @datetime.LocalDate("1979-05-27")
   |   let local_time = @datetime.LocalTime("07:32:00")
12 |   debug_inspect(offset_dt1 == local_dt, content="false")
   |                 ^^^^^^^^^^
   |   debug_inspect(local_dt == local_date, content="false")
   |   debug_inspect(local_date == local_time, content="false")

```
