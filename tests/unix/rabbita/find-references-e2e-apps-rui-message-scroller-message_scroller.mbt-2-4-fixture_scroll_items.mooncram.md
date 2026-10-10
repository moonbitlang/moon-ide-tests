# rabbita find-references fixture_scroll_items e2e/apps/rui/message-scroller/message_scroller.mbt:2:4

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
$ run_moon_ide moon ide find-references 'fixture_scroll_items' --loc 'e2e/apps/rui/message-scroller/message_scroller.mbt:2:4'
Found 1 references for symbol 'fixture_scroll_items':
<WORKDIR>/e2e/apps/rui/message-scroller/message_scroller.mbt:29:13-29:33:
   |         @rui.message_scroller_viewport(
   |           scope~,
   |           @rui.message_scroller_content(
29 |             fixture_scroll_items("message-scroller-item").map(item => {
   |             ^^^^^^^^^^^^^^^^^^^^
   |               @rui.message_scroller_item(style=["min-height:3rem"], item)
   |             }),

```
