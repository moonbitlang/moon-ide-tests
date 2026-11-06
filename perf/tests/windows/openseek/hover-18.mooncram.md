# openseek hover

````mooncram
$ moonx '../../../../scripts/bench-moon-ide.mbtx' hover 'wire' --loc 'protocol/emit/emit_test.mbt:6:4' --target native --no-check
/// it to — the real path, so the bytes are the contract. There is no log
/// envelope: events no longer go through `@xlog`, so no `timestamp`, `source`,
/// or `category` on the line.
fn wire(event : @protocol.Event) -> String raise {
   ^^^^
   ```moonbit
   fn wire(event : @protocol.Event) -> String raise
   ```
   ---
   
    The event's line as it reaches stdout, read back off the sink `emit` wrote
    it to — the real path, so the bytes are the contract. There is no log
    envelope: events no longer go through `@xlog`, so no `timestamp`, `source`,
    or `category` on the line.
  @emit.open()
  // A line an earlier emit in this process left behind is not this event's.
````
