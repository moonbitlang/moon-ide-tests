# core-standalone peek-def

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
$ run_moon_ide moon ide peek-def 'Array::map'
Found 1 symbols matching 'Array::map':

`pub fn Array::map` in package moonbitlang/core/builtin at <MOON_HOME>/lib/core/builtin/array.mbt:576-597
576 | ///| (escaped)
    | /// Maps a function over the elements of the array. (escaped)
    | /// (escaped)
    | /// # Example (escaped)
    | /// ```mbt check (escaped)
    | /// test { (escaped)
    | ///   let v = [3, 4, 5] (escaped)
    | ///   let v2 = v.map(x => x + 1) (escaped)
    | ///   assert_eq(v2, [4, 5, 6]) (escaped)
    | /// } (escaped)
    | /// ``` (escaped)
    | #locals(f) (escaped)
    | pub fn[T, U] Array::map( (escaped)
    |   self : Array[T], (escaped)
    |   f : (T) -> U raise?, (escaped)
    | ) -> Array[U] raise? { (escaped)
    |   let arr = Array::make_uninit(self.length()) (escaped)
    |   for i, v in self { (escaped)
    |     arr.unsafe_set(i, f(v)) (escaped)
    |   } (escaped)
    |   arr (escaped)
    | } (no-eol) (escaped)
```

```mooncram
$ run_moon_ide moon ide peek-def 'Array::filter'
Found 1 symbols matching 'Array::filter':

`pub fn Array::filter` in package moonbitlang/core/builtin at <MOON_HOME>/lib/core/builtin/array.mbt:669-703
669 | ///| (escaped)
    | /// Creates a new array containing all elements from the input array that satisfy (escaped)
    | /// the given predicate function. (escaped)
    | /// (escaped)
    | /// Parameters: (escaped)
    | /// (escaped)
    | /// * `array` : The array to filter. (escaped)
    | /// * `predicate` : A function that takes an element and returns a boolean (escaped)
    | /// indicating whether the element should be included in the result. (escaped)
    | /// (escaped)
    | /// Returns a new array containing only the elements for which the predicate (escaped)
    | /// function returns `true`. The relative order of the elements is preserved. (escaped)
    | /// (escaped)
    | /// Example: (escaped)
    | /// (escaped)
    | /// ```mbt check (escaped)
    | /// test { (escaped)
    | ///   let arr = [1, 2, 3, 4, 5] (escaped)
    | ///   let evens = arr.filter(x => x % 2 == 0) (escaped)
    | ///   debug_inspect(evens, content="[2, 4]") (escaped)
    | /// } (escaped)
    | /// ``` (escaped)
    | #locals(f) (escaped)
    | pub fn[T] Array::filter( (escaped)
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
    | } (no-eol) (escaped)
```

```mooncram
$ run_moon_ide moon ide peek-def 'Array::fold'
Found 1 symbols matching 'Array::fold':

`pub fn Array::fold` in package moonbitlang/core/builtin at <MOON_HOME>/lib/core/builtin/array.mbt:1269-1299
1269 | ///| (escaped)
     | /// Fold out values from an array according to certain rules. (escaped)
     | /// This method traverses the array through `self.iter()`, so the traversal (escaped)
     | /// bounds are fixed when folding starts. (escaped)
     | /// (escaped)
     | /// Structural mutations to `self` inside `f` are unsupported. Appended (escaped)
     | /// elements are not visited, and shrinking the array with operations such as (escaped)
     | /// `remove`, `truncate`, `clear`, or `drain` may cause later fold steps to (escaped)
     | /// fail. (escaped)
     | /// (escaped)
     | /// Example: (escaped)
     | /// (escaped)
     | /// ```mbt check (escaped)
     | /// test { (escaped)
     | ///   let sum = [1, 2, 3, 4, 5].fold(init=0, (sum, elem) => sum + elem) (escaped)
     | ///   assert_eq(sum, 15) (escaped)
     | /// } (escaped)
     | /// ``` (escaped)
     | #locals(f) (escaped)
     | #alias(fold_left, deprecated) (escaped)
     | pub fn[A, B] Array::fold( (escaped)
     |   self : Array[A], (escaped)
     |   init~ : B, (escaped)
     |   f : (B, A) -> B raise?, (escaped)
     | ) -> B raise? { (escaped)
     |   for item in self; acc = init { (escaped)
     |     continue f(acc, item) (escaped)
     |   } nobreak { (escaped)
     |     acc (escaped)
     |   } (escaped)
     | } (no-eol) (escaped)
