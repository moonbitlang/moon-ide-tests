# openseek rename event protocol/emit/emit_test.mbt:6:9

```mooncram
$ moonx '../../../../scripts/bench-moon-ide.mbtx' rename 'event' 'event_renamed' --loc 'protocol/emit/emit_test.mbt:6:9' --target native --no-check
*** Begin Patch
*** Update File: e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\protocol\emit\emit_test.mbt
@@
 /// it to — the real path, so the bytes are the contract. There is no log
 /// envelope: events no longer go through `@xlog`, so no `timestamp`, `source`,
 /// or `category` on the line.
-fn wire(event : @protocol.Event) -> String raise {
+fn wire(event_renamed : @protocol.Event) -> String raise {
   @emit.open()
   // A line an earlier emit in this process left behind is not this event's.
   while @emit.poll_line() is Some(_) {
 
   }
-  @emit.emit(event)
+  @emit.emit(event_renamed)
   guard @emit.poll_line() is Some(line) else { fail("emit wrote no line") }
   line
 }
*** End Patch
"" (escaped)
```
