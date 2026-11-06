# openseek rename SelectionsOverlay editor/internal/viewer/browser/view/selections.mbt:10:13

```mooncram
$ moonx '../../../../scripts/bench-moon-ide.mbtx' rename 'SelectionsOverlay' 'SelectionsOverlayRenamed' --loc 'editor/internal/viewer/browser/view/selections.mbt:10:13' --target js --no-check
*** Begin Patch
*** Update File: e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\viewer\browser\view\selections.mbt
@@
 ///|
 /// The package-private selection dynamic overlay state: the prepared per-line
 /// HTML (`_renderResult`).
-priv struct SelectionsOverlay {
+priv struct SelectionsOverlayRenamed {
   mut render_result : Array[String]
 }
 
 ///|
-fn SelectionsOverlay::SelectionsOverlay() -> SelectionsOverlay {
+fn SelectionsOverlayRenamed::SelectionsOverlayRenamed() -> SelectionsOverlayRenamed {
   { render_result: [], }
 }
 
*** Update File: e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\viewer\browser\view\view_overlays.mbt
@@
 /// instead of erasing every overlay into a trait object.
 priv enum DynamicViewOverlayHandle {
   CurrentLine(CurrentLineHighlightOverlay)
-  Selections(SelectionsOverlay)
+  Selections(SelectionsOverlayRenamed)
   Decorations(DecorationsOverlay)
   CurrentLineMargin(CurrentLineMarginHighlightOverlay)
   MarginDecorations(MarginDecorationsOverlay)
@@
 ) -> ContentViewOverlays {
   let overlays = ViewOverlays::ViewOverlays(document, "view-overlays")
   let current_line = CurrentLineHighlightOverlay::CurrentLineHighlightOverlay()
-  let selections = SelectionsOverlay::SelectionsOverlay()
+  let selections = SelectionsOverlayRenamed::SelectionsOverlayRenamed()
   let decorations = DecorationsOverlay::DecorationsOverlay()
   overlays.add_dynamic_overlay(CurrentLine(current_line))
   overlays.add_dynamic_overlay(Selections(selections))
*** Update File: e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\viewer\browser\view\view_overlays_lifecycle.mbt
@@
 
 ///|
 fn prepare_selections_overlay(
-  part : SelectionsOverlay,
+  part : SelectionsOverlayRenamed,
   context : RenderingContext,
 ) -> Unit {
   let self = part
*** End Patch
"" (escaped)
```