```

```mooncram
$ run_moon_ide moon ide peek-def 'String::length'
Found 1 symbols matching 'String::length':

`pub fn String::length` in package moonbitlang/core/builtin at <MOON_HOME>/lib/core/builtin/intrinsics.mbt:1713-1734
1713 | ///| (escaped)
     | /// Returns the number of UTF-16 code units in the string. Note that this is not (escaped)
     | /// necessarily equal to the number of Unicode characters (code points) in the (escaped)
     | /// string, as some characters may be represented by multiple UTF-16 code units. (escaped)
     | /// (escaped)
     | /// Parameters: (escaped)
     | /// (escaped)
     | /// * `string` : The string whose length is to be determined. (escaped)
     | /// (escaped)
     | /// Returns the number of UTF-16 code units in the string. (escaped)
     | /// (escaped)
     | /// Example: (escaped)
     | /// (escaped)
     | /// ```mbt check (escaped)
     | /// test { (escaped)
     | ///   inspect("hello".length(), content="5") (escaped)
     | ///   inspect("🤣".length(), content="2") // Emoji uses two UTF-16 code units (escaped)
     | ///   inspect("".length(), content="0") // Empty string (escaped)
     | /// } (escaped)
     | /// ``` (escaped)
     | #alias(charcode_length, deprecated) (escaped)
     | pub fn String::length(self : String) -> Int = "%string_length" (no-eol) (escaped)
```

```mooncram
$ run_moon_ide moon ide peek-def 'String::split'
Found 1 symbols matching 'String::split':

`pub fn String::split` in package moonbitlang/core/builtin at <MOON_HOME>/lib/core/builtin/string_methods.mbt:1113-1124
1113 | ///| (escaped)
     | /// Splits the string into all substrings separated by the given separator. (escaped)
     | ///  (escaped)
     | /// If the string does not contain the separator and the separator is not empty, (escaped)
     | /// the returned iterator will contain only one element, which is the original (escaped)
     | /// string. (escaped)
     | ///  (escaped)
     | /// If the separator is empty, the returned iterator will contain all the (escaped)
     | /// characters in the string as single elements. (escaped)
     | pub fn String::split(self : String, sep : StringView) -> Iter[StringView] { (escaped)
     |   self[:].split(sep) (escaped)
     | } (no-eol) (escaped)
```

```mooncram
$ run_moon_ide moon ide peek-def 'StringBuilder::new'
Found 1 symbols matching 'StringBuilder::new':

`pub fn alias StringBuilder::new` in package moonbitlang/core/builtin at <MOON_HOME>/lib/core/builtin/stringbuilder_buffer.mbt:21-37
21 | ///| (escaped)
   | /// Creates a new string builder with an optional initial capacity hint. (escaped)
   | /// (escaped)
   | /// Parameters: (escaped)
   | /// (escaped)
   | /// * `size_hint` : An optional initial capacity hint for the internal buffer. If (escaped)
   | /// less than 1, a minimum capacity of 1 is used. Defaults to 0. It is the size of bytes,  (escaped)
   | /// not the size of characters. `size_hint` may be ignored on some platforms, JS for example. (escaped)
   | /// (escaped)
   | /// Returns a new `StringBuilder` instance with the specified initial capacity. (escaped)
   | /// (escaped)
   | #alias(new) (escaped)
   | pub fn StringBuilder::StringBuilder(size_hint? : Int = 0) -> StringBuilder { (escaped)
   |   let initial = if size_hint < 1 { 1 } else { (size_hint + 1) / 2 } (escaped)
   |   let data : FixedArray[UInt16] = FixedArray::make(initial, 0) (escaped)
   |   { data, len: 0 } (escaped)
   | } (no-eol) (escaped)
```

```mooncram
$ run_moon_ide moon ide peek-def 'Int::abs'
Found 1 symbols matching 'Int::abs':

