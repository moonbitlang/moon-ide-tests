# rabbita find-references SheetTop rui\sheet.mbt:4:3

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\rabbita' moon ide find-references 'SheetTop' --loc 'rui\sheet.mbt:4:3'
Found 5 references for symbol 'SheetTop':
<WORKDIR>/rui\sheet.mbt:26:5-26:13:
   | ///|
   | fn sheet_side_value(side : SheetSide) -> String {
   |   match side {
26 |     SheetTop => "top"
   |     ^^^^^^^^
   |     SheetRight => "right"
   |     SheetBottom => "bottom"

<WORKDIR>/rui\sheet.mbt:36:5-36:13:
   | ///|
   | fn sheet_positioner_side_style(side : SheetSide) -> String {
   |   match side {
36 |     SheetTop => "align-items:flex-start"
   |     ^^^^^^^^
   |     SheetRight => "justify-content:flex-end"
   |     SheetBottom => "align-items:flex-end"

<WORKDIR>/rui\sheet.mbt:46:5-46:13:
   | ///|
   | fn sheet_surface_side_style(side : SheetSide) -> String {
   |   match side {
46 |     SheetTop =>
   |     ^^^^^^^^
   |       "width:100%;max-height:85vh;border-bottom:1px solid var(--rui-border,oklch(0.922 0 0))"
   |     SheetRight =>

<WORKDIR>/rui\sheet.mbt:60:5-60:13:
   | ///|
   | fn sheet_closed_transform(side : SheetSide) -> String {
   |   match side {
60 |     SheetTop => "translate3d(0,-2.5rem,0)"
   |     ^^^^^^^^
   |     SheetRight => "translate3d(2.5rem,0,0)"
   |     SheetBottom => "translate3d(0,2.5rem,0)"

<WORKDIR>/website\homepage\components\interactions_gallery.mbt:2440:5-2440:13:
     |   )
     |   let sheet_top_view = ig_sheet_variant(
     |     "showcase-sheet-top",
2440 |     SheetTop,
     |     ^^^^^^^^
     |     "Open top sheet",
     |   )

```
