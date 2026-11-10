# symlink-outline outline

````mooncram
$ export MOON_HOME="${MOON_HOME:-$HOME/.moon}"
````

````mooncram
$ export TEST_FIXTURE_ROOT="$(cd "$TESTDIR/../../../fixtures/symlink-outline" && pwd)"
````

````mooncram
$ export TEST_SYMLINK_ROOT="$TEST_FIXTURE_ROOT/a"
````

````mooncram
$ export TEST_PROJECT_ROOT="$TEST_FIXTURE_ROOT/proj"
````

````mooncram
$ normalize_moon_ide_output() { sed -e "s|$TEST_SYMLINK_ROOT|<SYMLINK_WORKDIR>|g" -e "s|$TEST_PROJECT_ROOT|<PROJECT_WORKDIR>|g" -e "s|$MOON_HOME|<MOON_HOME>|g"; }
````

````mooncram
$ run_moon_ide_from_symlink() { status_file="${TMPDIR:-/tmp}/moon-ide-status.$$"; ( cd "$TEST_SYMLINK_ROOT" && "$@"; echo "$?" > "$status_file" ) 2>&1 | normalize_moon_ide_output; status=$(cat "$status_file"); rm -f "$status_file"; return "$status"; }
````

````mooncram
$ run_moon_ide_from_symlink moon ide outline .
main.mbt:
 L2 | pub fn answer() -> Int {
      ...
 L7 | pub fn double(n : Int) -> Int {
      ...

````
