# indexmap find-references

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\indexmap' moon ide find-references 'Bucket' --loc 'src\types.mbt:17:13'
Found 2 references for symbol 'Bucket':
<WORKDIR>/src\types.mbt:17:13-17:19:
   | 
   | ///|
   | /// 桶结构，包含键值对信息和链表指针
17 | priv struct Bucket[K, V] {
   |             ^^^^^^
   |   hash : Int // 键的哈希值（缓存以避免重复计算）
   |   key : K // 键

<WORKDIR>/src\types.mbt:29:23-29:29:
   | /// IndexMap核心结构，包含所有数据组织功能
   | priv struct IndexMapCore[K, V] {
   |   mut hash_to_idx : @hashmap.HashMap[Int, Int] // 哈希值到桶索引的映射
29 |   mut entries : Array[Bucket[K, V]] // 数组：存储实际的键值对及其链表信息
   |                       ^^^^^^
   |   mut head : Int // 链表头节点索引，-1表示空链表
   |   mut tail : Int // 链表尾节点索引，-1表示空链表

```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\indexmap' moon ide find-references 'hash' --loc 'src\types.mbt:18:3'
Found 6 references for symbol 'hash':
<WORKDIR>/src\IndexMap.mbt:112:5-112:9:
    |   // 创建新的桶
    |   let bucket_idx = self.core.entries.length()
    |   let new_bucket = {
112 |     hash,
    |     ^^^^
    |     key,
    |     value,

<WORKDIR>/src\IndexMap.mbt:176:5-176:9:
    |   // 创建新的桶
    |   let bucket_idx = self.core.entries.length()
    |   let new_bucket = {
176 |     hash,
    |     ^^^^
    |     key,
    |     value,

<WORKDIR>/src\IndexMap.mbt:438:24-438:28:
    |     Some(idx) => {
    |       // 获取被删除元素的链表信息
    |       let entry = self.core.entries[idx]
438 |       let hash = entry.hash
    |                        ^^^^
    | 
    |       // 获取被删除元素的位置索引

<WORKDIR>/src\IndexMap.mbt:1230:43-1230:47:
     |   }
     | 
     |   // 从哈希表和键到索引的映射中移除
1230 |   self.core.hash_to_idx.remove(tail_entry.hash)
     |                                           ^^^^
     |   self.key_to_idx.remove(key)
     | 

<WORKDIR>/src\IndexMap.mbt:1284:43-1284:47:
     |   }
     | 
     |   // 从哈希表和键到索引的映射中移除
1284 |   self.core.hash_to_idx.remove(head_entry.hash)
     |                                           ^^^^
     |   self.key_to_idx.remove(key)
     | 

<WORKDIR>/src\types.mbt:18:3-18:7:
   | ///|
   | /// 桶结构，包含键值对信息和链表指针
   | priv struct Bucket[K, V] {
18 |   hash : Int // 键的哈希值（缓存以避免重复计算）
   |   ^^^^
   |   key : K // 键
   |   mut value : V // 值

```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\indexmap' moon ide find-references 'Default_init_capacity' --loc 'src\IndexMap.mbt:2:7'
Found 2 references for symbol 'Default_init_capacity':
<WORKDIR>/src\IndexMap.mbt:2:7-2:28:
  | ///|
2 | const Default_init_capacity = 8
  |       ^^^^^^^^^^^^^^^^^^^^^
  | 
  | ///|

<WORKDIR>/src\IndexMap.mbt:27:36-27:57:
   | /// let map : @IndexMap.T[String, Int] = @IndexMap.new(capacity=16)
   | /// inspect(map.capacity(), content="16")
   | /// inspect(map.is_empty(), content="true")
27 | pub fn[K, V] new(capacity? : Int = Default_init_capacity) -> T[K, V] {
   |                                    ^^^^^^^^^^^^^^^^^^^^^
   |   {
   |     core: {

```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\indexmap' moon ide find-references 'calc_grow_threshold' --loc 'src\IndexMap.mbt:5:4'
Found 3 references for symbol 'calc_grow_threshold':
<WORKDIR>/src\IndexMap.mbt:5:4-5:23:
  | const Default_init_capacity = 8
  | 
  | ///|
5 | fn calc_grow_threshold(capacity : Int) -> Int {
  |    ^^^^^^^^^^^^^^^^^^^
  |   capacity * 3 / 4 // 75% 负载因子
  | }

<WORKDIR>/src\IndexMap.mbt:39:13-39:32:
   |     },
   |     size: 0,
   |     capacity,
39 |     growAt: calc_grow_threshold(capacity),
   |             ^^^^^^^^^^^^^^^^^^^
   |     key_to_idx: @hashmap.HashMap::default(),
   |   }

<WORKDIR>/src\IndexMap.mbt:780:17-780:36:
    |   } else {
    |     self.capacity = self.capacity * 2
    |   }
780 |   self.growAt = calc_grow_threshold(self.capacity)
    |                 ^^^^^^^^^^^^^^^^^^^
    |   self.core.hash_to_idx = @hashmap.HashMap([], capacity=self.capacity)
    |   self.core.entries = []

```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\indexmap' moon ide find-references 'm' --loc 'src\IndexMap_test.mbt:17:7'
Found 3 references for symbol 'm':
<WORKDIR>/src\IndexMap_test.mbt:17:7-17:8:
   | 
   | ///|
   | test "new" {
17 |   let m : @IndexMap.T[Int, Int] = @IndexMap.new()
   |       ^
   |   inspect(m.capacity(), content="8")
   |   @debug.assert_eq(m.size(), 0)

<WORKDIR>/src\IndexMap_test.mbt:18:11-18:12:
   | ///|
   | test "new" {
   |   let m : @IndexMap.T[Int, Int] = @IndexMap.new()
18 |   inspect(m.capacity(), content="8")
   |           ^
   |   @debug.assert_eq(m.size(), 0)
   | }

<WORKDIR>/src\IndexMap_test.mbt:19:20-19:21:
   | test "new" {
   |   let m : @IndexMap.T[Int, Int] = @IndexMap.new()
   |   inspect(m.capacity(), content="8")
19 |   @debug.assert_eq(m.size(), 0)
   |                    ^
   | }
   | 

```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\indexmap' moon ide find-references 'T' --loc 'src\IndexMap_test.mbt:17:19'
Found 116 references for symbol 'T':
<WORKDIR>/src\IndexMap.mbt:27:62-27:63:
   | /// let map : @IndexMap.T[String, Int] = @IndexMap.new(capacity=16)
   | /// inspect(map.capacity(), content="16")
   | /// inspect(map.is_empty(), content="true")
27 | pub fn[K, V] new(capacity? : Int = Default_init_capacity) -> T[K, V] {
   |                                                              ^
   |   {
   |     core: {

<WORKDIR>/src\IndexMap.mbt:65:61-65:62:
   | 
   | ///|
   | /// Create a map from an array of key-value pairs
65 | pub fn[K : Hash + Eq, V] from_array(arr : Array[(K, V)]) -> T[K, V] {
   |                                                             ^
   |   let map = new(capacity=arr.length())
   |   for i in 0..<arr.length() {

<WORKDIR>/src\IndexMap.mbt:97:26-97:27:
   | 
   | ///|
   | /// Sets a key-value pair into the map. If the key already exists, updates its value.
97 | pub fn[K : Hash + Eq, V] T::set(self : T[K, V], key : K, value : V) -> Unit {
   |                          ^
   |   // 计算哈希值
   |   let hash = key.hash()

<WORKDIR>/src\IndexMap.mbt:97:40-97:41:
   | 
   | ///|
   | /// Sets a key-value pair into the map. If the key already exists, updates its value.
97 | pub fn[K : Hash + Eq, V] T::set(self : T[K, V], key : K, value : V) -> Unit {
   |                                        ^
   |   // 计算哈希值
   |   let hash = key.hash()

<WORKDIR>/src\IndexMap.mbt:159:26-159:27:
    | 
    | ///|
    | /// Sets a key-value pair with a pre-computed hash
159 | pub fn[K : Hash + Eq, V] T::set_with_hash(
    |                          ^
    |   self : T[K, V],
    |   key : K,

<WORKDIR>/src\IndexMap.mbt:160:10-160:11:
    | ///|
    | /// Sets a key-value pair with a pre-computed hash
    | pub fn[K : Hash + Eq, V] T::set_with_hash(
160 |   self : T[K, V],
    |          ^
    |   key : K,
    |   value : V,

<WORKDIR>/src\IndexMap.mbt:236:26-236:27:
    | /// let map : @IndexMap.T[String, Int] = @IndexMap.new()
    | /// map["key"] = 42
    | /// inspect(map.get("key"), content="Some(42)")
236 | pub fn[K : Hash + Eq, V] T::op_set(self : T[K, V], key : K, value : V) -> Unit {
    |                          ^
    |   self.set(key, value)
    | }

<WORKDIR>/src\IndexMap.mbt:236:43-236:44:
    | /// let map : @IndexMap.T[String, Int] = @IndexMap.new()
    | /// map["key"] = 42
    | /// inspect(map.get("key"), content="Some(42)")
236 | pub fn[K : Hash + Eq, V] T::op_set(self : T[K, V], key : K, value : V) -> Unit {
    |                                           ^
    |   self.set(key, value)
    | }

<WORKDIR>/src\IndexMap.mbt:255:26-255:27:
    | /// let map = @IndexMap.of([("key", 42)])
    | /// inspect(map.get("key"), content="Some(42)")
    | /// inspect(map.get("nonexistent"), content="None")
255 | pub fn[K : Hash + Eq, V] T::get(self : T[K, V], key : K) -> V? {
    |                          ^
    |   // 直接从键到索引的映射中查找
    |   match self.key_to_idx.get(key) {

<WORKDIR>/src\IndexMap.mbt:255:40-255:41:
    | /// let map = @IndexMap.of([("key", 42)])
    | /// inspect(map.get("key"), content="Some(42)")
    | /// inspect(map.get("nonexistent"), content="None")
255 | pub fn[K : Hash + Eq, V] T::get(self : T[K, V], key : K) -> V? {
    |                                        ^
    |   // 直接从键到索引的映射中查找
    |   match self.key_to_idx.get(key) {

<WORKDIR>/src\IndexMap.mbt:265:14-265:15:
    | 
    | ///|
    | /// Gets the key-value pair at the given index position.
265 | pub fn[K, V] T::get_at(self : T[K, V], index : Int) -> (K, V)? {
    |              ^
    |   if index < 0 || index >= self.size {
    |     return None

<WORKDIR>/src\IndexMap.mbt:265:31-265:32:
    | 
    | ///|
    | /// Gets the key-value pair at the given index position.
265 | pub fn[K, V] T::get_at(self : T[K, V], index : Int) -> (K, V)? {
    |                               ^
    |   if index < 0 || index >= self.size {
    |     return None

<WORKDIR>/src\IndexMap.mbt:281:15-281:16:
    | }
    | 
    | ///|
281 | fn[K : Eq, V] T::get_with_hash(self : T[K, V], key : K, hash : Int) -> V? {
    |               ^
    |   // 首先检查哈希值是否在 hash_to_idx 中
    |   match self.core.hash_to_idx.get(hash) {

<WORKDIR>/src\IndexMap.mbt:281:39-281:40:
    | }
    | 
    | ///|
281 | fn[K : Eq, V] T::get_with_hash(self : T[K, V], key : K, hash : Int) -> V? {
    |                                       ^
    |   // 首先检查哈希值是否在 hash_to_idx 中
    |   match self.core.hash_to_idx.get(hash) {

<WORKDIR>/src\IndexMap.mbt:316:26-316:27:
    | /// let map = @IndexMap.of([("key", 42)])
    | /// inspect(map["key"], content="Some(42)")
    | /// inspect(map["nonexistent"], content="None")
316 | pub fn[K : Hash + Eq, V] T::op_get(self : T[K, V], key : K) -> V? {
    |                          ^
    |   self.get(key)
    | }

<WORKDIR>/src\IndexMap.mbt:316:43-316:44:
    | /// let map = @IndexMap.of([("key", 42)])
    | /// inspect(map["key"], content="Some(42)")
    | /// inspect(map["nonexistent"], content="None")
316 | pub fn[K : Hash + Eq, V] T::op_get(self : T[K, V], key : K) -> V? {
    |                                           ^
    |   self.get(key)
    | }

<WORKDIR>/src\IndexMap.mbt:341:26-341:27:
    | /// let value = map.get_or_init("key", fn() { 42 })
    | /// inspect(value, content="42")
    | /// inspect(map.get("key"), content="Some(42)")
341 | pub fn[K : Hash + Eq, V] T::get_or_init(
    |                          ^
    |   self : T[K, V],
    |   key : K,

<WORKDIR>/src\IndexMap.mbt:342:10-342:11:
    | /// inspect(value, content="42")
    | /// inspect(map.get("key"), content="Some(42)")
    | pub fn[K : Hash + Eq, V] T::get_or_init(
342 |   self : T[K, V],
    |          ^
    |   key : K,
    |   init : () -> V,

<WORKDIR>/src\IndexMap.mbt:375:26-375:27:
    | /// let map = @IndexMap.of([("a", 1), ("b", 2)])
    | /// inspect(map.get_or_default("a", 0), content="1")
    | /// inspect(map.get_or_default("c", 0), content="0")
375 | pub fn[K : Hash + Eq, V] T::get_or_default(
    |                          ^
    |   self : T[K, V],
    |   key : K,

<WORKDIR>/src\IndexMap.mbt:376:10-376:11:
    | /// inspect(map.get_or_default("a", 0), content="1")
    | /// inspect(map.get_or_default("c", 0), content="0")
    | pub fn[K : Hash + Eq, V] T::get_or_default(
376 |   self : T[K, V],
    |          ^
    |   key : K,
    |   default : V,

<WORKDIR>/src\IndexMap.mbt:401:26-401:27:
    | /// let map = @IndexMap.of([("a", 1), ("b", 2)])
    | /// inspect(map.contains("a"), content="true")
    | /// inspect(map.contains("c"), content="false")
401 | pub fn[K : Hash + Eq, V] T::contains(self : T[K, V], key : K) -> Bool {
    |                          ^
    |   match self.get(key) {
    |     Some(_) => true

<WORKDIR>/src\IndexMap.mbt:401:45-401:46:
    | /// let map = @IndexMap.of([("a", 1), ("b", 2)])
    | /// inspect(map.contains("a"), content="true")
    | /// inspect(map.contains("c"), content="false")
401 | pub fn[K : Hash + Eq, V] T::contains(self : T[K, V], key : K) -> Bool {
    |                                             ^
    |   match self.get(key) {
    |     Some(_) => true

<WORKDIR>/src\IndexMap.mbt:428:26-428:27:
    | 
    | ///|
    | /// Removes a key from the map.
428 | pub fn[K : Hash + Eq, V] T::remove(self : T[K, V], key : K) -> Unit {
    |                          ^
    |   if self.size == 0 {
    |     return

<WORKDIR>/src\IndexMap.mbt:428:43-428:44:
    | 
    | ///|
    | /// Removes a key from the map.
428 | pub fn[K : Hash + Eq, V] T::remove(self : T[K, V], key : K) -> Unit {
    |                                           ^
    |   if self.size == 0 {
    |     return

<WORKDIR>/src\IndexMap.mbt:513:58-513:59:
    | /// inspect(map.get(1), content="Some(\"one\")")
    | /// inspect(map.get(2), content="Some(\"two\")")
    | /// Create a map from a fixed array of key-value pairs
513 | pub fn[K : Hash + Eq, V] of(arr : FixedArray[(K, V)]) -> T[K, V] {
    |                                                          ^
    |   let map = new(capacity=arr.length())
    |   for i in 0..<arr.length() {

<WORKDIR>/src\IndexMap.mbt:545:102-545:103:
    | ///
    | /// let samples : Array[@IndexMap.T[Int, String]] = @quickcheck.samples(5)
    | /// inspect(samples.length(), content="5")
545 | pub impl[K : @quickcheck.Arbitrary + Hash + Eq, V : @quickcheck.Arbitrary] @quickcheck.Arbitrary for T[
    |                                                                                                      ^
    |   K,
    |   V,

<WORKDIR>/src\IndexMap.mbt:623:11-623:12:
    | 
    | ///|
    | test "set" {
623 |   let m : T[MyString, Int] = new()
    |           ^
    |   m.set("a", 1)
    |   m.set("b", 1)

<WORKDIR>/src\IndexMap.mbt:640:11-640:12:
    | 
    | ///|
    | test "remove" {
640 |   let m : T[MyString, Int] = new()
    |           ^
    |   m.set("a", 1)
    |   m.set("ab", 2)

<WORKDIR>/src\IndexMap.mbt:657:11-657:12:
    | 
    | ///|
    | test "remove_unexist_key" {
657 |   let m : T[MyString, Int] = new()
    |           ^
    |   m.set("a", 1)
    |   m.set("ab", 2)

<WORKDIR>/src\IndexMap.mbt:668:11-668:12:
    | 
    | ///|
    | test "clear" {
668 |   let m : T[MyString, Int] = of([("a", 1), ("b", 2), ("c", 3)])
    |           ^
    |   println(m.capacity())
    |   let old_capacity = m.capacity()

<WORKDIR>/src\IndexMap.mbt:691:11-691:12:
    | 
    | ///|
    | test "grow" {
691 |   let m : T[MyString, Int] = new()
    |           ^
    |   m.set("C", 1)
    |   m.set("Go", 2)

<WORKDIR>/src\IndexMap.mbt:710:14-710:15:
    | 
    | ///|
    | /// Returns the number of key-value pairs in the map.
710 | pub fn[K, V] T::size(self : T[K, V]) -> Int {
    |              ^
    |   self.size
    | }

<WORKDIR>/src\IndexMap.mbt:710:29-710:30:
    | 
    | ///|
    | /// Returns the number of key-value pairs in the map.
710 | pub fn[K, V] T::size(self : T[K, V]) -> Int {
    |                             ^
    |   self.size
    | }

<WORKDIR>/src\IndexMap.mbt:715:14-715:15:
    | }
    | 
    | ///|
715 | pub fn[K, V] T::capacity(self : T[K, V]) -> Int {
    |              ^
    |   self.capacity
    | }

<WORKDIR>/src\IndexMap.mbt:715:33-715:34:
    | }
    | 
    | ///|
715 | pub fn[K, V] T::capacity(self : T[K, V]) -> Int {
    |                                 ^
    |   self.capacity
    | }

<WORKDIR>/src\IndexMap.mbt:721:14-721:15:
    | 
    | ///|
    | /// Check if the map is empty.
721 | pub fn[K, V] T::is_empty(self : T[K, V]) -> Bool {
    |              ^
    |   self.size == 0
    | }

<WORKDIR>/src\IndexMap.mbt:721:33-721:34:
    | 
    | ///|
    | /// Check if the map is empty.
721 | pub fn[K, V] T::is_empty(self : T[K, V]) -> Bool {
    |                                 ^
    |   self.size == 0
    | }

<WORKDIR>/src\IndexMap.mbt:727:26-727:27:
    | 
    | ///|
    | /// Check if the map contains a key.
727 | pub fn[K : Hash + Eq, V] T::contains_key(self : T[K, V], key : K) -> Bool {
    |                          ^
    |   self.key_to_idx.contains(key)
    | }

<WORKDIR>/src\IndexMap.mbt:727:49-727:50:
    | 
    | ///|
    | /// Check if the map contains a key.
727 | pub fn[K : Hash + Eq, V] T::contains_key(self : T[K, V], key : K) -> Bool {
    |                                                 ^
    |   self.key_to_idx.contains(key)
    | }

<WORKDIR>/src\IndexMap.mbt:733:14-733:15:
    | 
    | ///|
    | /// Clears the map, removing all key-value pairs.
733 | pub fn[K, V] T::clear(self : T[K, V]) -> Unit {
    |              ^
    |   self.core.hash_to_idx.clear()
    |   self.core.entries = []

<WORKDIR>/src\IndexMap.mbt:733:30-733:31:
    | 
    | ///|
    | /// Clears the map, removing all key-value pairs.
733 | pub fn[K, V] T::clear(self : T[K, V]) -> Unit {
    |                              ^
    |   self.core.hash_to_idx.clear()
    |   self.core.entries = []

<WORKDIR>/src\IndexMap.mbt:749:14-749:15:
    | 
    | ///|
    | /// Convert the map to an array of key-value pairs
749 | pub fn[K, V] T::to_array(self : T[K, V]) -> Array[(K, V)] {
    |              ^
    |   if self.size == 0 {
    |     return []

<WORKDIR>/src\IndexMap.mbt:749:33-749:34:
    | 
    | ///|
    | /// Convert the map to an array of key-value pairs
749 | pub fn[K, V] T::to_array(self : T[K, V]) -> Array[(K, V)] {
    |                                 ^
    |   if self.size == 0 {
    |     return []

<WORKDIR>/src\IndexMap.mbt:769:22-769:23:
    | 
    | ///|
    | /// Grow the map capacity
769 | fn[K : Hash + Eq, V] T::grow(self : T[K, V]) -> Unit {
    |                      ^
    |   // 保存旧数据
    |   let old_entries = self.core.entries

<WORKDIR>/src\IndexMap.mbt:769:37-769:38:
    | 
    | ///|
    | /// Grow the map capacity
769 | fn[K : Hash + Eq, V] T::grow(self : T[K, V]) -> Unit {
    |                                     ^
    |   // 保存旧数据
    |   let old_entries = self.core.entries

<WORKDIR>/src\IndexMap.mbt:800:24-800:25:
    | }
    | 
    | ///|
800 | fn[K : Show, V : Show] T::debug_entries(self : T[K, V]) -> String {
    |                        ^
    |   let mut s = ""
    |   let mut current = self.core.head

<WORKDIR>/src\IndexMap.mbt:800:48-800:49:
    | }
    | 
    | ///|
800 | fn[K : Show, V : Show] T::debug_entries(self : T[K, V]) -> String {
    |                                                ^
    |   let mut s = ""
    |   let mut current = self.core.head

<WORKDIR>/src\IndexMap.mbt:833:14-833:15:
    | /// inspect(pairs.length(), content="2")
    | /// inspect(pairs[0], content="(1, \"one\")")
    | /// inspect(pairs[1], content="(2, \"two\")")
833 | pub fn[K, V] T::iter(self : T[K, V]) -> Iter[(K, V)] {
    |              ^
    |   let mut current = self.core.head
    |   Iter::new(fn() {

<WORKDIR>/src\IndexMap.mbt:833:29-833:30:
    | /// inspect(pairs.length(), content="2")
    | /// inspect(pairs[0], content="(1, \"one\")")
    | /// inspect(pairs[1], content="(2, \"two\")")
833 | pub fn[K, V] T::iter(self : T[K, V]) -> Iter[(K, V)] {
    |                             ^
    |   let mut current = self.core.head
    |   Iter::new(fn() {

<WORKDIR>/src\IndexMap.mbt:863:14-863:15:
    | /// let mut sum = 0
    | /// map.iter2().each(fn(k, _) { sum = sum + k })
    | /// inspect(sum, content="3")
863 | pub fn[K, V] T::iter2(self : T[K, V]) -> Iter2[K, V] {
    |              ^
    |   let mut current = self.core.head
    |   Iter2::new(fn() {

<WORKDIR>/src\IndexMap.mbt:863:30-863:31:
    | /// let mut sum = 0
    | /// map.iter2().each(fn(k, _) { sum = sum + k })
    | /// inspect(sum, content="3")
863 | pub fn[K, V] T::iter2(self : T[K, V]) -> Iter2[K, V] {
    |                              ^
    |   let mut current = self.core.head
    |   Iter2::new(fn() {

<WORKDIR>/src\IndexMap.mbt:903:60-903:61:
    | /// let map = @IndexMap.from_iter(iter)
    | /// inspect(map.get(1), content="Some(\"one\")")
    | /// inspect(map.get(2), content="Some(\"two\")")
903 | pub fn[K : Hash + Eq, V] from_iter(iter : Iter[(K, V)]) -> T[K, V] {
    |                                                            ^
    |   let m = new()
    |   iter.each(fn(e) { m.set(e.0, e.1) })

<WORKDIR>/src\IndexMap.mbt:928:26-928:27:
    | /// inspect(map.get(2), content="Some(\"two\")")
    | ///
    | #deprecated("use `@IndexMap.from_iter` instead")
928 | pub fn[K : Hash + Eq, V] T::from_iter(iter : Iter[(K, V)]) -> T[K, V] {
    |                          ^
    |   from_iter(iter)
    | }

<WORKDIR>/src\IndexMap.mbt:928:63-928:64:
    | /// inspect(map.get(2), content="Some(\"two\")")
    | ///
    | #deprecated("use `@IndexMap.from_iter` instead")
928 | pub fn[K : Hash + Eq, V] T::from_iter(iter : Iter[(K, V)]) -> T[K, V] {
    |                                                               ^
    |   from_iter(iter)
    | }

<WORKDIR>/src\IndexMap.mbt:948:14-948:15:
    | /// let mut result = ""
    | /// map.each(fn(k, v) { result = result + "\{k}:\{v}," })
    | /// inspect(result, content="1:one,2:two,")
948 | pub fn[K, V] T::each(self : T[K, V], f : (K, V) -> Unit) -> Unit {
    |              ^
    |   let mut current = self.core.head
    |   while current != -1 {

<WORKDIR>/src\IndexMap.mbt:948:29-948:30:
    | /// let mut result = ""
    | /// map.each(fn(k, v) { result = result + "\{k}:\{v}," })
    | /// inspect(result, content="1:one,2:two,")
948 | pub fn[K, V] T::each(self : T[K, V], f : (K, V) -> Unit) -> Unit {
    |                             ^
    |   let mut current = self.core.head
    |   while current != -1 {

<WORKDIR>/src\IndexMap.mbt:977:14-977:15:
    | /// map.eachi(fn(i, k, _) { if k == "b" { result = i } })
    | /// // "b" is at index 1
    | /// inspect(result, content="1")
977 | pub fn[K, V] T::eachi(self : T[K, V], f : (Int, K, V) -> Unit) -> Unit {
    |              ^
    |   let mut current = self.core.head
    |   let mut idx = 0

<WORKDIR>/src\IndexMap.mbt:977:30-977:31:
    | /// map.eachi(fn(i, k, _) { if k == "b" { result = i } })
    | /// // "b" is at index 1
    | /// inspect(result, content="1")
977 | pub fn[K, V] T::eachi(self : T[K, V], f : (Int, K, V) -> Unit) -> Unit {
    |                              ^
    |   let mut current = self.core.head
    |   let mut idx = 0

<WORKDIR>/src\IndexMap.mbt:1002:39-1002:40:
     | /// inspect(map, content=
     | /// #|IndexMap::of([(1, "one"), (2, "two")])
     | /// )
1002 | pub impl[K : Show, V : Show] Show for T[K, V] with output(self, logger) {
     |                                       ^
     |   logger.write_string("IndexMap::of([")
     |   self.eachi(fn(i, k, v) {

<WORKDIR>/src\IndexMap.mbt:1035:26-1035:27:
     | /// inspect(map.index_of("a"), content="Some(0)")
     | /// inspect(map.index_of("b"), content="Some(1)")
     | /// inspect(map.index_of("d"), content="None")
1035 | pub fn[K : Hash + Eq, V] T::index_of(self : T[K, V], key : K) -> Int? {
     |                          ^
     |   // 先检查键是否存在
     |   match self.key_to_idx.get(key) {

<WORKDIR>/src\IndexMap.mbt:1035:45-1035:46:
     | /// inspect(map.index_of("a"), content="Some(0)")
     | /// inspect(map.index_of("b"), content="Some(1)")
     | /// inspect(map.index_of("d"), content="None")
1035 | pub fn[K : Hash + Eq, V] T::index_of(self : T[K, V], key : K) -> Int? {
     |                                             ^
     |   // 先检查键是否存在
     |   match self.key_to_idx.get(key) {

<WORKDIR>/src\IndexMap.mbt:1059:14-1059:15:
     | ///
     | /// let map = @IndexMap.of([("a", 1), ("b", 2)])
     | /// inspect(map.first(), content="Some((\"a\", 1))")
1059 | pub fn[K, V] T::first(self : T[K, V]) -> (K, V)? {
     |              ^
     |   if self.size == 0 || self.core.head == -1 {
     |     return None

<WORKDIR>/src\IndexMap.mbt:1059:30-1059:31:
     | ///
     | /// let map = @IndexMap.of([("a", 1), ("b", 2)])
     | /// inspect(map.first(), content="Some((\"a\", 1))")
1059 | pub fn[K, V] T::first(self : T[K, V]) -> (K, V)? {
     |                              ^
     |   if self.size == 0 || self.core.head == -1 {
     |     return None

<WORKDIR>/src\IndexMap.mbt:1081:14-1081:15:
     | ///
     | /// let map = @IndexMap.of([("a", 1), ("b", 2)])
     | /// inspect(map.last(), content="Some((\"b\", 2))")
1081 | pub fn[K, V] T::last(self : T[K, V]) -> (K, V)? {
     |              ^
     |   if self.size == 0 || self.core.tail == -1 {
     |     return None

<WORKDIR>/src\IndexMap.mbt:1081:29-1081:30:
     | ///
     | /// let map = @IndexMap.of([("a", 1), ("b", 2)])
     | /// inspect(map.last(), content="Some((\"b\", 2))")
1081 | pub fn[K, V] T::last(self : T[K, V]) -> (K, V)? {
     |                             ^
     |   if self.size == 0 || self.core.tail == -1 {
     |     return None

<WORKDIR>/src\IndexMap.mbt:1102:14-1102:15:
     | ///
     | /// let map = @IndexMap.of([('a', 1), ('b', 2), ('c', 3)])
     | /// inspect(map.keys(), content=['a', 'b', 'c'])
1102 | pub fn[K, V] T::keys(self : T[K, V]) -> Array[K] {
     |              ^
     |   if self.size == 0 {
     |     return []

<WORKDIR>/src\IndexMap.mbt:1102:29-1102:30:
     | ///
     | /// let map = @IndexMap.of([('a', 1), ('b', 2), ('c', 3)])
     | /// inspect(map.keys(), content=['a', 'b', 'c'])
1102 | pub fn[K, V] T::keys(self : T[K, V]) -> Array[K] {
     |                             ^
     |   if self.size == 0 {
     |     return []

<WORKDIR>/src\IndexMap.mbt:1128:14-1128:15:
     | ///
     | /// let map = @IndexMap.of([('a', 1), ('b', 2), ('c', 3)])
     | /// inspect(map.values(), content=[1, 2, 3])
1128 | pub fn[K, V] T::values(self : T[K, V]) -> Array[V] {
     |              ^
     |   if self.size == 0 {
     |     return []

<WORKDIR>/src\IndexMap.mbt:1128:31-1128:32:
     | ///
     | /// let map = @IndexMap.of([('a', 1), ('b', 2), ('c', 3)])
     | /// inspect(map.values(), content=[1, 2, 3])
1128 | pub fn[K, V] T::values(self : T[K, V]) -> Array[V] {
     |                               ^
     |   if self.size == 0 {
     |     return []

<WORKDIR>/src\IndexMap.mbt:1154:30-1154:31:
     | ///
     | /// let map = @IndexMap.of([(1, 10), (2, 20), (3, 30)])
     | /// inspect(map.to_json_string(), content="{\"1\":10,\"2\":20,\"3\":30}")
1154 | pub fn[K : Show, V : ToJson] T::to_json_string(self : T[K, V]) -> String {
     |                              ^
     |   // 直接构建JSON字符串
     |   let mut result = "{"

<WORKDIR>/src\IndexMap.mbt:1154:55-1154:56:
     | ///
     | /// let map = @IndexMap.of([(1, 10), (2, 20), (3, 30)])
     | /// inspect(map.to_json_string(), content="{\"1\":10,\"2\":20,\"3\":30}")
1154 | pub fn[K : Show, V : ToJson] T::to_json_string(self : T[K, V]) -> String {
     |                                                       ^
     |   // 直接构建JSON字符串
     |   let mut result = "{"

<WORKDIR>/src\IndexMap.mbt:1178:43-1178:44:
     | 
     | ///|
     | /// Standard ToJson implementation (may not preserve order) (escaped)
1178 | pub impl[K : Show, V : ToJson] ToJson for T[K, V] with to_json(self) {
     |                                           ^
     |   // 使用普通Map
     |   let object = Map([], capacity=self.size)

<WORKDIR>/src\IndexMap.mbt:1208:26-1208:27:
     | /// inspect(map.pop(), content="Some((\"c\", 3))")
     | /// inspect(map.size(), content="2")
     | /// inspect(map.get("c"), content="None")
1208 | pub fn[K : Hash + Eq, V] T::pop(self : T[K, V]) -> (K, V)? {
     |                          ^
     |   if self.size == 0 || self.core.tail == -1 {
     |     return None

<WORKDIR>/src\IndexMap.mbt:1208:40-1208:41:
     | /// inspect(map.pop(), content="Some((\"c\", 3))")
     | /// inspect(map.size(), content="2")
     | /// inspect(map.get("c"), content="None")
1208 | pub fn[K : Hash + Eq, V] T::pop(self : T[K, V]) -> (K, V)? {
     |                                        ^
     |   if self.size == 0 || self.core.tail == -1 {
     |     return None

<WORKDIR>/src\IndexMap.mbt:1262:26-1262:27:
     | /// inspect(map.shift(), content="Some((\"a\", 1))")
     | /// inspect(map.size(), content="2")
     | /// inspect(map.get("a"), content="None")
1262 | pub fn[K : Hash + Eq, V] T::shift(self : T[K, V]) -> (K, V)? {
     |                          ^
     |   if self.size == 0 || self.core.head == -1 {
     |     return None

<WORKDIR>/src\IndexMap.mbt:1262:42-1262:43:
     | /// inspect(map.shift(), content="Some((\"a\", 1))")
     | /// inspect(map.size(), content="2")
     | /// inspect(map.get("a"), content="None")
1262 | pub fn[K : Hash + Eq, V] T::shift(self : T[K, V]) -> (K, V)? {
     |                                          ^
     |   if self.size == 0 || self.core.head == -1 {
     |     return None

<WORKDIR>/src\IndexMap.mbt:1328:14-1328:15:
     | /// let map = @IndexMap.of([("a", 1), ("b", 2)])
     | /// inspect(map.get_first(), content="Some((\"a\", 1))")
     | /// inspect(map.size(), content="2")  // 元素没有被移除
1328 | pub fn[K, V] T::get_first(self : T[K, V]) -> (K, V)? {
     |              ^
     |   if self.size == 0 || self.core.head == -1 {
     |     return None

<WORKDIR>/src\IndexMap.mbt:1328:34-1328:35:
     | /// let map = @IndexMap.of([("a", 1), ("b", 2)])
     | /// inspect(map.get_first(), content="Some((\"a\", 1))")
     | /// inspect(map.size(), content="2")  // 元素没有被移除
1328 | pub fn[K, V] T::get_first(self : T[K, V]) -> (K, V)? {
     |                                  ^
     |   if self.size == 0 || self.core.head == -1 {
     |     return None

<WORKDIR>/src\IndexMap.mbt:1351:14-1351:15:
     | /// let map = @IndexMap.of([("a", 1), ("b", 2)])
     | /// inspect(map.get_last(), content="Some((\"b\", 2))")
     | /// inspect(map.size(), content="2")  // 元素没有被移除
1351 | pub fn[K, V] T::get_last(self : T[K, V]) -> (K, V)? {
     |              ^
     |   if self.size == 0 || self.core.tail == -1 {
     |     return None

<WORKDIR>/src\IndexMap.mbt:1351:33-1351:34:
     | /// let map = @IndexMap.of([("a", 1), ("b", 2)])
     | /// inspect(map.get_last(), content="Some((\"b\", 2))")
     | /// inspect(map.size(), content="2")  // 元素没有被移除
1351 | pub fn[K, V] T::get_last(self : T[K, V]) -> (K, V)? {
     |                                 ^
     |   if self.size == 0 || self.core.tail == -1 {
     |     return None

<WORKDIR>/src\IndexMap.mbt:1360:14-1360:15:
     | }
     | 
     | ///|
1360 | pub fn[K, V] T::sort_by(self : T[K, V], compare : (K, V, K, V) -> Int) -> Unit {
     |              ^
     |   if self.size <= 1 {
     |     return // 不需要排序

<WORKDIR>/src\IndexMap.mbt:1360:32-1360:33:
     | }
     | 
     | ///|
1360 | pub fn[K, V] T::sort_by(self : T[K, V], compare : (K, V, K, V) -> Int) -> Unit {
     |                                ^
     |   if self.size <= 1 {
     |     return // 不需要排序

<WORKDIR>/src\IndexMap.mbt:1410:14-1410:15:
     | }
     | 
     | ///|
1410 | pub fn[K, V] T::sort_by_key(self : T[K, V], compare : (K, K) -> Int) -> Unit {
     |              ^
     |   self.sort_by(fn(k1, _, k2, _) { compare(k1, k2) })
     | }

<WORKDIR>/src\IndexMap.mbt:1410:36-1410:37:
     | }
     | 
     | ///|
1410 | pub fn[K, V] T::sort_by_key(self : T[K, V], compare : (K, K) -> Int) -> Unit {
     |                                    ^
     |   self.sort_by(fn(k1, _, k2, _) { compare(k1, k2) })
     | }

<WORKDIR>/src\IndexMap.mbt:1415:14-1415:15:
     | }
     | 
     | ///|
1415 | pub fn[K, V] T::sort_by_value(self : T[K, V], compare : (V, V) -> Int) -> Unit {
     |              ^
     |   self.sort_by(fn(_, v1, _, v2) { compare(v1, v2) })
     | }

<WORKDIR>/src\IndexMap.mbt:1415:38-1415:39:
     | }
     | 
     | ///|
1415 | pub fn[K, V] T::sort_by_value(self : T[K, V], compare : (V, V) -> Int) -> Unit {
     |                                      ^
     |   self.sort_by(fn(_, v1, _, v2) { compare(v1, v2) })
     | }

<WORKDIR>/src\IndexMap.mbt:1420:24-1420:25:
     | }
     | 
     | ///|
1420 | pub fn[K : Compare, V] T::sort(self : T[K, V]) -> Unit {
     |                        ^
     |   self.sort_by_key(fn(k1, k2) {
     |     if k1 < k2 {

<WORKDIR>/src\IndexMap.mbt:1420:39-1420:40:
     | }
     | 
     | ///|
1420 | pub fn[K : Compare, V] T::sort(self : T[K, V]) -> Unit {
     |                                       ^
     |   self.sort_by_key(fn(k1, k2) {
     |     if k1 < k2 {

<WORKDIR>/src\IndexMap.mbt:1433:14-1433:15:
     | }
     | 
     | ///|
1433 | pub fn[K, V] T::reverse(self : T[K, V]) -> Unit {
     |              ^
     |   if self.size <= 1 {
     |     return // 不需要反转

<WORKDIR>/src\IndexMap.mbt:1433:32-1433:33:
     | }
     | 
     | ///|
1433 | pub fn[K, V] T::reverse(self : T[K, V]) -> Unit {
     |                                ^
     |   if self.size <= 1 {
     |     return // 不需要反转

<WORKDIR>/src\IndexMap.mbt:1471:26-1471:27:
     | }
     | 
     | ///|
1471 | pub fn[K : Hash + Eq, V] T::sorted_by(
     |                          ^
     |   self : T[K, V],
     |   compare : (K, V, K, V) -> Int,

<WORKDIR>/src\IndexMap.mbt:1472:10-1472:11:
     | 
     | ///|
     | pub fn[K : Hash + Eq, V] T::sorted_by(
1472 |   self : T[K, V],
     |          ^
     |   compare : (K, V, K, V) -> Int,
     | ) -> T[K, V] {

<WORKDIR>/src\IndexMap.mbt:1474:6-1474:7:
     | pub fn[K : Hash + Eq, V] T::sorted_by(
     |   self : T[K, V],
     |   compare : (K, V, K, V) -> Int,
1474 | ) -> T[K, V] {
     |      ^
     |   // 创建新映射
     |   let result = new(capacity=self.size)

<WORKDIR>/src\IndexMap.mbt:1498:26-1498:27:
     | }
     | 
     | ///|
1498 | pub fn[K : Hash + Eq, V] T::sorted_by_key(
     |                          ^
     |   self : T[K, V],
     |   compare : (K, K) -> Int,

<WORKDIR>/src\IndexMap.mbt:1499:10-1499:11:
     | 
     | ///|
     | pub fn[K : Hash + Eq, V] T::sorted_by_key(
1499 |   self : T[K, V],
     |          ^
     |   compare : (K, K) -> Int,
     | ) -> T[K, V] {

<WORKDIR>/src\IndexMap.mbt:1501:6-1501:7:
     | pub fn[K : Hash + Eq, V] T::sorted_by_key(
     |   self : T[K, V],
     |   compare : (K, K) -> Int,
1501 | ) -> T[K, V] {
     |      ^
     |   self.sorted_by(fn(k1, _, k2, _) { compare(k1, k2) })
     | }

<WORKDIR>/src\IndexMap.mbt:1506:26-1506:27:
     | }
     | 
     | ///|
1506 | pub fn[K : Hash + Eq, V] T::sorted_by_value(
     |                          ^
     |   self : T[K, V],
     |   compare : (V, V) -> Int,

<WORKDIR>/src\IndexMap.mbt:1507:10-1507:11:
     | 
     | ///|
     | pub fn[K : Hash + Eq, V] T::sorted_by_value(
1507 |   self : T[K, V],
     |          ^
     |   compare : (V, V) -> Int,
     | ) -> T[K, V] {

<WORKDIR>/src\IndexMap.mbt:1509:6-1509:7:
     | pub fn[K : Hash + Eq, V] T::sorted_by_value(
     |   self : T[K, V],
     |   compare : (V, V) -> Int,
1509 | ) -> T[K, V] {
     |      ^
     |   self.sorted_by(fn(_, v1, _, v2) { compare(v1, v2) })
     | }

<WORKDIR>/src\IndexMap.mbt:1514:36-1514:37:
     | }
     | 
     | ///|
1514 | pub fn[K : Hash + Eq + Compare, V] T::sorted(self : T[K, V]) -> T[K, V] {
     |                                    ^
     |   self.sorted_by_key(fn(k1, k2) {
     |     if k1 < k2 {

<WORKDIR>/src\IndexMap.mbt:1514:53-1514:54:
     | }
     | 
     | ///|
1514 | pub fn[K : Hash + Eq + Compare, V] T::sorted(self : T[K, V]) -> T[K, V] {
     |                                                     ^
     |   self.sorted_by_key(fn(k1, k2) {
     |     if k1 < k2 {

<WORKDIR>/src\IndexMap.mbt:1514:65-1514:66:
     | }
     | 
     | ///|
1514 | pub fn[K : Hash + Eq + Compare, V] T::sorted(self : T[K, V]) -> T[K, V] {
     |                                                                 ^
     |   self.sorted_by_key(fn(k1, k2) {
     |     if k1 < k2 {

<WORKDIR>/src\IndexMap.mbt:1527:36-1527:37:
     | }
     | 
     | ///|
1527 | pub fn[K : Hash + Eq, V : Compare] T::sorted_by_values(
     |                                    ^
     |   self : T[K, V],
     | ) -> T[K, V] {

<WORKDIR>/src\IndexMap.mbt:1528:10-1528:11:
     | 
     | ///|
     | pub fn[K : Hash + Eq, V : Compare] T::sorted_by_values(
1528 |   self : T[K, V],
     |          ^
     | ) -> T[K, V] {
     |   self.sorted_by_value(fn(v1, v2) {

<WORKDIR>/src\IndexMap.mbt:1529:6-1529:7:
     | ///|
     | pub fn[K : Hash + Eq, V : Compare] T::sorted_by_values(
     |   self : T[K, V],
1529 | ) -> T[K, V] {
     |      ^
     |   self.sorted_by_value(fn(v1, v2) {
     |     if v1 < v2 {

<WORKDIR>/src\IndexMap.mbt:1542:26-1542:27:
     | }
     | 
     | ///|
1542 | pub fn[K : Hash + Eq, V] T::reversed(self : T[K, V]) -> T[K, V] {
     |                          ^
     |   // 创建新映射
     |   let result = new(capacity=self.size)

<WORKDIR>/src\IndexMap.mbt:1542:45-1542:46:
     | }
     | 
     | ///|
1542 | pub fn[K : Hash + Eq, V] T::reversed(self : T[K, V]) -> T[K, V] {
     |                                             ^
     |   // 创建新映射
     |   let result = new(capacity=self.size)

<WORKDIR>/src\IndexMap.mbt:1542:57-1542:58:
     | }
     | 
     | ///|
1542 | pub fn[K : Hash + Eq, V] T::reversed(self : T[K, V]) -> T[K, V] {
     |                                                         ^
     |   // 创建新映射
     |   let result = new(capacity=self.size)

<WORKDIR>/src\IndexMap_test.mbt:17:21-17:22:
   | 
   | ///|
   | test "new" {
17 |   let m : @IndexMap.T[Int, Int] = @IndexMap.new()
   |                     ^
   |   inspect(m.capacity(), content="8")
   |   @debug.assert_eq(m.size(), 0)

<WORKDIR>/src\IndexMap_test.mbt:313:23-313:24:
    | 
    | ///|
    | test "from_iter empty iter" {
313 |   let map : @IndexMap.T[Int, Int] = @IndexMap.from_iter(Iter::empty())
    |                       ^
    |   inspect(map, content="IndexMap::of([])")
    | }

<WORKDIR>/src\IndexMap_test.mbt:319:23-319:24:
    | 
    | ///|
    | test "@IndexMap.contains/empty" {
319 |   let map : @IndexMap.T[Int, String] = @IndexMap.new()
    |                       ^
    |   inspect(map.contains(42), content="false")
    | }

<WORKDIR>/src\IndexMap_test.mbt:408:29-408:30:
    |   @debug.debug_inspect(map.get_at(4), content="None")
    | 
    |   // 测试空映射
408 |   let empty_map : @IndexMap.T[String, Int] = @IndexMap.new()
    |                             ^
    |   @debug.debug_inspect(empty_map.get_at(0), content="None")
    | 

<WORKDIR>/src\IndexMap_test.mbt:508:33-508:34:
    | 
    | ///|
    | test "IndexSet arbitrary" {
508 |   let samples : Array[@IndexMap.T[Int, Int]] = @quickcheck.samples(20)
    |                                 ^
    |   let sample_arrays_5_10 = []
    |   for sample in samples[5:10] {

<WORKDIR>/src\IndexMap_test.mbt:755:29-755:30:
    | /// 测试reverse函数处理size <= 1的情况
    | test "reverse_with_small_size" {
    |   // 测试空映射
755 |   let empty_map : @IndexMap.T[String, String] = @IndexMap.new()
    |                             ^
    |   let empty_keys_before = empty_map.keys()
    |   empty_map.reverse()

<WORKDIR>/src\IndexMap_test.mbt:1034:23-1034:24:
     | /// 测试容量为0情况下的自动扩容
     | test "growth_from_zero_capacity" {
     |   // 创建特殊情况：容量为0的映射
1034 |   let map : @IndexMap.T[String, Int] = @IndexMap.new(capacity=0)
     |                       ^
     | 
     |   // 验证初始容量

<WORKDIR>/src\types.mbt:54:8-54:9:
   | /// map.set(3, "updated")
   | /// assert_eq(map.get(3), Some("updated"))
   | /// assert_eq(map.get_at(0), (3, "updated"))  // Access by insertion order
54 | struct T[K, V] {
   |        ^
   |   core : IndexMapCore[K, V] // 包含核心数据结构
   |   mut size : Int // 元素数量

```
