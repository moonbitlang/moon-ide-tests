# toml-parser find-references toml_command cmd/toml/main.mbt:5:4

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
$ run_moon_ide moon ide find-references 'toml_command' --loc 'cmd/toml/main.mbt:5:4'
Found 2 references for symbol 'toml_command':
<WORKDIR>/cmd/toml/main.mbt:5:4-5:16:
  | let version : String = "0.2.3"
  | 
  | ///|
5 | fn toml_command() -> @argparse.Command {
  |    ^^^^^^^^^^^^
  |   Command(
  |     "toml",

<WORKDIR>/cmd/toml/main.mbt:43:33-43:45:
   | 
   | ///|
   | fn run(args : ArrayView[String]) -> Int {
43 |   let matches = @argparse.parse(toml_command(), argv=args, env=Map([])) catch {
   |                                 ^^^^^^^^^^^^
   |     err => {
   |       println(err)

```
