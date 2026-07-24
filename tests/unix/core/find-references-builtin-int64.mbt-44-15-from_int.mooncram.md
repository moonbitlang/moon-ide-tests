# core find-references from_int builtin/int64.mbt:44:15

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
$ run_moon_ide moon ide find-references 'from_int' --loc 'builtin/int64.mbt:44:15'
Found 5 references for symbol 'from_int':
<WORKDIR>/builtin/int64.mbt:41:22-41:30:
   | ///
   | /// ```mbt check
   | /// test {
41 | ///   inspect(Int64::from_int(42), content="42")
   |                      ^^^^^^^^
   | /// }
   | /// ```

<WORKDIR>/builtin/int64.mbt:44:15-44:23:
   | ///   inspect(Int64::from_int(42), content="42")
   | /// }
   | /// ```
44 | pub fn Int64::from_int(i : Int) -> Int64 {
   |               ^^^^^^^^
   |   i.to_int64()
   | }

<WORKDIR>/int64/README.mbt.md:14:18-14:26:
   | test "basic operations" {
   |   let i : Int64 = -12345L // Int64 literal
   |   // You can also convert from an `Int` like so:
14 |   inspect(Int64::from_int(-12345) == i, content="true")
   |                  ^^^^^^^^
   | 
   |   // Max and min values

<WORKDIR>/int64/int64_test.mbt:25:18-25:26:
   | 
   | ///|
   | test "Int64::from_int" {
25 |   inspect(Int64::from_int(1256), content="1256")
   |                  ^^^^^^^^
   | }
   | 

<WORKDIR>/int64/int64_test.mbt:30:18-30:26:
   | 
   | ///|
   | test "from_int" {
30 |   inspect(Int64::from_int(1256), content="1256")
   |                  ^^^^^^^^
   | }
   | 

```
