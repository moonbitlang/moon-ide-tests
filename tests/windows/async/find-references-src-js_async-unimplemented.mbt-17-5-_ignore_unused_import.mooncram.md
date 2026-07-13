# async find-references _ignore_unused_import src\js_async\unimplemented.mbt:17:5

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\async' moon ide find-references '_ignore_unused_import' --loc 'src\js_async\unimplemented.mbt:17:5'
Found 1 references for symbol '_ignore_unused_import':
<WORKDIR>/src\js_async\unimplemented.mbt:17:5-17:26:
   | 
   | ///|
   | #coverage.skip
17 | let _ignore_unused_import : Unit = {
   |     ^^^^^^^^^^^^^^^^^^^^^
   |   ignore(@coroutine.spawn)
   |   ignore(@event_loop.Timer::new)

```
