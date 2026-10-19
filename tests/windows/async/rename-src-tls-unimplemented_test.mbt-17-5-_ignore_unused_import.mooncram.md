# async rename _ignore_unused_import src\tls\unimplemented_test.mbt:17:5

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\async' moon ide rename '_ignore_unused_import' '_ignore_unused_import_renamed' --loc 'src\tls\unimplemented_test.mbt:17:5' --target js
*** Begin Patch
*** Update File: <WORKDIR>/src\tls\unimplemented_test.mbt
@@
 
 ///|
 #cfg(not(any(target="native", target="wasm")))
-let _ignore_unused_import : Unit = {
+let _ignore_unused_import_renamed : Unit = {
   ignore(@utf8.encode(""))
   ignore(@async.sleep)
   ignore(@socket.unimplemented)
*** End Patch

```
