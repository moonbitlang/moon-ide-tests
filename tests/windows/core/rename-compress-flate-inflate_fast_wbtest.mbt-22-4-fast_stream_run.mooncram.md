# core rename fast_stream_run compress\flate\inflate_fast_wbtest.mbt:22:4

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\core' moon ide rename 'fast_stream_run' 'fast_stream_run_renamed' --loc 'compress\flate\inflate_fast_wbtest.mbt:22:4'
*** Begin Patch
*** Update File: <WORKDIR>/compress\flate\inflate_fast_wbtest.mbt
@@
 // same verdict on damaged streams.
 
 ///|
-fn fast_stream_run(
+fn fast_stream_run_renamed(
   input : Bytes,
   chunk : Int32,
   room : Int32,
@@
         ] {
         let (chunk, room, fixed) = schedule
         @test.assert_eq(
-          fast_stream_run(stream, chunk, room, fixed),
+          fast_stream_run_renamed(stream, chunk, room, fixed),
           Err(Corrupt),
         )
       }
*** End Patch

```
