# core find-references WINDOWS_CONSOLE_BUFFER_SIZE async\internal\event_loop\windows_console.mbt:16:7

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\core' moon ide find-references 'WINDOWS_CONSOLE_BUFFER_SIZE' --loc 'async\internal\event_loop\windows_console.mbt:16:7'
Found 3 references for symbol 'WINDOWS_CONSOLE_BUFFER_SIZE':
<WORKDIR>/async\internal\event_loop\io.mbt:181:5-181:32:
    |     0
    |   }
    |   let max_read_len = @cmp.minimum(
181 |     WINDOWS_CONSOLE_BUFFER_SIZE - unpaired_offset,
    |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^
    |     @cmp.maximum(len / 3, 1),
    |   )

<WORKDIR>/async\internal\event_loop\io.mbt:401:6-401:33:
    |   let offset = offset + cache_consumed
    |   let len = @cmp.minimum(
    |     len - cache_consumed,
401 |     (WINDOWS_CONSOLE_BUFFER_SIZE - cache_produced) / 2,
    |      ^^^^^^^^^^^^^^^^^^^^^^^^^^^
    |   )
    | 

<WORKDIR>/async\internal\event_loop\windows_console.mbt:52:32-52:59:
   | ) -> WindowsConsoleBuffer {
   |   if kind is Console && platform is Windows {
   |     {
52 |       buffer: FixedArray::make(WINDOWS_CONSOLE_BUFFER_SIZE, 0),
   |                                ^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |       unpaired_surrogate: 0,
   |       pending: FixedArray::make(4, 0),

```
