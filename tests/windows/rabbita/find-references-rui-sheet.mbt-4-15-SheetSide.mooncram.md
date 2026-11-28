# rabbita find-references SheetSide rui\sheet.mbt:4:15

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' find-references 'SheetSide' --loc 'rui\sheet.mbt:4:15'
Found 8 references for symbol 'SheetSide':
<WORKDIR>/e2e\apps\rui\dialogs\sheet.mbt:40:50-40:59:
   | }
   | 
   | ///|
40 | fn sheet_edge_fixture(edge : String, side : @rui.SheetSide) -> Html {
   |                                                  ^^^^^^^^^
   |   let id = "fixture-sheet-" + edge
   |   fragment([

<WORKDIR>/rui\sheet.mbt:12:12-12:21:
   | }
   | 
   | ///|
12 | pub extend SheetSide with Debug::{to_repr}
   |            ^^^^^^^^^
   | 
   | ///|

<WORKDIR>/rui\sheet.mbt:15:12-15:21:
   | pub extend SheetSide with Debug::{to_repr}
   | 
   | ///|
15 | pub extend SheetSide with Eq::{equal, not_equal}
   |            ^^^^^^^^^
   | 
   | ///|

<WORKDIR>/rui\sheet.mbt:21:28-21:37:
   | const SheetStyle : String = "min-width:0;min-height:0;max-height:100dvh;margin:0;border:0;border-radius:0;box-shadow:0 16px 48px rgb(0 0 0 / 0.2)"
   | 
   | ///|
21 | fn sheet_side_value(side : SheetSide) -> String {
   |                            ^^^^^^^^^
   |   match side {
   |     SheetTop => "top"

<WORKDIR>/rui\sheet.mbt:31:28-31:37:
   | }
   | 
   | ///|
31 | fn sheet_side_style(side : SheetSide) -> String {
   |                            ^^^^^^^^^
   |   match side {
   |     SheetTop =>

<WORKDIR>/rui\sheet.mbt:45:34-45:43:
   | }
   | 
   | ///|
45 | fn sheet_closed_transform(side : SheetSide) -> String {
   |                                  ^^^^^^^^^
   |   match side {
   |     SheetTop => "translate3d(0,-2.5rem,0)"

<WORKDIR>/rui\sheet.mbt:64:11-64:20:
   |   class? : String,
   |   title? : String,
   |   hidden? : Bool,
64 |   side~ : SheetSide = SheetRight,
   |           ^^^^^^^^^
   |   open? : Bool,
   |   closedby~ : String = "any",

<WORKDIR>/website\homepage\components\interactions_gallery.mbt:1286:15-1286:24:
     | ///|
     | fn ig_sheet_variant(
     |   id : String,
1286 |   side : @rui.SheetSide,
     |               ^^^^^^^^^
     |   trigger_label : String,
     | ) -> @html.Html {
"" (escaped)
```
