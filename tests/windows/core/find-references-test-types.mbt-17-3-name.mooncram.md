# core find-references name test\types.mbt:17:3

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\core' moon ide find-references 'name' --loc 'test\types.mbt:17:3'
Found 2 references for symbol 'name':
<WORKDIR>/test\test.mbt:239:8-239:12:
    | ///|
    | /// Return the name of the test.
    | pub fn Test::name(self : Self) -> String {
239 |   self.name
    |        ^^^^
    | }

<WORKDIR>/test\types.mbt:27:5-27:9:
   | #as_free_fn
   | #as_free_fn(new, deprecated="Use `Test()` instead")
   | pub fn Test::Test(name : String) -> Test {
27 |   { name, buffer: StringBuilder(), }
   |     ^^^^
   | }

```
