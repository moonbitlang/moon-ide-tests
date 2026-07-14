# core rename name test\types.mbt:17:3

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\core' moon ide rename 'name' 'name_renamed' --loc 'test\types.mbt:17:3'
*** Begin Patch
*** Update File: <WORKDIR>/test\test.mbt
@@
 ///|
 /// Return the name of the test.
 pub fn Test::name(self : Self) -> String {
-  self.name
+  self.name_renamed
 }
*** Update File: <WORKDIR>/test\types.mbt
@@
 
 ///|
 struct Test {
-  name : String
+  name_renamed : String
   buffer : StringBuilder
 } derive(@debug.Debug)
 
@@
 #as_free_fn
 #as_free_fn(new, deprecated="Use `Test()` instead")
 pub fn Test::Test(name : String) -> Test {
-  { name, buffer: StringBuilder() }
+  { name_renamed: name, buffer: StringBuilder() }
 }
*** End Patch

```
