# core find-references fast_stream_run compress/flate/inflate_fast_wbtest.mbt:22:4

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' find-references 'fast_stream_run' --loc 'compress/flate/inflate_fast_wbtest.mbt:22:4'
Found 1 references for symbol 'fast_stream_run':
<WORKDIR>/compress/flate/inflate_fast_wbtest.mbt:284:11-284:26:
    |         ] {
    |         let (chunk, room, fixed) = schedule
    |         @test.assert_eq(
284 |           fast_stream_run(stream, chunk, room, fixed),
    |           ^^^^^^^^^^^^^^^
    |           Err(Corrupt),
    |         )
"" (escaped)
```
