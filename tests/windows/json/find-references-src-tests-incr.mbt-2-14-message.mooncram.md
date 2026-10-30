# json find-references message src\tests\incr.mbt:2:14

````mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../fixtures/repos/json' moon ide find-references 'message' --loc 'src\tests\incr.mbt:2:14'
Found 1 references for symbol 'message':
<WORKDIR>/src\tests\incr.mbt:3:36-3:43:
  | ///|
  | fn incr_fail(message : String) -> Unit raise {
3 |   raise InspectError::InspectError(message)
  |                                    ^^^^^^^
  | }
  | 
"" (escaped)
````
