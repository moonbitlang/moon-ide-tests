# core find-references i builtin/int64.mbt:31:24

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
$ run_moon_ide moon ide find-references 'i' --loc 'builtin/int64.mbt:31:24'
Found 2 references for symbol 'i':
<WORKDIR>/builtin/int64.mbt:31:24-31:25:
   | ///   inspect(Int64::from_int(42), content="42")
   | /// }
   | /// ```
31 | pub fn Int64::from_int(i : Int) -> Int64 {
   |                        ^
   |   i.to_int64()
   | }

<WORKDIR>/builtin/int64.mbt:96:24-96:28:
   | 
   | ///|
   | pub impl Hash for Int64 with fn hash_combine(self, hasher) {
96 |   hasher.combine_int64(self)
   |                        ^^^^
   | }
   | 

```