`pub fn Int::abs` in package moonbitlang/core/builtin at <MOON_HOME>/lib/core/builtin/int.mbt:158-182
158 | ///| (escaped)
    | /// Computes the absolute value of an integer. (escaped)
    | /// (escaped)
    | /// Parameters: (escaped)
    | /// (escaped)
    | /// * `self` : The integer whose absolute value is to be computed. (escaped)
    | /// (escaped)
    | /// Returns the absolute value of the integer. (escaped)
    | /// (escaped)
    | /// Example: (escaped)
    | /// (escaped)
    | /// ```mbt check (escaped)
    | /// test { (escaped)
    | ///   inspect(Int::abs(42), content="42") (escaped)
    | ///   inspect(Int::abs(-42), content="42") (escaped)
    | ///   inspect(Int::abs(0), content="0") (escaped)
    | /// } (escaped)
    | /// ``` (escaped)
    | pub fn Int::abs(self : Int) -> Int { (escaped)
    |   if self < 0 { (escaped)
    |     -self (escaped)
    |   } else { (escaped)
    |     self (escaped)
    |   } (escaped)
    | } (no-eol) (escaped)
```

```mooncram
$ run_moon_ide moon ide peek-def 'Int::to_string'
Found 2 symbols matching 'Int::to_string':

`pub fn Int::to_string` in package moonbitlang/core/builtin at <MOON_HOME>/lib/core/builtin/to_string.mbt:202-265
202 | ///| (escaped)
    | /// Converts an integer to its string representation in the specified radix (base). (escaped)
    | /// Example: (escaped)
    | /// ``` (escaped)
    | /// inspect((255).to_string(radix=16), content="ff") (escaped)
    | /// inspect((-255).to_string(radix=16), content="-ff") (escaped)
    | /// ``` (escaped)
    | #cfg(not(target="js")) (escaped)
    | pub fn Int::to_string(self : Int, radix? : Int = 10) -> String { (escaped)
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
    |     // Works correctly for Int::min_value due to two's complement: (escaped)
    |     // -Int::min_value wraps to itself, then reinterpreting gives 2147483648U (escaped)
    |     (-self).reinterpret_as_uint() (escaped)
    |   } else { (escaped)
    |     self.reinterpret_as_uint() (escaped)
    |   } (escaped)
    |  (escaped)
    |   // Calculate length, allocate buffer, and write digits (escaped)
    |   let buffer = match radix { (escaped)
    |     10 => { (escaped)
    |       let digit_len = dec_count32(num) (escaped)
    |       let total_len = digit_len + (if is_negative { 1 } else { 0 }) (escaped)
    |       let buffer : FixedArray[UInt16] = FixedArray::make(total_len, 0) (escaped)
    |       let digit_start = if is_negative { 1 } else { 0 } (escaped)
    |       int_to_string_dec(buffer, num, digit_start, total_len) (escaped)
    |       buffer (escaped)
    |     } (escaped)
    |     16 => { (escaped)
    |       let digit_len = hex_count32(num) (escaped)
    |       let total_len = digit_len + (if is_negative { 1 } else { 0 }) (escaped)
    |       let buffer : FixedArray[UInt16] = FixedArray::make(total_len, 0) (escaped)
    |       let digit_start = if is_negative { 1 } else { 0 } (escaped)
    |       int_to_string_hex(buffer, num, digit_start, total_len) (escaped)
    |       buffer (escaped)
    |     } (escaped)
    |     _ => { (escaped)
    |       let digit_len = radix_count32(num, radix) (escaped)
    |       let total_len = digit_len + (if is_negative { 1 } else { 0 }) (escaped)
    |       let buffer : FixedArray[UInt16] = FixedArray::make(total_len, 0) (escaped)
    |       let digit_start = if is_negative { 1 } else { 0 } (escaped)
    |       int_to_string_generic(buffer, num, digit_start, total_len, radix) (escaped)
    |       buffer (escaped)
    |     } (escaped)
    |   } (escaped)
    |  (escaped)
    |   // Write minus sign if negative (escaped)
    |   if is_negative { (escaped)
    |     buffer.unsafe_set(0, 0x002D) (escaped)
    |   } (escaped)
    |   unsafe_fixedarray_uint16_to_string(buffer) (escaped)
    | } (escaped)

