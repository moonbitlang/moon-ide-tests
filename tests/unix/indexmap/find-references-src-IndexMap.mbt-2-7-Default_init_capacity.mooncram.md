# indexmap find-references Default_init_capacity src/IndexMap.mbt:2:7

```mooncram
$ export MOON_HOME="${MOON_HOME:-$HOME/.moon}"
```

```mooncram
$ export TEST_REPO_ROOT="$(cd "$TESTDIR/../../../fixtures/repos/indexmap" && pwd)"
```

```mooncram
$ normalize_moon_ide_output() { sed -e "s|$TEST_REPO_ROOT|<WORKDIR>|g" -e "s|$MOON_HOME|<MOON_HOME>|g"; }
```

```mooncram
$ run_moon_ide() { status_file="${TMPDIR:-/tmp}/moon-ide-status.$$"; ( cd "$TEST_REPO_ROOT" && "$@"; echo "$?" > "$status_file" ) 2>&1 | normalize_moon_ide_output; status=$(cat "$status_file"); rm -f "$status_file"; return "$status"; }
```

```mooncram
$ run_moon_ide moon ide find-references 'Default_init_capacity' --loc 'src/IndexMap.mbt:2:7'
Found 1 references for symbol 'Default_init_capacity':
<WORKDIR>/src/IndexMap.mbt:27:36-27:57:
   | /// let map : @IndexMap.T[String, Int] = @IndexMap.new(capacity=16)
   | /// inspect(map.capacity(), content="16")
   | /// inspect(map.is_empty(), content="true")
27 | pub fn[K, V] new(capacity? : Int = Default_init_capacity) -> T[K, V] {
   |                                    ^^^^^^^^^^^^^^^^^^^^^
   |   {
   |     core: {

```
