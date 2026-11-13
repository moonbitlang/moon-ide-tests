# core-project peek-def

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' peek-def 'HashMap' --loc 'core_ide_cases.mbt:5:28'
Definition found at file <MOON_HOME>/lib/core/hashmap/types.mbt
   | ///   @test.assert_eq(map.get(3), Some("three"))
   | ///   map.set(3, "updated")
   | ///   @test.assert_eq(map.get(3), Some("updated"))
   | /// }
   | /// ```
44 | struct HashMap[K, V] {
   |        ^^^^^^^
   |   mut entries : FixedArray[Entry[K, V]?]
   |   mut capacity : Int32
   |   mut capacity_mask : Int32 // capacity_mask = capacity - 1, used to find idx
   |   // size of field `entries`, it is redundant but useful for performance
   |   // so we don't need do `self.entries.length()` every time
   |   mut size : Int32 // active key-value pairs count
   |   // mut grow_at : Int // threshold that triggers grow
   | }
   | 
   | ///|
   | pub impl[K : Hash + Eq, V : Eq] Eq for HashMap[K, V] with fn equal(
   |   self : HashMap[K, V],
   |   that : HashMap[K, V],
   | ) -> Bool {
```

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' peek-def 'List' --loc 'core_ide_cases.mbt:8:26'
Definition found at file <MOON_HOME>/lib/core/list/types.mbt
   | // limitations under the License.
   | 
   | ///|
   | /// Type `List` used by this package APIs.
   | #unsafe_cycle_free
18 | pub enum List[A] {
   |          ^^^^
   |   Empty
   |   More(A, mut tail~ : List[A])
   | }
```

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' peek-def 'map' --loc 'core_ide_cases.mbt:12:22'
Definition found at file <MOON_HOME>/lib/core/builtin/array.mbt
     | ///   let v2 = v.map(x => x + 1)
     | ///   @test.assert_eq(v2, [4, 5, 6])
     | /// }
     | /// ```
     | #locals(f)
1466 | pub fn[T, U] Array::map(
     |                     ^^^
     |   self : Array[T],
     |   f : (T) -> U raise?,
     | ) -> Array[U] raise? {
     |   let arr = Array::unsafe_make_uninit(self.length())
     |   for i, v in self {
     |     arr.unsafe_set(i, f(v))
     |   }
     |   arr
     | }
     | 
     | ///|
     | /// Maps a function over the elements of the array in place.
     | ///
     | /// # Example
```

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' peek-def 'filter' --loc 'core_ide_cases.mbt:13:23'
Definition found at file <MOON_HOME>/lib/core/builtin/array.mbt
     | ///   let evens = arr.filter(x => x % 2 == 0)
     | ///   debug_inspect(evens, content="[2, 4]")
     | /// }
     | /// ```
     | #locals(f)
1570 | pub fn[T] Array::filter(
     |                  ^^^^^^
     |   self : Array[T],
     |   f : (T) -> Bool raise?,
     | ) -> Array[T] raise? {
     |   [
     |     for v in self if f(v) => v
     |   ]
     | }
     | 
     | ///|
     | /// Tests whether the array contains no elements.
     | ///
     | /// Parameters:
     | ///
     | /// * `array` : The array to check.
```

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' peek-def 'fold' --loc 'core_ide_cases.mbt:14:9'
Definition found at file <MOON_HOME>/lib/core/builtin/array.mbt
     | ///   @test.assert_eq(sum, 15)
     | /// }
     | /// ```
     | #locals(f)
     | #alias(fold_left, deprecated)
2215 | pub fn[A, B] Array::fold(
     |                     ^^^^
     |   self : Array[A],
     |   init~ : B,
     |   f : (B, A) -> B raise?,
     | ) -> B raise? {
     |   for item in self; acc = init {
     |     continue f(acc, item)
     |   } nobreak {
     |     acc
     |   }
     | }
     | 
     | ///|
     | /// Fold out values from an array according to certain rules in reversed turn.
     | ///
```

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' peek-def 'StringBuilder' --loc 'core_ide_cases.mbt:19:17'
Definition found at file <MOON_HOME>/lib/core/prelude/prelude.mbt
   |   type Iter2,
   |   type Map,
   |   type InspectError,
   |   type SnapshotError,
   |   type SourceLoc,
69 |   type StringBuilder,
   |        ^^^^^^^^^^^^^
   | }
   | 
   | ///|
   | pub using @builtin {
   |   type Unit,
   |   type Bool,
   |   type Byte,
   |   type Char,
   |   type Int,
   |   type Int32,
   |   type Int64,
   |   type UInt,
   |   type UInt32,
   |   type UInt16,
Definition found at file <MOON_HOME>/lib/core/builtin/stringbuilder_buffer.mbt
   | // WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   | // See the License for the specific language governing permissions and
   | // limitations under the License.
   | 
   | ///|
16 | struct StringBuilder {
   |        ^^^^^^^^^^^^^
   |   // Only 0..<len is initialized. Returned strings have separate storage.
   |   mut data : UninitializedArray[UInt16]
   |   mut len : Int32
   | }
   | 
   | ///|
   | /// Creates a new string builder with an optional initial capacity hint.
   | ///
   | /// Parameters:
   | ///
   | /// * `size_hint` : An optional initial capacity hint for the internal buffer,
   | /// in UTF-16 code units. Defaults to 8. Use 0 to request an empty initial
   | /// buffer. `size_hint` may be ignored on some platforms, JS for example.
   | ///
```

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' peek-def 'write_string' --loc 'core_ide_cases.mbt:20:11'
Definition found at file <MOON_HOME>/lib/core/builtin/extends.mbt
    | pub extend String with ToStringView::{to_string_view}
    | 
    | ///|
    | pub extend StringBuilder with Logger::{
    |   write_char,
456 |   write_string,
    |   ^^^^^^^^^^^^
    |   write_substring,
    |   write_view,
    | }
    | 
    | ///|
    | pub extend StringView with Add::{add}
    | 
    | ///|
    | pub extend StringView with Compare::{compare}
    | 
    | ///|
    | pub extend StringView with Eq::{equal}
    | 
    | ///|
Definition found at file <MOON_HOME>/lib/core/builtin/stringbuilder_buffer.mbt
    |   buffer : UninitializedArray[UInt16],
    | ) -> FixedArray[UInt16] = "%identity"
    | 
    | ///|
    | /// Writes a string to the StringBuilder.
