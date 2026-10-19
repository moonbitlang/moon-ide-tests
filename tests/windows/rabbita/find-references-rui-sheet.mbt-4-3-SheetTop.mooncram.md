# rabbita find-references SheetTop rui\sheet.mbt:4:3

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\rabbita' moon ide find-references 'SheetTop' --loc 'rui\sheet.mbt:4:3'
Found 5 references for symbol 'SheetTop':
<WORKDIR>/e2e\apps\rui\dialogs\sheet.mbt:34:31-34:39:
   |       ],
   |     ),
   |     sheet_edge_fixture("bottom", SheetBottom),
34 |     sheet_edge_fixture("top", SheetTop),
   |                               ^^^^^^^^
   |     sheet_edge_fixture("left", SheetLeft),
   |   ])

<WORKDIR>/rui\sheet.mbt:22:5-22:13:
   | ///|
   | fn sheet_side_value(side : SheetSide) -> String {
   |   match side {
22 |     SheetTop => "top"
   |     ^^^^^^^^
   |     SheetRight => "right"
   |     SheetBottom => "bottom"

<WORKDIR>/rui\sheet.mbt:32:5-32:13:
   | ///|
   | fn sheet_side_style(side : SheetSide) -> String {
   |   match side {
32 |     SheetTop =>
   |     ^^^^^^^^
   |       "inset:0 0 auto;width:100%;max-height:85dvh;border-bottom:1px solid var(--rui-border,oklch(0.922 0 0))"
   |     SheetRight =>

<WORKDIR>/rui\sheet.mbt:46:5-46:13:
   | ///|
   | fn sheet_closed_transform(side : SheetSide) -> String {
   |   match side {
46 |     SheetTop => "translate3d(0,-2.5rem,0)"
   |     ^^^^^^^^
   |     SheetRight => "translate3d(2.5rem,0,0)"
   |     SheetBottom => "translate3d(0,2.5rem,0)"

<WORKDIR>/website\homepage\components\interactions_gallery.mbt:2481:5-2481:13:
     |   )
     |   let sheet_top_view = ig_sheet_variant(
     |     "showcase-sheet-top",
2481 |     SheetTop,
     |     ^^^^^^^^
     |     "Open top sheet",
     |   )

```
