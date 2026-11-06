# openseek rename wire protocol/emit/emit_test.mbt:6:4

```mooncram
$ moonx '../../../../scripts/bench-moon-ide.mbtx' rename 'wire' 'wire_renamed' --loc 'protocol/emit/emit_test.mbt:6:4' --target native --no-check
*** Begin Patch
*** Update File: e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\protocol\emit\emit_test.mbt
@@
 /// it to — the real path, so the bytes are the contract. There is no log
 /// envelope: events no longer go through `@xlog`, so no `timestamp`, `source`,
 /// or `category` on the line.
-fn wire(event : @protocol.Event) -> String raise {
+fn wire_renamed(event : @protocol.Event) -> String raise {
   @emit.open()
   // A line an earlier emit in this process left behind is not this event's.
   while @emit.poll_line() is Some(_) {
@@
 /// this failing, which is the property the package exists to provide.
 test "every event round-trips through emit and parse" {
   for event in all_events() {
-    let encoded = @json.parse(wire(event))
+    let encoded = @json.parse(wire_renamed(event))
     assert_eq(@protocol.parse(encoded), Some(event))
   }
 }
@@
 /// costs nothing and keeps one variant per event.
 test "optional payload fields are written as null, never omitted" {
   inspect(
-    wire(
+    wire_renamed(
       ToolResult(
         tool_call_id="call_2",
         tool_name="shell",
@@
   // A present value is the bare string. MoonBit's own `Some(v)` encoding is the
   // one-element array `[v]`, which would read as absent to every decoder.
   inspect(
-    wire(
+    wire_renamed(
       ToolResult(
         tool_call_id="call_1",
         tool_name="read",
@@
     ),
   )
   inspect(
-    wire(GoalUpdated(goal=None)),
+    wire_renamed(GoalUpdated(goal=None)),
     content=(
       #|{"event":"goal_updated","goal":null}
     ),
@@
 /// from the provider layer.
 test "usage carries the protocol struct verbatim" {
   inspect(
-    wire(Usage(usage=usage_sample())),
+    wire_renamed(Usage(usage=usage_sample())),
     content=(
       #|{"event":"usage","usage":{"prompt_tokens":11,"completion_tokens":22,"total_tokens":33,"prompt_cache_hit_tokens":4,"prompt_cache_miss_tokens":7}}
     ),
@@
 /// for new ones.
 test "session_started still writes workspace_root as a bare string" {
   inspect(
-    wire(
+    wire_renamed(
       SessionStarted(
         session="cli-1",
         session_root=".openseek",
@@
 /// wants a severity derives it from the variant it decoded.
 test "the wire line has no log envelope" {
   for event in all_events() {
-    guard @json.parse(wire(event)) is Object(fields) else {
+    guard @json.parse(wire_renamed(event)) is Object(fields) else {
       fail("expected an object")
     }
     assert_false(fields.contains("timestamp"))
@@
       SteerDropped(content~, submission_id=Some("mixed-steer")),
     ]
     for event in events {
-      let json = @json.parse(wire(event))
+      let json = @json.parse(wire_renamed(event))
       assert_true(json is { "content": Array(_), .. })
       assert_eq(@protocol.parse(json), Some(event))
     }
@@
   }
   assert_eq(
     @json.parse(
-      wire(
+      wire_renamed(
         SteerApplied(
           kind="prompt",
           content=Content([Text("old client")]),
*** End Patch
"" (escaped)
```
