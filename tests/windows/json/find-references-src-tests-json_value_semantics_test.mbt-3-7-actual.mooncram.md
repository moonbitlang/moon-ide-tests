# json find-references actual src\tests\json_value_semantics_test.mbt:3:7

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\json' moon ide find-references 'actual' --loc 'src\tests\json_value_semantics_test.mbt:3:7'
Found 2 references for symbol 'actual':
<WORKDIR>/src\tests\json_value_semantics_test.mbt:3:7-3:13:
  | ///|
  | test "json value semantics basics" {
3 |   let actual = @json.decode("[false,1,\"x\",null,{\"a\":true}]")
  |       ^^^^^^
  |   let expected = Json::array([
  |     Json::boolean(false),

<WORKDIR>/src\tests\json_value_semantics_test.mbt:11:20-11:26:
   |     Json::null(),
   |     Json::object({ "a": Json::boolean(true) }),
   |   ])
11 |   @debug.assert_eq(actual, expected)
   |                    ^^^^^^
   | }
   | 

```
