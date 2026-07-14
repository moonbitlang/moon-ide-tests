# toml-parser rename offset_dt1 datetime_extended_test.mbt:4:7

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\toml-parser' moon ide rename 'offset_dt1' 'offset_dt1_renamed' --loc 'datetime_extended_test.mbt:4:7'
*** Begin Patch
*** Update File: <WORKDIR>/datetime_extended_test.mbt
@@
 ///|
 /// Extended datetime tests for improved coverage
 test "test TomlDateTime types and equality" {
-  let offset_dt1 = @datetime.OffsetDateTime("1979-05-27T07:32:00Z")
+  let offset_dt1_renamed = @datetime.OffsetDateTime("1979-05-27T07:32:00Z")
   let offset_dt2 = @datetime.OffsetDateTime("1979-05-27T07:32:00Z")
   let offset_dt3 = @datetime.OffsetDateTime("1980-05-27T07:32:00Z")
-  debug_inspect(offset_dt1 == offset_dt2, content="true")
+  debug_inspect(offset_dt1_renamed == offset_dt2, content="true")
-  debug_inspect(offset_dt1 == offset_dt3, content="false")
+  debug_inspect(offset_dt1_renamed == offset_dt3, content="false")
   let local_dt = @datetime.LocalDateTime("1979-05-27T07:32:00")
   let local_date = @datetime.LocalDate("1979-05-27")
   let local_time = @datetime.LocalTime("07:32:00")
-  debug_inspect(offset_dt1 == local_dt, content="false")
+  debug_inspect(offset_dt1_renamed == local_dt, content="false")
   debug_inspect(local_dt == local_date, content="false")
   debug_inspect(local_date == local_time, content="false")
 }
*** End Patch

```
