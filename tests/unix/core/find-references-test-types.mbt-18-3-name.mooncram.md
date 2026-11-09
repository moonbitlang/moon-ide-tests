# core find-references name test/types.mbt:18:3

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../fixtures/repos/core' moon ide find-references 'name' --loc 'test/types.mbt:18:3'
Found 2 references for symbol 'name':
<WORKDIR>/test/test.mbt:271:8-271:12:
    | ///|
    | /// Return the name of the test.
    | pub fn Test::name(self : Self) -> String {
271 |   self.name
    |        ^^^^
    | }

<WORKDIR>/test/types.mbt:28:5-28:9:
   | #as_free_fn
   | #as_free_fn(new, deprecated="Use `Test()` instead")
   | pub fn Test::Test(name : String) -> Test {
28 |   { name, buffer: StringBuilder(), }
   |     ^^^^
   | }
"" (escaped)
```
