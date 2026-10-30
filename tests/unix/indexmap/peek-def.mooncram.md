# indexmap peek-def

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
$ run_moon_ide moon ide peek-def 'Default_init_capacity' --loc 'src/IndexMap.mbt:2:7'
Definition found at file <WORKDIR>/src/IndexMap.mbt
  | ///| (escaped)
2 | const Default_init_capacity = 8 (escaped)
  |       ^^^^^^^^^^^^^^^^^^^^^ (escaped)
  |  (escaped)
  | ///| (escaped)
  | fn calc_grow_threshold(capacity : Int32) -> Int32 {
  |   capacity * 3 / 4 // 75% 负载因子 (escaped)
  | } (escaped)
  |  (escaped)
  | ///| (escaped)
  | /// Creates a new empty hash map with the specified initial capacity. The actual (escaped)
  | /// capacity will be rounded up to the next power of 2 that is greater than or (escaped)
  | /// equal to the requested capacity, with a minimum of 8. (escaped)
  | /// (escaped)
  | /// Parameters: (escaped)
  | /// (escaped)
  | /// * `capacity` : The desired minimum capacity of the hash map. Must be a (escaped)
```

```mooncram
$ run_moon_ide moon ide peek-def 'calc_grow_threshold' --loc 'src/IndexMap.mbt:5:4'
Definition found at file <WORKDIR>/src/IndexMap.mbt
  | ///| (escaped)
  | const Default_init_capacity = 8 (escaped)
  |  (escaped)
  | ///| (escaped)
5 | fn calc_grow_threshold(capacity : Int32) -> Int32 {
  |    ^^^^^^^^^^^^^^^^^^^ (escaped)
  |   capacity * 3 / 4 // 75% 负载因子 (escaped)
  | } (escaped)
  |  (escaped)
  | ///| (escaped)
  | /// Creates a new empty hash map with the specified initial capacity. The actual (escaped)
  | /// capacity will be rounded up to the next power of 2 that is greater than or (escaped)
  | /// equal to the requested capacity, with a minimum of 8. (escaped)
  | /// (escaped)
  | /// Parameters: (escaped)
  | /// (escaped)
  | /// * `capacity` : The desired minimum capacity of the hash map. Must be a (escaped)
  | /// non-negative integer. Defaults to 8 if not specified. (escaped)
  | /// (escaped)
  | /// Returns a new empty hash map of type `T[K, V]`, where `K` is the key type and (escaped)
