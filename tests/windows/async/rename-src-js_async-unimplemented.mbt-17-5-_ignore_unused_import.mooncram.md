# async rename _ignore_unused_import src\js_async\unimplemented.mbt:17:5

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\async' moon ide rename '_ignore_unused_import' '_ignore_unused_import_renamed' --loc 'src\js_async\unimplemented.mbt:17:5'
*** Begin Patch
*** Update File: <WORKDIR>/src\js_async\unimplemented.mbt
@@
 
 ///|
 #coverage.skip
-let _ignore_unused_import : Unit = {
+let _ignore_unused_import_renamed : Unit = {
   ignore(@coroutine.spawn)
   ignore(@event_loop.Timer::new)
 }
*** End Patch

```
