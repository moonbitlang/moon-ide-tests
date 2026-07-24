# core find-references self builtin/int64.mbt:26:21

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
$ run_moon_ide moon ide find-references 'self' --loc 'builtin/int64.mbt:26:21'
Found 2 references for symbol 'self':
<WORKDIR>/builtin/int64.mbt:26:21-26:25:
   | ///   inspect(Int64(3), content="3")
   | /// }
   | /// ```
26 | pub fn Int64::Int64(self : Int64) -> Int64 = "%identity"
   |                     ^^^^
   | 
   | ///|

<WORKDIR>/builtin/int64.mbt:109:3-109:9:
    | 
    | ///|
    | pub impl Hash for Int64 with fn hash_combine(self, hasher) {
109 |   hasher.combine_int64(self)
    |   ^^^^^^
    | }
    | 

```
