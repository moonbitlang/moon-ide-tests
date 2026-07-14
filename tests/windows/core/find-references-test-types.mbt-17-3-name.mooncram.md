# core find-references name test\types.mbt:17:3

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\core' moon ide find-references 'name' --loc 'test\types.mbt:17:3'
Found 3 references for symbol 'name':
<WORKDIR>/test\test.mbt:236:8-236:12:
    | ///|
    | /// Return the name of the test.
    | pub fn Test::name(self : Self) -> String {
236 |   self.name
    |        ^^^^
    | }

<WORKDIR>/test\types.mbt:17:3-17:7:
   | 
   | ///|
   | struct Test {
17 |   name : String
   |   ^^^^
   |   buffer : StringBuilder
   | } derive(@debug.Debug)

<WORKDIR>/test\types.mbt:27:5-27:9:
   | #as_free_fn
   | #as_free_fn(new, deprecated="Use `Test()` instead")
   | pub fn Test::Test(name : String) -> Test {
27 |   { name, buffer: StringBuilder() }
   |     ^^^^
   | }

```
