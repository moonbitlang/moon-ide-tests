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
$ run_moon_ide moon ide find-references 'key' --loc 'src/types.mbt:19:3'
Found 24 references for symbol 'key':
<WORKDIR>/src/IndexMap.mbt:113:5-113:8:
    |   let bucket_idx = self.core.entries.length() (escaped)
    |   let new_bucket = { (escaped)
    |     hash, (escaped)
113 |     key, (escaped)
    |     ^^^ (escaped)
    |     value, (escaped)
    |     next: -1, // 无后继 (escaped)

<WORKDIR>/src/IndexMap.mbt:177:5-177:8:
    |   let bucket_idx = self.core.entries.length() (escaped)
    |   let new_bucket = { (escaped)
    |     hash, (escaped)
177 |     key, (escaped)
    |     ^^^ (escaped)
    |     value, (escaped)
    |     next: -1, // 无后继 (escaped)

<WORKDIR>/src/IndexMap.mbt:277:16-277:19:
    |   let bucket = self.core.entries[bucket_idx] (escaped)
    |  (escaped)
    |   // 返回键值对 (escaped)
277 |   Some((bucket.key, bucket.value)) (escaped)
    |                ^^^ (escaped)
    | } (escaped)
    |  (escaped)

<WORKDIR>/src/IndexMap.mbt:287:16-287:19:
    |     Some(idx) => { (escaped)
    |       // 找到了哈希值对应的索引，但还需要检查键是否匹配（处理哈希冲突） (escaped)
    |       let entry = self.core.entries[idx] (escaped)
287 |       if entry.key == key { (escaped)
    |                ^^^ (escaped)
    |         return Some(entry.value) (escaped)
    |       } (escaped)

<WORKDIR>/src/IndexMap.mbt:761:24-761:27:
    |   let mut current = self.core.head (escaped)
    |   while current != -1 { (escaped)
    |     let entry = self.core.entries[current] (escaped)
761 |     result.push((entry.key, entry.value)) (escaped)
    |                        ^^^ (escaped)
    |     current = entry.next (escaped)
    |   } (escaped)

<WORKDIR>/src/IndexMap.mbt:794:20-794:23:
    |   let mut current = old_head (escaped)
    |   while current != -1 { (escaped)
    |     let entry = old_entries[current] (escaped)
794 |     self.set(entry.key, entry.value) (escaped)
    |                    ^^^ (escaped)
    |     current = entry.next (escaped)
    |   } (escaped)

<WORKDIR>/src/IndexMap.mbt:809:23-809:26:
    |       s = s + "," (escaped)
    |     } (escaped)
    |     let entry = self.core.entries[current] (escaped)
809 |     s = s + "(\\{entry.key},\\{entry.value})" (escaped)
    |                       ^^^ (escaped)
    |     current = entry.next (escaped)
    |     i += 1 (escaped)

<WORKDIR>/src/IndexMap.mbt:841:19-841:22:
    |     } else { (escaped)
    |       let entry = self.core.entries[current] (escaped)
    |       current = entry.next (escaped)
841 |       Some((entry.key, entry.value)) (escaped)
    |                   ^^^ (escaped)
    |     } (escaped)
    |   }) (escaped)

<WORKDIR>/src/IndexMap.mbt:871:19-871:22:
    |     } else { (escaped)
    |       let entry = self.core.entries[current] (escaped)
    |       current = entry.next (escaped)
871 |       Some((entry.key, entry.value)) (escaped)
    |                   ^^^ (escaped)
    |     } (escaped)
    |   }) (escaped)

<WORKDIR>/src/IndexMap.mbt:952:13-952:16:
    |   let mut current = self.core.head (escaped)
    |   while current != -1 { (escaped)
    |     let entry = self.core.entries[current] (escaped)
952 |     f(entry.key, entry.value) (escaped)
    |             ^^^ (escaped)
    |     current = entry.next (escaped)
    |   } (escaped)

<WORKDIR>/src/IndexMap.mbt:982:18-982:21:
    |   let mut idx = 0 (escaped)
    |   while current != -1 { (escaped)
    |     let entry = self.core.entries[current] (escaped)
982 |     f(idx, entry.key, entry.value) (escaped)
    |                  ^^^ (escaped)
    |     current = entry.next (escaped)
    |     idx += 1 (escaped)

<WORKDIR>/src/IndexMap.mbt:1064:15-1064:18:
     |     return None (escaped)
     |   } (escaped)
     |   let entry = self.core.entries[self.core.head] (escaped)
