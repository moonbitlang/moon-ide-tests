# indexmap hover

```mooncram
$ export MOON_HOME="${MOON_HOME:-$HOME/.moon}"
```

```mooncram
$ export TEST_REPO_ROOT="$PWD"
```

```mooncram
$ normalize_moon_ide_output() { sed -e "s|$TEST_REPO_ROOT|<WORKDIR>|g" -e "s|$MOON_HOME|<MOON_HOME>|g"; }
```

```mooncram
$ run_moon_ide() { status_file="${TMPDIR:-/tmp}/moon-ide-status.$$"; ( "$@"; echo "$?" > "$status_file" ) 2>&1 | normalize_moon_ide_output; status=$(cat "$status_file"); rm -f "$status_file"; return "$status"; }
```

```mooncram
$ run_moon_ide moon ide hover 'hash' --loc 'src/types.mbt:18:3'
///|
/// 桶结构，包含键值对信息和链表指针
priv struct Bucket[K, V] {
  hash : Int // 键的哈希值（缓存以避免重复计算）
  ^^^^
  ```moonbit
  Int
  ```
  key : K // 键
  mut value : V // 值
```

```mooncram
$ run_moon_ide moon ide hover 'key' --loc 'src/types.mbt:19:3'
/// 桶结构，包含键值对信息和链表指针
priv struct Bucket[K, V] {
  hash : Int // 键的哈希值（缓存以避免重复计算）
  key : K // 键
  ^^^
  ```moonbit
  K
  ```
  mut value : V // 值
  mut next : Int // 链表后继索引，-1表示没有后继
```

```mooncram
$ run_moon_ide moon ide hover 'Default_init_capacity' --loc 'src/IndexMap.mbt:2:7'
///|
const Default_init_capacity = 8
      ^^^^^^^^^^^^^^^^^^^^^
      ```moonbit
      Int
      ```
      ---

///|
```

```mooncram
$ run_moon_ide moon ide hover 'calc_grow_threshold' --loc 'src/IndexMap.mbt:5:4'
const Default_init_capacity = 8

///|
fn calc_grow_threshold(capacity : Int) -> Int {
   ^^^^^^^^^^^^^^^^^^^
   ```moonbit
   fn calc_grow_threshold(capacity : Int) -> Int
   ```
  capacity * 3 / 4 // 75% 负载因子
}
```

```mooncram
$ run_moon_ide moon ide hover 'm' --loc 'src/IndexMap_test.mbt:17:7'
///|
test "new" {
  let m : @IndexMap.T[Int, Int] = @IndexMap.new()
      ^
      ```moonbit
      @IndexMap.T[Int, Int]
      ```
  inspect(m.capacity(), content="8")
  @debug.assert_eq(m.size(), 0)
```

```mooncram
$ run_moon_ide moon ide hover 'T' --loc 'src/IndexMap_test.mbt:17:19'
///|
test "new" {
  let m : @IndexMap.T[Int, Int] = @IndexMap.new()
          ^^^^^^^^^^^
          ```moonbit
          type @IndexMap.T[K, V]
          ```
          ---
          
           Mutable indexed hash map, not thread safe.
           Maintains insertion order and allows access by index.
          
           # Example
          
           let map = @IndexMap.of([(3, "three"), (8, "eight"), (1, "one")])
           assert_eq(map.get(2), None)
           assert_eq(map.get(3), Some("three"))
           map.set(3, "updated")
           assert_eq(map.get(3), Some("updated"))
           assert_eq(map.get_at(0), (3, "updated"))  // Access by insertion order
  inspect(m.capacity(), content="8")
  @debug.assert_eq(m.size(), 0)
```