167 | pub impl Logger for StringBuilder with fn write_string(self, str) {
    |                                           ^^^^^^^^^^^^
    |   let str_len = str.length()
    |   if str_len == 0 {
    |     return
    |   }
    |   let required = self.len + str_len
    |   if required > self.data.length() || required < self.len {
    |     self.grow(required)
    |   }
    |   self.data.unsafe_blit_from_string_uninit(self.len, str, 0, str_len)
    |   self.len += str_len
    | }
    | 
    | ///|
    | /// Writes a character to the StringBuilder.
```

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' peek-def 'length' --loc 'core_ide_cases.mbt:21:9'
Definition found at file <MOON_HOME>/lib/core/builtin/intrinsics.mbt
     | ///   inspect("🤣".length(), content="2") // Emoji uses two UTF-16 code units
     | ///   inspect("".length(), content="0") // Empty string
     | /// }
     | /// ```
     | #alias(charcode_length, deprecated)
1833 | pub fn String::length(self : String) -> Int32 = "%string_length"
     |                ^^^^^^
     | 
     | ///|
     | /// Returns the UTF-16 code unit at the given index.
     | /// 
     | /// This method has O(1) complexity.
     | /// Panics if the index is out of bounds.
     | #alias("_[_]")
     | #alias(code_unit_at)
     | pub fn String::at(self : String, idx : Int32) -> UInt16 = "%string_get"
     | 
     | ///|
     | /// Get string UTF-16 code unit without bounds checks.
     | /// Unsafe variant of `get`.
     | #internal(unsafe, "Undefined behavior if index is out of bounds.")
```

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' peek-def 'split' --loc 'core_ide_cases.mbt:21:24'
Definition found at file <MOON_HOME>/lib/core/builtin/string_methods.mbt
     | /// the returned iterator will contain only one element, which is the original
     | /// string.
     | /// 
     | /// If the separator is empty, the returned iterator will contain all the
     | /// characters in the string as single elements.
1737 | pub fn String::split(self : String, sep : StringView) -> Iter[StringView] {
     |                ^^^^^
     |   self[:].split(sep)
     | }
     | 
     | ///|
     | /// Splits the string into a pair at the first occurrence of the separator.
     | /// 
     | /// Returns None if the separator is not found.
     | /// 
     | /// If the separator is empty, it splits at the start of the string, returning
     | /// an empty prefix and the full string as the suffix.
     | pub fn StringView::split_once(
     |   self : StringView,
     |   needle : StringView,
     | ) -> (StringView, StringView)? {
```

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' peek-def 'to_array' --loc 'core_ide_cases.mbt:21:35'
Definition found at file <MOON_HOME>/lib/core/builtin/iterator.mbt
    | 
    | ///|
    | /// Collects the elements of the iterator into an array.
    | /// The old iterator `self` must not be used again.
    | #alias(collect)
