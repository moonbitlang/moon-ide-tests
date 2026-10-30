# indexmap find-references T src/extends.mbt:2:12

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
$ run_moon_ide moon ide find-references 'T' --loc 'src/extends.mbt:2:12'
Found 121 references for symbol 'T':
<WORKDIR>/src/IndexMap.mbt:27:64-27:65:
   | /// let map : @IndexMap.T[String, Int] = @IndexMap.new(capacity=16)
   | /// inspect(map.capacity(), content="16")
   | /// inspect(map.is_empty(), content="true")
27 | pub fn[K, V] new(capacity~ : Int32 = Default_init_capacity) -> T[K, V] {
   |                                                                ^
   |   {
   |     core: {

<WORKDIR>/src/IndexMap.mbt:65:61-65:62:
   | 
   | ///|
   | /// Create a map from an array of key-value pairs
65 | pub fn[K : Hash + Eq, V] from_array(arr : Array[(K, V)]) -> T[K, V] {
   |                                                             ^
   |   let map = new(capacity=arr.length())
   |   for i in 0..<arr.length() {

<WORKDIR>/src/IndexMap.mbt:98:26-98:27:
   | ///|
   | /// Sets a key-value pair into the map. If the key already exists, updates its value.
   | #alias("_[_]=_")
98 | pub fn[K : Hash + Eq, V] T::set(self : T[K, V], key : K, value : V) -> Unit {
   |                          ^
   |   // 计算哈希值
   |   let hash = Hash::hash(key)

<WORKDIR>/src/IndexMap.mbt:98:40-98:41:
   | ///|
   | /// Sets a key-value pair into the map. If the key already exists, updates its value.
   | #alias("_[_]=_")
98 | pub fn[K : Hash + Eq, V] T::set(self : T[K, V], key : K, value : V) -> Unit {
   |                                        ^
   |   // 计算哈希值
   |   let hash = Hash::hash(key)

<WORKDIR>/src/IndexMap.mbt:160:26-160:27:
    | 
    | ///|
    | /// Sets a key-value pair with a pre-computed hash
160 | pub fn[K : Hash + Eq, V] T::set_with_hash(
    |                          ^
    |   self : T[K, V],
    |   key : K,

<WORKDIR>/src/IndexMap.mbt:161:10-161:11:
    | ///|
    | /// Sets a key-value pair with a pre-computed hash
    | pub fn[K : Hash + Eq, V] T::set_with_hash(
161 |   self : T[K, V],
    |          ^
    |   key : K,
    |   value : V,

<WORKDIR>/src/IndexMap.mbt:235:26-235:27:
    | /// inspect(map.get("key"), content="Some(42)")
    | /// inspect(map.get("nonexistent"), content="None")
    | #alias("_[_]")
235 | pub fn[K : Hash + Eq, V] T::get(self : T[K, V], key : K) -> V? {
    |                          ^
    |   // 直接从键到索引的映射中查找
    |   match self.key_to_idx.get(key) {

<WORKDIR>/src/IndexMap.mbt:235:40-235:41:
    | /// inspect(map.get("key"), content="Some(42)")
    | /// inspect(map.get("nonexistent"), content="None")
    | #alias("_[_]")
235 | pub fn[K : Hash + Eq, V] T::get(self : T[K, V], key : K) -> V? {
    |                                        ^
    |   // 直接从键到索引的映射中查找
    |   match self.key_to_idx.get(key) {

<WORKDIR>/src/IndexMap.mbt:245:14-245:15:
    | 
    | ///|
    | /// Gets the key-value pair at the given index position.
245 | pub fn[K, V] T::get_at(self : T[K, V], index : Int32) -> (K, V)? {
    |              ^
    |   if index < 0 || index >= self.size {
    |     return None

<WORKDIR>/src/IndexMap.mbt:245:31-245:32:
    | 
    | ///|
    | /// Gets the key-value pair at the given index position.
245 | pub fn[K, V] T::get_at(self : T[K, V], index : Int32) -> (K, V)? {
    |                               ^
    |   if index < 0 || index >= self.size {
    |     return None

<WORKDIR>/src/IndexMap.mbt:261:15-261:16:
    | }
    | 
    | ///|
261 | fn[K : Eq, V] T::get_with_hash(self : T[K, V], key : K, hash : Int32) -> V? {
    |               ^
    |   // 首先检查哈希值是否在 hash_to_idx 中
    |   match self.core.hash_to_idx.get(hash) {

<WORKDIR>/src/IndexMap.mbt:261:39-261:40:
    | }
    | 
    | ///|
261 | fn[K : Eq, V] T::get_with_hash(self : T[K, V], key : K, hash : Int32) -> V? {
    |                                       ^
    |   // 首先检查哈希值是否在 hash_to_idx 中
    |   match self.core.hash_to_idx.get(hash) {

<WORKDIR>/src/IndexMap.mbt:299:26-299:27:
    | /// let value = map.get_or_init("key", fn() { 42 })
    | /// inspect(value, content="42")
    | /// inspect(map.get("key"), content="Some(42)")
299 | pub fn[K : Hash + Eq, V] T::get_or_init(
    |                          ^
    |   self : T[K, V],
    |   key : K,

<WORKDIR>/src/IndexMap.mbt:300:10-300:11:
    | /// inspect(value, content="42")
    | /// inspect(map.get("key"), content="Some(42)")
    | pub fn[K : Hash + Eq, V] T::get_or_init(
300 |   self : T[K, V],
    |          ^
    |   key : K,
    |   init : () -> V,

<WORKDIR>/src/IndexMap.mbt:333:26-333:27:
    | /// let map = @IndexMap.of([("a", 1), ("b", 2)])
    | /// inspect(map.get_or_default("a", 0), content="1")
    | /// inspect(map.get_or_default("c", 0), content="0")
333 | pub fn[K : Hash + Eq, V] T::get_or_default(
    |                          ^
    |   self : T[K, V],
    |   key : K,

<WORKDIR>/src/IndexMap.mbt:334:10-334:11:
    | /// inspect(map.get_or_default("a", 0), content="1")
    | /// inspect(map.get_or_default("c", 0), content="0")
    | pub fn[K : Hash + Eq, V] T::get_or_default(
334 |   self : T[K, V],
    |          ^
    |   key : K,
    |   default : V,

<WORKDIR>/src/IndexMap.mbt:359:26-359:27:
    | /// let map = @IndexMap.of([("a", 1), ("b", 2)])
    | /// inspect(map.contains("a"), content="true")
    | /// inspect(map.contains("c"), content="false")
359 | pub fn[K : Hash + Eq, V] T::contains(self : T[K, V], key : K) -> Bool {
    |                          ^
    |   match self.get(key) {
    |     Some(_) => true

<WORKDIR>/src/IndexMap.mbt:359:45-359:46:
    | /// let map = @IndexMap.of([("a", 1), ("b", 2)])
    | /// inspect(map.contains("a"), content="true")
    | /// inspect(map.contains("c"), content="false")
359 | pub fn[K : Hash + Eq, V] T::contains(self : T[K, V], key : K) -> Bool {
    |                                             ^
    |   match self.get(key) {
    |     Some(_) => true

<WORKDIR>/src/IndexMap.mbt:386:26-386:27:
    | 
    | ///|
    | /// Removes a key from the map.
386 | pub fn[K : Hash + Eq, V] T::remove(self : T[K, V], key : K) -> Unit {
    |                          ^
    |   if self.size == 0 {
    |     return

<WORKDIR>/src/IndexMap.mbt:386:43-386:44:
    | 
    | ///|
    | /// Removes a key from the map.
386 | pub fn[K : Hash + Eq, V] T::remove(self : T[K, V], key : K) -> Unit {
    |                                           ^
    |   if self.size == 0 {
    |     return

<WORKDIR>/src/IndexMap.mbt:471:58-471:59:
    | /// inspect(map.get(1), content="Some(\"one\")")
    | /// inspect(map.get(2), content="Some(\"two\")")
    | /// Create a map from a fixed array of key-value pairs
471 | pub fn[K : Hash + Eq, V] of(arr : FixedArray[(K, V)]) -> T[K, V] {
    |                                                          ^
    |   let map = new(capacity=arr.length())
    |   for i in 0..<arr.length() {

<WORKDIR>/src/IndexMap.mbt:503:102-503:103:
    | ///
    | /// let samples : Array[@IndexMap.T[Int, String]] = @quickcheck.samples(5)
    | /// inspect(samples.length(), content="5")
503 | pub impl[K : @quickcheck.Arbitrary + Hash + Eq, V : @quickcheck.Arbitrary] @quickcheck.Arbitrary for T[
    |                                                                                                      ^
    |   K,
    |   V,

<WORKDIR>/src/IndexMap.mbt:581:11-581:12:
    | 
    | ///|
    | test "set" {
581 |   let m : T[MyString, Int32] = new()
    |           ^
    |   m.set("a", 1)
    |   m.set("b", 1)

<WORKDIR>/src/IndexMap.mbt:598:11-598:12:
    | 
    | ///|
    | test "remove" {
598 |   let m : T[MyString, Int32] = new()
    |           ^
    |   m.set("a", 1)
    |   m.set("ab", 2)

<WORKDIR>/src/IndexMap.mbt:615:11-615:12:
    | 
    | ///|
    | test "remove_unexist_key" {
615 |   let m : T[MyString, Int32] = new()
    |           ^
    |   m.set("a", 1)
    |   m.set("ab", 2)

<WORKDIR>/src/IndexMap.mbt:626:11-626:12:
    | 
    | ///|
    | test "clear" {
626 |   let m : T[MyString, Int32] = of([("a", 1), ("b", 2), ("c", 3)])
    |           ^
    |   println(m.capacity())
    |   let old_capacity = m.capacity()

<WORKDIR>/src/IndexMap.mbt:649:11-649:12:
    | 
    | ///|
    | test "grow" {
649 |   let m : T[MyString, Int32] = new()
    |           ^
    |   m.set("C", 1)
    |   m.set("Go", 2)

<WORKDIR>/src/IndexMap.mbt:668:14-668:15:
    | 
    | ///|
    | /// Returns the number of key-value pairs in the map.
668 | pub fn[K, V] T::size(self : T[K, V]) -> Int32 {
    |              ^
    |   self.size
    | }

<WORKDIR>/src/IndexMap.mbt:668:29-668:30:
    | 
    | ///|
    | /// Returns the number of key-value pairs in the map.
668 | pub fn[K, V] T::size(self : T[K, V]) -> Int32 {
    |                             ^
    |   self.size
    | }

<WORKDIR>/src/IndexMap.mbt:673:14-673:15:
    | }
    | 
    | ///|
673 | pub fn[K, V] T::capacity(self : T[K, V]) -> Int32 {
    |              ^
    |   self.capacity
    | }

<WORKDIR>/src/IndexMap.mbt:673:33-673:34:
    | }
    | 
    | ///|
673 | pub fn[K, V] T::capacity(self : T[K, V]) -> Int32 {
    |                                 ^
    |   self.capacity
    | }

<WORKDIR>/src/IndexMap.mbt:679:14-679:15:
    | 
    | ///|
    | /// Check if the map is empty.
679 | pub fn[K, V] T::is_empty(self : T[K, V]) -> Bool {
    |              ^
    |   self.size == 0
    | }

<WORKDIR>/src/IndexMap.mbt:679:33-679:34:
    | 
    | ///|
    | /// Check if the map is empty.
679 | pub fn[K, V] T::is_empty(self : T[K, V]) -> Bool {
    |                                 ^
    |   self.size == 0
    | }

<WORKDIR>/src/IndexMap.mbt:685:26-685:27:
    | 
    | ///|
    | /// Check if the map contains a key.
685 | pub fn[K : Hash + Eq, V] T::contains_key(self : T[K, V], key : K) -> Bool {
    |                          ^
    |   self.key_to_idx.contains(key)
    | }

<WORKDIR>/src/IndexMap.mbt:685:49-685:50:
    | 
    | ///|
    | /// Check if the map contains a key.
685 | pub fn[K : Hash + Eq, V] T::contains_key(self : T[K, V], key : K) -> Bool {
    |                                                 ^
    |   self.key_to_idx.contains(key)
    | }

<WORKDIR>/src/IndexMap.mbt:691:14-691:15:
    | 
    | ///|
    | /// Clears the map, removing all key-value pairs.
691 | pub fn[K, V] T::clear(self : T[K, V]) -> Unit {
    |              ^
    |   self.core.hash_to_idx.clear()
    |   self.core.entries = []

<WORKDIR>/src/IndexMap.mbt:691:30-691:31:
    | 
    | ///|
    | /// Clears the map, removing all key-value pairs.
691 | pub fn[K, V] T::clear(self : T[K, V]) -> Unit {
    |                              ^
    |   self.core.hash_to_idx.clear()
    |   self.core.entries = []

<WORKDIR>/src/IndexMap.mbt:707:14-707:15:
    | 
    | ///|
    | /// Convert the map to an array of key-value pairs
707 | pub fn[K, V] T::to_array(self : T[K, V]) -> Array[(K, V)] {
    |              ^
    |   if self.size == 0 {
    |     return []

<WORKDIR>/src/IndexMap.mbt:707:33-707:34:
    | 
    | ///|
    | /// Convert the map to an array of key-value pairs
707 | pub fn[K, V] T::to_array(self : T[K, V]) -> Array[(K, V)] {
    |                                 ^
    |   if self.size == 0 {
    |     return []

<WORKDIR>/src/IndexMap.mbt:727:22-727:23:
    | 
    | ///|
    | /// Grow the map capacity
727 | fn[K : Hash + Eq, V] T::grow(self : T[K, V]) -> Unit {
    |                      ^
    |   // 保存旧数据
    |   let old_entries = self.core.entries

<WORKDIR>/src/IndexMap.mbt:727:37-727:38:
    | 
    | ///|
    | /// Grow the map capacity
727 | fn[K : Hash + Eq, V] T::grow(self : T[K, V]) -> Unit {
    |                                     ^
    |   // 保存旧数据
    |   let old_entries = self.core.entries

<WORKDIR>/src/IndexMap.mbt:758:24-758:25:
    | }
    | 
    | ///|
758 | fn[K : Show, V : Show] T::debug_entries(self : T[K, V]) -> String {
    |                        ^
    |   let mut s = ""
    |   let mut current = self.core.head

<WORKDIR>/src/IndexMap.mbt:758:48-758:49:
    | }
    | 
    | ///|
758 | fn[K : Show, V : Show] T::debug_entries(self : T[K, V]) -> String {
    |                                                ^
    |   let mut s = ""
    |   let mut current = self.core.head

<WORKDIR>/src/IndexMap.mbt:791:14-791:15:
    | /// inspect(pairs.length(), content="2")
    | /// inspect(pairs[0], content="(1, \"one\")")
    | /// inspect(pairs[1], content="(2, \"two\")")
791 | pub fn[K, V] T::iter(self : T[K, V]) -> Iter[(K, V)] {
    |              ^
    |   let mut current = self.core.head
    |   Iter::new(fn() {

<WORKDIR>/src/IndexMap.mbt:791:29-791:30:
    | /// inspect(pairs.length(), content="2")
    | /// inspect(pairs[0], content="(1, \"one\")")
    | /// inspect(pairs[1], content="(2, \"two\")")
791 | pub fn[K, V] T::iter(self : T[K, V]) -> Iter[(K, V)] {
    |                             ^
    |   let mut current = self.core.head
    |   Iter::new(fn() {

<WORKDIR>/src/IndexMap.mbt:821:14-821:15:
    | /// let mut sum = 0
    | /// map.iter2().each(fn(k, _) { sum = sum + k })
    | /// inspect(sum, content="3")
821 | pub fn[K, V] T::iter2(self : T[K, V]) -> Iter2[K, V] {
    |              ^
    |   let mut current = self.core.head
    |   Iter2::new(fn() {

<WORKDIR>/src/IndexMap.mbt:821:30-821:31:
    | /// let mut sum = 0
    | /// map.iter2().each(fn(k, _) { sum = sum + k })
    | /// inspect(sum, content="3")
821 | pub fn[K, V] T::iter2(self : T[K, V]) -> Iter2[K, V] {
    |                              ^
    |   let mut current = self.core.head
    |   Iter2::new(fn() {

<WORKDIR>/src/IndexMap.mbt:861:60-861:61:
    | /// let map = @IndexMap.from_iter(iter)
    | /// inspect(map.get(1), content="Some(\"one\")")
    | /// inspect(map.get(2), content="Some(\"two\")")
861 | pub fn[K : Hash + Eq, V] from_iter(iter : Iter[(K, V)]) -> T[K, V] {
    |                                                            ^
    |   let m = new()
    |   iter.each(fn(e) { m.set(e.0, e.1) })

<WORKDIR>/src/IndexMap.mbt:886:26-886:27:
    | /// inspect(map.get(2), content="Some(\"two\")")
    | ///
    | #deprecated("use `@IndexMap.from_iter` instead")
886 | pub fn[K : Hash + Eq, V] T::from_iter(iter : Iter[(K, V)]) -> T[K, V] {
    |                          ^
    |   from_iter(iter)
    | }

<WORKDIR>/src/IndexMap.mbt:886:63-886:64:
    | /// inspect(map.get(2), content="Some(\"two\")")
    | ///
    | #deprecated("use `@IndexMap.from_iter` instead")
886 | pub fn[K : Hash + Eq, V] T::from_iter(iter : Iter[(K, V)]) -> T[K, V] {
    |                                                               ^
    |   from_iter(iter)
    | }

<WORKDIR>/src/IndexMap.mbt:906:14-906:15:
    | /// let mut result = ""
    | /// map.each(fn(k, v) { result = result + "\{k}:\{v}," })
    | /// inspect(result, content="1:one,2:two,")
906 | pub fn[K, V] T::each(self : T[K, V], f : (K, V) -> Unit) -> Unit {
    |              ^
    |   let mut current = self.core.head
    |   while current != -1 {

<WORKDIR>/src/IndexMap.mbt:906:29-906:30:
    | /// let mut result = ""
    | /// map.each(fn(k, v) { result = result + "\{k}:\{v}," })
    | /// inspect(result, content="1:one,2:two,")
906 | pub fn[K, V] T::each(self : T[K, V], f : (K, V) -> Unit) -> Unit {
    |                             ^
    |   let mut current = self.core.head
    |   while current != -1 {

<WORKDIR>/src/IndexMap.mbt:935:14-935:15:
    | /// map.eachi(fn(i, k, _) { if k == "b" { result = i } })
    | /// // "b" is at index 1
    | /// inspect(result, content="1")
935 | pub fn[K, V] T::eachi(self : T[K, V], f : (Int32, K, V) -> Unit) -> Unit {
    |              ^
    |   let mut current = self.core.head
    |   let mut idx = 0

<WORKDIR>/src/IndexMap.mbt:935:30-935:31:
    | /// map.eachi(fn(i, k, _) { if k == "b" { result = i } })
    | /// // "b" is at index 1
    | /// inspect(result, content="1")
935 | pub fn[K, V] T::eachi(self : T[K, V], f : (Int32, K, V) -> Unit) -> Unit {
    |                              ^
    |   let mut current = self.core.head
    |   let mut idx = 0

<WORKDIR>/src/IndexMap.mbt:960:39-960:40:
    | /// inspect(map, content=
    | /// #|IndexMap::of([(1, "one"), (2, "two")])
    | /// )
960 | pub impl[K : Show, V : Show] Show for T[K, V] with fn output(self, logger) {
    |                                       ^
    |   logger.write_string("IndexMap::of([")
    |   self.eachi(fn(i, k, v) {

<WORKDIR>/src/IndexMap.mbt:993:26-993:27:
    | /// inspect(map.index_of("a"), content="Some(0)")
    | /// inspect(map.index_of("b"), content="Some(1)")
    | /// inspect(map.index_of("d"), content="None")
993 | pub fn[K : Hash + Eq, V] T::index_of(self : T[K, V], key : K) -> Int32? {
    |                          ^
    |   // 先检查键是否存在
    |   match self.key_to_idx.get(key) {

<WORKDIR>/src/IndexMap.mbt:993:45-993:46:
    | /// inspect(map.index_of("a"), content="Some(0)")
    | /// inspect(map.index_of("b"), content="Some(1)")
    | /// inspect(map.index_of("d"), content="None")
993 | pub fn[K : Hash + Eq, V] T::index_of(self : T[K, V], key : K) -> Int32? {
    |                                             ^
    |   // 先检查键是否存在
    |   match self.key_to_idx.get(key) {

<WORKDIR>/src/IndexMap.mbt:1017:14-1017:15:
     | ///
     | /// let map = @IndexMap.of([("a", 1), ("b", 2)])
     | /// inspect(map.first(), content="Some((\"a\", 1))")
1017 | pub fn[K, V] T::first(self : T[K, V]) -> (K, V)? {
     |              ^
     |   if self.size == 0 || self.core.head == -1 {
     |     return None

<WORKDIR>/src/IndexMap.mbt:1017:30-1017:31:
     | ///
     | /// let map = @IndexMap.of([("a", 1), ("b", 2)])
     | /// inspect(map.first(), content="Some((\"a\", 1))")
1017 | pub fn[K, V] T::first(self : T[K, V]) -> (K, V)? {
     |                              ^
     |   if self.size == 0 || self.core.head == -1 {
     |     return None

<WORKDIR>/src/IndexMap.mbt:1039:14-1039:15:
     | ///
     | /// let map = @IndexMap.of([("a", 1), ("b", 2)])
     | /// inspect(map.last(), content="Some((\"b\", 2))")
1039 | pub fn[K, V] T::last(self : T[K, V]) -> (K, V)? {
     |              ^
     |   if self.size == 0 || self.core.tail == -1 {
     |     return None

<WORKDIR>/src/IndexMap.mbt:1039:29-1039:30:
     | ///
     | /// let map = @IndexMap.of([("a", 1), ("b", 2)])
     | /// inspect(map.last(), content="Some((\"b\", 2))")
1039 | pub fn[K, V] T::last(self : T[K, V]) -> (K, V)? {
     |                             ^
     |   if self.size == 0 || self.core.tail == -1 {
     |     return None

<WORKDIR>/src/IndexMap.mbt:1060:14-1060:15:
     | ///
     | /// let map = @IndexMap.of([('a', 1), ('b', 2), ('c', 3)])
     | /// inspect(map.keys(), content=['a', 'b', 'c'])
1060 | pub fn[K, V] T::keys(self : T[K, V]) -> Array[K] {
     |              ^
     |   if self.size == 0 {
     |     return []

<WORKDIR>/src/IndexMap.mbt:1060:29-1060:30:
     | ///
     | /// let map = @IndexMap.of([('a', 1), ('b', 2), ('c', 3)])
     | /// inspect(map.keys(), content=['a', 'b', 'c'])
1060 | pub fn[K, V] T::keys(self : T[K, V]) -> Array[K] {
     |                             ^
     |   if self.size == 0 {
     |     return []

<WORKDIR>/src/IndexMap.mbt:1086:14-1086:15:
     | ///
     | /// let map = @IndexMap.of([('a', 1), ('b', 2), ('c', 3)])
     | /// inspect(map.values(), content=[1, 2, 3])
1086 | pub fn[K, V] T::values(self : T[K, V]) -> Array[V] {
     |              ^
     |   if self.size == 0 {
     |     return []

<WORKDIR>/src/IndexMap.mbt:1086:31-1086:32:
     | ///
     | /// let map = @IndexMap.of([('a', 1), ('b', 2), ('c', 3)])
     | /// inspect(map.values(), content=[1, 2, 3])
1086 | pub fn[K, V] T::values(self : T[K, V]) -> Array[V] {
     |                               ^
     |   if self.size == 0 {
     |     return []

<WORKDIR>/src/IndexMap.mbt:1112:30-1112:31:
     | ///
     | /// let map = @IndexMap.of([(1, 10), (2, 20), (3, 30)])
     | /// inspect(map.to_json_string(), content="{\"1\":10,\"2\":20,\"3\":30}")
1112 | pub fn[K : Show, V : ToJson] T::to_json_string(self : T[K, V]) -> String {
     |                              ^
     |   // 直接构建JSON字符串
     |   let mut result = "{"

<WORKDIR>/src/IndexMap.mbt:1112:55-1112:56:
     | ///
     | /// let map = @IndexMap.of([(1, 10), (2, 20), (3, 30)])
     | /// inspect(map.to_json_string(), content="{\"1\":10,\"2\":20,\"3\":30}")
1112 | pub fn[K : Show, V : ToJson] T::to_json_string(self : T[K, V]) -> String {
     |                                                       ^
     |   // 直接构建JSON字符串
     |   let mut result = "{"

<WORKDIR>/src/IndexMap.mbt:1136:43-1136:44:
     | 
     | ///|
     | /// Standard ToJson implementation (may not preserve order)
1136 | pub impl[K : Show, V : ToJson] ToJson for T[K, V] with fn to_json(self) {
     |                                           ^
     |   // 使用普通Map
     |   let object = Map([], capacity=self.size)

<WORKDIR>/src/IndexMap.mbt:1166:26-1166:27:
     | /// inspect(map.pop(), content="Some((\"c\", 3))")
     | /// inspect(map.size(), content="2")
     | /// inspect(map.get("c"), content="None")
1166 | pub fn[K : Hash + Eq, V] T::pop(self : T[K, V]) -> (K, V)? {
     |                          ^
     |   if self.size == 0 || self.core.tail == -1 {
     |     return None

<WORKDIR>/src/IndexMap.mbt:1166:40-1166:41:
     | /// inspect(map.pop(), content="Some((\"c\", 3))")
     | /// inspect(map.size(), content="2")
     | /// inspect(map.get("c"), content="None")
1166 | pub fn[K : Hash + Eq, V] T::pop(self : T[K, V]) -> (K, V)? {
     |                                        ^
     |   if self.size == 0 || self.core.tail == -1 {
     |     return None

<WORKDIR>/src/IndexMap.mbt:1220:26-1220:27:
     | /// inspect(map.shift(), content="Some((\"a\", 1))")
     | /// inspect(map.size(), content="2")
     | /// inspect(map.get("a"), content="None")
1220 | pub fn[K : Hash + Eq, V] T::shift(self : T[K, V]) -> (K, V)? {
     |                          ^
     |   if self.size == 0 || self.core.head == -1 {
     |     return None

<WORKDIR>/src/IndexMap.mbt:1220:42-1220:43:
     | /// inspect(map.shift(), content="Some((\"a\", 1))")
     | /// inspect(map.size(), content="2")
     | /// inspect(map.get("a"), content="None")
1220 | pub fn[K : Hash + Eq, V] T::shift(self : T[K, V]) -> (K, V)? {
     |                                          ^
     |   if self.size == 0 || self.core.head == -1 {
     |     return None

<WORKDIR>/src/IndexMap.mbt:1286:14-1286:15:
     | /// let map = @IndexMap.of([("a", 1), ("b", 2)])
     | /// inspect(map.get_first(), content="Some((\"a\", 1))")
     | /// inspect(map.size(), content="2")  // 元素没有被移除
1286 | pub fn[K, V] T::get_first(self : T[K, V]) -> (K, V)? {
     |              ^
     |   if self.size == 0 || self.core.head == -1 {
     |     return None

<WORKDIR>/src/IndexMap.mbt:1286:34-1286:35:
     | /// let map = @IndexMap.of([("a", 1), ("b", 2)])
     | /// inspect(map.get_first(), content="Some((\"a\", 1))")
     | /// inspect(map.size(), content="2")  // 元素没有被移除
1286 | pub fn[K, V] T::get_first(self : T[K, V]) -> (K, V)? {
     |                                  ^
     |   if self.size == 0 || self.core.head == -1 {
     |     return None

<WORKDIR>/src/IndexMap.mbt:1309:14-1309:15:
     | /// let map = @IndexMap.of([("a", 1), ("b", 2)])
     | /// inspect(map.get_last(), content="Some((\"b\", 2))")
     | /// inspect(map.size(), content="2")  // 元素没有被移除
1309 | pub fn[K, V] T::get_last(self : T[K, V]) -> (K, V)? {
     |              ^
     |   if self.size == 0 || self.core.tail == -1 {
     |     return None

<WORKDIR>/src/IndexMap.mbt:1309:33-1309:34:
     | /// let map = @IndexMap.of([("a", 1), ("b", 2)])
     | /// inspect(map.get_last(), content="Some((\"b\", 2))")
     | /// inspect(map.size(), content="2")  // 元素没有被移除
1309 | pub fn[K, V] T::get_last(self : T[K, V]) -> (K, V)? {
     |                                 ^
     |   if self.size == 0 || self.core.tail == -1 {
     |     return None

<WORKDIR>/src/IndexMap.mbt:1318:14-1318:15:
     | }
     | 
     | ///|
1318 | pub fn[K, V] T::sort_by(
     |              ^
     |   self : T[K, V],
     |   compare : (K, V, K, V) -> Int32,

<WORKDIR>/src/IndexMap.mbt:1319:10-1319:11:
     | 
     | ///|
     | pub fn[K, V] T::sort_by(
1319 |   self : T[K, V],
     |          ^
     |   compare : (K, V, K, V) -> Int32,
     | ) -> Unit {

<WORKDIR>/src/IndexMap.mbt:1371:14-1371:15:
     | }
     | 
     | ///|
1371 | pub fn[K, V] T::sort_by_key(self : T[K, V], compare : (K, K) -> Int32) -> Unit {
     |              ^
     |   self.sort_by(fn(k1, _, k2, _) { compare(k1, k2) })
     | }

<WORKDIR>/src/IndexMap.mbt:1371:36-1371:37:
     | }
     | 
     | ///|
1371 | pub fn[K, V] T::sort_by_key(self : T[K, V], compare : (K, K) -> Int32) -> Unit {
     |                                    ^
     |   self.sort_by(fn(k1, _, k2, _) { compare(k1, k2) })
     | }

<WORKDIR>/src/IndexMap.mbt:1376:14-1376:15:
     | }
     | 
     | ///|
1376 | pub fn[K, V] T::sort_by_value(
     |              ^
     |   self : T[K, V],
     |   compare : (V, V) -> Int32,

<WORKDIR>/src/IndexMap.mbt:1377:10-1377:11:
     | 
     | ///|
     | pub fn[K, V] T::sort_by_value(
1377 |   self : T[K, V],
     |          ^
     |   compare : (V, V) -> Int32,
     | ) -> Unit {

<WORKDIR>/src/IndexMap.mbt:1384:24-1384:25:
     | }
     | 
     | ///|
1384 | pub fn[K : Compare, V] T::sort(self : T[K, V]) -> Unit {
     |                        ^
     |   self.sort_by_key(fn(k1, k2) {
     |     if k1 < k2 {

<WORKDIR>/src/IndexMap.mbt:1384:39-1384:40:
     | }
     | 
     | ///|
1384 | pub fn[K : Compare, V] T::sort(self : T[K, V]) -> Unit {
     |                                       ^
     |   self.sort_by_key(fn(k1, k2) {
     |     if k1 < k2 {

<WORKDIR>/src/IndexMap.mbt:1397:14-1397:15:
     | }
     | 
     | ///|
1397 | pub fn[K, V] T::reverse(self : T[K, V]) -> Unit {
     |              ^
     |   if self.size <= 1 {
     |     return // 不需要反转

<WORKDIR>/src/IndexMap.mbt:1397:32-1397:33:
     | }
     | 
     | ///|
1397 | pub fn[K, V] T::reverse(self : T[K, V]) -> Unit {
     |                                ^
     |   if self.size <= 1 {
     |     return // 不需要反转

<WORKDIR>/src/IndexMap.mbt:1435:26-1435:27:
     | }
     | 
     | ///|
1435 | pub fn[K : Hash + Eq, V] T::sorted_by(
     |                          ^
     |   self : T[K, V],
     |   compare : (K, V, K, V) -> Int32,

<WORKDIR>/src/IndexMap.mbt:1436:10-1436:11:
     | 
     | ///|
     | pub fn[K : Hash + Eq, V] T::sorted_by(
1436 |   self : T[K, V],
     |          ^
     |   compare : (K, V, K, V) -> Int32,
     | ) -> T[K, V] {

<WORKDIR>/src/IndexMap.mbt:1438:6-1438:7:
     | pub fn[K : Hash + Eq, V] T::sorted_by(
     |   self : T[K, V],
     |   compare : (K, V, K, V) -> Int32,
1438 | ) -> T[K, V] {
     |      ^
     |   // 创建新映射
     |   let result = new(capacity=self.size)

<WORKDIR>/src/IndexMap.mbt:1462:26-1462:27:
     | }
     | 
     | ///|
1462 | pub fn[K : Hash + Eq, V] T::sorted_by_key(
     |                          ^
     |   self : T[K, V],
     |   compare : (K, K) -> Int32,

<WORKDIR>/src/IndexMap.mbt:1463:10-1463:11:
     | 
     | ///|
     | pub fn[K : Hash + Eq, V] T::sorted_by_key(
1463 |   self : T[K, V],
     |          ^
     |   compare : (K, K) -> Int32,
     | ) -> T[K, V] {

<WORKDIR>/src/IndexMap.mbt:1465:6-1465:7:
     | pub fn[K : Hash + Eq, V] T::sorted_by_key(
     |   self : T[K, V],
     |   compare : (K, K) -> Int32,
1465 | ) -> T[K, V] {
     |      ^
     |   self.sorted_by(fn(k1, _, k2, _) { compare(k1, k2) })
     | }

<WORKDIR>/src/IndexMap.mbt:1470:26-1470:27:
     | }
     | 
     | ///|
1470 | pub fn[K : Hash + Eq, V] T::sorted_by_value(
     |                          ^
     |   self : T[K, V],
     |   compare : (V, V) -> Int32,

<WORKDIR>/src/IndexMap.mbt:1471:10-1471:11:
     | 
     | ///|
     | pub fn[K : Hash + Eq, V] T::sorted_by_value(
1471 |   self : T[K, V],
     |          ^
     |   compare : (V, V) -> Int32,
     | ) -> T[K, V] {

<WORKDIR>/src/IndexMap.mbt:1473:6-1473:7:
     | pub fn[K : Hash + Eq, V] T::sorted_by_value(
     |   self : T[K, V],
     |   compare : (V, V) -> Int32,
1473 | ) -> T[K, V] {
     |      ^
     |   self.sorted_by(fn(_, v1, _, v2) { compare(v1, v2) })
     | }

<WORKDIR>/src/IndexMap.mbt:1478:36-1478:37:
     | }
     | 
     | ///|
1478 | pub fn[K : Hash + Eq + Compare, V] T::sorted(self : T[K, V]) -> T[K, V] {
     |                                    ^
     |   self.sorted_by_key(fn(k1, k2) {
     |     if k1 < k2 {

<WORKDIR>/src/IndexMap.mbt:1478:53-1478:54:
     | }
     | 
     | ///|
1478 | pub fn[K : Hash + Eq + Compare, V] T::sorted(self : T[K, V]) -> T[K, V] {
     |                                                     ^
     |   self.sorted_by_key(fn(k1, k2) {
     |     if k1 < k2 {

<WORKDIR>/src/IndexMap.mbt:1478:65-1478:66:
     | }
     | 
     | ///|
1478 | pub fn[K : Hash + Eq + Compare, V] T::sorted(self : T[K, V]) -> T[K, V] {
     |                                                                 ^
     |   self.sorted_by_key(fn(k1, k2) {
     |     if k1 < k2 {

<WORKDIR>/src/IndexMap.mbt:1491:36-1491:37:
     | }
     | 
     | ///|
1491 | pub fn[K : Hash + Eq, V : Compare] T::sorted_by_values(
     |                                    ^
     |   self : T[K, V],
     | ) -> T[K, V] {

<WORKDIR>/src/IndexMap.mbt:1492:10-1492:11:
     | 
     | ///|
     | pub fn[K : Hash + Eq, V : Compare] T::sorted_by_values(
1492 |   self : T[K, V],
     |          ^
     | ) -> T[K, V] {
     |   self.sorted_by_value(fn(v1, v2) {

<WORKDIR>/src/IndexMap.mbt:1493:6-1493:7:
     | ///|
     | pub fn[K : Hash + Eq, V : Compare] T::sorted_by_values(
     |   self : T[K, V],
1493 | ) -> T[K, V] {
     |      ^
     |   self.sorted_by_value(fn(v1, v2) {
     |     if v1 < v2 {

<WORKDIR>/src/IndexMap.mbt:1506:26-1506:27:
     | }
     | 
     | ///|
1506 | pub fn[K : Hash + Eq, V] T::reversed(self : T[K, V]) -> T[K, V] {
     |                          ^
     |   // 创建新映射
     |   let result = new(capacity=self.size)

<WORKDIR>/src/IndexMap.mbt:1506:45-1506:46:
     | }
     | 
     | ///|
1506 | pub fn[K : Hash + Eq, V] T::reversed(self : T[K, V]) -> T[K, V] {
     |                                             ^
     |   // 创建新映射
     |   let result = new(capacity=self.size)

<WORKDIR>/src/IndexMap.mbt:1506:57-1506:58:
     | }
     | 
     | ///|
1506 | pub fn[K : Hash + Eq, V] T::reversed(self : T[K, V]) -> T[K, V] {
     |                                                         ^
     |   // 创建新映射
     |   let result = new(capacity=self.size)

<WORKDIR>/src/IndexMap_test.mbt:17:21-17:22:
   | 
   | ///|
   | test "new" {
17 |   let m : @IndexMap.T[Int32, Int32] = @IndexMap.new()
   |                     ^
   |   inspect(m.capacity(), content="8")
   |   @debug.assert_eq(m.size(), 0)

<WORKDIR>/src/IndexMap_test.mbt:313:23-313:24:
    | 
    | ///|
    | test "from_iter empty iter" {
313 |   let map : @IndexMap.T[Int32, Int32] = @IndexMap.from_iter(Iter::empty())
    |                       ^
    |   inspect(map, content="IndexMap::of([])")
    | }

<WORKDIR>/src/IndexMap_test.mbt:319:23-319:24:
    | 
    | ///|
    | test "@IndexMap.contains/empty" {
319 |   let map : @IndexMap.T[Int32, String] = @IndexMap.new()
    |                       ^
    |   inspect(map.contains(42), content="false")
    | }

<WORKDIR>/src/IndexMap_test.mbt:408:29-408:30:
    |   @debug.debug_inspect(map.get_at(4), content="None")
    | 
    |   // 测试空映射
408 |   let empty_map : @IndexMap.T[String, Int32] = @IndexMap.new()
    |                             ^
    |   @debug.debug_inspect(empty_map.get_at(0), content="None")
    | 

<WORKDIR>/src/IndexMap_test.mbt:508:33-508:34:
    | 
    | ///|
    | test "IndexMap arbitrary preserves unique keys and lookup values" {
508 |   let samples : Array[@IndexMap.T[Int32, Int32]] = @quickcheck.samples(100)
    |                                 ^
    |   assert_eq(samples.length(), 100)
    |   let mut nonempty = false

<WORKDIR>/src/IndexMap_test.mbt:532:23-532:24:
    | ///|
    | /// 测试键值更新功能
    | test "update_existing_key" {
532 |   let map : @IndexMap.T[String, Int32] = @IndexMap.new()
    |                       ^
    | 
    |   // 首次插入键值对

<WORKDIR>/src/IndexMap_test.mbt:547:23-547:24:
    | ///|
    | /// 测试首次插入元素更新头节点
    | test "first_element_head_update" {
547 |   let map : @IndexMap.T[String, Int32] = @IndexMap.new()
    |                       ^
    | 
    |   // 确认初始状态

<WORKDIR>/src/IndexMap_test.mbt:567:23-567:24:
    | ///|
    | /// 测试get_or_init函数
    | test "get_or_init_function" {
567 |   let map : @IndexMap.T[String, Int32] = @IndexMap.new()
    |                       ^
    | 
    |   // 记录init函数调用次数

<WORKDIR>/src/IndexMap_test.mbt:594:23-594:24:
    | ///|
    | /// 测试空映射上的remove操作
    | test "remove_on_empty_map" {
594 |   let map : @IndexMap.T[String, Int32] = @IndexMap.new()
    |                       ^
    | 
    |   // 确认映射为空

<WORKDIR>/src/IndexMap_test.mbt:610:23-610:24:
    | /// 测试触发扩容
    | test "capacity_growth" {
    |   // 创建一个较小容量的映射
610 |   let map : @IndexMap.T[Int32, String] = @IndexMap.new(capacity=4)
    |                       ^
    | 
    |   // 记录初始容量

<WORKDIR>/src/IndexMap_test.mbt:644:23-644:24:
    | ///|
    | /// 测试尾节点的后继更新
    | test "tail_next_pointer_update" {
644 |   let map : @IndexMap.T[String, Int32] = @IndexMap.new()
    |                       ^
    | 
    |   // 添加第一个元素

<WORKDIR>/src/IndexMap_test.mbt:670:23-670:24:
    | 
    | ///|
    | test "0 size" {
670 |   let map : @IndexMap.T[String, Int32] = @IndexMap.new()
    |                       ^
    |   @debug.assert_eq(map.values(), [])
    |   @debug.assert_eq(map.keys(), [])

<WORKDIR>/src/IndexMap_test.mbt:758:29-758:30:
    | /// 测试reverse函数处理size <= 1的情况
    | test "reverse_with_small_size" {
    |   // 测试空映射
758 |   let empty_map : @IndexMap.T[String, String] = @IndexMap.new()
    |                             ^
    |   let empty_keys_before = empty_map.keys()
    |   empty_map.reverse()

<WORKDIR>/src/IndexMap_test.mbt:1037:23-1037:24:
     | /// 测试容量为0情况下的自动扩容
     | test "growth_from_zero_capacity" {
     |   // 创建特殊情况：容量为0的映射
1037 |   let map : @IndexMap.T[String, Int32] = @IndexMap.new(capacity=0)
     |                       ^
     | 
     |   // 验证初始容量

<WORKDIR>/src/extends.mbt:2:12-2:13:
  | ///|
2 | pub extend T with @moonbitlang/core/quickcheck.Arbitrary::{arbitrary}
  |            ^
  | 
  | ///|

<WORKDIR>/src/extends.mbt:5:12-5:13:
  | pub extend T with @moonbitlang/core/quickcheck.Arbitrary::{arbitrary}
  | 
  | ///|
5 | pub extend T with Show::{to_string, output}
  |            ^
  | 
  | ///|

<WORKDIR>/src/extends.mbt:8:12-8:13:
  | pub extend T with Show::{to_string, output}
  | 
  | ///|
8 | pub extend T with ToJson::{to_json}
  |            ^

```
