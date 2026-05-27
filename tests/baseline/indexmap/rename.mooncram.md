# indexmap rename

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
$ run_moon_ide moon ide rename 'hash' 'hash_renamed' --loc 'src/types.mbt:18:3'
*** Begin Patch
*** Update File: <WORKDIR>/src/IndexMap.mbt
@@
   // 创建新的桶
   let bucket_idx = self.core.entries.length()
   let new_bucket = {
-    hash,
+    hash_renamed: hash,
     key,
     value,
     next: -1, // 无后继
@@
   // 创建新的桶
   let bucket_idx = self.core.entries.length()
   let new_bucket = {
-    hash,
+    hash_renamed: hash,
     key,
     value,
     next: -1, // 无后继
@@
     Some(idx) => { (escaped)
       // 获取被删除元素的链表信息
       let entry = self.core.entries[idx]
-      let hash = entry.hash
+      let hash = entry.hash_renamed
 
       // 获取被删除元素的位置索引
       // 此处一定能获取到位置，因为idx是从key_to_idx中获得的有效索引
@@
   }
 
   // 从哈希表和键到索引的映射中移除
-  self.core.hash_to_idx.remove(tail_entry.hash)
+  self.core.hash_to_idx.remove(tail_entry.hash_renamed)
   self.key_to_idx.remove(key)
 
   // 从位置映射中移除最后一个位置
@@
   }
 
   // 从哈希表和键到索引的映射中移除
-  self.core.hash_to_idx.remove(head_entry.hash)
+  self.core.hash_to_idx.remove(head_entry.hash_renamed)
   self.key_to_idx.remove(key)
 
   // 获取头部元素的位置（应该是0）
*** Update File: <WORKDIR>/src/types.mbt
@@
 ///|
 /// 桶结构，包含键值对信息和链表指针
 priv struct Bucket[K, V] {
-  hash : Int // 键的哈希值（缓存以避免重复计算）
+  hash_renamed : Int // 键的哈希值（缓存以避免重复计算）
   key : K // 键
   mut value : V // 值
   mut next : Int // 链表后继索引，-1表示没有后继
*** End Patch

```

```mooncram
$ run_moon_ide moon ide rename 'key' 'key_renamed' --loc 'src/types.mbt:19:3'
*** Begin Patch
*** Update File: <WORKDIR>/src/IndexMap.mbt
@@
   let bucket_idx = self.core.entries.length()
   let new_bucket = {
     hash,
-    key,
+    key_renamed: key,
     value,
     next: -1, // 无后继
     prev: self.core.tail,
@@
   let bucket_idx = self.core.entries.length()
   let new_bucket = {
     hash,
-    key,
+    key_renamed: key,
     value,
     next: -1, // 无后继
     prev: self.core.tail,
@@
   let bucket = self.core.entries[bucket_idx]
 
   // 返回键值对
-  Some((bucket.key, bucket.value))
+  Some((bucket.key_renamed, bucket.value))
 }
 
 ///|
@@
     Some(idx) => { (escaped)
       // 找到了哈希值对应的索引，但还需要检查键是否匹配（处理哈希冲突）
       let entry = self.core.entries[idx]
-      if entry.key == key {
+      if entry.key_renamed == key {
         return Some(entry.value)
       }
 
@@
   let mut current = self.core.head
   while current != -1 {
     let entry = self.core.entries[current]
-    result.push((entry.key, entry.value))
+    result.push((entry.key_renamed, entry.value))
     current = entry.next
   }
   result
@@
   let mut current = old_head
   while current != -1 {
     let entry = old_entries[current]
-    self.set(entry.key, entry.value)
+    self.set(entry.key_renamed, entry.value)
     current = entry.next
   }
 }
@@
       s = s + ","
     }
     let entry = self.core.entries[current]
-    s = s + "(\{entry.key},\{entry.value})"
+    s = s + "(\{entry.key_renamed},\{entry.value})"
     current = entry.next
     i += 1
   }
@@
     } else {
       let entry = self.core.entries[current]
       current = entry.next
-      Some((entry.key, entry.value))
+      Some((entry.key_renamed, entry.value))
     }
   })
 }
@@
     } else {
       let entry = self.core.entries[current]
       current = entry.next
-      Some((entry.key, entry.value))
+      Some((entry.key_renamed, entry.value))
     }
   })
 }
@@
   let mut current = self.core.head
   while current != -1 {
     let entry = self.core.entries[current]
-    f(entry.key, entry.value)
+    f(entry.key_renamed, entry.value)
     current = entry.next
   }
 }
@@
   let mut idx = 0
   while current != -1 {
     let entry = self.core.entries[current]
-    f(idx, entry.key, entry.value)
+    f(idx, entry.key_renamed, entry.value)
     current = entry.next
     idx += 1
   }
@@
     return None
   }
   let entry = self.core.entries[self.core.head]
-  Some((entry.key, entry.value))
+  Some((entry.key_renamed, entry.value))
 }
 
 ///|
@@
     return None
   }
   let entry = self.core.entries[self.core.tail]
-  Some((entry.key, entry.value))
+  Some((entry.key_renamed, entry.value))
 }
 
 ///|
@@
   let result = []
   let mut current = self.core.head
   while current != -1 {
-    result.push(self.core.entries[current].key)
+    result.push(self.core.entries[current].key_renamed)
     current = self.core.entries[current].next
   }
   result
@@
     first = false
 
     // 添加键（转换为字符串）
-    result = result + "\"" + entry.key.to_string() + "\":"
+    result = result + "\"" + entry.key_renamed.to_string() + "\":"
 
     // 添加值（转换为JSON）
     result = result + entry.value.to_json().stringify()
@@
   let mut current = self.core.head
   while current != -1 {
     let entry = self.core.entries[current]
-    object[entry.key.to_string()] = entry.value.to_json()
+    object[entry.key_renamed.to_string()] = entry.value.to_json()
     current = entry.next
   }
   Json::object(object)
@@
   // 获取尾部元素
   let tail_idx = self.core.tail
   let tail_entry = self.core.entries[tail_idx]
-  let key = tail_entry.key
+  let key = tail_entry.key_renamed
   let value = tail_entry.value
 
   // 更新链表指针，移除尾节点
@@
   // 获取头部元素
   let head_idx = self.core.head
   let head_entry = self.core.entries[head_idx]
-  let key = head_entry.key
+  let key = head_entry.key_renamed
   let value = head_entry.value
 
   // 更新链表指针，移除头节点
@@
     return None
   }
   let head_entry = self.core.entries[self.core.head]
-  Some((head_entry.key, head_entry.value))
+  Some((head_entry.key_renamed, head_entry.value))
 }
 
 ///|
@@
     return None
   }
   let tail_entry = self.core.entries[self.core.tail]
-  Some((tail_entry.key, tail_entry.value))
+  Some((tail_entry.key_renamed, tail_entry.value))
 }
 
 ///|
@@
   let mut current = self.core.head
   while current != -1 {
     let entry = self.core.entries[current]
-    entries.push((current, entry.key, entry.value))
+    entries.push((current, entry.key_renamed, entry.value))
     current = entry.next
   }
 
@@
   let mut current = self.core.head
   while current != -1 {
     let entry = self.core.entries[current]
-    pairs.push((entry.key, entry.value))
+    pairs.push((entry.key_renamed, entry.value))
     current = entry.next
   }
 
@@
   let mut current = self.core.head
   while current != -1 {
     let entry = self.core.entries[current]
-    pairs.push((entry.key, entry.value))
+    pairs.push((entry.key_renamed, entry.value))
     current = entry.next
   }
   // 反向填充新映射
