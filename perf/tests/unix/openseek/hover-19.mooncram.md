# openseek hover

```mooncram
$ moonx '../../../../scripts/bench-moon-ide.mbtx' hover 'event' --loc 'protocol/emit/emit_test.mbt:6:9' --target native --no-check
/// it to — the real path, so the bytes are the contract. There is no log
/// envelope: events no longer go through `@xlog`, so no `timestamp`, `source`,
/// or `category` on the line.
fn wire(event : @protocol.Event) -> String raise {
        ^^^^^
        ```moonbit
        @protocol.Event
        ```
  @emit.open()
  // A line an earlier emit in this process left behind is not this event's.
```
