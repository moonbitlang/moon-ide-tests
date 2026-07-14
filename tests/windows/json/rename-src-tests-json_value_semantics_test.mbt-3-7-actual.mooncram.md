# json rename actual src\tests\json_value_semantics_test.mbt:3:7

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\json' moon ide rename 'actual' 'actual_renamed' --loc 'src\tests\json_value_semantics_test.mbt:3:7'
*** Begin Patch
*** Update File: <WORKDIR>/src\tests\json_value_semantics_test.mbt
@@
 ///|
 test "json value semantics basics" {
-  let actual = @json.decode("[false,1,\"x\",null,{\"a\":true}]")
+  let actual_renamed = @json.decode("[false,1,\"x\",null,{\"a\":true}]")
   let expected = Json::array([
     Json::boolean(false),
     Json::number(1.0),
@@
     Json::null(),
     Json::object({ "a": Json::boolean(true) }),
   ])
-  @debug.assert_eq(actual, expected)
+  @debug.assert_eq(actual_renamed, expected)
 }
 
 ///|
*** End Patch

```
