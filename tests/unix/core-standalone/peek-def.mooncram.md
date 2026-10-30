# core-standalone peek-def

````mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../core_test' moon ide peek-def 'Array::map'
Found 1 symbols matching 'Array::map':

`pub fn Array::map` in package moonbitlang/core/builtin at <MOON_HOME>/lib/core/builtin/array.mbt:619-640
619 | ///|
    | /// Maps a function over the elements of the array.
    | ///
    | /// # Example
    | /// ```mbt check
    | /// test {
    | ///   let v = [3, 4, 5]
    | ///   let v2 = v.map(x => x + 1)
    | ///   @test.assert_eq(v2, [4, 5, 6])
    | /// }
    | /// ```
    | #locals(f)
    | pub fn[T, U] Array::map(
    |   self : Array[T],
    |   f : (T) -> U raise?,
    | ) -> Array[U] raise? {
    |   let arr = Array::unsafe_make_uninit(self.length())
    |   for i, v in self {
    |     arr.unsafe_set(i, f(v))
    |   }
    |   arr
    | } (no-eol)
````

````mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../core_test' moon ide peek-def 'Array::filter'
Found 1 symbols matching 'Array::filter':

`pub fn Array::filter` in package moonbitlang/core/builtin at <MOON_HOME>/lib/core/builtin/array.mbt:712-742
712 | ///|
    | /// Creates a new array containing all elements from the input array that satisfy
    | /// the given predicate function.
    | ///
    | /// Parameters:
    | ///
    | /// * `array` : The array to filter.
    | /// * `predicate` : A function that takes an element and returns a boolean
    | /// indicating whether the element should be included in the result.
    | ///
    | /// Returns a new array containing only the elements for which the predicate
    | /// function returns `true`. The relative order of the elements is preserved.
    | ///
    | /// Example:
    | ///
    | /// ```mbt check
    | /// test {
    | ///   let arr = [1, 2, 3, 4, 5]
    | ///   let evens = arr.filter(x => x % 2 == 0)
    | ///   debug_inspect(evens, content="[2, 4]")
    | /// }
    | /// ```
    | #locals(f)
    | pub fn[T] Array::filter(
    |   self : Array[T],
    |   f : (T) -> Bool raise?,
    | ) -> Array[T] raise? {
    |   [
    |     for v in self if f(v) => v
    |   ]
    | } (no-eol)
````

````mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../core_test' moon ide peek-def 'Array::fold'
Found 1 symbols matching 'Array::fold':

`pub fn Array::fold` in package moonbitlang/core/builtin at <MOON_HOME>/lib/core/builtin/array.mbt:1360-1390
1360 | ///|
     | /// Fold out values from an array according to certain rules.
     | /// This method traverses the array through `self.iter()`, so the traversal
     | /// bounds are fixed when folding starts.
     | ///
     | /// Structural mutations to `self` inside `f` are unsupported. Appended
     | /// elements are not visited, and shrinking the array with operations such as
     | /// `remove`, `truncate`, `clear`, or `drain` may cause later fold steps to
     | /// fail.
     | ///
     | /// Example:
     | ///
     | /// ```mbt check
     | /// test {
     | ///   let sum = [1, 2, 3, 4, 5].fold(init=0, (sum, elem) => sum + elem)
     | ///   @test.assert_eq(sum, 15)
     | /// }
     | /// ```
     | #locals(f)
     | #alias(fold_left, deprecated)
     | pub fn[A, B] Array::fold(
     |   self : Array[A],
     |   init~ : B,
     |   f : (B, A) -> B raise?,
     | ) -> B raise? {
     |   for item in self; acc = init {
     |     continue f(acc, item)
     |   } nobreak {
     |     acc
     |   }
     | } (no-eol)
````

````mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../core_test' moon ide peek-def 'String::length'
Found 1 symbols matching 'String::length':

