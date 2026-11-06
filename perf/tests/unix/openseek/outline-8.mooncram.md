# openseek outline

```mooncram
$ moonx '../../../../scripts/bench-moon-ide.mbtx' outline 'editor/internal/viewer/browser/view/selections.mbt' --target js --no-check
 10 |priv struct SelectionsOverlay {
    |...
 15 |fn SelectionsOverlay::SelectionsOverlay() -> SelectionsOverlay {
    |...
 23 |priv enum CornerStyle {
    |...
 32 |priv struct StyledRange {
    |...
 44 |priv struct LineSelectionRanges {
    |...
 50 |fn new_styled_range(left : Double, width : Double) -> StyledRange {
    |...
 67 |fn prepare_selections_render_from_visible_ranges(
 68 |  viewport : @view_layout.ViewportData,
 69 |  visible_ranges : Array[(Int32, Array[(Double, Double)])],
 70 |  space_width : Double,
 71 |) -> Array[String] {
    |...
 83 |fn render_selection_lines(
 84 |  viewport : @view_layout.ViewportData,
 85 |  lines : Array[LineSelectionRanges],
 86 |  space_width : Double,
 87 |) -> Array[String] {
    |...
111 |fn visible_ranges_have_gaps(lines : Array[LineSelectionRanges]) -> Bool {
    |...
122 |fn enrich_visible_ranges_with_style(
123 |  lines : Array[LineSelectionRanges],
124 |  space_width : Double,
125 |) -> Unit {
    |...
171 |fn render_styled_line_html(
172 |  line : LineSelectionRanges,
173 |  styled : Bool,
174 |) -> (String, String) {
    |...
231 |let selection_class_name = "selected-text"
    |...
236 |let editor_background_class_name = "monaco-editor-background"
    |...
240 |let rounded_piece_width = 10.0
    |...
245 |fn selection_piece_html(
246 |  class_name : String,
247 |  left : Double,
248 |  width : Double,
249 |) -> String {
    |...
"" (escaped)
```