1064 |   Some((entry.key, entry.value)) (escaped)
     |               ^^^ (escaped)
     | } (escaped)
     |  (escaped)

<WORKDIR>/src/IndexMap.mbt:1086:15-1086:18:
     |     return None (escaped)
     |   } (escaped)
     |   let entry = self.core.entries[self.core.tail] (escaped)
1086 |   Some((entry.key, entry.value)) (escaped)
     |               ^^^ (escaped)
     | } (escaped)
     |  (escaped)

<WORKDIR>/src/IndexMap.mbt:1109:44-1109:47:
     |   let result = [] (escaped)
     |   let mut current = self.core.head (escaped)
     |   while current != -1 { (escaped)
1109 |     result.push(self.core.entries[current].key) (escaped)
     |                                            ^^^ (escaped)
     |     current = self.core.entries[current].next (escaped)
     |   } (escaped)

<WORKDIR>/src/IndexMap.mbt:1167:36-1167:39:
     |     first = false (escaped)
     |  (escaped)
     |     // 添加键（转换为字符串） (escaped)
1167 |     result = result + "\\"" + entry.key.to_string() + "\\":" (escaped)
     |                                    ^^^ (escaped)
     |  (escaped)
     |     // 添加值（转换为JSON） (escaped)

<WORKDIR>/src/IndexMap.mbt:1186:18-1186:21:
     |   let mut current = self.core.head (escaped)
     |   while current != -1 { (escaped)
     |     let entry = self.core.entries[current] (escaped)
1186 |     object[entry.key.to_string()] = entry.value.to_json() (escaped)
     |                  ^^^ (escaped)
     |     current = entry.next (escaped)
     |   } (escaped)

<WORKDIR>/src/IndexMap.mbt:1216:24-1216:27:
     |   // 获取尾部元素 (escaped)
     |   let tail_idx = self.core.tail (escaped)
     |   let tail_entry = self.core.entries[tail_idx] (escaped)
1216 |   let key = tail_entry.key (escaped)
     |                        ^^^ (escaped)
     |   let value = tail_entry.value (escaped)
     |  (escaped)

<WORKDIR>/src/IndexMap.mbt:1270:24-1270:27:
     |   // 获取头部元素 (escaped)
     |   let head_idx = self.core.head (escaped)
     |   let head_entry = self.core.entries[head_idx] (escaped)
1270 |   let key = head_entry.key (escaped)
     |                        ^^^ (escaped)
     |   let value = head_entry.value (escaped)
     |  (escaped)

<WORKDIR>/src/IndexMap.mbt:1333:20-1333:23:
     |     return None (escaped)
     |   } (escaped)
     |   let head_entry = self.core.entries[self.core.head] (escaped)
1333 |   Some((head_entry.key, head_entry.value)) (escaped)
     |                    ^^^ (escaped)
     | } (escaped)
     |  (escaped)

<WORKDIR>/src/IndexMap.mbt:1356:20-1356:23:
     |     return None (escaped)
     |   } (escaped)
     |   let tail_entry = self.core.entries[self.core.tail] (escaped)
1356 |   Some((tail_entry.key, tail_entry.value)) (escaped)
     |                    ^^^ (escaped)
     | } (escaped)
     |  (escaped)

<WORKDIR>/src/IndexMap.mbt:1370:34-1370:37:
     |   let mut current = self.core.head (escaped)
     |   while current != -1 { (escaped)
     |     let entry = self.core.entries[current] (escaped)
1370 |     entries.push((current, entry.key, entry.value)) (escaped)
     |                                  ^^^ (escaped)
     |     current = entry.next (escaped)
     |   } (escaped)

<WORKDIR>/src/IndexMap.mbt:1483:23-1483:26:
     |   let mut current = self.core.head (escaped)
     |   while current != -1 { (escaped)
     |     let entry = self.core.entries[current] (escaped)
1483 |     pairs.push((entry.key, entry.value)) (escaped)
     |                       ^^^ (escaped)
     |     current = entry.next (escaped)
     |   } (escaped)

<WORKDIR>/src/IndexMap.mbt:1551:23-1551:26:
     |   let mut current = self.core.head (escaped)
     |   while current != -1 { (escaped)
     |     let entry = self.core.entries[current] (escaped)
1551 |     pairs.push((entry.key, entry.value)) (escaped)
     |                       ^^^ (escaped)
     |     current = entry.next (escaped)
     |   } (escaped)