`pub fn String::length` in package moonbitlang/core/builtin at <MOON_HOME>/lib/core/builtin/intrinsics.mbt:1812-1833
1812 | ///|
     | /// Returns the number of UTF-16 code units in the string. Note that this is not
     | /// necessarily equal to the number of Unicode characters (code points) in the
     | /// string, as some characters may be represented by multiple UTF-16 code units.
     | ///
     | /// Parameters:
     | ///
     | /// * `string` : The string whose length is to be determined.
     | ///
     | /// Returns the number of UTF-16 code units in the string.
     | ///
     | /// Example:
     | ///
     | /// ```mbt check
     | /// test {
     | ///   inspect("hello".length(), content="5")
     | ///   inspect("🤣".length(), content="2") // Emoji uses two UTF-16 code units
     | ///   inspect("".length(), content="0") // Empty string
     | /// }
     | /// ```
     | #alias(charcode_length, deprecated)
     | pub fn String::length(self : String) -> Int32 = "%string_length" (no-eol)
````

````mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../core_test' moon ide peek-def 'String::split'
Found 1 symbols matching 'String::split':

`pub fn String::split` in package moonbitlang/core/builtin at <MOON_HOME>/lib/core/builtin/string_methods.mbt:1727-1738
1727 | ///|
     | /// Splits the string into all substrings separated by the given separator.
"     | /// " (escaped)
     | /// If the string does not contain the separator and the separator is not empty,
     | /// the returned iterator will contain only one element, which is the original
     | /// string.
"     | /// " (escaped)
     | /// If the separator is empty, the returned iterator will contain all the
     | /// characters in the string as single elements.
     | pub fn String::split(self : String, sep : StringView) -> Iter[StringView] {
     |   self[:].split(sep)
     | } (no-eol)
````

````mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../core_test' moon ide peek-def 'StringBuilder::new'
Found 1 symbols matching 'StringBuilder::new':

`pub fn alias StringBuilder::new` in package moonbitlang/core/builtin at <MOON_HOME>/lib/core/builtin/stringbuilder_buffer.mbt:22-40
22 | ///|
   | /// Creates a new string builder with an optional initial capacity hint.
   | ///
   | /// Parameters:
   | ///
   | /// * `size_hint` : An optional initial capacity hint for the internal buffer,
   | /// in UTF-16 code units. Defaults to 8. Use 0 to request an empty initial
   | /// buffer. `size_hint` may be ignored on some platforms, JS for example.
   | ///
   | /// Returns a new `StringBuilder` instance.
   | ///
   | /// Aborts if `size_hint` is negative.
   | ///
   | #alias(new, deprecated="Use `StringBuilder()` instead")
   | pub fn StringBuilder::StringBuilder(size_hint~ : Int32 = 8) -> StringBuilder {
   |   guard size_hint >= 0 else { abort("size_hint must be non-negative") }
   |   let data : UninitializedArray[UInt16] = UninitializedArray::make(size_hint)
   |   { data, len: 0, }
   | } (no-eol)
````

````mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../core_test' moon ide peek-def 'Int32::abs'
Found 1 symbols matching 'Int32::abs':

`pub fn Int32::abs` in package moonbitlang/core/builtin at <MOON_HOME>/lib/core/builtin/int.mbt:172-198
172 | ///|
    | /// Computes the absolute value of an integer.
    | ///
    | /// Parameters:
    | ///
    | /// * `self` : The integer whose absolute value is to be computed.
    | ///
    | /// Returns the absolute value of the integer. When the input is
    | /// `@int.min_value` (-2147483648), returns `@int.min_value` itself, since its
    | /// absolute value is not representable as an `Int`.
    | ///
    | /// Example:
    | ///
    | /// ```mbt check
    | /// test {
    | ///   inspect(Int32::abs(42), content="42")
    | ///   inspect(Int32::abs(-42), content="42")
    | ///   inspect(Int32::abs(0), content="0")
    | /// }
    | /// ```
    | pub fn Int32::abs(self : Int32) -> Int32 {
    |   if self < 0 {
    |     -self
    |   } else {
    |     self
    |   }
    | } (no-eol)
````

````mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../core_test' moon ide peek-def 'Int32::to_string'
Found 2 symbols matching 'Int32::to_string':

