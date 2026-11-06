# openseek rename render_result editor/internal/viewer/browser/view/selections.mbt:11:7

```mooncram
$ moonx '../../../../scripts/bench-moon-ide.mbtx' rename 'render_result' 'render_result_renamed' --loc 'editor/internal/viewer/browser/view/selections.mbt:11:7' --target js --no-check
*** Begin Patch
*** Update File: e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\viewer\browser\view\selections.mbt
@@
 /// The package-private selection dynamic overlay state: the prepared per-line
 /// HTML (`_renderResult`).
 priv struct SelectionsOverlay {
-  mut render_result : Array[String]
+  mut render_result_renamed : Array[String]
 }
 
 ///|
 fn SelectionsOverlay::SelectionsOverlay() -> SelectionsOverlay {
-  { render_result: [], }
+  { render_result_renamed: [], }
 }
 
 ///|
*** Update File: e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\viewer\browser\view\view_events_wbtest.mbt
@@
 ) -> Unit {
   match self {
     CurrentLine(overlay) => overlay.render_result = result
-    Selections(overlay) => overlay.render_result = result
+    Selections(overlay) => overlay.render_result_renamed = result
     Decorations(overlay) => overlay.render_result = result
     CurrentLineMargin(overlay) => overlay.render_result = result
     MarginDecorations(overlay) => overlay.render_result = result
*** Update File: e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\viewer\browser\view\view_overlays.mbt
@@
 ) -> String {
   let render_result = match self {
     CurrentLine(overlay) => overlay.render_result
-    Selections(overlay) => overlay.render_result
+    Selections(overlay) => overlay.render_result_renamed
     Decorations(overlay) => overlay.render_result
     CurrentLineMargin(overlay) => overlay.render_result
     MarginDecorations(overlay) => overlay.render_result
*** Update File: e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\viewer\browser\view\view_overlays_lifecycle.mbt
@@
       visible_ranges.push((line.line_number, ranges))
     }
   }
-  self.render_result = prepare_selections_render_from_visible_ranges(
+  self.render_result_renamed = prepare_selections_render_from_visible_ranges(
     context.viewport,
     visible_ranges,
     context.input.space_width,
*** End Patch
"" (escaped)
```
