# core-project peek-def

````mooncram
$ export MOON_HOME="${MOON_HOME:-$HOME/.moon}"
````

````mooncram
$ export TEST_REPO_ROOT="$(cd "$TESTDIR/../../../core_test/test_project" && pwd)"
````

````mooncram
$ normalize_moon_ide_output() { sed -e "s|$TEST_REPO_ROOT|<WORKDIR>|g" -e "s|$MOON_HOME|<MOON_HOME>|g"; }
````

````mooncram
$ run_moon_ide() { status_file="${TMPDIR:-/tmp}/moon-ide-status.$$"; ( cd "$TEST_REPO_ROOT" && "$@"; echo "$?" > "$status_file" ) 2>&1 | normalize_moon_ide_output; status=$(cat "$status_file"); rm -f "$status_file"; return "$status"; }
````

````mooncram
$ run_moon_ide moon ide peek-def 'HashMap' --loc 'core_ide_cases.mbt:5:28'
Definition found at file <MOON_HOME>/lib/core/hashmap/types.mbt
   | ///   map.set(3, "updated") (escaped)
   | ///   assert_eq(map.get(3), Some("updated")) (escaped)
   | /// } (escaped)
   | /// ``` (escaped)
   | #alias(T, deprecated) (escaped)
45 | struct HashMap[K, V] { (escaped)
   |        ^^^^^^^ (escaped)
   |   mut entries : FixedArray[Entry[K, V]?] (escaped)
   |   mut capacity : Int (escaped)
   |   mut capacity_mask : Int // capacity_mask = capacity - 1, used to find idx (escaped)
   |   // size of field `entries`, it is redundant but useful for performance (escaped)
   |   // so we don't need do `self.entries.length()` every time (escaped)
   |   mut size : Int // active key-value pairs count (escaped)
   |   // mut grow_at : Int // threshold that triggers grow (escaped)
   | } (escaped)
   |  (escaped)
   | ///| (escaped)
   | pub impl[K : Hash + Eq, V : Eq] Eq for HashMap[K, V] with fn equal(
   |   self : HashMap[K, V], (escaped)
   |   that : HashMap[K, V], (escaped)
   | ) -> Bool { (escaped)
````

````mooncram
$ run_moon_ide moon ide peek-def 'List' --loc 'core_ide_cases.mbt:8:26'
Definition found at file <MOON_HOME>/lib/core/list/types.mbt
   | // limitations under the License. (escaped)
   |  (escaped)
   | ///| (escaped)
   | /// Type `List` used by this package APIs. (escaped)
   | #alias(T, deprecated) (escaped)
18 | pub enum List[A] { (escaped)
   |          ^^^^ (escaped)
   |   Empty (escaped)
   |   More(A, mut tail~ : List[A]) (escaped)
   | } (escaped)
````

````mooncram
$ run_moon_ide moon ide peek-def 'map' --loc 'core_ide_cases.mbt:12:22'
Definition found at file <MOON_HOME>/lib/core/builtin/array.mbt
    | ///   let v2 = v.map(x => x + 1) (escaped)
    | ///   assert_eq(v2, [4, 5, 6]) (escaped)
    | /// } (escaped)
    | /// ``` (escaped)
    | #locals(f) (escaped)
588 | pub fn[T, U] Array::map( (escaped)
    |                     ^^^ (escaped)
    |   self : Array[T], (escaped)
    |   f : (T) -> U raise?, (escaped)
    | ) -> Array[U] raise? { (escaped)
    |   let arr = Array::make_uninit(self.length()) (escaped)
    |   for i, v in self { (escaped)
    |     arr.unsafe_set(i, f(v)) (escaped)
    |   } (escaped)
    |   arr (escaped)
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
    | /// Maps a function over the elements of the array in place. (escaped)
    | /// (escaped)
    | /// # Example (escaped)
````

````mooncram
$ run_moon_ide moon ide peek-def 'filter' --loc 'core_ide_cases.mbt:13:23'
Definition found at file <MOON_HOME>/lib/core/builtin/array.mbt
    | ///   let evens = arr.filter(x => x % 2 == 0) (escaped)
    | ///   debug_inspect(evens, content="[2, 4]") (escaped)
    | /// } (escaped)
    | /// ``` (escaped)
    | #locals(f) (escaped)
692 | pub fn[T] Array::filter( (escaped)
    |                  ^^^^^^ (escaped)
    |   self : Array[T], (escaped)
    |   f : (T) -> Bool raise?, (escaped)
    | ) -> Array[T] raise? { (escaped)
    |   let arr = [] (escaped)
    |   for v in self { (escaped)
    |     if f(v) { (escaped)
    |       arr.push(v) (escaped)
    |     } (escaped)
    |   } (escaped)
    |   arr (escaped)
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
    | /// Tests whether the array contains no elements. (escaped)
````

````mooncram
$ run_moon_ide moon ide peek-def 'fold' --loc 'core_ide_cases.mbt:14:9'
Definition found at file <MOON_HOME>/lib/core/builtin/array.mbt
     | ///   assert_eq(sum, 15) (escaped)
     | /// } (escaped)
     | /// ``` (escaped)
     | #locals(f) (escaped)
     | #alias(fold_left, deprecated) (escaped)
1289 | pub fn[A, B] Array::fold( (escaped)
     |                     ^^^^ (escaped)
     |   self : Array[A], (escaped)
     |   init~ : B, (escaped)
     |   f : (B, A) -> B raise?, (escaped)
     | ) -> B raise? { (escaped)
     |   for item in self; acc = init { (escaped)
     |     continue f(acc, item) (escaped)
     |   } nobreak { (escaped)
     |     acc (escaped)
     |   } (escaped)
     | } (escaped)
     |  (escaped)
     | ///| (escaped)
     | /// Fold out values from an array according to certain rules in reversed turn. (escaped)
     | /// (escaped)
````

````mooncram
$ run_moon_ide moon ide peek-def 'StringBuilder' --loc 'core_ide_cases.mbt:19:17'
Definition found at file <MOON_HOME>/lib/core/prelude/prelude.mbt
   |   type Json, (escaped)
   |   type Map, (escaped)
   |   type InspectError, (escaped)
   |   type SnapshotError, (escaped)
   |   type SourceLoc, (escaped)
71 |   type StringBuilder, (escaped)
   |        ^^^^^^^^^^^^^ (escaped)
   | } (escaped)
   |  (escaped)
   | ///| (escaped)
   | #deprecated("Use !expr instead") (escaped)
   | #warnings("-deprecated") (escaped)
   | pub using @builtin {not} (escaped)
   |  (escaped)
   | ///| (escaped)
   | #deprecated (escaped)
   | #warnings("-deprecated") (escaped)
   | pub using @builtin {type IterResult} (escaped)
   |  (escaped)
   | ///| (escaped)
   | pub using @debug {debug, type Repr, trait Debug, debug_inspect, repr, to_repr} (escaped)
Definition found at file <MOON_HOME>/lib/core/builtin/stringbuilder_buffer.mbt
   | // WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. (escaped)
   | // See the License for the specific language governing permissions and (escaped)
   | // limitations under the License. (escaped)
   |  (escaped)
   | ///| (escaped)
16 | struct StringBuilder { (escaped)
   |        ^^^^^^^^^^^^^ (escaped)
   |   mut data : FixedArray[UInt16] (escaped)
   |   mut len : Int (escaped)
   | } (escaped)
   |  (escaped)
   | ///| (escaped)
   | /// Creates a new string builder with an optional initial capacity hint. (escaped)
   | /// (escaped)
   | /// Parameters: (escaped)
   | /// (escaped)
   | /// * `size_hint` : An optional initial capacity hint for the internal buffer. If (escaped)
   | /// less than 1, a minimum capacity of 1 is used. Defaults to 0. It is the size of bytes,  (escaped)
   | /// not the size of characters. `size_hint` may be ignored on some platforms, JS for example. (escaped)
   | /// (escaped)
   | /// Returns a new `StringBuilder` instance with the specified initial capacity. (escaped)
````

````mooncram
$ run_moon_ide moon ide peek-def 'write_string' --loc 'core_ide_cases.mbt:20:11'
Definition found at file <MOON_HOME>/lib/core/builtin/stringbuilder_buffer.mbt
   |   } (escaped)
   | } (escaped)
   |  (escaped)
   | ///| (escaped)
   | /// Writes a string to the StringBuilder. (escaped)
