# rabbita rename fixture_scroll_items e2e/apps/rui/message-scroller/message_scroller.mbt:2:4

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
$ run_moon_ide moon ide rename 'fixture_scroll_items' 'fixture_scroll_items_renamed' --loc 'e2e/apps/rui/message-scroller/message_scroller.mbt:2:4'
*** Begin Patch
*** Update File: <WORKDIR>/e2e/apps/rui/message-scroller/message_scroller.mbt
@@
 ///|
-fn fixture_scroll_items(prefix : String) -> Array[Html] {
+fn fixture_scroll_items_renamed(prefix : String) -> Array[Html] {
   let items : Array[Html] = []
   for index in 1..<=18 {
     items.push(
@@
         @rui.message_scroller_viewport(
           scope~,
           @rui.message_scroller_content(
-            fixture_scroll_items("message-scroller-item").map(item => {
+            fixture_scroll_items_renamed("message-scroller-item").map(item => {
               @rui.message_scroller_item(style=["min-height:3rem"], item)
             }),
           ),
*** End Patch

```
