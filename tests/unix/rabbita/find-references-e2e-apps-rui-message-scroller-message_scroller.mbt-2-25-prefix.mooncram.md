# rabbita find-references prefix e2e/apps/rui/message-scroller/message_scroller.mbt:2:25

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
$ run_moon_ide moon ide find-references 'prefix' --loc 'e2e/apps/rui/message-scroller/message_scroller.mbt:2:25'
Found 1 references for symbol 'prefix':
<WORKDIR>/e2e/apps/rui/message-scroller/message_scroller.mbt:7:15-7:21:
  |   for index in 1..<=18 {
  |     items.push(
  |       div(
7 |         id="\{prefix}-\{index}",
  |               ^^^^^^
  |         style=["height:2rem;flex:none;padding:0.25rem"],
  |         "Fixture item \{index}",

```
