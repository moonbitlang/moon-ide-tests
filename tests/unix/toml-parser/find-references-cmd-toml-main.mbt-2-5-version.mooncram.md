# toml-parser find-references version cmd/toml/main.mbt:2:5

```mooncram
$ export MOON_HOME="${MOON_HOME:-$HOME/.moon}"
```

```mooncram
$ export TEST_REPO_ROOT="$(cd "$TESTDIR/../../../fixtures/repos/toml-parser" && pwd)"
```

```mooncram
$ normalize_moon_ide_output() { sed -e "s|$TEST_REPO_ROOT|<WORKDIR>|g" -e "s|$MOON_HOME|<MOON_HOME>|g"; }
```

```mooncram
$ run_moon_ide() { status_file="${TMPDIR:-/tmp}/moon-ide-status.$$"; ( cd "$TEST_REPO_ROOT" && "$@"; echo "$?" > "$status_file" ) 2>&1 | normalize_moon_ide_output; status=$(cat "$status_file"); rm -f "$status_file"; return "$status"; }
```

```mooncram
$ run_moon_ide moon ide find-references 'version' --loc 'cmd/toml/main.mbt:2:5'
Found 2 references for symbol 'version':
<WORKDIR>/cmd/toml/main.mbt:2:5-2:12:
  | ///|
2 | let version : String = "0.2.3"
  |     ^^^^^^^
  | 
  | ///|

<WORKDIR>/cmd/toml/main.mbt:9:5-9:12:
  |   Command(
  |     "toml",
  |     about="Parse, validate, and format TOML files.",
9 |     version~,
  |     ^^^^^^^
  |     arg_required_else_help=true,
  |     positionals=[

```
