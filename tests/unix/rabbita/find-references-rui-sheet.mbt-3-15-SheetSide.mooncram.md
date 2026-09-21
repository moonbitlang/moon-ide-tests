# rabbita find-references SheetSide rui/sheet.mbt:3:15

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
$ run_moon_ide moon ide find-references 'SheetSide' --loc 'rui/sheet.mbt:3:15'
Found 7 references for symbol 'SheetSide':
<WORKDIR>/rui/sheet.mbt:24:28-24:37:
   | const SheetCloseButtonStyle : String = "position:absolute;top:1rem;inset-inline-end:1rem;background:var(--rui-close-bg,var(--rui-button-bg,var(--rui-button-base-bg,transparent)));color:var(--rui-close-fg,var(--rui-button-fg,var(--rui-button-base-fg,currentColor)));box-shadow:var(--rui-close-shadow,var(--rui-button-shadow,var(--rui-button-base-shadow,none)));opacity:var(--rui-close-opacity,var(--rui-close-base-opacity,0.7))"
   | 
   | ///|
24 | fn sheet_side_value(side : SheetSide) -> String {
   |                            ^^^^^^^^^
   |   match side {
   |     SheetTop => "top"

<WORKDIR>/rui/sheet.mbt:34:39-34:48:
   | }
   | 
   | ///|
34 | fn sheet_positioner_side_style(side : SheetSide) -> String {
   |                                       ^^^^^^^^^
   |   match side {
   |     SheetTop => "align-items:flex-start"

<WORKDIR>/rui/sheet.mbt:44:36-44:45:
   | }
   | 
   | ///|
44 | fn sheet_surface_side_style(side : SheetSide) -> String {
   |                                    ^^^^^^^^^
   |   match side {
   |     SheetTop =>

<WORKDIR>/rui/sheet.mbt:58:34-58:43:
   | }
   | 
   | ///|
58 | fn sheet_closed_transform(side : SheetSide) -> String {
   |                                  ^^^^^^^^^
   |   match side {
   |     SheetTop => "translate3d(0,-2.5rem,0)"

<WORKDIR>/rui/sheet.mbt:68:30-68:39:
   | }
   | 
   | ///|
68 | fn sheet_motion_style(side : SheetSide, open : Bool) -> String {
   |                              ^^^^^^^^^
   |   let closed_transform = sheet_closed_transform(side)
   |   if open {

<WORKDIR>/rui/sheet.mbt:170:11-170:20:
    | /// overridden without copying the component.
    | pub fn[C : @html.IsChildren] sheet_content(
    |   scope : SheetScope,
170 |   side? : SheetSide = SheetRight,
    |           ^^^^^^^^^
    |   close_on_overlay? : Bool = true,
    |   show_close? : Bool = true,

<WORKDIR>/website/homepage/components/interactions_gallery.mbt:1284:15-1284:24:
     | ///|
     | fn ig_sheet_variant(
     |   id : String,
1284 |   side : @rui.SheetSide,
     |               ^^^^^^^^^
     |   trigger_label : String,
     | ) -> @rabbita.Val[@html.Html] {

```
