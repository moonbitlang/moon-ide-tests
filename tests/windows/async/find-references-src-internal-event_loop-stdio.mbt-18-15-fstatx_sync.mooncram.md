# async find-references fstatx_sync src\internal\event_loop\stdio.mbt:18:15

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\async' moon ide find-references 'fstatx_sync' --loc 'src\internal\event_loop\stdio.mbt:18:15'
Found 1 references for symbol 'fstatx_sync':
<WORKDIR>/src\internal\event_loop\stdio.mbt:32:6-32:17:
   |   context~ : String,
   | ) -> @fd_util.FileKind raise {
   |   let buf = FixedArray::make(16, b'\x00')
32 |   if fstatx_sync(fd, STAT_FILE_KIND, buf, buf.length()) < 0 {
   |      ^^^^^^^^^^^
   |     @os_error.check_errno(context)
   |   }

```
