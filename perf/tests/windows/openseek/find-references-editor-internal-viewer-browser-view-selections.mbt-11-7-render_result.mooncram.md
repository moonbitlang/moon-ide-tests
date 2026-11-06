# openseek find-references render_result editor/internal/viewer/browser/view/selections.mbt:11:7

```mooncram
$ moonx '../../../../scripts/bench-moon-ide.mbtx' find-references 'render_result' --loc 'editor/internal/viewer/browser/view/selections.mbt:11:7' --target js --no-check
Found 4 references for symbol 'render_result':
e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\viewer\browser\view\selections.mbt:16:5-16:18:
   | 
   | ///|
   | fn SelectionsOverlay::SelectionsOverlay() -> SelectionsOverlay {
16 |   { render_result: [], }
   |     ^^^^^^^^^^^^^
   | }
   | 

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\viewer\browser\view\view_events_wbtest.mbt:351:36-351:49:
    | ) -> Unit {
    |   match self {
    |     CurrentLine(overlay) => overlay.render_result = result
351 |     Selections(overlay) => overlay.render_result = result
    |                                    ^^^^^^^^^^^^^
    |     Decorations(overlay) => overlay.render_result = result
    |     CurrentLineMargin(overlay) => overlay.render_result = result

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\viewer\browser\view\view_overlays.mbt:59:36-59:49:
   | ) -> String {
   |   let render_result = match self {
   |     CurrentLine(overlay) => overlay.render_result
59 |     Selections(overlay) => overlay.render_result
   |                                    ^^^^^^^^^^^^^
   |     Decorations(overlay) => overlay.render_result
   |     CurrentLineMargin(overlay) => overlay.render_result

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\viewer\browser\view\view_overlays_lifecycle.mbt:369:8-369:21:
    |       visible_ranges.push((line.line_number, ranges))
    |     }
    |   }
369 |   self.render_result = prepare_selections_render_from_visible_ranges(
    |        ^^^^^^^^^^^^^
    |     context.viewport,
    |     visible_ranges,
"" (escaped)
```
