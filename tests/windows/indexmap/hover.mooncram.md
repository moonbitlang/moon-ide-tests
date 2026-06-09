# indexmap hover

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\indexmap' moon ide hover 'Bucket' --loc 'src\types.mbt:17:13'
///|
/// 桶结构，包含键值对信息和链表指针
priv struct Bucket[K, V] {
            ^^^^^^
            ```moonbit
            struct Bucket[K, V] {
              hash: Int
              key: K
              mut value: V
              mut next: Int
              mut prev: Int
            }
            ```
            ---
            
             桶结构，包含键值对信息和链表指针
  hash : Int // 键的哈希值（缓存以避免重复计算）
  key : K // 键
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\indexmap' moon ide hover 'hash' --loc 'src\types.mbt:18:3'
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
$ run_moon_ide '..\..\..\fixtures\repos\indexmap' moon ide hover 'Default_init_capacity' --loc 'src\IndexMap.mbt:2:7'
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
$ run_moon_ide '..\..\..\fixtures\repos\indexmap' moon ide hover 'calc_grow_threshold' --loc 'src\IndexMap.mbt:5:4'
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
$ run_moon_ide '..\..\..\fixtures\repos\indexmap' moon ide hover 'm' --loc 'src\IndexMap_test.mbt:17:7'
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
$ run_moon_ide '..\..\..\fixtures\repos\indexmap' moon ide hover 'T' --loc 'src\IndexMap_test.mbt:17:19'
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