813 | pub fn[X] Iter::to_array(self : Iter[X]) -> Array[X] {
    |                 ^^^^^^^^
    |   let result = match self.size_hint {
    |     Some(n) => Array::Array(capacity=n)
    |     None => []
    |   }
    |   while self.next() is Some(x) {
    |     result.push(x)
    |   }
    |   result
    | }
    | 
    | ///|
    | /// Return this iterator itself.
    | /// Return an iterator via `iter`.
    | #alias(iterator, deprecated)
```

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' peek-def 'abs' --loc 'core_ide_cases.mbt:26:5'
Definition found at file <MOON_HOME>/lib/core/builtin/int.mbt
    | ///   inspect(Int32::abs(42), content="42")
    | ///   inspect(Int32::abs(-42), content="42")
    | ///   inspect(Int32::abs(0), content="0")
    | /// }
    | /// ```
192 | pub fn Int32::abs(self : Int32) -> Int32 {
    |               ^^^
    |   if self < 0 {
    |     -self
    |   } else {
    |     self
    |   }
    | }
```

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' peek-def 'to_string' --loc 'core_ide_cases.mbt:26:11'
Definition found at file <MOON_HOME>/lib/core/builtin/to_string.mbt
    | /// ```
    | /// inspect((255).to_string(radix=16), content="ff")
    | /// inspect((-255).to_string(radix=16), content="-ff")
    | /// ```
    | #cfg(not(target="js"))
