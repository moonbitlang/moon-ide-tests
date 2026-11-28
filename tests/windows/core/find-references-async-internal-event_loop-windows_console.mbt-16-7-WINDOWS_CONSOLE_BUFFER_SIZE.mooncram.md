# core find-references WINDOWS_CONSOLE_BUFFER_SIZE async\internal\event_loop\windows_console.mbt:16:7

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' find-references 'WINDOWS_CONSOLE_BUFFER_SIZE' --loc 'async\internal\event_loop\windows_console.mbt:16:7'
Found 2 references for symbol 'WINDOWS_CONSOLE_BUFFER_SIZE':
<WORKDIR>/async\internal\event_loop\io.mbt:397:6-397:33:
    |   let offset = offset + cache_consumed
    |   let len = @cmp.minimum(
    |     len - cache_consumed,
397 |     (WINDOWS_CONSOLE_BUFFER_SIZE - cache_produced) / 2,
    |      ^^^^^^^^^^^^^^^^^^^^^^^^^^^
    |   )
    | 

<WORKDIR>/async\internal\event_loop\windows_console.mbt:66:32-66:59:
   | ) -> WindowsConsoleBuffer {
   |   if kind is Console && platform is Windows {
   |     {
66 |       buffer: FixedArray::make(WINDOWS_CONSOLE_BUFFER_SIZE, 0),
   |                                ^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |       buffer_offset: 0,
   |       buffer_len: 0,
"" (escaped)
```
