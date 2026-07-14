# core rename from_int builtin\int64.mbt:31:15

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\core' moon ide rename 'from_int' 'from_int_renamed' --loc 'builtin\int64.mbt:31:15'
*** Begin Patch
*** Update File: <WORKDIR>/builtin\int64.mbt
@@
 ///
 /// ```mbt check
 /// test {
-///   inspect(Int64::from_int(42), content="42")
+///   inspect(Int64::from_int_renamed(42), content="42")
 /// }
 /// ```
-pub fn Int64::from_int(i : Int) -> Int64 {
+pub fn Int64::from_int_renamed(i : Int) -> Int64 {
   i.to_int64()
 }
 
*** Update File: <WORKDIR>/int64\README.mbt.md
@@
 test "basic operations" {
   let i : Int64 = -12345L // Int64 literal
   // You can also convert from an `Int` like so:
-  inspect(Int64::from_int(-12345) == i, content="true")
+  inspect(Int64::from_int_renamed(-12345) == i, content="true")
 
   // Max and min values
   inspect(@int64.MAX_VALUE, content="9223372036854775807")
*** Update File: <WORKDIR>/int64\int64_test.mbt
@@
 
 ///|
 test "Int64::from_int" {
-  inspect(Int64::from_int(1256), content="1256")
+  inspect(Int64::from_int_renamed(1256), content="1256")
 }
 
 ///|
 test "from_int" {
-  inspect(Int64::from_int(1256), content="1256")
+  inspect(Int64::from_int_renamed(1256), content="1256")
 }
 
 ///|
*** End Patch

```