```

```mooncram
$ run_moon_ide moon ide peek-def 'm' --loc 'src/IndexMap_test.mbt:17:7'
Definition found at file <WORKDIR>/src/IndexMap_test.mbt
   | // See the License for the specific language governing permissions and (escaped)
   | // limitations under the License. (escaped)
   |  (escaped)
   | ///| (escaped)
   | test "new" { (escaped)
17 |   let m : @IndexMap.T[Int32, Int32] = @IndexMap.new()
   |       ^ (escaped)
   |   inspect(m.capacity(), content="8") (escaped)
   |   @debug.assert_eq(m.size(), 0) (escaped)
   | } (escaped)
   |  (escaped)
   | ///| (escaped)
   | test "get" { (escaped)
   |   let m = @IndexMap.new() (escaped)
   |   m.set("a", 1) (escaped)
   |   m.set("b", 2) (escaped)
   |   m.set("c", 3) (escaped)
   |   println(m.size()) (escaped)
   |   @debug.debug_inspect(m.get("a"), content="Some(1)") (escaped)
   |   @debug.debug_inspect(m.get("b"), content="Some(2)") (escaped)
   |   @debug.debug_inspect(m.get("c"), content="Some(3)") (escaped)
```

```mooncram
$ run_moon_ide moon ide peek-def 'T' --loc 'src/IndexMap_test.mbt:17:19'
Definition found at file <WORKDIR>/src/types.mbt
   | /// assert_eq(map.get(2), None) (escaped)
   | /// assert_eq(map.get(3), Some("three")) (escaped)
   | /// map.set(3, "updated") (escaped)
   | /// assert_eq(map.get(3), Some("updated")) (escaped)
   | /// assert_eq(map.get_at(0), (3, "updated"))  // Access by insertion order (escaped)
54 | struct T[K, V] { (escaped)
   |        ^ (escaped)
   |   core : IndexMapCore[K, V] // 包含核心数据结构 (escaped)
   |   mut size : Int32 // 元素数量
   |   mut capacity : Int32 // 当前哈希表容量
   |   mut growAt : Int32 // 扩容阈值
   |   mut key_to_idx : @hashmap.HashMap[K, Int32] // 键到索引的直接映射，用于O(1)查找
   | } (escaped)
```

```mooncram
$ run_moon_ide moon ide peek-def 'T' --loc 'src/extends.mbt:2:12'
Definition found at file <WORKDIR>/src/types.mbt
   | /// assert_eq(map.get(2), None)
   | /// assert_eq(map.get(3), Some("three"))
   | /// map.set(3, "updated")
   | /// assert_eq(map.get(3), Some("updated"))
   | /// assert_eq(map.get_at(0), (3, "updated"))  // Access by insertion order
54 | struct T[K, V] {
   |        ^
   |   core : IndexMapCore[K, V] // 包含核心数据结构
   |   mut size : Int32 // 元素数量
   |   mut capacity : Int32 // 当前哈希表容量
   |   mut growAt : Int32 // 扩容阈值
   |   mut key_to_idx : @hashmap.HashMap[K, Int32] // 键到索引的直接映射，用于O(1)查找
   | }
```

```mooncram
$ run_moon_ide moon ide peek-def 'Arbitrary' --loc 'src/extends.mbt:2:48'
Definition found at file <MOON_HOME>/lib/core/quickcheck/arbitrary.mbt
   | // See the License for the specific language governing permissions and
   | // limitations under the License.
   | 
   | ///|
   | /// Trait for types that can be randomly generated
17 | pub(open) trait Arbitrary {
   | ^
   |   // `arbitrary` takes a size hint and a random number generator, and returns a
   |   // generated value. Types whose complexity is independent of size may ignore
   |   // the hint.
   |   fn arbitrary(Int32, @splitmix.RandomState) -> Self
   | }
   | 
   | ///|
   | pub impl Arbitrary for Unit with fn arbitrary(_, _) {
   |   ()
   | }
   | 
   | ///|
   | pub impl Arbitrary for Bool with fn arbitrary(_, rs) {
   |   rs.next_double() < 0.5
   | }
   | 
   | ///|
   | pub impl Arbitrary for Byte with fn arbitrary(_, rs) {
   |   rs.next_uint().to_byte()
```

```mooncram
$ run_moon_ide moon ide peek-def 'Bucket' --loc 'src/types.mbt:17:13'
Definition found at file <WORKDIR>/src/types.mbt
   | // See the License for the specific language governing permissions and (escaped)
   | // limitations under the License. (escaped)
   |  (escaped)
   | ///| (escaped)
   | /// 桶结构，包含键值对信息和链表指针 (escaped)
17 | priv struct Bucket[K, V] { (escaped)
   |             ^^^^^^ (escaped)
   |   hash : Int32 // 键的哈希值（缓存以避免重复计算）
   |   key : K // 键 (escaped)
   |   mut value : V // 值 (escaped)
   |   mut next : Int32 // 链表后继索引，-1表示没有后继
   |   mut prev : Int32 // 链表前驱索引，-1表示没有前驱
   | } (escaped)
   |  (escaped)
   | ///| (escaped)
   | /// IndexMap核心结构，包含所有数据组织功能 (escaped)
   | priv struct IndexMapCore[K, V] { (escaped)
   |   mut hash_to_idx : @hashmap.HashMap[Int32, Int32] // 哈希值到桶索引的映射
   |   mut entries : Array[Bucket[K, V]] // 数组：存储实际的键值对及其链表信息 (escaped)
   |   mut head : Int32 // 链表头节点索引，-1表示空链表
   |   mut tail : Int32 // 链表尾节点索引，-1表示空链表
```

```mooncram
$ run_moon_ide moon ide peek-def 'hash' --loc 'src/types.mbt:18:3'
Definition found at file <WORKDIR>/src/types.mbt
   | // limitations under the License. (escaped)
   |  (escaped)
   | ///| (escaped)
   | /// 桶结构，包含键值对信息和链表指针 (escaped)
   | priv struct Bucket[K, V] { (escaped)
18 |   hash : Int32 // 键的哈希值（缓存以避免重复计算）
   |   ^^^^ (escaped)
   |   key : K // 键 (escaped)
   |   mut value : V // 值 (escaped)
   |   mut next : Int32 // 链表后继索引，-1表示没有后继
   |   mut prev : Int32 // 链表前驱索引，-1表示没有前驱
   | } (escaped)
   |  (escaped)
   | ///| (escaped)
   | /// IndexMap核心结构，包含所有数据组织功能 (escaped)
   | priv struct IndexMapCore[K, V] { (escaped)
   |   mut hash_to_idx : @hashmap.HashMap[Int32, Int32] // 哈希值到桶索引的映射
   |   mut entries : Array[Bucket[K, V]] // 数组：存储实际的键值对及其链表信息 (escaped)
   |   mut head : Int32 // 链表头节点索引，-1表示空链表
   |   mut tail : Int32 // 链表尾节点索引，-1表示空链表
   |   mut position_to_idx : Array[Int32] // 位置到桶索引的映射，支持O(1)的索引访问
```
