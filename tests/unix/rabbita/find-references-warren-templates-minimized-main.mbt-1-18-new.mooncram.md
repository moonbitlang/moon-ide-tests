# rabbita find-references new warren/templates/minimized/main.mbt:1:18

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
$ run_moon_ide moon ide find-references 'new' --loc 'warren/templates/minimized/main.mbt:1:18'
Found 2 references for symbol 'new':
<WORKDIR>/warren/templates/minimized/main.mbt:1:18-1:21:
1 | using @rabbita { new, simple_cell }
  |                  ^^^
  | using @html { button, div, h1 }
  | 

<WORKDIR>/warren/templates/minimized/main.mbt:24:3-24:6:
   |       ],
   |     ],
   |   )
24 |   new(app).mount("app")
   |   ^^^
   | }

```
