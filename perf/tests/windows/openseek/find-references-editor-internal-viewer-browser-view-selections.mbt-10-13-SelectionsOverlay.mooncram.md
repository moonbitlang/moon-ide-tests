# openseek find-references SelectionsOverlay editor/internal/viewer/browser/view/selections.mbt:10:13

```mooncram
$ moonx '../../../../scripts/bench-moon-ide.mbtx' find-references 'SelectionsOverlay' --loc 'editor/internal/viewer/browser/view/selections.mbt:10:13' --target js --no-check
Found 7 references for symbol 'SelectionsOverlay':
e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\viewer\browser\view\selections.mbt:15:4-15:21:
   | }
   | 
   | ///|
15 | fn SelectionsOverlay::SelectionsOverlay() -> SelectionsOverlay {
   |    ^^^^^^^^^^^^^^^^^
   |   { render_result: [], }
   | }

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\viewer\browser\view\selections.mbt:15:23-15:40:
   | }
   | 
   | ///|
15 | fn SelectionsOverlay::SelectionsOverlay() -> SelectionsOverlay {
   |                       ^^^^^^^^^^^^^^^^^
   |   { render_result: [], }
   | }

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\viewer\browser\view\selections.mbt:15:46-15:63:
   | }
   | 
   | ///|
15 | fn SelectionsOverlay::SelectionsOverlay() -> SelectionsOverlay {
   |                                              ^^^^^^^^^^^^^^^^^
   |   { render_result: [], }
   | }

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\viewer\browser\view\view_overlays.mbt:24:14-24:31:
   | /// instead of erasing every overlay into a trait object.
   | priv enum DynamicViewOverlayHandle {
   |   CurrentLine(CurrentLineHighlightOverlay)
24 |   Selections(SelectionsOverlay)
   |              ^^^^^^^^^^^^^^^^^
   |   Decorations(DecorationsOverlay)
   |   CurrentLineMargin(CurrentLineMarginHighlightOverlay)

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\viewer\browser\view\view_overlays.mbt:311:20-311:37:
    | ) -> ContentViewOverlays {
    |   let overlays = ViewOverlays::ViewOverlays(document, "view-overlays")
    |   let current_line = CurrentLineHighlightOverlay::CurrentLineHighlightOverlay()
311 |   let selections = SelectionsOverlay::SelectionsOverlay()
    |                    ^^^^^^^^^^^^^^^^^
    |   let decorations = DecorationsOverlay::DecorationsOverlay()
    |   overlays.add_dynamic_overlay(CurrentLine(current_line))

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\viewer\browser\view\view_overlays.mbt:311:39-311:56:
    | ) -> ContentViewOverlays {
    |   let overlays = ViewOverlays::ViewOverlays(document, "view-overlays")
    |   let current_line = CurrentLineHighlightOverlay::CurrentLineHighlightOverlay()
311 |   let selections = SelectionsOverlay::SelectionsOverlay()
    |                                       ^^^^^^^^^^^^^^^^^
    |   let decorations = DecorationsOverlay::DecorationsOverlay()
    |   overlays.add_dynamic_overlay(CurrentLine(current_line))

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\viewer\browser\view\view_overlays_lifecycle.mbt:355:10-355:27:
    | 
    | ///|
    | fn prepare_selections_overlay(
355 |   part : SelectionsOverlay,
    |          ^^^^^^^^^^^^^^^^^
    |   context : RenderingContext,
    | ) -> Unit {
"" (escaped)
```