`pub fn Int::to_string` in package moonbitlang/core/builtin at <MOON_HOME>/lib/core/builtin/to_string.mbt:309-314
309 | ///| (escaped)
    | /// Converts an integer to its string representation in the specified radix (base). (escaped)
    | #cfg(target="js") (escaped)
    | pub fn Int::to_string(self : Int, radix? : Int = 10) -> String { (escaped)
    |   int_to_string_js(self, radix) (escaped)
    | } (no-eol) (escaped)
```

```mooncram
$ run_moon_ide moon ide peek-def 'Option::map'
Found 1 symbols matching 'Option::map':

`pub fn Option::map` in package moonbitlang/core/builtin at <MOON_HOME>/lib/core/builtin/option.mbt:119-137
119 | ///| (escaped)
    | /// Maps the value of an `Option` using a provided function. (escaped)
    | /// (escaped)
    | /// # Example (escaped)
    | /// (escaped)
    | /// ```mbt check (escaped)
    | /// test { (escaped)
    | ///   let a = Some(5) (escaped)
    | ///   assert_eq(a.map(x => x * 2), Some(10)) (escaped)
    | ///   let b = None (escaped)
    | ///   assert_eq(b.map(x => x * 2), None) (escaped)
    | /// } (escaped)
    | /// ``` (escaped)
    | pub fn[T, U] Option::map(self : T?, f : (T) -> U raise?) -> U? raise? { (escaped)
    |   match self { (escaped)
    |     Some(t) => Some(f(t)) (escaped)
    |     None => None (escaped)
    |   } (escaped)
    | } (no-eol) (escaped)
```

```mooncram
$ run_moon_ide moon ide peek-def 'Result::map'
Found 1 symbols matching 'Result::map':

`pub fn Result::map` in package moonbitlang/core/builtin at <MOON_HOME>/lib/core/builtin/result.mbt:15-32
15 | ///| (escaped)
   | /// Maps the value of a Result if it is `Ok` into another, otherwise returns the `Err` value unchanged. (escaped)
   | /// (escaped)
   | /// # Example (escaped)
   | /// (escaped)
   | /// ```mbt check (escaped)
   | /// test { (escaped)
   | ///   let x : Result[Int, Unit] = Ok(6) (escaped)
   | ///   let y = x.map((v : Int) => v * 7) (escaped)
   | ///   assert_eq(y, Ok(42)) (escaped)
   | /// } (escaped)
   | /// ``` (escaped)
   | pub fn[T, E, U] Result::map(self : Result[T, E], f : (T) -> U) -> Result[U, E] { (escaped)
   |   match self { (escaped)
   |     Ok(value) => Ok(f(value)) (escaped)
   |     Err(err) => Err(err) (escaped)
   |   } (escaped)
   | } (no-eol) (escaped)
```

```mooncram
$ run_moon_ide moon ide peek-def 'Iter::map'
Found 1 symbols matching 'Iter::map':

`pub fn Iter::map` in package moonbitlang/core/builtin at <MOON_HOME>/lib/core/builtin/iterator.mbt:338-367
338 | ///| (escaped)
    | /// Transforms the elements of the iterator using a mapping function. (escaped)
    | /// (escaped)
    | /// # Type Parameters (escaped)
    | /// (escaped)
    | /// - `X`: The type of the elements in the iterator. (escaped)
    | /// - `Y`: The type of the transformed elements. (escaped)
    | /// (escaped)
    | /// # Arguments (escaped)
    | /// (escaped)
    | /// * `self` - The input iterator. (escaped)
    | /// * `f` - The mapping function that transforms each element of the iterator. (escaped)
    | /// (escaped)
    | /// # Returns (escaped)
    | /// (escaped)
    | /// A new iterator that contains the transformed elements. (escaped)
    | /// (escaped)
    | /// # Note (escaped)
    | /// The old iterator `self` must not be used again after calling `map`. (escaped)
    | pub fn[X, Y] Iter::map(self : Iter[X], f : (X) -> Y) -> Iter[Y] { (escaped)
    |   { (escaped)
    |     f: fn() { (escaped)
    |       match self.next() { (escaped)
    |         Some(x) => Some(f(x)) (escaped)
    |         None => None (escaped)
    |       } (escaped)
    |     }, (escaped)
    |     size_hint: self.size_hint, (escaped)
    |   } (escaped)
    | } (no-eol) (escaped)
