# toml-parser rename toml_command cmd/toml/main.mbt:5:4

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
$ run_moon_ide moon ide rename 'toml_command' 'toml_command_renamed' --loc 'cmd/toml/main.mbt:5:4'
*** Begin Patch
*** Update File: <WORKDIR>/cmd/toml/main.mbt
@@
 let version : String = "0.2.3"
 
 ///|
-fn toml_command() -> @argparse.Command {
+fn toml_command_renamed() -> @argparse.Command {
   Command(
     "toml",
     about="Parse, validate, and format TOML files.",
@@
 
 ///|
 fn run(args : ArrayView[String]) -> Int {
-  let matches = @argparse.parse(toml_command(), argv=args, env=Map([])) catch {
+  let matches = @argparse.parse(toml_command_renamed(), argv=args, env=Map([])) catch {
     err => {
       println(err)
       return 2
*** End Patch

```
