# rabbita rename Val e2e/apps/rui/fixture/fixture.mbt:2:33

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
$ run_moon_ide moon ide rename 'Val' 'ValRenamed' --loc 'e2e/apps/rui/fixture/fixture.mbt:2:33'
*** Begin Patch
*** Update File: <WORKDIR>/e2e/apps/rui/fixture/fixture.mbt
@@
 ///|
-using @rabbita {type Html, type Val}
+using @rabbita {type Html, type ValRenamed}
 
 ///|
 pub fn section(id : String, title : String, body : Array[Html]) -> Html {
@@
 }
 
 ///|
-pub fn mount(name : String, app : () -> Val[Html]) -> Unit {
+pub fn mount(name : String, app : () -> ValRenamed[Html]) -> Unit {
   @rabbita.new(() => {
     app().map(body => {
       @rui.theme(
*** End Patch

```