```

```mooncram
$ run_moon_ide moon ide peek-def 'Iter::filter'
Found 1 symbols matching 'Iter::filter':

`pub fn Iter::filter` in package moonbitlang/core/builtin at <MOON_HOME>/lib/core/builtin/iterator.mbt:308-336
308 | ///| (escaped)
    | /// Filters the elements of the iterator based on a predicate function. (escaped)
    | /// (escaped)
    | /// # Type Parameters (escaped)
    | /// (escaped)
    | /// - `X`: The type of the elements in the iterator. (escaped)
    | /// (escaped)
    | /// # Arguments (escaped)
    | /// (escaped)
    | /// * `self` - The input iterator. (escaped)
    | /// * `f` - The predicate function that determines whether an element should be included in the filtered iterator. (escaped)
    | /// (escaped)
    | /// # Returns (escaped)
    | /// (escaped)
    | /// A new iterator that only contains the elements for which the predicate function returns `IterContinue`. (escaped)
    | /// (escaped)
    | /// # Note (escaped)
    | /// The old iterator `self` must not be used again after calling `filter`. (escaped)
    | pub fn[X] Iter::filter(self : Iter[X], f : (X) -> Bool) -> Iter[X] { (escaped)
    |   Iter::new(fn() { (escaped)
    |     while self.next() is Some(x) { (escaped)
    |       if f(x) { (escaped)
    |         break Some(x) (escaped)
    |       } (escaped)
    |     } nobreak { (escaped)
    |       None (escaped)
    |     } (escaped)
    |   }) (escaped)
    | } (no-eol) (escaped)
```

```mooncram
$ run_moon_ide moon ide peek-def 'Iter::to_array'
Found 1 symbols matching 'Iter::to_array':

`pub fn Iter::to_array` in package moonbitlang/core/builtin at <MOON_HOME>/lib/core/builtin/iterator.mbt:806-819
806 | ///| (escaped)
    | /// Collects the elements of the iterator into an array. (escaped)
    | /// The old iterator `self` must not be used again. (escaped)
    | #alias(collect) (escaped)
    | pub fn[X] Iter::to_array(self : Iter[X]) -> Array[X] { (escaped)
    |   let result = match self.size_hint { (escaped)
    |     Some(n) => Array::new(capacity=n) (escaped)
    |     None => [] (escaped)
    |   } (escaped)
    |   while self.next() is Some(x) { (escaped)
    |     result.push(x) (escaped)
    |   } (escaped)
    |   result (escaped)
    | } (no-eol) (escaped)
```

```mooncram
$ run_moon_ide moon ide peek-def '@moonbitlang/core/list.List'
Found 1 symbols matching '@moonbitlang/core/list.List':

`pub enum List` in package moonbitlang/core/list at <MOON_HOME>/lib/core/list/types.mbt:15-21
15 | ///| (escaped)
   | /// Type `List` used by this package APIs. (escaped)
   | #alias(T, deprecated) (escaped)
   | pub enum List[A] { (escaped)
   |   Empty (escaped)
   |   More(A, mut tail~ : List[A]) (escaped)
   | } (no-eol) (escaped)
```

```mooncram
$ run_moon_ide moon ide peek-def '@moonbitlang/core/list.List::map'
Found 1 symbols matching '@moonbitlang/core/list.List::map':

`pub fn List::map` in package moonbitlang/core/list at <MOON_HOME>/lib/core/list/list.mbt:240-273
240 | ///| (escaped)
    | /// Maps the list. (escaped)
    | /// (escaped)
    | /// # Example (escaped)
    | /// (escaped)
    | /// ```mbt check (escaped)
    | /// test { (escaped)
    | ///   @debug.assert_eq( (escaped)
    | ///     @list.from_array([1, 2, 3, 4, 5]).map(x => x * 2), (escaped)
    | ///     @list.from_array([2, 4, 6, 8, 10]), (escaped)
    | ///   ) (escaped)
    | /// } (escaped)
    | /// ``` (escaped)
    | #locals(f) (escaped)
    | pub fn[A, B] List::map(self : List[A], f : (A) -> B raise?) -> List[B] raise? { (escaped)
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
    |       } (escaped)
    |       dest (escaped)
    |     } (escaped)
    |   } (escaped)
    | } (no-eol) (escaped)