<WORKDIR>/src/types.mbt:19:3-19:6:
   | /// 桶结构，包含键值对信息和链表指针 (escaped)
   | priv struct Bucket[K, V] { (escaped)
   |   hash : Int // 键的哈希值（缓存以避免重复计算） (escaped)
19 |   key : K // 键 (escaped)
   |   ^^^ (escaped)
   |   mut value : V // 值 (escaped)
   |   mut next : Int // 链表后继索引，-1表示没有后继 (escaped)

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
$ run_moon_ide moon ide find-references 'IndexMapCore' --loc 'src/types.mbt:27:13'
Found 2 references for symbol 'IndexMapCore':
<WORKDIR>/src/types.mbt:27:13-27:25:
   |  (escaped)
   | ///| (escaped)
   | /// IndexMap核心结构，包含所有数据组织功能 (escaped)
27 | priv struct IndexMapCore[K, V] { (escaped)
   |             ^^^^^^^^^^^^ (escaped)
   |   mut hash_to_idx : @hashmap.HashMap[Int, Int] // 哈希值到桶索引的映射 (escaped)
   |   mut entries : Array[Bucket[K, V]] // 数组：存储实际的键值对及其链表信息 (escaped)

<WORKDIR>/src/types.mbt:55:10-55:22:
   | /// assert_eq(map.get(3), Some("updated")) (escaped)
   | /// assert_eq(map.get_at(0), (3, "updated"))  // Access by insertion order (escaped)
   | struct T[K, V] { (escaped)
55 |   core : IndexMapCore[K, V] // 包含核心数据结构 (escaped)
   |          ^^^^^^^^^^^^ (escaped)
   |   mut size : Int // 元素数量 (escaped)
   |   mut capacity : Int // 当前哈希表容量 (escaped)

```

```mooncram
$ run_moon_ide moon ide find-references 'T' --loc 'src/types.mbt:54:8'
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

```mooncram
$ run_moon_ide moon ide find-references 'new' --loc 'src/IndexMap.mbt:27:14'
Found 61 references for symbol 'new':
<WORKDIR>/src/IndexMap.mbt:27:14-27:17:
   | /// let map : @IndexMap.T[String, Int] = @IndexMap.new(capacity=16) (escaped)
   | /// inspect(map.capacity(), content="16") (escaped)
   | /// inspect(map.is_empty(), content="true") (escaped)
27 | pub fn[K, V] new(capacity? : Int = Default_init_capacity) -> T[K, V] { (escaped)
   |              ^^^ (escaped)
   |   { (escaped)
   |     core: { (escaped)

<WORKDIR>/src/IndexMap.mbt:66:13-66:16:
   | ///| (escaped)
   | /// Create a map from an array of key-value pairs (escaped)
   | pub fn[K : Hash + Eq, V] from_array(arr : Array[(K, V)]) -> T[K, V] { (escaped)
66 |   let map = new(capacity=arr.length()) (escaped)
   |             ^^^ (escaped)
   |   for i in 0..<arr.length() { (escaped)
   |     let (key, value) = arr[i] (escaped)

<WORKDIR>/src/IndexMap.mbt:514:13-514:16:
    | /// inspect(map.get(2), content="Some(\\"two\\")") (escaped)
    | /// Create a map from a fixed array of key-value pairs (escaped)
    | pub fn[K : Hash + Eq, V] of(arr : FixedArray[(K, V)]) -> T[K, V] { (escaped)
514 |   let map = new(capacity=arr.length()) (escaped)
    |             ^^^ (escaped)
    |   for i in 0..<arr.length() { (escaped)
    |     let (key, value) = arr[i] (escaped)

<WORKDIR>/src/IndexMap.mbt:549:11-549:14:
    |   K, (escaped)
    |   V, (escaped)
    | ] with arbitrary(size, rs) { (escaped)
549 |   let m = new() (escaped)
    |           ^^^ (escaped)
    |   (@quickcheck.Arbitrary::arbitrary(size, rs) : Iter[(K, V)]).each(fn(kv) { (escaped)
    |     let (k, v) = kv (escaped)

<WORKDIR>/src/IndexMap.mbt:582:13-582:16:
    |   let str2 = "test_string" (escaped)
    |  (escaped)
    |   // 创建一个使用MyString作为键的映射 (escaped)
582 |   let map = new() (escaped)
    |             ^^^ (escaped)
    |  (escaped)
    |   // 使用第一个字符串设置值 (escaped)

<WORKDIR>/src/IndexMap.mbt:623:30-623:33:
    |  (escaped)
    | ///| (escaped)
    | test "set" { (escaped)
623 |   let m : T[MyString, Int] = new() (escaped)
    |                              ^^^ (escaped)
    |   m.set("a", 1) (escaped)
    |   m.set("b", 1) (escaped)

<WORKDIR>/src/IndexMap.mbt:640:30-640:33:
    |  (escaped)
    | ///| (escaped)
    | test "remove" { (escaped)
640 |   let m : T[MyString, Int] = new() (escaped)
    |                              ^^^ (escaped)
    |   m.set("a", 1) (escaped)
    |   m.set("ab", 2) (escaped)

<WORKDIR>/src/IndexMap.mbt:657:30-657:33:
    |  (escaped)
    | ///| (escaped)
    | test "remove_unexist_key" { (escaped)
657 |   let m : T[MyString, Int] = new() (escaped)
    |                              ^^^ (escaped)
    |   m.set("a", 1) (escaped)
    |   m.set("ab", 2) (escaped)

<WORKDIR>/src/IndexMap.mbt:691:30-691:33:
    |  (escaped)
    | ///| (escaped)
    | test "grow" { (escaped)
691 |   let m : T[MyString, Int] = new() (escaped)
    |                              ^^^ (escaped)
    |   m.set("C", 1) (escaped)
    |   m.set("Go", 2) (escaped)

<WORKDIR>/src/IndexMap.mbt:904:11-904:14:
    | /// inspect(map.get(1), content="Some(\\"one\\")") (escaped)
    | /// inspect(map.get(2), content="Some(\\"two\\")") (escaped)
    | pub fn[K : Hash + Eq, V] from_iter(iter : Iter[(K, V)]) -> T[K, V] { (escaped)
904 |   let m = new() (escaped)
    |           ^^^ (escaped)
    |   iter.each(fn(e) { m.set(e.0, e.1) }) (escaped)
    |   m (escaped)

<WORKDIR>/src/IndexMap.mbt:1476:16-1476:19:
     |   compare : (K, V, K, V) -> Int, (escaped)
     | ) -> T[K, V] { (escaped)
     |   // 创建新映射 (escaped)
1476 |   let result = new(capacity=self.size) (escaped)
     |                ^^^ (escaped)
     |  (escaped)
     |   // 收集所有键值对 (escaped)

<WORKDIR>/src/IndexMap.mbt:1544:16-1544:19:
     | ///| (escaped)
     | pub fn[K : Hash + Eq, V] T::reversed(self : T[K, V]) -> T[K, V] { (escaped)
     |   // 创建新映射 (escaped)
1544 |   let result = new(capacity=self.size) (escaped)
     |                ^^^ (escaped)
     |  (escaped)
     |   // 收集所有键值对，按反向顺序 (escaped)

<WORKDIR>/src/IndexMap_test.mbt:17:45-17:48:
   |  (escaped)
   | ///| (escaped)
   | test "new" { (escaped)
17 |   let m : @IndexMap.T[Int, Int] = @IndexMap.new() (escaped)
   |                                             ^^^ (escaped)
   |   inspect(m.capacity(), content="8") (escaped)
   |   @debug.assert_eq(m.size(), 0) (escaped)

<WORKDIR>/src/IndexMap_test.mbt:24:21-24:24:
   |  (escaped)
   | ///| (escaped)
   | test "get" { (escaped)
24 |   let m = @IndexMap.new() (escaped)
   |                     ^^^ (escaped)
   |   m.set("a", 1) (escaped)
   |   m.set("b", 2) (escaped)

<WORKDIR>/src/IndexMap_test.mbt:37:21-37:24:
   |  (escaped)
   | ///| (escaped)
   | test "get_or_default" { (escaped)
37 |   let m = @IndexMap.new() (escaped)
   |                     ^^^ (escaped)
   |   m.set("a", 1) (escaped)
   |   m.set("b", 2) (escaped)

<WORKDIR>/src/IndexMap_test.mbt:49:21-49:24:
   |  (escaped)
   | ///| (escaped)
   | test "op_set" { (escaped)
49 |   let m = @IndexMap.new() (escaped)
   |                     ^^^ (escaped)
   |   m["a"] = 1 (escaped)
   |   m["b"] = 2 (escaped)

<WORKDIR>/src/IndexMap_test.mbt:58:21-58:24:
   |  (escaped)
   | ///| (escaped)
   | test "op_get" { (escaped)
58 |   let m = @IndexMap.new() (escaped)
   |                     ^^^ (escaped)
   |   m.set("a", 1) (escaped)
   |   m.set("b", 2) (escaped)

<WORKDIR>/src/IndexMap_test.mbt:68:21-68:24:
   |  (escaped)
   | ///| (escaped)
   | test "set_update" { (escaped)
68 |   let m = @IndexMap.new() (escaped)
   |                     ^^^ (escaped)
   |   m.set("a", 1) (escaped)
   |   m.set("b", 2) (escaped)

<WORKDIR>/src/IndexMap_test.mbt:78:21-78:24:
   |  (escaped)
   | ///| (escaped)
   | test "contains" { (escaped)
78 |   let m = @IndexMap.new() (escaped)
   |                     ^^^ (escaped)
   |   m.set("a", 1) (escaped)
   |   @debug.assert_eq(m.contains("a"), true) (escaped)

<WORKDIR>/src/IndexMap_test.mbt:94:21-94:24:
   |  (escaped)
   | ///| (escaped)
   | test "size" { (escaped)
94 |   let m = @IndexMap.new() (escaped)
   |                     ^^^ (escaped)
   |   @debug.assert_eq(m.size(), 0) (escaped)
   |   m.set("a", 1) (escaped)

<WORKDIR>/src/IndexMap_test.mbt:102:21-102:24:
    |  (escaped)
    | ///| (escaped)
    | test "is_empty" { (escaped)
102 |   let m = @IndexMap.new() (escaped)
    |                     ^^^ (escaped)
    |   @debug.assert_eq(m.is_empty(), true) (escaped)
    |   m.set("a", 1) (escaped)

<WORKDIR>/src/IndexMap_test.mbt:172:21-172:24:
    |  (escaped)
    | ///| (escaped)
    | test "get_nonexistent_key_duplicate_1" { (escaped)
172 |   let m = @IndexMap.new() (escaped)
    |                     ^^^ (escaped)
    |   m.set("a", 1) (escaped)
    |   m.set("b", 2) (escaped)

<WORKDIR>/src/IndexMap_test.mbt:180:21-180:24:
    |  (escaped)
    | ///| (escaped)
    | test "remove_nonexistent_key_duplicate_1" { (escaped)
180 |   let m = @IndexMap.new() (escaped)
    |                     ^^^ (escaped)
    |   m.set("a", 1) (escaped)
    |   m.set("b", 2) (escaped)

<WORKDIR>/src/IndexMap_test.mbt:189:21-189:24:
    |  (escaped)
    | ///| (escaped)
    | test "get_nonexistent_key_duplicate_2" { (escaped)
189 |   let m = @IndexMap.new() (escaped)
    |                     ^^^ (escaped)
    |   m.set("a", 1) (escaped)
    |   m.set("b", 2) (escaped)

<WORKDIR>/src/IndexMap_test.mbt:197:21-197:24:
    |  (escaped)
    | ///| (escaped)
    | test "remove_nonexistent_key_duplicate_2" { (escaped)
197 |   let m = @IndexMap.new() (escaped)
    |                     ^^^ (escaped)
    |   m.set("a", 1) (escaped)
    |   m.set("b", 2) (escaped)

<WORKDIR>/src/IndexMap_test.mbt:206:21-206:24:
    |  (escaped)
    | ///| (escaped)
    | test "get_nonexistent_key_duplicate_3" { (escaped)
206 |   let m = @IndexMap.new() (escaped)
    |                     ^^^ (escaped)
    |   m.set("a", 1) (escaped)
    |   m.set("b", 2) (escaped)

<WORKDIR>/src/IndexMap_test.mbt:214:21-214:24:
    |  (escaped)
    | ///| (escaped)
    | test "remove_nonexistent_key_duplicate_3" { (escaped)
214 |   let m = @IndexMap.new() (escaped)
    |                     ^^^ (escaped)
    |   m.set("a", 1) (escaped)
    |   m.set("b", 2) (escaped)

<WORKDIR>/src/IndexMap_test.mbt:223:21-223:24:
    |  (escaped)
    | ///| (escaped)
    | test "get_nonexistent_key" { (escaped)
223 |   let m = @IndexMap.new() (escaped)
    |                     ^^^ (escaped)
    |   m.set("a", 1) (escaped)
    |   m.set("b", 2) (escaped)

<WORKDIR>/src/IndexMap_test.mbt:231:21-231:24:
    |  (escaped)
    | ///| (escaped)
    | test "remove_nonexistent_key" { (escaped)
231 |   let m = @IndexMap.new() (escaped)
    |                     ^^^ (escaped)
    |   m.set("a", 1) (escaped)
    |   m.set("b", 2) (escaped)

<WORKDIR>/src/IndexMap_test.mbt:240:21-240:24:
    |  (escaped)
    | ///| (escaped)
    | test "get_nonexistent_key_with_psl" { (escaped)
240 |   let m = @IndexMap.new() (escaped)
    |                     ^^^ (escaped)
    |   m.set("a", 1) (escaped)
    |   m.set("b", 2) (escaped)

<WORKDIR>/src/IndexMap_test.mbt:319:50-319:53:
    |  (escaped)
    | ///| (escaped)
    | test "@IndexMap.contains/empty" { (escaped)
319 |   let map : @IndexMap.T[Int, String] = @IndexMap.new() (escaped)
    |                                                  ^^^ (escaped)
    |   inspect(map.contains(42), content="false") (escaped)
    | } (escaped)

<WORKDIR>/src/IndexMap_test.mbt:408:56-408:59:
    |   @debug.debug_inspect(map.get_at(4), content="None") (escaped)
    |  (escaped)
    |   // 测试空映射 (escaped)
408 |   let empty_map : @IndexMap.T[String, Int] = @IndexMap.new() (escaped)
    |                                                        ^^^ (escaped)
    |   @debug.debug_inspect(empty_map.get_at(0), content="None") (escaped)
    |  (escaped)

<WORKDIR>/src/IndexMap_test.mbt:529:40-529:43:
    | ///| (escaped)
    | /// 测试键值更新功能 (escaped)
    | test "update_existing_key" { (escaped)
529 |   let map : T[String, Int] = @IndexMap.new() (escaped)
    |                                        ^^^ (escaped)
    |  (escaped)
    |   // 首次插入键值对 (escaped)

<WORKDIR>/src/IndexMap_test.mbt:544:40-544:43:
    | ///| (escaped)
    | /// 测试首次插入元素更新头节点 (escaped)
    | test "first_element_head_update" { (escaped)
544 |   let map : T[String, Int] = @IndexMap.new() (escaped)
    |                                        ^^^ (escaped)
    |  (escaped)
    |   // 确认初始状态 (escaped)

<WORKDIR>/src/IndexMap_test.mbt:564:40-564:43:
    | ///| (escaped)
    | /// 测试get_or_init函数 (escaped)
    | test "get_or_init_function" { (escaped)
564 |   let map : T[String, Int] = @IndexMap.new() (escaped)
    |                                        ^^^ (escaped)
    |  (escaped)
    |   // 记录init函数调用次数 (escaped)

<WORKDIR>/src/IndexMap_test.mbt:591:40-591:43:
    | ///| (escaped)
    | /// 测试空映射上的remove操作 (escaped)
    | test "remove_on_empty_map" { (escaped)
591 |   let map : T[String, Int] = @IndexMap.new() (escaped)
    |                                        ^^^ (escaped)
    |  (escaped)
    |   // 确认映射为空 (escaped)

<WORKDIR>/src/IndexMap_test.mbt:607:40-607:43:
    | /// 测试触发扩容 (escaped)
    | test "capacity_growth" { (escaped)
    |   // 创建一个较小容量的映射 (escaped)
607 |   let map : T[Int, String] = @IndexMap.new(capacity=4) (escaped)
    |                                        ^^^ (escaped)
    |  (escaped)
    |   // 记录初始容量 (escaped)

<WORKDIR>/src/IndexMap_test.mbt:641:40-641:43:
    | ///| (escaped)
    | /// 测试尾节点的后继更新 (escaped)
    | test "tail_next_pointer_update" { (escaped)
641 |   let map : T[String, Int] = @IndexMap.new() (escaped)
    |                                        ^^^ (escaped)
    |  (escaped)
    |   // 添加第一个元素 (escaped)

<WORKDIR>/src/IndexMap_test.mbt:667:40-667:43:
    |  (escaped)
    | ///| (escaped)
    | test "0 size" { (escaped)
667 |   let map : T[String, Int] = @IndexMap.new() (escaped)
    |                                        ^^^ (escaped)
    |   @debug.assert_eq(map.values(), []) (escaped)
    |   @debug.assert_eq(map.keys(), []) (escaped)

<WORKDIR>/src/IndexMap_test.mbt:692:23-692:26:
    | ///| (escaped)
    | /// 测试to_json_string函数 (escaped)
    | test "to_json_string_function" { (escaped)
692 |   let map = @IndexMap.new() (escaped)
    |                       ^^^ (escaped)
    |   map.set("name", "John") (escaped)
    |   map.set("age", "30") (escaped)

<WORKDIR>/src/IndexMap_test.mbt:715:23-715:26:
    | ///| (escaped)
    | /// 测试contains_key函数 (escaped)
    | test "contains_key_function" { (escaped)
715 |   let map = @IndexMap.new() (escaped)
    |                       ^^^ (escaped)
    |   map.set("key1", "value1") (escaped)
    |  (escaped)

<WORKDIR>/src/IndexMap_test.mbt:728:23-728:26:
    | ///| (escaped)
    | /// 测试set函数中更新已存在键的值逻辑 (escaped)
    | test "set_update_existing_key" { (escaped)
728 |   let map = @IndexMap.new() (escaped)
    |                       ^^^ (escaped)
    |  (escaped)
    |   // 首次插入 (escaped)

<WORKDIR>/src/IndexMap_test.mbt:755:59-755:62:
    | /// 测试reverse函数处理size <= 1的情况 (escaped)
    | test "reverse_with_small_size" { (escaped)
    |   // 测试空映射 (escaped)
755 |   let empty_map : @IndexMap.T[String, String] = @IndexMap.new() (escaped)
    |                                                           ^^^ (escaped)
    |   let empty_keys_before = empty_map.keys() (escaped)
    |   empty_map.reverse() (escaped)

<WORKDIR>/src/IndexMap_test.mbt:762:30-762:33:
    |   @debug.assert_eq(empty_keys_before, empty_keys_after) (escaped)
    |  (escaped)
    |   // 测试只有一个元素的映射 (escaped)
762 |   let single_map = @IndexMap.new() (escaped)
    |                              ^^^ (escaped)
    |   single_map.set("key", "value") (escaped)
    |   let single_keys_before = single_map.keys() (escaped)

<WORKDIR>/src/IndexMap_test.mbt:800:23-800:26:
    | test "sort_with_equal_keys" { (escaped)
    |  (escaped)
    |   // 创建带有相等value但不同id的键的映射 (escaped)
800 |   let map = @IndexMap.new() (escaped)
    |                       ^^^ (escaped)
    |   map.set(TestKey::{ id: 1, value: 10 }, "A") (escaped)
    |   map.set(TestKey::{ id: 2, value: 20 }, "B") (escaped)

<WORKDIR>/src/IndexMap_test.mbt:821:24-821:27:
    | /// 测试sorted_by_key和sorted_by_values中处理相等情况 (escaped)
    | test "sorted_functions_with_equal_values" { (escaped)
    |   // 测试sorted_by_key相等情况 (escaped)
821 |   let map1 = @IndexMap.new() (escaped)
    |                        ^^^ (escaped)
    |   map1.set(10, "A") (escaped)
    |   map1.set(20, "B") (escaped)

<WORKDIR>/src/IndexMap_test.mbt:840:24-840:27:
    |   @debug.assert_eq(result1.get(10), Some("C")) (escaped)
    |  (escaped)
    |   // 测试sorted_by_values相等情况 (escaped)
840 |   let map2 = @IndexMap.new() (escaped)
    |                        ^^^ (escaped)
    |   map2.set("A", 10) (escaped)
    |   map2.set("B", 20) (escaped)

<WORKDIR>/src/IndexMap_test.mbt:868:23-868:26:
    | /// 测试索引到位置映射中的默认值处理 (escaped)
    | test "idx_to_position_default_handling" { (escaped)
    |   // 创建一个特殊情况，使idx_to_position.get返回None (escaped)
868 |   let map = @IndexMap.new() (escaped)
    |                       ^^^ (escaped)
    |  (escaped)
    |   // 首先添加几个元素 (escaped)

<WORKDIR>/src/IndexMap_test.mbt:892:23-892:26:
    | ///| (escaped)
    | /// 测试删除唯一元素后清空链表 (escaped)
    | test "remove_only_element_clears_list" { (escaped)
892 |   let map = @IndexMap.new() (escaped)
    |                       ^^^ (escaped)
    |  (escaped)
    |   // 添加唯一元素 (escaped)

<WORKDIR>/src/IndexMap_test.mbt:916:23-916:26:
    | ///| (escaped)
    | /// 测试shift方法删除单个元素 (escaped)
    | test "shift_only_element_clears_list" { (escaped)
916 |   let map = @IndexMap.new() (escaped)
    |                       ^^^ (escaped)
    |  (escaped)
    |   // 添加唯一元素 (escaped)

<WORKDIR>/src/IndexMap_test.mbt:935:23-935:26:
    | ///| (escaped)
    | /// 测试pop方法删除单个元素 (escaped)
    | test "pop_only_element_clears_list" { (escaped)
935 |   let map = @IndexMap.new() (escaped)
    |                       ^^^ (escaped)
    |  (escaped)
    |   // 添加唯一元素 (escaped)

<WORKDIR>/src/IndexMap_test.mbt:954:23-954:26:
    | ///| (escaped)
    | /// 测试迭代中断 (escaped)
    | test "iteration_early_termination" { (escaped)
954 |   let map = @IndexMap.new() (escaped)
    |                       ^^^ (escaped)
    |  (escaped)
    |   // 添加多个元素 (escaped)

<WORKDIR>/src/IndexMap_test.mbt:983:23-983:26:
    | ///| (escaped)
    | /// 测试更新已存在键的完整流程 (escaped)
    | test "complete_key_update_process" { (escaped)
983 |   let map = @IndexMap.new() (escaped)
    |                       ^^^ (escaped)
    |  (escaped)
    |   // 添加初始键值对 (escaped)

<WORKDIR>/src/IndexMap_test.mbt:1008:23-1008:26:
     | ///| (escaped)
     | /// 测试链表结构的完整更新 (escaped)
     | test "tail_next_pointer_complete_update" { (escaped)
1008 |   let map = @IndexMap.new() (escaped)
     |                       ^^^ (escaped)
     |  (escaped)
     |   // 测试空链表添加元素 (此时tail = -1) (escaped)

<WORKDIR>/src/IndexMap_test.mbt:1034:50-1034:53:
     | /// 测试容量为0情况下的自动扩容 (escaped)
     | test "growth_from_zero_capacity" { (escaped)
     |   // 创建特殊情况：容量为0的映射 (escaped)
1034 |   let map : @IndexMap.T[String, Int] = @IndexMap.new(capacity=0) (escaped)
     |                                                  ^^^ (escaped)
     |  (escaped)
     |   // 验证初始容量 (escaped)

<WORKDIR>/src/IndexMap_test.mbt:1078:23-1078:26:
     | /// 测试shift函数中处理idx_to_position映射缺失的情况 (escaped)
     | test "shift_with_missing_position_mapping" { (escaped)
     |   // 创建一个映射，然后修改其内部状态以模拟不一致情况 (escaped)
1078 |   let map = @IndexMap.new() (escaped)
     |                       ^^^ (escaped)
     |  (escaped)
     |   // 添加一些元素 (escaped)

<WORKDIR>/src/IndexMap_test.mbt:1115:23-1115:26:
     |   let key4 = TestKey::{ id: 4, value: 10 } // 与key1、key2相等 (escaped)
     |  (escaped)
     |   // 创建映射并添加元素（以不同的顺序添加） (escaped)
1115 |   let map = @IndexMap.new() (escaped)
     |                       ^^^ (escaped)
     |   map.set(key3, "C") // 值为20的键 (escaped)
     |   map.set(key1, "A") // 第一个值为10的键 (escaped)

<WORKDIR>/src/IndexMap_test.mbt:1148:23-1148:26:
     | ///| (escaped)
     | /// 测试set_with_hash函数更新已存在键的值 (escaped)
     | test "set_with_hash_update_existing_key" { (escaped)
1148 |   let map = @IndexMap.new() (escaped)
     |                       ^^^ (escaped)
     |  (escaped)
     |   // 创建一个键和预计算的哈希值 (escaped)

<WORKDIR>/src/IndexMap_test.mbt:1170:23-1170:26:
     | ///| (escaped)
     | /// 测试set_with_hash函数更新尾节点的后继指针 (escaped)
     | test "set_with_hash_update_tail_next" { (escaped)
1170 |   let map = @IndexMap.new() (escaped)
     |                       ^^^ (escaped)
     |  (escaped)
     |   // 插入第一个元素 (escaped)

<WORKDIR>/src/IndexMap_test.mbt:1212:23-1212:26:
     | /// 测试set_with_hash函数触发扩容逻辑 (escaped)
     | test "set_with_hash_triggers_growth" { (escaped)
     |   // 创建一个较小容量的映射以便快速触发扩容 (escaped)
1212 |   let map = @IndexMap.new(capacity=4) (escaped)
     |                       ^^^ (escaped)
     |  (escaped)
     |   // 记录初始容量 (escaped)

<WORKDIR>/src/IndexMap_test.mbt:1252:23-1252:26:
     | /// 测试set_with_hash函数在容量为0的情况下正确扩容 (escaped)
     | test "set_with_hash_growth_from_zero_capacity" { (escaped)
     |   // 创建零容量的映射 (escaped)
1252 |   let map = @IndexMap.new(capacity=0) (escaped)
     |                       ^^^ (escaped)
     |  (escaped)
     |   // 验证初始容量 (escaped)

```
