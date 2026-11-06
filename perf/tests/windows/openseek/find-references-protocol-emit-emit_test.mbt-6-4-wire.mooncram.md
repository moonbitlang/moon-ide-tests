# openseek find-references wire protocol/emit/emit_test.mbt:6:4

```mooncram
$ moonx '../../../../scripts/bench-moon-ide.mbtx' find-references 'wire' --loc 'protocol/emit/emit_test.mbt:6:4' --target native --no-check
Found 9 references for symbol 'wire':
e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\protocol\emit\emit_test.mbt:193:31-193:35:
    | /// this failing, which is the property the package exists to provide.
    | test "every event round-trips through emit and parse" {
    |   for event in all_events() {
193 |     let encoded = @json.parse(wire(event))
    |                               ^^^^
    |     assert_eq(@protocol.parse(encoded), Some(event))
    |   }

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\protocol\emit\emit_test.mbt:205:5-205:9:
    | /// costs nothing and keeps one variant per event.
    | test "optional payload fields are written as null, never omitted" {
    |   inspect(
205 |     wire(
    |     ^^^^
    |       ToolResult(
    |         tool_call_id="call_2",

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\protocol\emit\emit_test.mbt:221:5-221:9:
    |   // A present value is the bare string. MoonBit's own `Some(v)` encoding is the
    |   // one-element array `[v]`, which would read as absent to every decoder.
    |   inspect(
221 |     wire(
    |     ^^^^
    |       ToolResult(
    |         tool_call_id="call_1",

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\protocol\emit\emit_test.mbt:235:5-235:9:
    |     ),
    |   )
    |   inspect(
235 |     wire(GoalUpdated(goal=None)),
    |     ^^^^
    |     content=(
    |       #|{"event":"goal_updated","goal":null}

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\protocol\emit\emit_test.mbt:249:5-249:9:
    | /// from the provider layer.
    | test "usage carries the protocol struct verbatim" {
    |   inspect(
249 |     wire(Usage(usage=usage_sample())),
    |     ^^^^
    |     content=(
    |       #|{"event":"usage","usage":{"prompt_tokens":11,"completion_tokens":22,"total_tokens":33,"prompt_cache_hit_tokens":4,"prompt_cache_miss_tokens":7}}

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\protocol\emit\emit_test.mbt:264:5-264:9:
    | /// for new ones.
    | test "session_started still writes workspace_root as a bare string" {
    |   inspect(
264 |     wire(
    |     ^^^^
    |       SessionStarted(
    |         session="cli-1",

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\protocol\emit\emit_test.mbt:284:23-284:27:
    | /// wants a severity derives it from the variant it decoded.
    | test "the wire line has no log envelope" {
    |   for event in all_events() {
284 |     guard @json.parse(wire(event)) is Object(fields) else {
    |                       ^^^^
    |       fail("expected an object")
    |     }

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\protocol\emit\emit_test.mbt:311:30-311:34:
    |       SteerDropped(content~, submission_id=Some("mixed-steer")),
    |     ]
    |     for event in events {
311 |       let json = @json.parse(wire(event))
    |                              ^^^^
    |       assert_true(json is { "content": Array(_), .. })
    |       assert_eq(@protocol.parse(json), Some(event))

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\protocol\emit\emit_test.mbt:318:7-318:11:
    |   }
    |   assert_eq(
    |     @json.parse(
318 |       wire(
    |       ^^^^
    |         SteerApplied(
    |           kind="prompt",
"" (escaped)
```
