# indexmap rename Default_init_capacity src/IndexMap.mbt:2:7

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
$ run_moon_ide moon ide rename 'Default_init_capacity' 'Default_init_capacityRenamed' --loc 'src/IndexMap.mbt:2:7'
*** Begin Patch
*** Update File: <WORKDIR>/src/IndexMap.mbt
@@
 ///|
-const Default_init_capacity = 8
+const Default_init_capacityRenamed = 8
 
 ///|
 fn calc_grow_threshold(capacity : Int) -> Int {
@@
 /// let map : @IndexMap.T[String, Int] = @IndexMap.new(capacity=16)
 /// inspect(map.capacity(), content="16")
 /// inspect(map.is_empty(), content="true")
-pub fn[K, V] new(capacity? : Int = Default_init_capacity) -> T[K, V] {
+pub fn[K, V] new(capacity? : Int = Default_init_capacityRenamed) -> T[K, V] {
   {
     core: {
       hash_to_idx: @hashmap.HashMap([], capacity~),
*** End Patch

```
