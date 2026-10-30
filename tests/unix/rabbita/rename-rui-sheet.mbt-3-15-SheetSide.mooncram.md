# rabbita rename SheetSide rui/sheet.mbt:3:15

````mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../fixtures/repos/rabbita' moon ide rename 'SheetSide' 'SheetSideRenamed' --loc 'rui/sheet.mbt:3:15'
*** Begin Patch
*** Update File: <WORKDIR>/e2e/apps/rui/dialogs/sheet.mbt
@@
 }
 
 ///|
-fn sheet_edge_fixture(edge : String, side : @rui.SheetSide) -> Html {
+fn sheet_edge_fixture(edge : String, side : @rui.SheetSideRenamed) -> Html {
   let id = "fixture-sheet-" + edge
   fragment([
     @rui.button(
*** Update File: <WORKDIR>/rui/sheet.mbt
@@
 ///|
 /// Edge from which a [`sheet`] enters the viewport.
-pub(all) enum SheetSide {
+pub(all) enum SheetSideRenamed {
   SheetTop
   SheetRight
   SheetBottom
@@
 } derive(Debug, Eq)
 
 ///|
-pub extend SheetSide with Debug::{to_repr}
+pub extend SheetSideRenamed with Debug::{to_repr}
 
 ///|
-pub extend SheetSide with Eq::{equal, not_equal}
+pub extend SheetSideRenamed with Eq::{equal, not_equal}
 
 ///|
 const SheetStyle : String = "min-width:0;min-height:0;max-height:100dvh;margin:0;border:0;border-radius:0;box-shadow:0 16px 48px rgb(0 0 0 / 0.2)"
 
 ///|
-fn sheet_side_value(side : SheetSide) -> String {
+fn sheet_side_value(side : SheetSideRenamed) -> String {
   match side {
     SheetTop => "top"
     SheetRight => "right"
@@
 }
 
 ///|
-fn sheet_side_style(side : SheetSide) -> String {
+fn sheet_side_style(side : SheetSideRenamed) -> String {
   match side {
     SheetTop =>
       "inset:0 0 auto;width:100%;max-height:85dvh;border-bottom:1px solid var(--rui-border,oklch(0.922 0 0))"
@@
 }
 
 ///|
-fn sheet_closed_transform(side : SheetSide) -> String {
+fn sheet_closed_transform(side : SheetSideRenamed) -> String {
   match side {
     SheetTop => "translate3d(0,-2.5rem,0)"
     SheetRight => "translate3d(2.5rem,0,0)"
@@
   class? : String,
   title? : String,
   hidden? : Bool,
-  side~ : SheetSide = SheetRight,
+  side~ : SheetSideRenamed = SheetRight,
   open? : Bool,
   closedby~ : String = "any",
   show_close~ : Bool = true,
*** Update File: <WORKDIR>/website/homepage/components/interactions_gallery.mbt
@@
 ///|
 fn ig_sheet_variant(
   id : String,
-  side : @rui.SheetSide,
+  side : @rui.SheetSideRenamed,
   trigger_label : String,
 ) -> @html.Html {
   @html.fragment([
*** End Patch
"" (escaped)
````
