# rabbita rename SheetTop rui/sheet.mbt:4:3

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
$ run_moon_ide moon ide rename 'SheetTop' 'SheetTopRenamed' --loc 'rui/sheet.mbt:4:3'
*** Begin Patch
*** Update File: <WORKDIR>/rui/sheet.mbt
@@
 ///|
 /// Edge from which a [`sheet_content`] surface enters the viewport.
 pub(all) enum SheetSide {
-  SheetTop
+  SheetTopRenamed
   SheetRight
   SheetBottom
   SheetLeft
@@
 ///|
 fn sheet_side_value(side : SheetSide) -> String {
   match side {
-    SheetTop => "top"
+    SheetTopRenamed => "top"
     SheetRight => "right"
     SheetBottom => "bottom"
     SheetLeft => "left"
@@
 ///|
 fn sheet_positioner_side_style(side : SheetSide) -> String {
   match side {
-    SheetTop => "align-items:flex-start"
+    SheetTopRenamed => "align-items:flex-start"
     SheetRight => "justify-content:flex-end"
     SheetBottom => "align-items:flex-end"
     SheetLeft => "justify-content:flex-start"
@@
 ///|
 fn sheet_surface_side_style(side : SheetSide) -> String {
   match side {
-    SheetTop =>
+    SheetTopRenamed =>
       "width:100%;max-height:85vh;border-bottom:1px solid var(--rui-border,oklch(0.922 0 0))"
     SheetRight =>
       "width:min(85vw,24rem);height:100%;border-left:1px solid var(--rui-border,oklch(0.922 0 0))"
@@
 ///|
 fn sheet_closed_transform(side : SheetSide) -> String {
   match side {
-    SheetTop => "translate3d(0,-2.5rem,0)"
+    SheetTopRenamed => "translate3d(0,-2.5rem,0)"
     SheetRight => "translate3d(2.5rem,0,0)"
     SheetBottom => "translate3d(0,2.5rem,0)"
     SheetLeft => "translate3d(-2.5rem,0,0)"
*** Update File: <WORKDIR>/website/homepage/components/interactions_gallery.mbt
@@
   )
   let sheet_top_view = ig_sheet_variant(
     "showcase-sheet-top",
-    SheetTop,
+    SheetTopRenamed,
     "Open top sheet",
   )
   let sheet_right_view = ig_sheet_variant(
*** End Patch

```