```

```mooncram
$ run_moon_ide moon ide peek-def '@moonbitlang/core/hashmap.HashMap::get'
Found 2 symbols matching '@moonbitlang/core/hashmap.HashMap::get':

`pub fn HashMap::get` in package moonbitlang/core/hashmap at <MOON_HOME>/lib/core/hashmap/hashmap.mbt:186-218
186 | ///| (escaped)
    | /// Retrieves the value associated with a given key in the hash map. (escaped)
    | /// (escaped)
    | /// Parameters: (escaped)
    | /// (escaped)
    | /// * `self` : The hash map to search in. (escaped)
    | /// * `key` : The key to look up in the map. (escaped)
    | /// (escaped)
    | /// Returns `Some(value)` if the key exists in the map, `None` otherwise. (escaped)
    | /// (escaped)
    | /// Example: (escaped)
    | /// (escaped)
    | /// ```mbt check (escaped)
    | /// test { (escaped)
    | ///   let map = @hashmap.from_array([("key", 42)]) (escaped)
    | ///   debug_inspect(map.get("key"), content="Some(42)") (escaped)
    | ///   debug_inspect(map.get("nonexistent"), content="None") (escaped)
    | /// } (escaped)
    | /// ``` (escaped)
    | pub fn[K : Hash + Eq, V] HashMap::get(self : HashMap[K, V], key : K) -> V? { (escaped)
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

`pub fn HashMap::get` in package moonbitlang/core/immut/hashmap at <MOON_HOME>/lib/core/immut/hashmap/HAMT.mbt:59-67
59 | ///| (escaped)
   | /// Lookup a key from a hash map (escaped)
   | #alias(find, deprecated) (escaped)
   | pub fn[K : Eq + Hash, V] HashMap::get(self : HashMap[K, V], key : K) -> V? { (escaped)
   |   match self.0 { (escaped)
   |     None => None (escaped)
   |     Some(node) => node.get_with_path(key, @path.of(key)) (escaped)
   |   } (escaped)
   | } (no-eol) (escaped)
```

```mooncram
$ run_moon_ide moon ide peek-def '@moonbitlang/core/hashmap.HashMap::map'
Found 2 symbols matching '@moonbitlang/core/hashmap.HashMap::map':

`pub fn HashMap::map` in package moonbitlang/core/hashmap at <MOON_HOME>/lib/core/hashmap/hashmap.mbt:795-817
795 | ///| (escaped)
    | /// Applies a function to each key-value pair in the map and  (escaped)
    | /// returns a new map with the results, using the original keys. (escaped)
    | pub fn[K, V, V2] HashMap::map( (escaped)
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
    |       other.entries[i] = Some({ psl, key, value: f(key, value), hash }) (escaped)
    |     } (escaped)
    |   } (escaped)
    |   other (escaped)
    | } (escaped)

`pub fn HashMap::map` in package moonbitlang/core/immut/hashmap at <MOON_HOME>/lib/core/immut/hashmap/HAMT.mbt:235-255
235 | ///| (escaped)
    | /// Maps over the key-value pairs in the map (escaped)
    | #alias(map_with_key, deprecated) (escaped)
    | pub fn[K, V, A] HashMap::map( (escaped)
    |   self : HashMap[K, V], (escaped)
    |   f : (K, V) -> A raise?, (escaped)
    | ) -> HashMap[K, A] raise? { (escaped)
    |   fn go(m : Node[K, V]) -> Node[K, A] raise? { (escaped)
    |     match m { (escaped)
    |       Leaf(k, v, bucket) => (escaped)
    |         Leaf(k, f(k, v), bucket.map(kv => (kv.0, f(kv.0, kv.1)))) (escaped)
    |       Flat(k, v, path) => Flat(k, f(k, v), path) (escaped)
    |       Branch(children) => Branch(children.map(go)) (escaped)
    |     } (escaped)
    |   } (escaped)
    |  (escaped)
    |   match self.0 { (escaped)
    |     None => None (escaped)
    |     Some(node) => Some(go(node)) (escaped)
    |   } (escaped)
    | } (no-eol) (escaped)
```
