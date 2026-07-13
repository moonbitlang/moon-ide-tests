# rabbita find-references simple_cell warren/templates/minimized/main.mbt:1:23

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
$ run_moon_ide moon ide find-references 'simple_cell' --loc 'warren/templates/minimized/main.mbt:1:23'
Found 2 references for symbol 'simple_cell':
<WORKDIR>/warren/templates/minimized/main.mbt:1:23-1:34:
1 | using @rabbita { new, simple_cell }
  |                       ^^^^^^^^^^^
  | using @html { button, div, h1 }
  | 

<WORKDIR>/warren/templates/minimized/main.mbt:10:13-10:24:
   | }
   | 
   | fn main {
10 |   let app = simple_cell(
   |             ^^^^^^^^^^^
   |     model=0,
   |     update=(msg, model) => match msg {

```