`pub fn Int32::to_string` in package moonbitlang/core/builtin at <MOON_HOME>/lib/core/builtin/to_string.mbt:202-263
202 | ///|
    | /// Converts an integer to its string representation in the specified radix (base).
    | /// Example:
    | /// ```
    | /// inspect((255).to_string(radix=16), content="ff")
    | /// inspect((-255).to_string(radix=16), content="-ff")
    | /// ```
    | #cfg(not(target="js"))
    | pub fn Int32::to_string(self : Int32, radix~ : Int32 = 10) -> String {
    |   // Validate radix
    |   if radix < 2 || radix > 36 {
    |     abort("radix must be between 2 and 36")
    |   }
"    | " (escaped)
    |   // Special case for zero
    |   if self == 0 {
    |     return "0"
    |   }
"    | " (escaped)
    |   // Handle negative numbers
    |   let is_negative = self < 0
    |   let num : UInt32 = if is_negative {
    |     // Negate and reinterpret as UInt
    |     // Works correctly for Int::min_value due to two's complement:
    |     // -Int::min_value wraps to itself, then reinterpreting gives 2147483648U
    |     (-self).reinterpret_as_uint()
    |   } else {
    |     self.reinterpret_as_uint()
    |   }
"    | " (escaped)
    |   // Calculate length, allocate buffer, and write digits
    |   let digit_start = if is_negative { 1 } else { 0 }
    |   let buffer = match radix {
    |     10 => {
    |       let digit_len = dec_count32(num)
    |       let total_len = digit_len + digit_start
    |       let buffer : FixedArray[UInt16] = FixedArray::make(total_len, 0)
    |       int_to_string_dec(buffer, num, digit_start, total_len)
    |       buffer
    |     }
    |     16 => {
    |       let digit_len = hex_count32(num)
    |       let total_len = digit_len + digit_start
    |       let buffer : FixedArray[UInt16] = FixedArray::make(total_len, 0)
    |       int_to_string_hex(buffer, num, digit_start, total_len)
    |       buffer
    |     }
    |     _ => {
    |       let digit_len = radix_count32(num, radix)
    |       let total_len = digit_len + digit_start
    |       let buffer : FixedArray[UInt16] = FixedArray::make(total_len, 0)
    |       int_to_string_generic(buffer, num, digit_start, total_len, radix)
    |       buffer
    |     }
    |   }
"    | " (escaped)
    |   // Write minus sign if negative
    |   if is_negative {
    |     buffer.unsafe_set(0, 0x002D)
    |   }
    |   unsafe_fixedarray_uint16_to_string(buffer)
    | }

`pub fn Int32::to_string` in package moonbitlang/core/builtin at <MOON_HOME>/lib/core/builtin/to_string.mbt:307-312
307 | ///|
    | /// Converts an integer to its string representation in the specified radix (base).
    | #cfg(target="js")
    | pub fn Int32::to_string(self : Int32, radix~ : Int32 = 10) -> String {
    |   int_to_string_js(self, radix)
    | } (no-eol)
````

````mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../core_test' moon ide peek-def 'Option::map'
Found 1 symbols matching 'Option::map':

`pub fn Option::map` in package moonbitlang/core/builtin at <MOON_HOME>/lib/core/builtin/option.mbt:115-133
115 | ///|
    | /// Maps the value of an `Option` using a provided function.
    | ///
    | /// # Example
    | ///
    | /// ```mbt check
    | /// test {
    | ///   let a = Some(5)
    | ///   @test.assert_eq(a.map(x => x * 2), Some(10))
    | ///   let b = None
    | ///   @test.assert_eq(b.map(x => x * 2), None)
    | /// }
    | /// ```
    | pub fn[T, U] Option::map(self : T?, f : (T) -> U raise?) -> U? raise? {
    |   match self {
    |     Some(t) => Some(f(t))
    |     None => None
    |   }
    | } (no-eol)
````

````mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../core_test' moon ide peek-def 'Result::map'
Found 1 symbols matching 'Result::map':