82 | pub impl Logger for StringBuilder with fn write_string(self, str) {
   |                                           ^^^^^^^^^^^^
   |   let str_len = str.length() (escaped)
   |   self.grow_if_necessary(self.len + str_len) (escaped)
   |   self.data.unsafe_blit_from_string(self.len, str, 0, str_len) (escaped)
   |   self.len += str_len (escaped)
   | } (escaped)
   |  (escaped)
   | ///| (escaped)
   | /// Writes a character to the StringBuilder. (escaped)
   | pub impl Logger for StringBuilder with fn write_char(self, ch) {
   |   let code = ch.to_uint() (escaped)
   |   if code <= 0xFFFFU { (escaped)
   |     self.grow_if_necessary(self.len + 1) (escaped)
   |     self.data[self.len] = code.to_uint16() (escaped)
   |     self.len += 1 (escaped)
````

````mooncram
$ run_moon_ide moon ide peek-def 'length' --loc 'core_ide_cases.mbt:21:9'
Definition found at file <MOON_HOME>/lib/core/builtin/intrinsics.mbt
     | ///   inspect("🤣".length(), content="2") // Emoji uses two UTF-16 code units (escaped)
     | ///   inspect("".length(), content="0") // Empty string (escaped)
     | /// } (escaped)
     | /// ``` (escaped)
     | #alias(charcode_length, deprecated) (escaped)
1734 | pub fn String::length(self : String) -> Int = "%string_length" (escaped)
     |                ^^^^^^ (escaped)
     |  (escaped)
     | ///| (escaped)
     | /// Returns the UTF-16 code unit at the given index. (escaped)
     | ///  (escaped)
     | /// This method has O(1) complexity. (escaped)
     | /// Panics if the index is out of bounds. (escaped)
     | #alias("_[_]") (escaped)
     | #alias(code_unit_at) (escaped)
     | pub fn String::at(self : String, idx : Int) -> UInt16 = "%string_get" (escaped)
     |  (escaped)
     | ///| (escaped)
     | /// Get string UTF-16 code unit without bounds checks. (escaped)
     | /// Unsafe variant of `get`. (escaped)
     | #internal(unsafe, "Undefined behavior if index is out of bounds.") (escaped)
````

````mooncram
$ run_moon_ide moon ide peek-def 'split' --loc 'core_ide_cases.mbt:21:24'
Definition found at file <MOON_HOME>/lib/core/builtin/string_methods.mbt
     | /// the returned iterator will contain only one element, which is the original (escaped)
     | /// string. (escaped)
     | ///  (escaped)
     | /// If the separator is empty, the returned iterator will contain all the (escaped)
     | /// characters in the string as single elements. (escaped)
1122 | pub fn String::split(self : String, sep : StringView) -> Iter[StringView] { (escaped)
     |                ^^^^^ (escaped)
     |   self[:].split(sep) (escaped)
     | } (escaped)
     |  (escaped)
     | ///| (escaped)
     | /// Splits the string into a pair at the first occurrence of the separator. (escaped)
     | ///  (escaped)
     | /// Returns None if the separator is not found. (escaped)
     | ///  (escaped)
     | /// If the separator is empty, it splits at the start of the string, returning (escaped)
     | /// an empty prefix and the full string as the suffix. (escaped)
     | pub fn StringView::split_once( (escaped)
     |   self : StringView, (escaped)
     |   needle : StringView, (escaped)
     | ) -> (StringView, StringView)? { (escaped)
````

````mooncram
$ run_moon_ide moon ide peek-def 'to_array' --loc 'core_ide_cases.mbt:21:35'
Definition found at file <MOON_HOME>/lib/core/builtin/iterator.mbt
    |  (escaped)
    | ///| (escaped)
    | /// Collects the elements of the iterator into an array. (escaped)
    | /// The old iterator `self` must not be used again. (escaped)
    | #alias(collect) (escaped)
810 | pub fn[X] Iter::to_array(self : Iter[X]) -> Array[X] { (escaped)
    |                 ^^^^^^^^ (escaped)
    |   let result = match self.size_hint { (escaped)
    |     Some(n) => Array::new(capacity=n) (escaped)
    |     None => [] (escaped)
    |   } (escaped)
    |   while self.next() is Some(x) { (escaped)
    |     result.push(x) (escaped)
    |   } (escaped)
    |   result (escaped)
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
    | /// Return this iterator itself. (escaped)
    | /// Return an iterator via `iter`. (escaped)
    | #alias(iterator) (escaped)
````

````mooncram
$ run_moon_ide moon ide peek-def 'abs' --loc 'core_ide_cases.mbt:26:5'
Definition found at file <MOON_HOME>/lib/core/builtin/int.mbt
    | ///   inspect(Int::abs(42), content="42") (escaped)
    | ///   inspect(Int::abs(-42), content="42") (escaped)
    | ///   inspect(Int::abs(0), content="0") (escaped)
    | /// } (escaped)
    | /// ``` (escaped)
176 | pub fn Int::abs(self : Int) -> Int { (escaped)
    |             ^^^ (escaped)
    |   if self < 0 { (escaped)
    |     -self (escaped)
    |   } else { (escaped)
    |     self (escaped)
    |   } (escaped)
    | } (escaped)
````

````mooncram
$ run_moon_ide moon ide peek-def 'to_string' --loc 'core_ide_cases.mbt:26:11'
Definition found at file <MOON_HOME>/lib/core/builtin/to_string.mbt
    | /// ``` (escaped)
    | /// inspect((255).to_string(radix=16), content="ff") (escaped)
    | /// inspect((-255).to_string(radix=16), content="-ff") (escaped)
    | /// ``` (escaped)
    | #cfg(not(target="js")) (escaped)
210 | pub fn Int::to_string(self : Int, radix? : Int = 10) -> String { (escaped)
    |             ^^^^^^^^^ (escaped)
    |   // Validate radix (escaped)
    |   if radix < 2 || radix > 36 { (escaped)
    |     abort("radix must be between 2 and 36") (escaped)
    |   } (escaped)
    |  (escaped)
    |   // Special case for zero (escaped)
    |   if self == 0 { (escaped)
    |     return "0" (escaped)
    |   } (escaped)
    |  (escaped)
    |   // Handle negative numbers (escaped)
    |   let is_negative = self < 0 (escaped)
    |   let num : UInt = if is_negative { (escaped)
    |     // Negate and reinterpret as UInt (escaped)
````

````mooncram
$ run_moon_ide moon ide peek-def 'map' --loc 'core_ide_cases.mbt:31:9'
Definition found at file <MOON_HOME>/lib/core/builtin/option.mbt
    | ///   assert_eq(a.map(x => x * 2), Some(10)) (escaped)
    | ///   let b = None (escaped)
    | ///   assert_eq(b.map(x => x * 2), None) (escaped)
    | /// } (escaped)
    | /// ``` (escaped)
132 | pub fn[T, U] Option::map(self : T?, f : (T) -> U raise?) -> U? raise? { (escaped)
    |                      ^^^ (escaped)
    |   match self { (escaped)
    |     Some(t) => Some(f(t)) (escaped)
    |     None => None (escaped)
    |   } (escaped)
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
    | /// Returns the provided default result (if none), or applies a function to the contained value (if any). (escaped)
    | /// Arguments passed to map_or are eagerly evaluated; if you are passing the result of a function call, it is recommended to use `map_or_else`, which is lazily evaluated. (escaped)
    | /// (escaped)
    | /// # Example (escaped)
    | /// (escaped)
    | /// ```mbt check (escaped)
    | /// test { (escaped)
````

````mooncram
$ run_moon_ide moon ide peek-def 'map' --loc 'core_ide_cases.mbt:38:9'
Definition found at file <MOON_HOME>/lib/core/builtin/result.mbt
   | ///   let x : Result[Int, Unit] = Ok(6) (escaped)
   | ///   let y = x.map((v : Int) => v * 7) (escaped)
   | ///   assert_eq(y, Ok(42)) (escaped)
   | /// } (escaped)
   | /// ``` (escaped)
27 | pub fn[T, E, U] Result::map(self : Result[T, E], f : (T) -> U) -> Result[U, E] { (escaped)
   |                         ^^^ (escaped)
   |   match self { (escaped)
   |     Ok(value) => Ok(f(value)) (escaped)
   |     Err(err) => Err(err) (escaped)
   |   } (escaped)
   | } (escaped)
   |  (escaped)
   | ///| (escaped)
   | test "map" { (escaped)
   |   let x : Result[Int, Unit] = Ok(6) (escaped)
   |   let y = x.map((v : Int) => v * 7) (escaped)
   |   let z : Result[Int, Int] = Err(3) (escaped)
   |   let w = z.map((v : Int) => v * 7) (escaped)
   |   assert_true(y == Ok(42)) (escaped)
   |   assert_true(w == Err(3)) (escaped)
````

````mooncram
$ run_moon_ide moon ide peek-def 'map' --loc 'core_ide_cases.mbt:43:15'
Definition found at file <MOON_HOME>/lib/core/builtin/iterator.mbt
    | /// (escaped)
    | /// A new iterator that contains the transformed elements. (escaped)
    | /// (escaped)
    | /// # Note (escaped)
    | /// The old iterator `self` must not be used again after calling `map`. (escaped)
357 | pub fn[X, Y] Iter::map(self : Iter[X], f : (X) -> Y) -> Iter[Y] { (escaped)
    |                    ^^^ (escaped)
    |   { (escaped)
    |     f: fn() { (escaped)
    |       match self.next() { (escaped)
    |         Some(x) => Some(f(x)) (escaped)
    |         None => None (escaped)
    |       } (escaped)
    |     }, (escaped)
    |     size_hint: self.size_hint, (escaped)
    |   } (escaped)
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
    | /// Transforms the elements of the iterator using a mapping function. (escaped)
    | /// (escaped)
````

````mooncram
$ run_moon_ide moon ide peek-def 'to_array' --loc 'core_ide_cases.mbt:43:45'
Definition found at file <MOON_HOME>/lib/core/builtin/iterator.mbt
    |  (escaped)
    | ///| (escaped)
    | /// Collects the elements of the iterator into an array. (escaped)
    | /// The old iterator `self` must not be used again. (escaped)
    | #alias(collect) (escaped)
810 | pub fn[X] Iter::to_array(self : Iter[X]) -> Array[X] { (escaped)
    |                 ^^^^^^^^ (escaped)
    |   let result = match self.size_hint { (escaped)
    |     Some(n) => Array::new(capacity=n) (escaped)
    |     None => [] (escaped)
    |   } (escaped)
    |   while self.next() is Some(x) { (escaped)
    |     result.push(x) (escaped)
    |   } (escaped)
    |   result (escaped)
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
    | /// Return this iterator itself. (escaped)
    | /// Return an iterator via `iter`. (escaped)
    | #alias(iterator) (escaped)
````

````mooncram
$ run_moon_ide moon ide peek-def 'map' --loc 'core_ide_cases.mbt:48:6'
Definition found at file <MOON_HOME>/lib/core/list/list.mbt
    | ///     @list.from_array([2, 4, 6, 8, 10]), (escaped)
    | ///   ) (escaped)
    | /// } (escaped)
    | /// ``` (escaped)
    | #locals(f) (escaped)
254 | pub fn[A, B] List::map(self : List[A], f : (A) -> B raise?) -> List[B] raise? { (escaped)
    |                    ^^^ (escaped)
    |   match self { (escaped)
    |     Empty => Empty (escaped)
    |     More(hd, tail~) => { (escaped)
    |       let dest = More(f(hd), tail=Empty) (escaped)
    |       for d = dest, t = tail { (escaped)
    |         match (d, t) { (escaped)
    |           (_, Empty) => break (escaped)
    |           (More(_) as dest, More(hd, tail~)) => { (escaped)
    |             dest.tail = More(f(hd), tail=Empty) (escaped)
    |             continue dest.tail, tail (escaped)
    |           } (escaped)
    |           // unreachable (escaped)
    |           (Empty, _) => panic() (escaped)
    |         } (escaped)
````

````mooncram
$ run_moon_ide moon ide peek-def 'get' --loc 'core_ide_cases.mbt:53:10'
Definition found at file <MOON_HOME>/lib/core/hashmap/hashmap.mbt
    | ///   let map = @hashmap.from_array([("key", 42)]) (escaped)
    | ///   debug_inspect(map.get("key"), content="Some(42)") (escaped)
    | ///   debug_inspect(map.get("nonexistent"), content="None") (escaped)
    | /// } (escaped)
    | /// ``` (escaped)
205 | pub fn[K : Hash + Eq, V] HashMap::get(self : HashMap[K, V], key : K) -> V? { (escaped)
    |                                   ^^^ (escaped)
    |   // self.get_with_hash(key, key.hash()) (escaped)
    |   let hash = key.hash() (escaped)
    |   for i = 0, idx = hash & self.capacity_mask { (escaped)
    |     guard self.entries[idx] is Some(entry) else { break None } (escaped)
    |     if entry.hash == hash && entry.key == key { (escaped)
    |       break Some(entry.value) (escaped)
    |     } (escaped)
    |     if i > entry.psl { (escaped)
    |       break None (escaped)
    |     } (escaped)
    |     continue i + 1, (idx + 1) & self.capacity_mask (escaped)
    |   } (escaped)
    | } (escaped)
    |  (escaped)
````

````mooncram
$ run_moon_ide moon ide peek-def 'map' --loc 'core_ide_cases.mbt:53:22'
Definition found at file <MOON_HOME>/lib/core/builtin/option.mbt
    | ///   assert_eq(a.map(x => x * 2), Some(10)) (escaped)
    | ///   let b = None (escaped)
    | ///   assert_eq(b.map(x => x * 2), None) (escaped)
    | /// } (escaped)
    | /// ``` (escaped)
132 | pub fn[T, U] Option::map(self : T?, f : (T) -> U raise?) -> U? raise? { (escaped)
    |                      ^^^ (escaped)
    |   match self { (escaped)
    |     Some(t) => Some(f(t)) (escaped)
    |     None => None (escaped)
    |   } (escaped)
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
    | /// Returns the provided default result (if none), or applies a function to the contained value (if any). (escaped)
    | /// Arguments passed to map_or are eagerly evaluated; if you are passing the result of a function call, it is recommended to use `map_or_else`, which is lazily evaluated. (escaped)
    | /// (escaped)
    | /// # Example (escaped)
    | /// (escaped)
    | /// ```mbt check (escaped)
    | /// test { (escaped)
````

````mooncram
$ run_moon_ide moon ide peek-def 'map' --loc 'core_ide_cases.mbt:60:10'
Definition found at file <MOON_HOME>/lib/core/hashmap/hashmap.mbt
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
    | /// Applies a function to each key-value pair in the map and  (escaped)
    | /// returns a new map with the results, using the original keys. (escaped)
798 | pub fn[K, V, V2] HashMap::map( (escaped)
    |                           ^^^ (escaped)
    |   self : HashMap[K, V], (escaped)
    |   f : (K, V) -> V2, (escaped)
    | ) -> HashMap[K, V2] { (escaped)
    |   let other = { (escaped)
    |     capacity: self.capacity, (escaped)
    |     entries: FixedArray::make(self.capacity, None), (escaped)
    |     size: self.size, (escaped)
    |     capacity_mask: self.capacity_mask, (escaped)
    |   } (escaped)
    |   if self.size == 0 { (escaped)
    |     return other (escaped)
    |   } (escaped)
    |   for i in 0..<self.capacity { (escaped)
    |     if self.entries[i] is Some({ key, value, hash, psl }) { (escaped)
````

````mooncram
$ run_moon_ide moon ide peek-def 'map' --loc 'core_ide_cases.mbt:65:13'
Definition found at file <WORKDIR>/types.mbt
   |   Value(T) (escaped)
   | } (escaped)
   |  (escaped)
   | ///| (escaped)
   | /// Maps a function over the container (escaped)
41 | pub fn[T, U] Container::map(self : Container[T], f : (T) -> U) -> Container[U] { (escaped)
   |                         ^^^ (escaped)
   |   match self { (escaped)
   |     Empty => Empty (escaped)
   |     Value(x) => Value(f(x)) (escaped)
   |   } (escaped)
   | } (escaped)
   |  (escaped)
   | ///| (escaped)
   | /// Checks if the container is empty (escaped)
   | pub fn[T] Container::is_empty(self : Container[T]) -> Bool { (escaped)
   |   match self { (escaped)
   |     Empty => true (escaped)
   |     Value(_) => false (escaped)
   |   } (escaped)
   | } (escaped)
````

````mooncram
$ run_moon_ide moon ide peek-def 'split' --loc 'core_ide_cases.mbt:71:4'
Definition found at file <MOON_HOME>/lib/core/builtin/string_methods.mbt
     | /// the returned iterator will contain only one element, which is the original (escaped)
     | /// string. (escaped)
     | ///  (escaped)
     | /// If the separator is empty, the returned iterator will contain all the (escaped)
     | /// characters in the string as single elements. (escaped)
1122 | pub fn String::split(self : String, sep : StringView) -> Iter[StringView] { (escaped)
     |                ^^^^^ (escaped)
     |   self[:].split(sep) (escaped)
     | } (escaped)
     |  (escaped)
     | ///| (escaped)
     | /// Splits the string into a pair at the first occurrence of the separator. (escaped)
     | ///  (escaped)
     | /// Returns None if the separator is not found. (escaped)
     | ///  (escaped)
     | /// If the separator is empty, it splits at the start of the string, returning (escaped)
     | /// an empty prefix and the full string as the suffix. (escaped)
     | pub fn StringView::split_once( (escaped)
     |   self : StringView, (escaped)
     |   needle : StringView, (escaped)
     | ) -> (StringView, StringView)? { (escaped)
````

````mooncram
$ run_moon_ide moon ide peek-def 'filter' --loc 'core_ide_cases.mbt:73:4'
Definition found at file <MOON_HOME>/lib/core/builtin/iterator.mbt
    | /// (escaped)
    | /// A new iterator that only contains the elements for which the predicate function returns `IterContinue`. (escaped)
    | /// (escaped)
    | /// # Note (escaped)
    | /// The old iterator `self` must not be used again after calling `filter`. (escaped)
326 | pub fn[X] Iter::filter(self : Iter[X], f : (X) -> Bool) -> Iter[X] { (escaped)
    |                 ^^^^^^ (escaped)
    |   Iter::new(fn() { (escaped)
    |     while self.next() is Some(x) { (escaped)
    |       if f(x) { (escaped)
    |         break Some(x) (escaped)
    |       } (escaped)
    |     } nobreak { (escaped)
    |       None (escaped)
    |     } (escaped)
    |   }) (escaped)
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
    | /// Transforms the elements of the iterator using a mapping function. (escaped)
    | /// (escaped)
````

````mooncram
$ run_moon_ide moon ide peek-def 'from_array' --loc 'core_ide_cases.mbt:84:9'
Definition found at file <MOON_HOME>/lib/core/list/list.mbt
    | /// } (escaped)
    | /// ``` (escaped)
    | #as_free_fn (escaped)
    | #alias(of, deprecated="Use from_array instead") (escaped)
    | #as_free_fn(of, deprecated="Use from_array instead") (escaped)
168 | pub fn[A] List::from_array(arr : ArrayView[A]) -> List[A] { (escaped)
    |                 ^^^^^^^^^^ (escaped)
    |   for i = arr.length() - 1, list = Empty; i >= 0; { (escaped)
    |     continue i - 1, More(arr[i], tail=list) (escaped)
    |   } nobreak { (escaped)
    |     list (escaped)
    |   } (escaped)
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
    | /// Get the length of the list. (escaped)
    | pub fn[A] List::length(self : List[A]) -> Int { (escaped)
    |   for x = self, acc = 0 { (escaped)
    |     match (x, acc) { (escaped)
    |       (Empty, len) => break len (escaped)
    |       (More(_, tail=rest), acc) => continue rest, acc + 1 (escaped)
Definition found at file <MOON_HOME>/lib/core/list/list.mbt
    | /// } (escaped)
    | /// ``` (escaped)
    | #as_free_fn (escaped)
    | #alias(of, deprecated="Use from_array instead") (escaped)
    | #as_free_fn(of, deprecated="Use from_array instead") (escaped)
168 | pub fn[A] List::from_array(arr : ArrayView[A]) -> List[A] { (escaped)
    |                 ^^^^^^^^^^ (escaped)
    |   for i = arr.length() - 1, list = Empty; i >= 0; { (escaped)
    |     continue i - 1, More(arr[i], tail=list) (escaped)
    |   } nobreak { (escaped)
    |     list (escaped)
    |   } (escaped)
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
    | /// Get the length of the list. (escaped)
    | pub fn[A] List::length(self : List[A]) -> Int { (escaped)
    |   for x = self, acc = 0 { (escaped)
    |     match (x, acc) { (escaped)
    |       (Empty, len) => break len (escaped)
    |       (More(_, tail=rest), acc) => continue rest, acc + 1 (escaped)
````
