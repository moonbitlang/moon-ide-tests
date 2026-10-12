# rabbita find-references Val e2e/apps/rui/toast/main.mbt:2:33

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
$ run_moon_ide moon ide find-references 'Val' --loc 'e2e/apps/rui/toast/main.mbt:2:33'
Found 1 references for symbol 'Val':
<WORKDIR>/e2e/apps/rui/toast/toast.mbt:2:23-2:26:
  | ///|
2 | fn toast_fixture() -> Val[Html] {
  |                       ^^^
  |   let toaster = @rui.sonner(max_toasts=3, position="bottom-right", scope => {
  |     div(style=["display:flex;flex-wrap:wrap;gap:0.5rem"], [

```
