# openseek peek-def

```mooncram
$ moonx '../../../../scripts/bench-moon-ide.mbtx' peek-def 'render_result' --loc 'editor/internal/viewer/browser/view/selections.mbt:11:7' --target js --no-check
Definition found at file e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\viewer\browser\view\selections.mbt
   | 
   | ///|
   | /// The package-private selection dynamic overlay state: the prepared per-line
   | /// HTML (`_renderResult`).
   | priv struct SelectionsOverlay {
11 |   mut render_result : Array[String]
   |       ^^^^^^^^^^^^^
   | }
   | 
   | ///|
   | fn SelectionsOverlay::SelectionsOverlay() -> SelectionsOverlay {
   |   { render_result: [], }
   | }
   | 
   | ///|
   | /// The rounded-corner classification of a selection edge, Monaco's
   | /// `CornerStyle`: `Extern` rounds outward, `Intern` is a reverse (inverse)
   | /// corner cut into an adjacent line, `Flat` leaves a straight edge.
   | priv enum CornerStyle {
   |   Extern
   |   Intern
```
