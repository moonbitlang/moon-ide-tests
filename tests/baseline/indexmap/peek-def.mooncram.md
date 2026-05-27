# indexmap peek-def

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
$ run_moon_ide moon ide peek-def Bucket --loc 'src/types.mbt:17:13'
Definition found at file <WORKDIR>/src/types.mbt
   | // See the License for the specific language governing permissions and (escaped)
   | // limitations under the License. (escaped)
   |  (escaped)
   | ///| (escaped)
   | /// 桶结构，包含键值对信息和链表指针 (escaped)
17 | priv struct Bucket[K, V] { (escaped)
   |             ^^^^^^ (escaped)
   |   hash : Int // 键的哈希值（缓存以避免重复计算） (escaped)
   |   key : K // 键 (escaped)
   |   mut value : V // 值 (escaped)
   |   mut next : Int // 链表后继索引，-1表示没有后继 (escaped)
   |   mut prev : Int // 链表前驱索引，-1表示没有前驱 (escaped)
   | } (escaped)
   |  (escaped)
   | ///| (escaped)
   | /// IndexMap核心结构，包含所有数据组织功能 (escaped)
   | priv struct IndexMapCore[K, V] { (escaped)
   |   mut hash_to_idx : @hashmap.HashMap[Int, Int] // 哈希值到桶索引的映射 (escaped)
   |   mut entries : Array[Bucket[K, V]] // 数组：存储实际的键值对及其链表信息 (escaped)
   |   mut head : Int // 链表头节点索引，-1表示空链表 (escaped)
   |   mut tail : Int // 链表尾节点索引，-1表示空链表 (escaped)
```

```mooncram
$ run_moon_ide moon ide peek-def K --loc 'src/types.mbt:17:20'
Definition found at file <WORKDIR>/src/types.mbt
   | // See the License for the specific language governing permissions and (escaped)
   | // limitations under the License. (escaped)
   |  (escaped)
   | ///| (escaped)
   | /// 桶结构，包含键值对信息和链表指针 (escaped)
17 | priv struct Bucket[K, V] { (escaped)
   |                    ^ (escaped)
   |   hash : Int // 键的哈希值（缓存以避免重复计算） (escaped)
   |   key : K // 键 (escaped)
   |   mut value : V // 值 (escaped)
   |   mut next : Int // 链表后继索引，-1表示没有后继 (escaped)
   |   mut prev : Int // 链表前驱索引，-1表示没有前驱 (escaped)
   | } (escaped)
   |  (escaped)
   | ///| (escaped)
   | /// IndexMap核心结构，包含所有数据组织功能 (escaped)
   | priv struct IndexMapCore[K, V] { (escaped)
   |   mut hash_to_idx : @hashmap.HashMap[Int, Int] // 哈希值到桶索引的映射 (escaped)
   |   mut entries : Array[Bucket[K, V]] // 数组：存储实际的键值对及其链表信息 (escaped)
   |   mut head : Int // 链表头节点索引，-1表示空链表 (escaped)
   |   mut tail : Int // 链表尾节点索引，-1表示空链表 (escaped)
```

```mooncram
$ run_moon_ide moon ide peek-def Default_init_capacity --loc 'src/IndexMap.mbt:2:7'
Definition found at file <WORKDIR>/src/IndexMap.mbt
  | ///| (escaped)
2 | const Default_init_capacity = 8 (escaped)
  |       ^^^^^^^^^^^^^^^^^^^^^ (escaped)
  |  (escaped)
  | ///| (escaped)
  | fn calc_grow_threshold(capacity : Int) -> Int { (escaped)
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
$ run_moon_ide moon ide peek-def calc_grow_threshold --loc 'src/IndexMap.mbt:5:4'
Definition found at file <WORKDIR>/src/IndexMap.mbt
  | ///| (escaped)
  | const Default_init_capacity = 8 (escaped)
  |  (escaped)
  | ///| (escaped)
5 | fn calc_grow_threshold(capacity : Int) -> Int { (escaped)
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
$ run_moon_ide moon ide peek-def m --loc 'src/IndexMap_test.mbt:17:7'
Definition found at file <WORKDIR>/src/IndexMap_test.mbt
   | // See the License for the specific language governing permissions and (escaped)
   | // limitations under the License. (escaped)
   |  (escaped)
   | ///| (escaped)
   | test "new" { (escaped)
17 |   let m : @IndexMap.T[Int, Int] = @IndexMap.new() (escaped)
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
$ run_moon_ide moon ide peek-def T --loc 'src/IndexMap_test.mbt:17:19'
Definition found at file <WORKDIR>/src/types.mbt
   | /// assert_eq(map.get(2), None) (escaped)
   | /// assert_eq(map.get(3), Some("three")) (escaped)
   | /// map.set(3, "updated") (escaped)
   | /// assert_eq(map.get(3), Some("updated")) (escaped)
   | /// assert_eq(map.get_at(0), (3, "updated"))  // Access by insertion order (escaped)
54 | struct T[K, V] { (escaped)
   |        ^ (escaped)
   |   core : IndexMapCore[K, V] // 包含核心数据结构 (escaped)
   |   mut size : Int // 元素数量 (escaped)
   |   mut capacity : Int // 当前哈希表容量 (escaped)
   |   mut growAt : Int // 扩容阈值 (escaped)
   |   mut key_to_idx : @hashmap.HashMap[K, Int] // 键到索引的直接映射，用于O(1)查找 (escaped)
   | } (escaped)
```

```mooncram
$ run_moon_ide moon ide peek-def 'Bucket'
Found 1 symbols matching 'Bucket':

`priv struct Bucket` in package kesmeey/IndexMap at <WORKDIR>/src/types.mbt:15-23
15 | ///| (escaped)
   | /// 桶结构，包含键值对信息和链表指针 (escaped)
   | priv struct Bucket[K, V] { (escaped)
   |   hash : Int // 键的哈希值（缓存以避免重复计算） (escaped)
   |   key : K // 键 (escaped)
   |   mut value : V // 值 (escaped)
   |   mut next : Int // 链表后继索引，-1表示没有后继 (escaped)
   |   mut prev : Int // 链表前驱索引，-1表示没有前驱 (escaped)
   | } (no-eol) (escaped)
```

```mooncram
$ run_moon_ide moon ide peek-def 'IndexMapCore'
Found 1 symbols matching 'IndexMapCore':

`priv struct IndexMapCore` in package kesmeey/IndexMap at <WORKDIR>/src/types.mbt:25-34
25 | ///| (escaped)
   | /// IndexMap核心结构，包含所有数据组织功能 (escaped)
   | priv struct IndexMapCore[K, V] { (escaped)
   |   mut hash_to_idx : @hashmap.HashMap[Int, Int] // 哈希值到桶索引的映射 (escaped)
   |   mut entries : Array[Bucket[K, V]] // 数组：存储实际的键值对及其链表信息 (escaped)
   |   mut head : Int // 链表头节点索引，-1表示空链表 (escaped)
   |   mut tail : Int // 链表尾节点索引，-1表示空链表 (escaped)
   |   mut position_to_idx : Array[Int] // 位置到桶索引的映射，支持O(1)的索引访问 (escaped)
   |   mut idx_to_position : @hashmap.HashMap[Int, Int] // 桶索引到位置的映射，使index_of操作为O(1) (escaped)
   | } (no-eol) (escaped)
```

```mooncram
$ run_moon_ide moon ide peek-def 'T'
Found 18 symbols matching 'T':

`struct T` in package kesmeey/IndexMap at <WORKDIR>/src/types.mbt:42-60
42 | ///| (escaped)
   | /// Mutable indexed hash map, not thread safe. (escaped)
   | /// Maintains insertion order and allows access by index. (escaped)
   | /// (escaped)
   | /// # Example (escaped)
   | /// (escaped)
   | /// let map = @IndexMap.of([(3, "three"), (8, "eight"), (1, "one")]) (escaped)
   | /// assert_eq(map.get(2), None) (escaped)
   | /// assert_eq(map.get(3), Some("three")) (escaped)
   | /// map.set(3, "updated") (escaped)
   | /// assert_eq(map.get(3), Some("updated")) (escaped)
   | /// assert_eq(map.get_at(0), (3, "updated"))  // Access by insertion order (escaped)
   | struct T[K, V] { (escaped)
   |   core : IndexMapCore[K, V] // 包含核心数据结构 (escaped)
   |   mut size : Int // 元素数量 (escaped)
   |   mut capacity : Int // 当前哈希表容量 (escaped)
   |   mut growAt : Int // 扩容阈值 (escaped)
   |   mut key_to_idx : @hashmap.HashMap[K, Int] // 键到索引的直接映射，用于O(1)查找 (escaped)
   | } (escaped)

`type alias T` in package moonbitlang/core/bench at <MOON_HOME>/lib/core/bench/types.mbt:21-27
21 | ///| (escaped)
   | #alias(T) (escaped)
   | struct Bench { (escaped)
   |   buffer : StringBuilder (escaped)
   |   summaries : Array[Summary] (escaped)
   |   mut _storage : &OpaqueValue (escaped)
   | } (escaped)

`type alias T` in package moonbitlang/core/buffer at <MOON_HOME>/lib/core/buffer/buffer.mbt:15-42
15 | ///| (escaped)
   | /// Extensible buffer. (escaped)
   | /// (escaped)
   | /// It provides accumulative concatenation of bytes in linear time. (escaped)
   | /// The capacity of buffer will automatically expand as necessary. (escaped)
   | /// (escaped)
   | /// Note: StringBuilder is recommended for string concatenation in favor of (escaped)
   | /// Buffer, since it is optimized for all targets. (escaped)
   | /// # Usage (escaped)
   | /// (escaped)
   | /// ```mbt nocheck (escaped)
   | ///   let buf = Buffer(size_hint=100) (escaped)
   | ///   buf.write_string_utf16le("Tes") (escaped)
   | ///   buf.write_char_utf16le('t') (escaped)
   | ///   inspect( (escaped)
   | ///     buf.contents(),  (escaped)
   | ///     content=( (escaped)
   | ///        (escaped)
   | ///   #|b"T\\x00e\\x00s\\x00t\\x00" (escaped)
   | /// (escaped)
   | ///     ), (escaped)
   | ///   ) (escaped)
   | /// ``` (escaped)
   | #alias(T, deprecated) (escaped)
   | struct Buffer { (escaped)
   |   mut data : FixedArray[Byte] (escaped)
   |   mut len : Int (escaped)
   | } (escaped)

`type alias T` in package moonbitlang/core/deque at <MOON_HOME>/lib/core/deque/types.mbt:15-57
15 | ///| (escaped)
   | /// A double-ended queue (deque) backed by a growable circular buffer. (escaped)
   | /// (escaped)
   | /// This implementation follows the Rust `VecDeque` design: only `head` and `len` (escaped)
   | /// are stored, with `tail` computed on demand as `(head + len - 1) % cap`. (escaped)
   | /// (escaped)
   | /// Layout: (escaped)
   | /// ```text (escaped)
   | /// Wrapped case (head + len > cap): (escaped)
   | ///   buf: [4, 5, _, _, _, 1, 2, 3] (escaped)
   | ///              ^        ^ (escaped)
   | ///        (tail)       head (escaped)
   | ///   head = 5, len = 5, tail = (5 + 5 - 1) % 8 = 1 (escaped)
   | ///   Logical order: [1, 2, 3, 4, 5] (escaped)
   | /// (escaped)
   | /// Contiguous case (head + len <= cap): (escaped)
   | ///   buf: [_, 1, 2, 3, 4, 5, _, _] (escaped)
   | ///           ^           ^ (escaped)
   | ///         head       (tail) (escaped)
   | ///   head = 1, len = 5, tail = (1 + 5 - 1) % 8 = 5 (escaped)
   | ///   Logical order: [1, 2, 3, 4, 5] (escaped)
   | /// (escaped)
   | /// Empty case (len == 0): (escaped)
   | ///   buf: [_, _, _, _] (escaped)
   | ///           ^ (escaped)
   | ///         head (tail is undefined, not accessed) (escaped)
   | /// ``` (escaped)
   | /// (escaped)
   | /// Invariants: (escaped)
   | /// - `0 <= len <= buf.length()` (escaped)
   | /// - `0 <= head < buf.length()` (escaped)
   | /// - Element at index `i` is at `buf[(head + i) % buf.length()]` (escaped)
   | /// - When `len > 0`: front is `buf[head]`, back is `buf[(head + len - 1) % cap]` (escaped)
   | /// - When `len == 0`: no valid element, `head` can be any valid index (escaped)
   | #alias(T, deprecated) (escaped)
   | struct Deque[A] { (escaped)
   |   /// Circular buffer storing elements. May contain uninitialized slots. (escaped)
   |   mut buf : UninitializedArray[A] (escaped)
   |   /// Number of elements currently in the deque. (escaped)
   |   mut len : Int (escaped)
   |   /// Index of the first element (front). Valid range: 0 <= head < buf.length(). (escaped)
   |   mut head : Int (escaped)
   | } (escaped)

`type alias T` in package moonbitlang/core/hashmap at <MOON_HOME>/lib/core/hashmap/types.mbt:30-53
30 | ///| (escaped)
   | /// Mutable hash map, not thread safe. (escaped)
   | /// (escaped)
   | /// # Example (escaped)
   | /// (escaped)
   | /// ```mbt check (escaped)
   | /// test { (escaped)
   | ///   let map = @hashmap.HashMap([(3, "three"), (8, "eight"), (1, "one")]) (escaped)
   | ///   assert_eq(map.get(2), None) (escaped)
   | ///   assert_eq(map.get(3), Some("three")) (escaped)
   | ///   map.set(3, "updated") (escaped)
   | ///   assert_eq(map.get(3), Some("updated")) (escaped)
   | /// } (escaped)
   | /// ``` (escaped)
   | #alias(T, deprecated) (escaped)
   | struct HashMap[K, V] { (escaped)
   |   mut entries : FixedArray[Entry[K, V]?] (escaped)
   |   mut capacity : Int (escaped)
   |   mut capacity_mask : Int // capacity_mask = capacity - 1, used to find idx (escaped)
   |   // size of field `entries`, it is redundant but useful for performance (escaped)
   |   // so we don't need do `self.entries.length()` every time (escaped)
   |   mut size : Int // active key-value pairs count (escaped)
   |   // mut grow_at : Int // threshold that triggers grow (escaped)
   | } (escaped)

`type alias T` in package moonbitlang/core/hashset at <MOON_HOME>/lib/core/hashset/types.mbt:29-48
29 | ///| (escaped)
   | /// Mutable hash set, not thread safe. (escaped)
   | /// (escaped)
   | /// # Example (escaped)
   | /// (escaped)
   | /// ```mbt check (escaped)
   | /// test { (escaped)
   | ///   let set = @hashset.HashSet([(3, "three"), (8, "eight"), (1, "one")]) (escaped)
   | ///   set.add((4, "four")) (escaped)
   | ///   assert_eq(set.contains((4, "four")), true) (escaped)
   | /// } (escaped)
   | /// ``` (escaped)
   | #alias(T, deprecated) (escaped)
   | struct HashSet[K] { (escaped)
   |   mut entries : FixedArray[Entry[K]?] (escaped)
   |   mut size : Int // active key count (escaped)
   |   mut capacity : Int // current capacity (escaped)
   |   mut capacity_mask : Int // capacity_mask = capacity - 1, used to find idx (escaped)
   |   mut grow_at : Int // threshold that triggers grow (escaped)
   | } (escaped)

`struct T` in package moonbitlang/core/immut/array at <MOON_HOME>/lib/core/immut/array/types.mbt:15-24
15 | ///| (escaped)
   | /// Invariants: (escaped)
   | /// - `shift` = tree height * `num_bits`. When it is 0, we are at the leaf level. (escaped)
   | /// - `size` = the number of elements in the tree. (escaped)
   | /// - `shift` is not used when `tree` is `Empty`. (escaped)
   | struct T[A] { (escaped)
   |   tree : Tree[A] (escaped)
   |   size : Int (escaped)
   |   shift : Int (escaped)
   | } (escaped)

`type alias T` in package moonbitlang/core/immut/hashmap at <MOON_HOME>/lib/core/immut/hashmap/types.mbt:24-26
24 | ///| (escaped)
   | #alias(T, deprecated) (escaped)
   | struct HashMap[K, V](Node[K, V]?) derive(Eq) (escaped)

`type alias T` in package moonbitlang/core/immut/hashset at <MOON_HOME>/lib/core/immut/hashset/types.mbt:24-26
24 | ///| (escaped)
   | #alias(T, deprecated) (escaped)
   | struct HashSet[A](Node[A]?) derive(Eq) (escaped)

`type alias T` in package moonbitlang/core/immut/priority_queue at <MOON_HOME>/lib/core/immut/priority_queue/types.mbt:15-20
15 | ///| (escaped)
   | #alias(T, deprecated) (escaped)
   | struct PriorityQueue[A] { (escaped)
   |   node : Node[A] (escaped)
   |   size : Int (escaped)
   | } (escaped)

`type alias T` in package moonbitlang/core/immut/sorted_map at <MOON_HOME>/lib/core/immut/sorted_map/types.mbt:21-41
21 | ///| (escaped)
   | /// Immutable map, consists of key-value pairs. (escaped)
   | /// (escaped)
   | /// # Example (escaped)
   | /// (escaped)
   | /// ```mbt check (escaped)
   | /// test { (escaped)
   | ///   let map1 = @sorted_map.from_array([(3, "three"), (8, "eight"), (1, "one")]) (escaped)
   | ///   let map2 = map1.add(2, "two").remove(3) (escaped)
   | ///   assert_eq(map2.get(2), Some("two")) (escaped)
   | ///   let map3 = map2.add(2, "updated") (escaped)
   | ///   assert_eq(map2.get(3), None) (escaped)
   | ///   assert_eq(map3.get(3), None) (escaped)
   | ///   assert_eq(map3.get(2), Some("updated")) (escaped)
   | /// } (escaped)
   | /// ``` (escaped)
   | #alias(T, deprecated) (escaped)
   | enum SortedMap[K, V] { (escaped)
   |   Empty (escaped)
   |   Tree(K, value~ : V, size~ : Int, SortedMap[K, V], SortedMap[K, V]) (escaped)
   | } (escaped)

`type alias T` in package moonbitlang/core/immut/sorted_set at <MOON_HOME>/lib/core/immut/sorted_set/types.mbt:19-25
19 | ///| (escaped)
   | /// ImmutableSets are represented by balanced binary trees (the heights of the children differ by at most 2). (escaped)
   | #alias(T, deprecated) (escaped)
   | enum SortedSet[A] { (escaped)
   |   Empty (escaped)
   |   Node(left~ : SortedSet[A], right~ : SortedSet[A], size~ : Int, value~ : A) (escaped)
   | } (escaped)

`pub type alias T` in package moonbitlang/core/list at <MOON_HOME>/lib/core/list/types.mbt:15-21
15 | ///| (escaped)
   | /// Type `List` used by this package APIs. (escaped)
   | #alias(T, deprecated) (escaped)
   | pub enum List[A] { (escaped)
   |   Empty (escaped)
   |   More(A, mut tail~ : List[A]) (escaped)
   | } (escaped)

`type alias T` in package moonbitlang/core/priority_queue at <MOON_HOME>/lib/core/priority_queue/types.mbt:22-27
22 | ///| (escaped)
   | #alias(T, deprecated="Use PriorityQueue instead") (escaped)
   | struct PriorityQueue[A] { (escaped)
   |   mut len : Int (escaped)
   |   mut top : Node[A]? (escaped)
   | } (escaped)

`type alias T` in package moonbitlang/core/queue at <MOON_HOME>/lib/core/queue/types.mbt:21-39
21 | ///| (escaped)
   | /// A FIFO queue backed by a singly linked list of `Cons` cells. (escaped)
   | /// (escaped)
   | /// Layout: (escaped)
   | /// - `first` points to the head cell (front of the queue). (escaped)
   | /// - `last` points to the tail cell (back of the queue) and its `next` is None. (escaped)
   | /// - When empty, `first` and `last` are None and `length` is 0. (escaped)
   | /// (escaped)
   | /// We keep both `first` and `last` so `pop` and `push` are O(1) without (escaped)
   | /// scanning the list. (escaped)
   | #alias(T, deprecated) (escaped)
   | struct Queue[A] { (escaped)
   |   /// Number of elements in the queue. (escaped)
   |   mut length : Int (escaped)
   |   /// Head cell (front) for O(1) peek/pop. (escaped)
   |   mut first : Cons[A]? (escaped)
   |   /// Tail cell (back) for O(1) push/append. (escaped)
   |   mut last : Cons[A]? (escaped)
   | } (escaped)

`type alias T` in package moonbitlang/core/sorted_map at <MOON_HOME>/lib/core/sorted_map/types.mbt:24-29
24 | ///| (escaped)
   | #alias(T, deprecated) (escaped)
   | struct SortedMap[K, V] { (escaped)
   |   mut root : Node[K, V]? (escaped)
   |   mut size : Int (escaped)
   | } (escaped)

`type alias T` in package moonbitlang/core/sorted_set at <MOON_HOME>/lib/core/sorted_set/types.mbt:19-24
19 | ///| (escaped)
   | #alias(T, deprecated) (escaped)
   | struct SortedSet[V] { (escaped)
   |   mut root : Node[V]? (escaped)
   |   mut size : Int (escaped)
   | } (escaped)

`type alias T` in package moonbitlang/core/test at <MOON_HOME>/lib/core/test/types.mbt:15-20
15 | ///| (escaped)
   | #alias(T, deprecated) (escaped)
   | struct Test { (escaped)
   |   name : String (escaped)
   |   buffer : StringBuilder (escaped)
   | } derive(@debug.Debug) (no-eol) (escaped)
```

```mooncram
$ run_moon_ide moon ide peek-def 'Default_init_capacity'
Found 1 symbols matching 'Default_init_capacity':

`const Default_init_capacity` in package kesmeey/IndexMap at <WORKDIR>/src/IndexMap.mbt:1-2
1 | ///| (escaped)
  | const Default_init_capacity = 8 (no-eol) (escaped)
```

```mooncram
$ run_moon_ide moon ide peek-def 'calc_grow_threshold'
Found 4 symbols matching 'calc_grow_threshold':

`fn calc_grow_threshold` in package kesmeey/IndexMap at <WORKDIR>/src/IndexMap.mbt:4-7
4 | ///| (escaped)
  | fn calc_grow_threshold(capacity : Int) -> Int { (escaped)
  |   capacity * 3 / 4 // 75% 负载因子 (escaped)
  | } (escaped)

`fn calc_grow_threshold` in package moonbitlang/core/builtin at <MOON_HOME>/lib/core/builtin/linked_hash_map.mbt:582-585
582 | ///| (escaped)
    | fn calc_grow_threshold(capacity : Int) -> Int { (escaped)
    |   capacity * 13 / 16 (escaped)
    | } (escaped)

`fn calc_grow_threshold` in package moonbitlang/core/hashset at <MOON_HOME>/lib/core/hashset/hashset.mbt:491-494
491 | ///| (escaped)
    | fn calc_grow_threshold(capacity : Int) -> Int { (escaped)
    |   capacity * 13 / 16 (escaped)
    | } (escaped)

`fn calc_grow_threshold` in package moonbitlang/core/set at <MOON_HOME>/lib/core/set/grow_heuristic.mbt:15-18
15 | ///| (escaped)
   | fn calc_grow_threshold(capacity : Int) -> Int { (escaped)
   |   capacity * 13 / 16 (escaped)
   | } (no-eol) (escaped)
```

```mooncram
$ run_moon_ide moon ide peek-def 'new'
Found 25 symbols matching 'new':

`pub fn new` in package kesmeey/IndexMap at <WORKDIR>/src/IndexMap.mbt:9-42
9 | ///| (escaped)
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
  | /// `V` is the value type. (escaped)
  | /// (escaped)
  | /// Example: (escaped)
  | /// (escaped)
  | /// let map : @IndexMap.T[String, Int] = @IndexMap.new(capacity=16) (escaped)
  | /// inspect(map.capacity(), content="16") (escaped)
  | /// inspect(map.is_empty(), content="true") (escaped)
  | pub fn[K, V] new(capacity? : Int = Default_init_capacity) -> T[K, V] { (escaped)
  |   { (escaped)
  |     core: { (escaped)
  |       hash_to_idx: @hashmap.HashMap([], capacity~), (escaped)
  |       entries: [], (escaped)
  |       head: -1, (escaped)
  |       tail: -1, (escaped)
  |       position_to_idx: [], // 初始化为空数组 (escaped)
  |       idx_to_position: @hashmap.HashMap([], capacity~), // 初始化为空映射 (escaped)
  |     }, (escaped)
  |     size: 0, (escaped)
  |     capacity, (escaped)
  |     growAt: calc_grow_threshold(capacity), (escaped)
  |     key_to_idx: @hashmap.HashMap::default(), (escaped)
  |   } (escaped)
  | } (escaped)

`pub fn alias new` in package moonbitlang/core/bench at <MOON_HOME>/lib/core/bench/types.mbt:29-49
29 | ///| (escaped)
   | /// Create an empty benchmark collector. (escaped)
   | /// (escaped)
   | /// The returned `Bench` value can run benchmarks via `bench` and export (escaped)
   | /// collected summaries with `dump_summaries`. (escaped)
   | /// (escaped)
   | /// Example: (escaped)
   | /// (escaped)
   | /// ```mbt check (escaped)
   | /// test { (escaped)
   | ///   let b = @bench.new() (escaped)
   | ///   let json = b.dump_summaries() (escaped)
   | ///   inspect(json, content="[]") (escaped)
   | /// } (escaped)
   | /// ``` (escaped)
   | #as_free_fn (escaped)
   | pub fn Bench::new() -> Bench { (escaped)
   |   let buffer = StringBuilder() (escaped)
   |   let summaries = [] (escaped)
   |   { buffer, summaries, _storage: @ref.new(()) } (escaped)
   | } (escaped)

`pub fn new` in package moonbitlang/core/buffer at <MOON_HOME>/lib/core/buffer/buffer.mbt:107-131
107 | ///| (escaped)
    | /// Creates a new extensible buffer with specified initial capacity. If the (escaped)
    | /// initial capacity is less than 1, the buffer will be initialized with capacity (escaped)
    | /// 1. (escaped)
    | /// (escaped)
    | /// Parameters: (escaped)
    | /// (escaped)
    | /// * `size_hint` : Initial capacity of the buffer in bytes. Defaults to 0. (escaped)
    | /// (escaped)
    | /// Returns a new buffer of type `Buffer`. (escaped)
    | /// (escaped)
    | /// Example: (escaped)
    | /// (escaped)
    | /// ```mbt check (escaped)
    | /// test { (escaped)
    | ///   let buf = Buffer(size_hint=10) (escaped)
    | ///   inspect(buf.length(), content="0") (escaped)
    | ///   buf.write_string_utf16le("test") (escaped)
    | ///   inspect(buf.length(), content="8") (escaped)
    | /// } (escaped)
    | /// ``` (escaped)
    | #deprecated("use `Buffer()` instead (with `Buffer` in scope via the prelude)") (escaped)
    | pub fn new(size_hint? : Int = 0) -> Buffer { (escaped)
    |   Buffer(size_hint~) (escaped)
    | } (escaped)

`pub fn new` in package moonbitlang/core/bytes/internal/regex_engine/symbol_map at <MOON_HOME>/lib/core/bytes/internal/regex_engine/symbol_map/symbol_map.mbt:18-22
18 | ///| (escaped)
   | /// Create a new instance. (escaped)
   | pub fn new() -> SymbolMap { (escaped)
   |   SymbolMap(@sorted_set.SortedSet([])) (escaped)
   | } (escaped)

`pub fn alias new` in package moonbitlang/core/deque at <MOON_HOME>/lib/core/deque/deprecated.mbt:15-23
15 | ///| (escaped)
   | /// Creates a new empty deque with an optional initial capacity. (escaped)
   | /// (escaped)
   | /// Deprecated: use `Deque([], capacity=...)` instead. (escaped)
   | #deprecated("Use `Deque([], capacity=...)` instead") (escaped)
   | #as_free_fn(deprecated="Use `Deque([], capacity=...)` instead") (escaped)
   | pub fn[A] Deque::new(capacity? : Int = 0) -> Deque[A] { (escaped)
   |   new_deque(capacity) (escaped)
   | } (escaped)

`pub fn alias new` in package moonbitlang/core/hashmap at <MOON_HOME>/lib/core/hashmap/deprecated.mbt:15-27
15 | ///| (escaped)
   | /// Creates a new empty hash map with the specified initial capacity. The actual (escaped)
   | /// capacity will be rounded up to the next power of 2 that is greater than or (escaped)
   | /// equal to the requested capacity. (escaped)
   | /// (escaped)
   | /// Deprecated: use `HashMap([], capacity=...)` instead. (escaped)
   | #deprecated("Use `HashMap([], capacity=...)` instead") (escaped)
   | #as_free_fn(deprecated="Use `HashMap([], capacity=...)` instead") (escaped)
   | pub fn[K, V] HashMap::new( (escaped)
   |   capacity? : Int = default_init_capacity, (escaped)
   | ) -> HashMap[K, V] { (escaped)
   |   new_hashmap(capacity) (escaped)
   | } (escaped)

`pub fn alias new` in package moonbitlang/core/hashset at <MOON_HOME>/lib/core/hashset/deprecated.mbt:15-23
15 | ///| (escaped)
   | /// Creates an empty hash set with an optional initial capacity. (escaped)
   | /// (escaped)
   | /// Deprecated: use `HashSet([], capacity=...)` instead. (escaped)
   | #deprecated("Use `HashSet([], capacity=...)` instead") (escaped)
   | #as_free_fn(deprecated="Use `HashSet([], capacity=...)` instead") (escaped)
   | pub fn[K] HashSet::new(capacity? : Int = default_init_capacity) -> HashSet[K] { (escaped)
   |   new_hashset(capacity) (escaped)
   | } (escaped)

`pub fn alias new` in package moonbitlang/core/immut/array at <MOON_HOME>/lib/core/immut/array/array.mbt:19-25
19 | ///| (escaped)
   | /// Return a new empty array (escaped)
   | #deprecated("Use the corresponding function in `immut/vector` instead", skip_current_package=true) (escaped)
   | #as_free_fn(deprecated="Use the corresponding function in `immut/vector` instead") (escaped)
   | pub fn[A] T::new() -> T[A] { (escaped)
   |   { tree: Tree::empty(), size: 0, shift: 0 } (escaped)
   | } (escaped)

`pub fn alias new` in package moonbitlang/core/immut/hashmap at <MOON_HOME>/lib/core/immut/hashmap/HAMT.mbt:36-41
36 | ///| (escaped)
   | /// Create a new instance. (escaped)
   | #as_free_fn (escaped)
   | pub fn[K, V] HashMap::new() -> HashMap[K, V] { (escaped)
   |   None (escaped)
   | } (escaped)

`pub fn alias new` in package moonbitlang/core/immut/hashset at <MOON_HOME>/lib/core/immut/hashset/HAMT.mbt:30-35
30 | ///| (escaped)
   | /// Create a new instance. (escaped)
   | #as_free_fn (escaped)
   | pub fn[A] HashSet::new() -> HashSet[A] { (escaped)
   |   None (escaped)
   | } (escaped)

`pub fn alias new` in package moonbitlang/core/immut/priority_queue at <MOON_HOME>/lib/core/immut/priority_queue/deprecated.mbt:15-23
15 | ///| (escaped)
   | /// Creates a new empty immutable priority queue. (escaped)
   | /// (escaped)
   | /// Deprecated: use `PriorityQueue([])` instead. (escaped)
   | #deprecated("Use `PriorityQueue([])` instead") (escaped)
   | #as_free_fn(deprecated="Use `PriorityQueue([])` instead") (escaped)
   | pub fn[A] PriorityQueue::new() -> PriorityQueue[A] { (escaped)
   |   new_priority_queue() (escaped)
   | } (escaped)

`pub fn alias new` in package moonbitlang/core/immut/sorted_map at <MOON_HOME>/lib/core/immut/sorted_map/utils.mbt:15-21
15 | ///| (escaped)
   | /// Create an empty map. (escaped)
   | #as_free_fn (escaped)
   | #alias(empty, deprecated) (escaped)
   | pub fn[K, V] SortedMap::new() -> SortedMap[K, V] { (escaped)
   |   Empty (escaped)
   | } (escaped)

`pub fn alias new` in package moonbitlang/core/immut/sorted_set at <MOON_HOME>/lib/core/immut/sorted_set/immutable_set.mbt:21-26
21 | ///| (escaped)
   | /// Creates an empty immutable sorted set. (escaped)
   | #as_free_fn (escaped)
   | pub fn[A] SortedSet::new() -> SortedSet[A] { (escaped)
   |   Empty (escaped)
   | } (escaped)

`pub fn alias new` in package moonbitlang/core/immut/vector at <MOON_HOME>/lib/core/immut/vector/vector.mbt:19-24
19 | ///| (escaped)
   | /// Return a new empty vector (escaped)
   | #as_free_fn (escaped)
   | pub fn[A] Vector::new() -> Vector[A] { (escaped)
   |   make_t(Tree::empty(), [], 0, 0) (escaped)
   | } (escaped)

`pub fn alias new` in package moonbitlang/core/list at <MOON_HOME>/lib/core/list/list.mbt:15-31
15 | ///| (escaped)
   | /// Creates an empty list. (escaped)
   | /// (escaped)
   | /// # Example (escaped)
   | /// (escaped)
   | /// ```mbt check (escaped)
   | /// test { (escaped)
   | ///   let ls : @list.List[Int] = @list.new() (escaped)
   | ///   @debug.assert_eq(ls, @list.empty()) (escaped)
   | /// } (escaped)
   | /// ``` (escaped)
   | #alias(empty) (escaped)
   | #as_free_fn (escaped)
   | #as_free_fn(empty) (escaped)
   | pub fn[A] List::new() -> List[A] { (escaped)
   |   Empty (escaped)
   | } (escaped)

`pub fn alias new` in package moonbitlang/core/priority_queue at <MOON_HOME>/lib/core/priority_queue/deprecated.mbt:15-23
15 | ///| (escaped)
   | /// Creates a new empty priority queue. (escaped)
   | /// (escaped)
   | /// Deprecated: use `PriorityQueue([])` instead. (escaped)
   | #deprecated("Use `PriorityQueue([])` instead") (escaped)
   | #as_free_fn(deprecated="Use `PriorityQueue([])` instead") (escaped)
   | pub fn[A] PriorityQueue::new() -> PriorityQueue[A] { (escaped)
   |   new_priority_queue() (escaped)
   | } (escaped)

`pub fn alias new` in package moonbitlang/core/queue at <MOON_HOME>/lib/core/queue/deprecated.mbt:15-23
15 | ///| (escaped)
   | /// Creates a new empty queue. (escaped)
   | /// (escaped)
   | /// Deprecated: use `Queue([])` instead. (escaped)
   | #deprecated("Use `Queue([])` instead") (escaped)
   | #as_free_fn(deprecated="Use `Queue([])` instead") (escaped)
   | pub fn[A] Queue::new() -> Queue[A] { (escaped)
   |   new_queue() (escaped)
   | } (escaped)

`pub fn new` in package moonbitlang/core/quickcheck/splitmix at <MOON_HOME>/lib/core/quickcheck/splitmix/random.mbt:31-35
31 | ///| (escaped)
   | /// Create a new RandomState from an optional seed. (escaped)
   | pub fn new(seed? : UInt64 = 37) -> RandomState { (escaped)
   |   { seed: mix64(seed), gamma: mix_gamma(seed + golden_gamma) } (escaped)
   | } (escaped)

`pub fn new` in package moonbitlang/core/random at <MOON_HOME>/lib/core/random/deprecated.mbt:15-23
15 | ///| (escaped)
   | /// Create a new instance. (escaped)
   | #deprecated("Use `Rand::new()` instead") (escaped)
   | pub fn new(seed? : Bytes = b"ABCDEFGHIJKLMNOPQRSTUVWXYZ123456") -> Rand { (escaped)
   |   if seed.length() != 32 { (escaped)
   |     abort("seed must be 32 bytes long") (escaped)
   |   } (escaped)
   |   @random_source.ChaCha8::new(seed) as &Source (escaped)
   | } (escaped)

`pub fn new` in package moonbitlang/core/ref at <MOON_HOME>/lib/core/ref/ref.mbt:58-62
58 | ///| (escaped)
   | /// Same as the `Ref` constructor. (escaped)
   | pub fn[T] new(x : T) -> Ref[T] { (escaped)
   |   { val: x } (escaped)
   | } (escaped)

`pub fn alias new` in package moonbitlang/core/set at <MOON_HOME>/lib/core/set/deprecated.mbt:15-23
15 | ///| (escaped)
   | /// Creates an empty insertion-ordered hash set with an optional initial capacity. (escaped)
   | /// (escaped)
   | /// Deprecated: use `Set([], capacity=...)` instead. (escaped)
   | #deprecated("Use `Set([], capacity=...)` instead") (escaped)
   | #as_free_fn(deprecated="Use `Set([], capacity=...)` instead") (escaped)
   | pub fn[K] Set::new(capacity? : Int = default_init_capacity) -> Set[K] { (escaped)
   |   new_set(capacity) (escaped)
   | } (escaped)

`pub fn alias new` in package moonbitlang/core/sorted_map at <MOON_HOME>/lib/core/sorted_map/deprecated.mbt:15-23
15 | ///| (escaped)
   | /// Creates an empty sorted map. (escaped)
   | /// (escaped)
   | /// Deprecated: use `SortedMap([])` instead. (escaped)
   | #deprecated("Use `SortedMap([])` instead") (escaped)
   | #as_free_fn(deprecated="Use `SortedMap([])` instead") (escaped)
   | pub fn[K, V] SortedMap::new() -> SortedMap[K, V] { (escaped)
   |   new_sorted_map() (escaped)
   | } (escaped)

`pub fn alias new` in package moonbitlang/core/sorted_set at <MOON_HOME>/lib/core/sorted_set/deprecated.mbt:15-23
15 | ///| (escaped)
   | /// Construct an empty set. (escaped)
   | /// (escaped)
   | /// Deprecated: use `SortedSet([])` instead. (escaped)
   | #deprecated("Use `SortedSet([])` instead") (escaped)
   | #as_free_fn(deprecated="Use `SortedSet([])` instead") (escaped)
   | pub fn[V] SortedSet::new() -> SortedSet[V] { (escaped)
   |   new_sorted_set() (escaped)
   | } (escaped)

`pub fn new` in package moonbitlang/core/string/internal/regex_engine/symbol_map at <MOON_HOME>/lib/core/string/internal/regex_engine/symbol_map/symbol_map.mbt:18-22
18 | ///| (escaped)
   | /// Create a new instance. (escaped)
   | pub fn new() -> SymbolMap { (escaped)
   |   SymbolMap(@sorted_set.SortedSet([])) (escaped)
   | } (escaped)

`pub fn alias new` in package moonbitlang/core/test at <MOON_HOME>/lib/core/test/types.mbt:22-27
22 | ///| (escaped)
   | /// Create a new instance. (escaped)
   | #as_free_fn (escaped)
   | pub fn Test::new(name : String) -> Test { (escaped)
   |   { name, buffer: StringBuilder() } (escaped)
   | } (no-eol) (escaped)
```
