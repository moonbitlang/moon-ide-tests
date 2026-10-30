# async rename _ignore_unused_import src\pipe\unimplemented_test.mbt:17:5

````mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../fixtures/repos/async' moon ide rename '_ignore_unused_import' '_ignore_unused_import_renamed' --loc 'src\pipe\unimplemented_test.mbt:17:5' --target js
*** Begin Patch
*** Update File: <WORKDIR>/src\pipe\unimplemented_test.mbt
@@
 
 ///|
 #cfg(not(target="native"))
-let _ignore_unused_import : Unit = {
+let _ignore_unused_import_renamed : Unit = {
   ignore(@async.sleep)
   ignore(@utf8.encode(""))
   ignore((f : async () -> Unit) => @test_util.assert_raise_async(f))
*** End Patch
"" (escaped)
````
