# openseek peek-def

```mooncram
$ moonx '../../../../scripts/bench-moon-ide.mbtx' peek-def 'wire' --loc 'protocol/emit/emit_test.mbt:6:4' --target native --no-check
Definition found at file e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\protocol\emit\emit_test.mbt
  | ///|
  | /// The event's line as it reaches stdout, read back off the sink `emit` wrote
  | /// it to — the real path, so the bytes are the contract. There is no log
  | /// envelope: events no longer go through `@xlog`, so no `timestamp`, `source`,
  | /// or `category` on the line.
6 | fn wire(event : @protocol.Event) -> String raise {
  |    ^^^^
  |   @emit.open()
  |   // A line an earlier emit in this process left behind is not this event's.
  |   while @emit.poll_line() is Some(_) {
  | 
  |   }
  |   @emit.emit(event)
  |   guard @emit.poll_line() is Some(line) else { fail("emit wrote no line") }
  |   line
  | }
  | 
  | ///|
  | /// The sink drops events until it is opened and again once it is closed, so a
  | /// process that never drains — a report-printing command, a test binary —
  | /// cannot accumulate lines nobody reads.
```
