# openseek find-references event protocol/emit/emit_test.mbt:6:9

```mooncram
$ moonx '../../../../scripts/bench-moon-ide.mbtx' find-references 'event' --loc 'protocol/emit/emit_test.mbt:6:9' --target native --no-check
Found 1 references for symbol 'event':
e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\protocol\emit\emit_test.mbt:12:14-12:19:
   |   while @emit.poll_line() is Some(_) {
   | 
   |   }
12 |   @emit.emit(event)
   |              ^^^^^
   |   guard @emit.poll_line() is Some(line) else { fail("emit wrote no line") }
   |   line
"" (escaped)
```
