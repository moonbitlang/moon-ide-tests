# rabbita rename SheetSide rui/sheet.mbt:3:15

```mooncram
$ export MOON_HOME="${MOON_HOME:-$HOME/.moon}"
```

```mooncram
$ export TEST_REPO_ROOT="$(cd "$TESTDIR/../../../fixtures/repos/rabbita" && pwd)"
```

```mooncram
$ normalize_moon_ide_output() { sed -e "s|$TEST_REPO_ROOT|<WORKDIR>|g" -e "s|$MOON_HOME|<MOON_HOME>|g"; }
```

```mooncram
$ run_moon_ide() { status_file="${TMPDIR:-/tmp}/moon-ide-status.$$"; ( cd "$TEST_REPO_ROOT" && "$@"; echo "$?" > "$status_file" ) 2>&1 | normalize_moon_ide_output; status=$(cat "$status_file"); rm -f "$status_file"; return "$status"; }
```

```mooncram
$ run_moon_ide moon ide rename 'SheetSide' 'SheetSideRenamed' --loc 'rui/sheet.mbt:3:15'
*** Begin Patch
*** Update File: <WORKDIR>/rui/sheet.mbt
@@
 ///|
 /// Edge from which a [`sheet_content`] surface enters the viewport.
-pub(all) enum SheetSide {
+pub(all) enum SheetSideRenamed {
   SheetTop
   SheetRight
   SheetBottom
@@
 const SheetCloseButtonStyle : String = "position:absolute;top:1rem;inset-inline-end:1rem;background:var(--rui-close-bg,var(--rui-button-bg,var(--rui-button-base-bg,transparent)));color:var(--rui-close-fg,var(--rui-button-fg,var(--rui-button-base-fg,currentColor)));box-shadow:var(--rui-close-shadow,var(--rui-button-shadow,var(--rui-button-base-shadow,none)));opacity:var(--rui-close-opacity,var(--rui-close-base-opacity,0.7))"
 
 ///|
-fn sheet_side_value(side : SheetSide) -> String {
+fn sheet_side_value(side : SheetSideRenamed) -> String {
   match side {
     SheetTop => "top"
     SheetRight => "right"
@@
 }
 
 ///|
-fn sheet_positioner_side_style(side : SheetSide) -> String {
+fn sheet_positioner_side_style(side : SheetSideRenamed) -> String {
   match side {
     SheetTop => "align-items:flex-start"
     SheetRight => "justify-content:flex-end"
@@
 }
 
 ///|
-fn sheet_surface_side_style(side : SheetSide) -> String {
+fn sheet_surface_side_style(side : SheetSideRenamed) -> String {
   match side {
     SheetTop =>
       "width:100%;max-height:85vh;border-bottom:1px solid var(--rui-border,oklch(0.922 0 0))"
@@
 }
 
 ///|
-fn sheet_closed_transform(side : SheetSide) -> String {
+fn sheet_closed_transform(side : SheetSideRenamed) -> String {
   match side {
     SheetTop => "translate3d(0,-2.5rem,0)"
     SheetRight => "translate3d(2.5rem,0,0)"
@@
 }
 
 ///|
-fn sheet_motion_style(side : SheetSide, open : Bool) -> String {
+fn sheet_motion_style(side : SheetSideRenamed, open : Bool) -> String {
   let closed_transform = sheet_closed_transform(side)
   if open {
     "--rui-sheet-closed-transform:\{closed_transform};--rui-sheet-opacity:1;--rui-sheet-transform:translate3d(0,0,0);animation:rui-sheet-enter 200ms ease-in-out"
@@
 /// overridden without copying the component.
 pub fn[C : @html.IsChildren] sheet_content(
   scope : SheetScope,
-  side? : SheetSide = SheetRight,
+  side? : SheetSideRenamed = SheetRight,
   close_on_overlay? : Bool = true,
   show_close? : Bool = true,
   close_label? : String = "Close",
*** Update File: <WORKDIR>/website/homepage/components/interactions_gallery.mbt
@@
 ///|
 fn ig_sheet_variant(
   id : String,
-  side : @rui.SheetSide,
+  side : @rui.SheetSideRenamed,
   trigger_label : String,
 ) -> @rabbita.Val[@html.Html] {
   @rui.sheet(id~, scope => {
*** End Patch

```