`pub fn Result::map` in package moonbitlang/core/builtin at <MOON_HOME>/lib/core/builtin/result.mbt:15-35
15 | ///|
   | /// Maps the value of a Result if it is `Ok` into another, otherwise returns the `Err` value unchanged.
   | ///
   | /// # Example
   | ///
   | /// ```mbt check
   | /// test {
   | ///   let x : Result[Int32, Unit] = Ok(6)
   | ///   let y = x.map((v : Int32) => v * 7)
   | ///   @test.assert_eq(y, Ok(42))
   | /// }
   | /// ```
   | pub fn[T, E, U] Result::map(
   |   self : Result[T, E],
   |   f : (T) -> U raise?,
   | ) -> Result[U, E] raise? {
   |   match self {
   |     Ok(value) => Ok(f(value))
   |     Err(err) => Err(err)
   |   }
   | } (no-eol)
````

````mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../core_test' moon ide peek-def 'Iter::map'
Found 1 symbols matching 'Iter::map':

`pub fn Iter::map` in package moonbitlang/core/builtin at <MOON_HOME>/lib/core/builtin/iterator.mbt:346-373
346 | ///|
    | /// Transforms the elements of the iterator using a mapping function.
    | ///
    | /// # Type Parameters
    | ///
    | /// - `X`: The type of the elements in the iterator.
    | /// - `Y`: The type of the transformed elements.
    | ///
    | /// # Arguments
    | ///
    | /// * `self` - The input iterator.
    | /// * `f` - The mapping function that transforms each element of the iterator.
    | ///
    | /// # Returns
    | ///
    | /// A new iterator that contains the transformed elements.
    | ///
    | /// # Note
    | /// The old iterator `self` must not be used again after calling `map`.
    | pub fn[X, Y] Iter::map(self : Iter[X], f : (X) -> Y) -> Iter[Y] {
    |   {
    |     f: fn() {
    |       guard self.next() is Some(x) else { None }
    |       Some(f(x))
    |     },
    |     size_hint: self.size_hint,
    |   }
    | } (no-eol)
````

````mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../core_test' moon ide peek-def 'Iter::filter'
Found 1 symbols matching 'Iter::filter':

`pub fn Iter::filter` in package moonbitlang/core/builtin at <MOON_HOME>/lib/core/builtin/iterator.mbt:316-344
316 | ///|
    | /// Filters the elements of the iterator based on a predicate function.
    | ///
    | /// # Type Parameters
    | ///
    | /// - `X`: The type of the elements in the iterator.
    | ///
    | /// # Arguments
    | ///
    | /// * `self` - The input iterator.
    | /// * `f` - The predicate function that determines whether an element should be included in the filtered iterator.
    | ///
    | /// # Returns
    | ///
    | /// A new iterator that only contains the elements for which the predicate function returns `true`.
    | ///
    | /// # Note
    | /// The old iterator `self` must not be used again after calling `filter`.
    | pub fn[X] Iter::filter(self : Iter[X], f : (X) -> Bool) -> Iter[X] {
    |   Iter::new(fn() {
    |     for x in self {
    |       if f(x) {
    |         break Some(x)
    |       }
    |     } nobreak {
    |       None
    |     }
    |   })
    | } (no-eol)
````

````mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../core_test' moon ide peek-def 'Iter::to_array'
Found 1 symbols matching 'Iter::to_array':

`pub fn Iter::to_array` in package moonbitlang/core/builtin at <MOON_HOME>/lib/core/builtin/iterator.mbt:816-829
816 | ///|
    | /// Collects the elements of the iterator into an array.
    | /// The old iterator `self` must not be used again.
    | #alias(collect)
    | pub fn[X] Iter::to_array(self : Iter[X]) -> Array[X] {
    |   let result = match self.size_hint {
    |     Some(n) => Array::Array(capacity=n)
    |     None => []
    |   }
    |   while self.next() is Some(x) {
    |     result.push(x)
    |   }
    |   result
    | } (no-eol)
````

````mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../core_test' moon ide peek-def '@moonbitlang/core/list.List'
Found 1 symbols matching '@moonbitlang/core/list.List':

`pub enum List` in package moonbitlang/core/list at <MOON_HOME>/lib/core/list/types.mbt:15-21
15 | ///|
   | /// Type `List` used by this package APIs.
   | #unsafe_cycle_free
   | pub enum List[A] {
   |   Empty
   |   More(A, mut tail~ : List[A])
   | } (no-eol)
````

````mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../core_test' moon ide peek-def '@moonbitlang/core/list.List::map'
Found 1 symbols matching '@moonbitlang/core/list.List::map':