*** Update File: <WORKDIR>/src/types.mbt
@@
 /// 桶结构，包含键值对信息和链表指针
 priv struct Bucket[K, V] {
   hash : Int // 键的哈希值（缓存以避免重复计算）
-  key : K // 键
+  key_renamed : K // 键
   mut value : V // 值
   mut next : Int // 链表后继索引，-1表示没有后继
   mut prev : Int // 链表前驱索引，-1表示没有前驱
*** End Patch

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

```mooncram
$ run_moon_ide moon ide rename 'calc_grow_threshold' 'calc_grow_threshold_renamed' --loc 'src/IndexMap.mbt:5:4'
*** Begin Patch
*** Update File: <WORKDIR>/src/IndexMap.mbt
@@
 const Default_init_capacity = 8
 
 ///|
-fn calc_grow_threshold(capacity : Int) -> Int {
+fn calc_grow_threshold_renamed(capacity : Int) -> Int {
   capacity * 3 / 4 // 75% 负载因子
 }
 
@@
     },
     size: 0,
     capacity,
-    growAt: calc_grow_threshold(capacity),
+    growAt: calc_grow_threshold_renamed(capacity),
     key_to_idx: @hashmap.HashMap::default(),
   }
 }
@@
   } else {
     self.capacity = self.capacity * 2
   }
-  self.growAt = calc_grow_threshold(self.capacity)
+  self.growAt = calc_grow_threshold_renamed(self.capacity)
   self.core.hash_to_idx = @hashmap.HashMap([], capacity=self.capacity)
   self.core.entries = []
   self.core.head = -1
*** End Patch

```

```mooncram
$ run_moon_ide moon ide rename 'm' 'm_renamed' --loc 'src/IndexMap_test.mbt:17:7'
*** Begin Patch
*** Update File: <WORKDIR>/src/IndexMap_test.mbt
@@
 
 ///|
 test "new" {
-  let m : @IndexMap.T[Int, Int] = @IndexMap.new()
+  let m_renamed : @IndexMap.T[Int, Int] = @IndexMap.new()
-  inspect(m.capacity(), content="8")
+  inspect(m_renamed.capacity(), content="8")
-  @debug.assert_eq(m.size(), 0)
+  @debug.assert_eq(m_renamed.size(), 0)
 }
 
 ///|
*** End Patch

```

```mooncram
$ run_moon_ide moon ide rename 'T' 'TRenamed' --loc 'src/IndexMap_test.mbt:17:19'
*** Begin Patch
*** Update File: <WORKDIR>/src/IndexMap.mbt
@@
 /// let map : @IndexMap.T[String, Int] = @IndexMap.new(capacity=16)
 /// inspect(map.capacity(), content="16")
 /// inspect(map.is_empty(), content="true")
-pub fn[K, V] new(capacity? : Int = Default_init_capacity) -> T[K, V] {
+pub fn[K, V] new(capacity? : Int = Default_init_capacity) -> TRenamed[K, V] {
   {
     core: {
       hash_to_idx: @hashmap.HashMap([], capacity~),
@@
 
 ///|
 /// Create a map from an array of key-value pairs
-pub fn[K : Hash + Eq, V] from_array(arr : Array[(K, V)]) -> T[K, V] {
+pub fn[K : Hash + Eq, V] from_array(arr : Array[(K, V)]) -> TRenamed[K, V] {
   let map = new(capacity=arr.length())
   for i in 0..<arr.length() {
     let (key, value) = arr[i]
@@
 
 ///|
 /// Sets a key-value pair into the map. If the key already exists, updates its value.
-pub fn[K : Hash + Eq, V] T::set(self : T[K, V], key : K, value : V) -> Unit {
+pub fn[K : Hash + Eq, V] TRenamed::set(self : TRenamed[K, V], key : K, value : V) -> Unit {
   // 计算哈希值
   let hash = key.hash()
 
@@
 
 ///|
 /// Sets a key-value pair with a pre-computed hash
-pub fn[K : Hash + Eq, V] T::set_with_hash(
+pub fn[K : Hash + Eq, V] TRenamed::set_with_hash(
-  self : T[K, V],
+  self : TRenamed[K, V],
   key : K,
   value : V,
   hash : Int,
@@
 /// let map : @IndexMap.T[String, Int] = @IndexMap.new()
 /// map["key"] = 42
 /// inspect(map.get("key"), content="Some(42)")
-pub fn[K : Hash + Eq, V] T::op_set(self : T[K, V], key : K, value : V) -> Unit {
+pub fn[K : Hash + Eq, V] TRenamed::op_set(self : TRenamed[K, V], key : K, value : V) -> Unit {
   self.set(key, value)
 }
 
@@
 /// let map = @IndexMap.of([("key", 42)])
 /// inspect(map.get("key"), content="Some(42)")
 /// inspect(map.get("nonexistent"), content="None")
-pub fn[K : Hash + Eq, V] T::get(self : T[K, V], key : K) -> V? {
+pub fn[K : Hash + Eq, V] TRenamed::get(self : TRenamed[K, V], key : K) -> V? {
   // 直接从键到索引的映射中查找
   match self.key_to_idx.get(key) {
     Some(idx) => Some(self.core.entries[idx].value) (escaped)
@@
 
 ///|
 /// Gets the key-value pair at the given index position.
-pub fn[K, V] T::get_at(self : T[K, V], index : Int) -> (K, V)? {
+pub fn[K, V] TRenamed::get_at(self : TRenamed[K, V], index : Int) -> (K, V)? {
   if index < 0 || index >= self.size {
     return None
   }
@@
 }
 
 ///|
-fn[K : Eq, V] T::get_with_hash(self : T[K, V], key : K, hash : Int) -> V? {
+fn[K : Eq, V] TRenamed::get_with_hash(self : TRenamed[K, V], key : K, hash : Int) -> V? {
   // 首先检查哈希值是否在 hash_to_idx 中
   match self.core.hash_to_idx.get(hash) {
     Some(idx) => { (escaped)
@@
 /// let map = @IndexMap.of([("key", 42)])
 /// inspect(map["key"], content="Some(42)")
 /// inspect(map["nonexistent"], content="None")
-pub fn[K : Hash + Eq, V] T::op_get(self : T[K, V], key : K) -> V? {
+pub fn[K : Hash + Eq, V] TRenamed::op_get(self : TRenamed[K, V], key : K) -> V? {
   self.get(key)
 }
 
@@
 /// let value = map.get_or_init("key", fn() { 42 })
 /// inspect(value, content="42")
 /// inspect(map.get("key"), content="Some(42)")
-pub fn[K : Hash + Eq, V] T::get_or_init(
+pub fn[K : Hash + Eq, V] TRenamed::get_or_init(
-  self : T[K, V],
+  self : TRenamed[K, V],
   key : K,
   init : () -> V,
 ) -> V {
@@
 /// let map = @IndexMap.of([("a", 1), ("b", 2)])
 /// inspect(map.get_or_default("a", 0), content="1")
 /// inspect(map.get_or_default("c", 0), content="0")
-pub fn[K : Hash + Eq, V] T::get_or_default(
+pub fn[K : Hash + Eq, V] TRenamed::get_or_default(
-  self : T[K, V],
+  self : TRenamed[K, V],
   key : K,
   default : V,
 ) -> V {
@@
 /// let map = @IndexMap.of([("a", 1), ("b", 2)])
 /// inspect(map.contains("a"), content="true")
 /// inspect(map.contains("c"), content="false")
-pub fn[K : Hash + Eq, V] T::contains(self : T[K, V], key : K) -> Bool {
+pub fn[K : Hash + Eq, V] TRenamed::contains(self : TRenamed[K, V], key : K) -> Bool {
   match self.get(key) {
     Some(_) => true (escaped)
     None => false (escaped)
@@
 
 ///|
 /// Removes a key from the map.
-pub fn[K : Hash + Eq, V] T::remove(self : T[K, V], key : K) -> Unit {
+pub fn[K : Hash + Eq, V] TRenamed::remove(self : TRenamed[K, V], key : K) -> Unit {
   if self.size == 0 {
     return
   }
@@
 /// inspect(map.get(1), content="Some(\"one\")")
 /// inspect(map.get(2), content="Some(\"two\")")
 /// Create a map from a fixed array of key-value pairs
-pub fn[K : Hash + Eq, V] of(arr : FixedArray[(K, V)]) -> T[K, V] {
+pub fn[K : Hash + Eq, V] of(arr : FixedArray[(K, V)]) -> TRenamed[K, V] {
   let map = new(capacity=arr.length())
   for i in 0..<arr.length() {
     let (key, value) = arr[i]
@@
 ///
 /// let samples : Array[@IndexMap.T[Int, String]] = @quickcheck.samples(5)
 /// inspect(samples.length(), content="5")
-pub impl[K : @quickcheck.Arbitrary + Hash + Eq, V : @quickcheck.Arbitrary] @quickcheck.Arbitrary for T[
+pub impl[K : @quickcheck.Arbitrary + Hash + Eq, V : @quickcheck.Arbitrary] @quickcheck.Arbitrary for TRenamed[
   K,
   V,
 ] with arbitrary(size, rs) {
@@
 
 ///|
 test "set" {
-  let m : T[MyString, Int] = new()
+  let m : TRenamed[MyString, Int] = new()
   m.set("a", 1)
   m.set("b", 1)
   m.set("bc", 2)
@@
 
 ///|
 test "remove" {
-  let m : T[MyString, Int] = new()
+  let m : TRenamed[MyString, Int] = new()
   m.set("a", 1)
   m.set("ab", 2)
   m.set("bc", 2)
@@
 
 ///|
 test "remove_unexist_key" {
-  let m : T[MyString, Int] = new()
+  let m : TRenamed[MyString, Int] = new()
   m.set("a", 1)
   m.set("ab", 2)
   m.set("abc", 3)
@@
 
 ///|
 test "clear" {
-  let m : T[MyString, Int] = of([("a", 1), ("b", 2), ("c", 3)])
+  let m : TRenamed[MyString, Int] = of([("a", 1), ("b", 2), ("c", 3)])
   println(m.capacity())
   let old_capacity = m.capacity()
   m.clear()
@@
 
 ///|
 test "grow" {
-  let m : T[MyString, Int] = new()
+  let m : TRenamed[MyString, Int] = new()
   m.set("C", 1)
   m.set("Go", 2)
   m.set("C++", 3)
@@
 
 ///|
 /// Returns the number of key-value pairs in the map.
-pub fn[K, V] T::size(self : T[K, V]) -> Int {
+pub fn[K, V] TRenamed::size(self : TRenamed[K, V]) -> Int {
   self.size
 }
 
 ///|
-pub fn[K, V] T::capacity(self : T[K, V]) -> Int {
+pub fn[K, V] TRenamed::capacity(self : TRenamed[K, V]) -> Int {
   self.capacity
 }
 
 ///|
 /// Check if the map is empty.
-pub fn[K, V] T::is_empty(self : T[K, V]) -> Bool {
+pub fn[K, V] TRenamed::is_empty(self : TRenamed[K, V]) -> Bool {
   self.size == 0
 }
 
 ///|
 /// Check if the map contains a key.
-pub fn[K : Hash + Eq, V] T::contains_key(self : T[K, V], key : K) -> Bool {
+pub fn[K : Hash + Eq, V] TRenamed::contains_key(self : TRenamed[K, V], key : K) -> Bool {
   self.key_to_idx.contains(key)
 }
 
 ///|
 /// Clears the map, removing all key-value pairs.
-pub fn[K, V] T::clear(self : T[K, V]) -> Unit {
+pub fn[K, V] TRenamed::clear(self : TRenamed[K, V]) -> Unit {
   self.core.hash_to_idx.clear()
   self.core.entries = []
   self.core.head = -1
@@
 
 ///|
 /// Convert the map to an array of key-value pairs
-pub fn[K, V] T::to_array(self : T[K, V]) -> Array[(K, V)] {
+pub fn[K, V] TRenamed::to_array(self : TRenamed[K, V]) -> Array[(K, V)] {
   if self.size == 0 {
     return []
   }
@@
 
 ///|
 /// Grow the map capacity
-fn[K : Hash + Eq, V] T::grow(self : T[K, V]) -> Unit {
+fn[K : Hash + Eq, V] TRenamed::grow(self : TRenamed[K, V]) -> Unit {
   // 保存旧数据
   let old_entries = self.core.entries
   let old_head = self.core.head
@@
 }
 
 ///|
-fn[K : Show, V : Show] T::debug_entries(self : T[K, V]) -> String {
+fn[K : Show, V : Show] TRenamed::debug_entries(self : TRenamed[K, V]) -> String {
   let mut s = ""
   let mut current = self.core.head
   let mut i = 0
@@
 /// inspect(pairs.length(), content="2")
 /// inspect(pairs[0], content="(1, \"one\")")
 /// inspect(pairs[1], content="(2, \"two\")")
-pub fn[K, V] T::iter(self : T[K, V]) -> Iter[(K, V)] {
+pub fn[K, V] TRenamed::iter(self : TRenamed[K, V]) -> Iter[(K, V)] {
   let mut current = self.core.head
   Iter::new(fn() {
     if current == -1 {
@@
 /// let mut sum = 0
 /// map.iter2().each(fn(k, _) { sum = sum + k })
 /// inspect(sum, content="3")
-pub fn[K, V] T::iter2(self : T[K, V]) -> Iter2[K, V] {
+pub fn[K, V] TRenamed::iter2(self : TRenamed[K, V]) -> Iter2[K, V] {
   let mut current = self.core.head
   Iter2::new(fn() {
     if current == -1 {
@@
 /// let map = @IndexMap.from_iter(iter)
 /// inspect(map.get(1), content="Some(\"one\")")
 /// inspect(map.get(2), content="Some(\"two\")")
-pub fn[K : Hash + Eq, V] from_iter(iter : Iter[(K, V)]) -> T[K, V] {
+pub fn[K : Hash + Eq, V] from_iter(iter : Iter[(K, V)]) -> TRenamed[K, V] {
   let m = new()
   iter.each(fn(e) { m.set(e.0, e.1) })
   m
@@
 /// inspect(map.get(2), content="Some(\"two\")")
 ///
 #deprecated("use `@IndexMap.from_iter` instead")
-pub fn[K : Hash + Eq, V] T::from_iter(iter : Iter[(K, V)]) -> T[K, V] {
+pub fn[K : Hash + Eq, V] TRenamed::from_iter(iter : Iter[(K, V)]) -> TRenamed[K, V] {
   from_iter(iter)
 }
 
@@
 /// let mut result = ""
 /// map.each(fn(k, v) { result = result + "\{k}:\{v}," })
 /// inspect(result, content="1:one,2:two,")
-pub fn[K, V] T::each(self : T[K, V], f : (K, V) -> Unit) -> Unit {
+pub fn[K, V] TRenamed::each(self : TRenamed[K, V], f : (K, V) -> Unit) -> Unit {
   let mut current = self.core.head
   while current != -1 {
     let entry = self.core.entries[current]
@@
 /// map.eachi(fn(i, k, _) { if k == "b" { result = i } })
 /// // "b" is at index 1
 /// inspect(result, content="1")
-pub fn[K, V] T::eachi(self : T[K, V], f : (Int, K, V) -> Unit) -> Unit {
+pub fn[K, V] TRenamed::eachi(self : TRenamed[K, V], f : (Int, K, V) -> Unit) -> Unit {
   let mut current = self.core.head
   let mut idx = 0
   while current != -1 {
@@
 /// inspect(map, content=
 /// #|IndexMap::of([(1, "one"), (2, "two")])
 /// )
-pub impl[K : Show, V : Show] Show for T[K, V] with output(self, logger) {
+pub impl[K : Show, V : Show] Show for TRenamed[K, V] with output(self, logger) {
   logger.write_string("IndexMap::of([")
   self.eachi(fn(i, k, v) {
     if i > 0 {
@@
 /// inspect(map.index_of("a"), content="Some(0)")
 /// inspect(map.index_of("b"), content="Some(1)")
 /// inspect(map.index_of("d"), content="None")
-pub fn[K : Hash + Eq, V] T::index_of(self : T[K, V], key : K) -> Int? {
+pub fn[K : Hash + Eq, V] TRenamed::index_of(self : TRenamed[K, V], key : K) -> Int? {
   // 先检查键是否存在
   match self.key_to_idx.get(key) {
     Some(bucket_idx) => (escaped)
@@
 ///
 /// let map = @IndexMap.of([("a", 1), ("b", 2)])
 /// inspect(map.first(), content="Some((\"a\", 1))")
-pub fn[K, V] T::first(self : T[K, V]) -> (K, V)? {
+pub fn[K, V] TRenamed::first(self : TRenamed[K, V]) -> (K, V)? {
   if self.size == 0 || self.core.head == -1 {
     return None
   }
@@
 ///
 /// let map = @IndexMap.of([("a", 1), ("b", 2)])
 /// inspect(map.last(), content="Some((\"b\", 2))")
-pub fn[K, V] T::last(self : T[K, V]) -> (K, V)? {
+pub fn[K, V] TRenamed::last(self : TRenamed[K, V]) -> (K, V)? {
   if self.size == 0 || self.core.tail == -1 {
     return None
   }
@@
 ///
 /// let map = @IndexMap.of([('a', 1), ('b', 2), ('c', 3)])
 /// inspect(map.keys(), content=['a', 'b', 'c'])
-pub fn[K, V] T::keys(self : T[K, V]) -> Array[K] {
+pub fn[K, V] TRenamed::keys(self : TRenamed[K, V]) -> Array[K] {
   if self.size == 0 {
     return []
   }
@@
 ///
 /// let map = @IndexMap.of([('a', 1), ('b', 2), ('c', 3)])
 /// inspect(map.values(), content=[1, 2, 3])
-pub fn[K, V] T::values(self : T[K, V]) -> Array[V] {
+pub fn[K, V] TRenamed::values(self : TRenamed[K, V]) -> Array[V] {
   if self.size == 0 {
     return []
   }
@@
 ///
 /// let map = @IndexMap.of([(1, 10), (2, 20), (3, 30)])
 /// inspect(map.to_json_string(), content="{\"1\":10,\"2\":20,\"3\":30}")
-pub fn[K : Show, V : ToJson] T::to_json_string(self : T[K, V]) -> String {
+pub fn[K : Show, V : ToJson] TRenamed::to_json_string(self : TRenamed[K, V]) -> String {
   // 直接构建JSON字符串
   let mut result = "{"
   let mut first = true
@@
 
 ///|
 /// Standard ToJson implementation (may not preserve order)
-pub impl[K : Show, V : ToJson] ToJson for T[K, V] with to_json(self) {
+pub impl[K : Show, V : ToJson] ToJson for TRenamed[K, V] with to_json(self) {
   // 使用普通Map
   let object = Map([], capacity=self.size)
 
@@
 /// inspect(map.pop(), content="Some((\"c\", 3))")
 /// inspect(map.size(), content="2")
 /// inspect(map.get("c"), content="None")
-pub fn[K : Hash + Eq, V] T::pop(self : T[K, V]) -> (K, V)? {
+pub fn[K : Hash + Eq, V] TRenamed::pop(self : TRenamed[K, V]) -> (K, V)? {
   if self.size == 0 || self.core.tail == -1 {
     return None
   }
@@
 /// inspect(map.shift(), content="Some((\"a\", 1))")
 /// inspect(map.size(), content="2")
 /// inspect(map.get("a"), content="None")
-pub fn[K : Hash + Eq, V] T::shift(self : T[K, V]) -> (K, V)? {
+pub fn[K : Hash + Eq, V] TRenamed::shift(self : TRenamed[K, V]) -> (K, V)? {
   if self.size == 0 || self.core.head == -1 {
     return None
   }
@@
 /// let map = @IndexMap.of([("a", 1), ("b", 2)])
 /// inspect(map.get_first(), content="Some((\"a\", 1))")
 /// inspect(map.size(), content="2")  // 元素没有被移除
-pub fn[K, V] T::get_first(self : T[K, V]) -> (K, V)? {
+pub fn[K, V] TRenamed::get_first(self : TRenamed[K, V]) -> (K, V)? {
   if self.size == 0 || self.core.head == -1 {
     return None
   }
@@
 /// let map = @IndexMap.of([("a", 1), ("b", 2)])
 /// inspect(map.get_last(), content="Some((\"b\", 2))")
 /// inspect(map.size(), content="2")  // 元素没有被移除
-pub fn[K, V] T::get_last(self : T[K, V]) -> (K, V)? {
+pub fn[K, V] TRenamed::get_last(self : TRenamed[K, V]) -> (K, V)? {
   if self.size == 0 || self.core.tail == -1 {
     return None
   }
@@
 }
 
 ///|
-pub fn[K, V] T::sort_by(self : T[K, V], compare : (K, V, K, V) -> Int) -> Unit {
+pub fn[K, V] TRenamed::sort_by(self : TRenamed[K, V], compare : (K, V, K, V) -> Int) -> Unit {
   if self.size <= 1 {
     return // 不需要排序
   }
@@
 }
 
 ///|
-pub fn[K, V] T::sort_by_key(self : T[K, V], compare : (K, K) -> Int) -> Unit {
+pub fn[K, V] TRenamed::sort_by_key(self : TRenamed[K, V], compare : (K, K) -> Int) -> Unit {
   self.sort_by(fn(k1, _, k2, _) { compare(k1, k2) })
 }
 
 ///|
-pub fn[K, V] T::sort_by_value(self : T[K, V], compare : (V, V) -> Int) -> Unit {
+pub fn[K, V] TRenamed::sort_by_value(self : TRenamed[K, V], compare : (V, V) -> Int) -> Unit {
   self.sort_by(fn(_, v1, _, v2) { compare(v1, v2) })
 }
 
 ///|
-pub fn[K : Compare, V] T::sort(self : T[K, V]) -> Unit {
+pub fn[K : Compare, V] TRenamed::sort(self : TRenamed[K, V]) -> Unit {
   self.sort_by_key(fn(k1, k2) {
     if k1 < k2 {
       -1
@@
 }
 
 ///|
-pub fn[K, V] T::reverse(self : T[K, V]) -> Unit {
+pub fn[K, V] TRenamed::reverse(self : TRenamed[K, V]) -> Unit {
   if self.size <= 1 {
     return // 不需要反转
   }
@@
 }
 
 ///|
-pub fn[K : Hash + Eq, V] T::sorted_by(
+pub fn[K : Hash + Eq, V] TRenamed::sorted_by(
-  self : T[K, V],
+  self : TRenamed[K, V],
   compare : (K, V, K, V) -> Int,
-) -> T[K, V] {
+) -> TRenamed[K, V] {
   // 创建新映射
   let result = new(capacity=self.size)
 
@@
 }
 
 ///|
-pub fn[K : Hash + Eq, V] T::sorted_by_key(
+pub fn[K : Hash + Eq, V] TRenamed::sorted_by_key(
-  self : T[K, V],
+  self : TRenamed[K, V],
   compare : (K, K) -> Int,
-) -> T[K, V] {
+) -> TRenamed[K, V] {
   self.sorted_by(fn(k1, _, k2, _) { compare(k1, k2) })
 }
 
 ///|
-pub fn[K : Hash + Eq, V] T::sorted_by_value(
+pub fn[K : Hash + Eq, V] TRenamed::sorted_by_value(
-  self : T[K, V],
+  self : TRenamed[K, V],
   compare : (V, V) -> Int,
-) -> T[K, V] {
+) -> TRenamed[K, V] {
   self.sorted_by(fn(_, v1, _, v2) { compare(v1, v2) })
 }
 
 ///|
-pub fn[K : Hash + Eq + Compare, V] T::sorted(self : T[K, V]) -> T[K, V] {
+pub fn[K : Hash + Eq + Compare, V] TRenamed::sorted(self : TRenamed[K, V]) -> TRenamed[K, V] {
   self.sorted_by_key(fn(k1, k2) {
     if k1 < k2 {
       -1
@@
 }
 
 ///|
-pub fn[K : Hash + Eq, V : Compare] T::sorted_by_values(
+pub fn[K : Hash + Eq, V : Compare] TRenamed::sorted_by_values(
-  self : T[K, V],
+  self : TRenamed[K, V],
-) -> T[K, V] {
+) -> TRenamed[K, V] {
   self.sorted_by_value(fn(v1, v2) {
     if v1 < v2 {
       -1
@@
 }
 
 ///|
-pub fn[K : Hash + Eq, V] T::reversed(self : T[K, V]) -> T[K, V] {
+pub fn[K : Hash + Eq, V] TRenamed::reversed(self : TRenamed[K, V]) -> TRenamed[K, V] {
   // 创建新映射
   let result = new(capacity=self.size)
 
*** Update File: <WORKDIR>/src/IndexMap_test.mbt
@@
 
 ///|
 test "new" {
-  let m : @IndexMap.T[Int, Int] = @IndexMap.new()
+  let m : @IndexMap.TRenamed[Int, Int] = @IndexMap.new()
   inspect(m.capacity(), content="8")
   @debug.assert_eq(m.size(), 0)
 }
@@
 
 ///|
 test "from_iter empty iter" {
-  let map : @IndexMap.T[Int, Int] = @IndexMap.from_iter(Iter::empty())
+  let map : @IndexMap.TRenamed[Int, Int] = @IndexMap.from_iter(Iter::empty())
   inspect(map, content="IndexMap::of([])")
 }
 
 ///|
 test "@IndexMap.contains/empty" {
-  let map : @IndexMap.T[Int, String] = @IndexMap.new()
+  let map : @IndexMap.TRenamed[Int, String] = @IndexMap.new()
   inspect(map.contains(42), content="false")
 }
 
@@
   @debug.debug_inspect(map.get_at(4), content="None")
 
   // 测试空映射
-  let empty_map : @IndexMap.T[String, Int] = @IndexMap.new()
+  let empty_map : @IndexMap.TRenamed[String, Int] = @IndexMap.new()
   @debug.debug_inspect(empty_map.get_at(0), content="None")
 
   // 测试修改元素后的索引访问
@@
 
 ///|
 test "IndexSet arbitrary" {
-  let samples : Array[@IndexMap.T[Int, Int]] = @quickcheck.samples(20)
+  let samples : Array[@IndexMap.TRenamed[Int, Int]] = @quickcheck.samples(20)
   let sample_arrays_5_10 = []
   for sample in samples[5:10] {
     sample_arrays_5_10.push(sample.to_array())
@@
 /// 测试reverse函数处理size <= 1的情况
 test "reverse_with_small_size" {
   // 测试空映射
-  let empty_map : @IndexMap.T[String, String] = @IndexMap.new()
+  let empty_map : @IndexMap.TRenamed[String, String] = @IndexMap.new()
   let empty_keys_before = empty_map.keys()
   empty_map.reverse()
   let empty_keys_after = empty_map.keys()
@@
 /// 测试容量为0情况下的自动扩容
 test "growth_from_zero_capacity" {
   // 创建特殊情况：容量为0的映射
-  let map : @IndexMap.T[String, Int] = @IndexMap.new(capacity=0)
+  let map : @IndexMap.TRenamed[String, Int] = @IndexMap.new(capacity=0)
 
   // 验证初始容量
   @debug.assert_eq(map.capacity(), 0)
*** Update File: <WORKDIR>/src/types.mbt
@@
 /// map.set(3, "updated")
 /// assert_eq(map.get(3), Some("updated"))
 /// assert_eq(map.get_at(0), (3, "updated"))  // Access by insertion order
-struct T[K, V] {
+struct TRenamed[K, V] {
   core : IndexMapCore[K, V] // 包含核心数据结构
   mut size : Int // 元素数量
   mut capacity : Int // 当前哈希表容量
*** End Patch

```

```mooncram
$ run_moon_ide moon ide rename 'Bucket' 'BucketRenamed' --loc 'src/types.mbt:17:13'
*** Begin Patch
*** Update File: <WORKDIR>/src/types.mbt
@@
 
 ///|
 /// 桶结构，包含键值对信息和链表指针
-priv struct Bucket[K, V] {
+priv struct BucketRenamed[K, V] {
   hash : Int // 键的哈希值（缓存以避免重复计算）
   key : K // 键
   mut value : V // 值
@@
 /// IndexMap核心结构，包含所有数据组织功能
 priv struct IndexMapCore[K, V] {
   mut hash_to_idx : @hashmap.HashMap[Int, Int] // 哈希值到桶索引的映射
-  mut entries : Array[Bucket[K, V]] // 数组：存储实际的键值对及其链表信息
+  mut entries : Array[BucketRenamed[K, V]] // 数组：存储实际的键值对及其链表信息
   mut head : Int // 链表头节点索引，-1表示空链表
   mut tail : Int // 链表尾节点索引，-1表示空链表
   mut position_to_idx : Array[Int] // 位置到桶索引的映射，支持O(1)的索引访问
*** End Patch

```

```mooncram
$ run_moon_ide moon ide rename 'IndexMapCore' 'IndexMapCoreRenamed' --loc 'src/types.mbt:27:13'
*** Begin Patch
*** Update File: <WORKDIR>/src/types.mbt
@@
 
 ///|
 /// IndexMap核心结构，包含所有数据组织功能
-priv struct IndexMapCore[K, V] {
+priv struct IndexMapCoreRenamed[K, V] {
   mut hash_to_idx : @hashmap.HashMap[Int, Int] // 哈希值到桶索引的映射
   mut entries : Array[Bucket[K, V]] // 数组：存储实际的键值对及其链表信息
   mut head : Int // 链表头节点索引，-1表示空链表
@@
 /// assert_eq(map.get(3), Some("updated"))
 /// assert_eq(map.get_at(0), (3, "updated"))  // Access by insertion order
 struct T[K, V] {
-  core : IndexMapCore[K, V] // 包含核心数据结构
+  core : IndexMapCoreRenamed[K, V] // 包含核心数据结构
   mut size : Int // 元素数量
   mut capacity : Int // 当前哈希表容量
   mut growAt : Int // 扩容阈值
*** End Patch

```

```mooncram
$ run_moon_ide moon ide rename 'T' 'TRenamed' --loc 'src/types.mbt:54:8'
*** Begin Patch
*** Update File: <WORKDIR>/src/IndexMap.mbt
@@
 /// let map : @IndexMap.T[String, Int] = @IndexMap.new(capacity=16)
 /// inspect(map.capacity(), content="16")
 /// inspect(map.is_empty(), content="true")
-pub fn[K, V] new(capacity? : Int = Default_init_capacity) -> T[K, V] {
+pub fn[K, V] new(capacity? : Int = Default_init_capacity) -> TRenamed[K, V] {
   {
     core: {
       hash_to_idx: @hashmap.HashMap([], capacity~),
@@
 
 ///|
 /// Create a map from an array of key-value pairs
-pub fn[K : Hash + Eq, V] from_array(arr : Array[(K, V)]) -> T[K, V] {
+pub fn[K : Hash + Eq, V] from_array(arr : Array[(K, V)]) -> TRenamed[K, V] {
   let map = new(capacity=arr.length())
   for i in 0..<arr.length() {
     let (key, value) = arr[i]
@@
 
 ///|
 /// Sets a key-value pair into the map. If the key already exists, updates its value.
-pub fn[K : Hash + Eq, V] T::set(self : T[K, V], key : K, value : V) -> Unit {
+pub fn[K : Hash + Eq, V] TRenamed::set(self : TRenamed[K, V], key : K, value : V) -> Unit {
   // 计算哈希值
   let hash = key.hash()
 
@@
 
 ///|
 /// Sets a key-value pair with a pre-computed hash
-pub fn[K : Hash + Eq, V] T::set_with_hash(
+pub fn[K : Hash + Eq, V] TRenamed::set_with_hash(
-  self : T[K, V],
+  self : TRenamed[K, V],
   key : K,
   value : V,
   hash : Int,
@@
 /// let map : @IndexMap.T[String, Int] = @IndexMap.new()
 /// map["key"] = 42
 /// inspect(map.get("key"), content="Some(42)")
-pub fn[K : Hash + Eq, V] T::op_set(self : T[K, V], key : K, value : V) -> Unit {
+pub fn[K : Hash + Eq, V] TRenamed::op_set(self : TRenamed[K, V], key : K, value : V) -> Unit {
   self.set(key, value)
 }
 
@@
 /// let map = @IndexMap.of([("key", 42)])
 /// inspect(map.get("key"), content="Some(42)")
 /// inspect(map.get("nonexistent"), content="None")
-pub fn[K : Hash + Eq, V] T::get(self : T[K, V], key : K) -> V? {
+pub fn[K : Hash + Eq, V] TRenamed::get(self : TRenamed[K, V], key : K) -> V? {
   // 直接从键到索引的映射中查找
   match self.key_to_idx.get(key) {
     Some(idx) => Some(self.core.entries[idx].value) (escaped)
@@
 
 ///|
 /// Gets the key-value pair at the given index position.
-pub fn[K, V] T::get_at(self : T[K, V], index : Int) -> (K, V)? {
+pub fn[K, V] TRenamed::get_at(self : TRenamed[K, V], index : Int) -> (K, V)? {
   if index < 0 || index >= self.size {
     return None
   }
@@
 }
 
 ///|
-fn[K : Eq, V] T::get_with_hash(self : T[K, V], key : K, hash : Int) -> V? {
+fn[K : Eq, V] TRenamed::get_with_hash(self : TRenamed[K, V], key : K, hash : Int) -> V? {
   // 首先检查哈希值是否在 hash_to_idx 中
   match self.core.hash_to_idx.get(hash) {
     Some(idx) => { (escaped)
@@
 /// let map = @IndexMap.of([("key", 42)])
 /// inspect(map["key"], content="Some(42)")
 /// inspect(map["nonexistent"], content="None")
-pub fn[K : Hash + Eq, V] T::op_get(self : T[K, V], key : K) -> V? {
+pub fn[K : Hash + Eq, V] TRenamed::op_get(self : TRenamed[K, V], key : K) -> V? {
   self.get(key)
 }
 
@@
 /// let value = map.get_or_init("key", fn() { 42 })
 /// inspect(value, content="42")
 /// inspect(map.get("key"), content="Some(42)")
-pub fn[K : Hash + Eq, V] T::get_or_init(
+pub fn[K : Hash + Eq, V] TRenamed::get_or_init(
-  self : T[K, V],
+  self : TRenamed[K, V],
   key : K,
   init : () -> V,
 ) -> V {
@@
 /// let map = @IndexMap.of([("a", 1), ("b", 2)])
 /// inspect(map.get_or_default("a", 0), content="1")
 /// inspect(map.get_or_default("c", 0), content="0")
-pub fn[K : Hash + Eq, V] T::get_or_default(
+pub fn[K : Hash + Eq, V] TRenamed::get_or_default(
-  self : T[K, V],
+  self : TRenamed[K, V],
   key : K,
   default : V,
 ) -> V {
@@
 /// let map = @IndexMap.of([("a", 1), ("b", 2)])
 /// inspect(map.contains("a"), content="true")
 /// inspect(map.contains("c"), content="false")
-pub fn[K : Hash + Eq, V] T::contains(self : T[K, V], key : K) -> Bool {
+pub fn[K : Hash + Eq, V] TRenamed::contains(self : TRenamed[K, V], key : K) -> Bool {
   match self.get(key) {
     Some(_) => true (escaped)
     None => false (escaped)
@@
 
 ///|
 /// Removes a key from the map.
-pub fn[K : Hash + Eq, V] T::remove(self : T[K, V], key : K) -> Unit {
+pub fn[K : Hash + Eq, V] TRenamed::remove(self : TRenamed[K, V], key : K) -> Unit {
   if self.size == 0 {
     return
   }
@@
 /// inspect(map.get(1), content="Some(\"one\")")
 /// inspect(map.get(2), content="Some(\"two\")")
 /// Create a map from a fixed array of key-value pairs
-pub fn[K : Hash + Eq, V] of(arr : FixedArray[(K, V)]) -> T[K, V] {
+pub fn[K : Hash + Eq, V] of(arr : FixedArray[(K, V)]) -> TRenamed[K, V] {
   let map = new(capacity=arr.length())
   for i in 0..<arr.length() {
     let (key, value) = arr[i]
@@
 ///
 /// let samples : Array[@IndexMap.T[Int, String]] = @quickcheck.samples(5)
 /// inspect(samples.length(), content="5")
-pub impl[K : @quickcheck.Arbitrary + Hash + Eq, V : @quickcheck.Arbitrary] @quickcheck.Arbitrary for T[
+pub impl[K : @quickcheck.Arbitrary + Hash + Eq, V : @quickcheck.Arbitrary] @quickcheck.Arbitrary for TRenamed[
   K,
   V,
 ] with arbitrary(size, rs) {
@@
 
 ///|
 test "set" {
-  let m : T[MyString, Int] = new()
+  let m : TRenamed[MyString, Int] = new()
   m.set("a", 1)
   m.set("b", 1)
   m.set("bc", 2)
@@
 
 ///|
 test "remove" {
-  let m : T[MyString, Int] = new()
+  let m : TRenamed[MyString, Int] = new()
   m.set("a", 1)
   m.set("ab", 2)
   m.set("bc", 2)
@@
 
 ///|
 test "remove_unexist_key" {
-  let m : T[MyString, Int] = new()
+  let m : TRenamed[MyString, Int] = new()
   m.set("a", 1)
   m.set("ab", 2)
   m.set("abc", 3)
@@
 
 ///|
 test "clear" {
-  let m : T[MyString, Int] = of([("a", 1), ("b", 2), ("c", 3)])
+  let m : TRenamed[MyString, Int] = of([("a", 1), ("b", 2), ("c", 3)])
   println(m.capacity())
   let old_capacity = m.capacity()
   m.clear()
@@
 
 ///|
 test "grow" {
-  let m : T[MyString, Int] = new()
+  let m : TRenamed[MyString, Int] = new()
   m.set("C", 1)
   m.set("Go", 2)
   m.set("C++", 3)
@@
 
 ///|
 /// Returns the number of key-value pairs in the map.
-pub fn[K, V] T::size(self : T[K, V]) -> Int {
+pub fn[K, V] TRenamed::size(self : TRenamed[K, V]) -> Int {
   self.size
 }
 
 ///|
-pub fn[K, V] T::capacity(self : T[K, V]) -> Int {
+pub fn[K, V] TRenamed::capacity(self : TRenamed[K, V]) -> Int {
   self.capacity
 }
 
 ///|
 /// Check if the map is empty.
-pub fn[K, V] T::is_empty(self : T[K, V]) -> Bool {
+pub fn[K, V] TRenamed::is_empty(self : TRenamed[K, V]) -> Bool {
   self.size == 0
 }
 
 ///|
 /// Check if the map contains a key.
-pub fn[K : Hash + Eq, V] T::contains_key(self : T[K, V], key : K) -> Bool {
+pub fn[K : Hash + Eq, V] TRenamed::contains_key(self : TRenamed[K, V], key : K) -> Bool {
   self.key_to_idx.contains(key)
 }
 
 ///|
 /// Clears the map, removing all key-value pairs.
-pub fn[K, V] T::clear(self : T[K, V]) -> Unit {
+pub fn[K, V] TRenamed::clear(self : TRenamed[K, V]) -> Unit {
   self.core.hash_to_idx.clear()
   self.core.entries = []
   self.core.head = -1
@@
 
 ///|
 /// Convert the map to an array of key-value pairs
-pub fn[K, V] T::to_array(self : T[K, V]) -> Array[(K, V)] {
+pub fn[K, V] TRenamed::to_array(self : TRenamed[K, V]) -> Array[(K, V)] {
   if self.size == 0 {
     return []
   }
@@
 
 ///|
 /// Grow the map capacity
-fn[K : Hash + Eq, V] T::grow(self : T[K, V]) -> Unit {
+fn[K : Hash + Eq, V] TRenamed::grow(self : TRenamed[K, V]) -> Unit {
   // 保存旧数据
   let old_entries = self.core.entries
   let old_head = self.core.head
@@
 }
 
 ///|
-fn[K : Show, V : Show] T::debug_entries(self : T[K, V]) -> String {
+fn[K : Show, V : Show] TRenamed::debug_entries(self : TRenamed[K, V]) -> String {
   let mut s = ""
   let mut current = self.core.head
   let mut i = 0
@@
 /// inspect(pairs.length(), content="2")
 /// inspect(pairs[0], content="(1, \"one\")")
 /// inspect(pairs[1], content="(2, \"two\")")
-pub fn[K, V] T::iter(self : T[K, V]) -> Iter[(K, V)] {
+pub fn[K, V] TRenamed::iter(self : TRenamed[K, V]) -> Iter[(K, V)] {
   let mut current = self.core.head
   Iter::new(fn() {
     if current == -1 {
@@
 /// let mut sum = 0
 /// map.iter2().each(fn(k, _) { sum = sum + k })
 /// inspect(sum, content="3")
-pub fn[K, V] T::iter2(self : T[K, V]) -> Iter2[K, V] {
+pub fn[K, V] TRenamed::iter2(self : TRenamed[K, V]) -> Iter2[K, V] {
   let mut current = self.core.head
   Iter2::new(fn() {
     if current == -1 {
@@
 /// let map = @IndexMap.from_iter(iter)
 /// inspect(map.get(1), content="Some(\"one\")")
 /// inspect(map.get(2), content="Some(\"two\")")
-pub fn[K : Hash + Eq, V] from_iter(iter : Iter[(K, V)]) -> T[K, V] {
+pub fn[K : Hash + Eq, V] from_iter(iter : Iter[(K, V)]) -> TRenamed[K, V] {
   let m = new()
   iter.each(fn(e) { m.set(e.0, e.1) })
   m
@@
 /// inspect(map.get(2), content="Some(\"two\")")
 ///
 #deprecated("use `@IndexMap.from_iter` instead")
-pub fn[K : Hash + Eq, V] T::from_iter(iter : Iter[(K, V)]) -> T[K, V] {
+pub fn[K : Hash + Eq, V] TRenamed::from_iter(iter : Iter[(K, V)]) -> TRenamed[K, V] {
   from_iter(iter)
 }
 
@@
 /// let mut result = ""
 /// map.each(fn(k, v) { result = result + "\{k}:\{v}," })
 /// inspect(result, content="1:one,2:two,")
-pub fn[K, V] T::each(self : T[K, V], f : (K, V) -> Unit) -> Unit {
+pub fn[K, V] TRenamed::each(self : TRenamed[K, V], f : (K, V) -> Unit) -> Unit {
   let mut current = self.core.head
   while current != -1 {
     let entry = self.core.entries[current]
@@
 /// map.eachi(fn(i, k, _) { if k == "b" { result = i } })
 /// // "b" is at index 1
 /// inspect(result, content="1")
-pub fn[K, V] T::eachi(self : T[K, V], f : (Int, K, V) -> Unit) -> Unit {
+pub fn[K, V] TRenamed::eachi(self : TRenamed[K, V], f : (Int, K, V) -> Unit) -> Unit {
   let mut current = self.core.head
   let mut idx = 0
   while current != -1 {
@@
 /// inspect(map, content=
 /// #|IndexMap::of([(1, "one"), (2, "two")])
 /// )
-pub impl[K : Show, V : Show] Show for T[K, V] with output(self, logger) {
+pub impl[K : Show, V : Show] Show for TRenamed[K, V] with output(self, logger) {
   logger.write_string("IndexMap::of([")
   self.eachi(fn(i, k, v) {
     if i > 0 {
@@
 /// inspect(map.index_of("a"), content="Some(0)")
 /// inspect(map.index_of("b"), content="Some(1)")
 /// inspect(map.index_of("d"), content="None")
-pub fn[K : Hash + Eq, V] T::index_of(self : T[K, V], key : K) -> Int? {
+pub fn[K : Hash + Eq, V] TRenamed::index_of(self : TRenamed[K, V], key : K) -> Int? {
   // 先检查键是否存在
   match self.key_to_idx.get(key) {
     Some(bucket_idx) => (escaped)
@@
 ///
 /// let map = @IndexMap.of([("a", 1), ("b", 2)])
 /// inspect(map.first(), content="Some((\"a\", 1))")
-pub fn[K, V] T::first(self : T[K, V]) -> (K, V)? {
+pub fn[K, V] TRenamed::first(self : TRenamed[K, V]) -> (K, V)? {
   if self.size == 0 || self.core.head == -1 {
     return None
   }
@@
 ///
 /// let map = @IndexMap.of([("a", 1), ("b", 2)])
 /// inspect(map.last(), content="Some((\"b\", 2))")
-pub fn[K, V] T::last(self : T[K, V]) -> (K, V)? {
+pub fn[K, V] TRenamed::last(self : TRenamed[K, V]) -> (K, V)? {
   if self.size == 0 || self.core.tail == -1 {
     return None
   }
@@
 ///
 /// let map = @IndexMap.of([('a', 1), ('b', 2), ('c', 3)])
 /// inspect(map.keys(), content=['a', 'b', 'c'])
-pub fn[K, V] T::keys(self : T[K, V]) -> Array[K] {
+pub fn[K, V] TRenamed::keys(self : TRenamed[K, V]) -> Array[K] {
   if self.size == 0 {
     return []
   }
@@
 ///
 /// let map = @IndexMap.of([('a', 1), ('b', 2), ('c', 3)])
 /// inspect(map.values(), content=[1, 2, 3])
-pub fn[K, V] T::values(self : T[K, V]) -> Array[V] {
+pub fn[K, V] TRenamed::values(self : TRenamed[K, V]) -> Array[V] {
   if self.size == 0 {
     return []
   }
@@
 ///
 /// let map = @IndexMap.of([(1, 10), (2, 20), (3, 30)])
 /// inspect(map.to_json_string(), content="{\"1\":10,\"2\":20,\"3\":30}")
-pub fn[K : Show, V : ToJson] T::to_json_string(self : T[K, V]) -> String {
+pub fn[K : Show, V : ToJson] TRenamed::to_json_string(self : TRenamed[K, V]) -> String {
   // 直接构建JSON字符串
   let mut result = "{"
   let mut first = true
@@
 
 ///|
 /// Standard ToJson implementation (may not preserve order)
-pub impl[K : Show, V : ToJson] ToJson for T[K, V] with to_json(self) {
+pub impl[K : Show, V : ToJson] ToJson for TRenamed[K, V] with to_json(self) {
   // 使用普通Map
   let object = Map([], capacity=self.size)
 
@@
 /// inspect(map.pop(), content="Some((\"c\", 3))")
 /// inspect(map.size(), content="2")
 /// inspect(map.get("c"), content="None")
-pub fn[K : Hash + Eq, V] T::pop(self : T[K, V]) -> (K, V)? {
+pub fn[K : Hash + Eq, V] TRenamed::pop(self : TRenamed[K, V]) -> (K, V)? {
   if self.size == 0 || self.core.tail == -1 {
     return None
   }
@@
 /// inspect(map.shift(), content="Some((\"a\", 1))")
 /// inspect(map.size(), content="2")
 /// inspect(map.get("a"), content="None")
-pub fn[K : Hash + Eq, V] T::shift(self : T[K, V]) -> (K, V)? {
+pub fn[K : Hash + Eq, V] TRenamed::shift(self : TRenamed[K, V]) -> (K, V)? {
   if self.size == 0 || self.core.head == -1 {
     return None
   }
@@
 /// let map = @IndexMap.of([("a", 1), ("b", 2)])
 /// inspect(map.get_first(), content="Some((\"a\", 1))")
 /// inspect(map.size(), content="2")  // 元素没有被移除
-pub fn[K, V] T::get_first(self : T[K, V]) -> (K, V)? {
+pub fn[K, V] TRenamed::get_first(self : TRenamed[K, V]) -> (K, V)? {
   if self.size == 0 || self.core.head == -1 {
     return None
   }
@@
 /// let map = @IndexMap.of([("a", 1), ("b", 2)])
 /// inspect(map.get_last(), content="Some((\"b\", 2))")
 /// inspect(map.size(), content="2")  // 元素没有被移除
-pub fn[K, V] T::get_last(self : T[K, V]) -> (K, V)? {
+pub fn[K, V] TRenamed::get_last(self : TRenamed[K, V]) -> (K, V)? {
   if self.size == 0 || self.core.tail == -1 {
     return None
   }
@@
 }
 
 ///|
-pub fn[K, V] T::sort_by(self : T[K, V], compare : (K, V, K, V) -> Int) -> Unit {
+pub fn[K, V] TRenamed::sort_by(self : TRenamed[K, V], compare : (K, V, K, V) -> Int) -> Unit {
   if self.size <= 1 {
     return // 不需要排序
   }
@@
 }
 
 ///|
-pub fn[K, V] T::sort_by_key(self : T[K, V], compare : (K, K) -> Int) -> Unit {
+pub fn[K, V] TRenamed::sort_by_key(self : TRenamed[K, V], compare : (K, K) -> Int) -> Unit {
   self.sort_by(fn(k1, _, k2, _) { compare(k1, k2) })
 }
 
 ///|
-pub fn[K, V] T::sort_by_value(self : T[K, V], compare : (V, V) -> Int) -> Unit {
+pub fn[K, V] TRenamed::sort_by_value(self : TRenamed[K, V], compare : (V, V) -> Int) -> Unit {
   self.sort_by(fn(_, v1, _, v2) { compare(v1, v2) })
 }
 
 ///|
-pub fn[K : Compare, V] T::sort(self : T[K, V]) -> Unit {
+pub fn[K : Compare, V] TRenamed::sort(self : TRenamed[K, V]) -> Unit {
   self.sort_by_key(fn(k1, k2) {
     if k1 < k2 {
       -1
@@
 }
 
 ///|
-pub fn[K, V] T::reverse(self : T[K, V]) -> Unit {
+pub fn[K, V] TRenamed::reverse(self : TRenamed[K, V]) -> Unit {
   if self.size <= 1 {
     return // 不需要反转
   }
@@
 }
 
 ///|
-pub fn[K : Hash + Eq, V] T::sorted_by(
+pub fn[K : Hash + Eq, V] TRenamed::sorted_by(
-  self : T[K, V],
+  self : TRenamed[K, V],
   compare : (K, V, K, V) -> Int,
-) -> T[K, V] {
+) -> TRenamed[K, V] {
   // 创建新映射
   let result = new(capacity=self.size)
 
@@
 }
 
 ///|
-pub fn[K : Hash + Eq, V] T::sorted_by_key(
+pub fn[K : Hash + Eq, V] TRenamed::sorted_by_key(
-  self : T[K, V],
+  self : TRenamed[K, V],
   compare : (K, K) -> Int,
-) -> T[K, V] {
+) -> TRenamed[K, V] {
   self.sorted_by(fn(k1, _, k2, _) { compare(k1, k2) })
 }
 
 ///|
-pub fn[K : Hash + Eq, V] T::sorted_by_value(
+pub fn[K : Hash + Eq, V] TRenamed::sorted_by_value(
-  self : T[K, V],
+  self : TRenamed[K, V],
   compare : (V, V) -> Int,
-) -> T[K, V] {
+) -> TRenamed[K, V] {
   self.sorted_by(fn(_, v1, _, v2) { compare(v1, v2) })
 }
 
 ///|
-pub fn[K : Hash + Eq + Compare, V] T::sorted(self : T[K, V]) -> T[K, V] {
+pub fn[K : Hash + Eq + Compare, V] TRenamed::sorted(self : TRenamed[K, V]) -> TRenamed[K, V] {
   self.sorted_by_key(fn(k1, k2) {
     if k1 < k2 {
       -1
@@
 }
 
 ///|
-pub fn[K : Hash + Eq, V : Compare] T::sorted_by_values(
+pub fn[K : Hash + Eq, V : Compare] TRenamed::sorted_by_values(
-  self : T[K, V],
+  self : TRenamed[K, V],
-) -> T[K, V] {
+) -> TRenamed[K, V] {
   self.sorted_by_value(fn(v1, v2) {
     if v1 < v2 {
       -1
@@
 }
 
 ///|
-pub fn[K : Hash + Eq, V] T::reversed(self : T[K, V]) -> T[K, V] {
+pub fn[K : Hash + Eq, V] TRenamed::reversed(self : TRenamed[K, V]) -> TRenamed[K, V] {
   // 创建新映射
   let result = new(capacity=self.size)
 
*** Update File: <WORKDIR>/src/IndexMap_test.mbt
@@
 
 ///|
 test "new" {
-  let m : @IndexMap.T[Int, Int] = @IndexMap.new()
+  let m : @IndexMap.TRenamed[Int, Int] = @IndexMap.new()
   inspect(m.capacity(), content="8")
   @debug.assert_eq(m.size(), 0)
 }
@@
 
 ///|
 test "from_iter empty iter" {
-  let map : @IndexMap.T[Int, Int] = @IndexMap.from_iter(Iter::empty())
+  let map : @IndexMap.TRenamed[Int, Int] = @IndexMap.from_iter(Iter::empty())
   inspect(map, content="IndexMap::of([])")
 }
 
 ///|
 test "@IndexMap.contains/empty" {
-  let map : @IndexMap.T[Int, String] = @IndexMap.new()
+  let map : @IndexMap.TRenamed[Int, String] = @IndexMap.new()
   inspect(map.contains(42), content="false")
 }
 
@@
   @debug.debug_inspect(map.get_at(4), content="None")
 
   // 测试空映射
-  let empty_map : @IndexMap.T[String, Int] = @IndexMap.new()
+  let empty_map : @IndexMap.TRenamed[String, Int] = @IndexMap.new()
   @debug.debug_inspect(empty_map.get_at(0), content="None")
 
   // 测试修改元素后的索引访问
@@
 
 ///|
 test "IndexSet arbitrary" {
-  let samples : Array[@IndexMap.T[Int, Int]] = @quickcheck.samples(20)
+  let samples : Array[@IndexMap.TRenamed[Int, Int]] = @quickcheck.samples(20)
   let sample_arrays_5_10 = []
   for sample in samples[5:10] {
     sample_arrays_5_10.push(sample.to_array())
@@
 /// 测试reverse函数处理size <= 1的情况
 test "reverse_with_small_size" {
   // 测试空映射
-  let empty_map : @IndexMap.T[String, String] = @IndexMap.new()
+  let empty_map : @IndexMap.TRenamed[String, String] = @IndexMap.new()
   let empty_keys_before = empty_map.keys()
   empty_map.reverse()
   let empty_keys_after = empty_map.keys()
@@
 /// 测试容量为0情况下的自动扩容
 test "growth_from_zero_capacity" {
   // 创建特殊情况：容量为0的映射
-  let map : @IndexMap.T[String, Int] = @IndexMap.new(capacity=0)
+  let map : @IndexMap.TRenamed[String, Int] = @IndexMap.new(capacity=0)
 
   // 验证初始容量
   @debug.assert_eq(map.capacity(), 0)
*** Update File: <WORKDIR>/src/types.mbt
@@
 /// map.set(3, "updated")
 /// assert_eq(map.get(3), Some("updated"))
 /// assert_eq(map.get_at(0), (3, "updated"))  // Access by insertion order
-struct T[K, V] {
+struct TRenamed[K, V] {
   core : IndexMapCore[K, V] // 包含核心数据结构
   mut size : Int // 元素数量
   mut capacity : Int // 当前哈希表容量
*** End Patch

```

```mooncram
$ run_moon_ide moon ide rename 'new' 'new_renamed' --loc 'src/IndexMap.mbt:27:14'
*** Begin Patch
*** Update File: <WORKDIR>/src/IndexMap.mbt
@@
 /// let map : @IndexMap.T[String, Int] = @IndexMap.new(capacity=16)
 /// inspect(map.capacity(), content="16")
 /// inspect(map.is_empty(), content="true")
-pub fn[K, V] new(capacity? : Int = Default_init_capacity) -> T[K, V] {
+pub fn[K, V] new_renamed(capacity? : Int = Default_init_capacity) -> T[K, V] {
   {
     core: {
       hash_to_idx: @hashmap.HashMap([], capacity~),
@@
 ///|
 /// Create a map from an array of key-value pairs
 pub fn[K : Hash + Eq, V] from_array(arr : Array[(K, V)]) -> T[K, V] {
-  let map = new(capacity=arr.length())
+  let map = new_renamed(capacity=arr.length())
   for i in 0..<arr.length() {
     let (key, value) = arr[i]
     map.set(key, value)
@@
 /// inspect(map.get(2), content="Some(\"two\")")
 /// Create a map from a fixed array of key-value pairs
 pub fn[K : Hash + Eq, V] of(arr : FixedArray[(K, V)]) -> T[K, V] {
-  let map = new(capacity=arr.length())
+  let map = new_renamed(capacity=arr.length())
   for i in 0..<arr.length() {
     let (key, value) = arr[i]
     map.set(key, value)
@@
   K,
   V,
 ] with arbitrary(size, rs) {
-  let m = new()
+  let m = new_renamed()
   (@quickcheck.Arbitrary::arbitrary(size, rs) : Iter[(K, V)]).each(fn(kv) {
     let (k, v) = kv
     m.set(k, v)
@@
   let str2 = "test_string"
 
   // 创建一个使用MyString作为键的映射
-  let map = new()
+  let map = new_renamed()
 
   // 使用第一个字符串设置值
   map.set(str1, "value1")
@@
 
 ///|
 test "set" {
-  let m : T[MyString, Int] = new()
+  let m : T[MyString, Int] = new_renamed()
   m.set("a", 1)
   m.set("b", 1)
   m.set("bc", 2)
@@
 
 ///|
 test "remove" {
-  let m : T[MyString, Int] = new()
+  let m : T[MyString, Int] = new_renamed()
   m.set("a", 1)
   m.set("ab", 2)
   m.set("bc", 2)
@@
 
 ///|
 test "remove_unexist_key" {
-  let m : T[MyString, Int] = new()
+  let m : T[MyString, Int] = new_renamed()
   m.set("a", 1)
   m.set("ab", 2)
   m.set("abc", 3)
@@
 
 ///|
 test "grow" {
-  let m : T[MyString, Int] = new()
+  let m : T[MyString, Int] = new_renamed()
   m.set("C", 1)
   m.set("Go", 2)
   m.set("C++", 3)
@@
 /// inspect(map.get(1), content="Some(\"one\")")
 /// inspect(map.get(2), content="Some(\"two\")")
 pub fn[K : Hash + Eq, V] from_iter(iter : Iter[(K, V)]) -> T[K, V] {
-  let m = new()
+  let m = new_renamed()
   iter.each(fn(e) { m.set(e.0, e.1) })
   m
 }
@@
   compare : (K, V, K, V) -> Int,
 ) -> T[K, V] {
   // 创建新映射
-  let result = new(capacity=self.size)
+  let result = new_renamed(capacity=self.size)
 
   // 收集所有键值对
   let pairs = []
@@
 ///|
 pub fn[K : Hash + Eq, V] T::reversed(self : T[K, V]) -> T[K, V] {
   // 创建新映射
-  let result = new(capacity=self.size)
+  let result = new_renamed(capacity=self.size)
 
   // 收集所有键值对，按反向顺序
   let pairs = []
*** Update File: <WORKDIR>/src/IndexMap_test.mbt
@@
 
 ///|
 test "new" {
-  let m : @IndexMap.T[Int, Int] = @IndexMap.new()
+  let m : @IndexMap.T[Int, Int] = @IndexMap.new_renamed()
   inspect(m.capacity(), content="8")
   @debug.assert_eq(m.size(), 0)
 }
@@
 
 ///|
 test "get" {
-  let m = @IndexMap.new()
+  let m = @IndexMap.new_renamed()
   m.set("a", 1)
   m.set("b", 2)
   m.set("c", 3)
@@
 
 ///|
 test "get_or_default" {
-  let m = @IndexMap.new()
+  let m = @IndexMap.new_renamed()
   m.set("a", 1)
   m.set("b", 2)
   m.set("c", 3)
@@
 
 ///|
 test "op_set" {
-  let m = @IndexMap.new()
+  let m = @IndexMap.new_renamed()
   m["a"] = 1
   m["b"] = 2
   @debug.assert_eq(m.get("a"), Some(1))
@@
 
 ///|
 test "op_get" {
-  let m = @IndexMap.new()
+  let m = @IndexMap.new_renamed()
   m.set("a", 1)
   m.set("b", 2)
   @debug.assert_eq(m["a"], Some(1))
@@
 
 ///|
 test "set_update" {
-  let m = @IndexMap.new()
+  let m = @IndexMap.new_renamed()
   m.set("a", 1)
   m.set("b", 2)
   @debug.assert_eq(m.get("a"), Some(1))
@@
 
 ///|
 test "contains" {
-  let m = @IndexMap.new()
+  let m = @IndexMap.new_renamed()
   m.set("a", 1)
   @debug.assert_eq(m.contains("a"), true)
   @debug.assert_eq(m.contains("b"), false)
@@
 
 ///|
 test "size" {
-  let m = @IndexMap.new()
+  let m = @IndexMap.new_renamed()
   @debug.assert_eq(m.size(), 0)
   m.set("a", 1)
   @debug.assert_eq(m.size(), 1)
@@
 
 ///|
 test "is_empty" {
-  let m = @IndexMap.new()
+  let m = @IndexMap.new_renamed()
   @debug.assert_eq(m.is_empty(), true)
   m.set("a", 1)
   @debug.assert_eq(m.is_empty(), false)
@@
 
 ///|
 test "get_nonexistent_key_duplicate_1" {
-  let m = @IndexMap.new()
+  let m = @IndexMap.new_renamed()
   m.set("a", 1)
   m.set("b", 2)
   @debug.debug_inspect(m.get("c"), content="None")
@@
 
 ///|
 test "remove_nonexistent_key_duplicate_1" {
-  let m = @IndexMap.new()
+  let m = @IndexMap.new_renamed()
   m.set("a", 1)
   m.set("b", 2)
   m.remove("c")
@@
 
 ///|
 test "get_nonexistent_key_duplicate_2" {
-  let m = @IndexMap.new()
+  let m = @IndexMap.new_renamed()
   m.set("a", 1)
   m.set("b", 2)
   @debug.debug_inspect(m.get("c"), content="None")
@@
 
 ///|
 test "remove_nonexistent_key_duplicate_2" {
-  let m = @IndexMap.new()
+  let m = @IndexMap.new_renamed()
   m.set("a", 1)
   m.set("b", 2)
   m.remove("c")
@@
 
 ///|
 test "get_nonexistent_key_duplicate_3" {
-  let m = @IndexMap.new()
+  let m = @IndexMap.new_renamed()
   m.set("a", 1)
   m.set("b", 2)
   @debug.debug_inspect(m.get("c"), content="None")
@@
 
 ///|
 test "remove_nonexistent_key_duplicate_3" {
-  let m = @IndexMap.new()
+  let m = @IndexMap.new_renamed()
   m.set("a", 1)
   m.set("b", 2)
   m.remove("c")
@@
 
 ///|
 test "get_nonexistent_key" {
-  let m = @IndexMap.new()
+  let m = @IndexMap.new_renamed()
   m.set("a", 1)
   m.set("b", 2)
   @debug.debug_inspect(m.get("c"), content="None")
@@
 
 ///|
 test "remove_nonexistent_key" {
-  let m = @IndexMap.new()
+  let m = @IndexMap.new_renamed()
   m.set("a", 1)
   m.set("b", 2)
   m.remove("c")
@@
 
 ///|
 test "get_nonexistent_key_with_psl" {
-  let m = @IndexMap.new()
+  let m = @IndexMap.new_renamed()
   m.set("a", 1)
   m.set("b", 2)
   m.set("c", 3)
@@
 
 ///|
 test "@IndexMap.contains/empty" {
-  let map : @IndexMap.T[Int, String] = @IndexMap.new()
+  let map : @IndexMap.T[Int, String] = @IndexMap.new_renamed()
   inspect(map.contains(42), content="false")
 }
 
@@
   @debug.debug_inspect(map.get_at(4), content="None")
 
   // 测试空映射
-  let empty_map : @IndexMap.T[String, Int] = @IndexMap.new()
+  let empty_map : @IndexMap.T[String, Int] = @IndexMap.new_renamed()
   @debug.debug_inspect(empty_map.get_at(0), content="None")
 
   // 测试修改元素后的索引访问
@@
 ///|
 /// 测试键值更新功能
 test "update_existing_key" {
-  let map : T[String, Int] = @IndexMap.new()
+  let map : T[String, Int] = @IndexMap.new_renamed()
 
   // 首次插入键值对
   map.set("key1", 100)
@@
 ///|
 /// 测试首次插入元素更新头节点
 test "first_element_head_update" {
-  let map : T[String, Int] = @IndexMap.new()
+  let map : T[String, Int] = @IndexMap.new_renamed()
 
   // 确认初始状态
   @debug.assert_eq(map.size(), 0)
@@
 ///|
 /// 测试get_or_init函数
 test "get_or_init_function" {
-  let map : T[String, Int] = @IndexMap.new()
+  let map : T[String, Int] = @IndexMap.new_renamed()
 
   // 记录init函数调用次数
   let mut init_calls = 0
@@
 ///|
 /// 测试空映射上的remove操作
 test "remove_on_empty_map" {
-  let map : T[String, Int] = @IndexMap.new()
+  let map : T[String, Int] = @IndexMap.new_renamed()
 
   // 确认映射为空
   @debug.assert_eq(map.size(), 0)
@@
 /// 测试触发扩容
 test "capacity_growth" {
   // 创建一个较小容量的映射
-  let map : T[Int, String] = @IndexMap.new(capacity=4)
+  let map : T[Int, String] = @IndexMap.new_renamed(capacity=4)
 
   // 记录初始容量
   let initial_capacity = map.capacity()
@@
 ///|
 /// 测试尾节点的后继更新
 test "tail_next_pointer_update" {
-  let map : T[String, Int] = @IndexMap.new()
+  let map : T[String, Int] = @IndexMap.new_renamed()
 
   // 添加第一个元素
   map.set("first", 1)
@@
 
 ///|
 test "0 size" {
-  let map : T[String, Int] = @IndexMap.new()
+  let map : T[String, Int] = @IndexMap.new_renamed()
   @debug.assert_eq(map.values(), [])
   @debug.assert_eq(map.keys(), [])
   @debug.assert_eq(map.to_array(), [])
@@
 ///|
 /// 测试to_json_string函数
 test "to_json_string_function" {
-  let map = @IndexMap.new()
+  let map = @IndexMap.new_renamed()
   map.set("name", "John")
   map.set("age", "30")
   map.set("city", "New York")
@@
 ///|
 /// 测试contains_key函数
 test "contains_key_function" {
-  let map = @IndexMap.new()
+  let map = @IndexMap.new_renamed()
   map.set("key1", "value1")
 
   // 测试存在的键
@@
 ///|
 /// 测试set函数中更新已存在键的值逻辑
 test "set_update_existing_key" {
-  let map = @IndexMap.new()
+  let map = @IndexMap.new_renamed()
 
   // 首次插入
   map.set("key", "original_value")
@@
 /// 测试reverse函数处理size <= 1的情况
 test "reverse_with_small_size" {
   // 测试空映射
-  let empty_map : @IndexMap.T[String, String] = @IndexMap.new()
+  let empty_map : @IndexMap.T[String, String] = @IndexMap.new_renamed()
   let empty_keys_before = empty_map.keys()
   empty_map.reverse()
   let empty_keys_after = empty_map.keys()
@@
   @debug.assert_eq(empty_keys_before, empty_keys_after)
 
   // 测试只有一个元素的映射
-  let single_map = @IndexMap.new()
+  let single_map = @IndexMap.new_renamed()
   single_map.set("key", "value")
   let single_keys_before = single_map.keys()
   single_map.reverse()
@@
 test "sort_with_equal_keys" {
 
   // 创建带有相等value但不同id的键的映射
-  let map = @IndexMap.new()
+  let map = @IndexMap.new_renamed()
   map.set(TestKey::{ id: 1, value: 10 }, "A")
   map.set(TestKey::{ id: 2, value: 20 }, "B")
   map.set(TestKey::{ id: 3, value: 10 }, "C") // 与第一个键的value相同
@@
 /// 测试sorted_by_key和sorted_by_values中处理相等情况
 test "sorted_functions_with_equal_values" {
   // 测试sorted_by_key相等情况
-  let map1 = @IndexMap.new()
+  let map1 = @IndexMap.new_renamed()
   map1.set(10, "A")
   map1.set(20, "B")
   map1.set(10, "C") // 相同的键，会覆盖之前的值
@@
   @debug.assert_eq(result1.get(10), Some("C"))
 
   // 测试sorted_by_values相等情况
-  let map2 = @IndexMap.new()
+  let map2 = @IndexMap.new_renamed()
   map2.set("A", 10)
   map2.set("B", 20)
   map2.set("C", 10) // 相同的值
@@
 /// 测试索引到位置映射中的默认值处理
 test "idx_to_position_default_handling" {
   // 创建一个特殊情况，使idx_to_position.get返回None
-  let map = @IndexMap.new()
+  let map = @IndexMap.new_renamed()
 
   // 首先添加几个元素
   map.set("key1", "value1")
@@
 ///|
 /// 测试删除唯一元素后清空链表
 test "remove_only_element_clears_list" {
-  let map = @IndexMap.new()
+  let map = @IndexMap.new_renamed()
 
   // 添加唯一元素
   map.set("only_key", "only_value")
@@
 ///|
 /// 测试shift方法删除单个元素
 test "shift_only_element_clears_list" {
-  let map = @IndexMap.new()
+  let map = @IndexMap.new_renamed()
 
   // 添加唯一元素
   map.set("only_key", "only_value")
@@
 ///|
 /// 测试pop方法删除单个元素
 test "pop_only_element_clears_list" {
-  let map = @IndexMap.new()
+  let map = @IndexMap.new_renamed()
 
   // 添加唯一元素
   map.set("only_key", "only_value")
@@
 ///|
 /// 测试迭代中断
 test "iteration_early_termination" {
-  let map = @IndexMap.new()
+  let map = @IndexMap.new_renamed()
 
   // 添加多个元素
   map.set("key1", "value1")
@@
 ///|
 /// 测试更新已存在键的完整流程
 test "complete_key_update_process" {
-  let map = @IndexMap.new()
+  let map = @IndexMap.new_renamed()
 
   // 添加初始键值对
   map.set("key", "old_value")
@@
 ///|
 /// 测试链表结构的完整更新
 test "tail_next_pointer_complete_update" {
-  let map = @IndexMap.new()
+  let map = @IndexMap.new_renamed()
 
   // 测试空链表添加元素 (此时tail = -1)
   map.set("first", 1)
@@
 /// 测试容量为0情况下的自动扩容
 test "growth_from_zero_capacity" {
   // 创建特殊情况：容量为0的映射
-  let map : @IndexMap.T[String, Int] = @IndexMap.new(capacity=0)
+  let map : @IndexMap.T[String, Int] = @IndexMap.new_renamed(capacity=0)
 
   // 验证初始容量
   @debug.assert_eq(map.capacity(), 0)
@@
 /// 测试shift函数中处理idx_to_position映射缺失的情况
 test "shift_with_missing_position_mapping" {
   // 创建一个映射，然后修改其内部状态以模拟不一致情况
-  let map = @IndexMap.new()
+  let map = @IndexMap.new_renamed()
 
   // 添加一些元素
   map.set("key1", "value1")
@@
   let key4 = TestKey::{ id: 4, value: 10 } // 与key1、key2相等
 
   // 创建映射并添加元素（以不同的顺序添加）
-  let map = @IndexMap.new()
+  let map = @IndexMap.new_renamed()
   map.set(key3, "C") // 值为20的键
   map.set(key1, "A") // 第一个值为10的键
   map.set(key4, "D") // 第三个值为10的键
@@
 ///|
 /// 测试set_with_hash函数更新已存在键的值
 test "set_with_hash_update_existing_key" {
-  let map = @IndexMap.new()
+  let map = @IndexMap.new_renamed()
 
   // 创建一个键和预计算的哈希值
   let key = "test_key"
@@
 ///|
 /// 测试set_with_hash函数更新尾节点的后继指针
 test "set_with_hash_update_tail_next" {
-  let map = @IndexMap.new()
+  let map = @IndexMap.new_renamed()
 
   // 插入第一个元素
   let key1 = "first"
@@
 /// 测试set_with_hash函数触发扩容逻辑
 test "set_with_hash_triggers_growth" {
   // 创建一个较小容量的映射以便快速触发扩容
-  let map = @IndexMap.new(capacity=4)
+  let map = @IndexMap.new_renamed(capacity=4)
 
   // 记录初始容量
   let initial_capacity = map.capacity()
@@
 /// 测试set_with_hash函数在容量为0的情况下正确扩容
 test "set_with_hash_growth_from_zero_capacity" {
   // 创建零容量的映射
-  let map = @IndexMap.new(capacity=0)
+  let map = @IndexMap.new_renamed(capacity=0)
 
   // 验证初始容量
   @debug.assert_eq(map.capacity(), 0)
*** End Patch

```