210 | pub fn Int32::to_string(self : Int32, radix~ : Int32 = 10) -> String {
    |               ^^^^^^^^^
    |   // Validate radix
    |   if radix < 2 || radix > 36 {
    |     abort("radix must be between 2 and 36")
    |   }
    | 
    |   // Special case for zero
    |   if self == 0 {
    |     return "0"
    |   }
    | 
    |   // Handle negative numbers
    |   let is_negative = self < 0
    |   let num : UInt32 = if is_negative {
    |     // Negate and reinterpret as UInt
```

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' peek-def 'map' --loc 'core_ide_cases.mbt:31:9'
Definition found at file <MOON_HOME>/lib/core/builtin/option.mbt
    | ///   @test.assert_eq(a.map(x => x * 2), Some(10))
    | ///   let b = None
    | ///   @test.assert_eq(b.map(x => x * 2), None)
    | /// }
    | /// ```
128 | pub fn[T, U] Option::map(self : T?, f : (T) -> U raise?) -> U? raise? {
    |                      ^^^
    |   match self {
    |     Some(t) => Some(f(t))
    |     None => None
    |   }
    | }
    | 
    | ///|
    | /// Returns the provided default result (if none), or applies a function to the contained value (if any).
    | /// Arguments passed to map_or are eagerly evaluated; if you are passing the result of a function call, it is recommended to use `map_or_else`, which is lazily evaluated.
    | ///
    | /// # Example
    | ///
    | /// ```mbt check
    | /// test {
```

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' peek-def 'map' --loc 'core_ide_cases.mbt:38:9'
Definition found at file <MOON_HOME>/lib/core/builtin/result.mbt
   | ///   let x : Result[Int32, Unit] = Ok(6)
   | ///   let y = x.map((v : Int32) => v * 7)
   | ///   @test.assert_eq(y, Ok(42))
   | /// }
   | /// ```
27 | pub fn[T, E, U] Result::map(
   |                         ^^^
   |   self : Result[T, E],
   |   f : (T) -> U raise?,
   | ) -> Result[U, E] raise? {
   |   match self {
   |     Ok(value) => Ok(f(value))
   |     Err(err) => Err(err)
   |   }
   | }
   | 
   | ///|
   | test "map" {
   |   let x : Result[Int32, Unit] = Ok(6)
   |   let y = x.map((v : Int32) => v * 7)
   |   let z : Result[Int32, Int32] = Err(3)
```

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' peek-def 'map' --loc 'core_ide_cases.mbt:43:15'
Definition found at file <MOON_HOME>/lib/core/builtin/iterator.mbt
    | ///
    | /// A new iterator that contains the transformed elements.
    | ///
    | /// # Note
    | /// The old iterator `self` must not be used again after calling `map`.
358 | pub fn[X, Y] Iter::map(self : Iter[X], f : (X) -> Y) -> Iter[Y] {
    |                    ^^^
    |   {
    |     f: fn() {
    |       guard self.next() is Some(x) else { None }
    |       Some(f(x))
    |     },
    |     size_hint: self.size_hint,
    |   }
    | }
    | 
    | ///|
    | /// Transforms the elements of the iterator using a mapping function.
    | ///
    | /// # Type Parameters
    | ///
```

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' peek-def 'to_array' --loc 'core_ide_cases.mbt:43:45'
Definition found at file <MOON_HOME>/lib/core/builtin/iterator.mbt
    | 
    | ///|
    | /// Collects the elements of the iterator into an array.
    | /// The old iterator `self` must not be used again.
    | #alias(collect)
813 | pub fn[X] Iter::to_array(self : Iter[X]) -> Array[X] {
    |                 ^^^^^^^^
    |   let result = match self.size_hint {
    |     Some(n) => Array::Array(capacity=n)
    |     None => []
    |   }
    |   while self.next() is Some(x) {
    |     result.push(x)
    |   }
    |   result
    | }
    | 
    | ///|
    | /// Return this iterator itself.
    | /// Return an iterator via `iter`.
    | #alias(iterator, deprecated)
```

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' peek-def 'map' --loc 'core_ide_cases.mbt:48:6'
Definition found at file <MOON_HOME>/lib/core/list/list.mbt
    | ///     List([2, 4, 6, 8, 10]),
    | ///   )
    | /// }
    | /// ```
    | #locals(f)
236 | pub fn[A, B] List::map(self : List[A], f : (A) -> B raise?) -> List[B] raise? {
    |                    ^^^
    |   match self {
    |     Empty => Empty
    |     More(hd, tail~) => {
    |       let dest = More(f(hd), tail=Empty)
    |       for d = dest, t = tail {
    |         match (d, t) {
    |           (_, Empty) => break
    |           (More(_) as dest, More(hd, tail~)) => {
    |             dest.tail = More(f(hd), tail=Empty)
    |             continue dest.tail, tail
    |           }
    |           // unreachable
    |           (Empty, _) => panic()
    |         }
```

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' peek-def 'get' --loc 'core_ide_cases.mbt:53:10'
Definition found at file <MOON_HOME>/lib/core/hashmap/hashmap.mbt
    | ///   let map = @hashmap.from_array([("key", 42)])
    | ///   debug_inspect(map.get("key"), content="Some(42)")
    | ///   debug_inspect(map.get("nonexistent"), content="None")
    | /// }
    | /// ```
227 | pub fn[K : Hash + Eq, V] HashMap::get(self : HashMap[K, V], key : K) -> V? {
    |                                   ^^^
    |   // self.get_with_hash(key, key.hash())
    |   let hash = Hash::hash(key)
    |   // SAFETY: masked probe index; see the note at the top of this file.
    |   for i = 0, idx = hash & self.capacity_mask {
    |     guard self.entries.unsafe_get(idx) is Some(entry) else { break None }
    |     if entry.hash == hash && entry.key == key {
    |       break Some(entry.value)
    |     }
    |     if i > entry.psl {
    |       break None
    |     }
    |     continue i + 1, (idx + 1) & self.capacity_mask
    |   }
    | }
```

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' peek-def 'map' --loc 'core_ide_cases.mbt:53:22'
Definition found at file <MOON_HOME>/lib/core/builtin/option.mbt
    | ///   @test.assert_eq(a.map(x => x * 2), Some(10))
    | ///   let b = None
    | ///   @test.assert_eq(b.map(x => x * 2), None)
    | /// }
    | /// ```
128 | pub fn[T, U] Option::map(self : T?, f : (T) -> U raise?) -> U? raise? {
    |                      ^^^
    |   match self {
    |     Some(t) => Some(f(t))
    |     None => None
    |   }
    | }
    | 
    | ///|
    | /// Returns the provided default result (if none), or applies a function to the contained value (if any).
    | /// Arguments passed to map_or are eagerly evaluated; if you are passing the result of a function call, it is recommended to use `map_or_else`, which is lazily evaluated.
    | ///
    | /// # Example
    | ///
    | /// ```mbt check
    | /// test {
```

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' peek-def 'map' --loc 'core_ide_cases.mbt:60:10'
Definition found at file <MOON_HOME>/lib/core/hashmap/hashmap.mbt
    | ///|
    | /// Applies a function to each key-value pair in the map and
    | /// returns a new map with the results, using the original keys.
    | ///
    | /// `f` may raise; the error propagates and `self` is left unchanged.
867 | pub fn[K, V, V2] HashMap::map(
    |                           ^^^
    |   self : HashMap[K, V],
    |   f : (K, V) -> V2 raise?,
    | ) -> HashMap[K, V2] raise? {
    |   let other = {
    |     capacity: self.capacity,
    |     entries: FixedArray::make(self.capacity, None),
    |     size: self.size,
    |     capacity_mask: self.capacity_mask,
    |   }
    |   if self.size == 0 {
    |     return other
    |   }
    |   for i in 0..<self.capacity {
    |     if self.entries[i] is Some({ key, value, hash, psl, }) {
```

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' peek-def 'map' --loc 'core_ide_cases.mbt:65:13'
Definition found at file <WORKDIR>/types.mbt
   |   Value(T)
   | }
   | 
   | ///|
   | /// Maps a function over the container
41 | pub fn[T, U] Container::map(self : Container[T], f : (T) -> U) -> Container[U] {
   |                         ^^^
   |   match self {
   |     Empty => Empty
   |     Value(x) => Value(f(x))
   |   }
   | }
   | 
   | ///|
   | /// Checks if the container is empty
   | pub fn[T] Container::is_empty(self : Container[T]) -> Bool {
   |   match self {
   |     Empty => true
   |     Value(_) => false
   |   }
   | }
```

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' peek-def 'split' --loc 'core_ide_cases.mbt:71:4'
Definition found at file <MOON_HOME>/lib/core/builtin/string_methods.mbt
     | /// the returned iterator will contain only one element, which is the original
     | /// string.
     | /// 
     | /// If the separator is empty, the returned iterator will contain all the
     | /// characters in the string as single elements.
1737 | pub fn String::split(self : String, sep : StringView) -> Iter[StringView] {
     |                ^^^^^
     |   self[:].split(sep)
     | }
     | 
     | ///|
     | /// Splits the string into a pair at the first occurrence of the separator.
     | /// 
     | /// Returns None if the separator is not found.
     | /// 
     | /// If the separator is empty, it splits at the start of the string, returning
     | /// an empty prefix and the full string as the suffix.
     | pub fn StringView::split_once(
     |   self : StringView,
     |   needle : StringView,
     | ) -> (StringView, StringView)? {
```

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' peek-def 'filter' --loc 'core_ide_cases.mbt:73:4'
Definition found at file <MOON_HOME>/lib/core/builtin/iterator.mbt
    | ///
    | /// A new iterator that only contains the elements for which the predicate function returns `true`.
    | ///
    | /// # Note
    | /// The old iterator `self` must not be used again after calling `filter`.
327 | pub fn[X] Iter::filter(self : Iter[X], f : (X) -> Bool) -> Iter[X] {
    |                 ^^^^^^
    |   Iter::new(fn() {
    |     for x in self {
    |       if f(x) {
    |         break Some(x)
    |       }
    |     } nobreak {
    |       None
    |     }
    |   })
    | }
    | 
    | ///|
    | /// Transforms the elements of the iterator using a mapping function.
    | ///
```

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' peek-def 'from_array' --loc 'core_ide_cases.mbt:84:9'
Definition found at file <MOON_HOME>/lib/core/list/list.mbt
    | /// ```
    | #as_free_fn(deprecated="Use @list.List([...]) instead")
    | #alias(of, deprecated="Use @list.List([...]) instead")
    | #as_free_fn(of, deprecated="Use @list.List([...]) instead")
    | #deprecated("Use @list.List([...]) instead")
134 | pub fn[A] List::from_array(arr : ArrayView[A]) -> List[A] {
    |                 ^^^^^^^^^^
    |   List(arr)
    | }
    | 
    | ///|
    | /// ```mbt check
    | /// test {
    | ///   let lst = @list.List([1, 2, 3, 4, 5])
    | ///   debug_inspect(
    | ///     lst,
    | ///     content=(
    | ///       #|<List: [1, 2, 3, 4, 5]>
    | ///     ),
    | ///   )
    | /// }
Definition found at file <MOON_HOME>/lib/core/list/list.mbt
    | /// ```
    | #as_free_fn(deprecated="Use @list.List([...]) instead")
    | #alias(of, deprecated="Use @list.List([...]) instead")
    | #as_free_fn(of, deprecated="Use @list.List([...]) instead")
    | #deprecated("Use @list.List([...]) instead")
134 | pub fn[A] List::from_array(arr : ArrayView[A]) -> List[A] {
    |                 ^^^^^^^^^^
    |   List(arr)
    | }
    | 
    | ///|
    | /// ```mbt check
    | /// test {
    | ///   let lst = @list.List([1, 2, 3, 4, 5])
    | ///   debug_inspect(
    | ///     lst,
    | ///     content=(
    | ///       #|<List: [1, 2, 3, 4, 5]>
    | ///     ),
    | ///   )
    | /// }
```