`pub fn List::map` in package moonbitlang/core/list at <MOON_HOME>/lib/core/list/list.mbt:222-255
222 | ///|
    | /// Maps the list.
    | ///
    | /// # Example
    | ///
    | /// ```mbt check
    | /// test {
    | ///   @debug.assert_eq(
    | ///     @list.List([1, 2, 3, 4, 5]).map(x => x * 2),
    | ///     List([2, 4, 6, 8, 10]),
    | ///   )
    | /// }
    | /// ```
    | #locals(f)
    | pub fn[A, B] List::map(self : List[A], f : (A) -> B raise?) -> List[B] raise? {
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
    |       }
    |       dest
    |     }
    |   }
    | } (no-eol)
````

````mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../core_test' moon ide peek-def '@moonbitlang/core/hashmap.HashMap::get'
Found 2 symbols matching '@moonbitlang/core/hashmap.HashMap::get':

`pub fn HashMap::get` in package moonbitlang/core/hashmap at <MOON_HOME>/lib/core/hashmap/hashmap.mbt:208-241
208 | ///|
    | /// Retrieves the value associated with a given key in the hash map.
    | ///
    | /// Parameters:
    | ///
    | /// * `self` : The hash map to search in.
    | /// * `key` : The key to look up in the map.
    | ///
    | /// Returns `Some(value)` if the key exists in the map, `None` otherwise.
    | ///
    | /// Example:
    | ///
    | /// ```mbt check
    | /// test {
    | ///   let map = @hashmap.from_array([("key", 42)])
    | ///   debug_inspect(map.get("key"), content="Some(42)")
    | ///   debug_inspect(map.get("nonexistent"), content="None")
    | /// }
    | /// ```
    | pub fn[K : Hash + Eq, V] HashMap::get(self : HashMap[K, V], key : K) -> V? {
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

`pub fn HashMap::get` in package moonbitlang/core/immut/hashmap at <MOON_HOME>/lib/core/immut/hashmap/HAMT.mbt:70-78
70 | ///|
   | /// Lookup a key from a hash map
   | #alias(find, deprecated)
   | pub fn[K : Eq + Hash, V] HashMap::get(self : HashMap[K, V], key : K) -> V? {
   |   match self.data {
   |     None => None
   |     Some(node) => node.get_with_path(key, @path.of(key))
   |   }
   | } (no-eol)
````

````mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../core_test' moon ide peek-def '@moonbitlang/core/hashmap.HashMap::map'
Found 2 symbols matching '@moonbitlang/core/hashmap.HashMap::map':

`pub fn HashMap::map` in package moonbitlang/core/hashmap at <MOON_HOME>/lib/core/hashmap/hashmap.mbt:853-877
853 | ///|
    | /// Applies a function to each key-value pair in the map and
    | /// returns a new map with the results, using the original keys.
    | ///
    | /// `f` may raise; the error propagates and `self` is left unchanged.
    | pub fn[K, V, V2] HashMap::map(
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
    |       other.entries[i] = Some({ psl, key, value: f(key, value), hash, })
    |     }
    |   }
    |   other
    | }

`pub fn HashMap::map` in package moonbitlang/core/immut/hashmap at <MOON_HOME>/lib/core/immut/hashmap/HAMT.mbt:415-437
415 | ///|
    | /// Maps over the key-value pairs in the map
    | #alias(map_with_key, deprecated)
    | pub fn[K, V, A] HashMap::map(
    |   self : HashMap[K, V],
    |   f : (K, V) -> A raise?,
    | ) -> HashMap[K, A] raise? {
    |   fn go(m : Node[K, V]) -> Node[K, A] raise? {
    |     match m {
    |       Leaf(k, v, bucket) =>
    |         Leaf(k, f(k, v), bucket.map(kv => (kv.0, f(kv.0, kv.1))))
    |       Flat(k, v, path) => Flat(k, f(k, v), path)
    |       Branch(children) => Branch(children.map(go))
    |     }
    |   }
"    | " (escaped)
    |   {
    |     data: match self.data {
    |       None => None
    |       Some(node) => Some(go(node))
    |     },
    |   }
    | } (no-eol)
````
