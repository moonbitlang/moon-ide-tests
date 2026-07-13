# indexmap peek-def

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\indexmap' moon ide peek-def 'Default_init_capacity' --loc 'src\IndexMap.mbt:2:7'
Definition found at file <WORKDIR>/src\IndexMap.mbt
  | ///|
2 | const Default_init_capacity = 8
  |       ^^^^^^^^^^^^^^^^^^^^^
  | 
  | ///|
  | fn calc_grow_threshold(capacity : Int) -> Int {
  |   capacity * 3 / 4 // 75% 负载因子
  | }
  | 
  | ///|
  | /// Creates a new empty hash map with the specified initial capacity. The actual
  | /// capacity will be rounded up to the next power of 2 that is greater than or
  | /// equal to the requested capacity, with a minimum of 8.
  | ///
  | /// Parameters:
  | ///
  | /// * `capacity` : The desired minimum capacity of the hash map. Must be a
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\indexmap' moon ide peek-def 'calc_grow_threshold' --loc 'src\IndexMap.mbt:5:4'
Definition found at file <WORKDIR>/src\IndexMap.mbt
  | ///|
  | const Default_init_capacity = 8
  | 
  | ///|
5 | fn calc_grow_threshold(capacity : Int) -> Int {
  |    ^^^^^^^^^^^^^^^^^^^
  |   capacity * 3 / 4 // 75% 负载因子
  | }
  | 
  | ///|
  | /// Creates a new empty hash map with the specified initial capacity. The actual
  | /// capacity will be rounded up to the next power of 2 that is greater than or
  | /// equal to the requested capacity, with a minimum of 8.
  | ///
  | /// Parameters:
  | ///
  | /// * `capacity` : The desired minimum capacity of the hash map. Must be a
  | /// non-negative integer. Defaults to 8 if not specified.
  | ///
  | /// Returns a new empty hash map of type `T[K, V]`, where `K` is the key type and
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\indexmap' moon ide peek-def 'm' --loc 'src\IndexMap_test.mbt:17:7'
Definition found at file <WORKDIR>/src\IndexMap_test.mbt
   | // See the License for the specific language governing permissions and
   | // limitations under the License.
   | 
   | ///|
   | test "new" {
17 |   let m : @IndexMap.T[Int, Int] = @IndexMap.new()
   |       ^
   |   inspect(m.capacity(), content="8")
   |   @debug.assert_eq(m.size(), 0)
   | }
   | 
   | ///|
   | test "get" {
   |   let m = @IndexMap.new()
   |   m.set("a", 1)
   |   m.set("b", 2)
   |   m.set("c", 3)
   |   println(m.size())
   |   @debug.debug_inspect(m.get("a"), content="Some(1)")
   |   @debug.debug_inspect(m.get("b"), content="Some(2)")
   |   @debug.debug_inspect(m.get("c"), content="Some(3)")
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\indexmap' moon ide peek-def 'T' --loc 'src\IndexMap_test.mbt:17:19'
Definition found at file <WORKDIR>/src\types.mbt
   | /// assert_eq(map.get(2), None)
   | /// assert_eq(map.get(3), Some("three"))
   | /// map.set(3, "updated")
   | /// assert_eq(map.get(3), Some("updated"))
   | /// assert_eq(map.get_at(0), (3, "updated"))  // Access by insertion order
54 | struct T[K, V] {
   |        ^
   |   core : IndexMapCore[K, V] // 包含核心数据结构
   |   mut size : Int // 元素数量
   |   mut capacity : Int // 当前哈希表容量
   |   mut growAt : Int // 扩容阈值
   |   mut key_to_idx : @hashmap.HashMap[K, Int] // 键到索引的直接映射，用于O(1)查找
   | }
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\indexmap' moon ide peek-def 'Bucket' --loc 'src\types.mbt:17:13'
Definition found at file <WORKDIR>/src\types.mbt
   | // See the License for the specific language governing permissions and
   | // limitations under the License.
   | 
   | ///|
   | /// 桶结构，包含键值对信息和链表指针
17 | priv struct Bucket[K, V] {
   |             ^^^^^^
   |   hash : Int // 键的哈希值（缓存以避免重复计算）
   |   key : K // 键
   |   mut value : V // 值
   |   mut next : Int // 链表后继索引，-1表示没有后继
   |   mut prev : Int // 链表前驱索引，-1表示没有前驱
   | }
   | 
   | ///|
   | /// IndexMap核心结构，包含所有数据组织功能
   | priv struct IndexMapCore[K, V] {
   |   mut hash_to_idx : @hashmap.HashMap[Int, Int] // 哈希值到桶索引的映射
   |   mut entries : Array[Bucket[K, V]] // 数组：存储实际的键值对及其链表信息
   |   mut head : Int // 链表头节点索引，-1表示空链表
   |   mut tail : Int // 链表尾节点索引，-1表示空链表
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\indexmap' moon ide peek-def 'hash' --loc 'src\types.mbt:18:3'
Definition found at file <WORKDIR>/src\types.mbt
   | // limitations under the License.
   | 
   | ///|
   | /// 桶结构，包含键值对信息和链表指针
   | priv struct Bucket[K, V] {
18 |   hash : Int // 键的哈希值（缓存以避免重复计算）
   |   ^^^^
   |   key : K // 键
   |   mut value : V // 值
   |   mut next : Int // 链表后继索引，-1表示没有后继
   |   mut prev : Int // 链表前驱索引，-1表示没有前驱
   | }
   | 
   | ///|
   | /// IndexMap核心结构，包含所有数据组织功能
   | priv struct IndexMapCore[K, V] {
   |   mut hash_to_idx : @hashmap.HashMap[Int, Int] // 哈希值到桶索引的映射
   |   mut entries : Array[Bucket[K, V]] // 数组：存储实际的键值对及其链表信息
   |   mut head : Int // 链表头节点索引，-1表示空链表
   |   mut tail : Int // 链表尾节点索引，-1表示空链表
   |   mut position_to_idx : Array[Int] // 位置到桶索引的映射，支持O(1)的索引访问
```
