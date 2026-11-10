# core find-references fast_stream_run compress\flate\inflate_fast_wbtest.mbt:22:4

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\core' moon ide find-references 'fast_stream_run' --loc 'compress\flate\inflate_fast_wbtest.mbt:22:4'
Found 1 references for symbol 'fast_stream_run':
<WORKDIR>/compress\flate\inflate_fast_wbtest.mbt:280:11-280:26:
    |         ] {
    |         let (chunk, room, fixed) = schedule
    |         @test.assert_eq(
280 |           fast_stream_run(stream, chunk, room, fixed),
    |           ^^^^^^^^^^^^^^^
    |           Err(Corrupt),
    |         )

```
