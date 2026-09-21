# core find-references from_int builtin\int64.mbt:44:15

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\core' moon ide find-references 'from_int' --loc 'builtin\int64.mbt:44:15'
Found 4 references for symbol 'from_int':
<WORKDIR>/builtin\int64.mbt:41:22-41:30:
   | ///
   | /// ```mbt check
   | /// test {
41 | ///   inspect(Int64::from_int(42), content="42")
   |                      ^^^^^^^^
   | /// }
   | /// ```

<WORKDIR>/int64\README.mbt.md:14:18-14:26:
   | test "basic operations" {
   |   let i : Int64 = -12345L // Int64 literal
   |   // You can also convert from an `Int` like so:
14 |   inspect(Int64::from_int(-12345) == i, content="true")
   |                  ^^^^^^^^
   | 
   |   // Max and min values

<WORKDIR>/int64\int64_test.mbt:25:18-25:26:
   | 
   | ///|
   | test "Int64::from_int" {
25 |   inspect(Int64::from_int(1256), content="1256")
   |                  ^^^^^^^^
   | }
   | 

<WORKDIR>/int64\int64_test.mbt:30:18-30:26:
   | 
   | ///|
   | test "from_int" {
30 |   inspect(Int64::from_int(1256), content="1256")
   |                  ^^^^^^^^
   | }
   | 

```
