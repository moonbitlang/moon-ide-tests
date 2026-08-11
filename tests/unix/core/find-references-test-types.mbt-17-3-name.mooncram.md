# core find-references name test/types.mbt:17:3

```mooncram
$ export MOON_HOME="${MOON_HOME:-$HOME/.moon}"
```

```mooncram
$ export TEST_REPO_ROOT="$(cd "$TESTDIR/../../../fixtures/repos/core" && pwd)"
```

```mooncram
$ normalize_moon_ide_output() { sed -e "s|$TEST_REPO_ROOT|<WORKDIR>|g" -e "s|$MOON_HOME|<MOON_HOME>|g"; }
```

```mooncram
$ run_moon_ide() { status_file="${TMPDIR:-/tmp}/moon-ide-status.$$"; ( cd "$TEST_REPO_ROOT" && "$@"; echo "$?" > "$status_file" ) 2>&1 | normalize_moon_ide_output; status=$(cat "$status_file"); rm -f "$status_file"; return "$status"; }
```

```mooncram
$ run_moon_ide moon ide find-references 'name' --loc 'test/types.mbt:17:3'
Found 3 references for symbol 'name':
<WORKDIR>/test/test.mbt:239:8-239:12:
    | ///|
    | /// Return the name of the test.
    | pub fn Test::name(self : Self) -> String {
239 |   self.name
    |        ^^^^
    | }

<WORKDIR>/test/types.mbt:17:3-17:7:
   | 
   | ///|
   | struct Test {
17 |   name : String
   |   ^^^^
   |   buffer : StringBuilder
   | } derive(@debug.Debug)

<WORKDIR>/test/types.mbt:27:5-27:9:
   | #as_free_fn
   | #as_free_fn(new, deprecated="Use `Test()` instead")
   | pub fn Test::Test(name : String) -> Test {
27 |   { name, buffer: StringBuilder() }
   |     ^^^^
   | }

```
