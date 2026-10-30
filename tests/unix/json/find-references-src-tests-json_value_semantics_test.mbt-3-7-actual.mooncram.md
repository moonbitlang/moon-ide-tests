# json find-references actual src/tests/json_value_semantics_test.mbt:3:7

````mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../fixtures/repos/json' moon ide find-references 'actual' --loc 'src/tests/json_value_semantics_test.mbt:3:7'
Found 1 references for symbol 'actual':
<WORKDIR>/src/tests/json_value_semantics_test.mbt:11:20-11:26:
   |     Json::null(),
   |     Json::object({ "a": Json::boolean(true) }),
   |   ])
11 |   @debug.assert_eq(actual, expected)
   |                    ^^^^^^
   | }
   | 
"" (escaped)
````
