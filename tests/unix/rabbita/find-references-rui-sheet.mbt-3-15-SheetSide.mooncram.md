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
Found 8 references for symbol 'SheetSide':
<WORKDIR>/e2e/apps/rui/dialogs/sheet.mbt:40:50-40:59:
   | }
   | 
   | ///|
40 | fn sheet_edge_fixture(edge : String, side : @rui.SheetSide) -> Html {
   |                                                  ^^^^^^^^^
   |   let id = "fixture-sheet-" + edge
   |   fragment([

<WORKDIR>/rui/sheet.mbt:11:12-11:21:
   | } derive(Debug, Eq)
   | 
   | ///|
11 | pub extend SheetSide with Debug::{to_repr}
   |            ^^^^^^^^^
   | 
   | ///|

<WORKDIR>/rui/sheet.mbt:14:12-14:21:
   | pub extend SheetSide with Debug::{to_repr}
   | 
   | ///|
14 | pub extend SheetSide with Eq::{equal, not_equal}
   |            ^^^^^^^^^
   | 
   | ///|

<WORKDIR>/rui/sheet.mbt:20:28-20:37:
   | const SheetStyle : String = "min-width:0;min-height:0;max-height:100dvh;margin:0;border:0;border-radius:0;box-shadow:0 16px 48px rgb(0 0 0 / 0.2)"
   | 
   | ///|
20 | fn sheet_side_value(side : SheetSide) -> String {
   |                            ^^^^^^^^^
   |   match side {
   |     SheetTop => "top"

<WORKDIR>/rui/sheet.mbt:30:28-30:37:
   | }
   | 
   | ///|
30 | fn sheet_side_style(side : SheetSide) -> String {
   |                            ^^^^^^^^^
   |   match side {
   |     SheetTop =>

<WORKDIR>/rui/sheet.mbt:44:34-44:43:
   | }
   | 
   | ///|
44 | fn sheet_closed_transform(side : SheetSide) -> String {
   |                                  ^^^^^^^^^
   |   match side {
   |     SheetTop => "translate3d(0,-2.5rem,0)"

<WORKDIR>/rui/sheet.mbt:63:11-63:20:
   |   class? : String,
   |   title? : String,
   |   hidden? : Bool,
63 |   side~ : SheetSide = SheetRight,
   |           ^^^^^^^^^
   |   open? : Bool,
   |   closedby~ : String = "any",

<WORKDIR>/website/homepage/components/interactions_gallery.mbt:1286:15-1286:24:
     | ///|
     | fn ig_sheet_variant(
     |   id : String,
1286 |   side : @rui.SheetSide,
     |               ^^^^^^^^^
     |   trigger_label : String,
     | ) -> @html.Html {

```
