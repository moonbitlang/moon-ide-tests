# indexmap find-references

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
$ run_moon_ide moon ide find-references 'Bucket' --loc 'src/types.mbt:17:13'
Found 2 references for symbol 'Bucket':
<WORKDIR>/src/types.mbt:17:13-17:19:
   |  (escaped)
   | ///| (escaped)
   | /// 桶结构，包含键值对信息和链表指针 (escaped)
17 | priv struct Bucket[K, V] { (escaped)
   |             ^^^^^^ (escaped)
   |   hash : Int // 键的哈希值（缓存以避免重复计算） (escaped)
   |   key : K // 键 (escaped)

<WORKDIR>/src/types.mbt:29:23-29:29:
   | /// IndexMap核心结构，包含所有数据组织功能 (escaped)
   | priv struct IndexMapCore[K, V] { (escaped)
   |   mut hash_to_idx : @hashmap.HashMap[Int, Int] // 哈希值到桶索引的映射 (escaped)
29 |   mut entries : Array[Bucket[K, V]] // 数组：存储实际的键值对及其链表信息 (escaped)
   |                       ^^^^^^ (escaped)
   |   mut head : Int // 链表头节点索引，-1表示空链表 (escaped)
   |   mut tail : Int // 链表尾节点索引，-1表示空链表 (escaped)

```

```mooncram
$ run_moon_ide moon ide find-references 'hash' --loc 'src/types.mbt:18:3'
Found 6 references for symbol 'hash':
<WORKDIR>/src/IndexMap.mbt:112:5-112:9:
    |   // 创建新的桶 (escaped)
    |   let bucket_idx = self.core.entries.length() (escaped)
    |   let new_bucket = { (escaped)
112 |     hash, (escaped)
    |     ^^^^ (escaped)
    |     key, (escaped)
    |     value, (escaped)

<WORKDIR>/src/IndexMap.mbt:176:5-176:9:
    |   // 创建新的桶 (escaped)
    |   let bucket_idx = self.core.entries.length() (escaped)
    |   let new_bucket = { (escaped)
176 |     hash, (escaped)
    |     ^^^^ (escaped)
    |     key, (escaped)
    |     value, (escaped)

<WORKDIR>/src/IndexMap.mbt:438:24-438:28:
    |     Some(idx) => { (escaped)
    |       // 获取被删除元素的链表信息 (escaped)
    |       let entry = self.core.entries[idx] (escaped)
438 |       let hash = entry.hash (escaped)
    |                        ^^^^ (escaped)
    |  (escaped)
    |       // 获取被删除元素的位置索引 (escaped)

<WORKDIR>/src/IndexMap.mbt:1230:43-1230:47:
     |   } (escaped)
     |  (escaped)
     |   // 从哈希表和键到索引的映射中移除 (escaped)
1230 |   self.core.hash_to_idx.remove(tail_entry.hash) (escaped)
     |                                           ^^^^ (escaped)
     |   self.key_to_idx.remove(key) (escaped)
     |  (escaped)

<WORKDIR>/src/IndexMap.mbt:1284:43-1284:47:
     |   } (escaped)
     |  (escaped)
     |   // 从哈希表和键到索引的映射中移除 (escaped)
1284 |   self.core.hash_to_idx.remove(head_entry.hash) (escaped)
     |                                           ^^^^ (escaped)
     |   self.key_to_idx.remove(key) (escaped)
     |  (escaped)

<WORKDIR>/src/types.mbt:18:3-18:7:
   | ///| (escaped)
   | /// 桶结构，包含键值对信息和链表指针 (escaped)
   | priv struct Bucket[K, V] { (escaped)
18 |   hash : Int // 键的哈希值（缓存以避免重复计算） (escaped)
   |   ^^^^ (escaped)
   |   key : K // 键 (escaped)
   |   mut value : V // 值 (escaped)

```

```mooncram
$ run_moon_ide moon ide find-references 'Default_init_capacity' --loc 'src/IndexMap.mbt:2:7'
Found 2 references for symbol 'Default_init_capacity':
<WORKDIR>/src/IndexMap.mbt:2:7-2:28:
  | ///| (escaped)
2 | const Default_init_capacity = 8 (escaped)
  |       ^^^^^^^^^^^^^^^^^^^^^ (escaped)
  |  (escaped)
  | ///| (escaped)

<WORKDIR>/src/IndexMap.mbt:27:36-27:57:
   | /// let map : @IndexMap.T[String, Int] = @IndexMap.new(capacity=16) (escaped)
   | /// inspect(map.capacity(), content="16") (escaped)
   | /// inspect(map.is_empty(), content="true") (escaped)
27 | pub fn[K, V] new(capacity? : Int = Default_init_capacity) -> T[K, V] { (escaped)
   |                                    ^^^^^^^^^^^^^^^^^^^^^ (escaped)
   |   { (escaped)
   |     core: { (escaped)

```

```mooncram
$ run_moon_ide moon ide find-references 'calc_grow_threshold' --loc 'src/IndexMap.mbt:5:4'
Found 3 references for symbol 'calc_grow_threshold':
<WORKDIR>/src/IndexMap.mbt:5:4-5:23:
  | const Default_init_capacity = 8 (escaped)
  |  (escaped)
  | ///| (escaped)
5 | fn calc_grow_threshold(capacity : Int) -> Int { (escaped)
  |    ^^^^^^^^^^^^^^^^^^^ (escaped)
  |   capacity * 3 / 4 // 75% 负载因子 (escaped)
  | } (escaped)

<WORKDIR>/src/IndexMap.mbt:39:13-39:32:
   |     }, (escaped)
   |     size: 0, (escaped)
   |     capacity, (escaped)
39 |     growAt: calc_grow_threshold(capacity), (escaped)
   |             ^^^^^^^^^^^^^^^^^^^ (escaped)
   |     key_to_idx: @hashmap.HashMap::default(), (escaped)
   |   } (escaped)

<WORKDIR>/src/IndexMap.mbt:780:17-780:36:
    |   } else { (escaped)
    |     self.capacity = self.capacity * 2 (escaped)
    |   } (escaped)
780 |   self.growAt = calc_grow_threshold(self.capacity) (escaped)
    |                 ^^^^^^^^^^^^^^^^^^^ (escaped)
    |   self.core.hash_to_idx = @hashmap.HashMap([], capacity=self.capacity) (escaped)
    |   self.core.entries = [] (escaped)

```

```mooncram
$ run_moon_ide moon ide find-references 'm' --loc 'src/IndexMap_test.mbt:17:7'
Found 3 references for symbol 'm':
<WORKDIR>/src/IndexMap_test.mbt:17:7-17:8:
   |  (escaped)
   | ///| (escaped)
   | test "new" { (escaped)
17 |   let m : @IndexMap.T[Int, Int] = @IndexMap.new() (escaped)
   |       ^ (escaped)
   |   inspect(m.capacity(), content="8") (escaped)
   |   @debug.assert_eq(m.size(), 0) (escaped)

<WORKDIR>/src/IndexMap_test.mbt:18:11-18:12:
   | ///| (escaped)
   | test "new" { (escaped)
   |   let m : @IndexMap.T[Int, Int] = @IndexMap.new() (escaped)
18 |   inspect(m.capacity(), content="8") (escaped)
   |           ^ (escaped)
   |   @debug.assert_eq(m.size(), 0) (escaped)
   | } (escaped)

<WORKDIR>/src/IndexMap_test.mbt:19:20-19:21:
   | test "new" { (escaped)
   |   let m : @IndexMap.T[Int, Int] = @IndexMap.new() (escaped)
   |   inspect(m.capacity(), content="8") (escaped)
19 |   @debug.assert_eq(m.size(), 0) (escaped)
   |                    ^ (escaped)
   | } (escaped)
   |  (escaped)

```

```mooncram
$ run_moon_ide moon ide find-references 'T' --loc 'src/IndexMap_test.mbt:17:19'
Found 116 references for symbol 'T':
<WORKDIR>/src/IndexMap.mbt:27:62-27:63:
   | /// let map : @IndexMap.T[String, Int] = @IndexMap.new(capacity=16) (escaped)
   | /// inspect(map.capacity(), content="16") (escaped)
   | /// inspect(map.is_empty(), content="true") (escaped)
27 | pub fn[K, V] new(capacity? : Int = Default_init_capacity) -> T[K, V] { (escaped)
   |                                                              ^ (escaped)
   |   { (escaped)
   |     core: { (escaped)

<WORKDIR>/src/IndexMap.mbt:65:61-65:62:
   |  (escaped)
   | ///| (escaped)
   | /// Create a map from an array of key-value pairs (escaped)
65 | pub fn[K : Hash + Eq, V] from_array(arr : Array[(K, V)]) -> T[K, V] { (escaped)
   |                                                             ^ (escaped)
   |   let map = new(capacity=arr.length()) (escaped)
   |   for i in 0..<arr.length() { (escaped)

<WORKDIR>/src/IndexMap.mbt:97:26-97:27:
   |  (escaped)
   | ///| (escaped)
   | /// Sets a key-value pair into the map. If the key already exists, updates its value. (escaped)
97 | pub fn[K : Hash + Eq, V] T::set(self : T[K, V], key : K, value : V) -> Unit { (escaped)
   |                          ^ (escaped)
   |   // 计算哈希值 (escaped)
   |   let hash = key.hash() (escaped)

<WORKDIR>/src/IndexMap.mbt:97:40-97:41:
   |  (escaped)
   | ///| (escaped)
   | /// Sets a key-value pair into the map. If the key already exists, updates its value. (escaped)
97 | pub fn[K : Hash + Eq, V] T::set(self : T[K, V], key : K, value : V) -> Unit { (escaped)
   |                                        ^ (escaped)
   |   // 计算哈希值 (escaped)
   |   let hash = key.hash() (escaped)

<WORKDIR>/src/IndexMap.mbt:159:26-159:27:
    |  (escaped)
    | ///| (escaped)
    | /// Sets a key-value pair with a pre-computed hash (escaped)
159 | pub fn[K : Hash + Eq, V] T::set_with_hash( (escaped)
    |                          ^ (escaped)
    |   self : T[K, V], (escaped)
    |   key : K, (escaped)

<WORKDIR>/src/IndexMap.mbt:160:10-160:11:
    | ///| (escaped)
    | /// Sets a key-value pair with a pre-computed hash (escaped)
    | pub fn[K : Hash + Eq, V] T::set_with_hash( (escaped)
160 |   self : T[K, V], (escaped)
    |          ^ (escaped)
    |   key : K, (escaped)
    |   value : V, (escaped)

<WORKDIR>/src/IndexMap.mbt:236:26-236:27:
    | /// let map : @IndexMap.T[String, Int] = @IndexMap.new() (escaped)
    | /// map["key"] = 42 (escaped)
    | /// inspect(map.get("key"), content="Some(42)") (escaped)
236 | pub fn[K : Hash + Eq, V] T::op_set(self : T[K, V], key : K, value : V) -> Unit { (escaped)
    |                          ^ (escaped)
    |   self.set(key, value) (escaped)
    | } (escaped)

<WORKDIR>/src/IndexMap.mbt:236:43-236:44:
    | /// let map : @IndexMap.T[String, Int] = @IndexMap.new() (escaped)
    | /// map["key"] = 42 (escaped)
    | /// inspect(map.get("key"), content="Some(42)") (escaped)
236 | pub fn[K : Hash + Eq, V] T::op_set(self : T[K, V], key : K, value : V) -> Unit { (escaped)
    |                                           ^ (escaped)
    |   self.set(key, value) (escaped)
    | } (escaped)

<WORKDIR>/src/IndexMap.mbt:255:26-255:27:
    | /// let map = @IndexMap.of([("key", 42)]) (escaped)
    | /// inspect(map.get("key"), content="Some(42)") (escaped)
    | /// inspect(map.get("nonexistent"), content="None") (escaped)
255 | pub fn[K : Hash + Eq, V] T::get(self : T[K, V], key : K) -> V? { (escaped)
    |                          ^ (escaped)
    |   // 直接从键到索引的映射中查找 (escaped)
    |   match self.key_to_idx.get(key) { (escaped)

<WORKDIR>/src/IndexMap.mbt:255:40-255:41:
    | /// let map = @IndexMap.of([("key", 42)]) (escaped)
    | /// inspect(map.get("key"), content="Some(42)") (escaped)
    | /// inspect(map.get("nonexistent"), content="None") (escaped)
255 | pub fn[K : Hash + Eq, V] T::get(self : T[K, V], key : K) -> V? { (escaped)
    |                                        ^ (escaped)
    |   // 直接从键到索引的映射中查找 (escaped)
    |   match self.key_to_idx.get(key) { (escaped)

<WORKDIR>/src/IndexMap.mbt:265:14-265:15:
    |  (escaped)
    | ///| (escaped)
    | /// Gets the key-value pair at the given index position. (escaped)
265 | pub fn[K, V] T::get_at(self : T[K, V], index : Int) -> (K, V)? { (escaped)
    |              ^ (escaped)
    |   if index < 0 || index >= self.size { (escaped)
    |     return None (escaped)

<WORKDIR>/src/IndexMap.mbt:265:31-265:32:
    |  (escaped)
    | ///| (escaped)
    | /// Gets the key-value pair at the given index position. (escaped)
265 | pub fn[K, V] T::get_at(self : T[K, V], index : Int) -> (K, V)? { (escaped)
    |                               ^ (escaped)
    |   if index < 0 || index >= self.size { (escaped)
    |     return None (escaped)

<WORKDIR>/src/IndexMap.mbt:281:15-281:16:
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
281 | fn[K : Eq, V] T::get_with_hash(self : T[K, V], key : K, hash : Int) -> V? { (escaped)
    |               ^ (escaped)
    |   // 首先检查哈希值是否在 hash_to_idx 中 (escaped)
    |   match self.core.hash_to_idx.get(hash) { (escaped)

<WORKDIR>/src/IndexMap.mbt:281:39-281:40:
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
281 | fn[K : Eq, V] T::get_with_hash(self : T[K, V], key : K, hash : Int) -> V? { (escaped)
    |                                       ^ (escaped)
    |   // 首先检查哈希值是否在 hash_to_idx 中 (escaped)
    |   match self.core.hash_to_idx.get(hash) { (escaped)

<WORKDIR>/src/IndexMap.mbt:316:26-316:27:
    | /// let map = @IndexMap.of([("key", 42)]) (escaped)
    | /// inspect(map["key"], content="Some(42)") (escaped)
    | /// inspect(map["nonexistent"], content="None") (escaped)
316 | pub fn[K : Hash + Eq, V] T::op_get(self : T[K, V], key : K) -> V? { (escaped)
    |                          ^ (escaped)
    |   self.get(key) (escaped)
    | } (escaped)

<WORKDIR>/src/IndexMap.mbt:316:43-316:44:
    | /// let map = @IndexMap.of([("key", 42)]) (escaped)
    | /// inspect(map["key"], content="Some(42)") (escaped)
    | /// inspect(map["nonexistent"], content="None") (escaped)
316 | pub fn[K : Hash + Eq, V] T::op_get(self : T[K, V], key : K) -> V? { (escaped)
    |                                           ^ (escaped)
    |   self.get(key) (escaped)
    | } (escaped)

<WORKDIR>/src/IndexMap.mbt:341:26-341:27:
    | /// let value = map.get_or_init("key", fn() { 42 }) (escaped)
    | /// inspect(value, content="42") (escaped)
    | /// inspect(map.get("key"), content="Some(42)") (escaped)
341 | pub fn[K : Hash + Eq, V] T::get_or_init( (escaped)
    |                          ^ (escaped)
    |   self : T[K, V], (escaped)
    |   key : K, (escaped)

<WORKDIR>/src/IndexMap.mbt:342:10-342:11:
    | /// inspect(value, content="42") (escaped)
    | /// inspect(map.get("key"), content="Some(42)") (escaped)
    | pub fn[K : Hash + Eq, V] T::get_or_init( (escaped)
342 |   self : T[K, V], (escaped)
    |          ^ (escaped)
    |   key : K, (escaped)
    |   init : () -> V, (escaped)

<WORKDIR>/src/IndexMap.mbt:375:26-375:27:
    | /// let map = @IndexMap.of([("a", 1), ("b", 2)]) (escaped)
    | /// inspect(map.get_or_default("a", 0), content="1") (escaped)
    | /// inspect(map.get_or_default("c", 0), content="0") (escaped)
375 | pub fn[K : Hash + Eq, V] T::get_or_default( (escaped)
    |                          ^ (escaped)
    |   self : T[K, V], (escaped)
    |   key : K, (escaped)

<WORKDIR>/src/IndexMap.mbt:376:10-376:11:
    | /// inspect(map.get_or_default("a", 0), content="1") (escaped)
    | /// inspect(map.get_or_default("c", 0), content="0") (escaped)
    | pub fn[K : Hash + Eq, V] T::get_or_default( (escaped)
376 |   self : T[K, V], (escaped)
    |          ^ (escaped)
    |   key : K, (escaped)
    |   default : V, (escaped)

<WORKDIR>/src/IndexMap.mbt:401:26-401:27:
    | /// let map = @IndexMap.of([("a", 1), ("b", 2)]) (escaped)
    | /// inspect(map.contains("a"), content="true") (escaped)
    | /// inspect(map.contains("c"), content="false") (escaped)
401 | pub fn[K : Hash + Eq, V] T::contains(self : T[K, V], key : K) -> Bool { (escaped)
    |                          ^ (escaped)
    |   match self.get(key) { (escaped)
    |     Some(_) => true (escaped)

<WORKDIR>/src/IndexMap.mbt:401:45-401:46:
    | /// let map = @IndexMap.of([("a", 1), ("b", 2)]) (escaped)
    | /// inspect(map.contains("a"), content="true") (escaped)
    | /// inspect(map.contains("c"), content="false") (escaped)
401 | pub fn[K : Hash + Eq, V] T::contains(self : T[K, V], key : K) -> Bool { (escaped)
    |                                             ^ (escaped)
    |   match self.get(key) { (escaped)
    |     Some(_) => true (escaped)

<WORKDIR>/src/IndexMap.mbt:428:26-428:27:
    |  (escaped)
    | ///| (escaped)
    | /// Removes a key from the map. (escaped)
428 | pub fn[K : Hash + Eq, V] T::remove(self : T[K, V], key : K) -> Unit { (escaped)
    |                          ^ (escaped)
    |   if self.size == 0 { (escaped)
    |     return (escaped)

<WORKDIR>/src/IndexMap.mbt:428:43-428:44:
    |  (escaped)
    | ///| (escaped)
    | /// Removes a key from the map. (escaped)
428 | pub fn[K : Hash + Eq, V] T::remove(self : T[K, V], key : K) -> Unit { (escaped)
    |                                           ^ (escaped)
    |   if self.size == 0 { (escaped)
    |     return (escaped)

<WORKDIR>/src/IndexMap.mbt:513:58-513:59:
    | /// inspect(map.get(1), content="Some(\\"one\\")") (escaped)
    | /// inspect(map.get(2), content="Some(\\"two\\")") (escaped)
    | /// Create a map from a fixed array of key-value pairs (escaped)
513 | pub fn[K : Hash + Eq, V] of(arr : FixedArray[(K, V)]) -> T[K, V] { (escaped)
    |                                                          ^ (escaped)
    |   let map = new(capacity=arr.length()) (escaped)
    |   for i in 0..<arr.length() { (escaped)

<WORKDIR>/src/IndexMap.mbt:545:102-545:103:
    | /// (escaped)
    | /// let samples : Array[@IndexMap.T[Int, String]] = @quickcheck.samples(5) (escaped)
    | /// inspect(samples.length(), content="5") (escaped)
545 | pub impl[K : @quickcheck.Arbitrary + Hash + Eq, V : @quickcheck.Arbitrary] @quickcheck.Arbitrary for T[ (escaped)
    |                                                                                                      ^ (escaped)
    |   K, (escaped)
    |   V, (escaped)

<WORKDIR>/src/IndexMap.mbt:623:11-623:12:
    |  (escaped)
    | ///| (escaped)
    | test "set" { (escaped)
623 |   let m : T[MyString, Int] = new() (escaped)
    |           ^ (escaped)
    |   m.set("a", 1) (escaped)
    |   m.set("b", 1) (escaped)

<WORKDIR>/src/IndexMap.mbt:640:11-640:12:
    |  (escaped)
    | ///| (escaped)
    | test "remove" { (escaped)
640 |   let m : T[MyString, Int] = new() (escaped)
    |           ^ (escaped)
    |   m.set("a", 1) (escaped)
    |   m.set("ab", 2) (escaped)

<WORKDIR>/src/IndexMap.mbt:657:11-657:12:
    |  (escaped)
    | ///| (escaped)
    | test "remove_unexist_key" { (escaped)
657 |   let m : T[MyString, Int] = new() (escaped)
    |           ^ (escaped)
    |   m.set("a", 1) (escaped)
    |   m.set("ab", 2) (escaped)

<WORKDIR>/src/IndexMap.mbt:668:11-668:12:
    |  (escaped)
    | ///| (escaped)
    | test "clear" { (escaped)
668 |   let m : T[MyString, Int] = of([("a", 1), ("b", 2), ("c", 3)]) (escaped)
    |           ^ (escaped)
    |   println(m.capacity()) (escaped)
    |   let old_capacity = m.capacity() (escaped)

<WORKDIR>/src/IndexMap.mbt:691:11-691:12:
    |  (escaped)
    | ///| (escaped)
    | test "grow" { (escaped)
691 |   let m : T[MyString, Int] = new() (escaped)
    |           ^ (escaped)
    |   m.set("C", 1) (escaped)
    |   m.set("Go", 2) (escaped)

<WORKDIR>/src/IndexMap.mbt:710:14-710:15:
    |  (escaped)
    | ///| (escaped)
    | /// Returns the number of key-value pairs in the map. (escaped)
710 | pub fn[K, V] T::size(self : T[K, V]) -> Int { (escaped)
    |              ^ (escaped)
    |   self.size (escaped)
    | } (escaped)

<WORKDIR>/src/IndexMap.mbt:710:29-710:30:
    |  (escaped)
    | ///| (escaped)
    | /// Returns the number of key-value pairs in the map. (escaped)
710 | pub fn[K, V] T::size(self : T[K, V]) -> Int { (escaped)
    |                             ^ (escaped)
    |   self.size (escaped)
    | } (escaped)

<WORKDIR>/src/IndexMap.mbt:715:14-715:15:
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
715 | pub fn[K, V] T::capacity(self : T[K, V]) -> Int { (escaped)
    |              ^ (escaped)
    |   self.capacity (escaped)
    | } (escaped)

<WORKDIR>/src/IndexMap.mbt:715:33-715:34:
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
715 | pub fn[K, V] T::capacity(self : T[K, V]) -> Int { (escaped)
    |                                 ^ (escaped)
    |   self.capacity (escaped)
    | } (escaped)

<WORKDIR>/src/IndexMap.mbt:721:14-721:15:
    |  (escaped)
    | ///| (escaped)
    | /// Check if the map is empty. (escaped)
721 | pub fn[K, V] T::is_empty(self : T[K, V]) -> Bool { (escaped)
    |              ^ (escaped)
    |   self.size == 0 (escaped)
    | } (escaped)

<WORKDIR>/src/IndexMap.mbt:721:33-721:34:
    |  (escaped)
    | ///| (escaped)
    | /// Check if the map is empty. (escaped)
721 | pub fn[K, V] T::is_empty(self : T[K, V]) -> Bool { (escaped)
    |                                 ^ (escaped)
    |   self.size == 0 (escaped)
    | } (escaped)

<WORKDIR>/src/IndexMap.mbt:727:26-727:27:
    |  (escaped)
    | ///| (escaped)
    | /// Check if the map contains a key. (escaped)
727 | pub fn[K : Hash + Eq, V] T::contains_key(self : T[K, V], key : K) -> Bool { (escaped)
    |                          ^ (escaped)
    |   self.key_to_idx.contains(key) (escaped)
    | } (escaped)

<WORKDIR>/src/IndexMap.mbt:727:49-727:50:
    |  (escaped)
    | ///| (escaped)
    | /// Check if the map contains a key. (escaped)
727 | pub fn[K : Hash + Eq, V] T::contains_key(self : T[K, V], key : K) -> Bool { (escaped)
    |                                                 ^ (escaped)
    |   self.key_to_idx.contains(key) (escaped)
    | } (escaped)

<WORKDIR>/src/IndexMap.mbt:733:14-733:15:
    |  (escaped)
    | ///| (escaped)
    | /// Clears the map, removing all key-value pairs. (escaped)
733 | pub fn[K, V] T::clear(self : T[K, V]) -> Unit { (escaped)
    |              ^ (escaped)
    |   self.core.hash_to_idx.clear() (escaped)
    |   self.core.entries = [] (escaped)

<WORKDIR>/src/IndexMap.mbt:733:30-733:31:
    |  (escaped)
    | ///| (escaped)
    | /// Clears the map, removing all key-value pairs. (escaped)
733 | pub fn[K, V] T::clear(self : T[K, V]) -> Unit { (escaped)
    |                              ^ (escaped)
    |   self.core.hash_to_idx.clear() (escaped)
    |   self.core.entries = [] (escaped)

<WORKDIR>/src/IndexMap.mbt:749:14-749:15:
    |  (escaped)
    | ///| (escaped)
    | /// Convert the map to an array of key-value pairs (escaped)
749 | pub fn[K, V] T::to_array(self : T[K, V]) -> Array[(K, V)] { (escaped)
    |              ^ (escaped)
    |   if self.size == 0 { (escaped)
    |     return [] (escaped)

<WORKDIR>/src/IndexMap.mbt:749:33-749:34:
    |  (escaped)
    | ///| (escaped)
    | /// Convert the map to an array of key-value pairs (escaped)
749 | pub fn[K, V] T::to_array(self : T[K, V]) -> Array[(K, V)] { (escaped)
    |                                 ^ (escaped)
    |   if self.size == 0 { (escaped)
    |     return [] (escaped)

<WORKDIR>/src/IndexMap.mbt:769:22-769:23:
    |  (escaped)
    | ///| (escaped)
    | /// Grow the map capacity (escaped)
769 | fn[K : Hash + Eq, V] T::grow(self : T[K, V]) -> Unit { (escaped)
    |                      ^ (escaped)
    |   // 保存旧数据 (escaped)
    |   let old_entries = self.core.entries (escaped)

<WORKDIR>/src/IndexMap.mbt:769:37-769:38:
    |  (escaped)
    | ///| (escaped)
    | /// Grow the map capacity (escaped)
769 | fn[K : Hash + Eq, V] T::grow(self : T[K, V]) -> Unit { (escaped)
    |                                     ^ (escaped)
    |   // 保存旧数据 (escaped)
    |   let old_entries = self.core.entries (escaped)

<WORKDIR>/src/IndexMap.mbt:800:24-800:25:
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
800 | fn[K : Show, V : Show] T::debug_entries(self : T[K, V]) -> String { (escaped)
    |                        ^ (escaped)
    |   let mut s = "" (escaped)
    |   let mut current = self.core.head (escaped)

<WORKDIR>/src/IndexMap.mbt:800:48-800:49:
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
800 | fn[K : Show, V : Show] T::debug_entries(self : T[K, V]) -> String { (escaped)
    |                                                ^ (escaped)
    |   let mut s = "" (escaped)
    |   let mut current = self.core.head (escaped)

<WORKDIR>/src/IndexMap.mbt:833:14-833:15:
    | /// inspect(pairs.length(), content="2") (escaped)
    | /// inspect(pairs[0], content="(1, \\"one\\")") (escaped)
    | /// inspect(pairs[1], content="(2, \\"two\\")") (escaped)
833 | pub fn[K, V] T::iter(self : T[K, V]) -> Iter[(K, V)] { (escaped)
    |              ^ (escaped)
    |   let mut current = self.core.head (escaped)
    |   Iter::new(fn() { (escaped)

<WORKDIR>/src/IndexMap.mbt:833:29-833:30:
    | /// inspect(pairs.length(), content="2") (escaped)
    | /// inspect(pairs[0], content="(1, \\"one\\")") (escaped)
    | /// inspect(pairs[1], content="(2, \\"two\\")") (escaped)
833 | pub fn[K, V] T::iter(self : T[K, V]) -> Iter[(K, V)] { (escaped)
    |                             ^ (escaped)
    |   let mut current = self.core.head (escaped)
    |   Iter::new(fn() { (escaped)

<WORKDIR>/src/IndexMap.mbt:863:14-863:15:
    | /// let mut sum = 0 (escaped)
    | /// map.iter2().each(fn(k, _) { sum = sum + k }) (escaped)
    | /// inspect(sum, content="3") (escaped)
863 | pub fn[K, V] T::iter2(self : T[K, V]) -> Iter2[K, V] { (escaped)
    |              ^ (escaped)
    |   let mut current = self.core.head (escaped)
    |   Iter2::new(fn() { (escaped)

<WORKDIR>/src/IndexMap.mbt:863:30-863:31:
    | /// let mut sum = 0 (escaped)
    | /// map.iter2().each(fn(k, _) { sum = sum + k }) (escaped)
    | /// inspect(sum, content="3") (escaped)
863 | pub fn[K, V] T::iter2(self : T[K, V]) -> Iter2[K, V] { (escaped)
    |                              ^ (escaped)
    |   let mut current = self.core.head (escaped)
    |   Iter2::new(fn() { (escaped)

<WORKDIR>/src/IndexMap.mbt:903:60-903:61:
    | /// let map = @IndexMap.from_iter(iter) (escaped)
    | /// inspect(map.get(1), content="Some(\\"one\\")") (escaped)
    | /// inspect(map.get(2), content="Some(\\"two\\")") (escaped)
903 | pub fn[K : Hash + Eq, V] from_iter(iter : Iter[(K, V)]) -> T[K, V] { (escaped)
    |                                                            ^ (escaped)
    |   let m = new() (escaped)
    |   iter.each(fn(e) { m.set(e.0, e.1) }) (escaped)

<WORKDIR>/src/IndexMap.mbt:928:26-928:27:
    | /// inspect(map.get(2), content="Some(\\"two\\")") (escaped)
    | /// (escaped)
    | #deprecated("use `@IndexMap.from_iter` instead") (escaped)
928 | pub fn[K : Hash + Eq, V] T::from_iter(iter : Iter[(K, V)]) -> T[K, V] { (escaped)
    |                          ^ (escaped)
    |   from_iter(iter) (escaped)
    | } (escaped)

<WORKDIR>/src/IndexMap.mbt:928:63-928:64:
    | /// inspect(map.get(2), content="Some(\\"two\\")") (escaped)
    | /// (escaped)
    | #deprecated("use `@IndexMap.from_iter` instead") (escaped)
928 | pub fn[K : Hash + Eq, V] T::from_iter(iter : Iter[(K, V)]) -> T[K, V] { (escaped)
    |                                                               ^ (escaped)
    |   from_iter(iter) (escaped)
    | } (escaped)

<WORKDIR>/src/IndexMap.mbt:948:14-948:15:
    | /// let mut result = "" (escaped)
    | /// map.each(fn(k, v) { result = result + "\\{k}:\\{v}," }) (escaped)
    | /// inspect(result, content="1:one,2:two,") (escaped)
948 | pub fn[K, V] T::each(self : T[K, V], f : (K, V) -> Unit) -> Unit { (escaped)
    |              ^ (escaped)
    |   let mut current = self.core.head (escaped)
    |   while current != -1 { (escaped)

<WORKDIR>/src/IndexMap.mbt:948:29-948:30:
    | /// let mut result = "" (escaped)
    | /// map.each(fn(k, v) { result = result + "\\{k}:\\{v}," }) (escaped)
    | /// inspect(result, content="1:one,2:two,") (escaped)
948 | pub fn[K, V] T::each(self : T[K, V], f : (K, V) -> Unit) -> Unit { (escaped)
    |                             ^ (escaped)
    |   let mut current = self.core.head (escaped)
    |   while current != -1 { (escaped)

<WORKDIR>/src/IndexMap.mbt:977:14-977:15:
    | /// map.eachi(fn(i, k, _) { if k == "b" { result = i } }) (escaped)
    | /// // "b" is at index 1 (escaped)
    | /// inspect(result, content="1") (escaped)
977 | pub fn[K, V] T::eachi(self : T[K, V], f : (Int, K, V) -> Unit) -> Unit { (escaped)
    |              ^ (escaped)
    |   let mut current = self.core.head (escaped)
    |   let mut idx = 0 (escaped)

<WORKDIR>/src/IndexMap.mbt:977:30-977:31:
    | /// map.eachi(fn(i, k, _) { if k == "b" { result = i } }) (escaped)
    | /// // "b" is at index 1 (escaped)
    | /// inspect(result, content="1") (escaped)
977 | pub fn[K, V] T::eachi(self : T[K, V], f : (Int, K, V) -> Unit) -> Unit { (escaped)
    |                              ^ (escaped)
    |   let mut current = self.core.head (escaped)
    |   let mut idx = 0 (escaped)

<WORKDIR>/src/IndexMap.mbt:1002:39-1002:40:
     | /// inspect(map, content= (escaped)
     | /// #|IndexMap::of([(1, "one"), (2, "two")]) (escaped)
     | /// ) (escaped)
1002 | pub impl[K : Show, V : Show] Show for T[K, V] with output(self, logger) { (escaped)
     |                                       ^ (escaped)
     |   logger.write_string("IndexMap::of([") (escaped)
     |   self.eachi(fn(i, k, v) { (escaped)

<WORKDIR>/src/IndexMap.mbt:1035:26-1035:27:
     | /// inspect(map.index_of("a"), content="Some(0)") (escaped)
     | /// inspect(map.index_of("b"), content="Some(1)") (escaped)
     | /// inspect(map.index_of("d"), content="None") (escaped)
1035 | pub fn[K : Hash + Eq, V] T::index_of(self : T[K, V], key : K) -> Int? { (escaped)
     |                          ^ (escaped)
     |   // 先检查键是否存在 (escaped)
     |   match self.key_to_idx.get(key) { (escaped)

<WORKDIR>/src/IndexMap.mbt:1035:45-1035:46:
     | /// inspect(map.index_of("a"), content="Some(0)") (escaped)
     | /// inspect(map.index_of("b"), content="Some(1)") (escaped)
     | /// inspect(map.index_of("d"), content="None") (escaped)
1035 | pub fn[K : Hash + Eq, V] T::index_of(self : T[K, V], key : K) -> Int? { (escaped)
     |                                             ^ (escaped)
     |   // 先检查键是否存在 (escaped)
     |   match self.key_to_idx.get(key) { (escaped)

<WORKDIR>/src/IndexMap.mbt:1059:14-1059:15:
     | /// (escaped)
     | /// let map = @IndexMap.of([("a", 1), ("b", 2)]) (escaped)
     | /// inspect(map.first(), content="Some((\\"a\\", 1))") (escaped)
1059 | pub fn[K, V] T::first(self : T[K, V]) -> (K, V)? { (escaped)
     |              ^ (escaped)
     |   if self.size == 0 || self.core.head == -1 { (escaped)
     |     return None (escaped)

<WORKDIR>/src/IndexMap.mbt:1059:30-1059:31:
     | /// (escaped)
     | /// let map = @IndexMap.of([("a", 1), ("b", 2)]) (escaped)
     | /// inspect(map.first(), content="Some((\\"a\\", 1))") (escaped)
1059 | pub fn[K, V] T::first(self : T[K, V]) -> (K, V)? { (escaped)
     |                              ^ (escaped)
     |   if self.size == 0 || self.core.head == -1 { (escaped)
     |     return None (escaped)

<WORKDIR>/src/IndexMap.mbt:1081:14-1081:15:
     | /// (escaped)
     | /// let map = @IndexMap.of([("a", 1), ("b", 2)]) (escaped)
     | /// inspect(map.last(), content="Some((\\"b\\", 2))") (escaped)
1081 | pub fn[K, V] T::last(self : T[K, V]) -> (K, V)? { (escaped)
     |              ^ (escaped)
     |   if self.size == 0 || self.core.tail == -1 { (escaped)
     |     return None (escaped)

<WORKDIR>/src/IndexMap.mbt:1081:29-1081:30:
     | /// (escaped)
     | /// let map = @IndexMap.of([("a", 1), ("b", 2)]) (escaped)
     | /// inspect(map.last(), content="Some((\\"b\\", 2))") (escaped)
1081 | pub fn[K, V] T::last(self : T[K, V]) -> (K, V)? { (escaped)
     |                             ^ (escaped)
     |   if self.size == 0 || self.core.tail == -1 { (escaped)
     |     return None (escaped)

<WORKDIR>/src/IndexMap.mbt:1102:14-1102:15:
     | /// (escaped)
     | /// let map = @IndexMap.of([('a', 1), ('b', 2), ('c', 3)]) (escaped)
     | /// inspect(map.keys(), content=['a', 'b', 'c']) (escaped)
1102 | pub fn[K, V] T::keys(self : T[K, V]) -> Array[K] { (escaped)
     |              ^ (escaped)
     |   if self.size == 0 { (escaped)
     |     return [] (escaped)

<WORKDIR>/src/IndexMap.mbt:1102:29-1102:30:
     | /// (escaped)
     | /// let map = @IndexMap.of([('a', 1), ('b', 2), ('c', 3)]) (escaped)
     | /// inspect(map.keys(), content=['a', 'b', 'c']) (escaped)
1102 | pub fn[K, V] T::keys(self : T[K, V]) -> Array[K] { (escaped)
     |                             ^ (escaped)
     |   if self.size == 0 { (escaped)
     |     return [] (escaped)

<WORKDIR>/src/IndexMap.mbt:1128:14-1128:15:
     | /// (escaped)
     | /// let map = @IndexMap.of([('a', 1), ('b', 2), ('c', 3)]) (escaped)
     | /// inspect(map.values(), content=[1, 2, 3]) (escaped)
1128 | pub fn[K, V] T::values(self : T[K, V]) -> Array[V] { (escaped)
     |              ^ (escaped)
     |   if self.size == 0 { (escaped)
     |     return [] (escaped)

<WORKDIR>/src/IndexMap.mbt:1128:31-1128:32:
     | /// (escaped)
     | /// let map = @IndexMap.of([('a', 1), ('b', 2), ('c', 3)]) (escaped)
     | /// inspect(map.values(), content=[1, 2, 3]) (escaped)
1128 | pub fn[K, V] T::values(self : T[K, V]) -> Array[V] { (escaped)
     |                               ^ (escaped)
     |   if self.size == 0 { (escaped)
     |     return [] (escaped)

<WORKDIR>/src/IndexMap.mbt:1154:30-1154:31:
     | /// (escaped)
     | /// let map = @IndexMap.of([(1, 10), (2, 20), (3, 30)]) (escaped)
     | /// inspect(map.to_json_string(), content="{\\"1\\":10,\\"2\\":20,\\"3\\":30}") (escaped)
1154 | pub fn[K : Show, V : ToJson] T::to_json_string(self : T[K, V]) -> String { (escaped)
     |                              ^ (escaped)
     |   // 直接构建JSON字符串 (escaped)
     |   let mut result = "{" (escaped)

<WORKDIR>/src/IndexMap.mbt:1154:55-1154:56:
     | /// (escaped)
     | /// let map = @IndexMap.of([(1, 10), (2, 20), (3, 30)]) (escaped)
     | /// inspect(map.to_json_string(), content="{\\"1\\":10,\\"2\\":20,\\"3\\":30}") (escaped)
1154 | pub fn[K : Show, V : ToJson] T::to_json_string(self : T[K, V]) -> String { (escaped)
     |                                                       ^ (escaped)
     |   // 直接构建JSON字符串 (escaped)
     |   let mut result = "{" (escaped)

<WORKDIR>/src/IndexMap.mbt:1178:43-1178:44:
     |  (escaped)
     | ///| (escaped)
     | /// Standard ToJson implementation (may not preserve order) (escaped)
1178 | pub impl[K : Show, V : ToJson] ToJson for T[K, V] with to_json(self) { (escaped)
     |                                           ^ (escaped)
     |   // 使用普通Map (escaped)
     |   let object = Map([], capacity=self.size) (escaped)

<WORKDIR>/src/IndexMap.mbt:1208:26-1208:27:
     | /// inspect(map.pop(), content="Some((\\"c\\", 3))") (escaped)
     | /// inspect(map.size(), content="2") (escaped)
     | /// inspect(map.get("c"), content="None") (escaped)
1208 | pub fn[K : Hash + Eq, V] T::pop(self : T[K, V]) -> (K, V)? { (escaped)
     |                          ^ (escaped)
     |   if self.size == 0 || self.core.tail == -1 { (escaped)
     |     return None (escaped)

<WORKDIR>/src/IndexMap.mbt:1208:40-1208:41:
     | /// inspect(map.pop(), content="Some((\\"c\\", 3))") (escaped)
     | /// inspect(map.size(), content="2") (escaped)
     | /// inspect(map.get("c"), content="None") (escaped)
1208 | pub fn[K : Hash + Eq, V] T::pop(self : T[K, V]) -> (K, V)? { (escaped)
     |                                        ^ (escaped)
     |   if self.size == 0 || self.core.tail == -1 { (escaped)
     |     return None (escaped)

<WORKDIR>/src/IndexMap.mbt:1262:26-1262:27:
     | /// inspect(map.shift(), content="Some((\\"a\\", 1))") (escaped)
     | /// inspect(map.size(), content="2") (escaped)
     | /// inspect(map.get("a"), content="None") (escaped)
1262 | pub fn[K : Hash + Eq, V] T::shift(self : T[K, V]) -> (K, V)? { (escaped)
     |                          ^ (escaped)
     |   if self.size == 0 || self.core.head == -1 { (escaped)
     |     return None (escaped)

<WORKDIR>/src/IndexMap.mbt:1262:42-1262:43:
     | /// inspect(map.shift(), content="Some((\\"a\\", 1))") (escaped)
     | /// inspect(map.size(), content="2") (escaped)
     | /// inspect(map.get("a"), content="None") (escaped)
1262 | pub fn[K : Hash + Eq, V] T::shift(self : T[K, V]) -> (K, V)? { (escaped)
     |                                          ^ (escaped)
     |   if self.size == 0 || self.core.head == -1 { (escaped)
     |     return None (escaped)

<WORKDIR>/src/IndexMap.mbt:1328:14-1328:15:
     | /// let map = @IndexMap.of([("a", 1), ("b", 2)]) (escaped)
     | /// inspect(map.get_first(), content="Some((\\"a\\", 1))") (escaped)
     | /// inspect(map.size(), content="2")  // 元素没有被移除 (escaped)
1328 | pub fn[K, V] T::get_first(self : T[K, V]) -> (K, V)? { (escaped)
     |              ^ (escaped)
     |   if self.size == 0 || self.core.head == -1 { (escaped)
     |     return None (escaped)

<WORKDIR>/src/IndexMap.mbt:1328:34-1328:35:
     | /// let map = @IndexMap.of([("a", 1), ("b", 2)]) (escaped)
     | /// inspect(map.get_first(), content="Some((\\"a\\", 1))") (escaped)
     | /// inspect(map.size(), content="2")  // 元素没有被移除 (escaped)
1328 | pub fn[K, V] T::get_first(self : T[K, V]) -> (K, V)? { (escaped)
     |                                  ^ (escaped)
     |   if self.size == 0 || self.core.head == -1 { (escaped)
     |     return None (escaped)

<WORKDIR>/src/IndexMap.mbt:1351:14-1351:15:
     | /// let map = @IndexMap.of([("a", 1), ("b", 2)]) (escaped)
     | /// inspect(map.get_last(), content="Some((\\"b\\", 2))") (escaped)
     | /// inspect(map.size(), content="2")  // 元素没有被移除 (escaped)
1351 | pub fn[K, V] T::get_last(self : T[K, V]) -> (K, V)? { (escaped)
     |              ^ (escaped)
     |   if self.size == 0 || self.core.tail == -1 { (escaped)
     |     return None (escaped)

<WORKDIR>/src/IndexMap.mbt:1351:33-1351:34:
     | /// let map = @IndexMap.of([("a", 1), ("b", 2)]) (escaped)
     | /// inspect(map.get_last(), content="Some((\\"b\\", 2))") (escaped)
     | /// inspect(map.size(), content="2")  // 元素没有被移除 (escaped)
1351 | pub fn[K, V] T::get_last(self : T[K, V]) -> (K, V)? { (escaped)
     |                                 ^ (escaped)
     |   if self.size == 0 || self.core.tail == -1 { (escaped)
     |     return None (escaped)

<WORKDIR>/src/IndexMap.mbt:1360:14-1360:15:
     | } (escaped)
     |  (escaped)
     | ///| (escaped)
1360 | pub fn[K, V] T::sort_by(self : T[K, V], compare : (K, V, K, V) -> Int) -> Unit { (escaped)
     |              ^ (escaped)
     |   if self.size <= 1 { (escaped)
     |     return // 不需要排序 (escaped)

<WORKDIR>/src/IndexMap.mbt:1360:32-1360:33:
     | } (escaped)
     |  (escaped)
     | ///| (escaped)
1360 | pub fn[K, V] T::sort_by(self : T[K, V], compare : (K, V, K, V) -> Int) -> Unit { (escaped)
     |                                ^ (escaped)
     |   if self.size <= 1 { (escaped)
     |     return // 不需要排序 (escaped)

<WORKDIR>/src/IndexMap.mbt:1410:14-1410:15:
     | } (escaped)
     |  (escaped)
     | ///| (escaped)
1410 | pub fn[K, V] T::sort_by_key(self : T[K, V], compare : (K, K) -> Int) -> Unit { (escaped)
     |              ^ (escaped)
     |   self.sort_by(fn(k1, _, k2, _) { compare(k1, k2) }) (escaped)
     | } (escaped)

<WORKDIR>/src/IndexMap.mbt:1410:36-1410:37:
     | } (escaped)
     |  (escaped)
     | ///| (escaped)
1410 | pub fn[K, V] T::sort_by_key(self : T[K, V], compare : (K, K) -> Int) -> Unit { (escaped)
     |                                    ^ (escaped)
     |   self.sort_by(fn(k1, _, k2, _) { compare(k1, k2) }) (escaped)
     | } (escaped)

<WORKDIR>/src/IndexMap.mbt:1415:14-1415:15:
     | } (escaped)
     |  (escaped)
     | ///| (escaped)
1415 | pub fn[K, V] T::sort_by_value(self : T[K, V], compare : (V, V) -> Int) -> Unit { (escaped)
     |              ^ (escaped)
     |   self.sort_by(fn(_, v1, _, v2) { compare(v1, v2) }) (escaped)
     | } (escaped)

<WORKDIR>/src/IndexMap.mbt:1415:38-1415:39:
     | } (escaped)
     |  (escaped)
     | ///| (escaped)
1415 | pub fn[K, V] T::sort_by_value(self : T[K, V], compare : (V, V) -> Int) -> Unit { (escaped)
     |                                      ^ (escaped)
     |   self.sort_by(fn(_, v1, _, v2) { compare(v1, v2) }) (escaped)
     | } (escaped)

<WORKDIR>/src/IndexMap.mbt:1420:24-1420:25:
     | } (escaped)
     |  (escaped)
     | ///| (escaped)
1420 | pub fn[K : Compare, V] T::sort(self : T[K, V]) -> Unit { (escaped)
     |                        ^ (escaped)
     |   self.sort_by_key(fn(k1, k2) { (escaped)
     |     if k1 < k2 { (escaped)

<WORKDIR>/src/IndexMap.mbt:1420:39-1420:40:
     | } (escaped)
     |  (escaped)
     | ///| (escaped)
1420 | pub fn[K : Compare, V] T::sort(self : T[K, V]) -> Unit { (escaped)
     |                                       ^ (escaped)
     |   self.sort_by_key(fn(k1, k2) { (escaped)
     |     if k1 < k2 { (escaped)

<WORKDIR>/src/IndexMap.mbt:1433:14-1433:15:
     | } (escaped)
     |  (escaped)
     | ///| (escaped)
1433 | pub fn[K, V] T::reverse(self : T[K, V]) -> Unit { (escaped)
     |              ^ (escaped)
     |   if self.size <= 1 { (escaped)
     |     return // 不需要反转 (escaped)

<WORKDIR>/src/IndexMap.mbt:1433:32-1433:33:
     | } (escaped)
     |  (escaped)
     | ///| (escaped)
1433 | pub fn[K, V] T::reverse(self : T[K, V]) -> Unit { (escaped)
     |                                ^ (escaped)
     |   if self.size <= 1 { (escaped)
     |     return // 不需要反转 (escaped)

<WORKDIR>/src/IndexMap.mbt:1471:26-1471:27:
     | } (escaped)
     |  (escaped)
     | ///| (escaped)
1471 | pub fn[K : Hash + Eq, V] T::sorted_by( (escaped)
     |                          ^ (escaped)
     |   self : T[K, V], (escaped)
     |   compare : (K, V, K, V) -> Int, (escaped)

<WORKDIR>/src/IndexMap.mbt:1472:10-1472:11:
     |  (escaped)
     | ///| (escaped)
     | pub fn[K : Hash + Eq, V] T::sorted_by( (escaped)
1472 |   self : T[K, V], (escaped)
     |          ^ (escaped)
     |   compare : (K, V, K, V) -> Int, (escaped)
     | ) -> T[K, V] { (escaped)

<WORKDIR>/src/IndexMap.mbt:1474:6-1474:7:
     | pub fn[K : Hash + Eq, V] T::sorted_by( (escaped)
     |   self : T[K, V], (escaped)
     |   compare : (K, V, K, V) -> Int, (escaped)
1474 | ) -> T[K, V] { (escaped)
     |      ^ (escaped)
     |   // 创建新映射 (escaped)
     |   let result = new(capacity=self.size) (escaped)

<WORKDIR>/src/IndexMap.mbt:1498:26-1498:27:
     | } (escaped)
     |  (escaped)
     | ///| (escaped)
1498 | pub fn[K : Hash + Eq, V] T::sorted_by_key( (escaped)
     |                          ^ (escaped)
     |   self : T[K, V], (escaped)
     |   compare : (K, K) -> Int, (escaped)

<WORKDIR>/src/IndexMap.mbt:1499:10-1499:11:
     |  (escaped)
     | ///| (escaped)
     | pub fn[K : Hash + Eq, V] T::sorted_by_key( (escaped)
1499 |   self : T[K, V], (escaped)
     |          ^ (escaped)
     |   compare : (K, K) -> Int, (escaped)
     | ) -> T[K, V] { (escaped)

<WORKDIR>/src/IndexMap.mbt:1501:6-1501:7:
     | pub fn[K : Hash + Eq, V] T::sorted_by_key( (escaped)
     |   self : T[K, V], (escaped)
     |   compare : (K, K) -> Int, (escaped)
1501 | ) -> T[K, V] { (escaped)
     |      ^ (escaped)
     |   self.sorted_by(fn(k1, _, k2, _) { compare(k1, k2) }) (escaped)
     | } (escaped)

<WORKDIR>/src/IndexMap.mbt:1506:26-1506:27:
     | } (escaped)
     |  (escaped)
     | ///| (escaped)
1506 | pub fn[K : Hash + Eq, V] T::sorted_by_value( (escaped)
     |                          ^ (escaped)
     |   self : T[K, V], (escaped)
     |   compare : (V, V) -> Int, (escaped)

<WORKDIR>/src/IndexMap.mbt:1507:10-1507:11:
     |  (escaped)
     | ///| (escaped)
     | pub fn[K : Hash + Eq, V] T::sorted_by_value( (escaped)
1507 |   self : T[K, V], (escaped)
     |          ^ (escaped)
     |   compare : (V, V) -> Int, (escaped)
     | ) -> T[K, V] { (escaped)

<WORKDIR>/src/IndexMap.mbt:1509:6-1509:7:
     | pub fn[K : Hash + Eq, V] T::sorted_by_value( (escaped)
     |   self : T[K, V], (escaped)
     |   compare : (V, V) -> Int, (escaped)
1509 | ) -> T[K, V] { (escaped)
     |      ^ (escaped)
     |   self.sorted_by(fn(_, v1, _, v2) { compare(v1, v2) }) (escaped)
     | } (escaped)

<WORKDIR>/src/IndexMap.mbt:1514:36-1514:37:
     | } (escaped)
     |  (escaped)
     | ///| (escaped)
1514 | pub fn[K : Hash + Eq + Compare, V] T::sorted(self : T[K, V]) -> T[K, V] { (escaped)
     |                                    ^ (escaped)
     |   self.sorted_by_key(fn(k1, k2) { (escaped)
     |     if k1 < k2 { (escaped)

<WORKDIR>/src/IndexMap.mbt:1514:53-1514:54:
     | } (escaped)
     |  (escaped)
     | ///| (escaped)
1514 | pub fn[K : Hash + Eq + Compare, V] T::sorted(self : T[K, V]) -> T[K, V] { (escaped)
     |                                                     ^ (escaped)
     |   self.sorted_by_key(fn(k1, k2) { (escaped)
     |     if k1 < k2 { (escaped)

<WORKDIR>/src/IndexMap.mbt:1514:65-1514:66:
     | } (escaped)
     |  (escaped)
     | ///| (escaped)
1514 | pub fn[K : Hash + Eq + Compare, V] T::sorted(self : T[K, V]) -> T[K, V] { (escaped)
     |                                                                 ^ (escaped)
     |   self.sorted_by_key(fn(k1, k2) { (escaped)
     |     if k1 < k2 { (escaped)

<WORKDIR>/src/IndexMap.mbt:1527:36-1527:37:
     | } (escaped)
     |  (escaped)
     | ///| (escaped)
1527 | pub fn[K : Hash + Eq, V : Compare] T::sorted_by_values( (escaped)
     |                                    ^ (escaped)
     |   self : T[K, V], (escaped)
     | ) -> T[K, V] { (escaped)

<WORKDIR>/src/IndexMap.mbt:1528:10-1528:11:
     |  (escaped)
     | ///| (escaped)
     | pub fn[K : Hash + Eq, V : Compare] T::sorted_by_values( (escaped)
1528 |   self : T[K, V], (escaped)
     |          ^ (escaped)
     | ) -> T[K, V] { (escaped)
     |   self.sorted_by_value(fn(v1, v2) { (escaped)

<WORKDIR>/src/IndexMap.mbt:1529:6-1529:7:
     | ///| (escaped)
     | pub fn[K : Hash + Eq, V : Compare] T::sorted_by_values( (escaped)
     |   self : T[K, V], (escaped)
1529 | ) -> T[K, V] { (escaped)
     |      ^ (escaped)
     |   self.sorted_by_value(fn(v1, v2) { (escaped)
     |     if v1 < v2 { (escaped)

<WORKDIR>/src/IndexMap.mbt:1542:26-1542:27:
     | } (escaped)
     |  (escaped)
     | ///| (escaped)
1542 | pub fn[K : Hash + Eq, V] T::reversed(self : T[K, V]) -> T[K, V] { (escaped)
     |                          ^ (escaped)
     |   // 创建新映射 (escaped)
     |   let result = new(capacity=self.size) (escaped)

<WORKDIR>/src/IndexMap.mbt:1542:45-1542:46:
     | } (escaped)
     |  (escaped)
     | ///| (escaped)
1542 | pub fn[K : Hash + Eq, V] T::reversed(self : T[K, V]) -> T[K, V] { (escaped)
     |                                             ^ (escaped)
     |   // 创建新映射 (escaped)
     |   let result = new(capacity=self.size) (escaped)

<WORKDIR>/src/IndexMap.mbt:1542:57-1542:58:
     | } (escaped)
     |  (escaped)
     | ///| (escaped)
1542 | pub fn[K : Hash + Eq, V] T::reversed(self : T[K, V]) -> T[K, V] { (escaped)
     |                                                         ^ (escaped)
     |   // 创建新映射 (escaped)
     |   let result = new(capacity=self.size) (escaped)

<WORKDIR>/src/IndexMap_test.mbt:17:21-17:22:
   |  (escaped)
   | ///| (escaped)
   | test "new" { (escaped)
17 |   let m : @IndexMap.T[Int, Int] = @IndexMap.new() (escaped)
   |                     ^ (escaped)
   |   inspect(m.capacity(), content="8") (escaped)
   |   @debug.assert_eq(m.size(), 0) (escaped)

<WORKDIR>/src/IndexMap_test.mbt:313:23-313:24:
    |  (escaped)
    | ///| (escaped)
    | test "from_iter empty iter" { (escaped)
313 |   let map : @IndexMap.T[Int, Int] = @IndexMap.from_iter(Iter::empty()) (escaped)
    |                       ^ (escaped)
    |   inspect(map, content="IndexMap::of([])") (escaped)
    | } (escaped)

<WORKDIR>/src/IndexMap_test.mbt:319:23-319:24:
    |  (escaped)
    | ///| (escaped)
    | test "@IndexMap.contains/empty" { (escaped)
319 |   let map : @IndexMap.T[Int, String] = @IndexMap.new() (escaped)
    |                       ^ (escaped)
    |   inspect(map.contains(42), content="false") (escaped)
    | } (escaped)

<WORKDIR>/src/IndexMap_test.mbt:408:29-408:30:
    |   @debug.debug_inspect(map.get_at(4), content="None") (escaped)
    |  (escaped)
    |   // 测试空映射 (escaped)
408 |   let empty_map : @IndexMap.T[String, Int] = @IndexMap.new() (escaped)
    |                             ^ (escaped)
    |   @debug.debug_inspect(empty_map.get_at(0), content="None") (escaped)
    |  (escaped)

<WORKDIR>/src/IndexMap_test.mbt:508:33-508:34:
    |  (escaped)
    | ///| (escaped)
    | test "IndexSet arbitrary" { (escaped)
508 |   let samples : Array[@IndexMap.T[Int, Int]] = @quickcheck.samples(20) (escaped)
    |                                 ^ (escaped)
    |   let sample_arrays_5_10 = [] (escaped)
    |   for sample in samples[5:10] { (escaped)

<WORKDIR>/src/IndexMap_test.mbt:755:29-755:30:
    | /// 测试reverse函数处理size <= 1的情况 (escaped)
    | test "reverse_with_small_size" { (escaped)
    |   // 测试空映射 (escaped)
755 |   let empty_map : @IndexMap.T[String, String] = @IndexMap.new() (escaped)
    |                             ^ (escaped)
    |   let empty_keys_before = empty_map.keys() (escaped)
    |   empty_map.reverse() (escaped)

<WORKDIR>/src/IndexMap_test.mbt:1034:23-1034:24:
     | /// 测试容量为0情况下的自动扩容 (escaped)
     | test "growth_from_zero_capacity" { (escaped)
     |   // 创建特殊情况：容量为0的映射 (escaped)
1034 |   let map : @IndexMap.T[String, Int] = @IndexMap.new(capacity=0) (escaped)
     |                       ^ (escaped)
     |  (escaped)
     |   // 验证初始容量 (escaped)

<WORKDIR>/src/types.mbt:54:8-54:9:
   | /// map.set(3, "updated") (escaped)
   | /// assert_eq(map.get(3), Some("updated")) (escaped)
   | /// assert_eq(map.get_at(0), (3, "updated"))  // Access by insertion order (escaped)
54 | struct T[K, V] { (escaped)
   |        ^ (escaped)
   |   core : IndexMapCore[K, V] // 包含核心数据结构 (escaped)
   |   mut size : Int // 元素数量 (escaped)

```
