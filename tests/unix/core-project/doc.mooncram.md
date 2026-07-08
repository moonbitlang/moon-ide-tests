# core-project doc

```mooncram
$ export MOON_HOME="${MOON_HOME:-$HOME/.moon}"
```

```mooncram
$ export TEST_REPO_ROOT="$(cd "$TESTDIR/../../../core_test/test_project" && pwd)"
```

```mooncram
$ normalize_moon_ide_output() { sed -e "s|$TEST_REPO_ROOT|<WORKDIR>|g" -e "s|$MOON_HOME|<MOON_HOME>|g"; }
```

```mooncram
$ run_moon_ide() { status_file="${TMPDIR:-/tmp}/moon-ide-status.$$"; ( cd "$TEST_REPO_ROOT" && "$@"; echo "$?" > "$status_file" ) 2>&1 | normalize_moon_ide_output; status=$(cat "$status_file"); rm -f "$status_file"; return "$status"; }
```

```mooncram
$ run_moon_ide moon ide doc Array::map
package "moonbitlang/core/array"
pub fn[T, U] Array::map(Self[T], (T) -> U raise?) -> Self[U] raise?
  Maps a function over the elements of the array.
   # Example
   ```mbt check
   test {
     let v = [3, 4, 5]
     let v2 = v.map(x => x + 1) (escaped)
     @test.assert_eq(v2, [4, 5, 6])
   }
   ```
```

```mooncram
$ run_moon_ide moon ide doc Array::filter
package "moonbitlang/core/array"
pub fn[T] Array::filter(Self[T], (T) -> Bool raise?) -> Self[T] raise?
  Creates a new array containing all elements from the input array that satisfy
   the given predicate function.
   Parameters:
   * `array` : The array to filter.
   * `predicate` : A function that takes an element and returns a boolean
   indicating whether the element should be included in the result.
   Returns a new array containing only the elements for which the predicate
   function returns `true`. The relative order of the elements is preserved.
   Example:
   ```mbt check
   test {
     let arr = [1, 2, 3, 4, 5]
     let evens = arr.filter(x => x % 2 == 0) (escaped)
     debug_inspect(evens, content="[2, 4]")
   }
   ```
```

```mooncram
$ run_moon_ide moon ide doc Array::fold
package "moonbitlang/core/array"
#alias(fold_left, deprecated)
pub fn[A, B] Array::fold(Self[A], init~ : B, (B, A) -> B raise?) -> B raise?
  Fold out values from an array according to certain rules.
   This method traverses the array through `self.iter()`, so the traversal
   bounds are fixed when folding starts.
   Structural mutations to `self` inside `f` are unsupported. Appended
   elements are not visited, and shrinking the array with operations such as
   `remove`, `truncate`, `clear`, or `drain` may cause later fold steps to
   fail.
   Example:
   ```mbt check
   test {
     let sum = [1, 2, 3, 4, 5].fold(init=0, (sum, elem) => sum + elem) (escaped)
     @test.assert_eq(sum, 15)
   }
   ```
```

```mooncram
$ run_moon_ide moon ide doc String::length
package "moonbitlang/core/string"
#alias(charcode_length, deprecated)
pub fn String::length(String) -> Int
  Returns the number of UTF-16 code units in the string. Note that this is not
   necessarily equal to the number of Unicode characters (code points) in the
   string, as some characters may be represented by multiple UTF-16 code units.
   Parameters:
   * `string` : The string whose length is to be determined.
   Returns the number of UTF-16 code units in the string.
   Example:
   ```mbt check
   test {
     inspect("hello".length(), content="5")
     inspect("🤣".length(), content="2") // Emoji uses two UTF-16 code units
     inspect("".length(), content="0") // Empty string
   }
   ```
```

```mooncram
$ run_moon_ide moon ide doc String::split
package "moonbitlang/core/string"
pub fn String::split(String, StringView) -> Iter[StringView]
  Splits the string into all substrings separated by the given separator.
   
   If the string does not contain the separator and the separator is not empty,
   the returned iterator will contain only one element, which is the original
   string.
   
   If the separator is empty, the returned iterator will contain all the
   characters in the string as single elements.
```

```mooncram
$ run_moon_ide moon ide doc StringBuilder::new
package "moonbitlang/core/builtin"
#alias(new)
pub fn StringBuilder::StringBuilder(size_hint? : Int) -> Self
  Creates a new string builder with an optional initial capacity hint.
   Parameters:
   * `size_hint` : An optional initial capacity hint for the internal buffer. If
   less than 1, a minimum capacity of 1 is used. Defaults to 0. It is the size of bytes, 
   not the size of characters. `size_hint` may be ignored on some platforms, JS for example.
   Returns a new `StringBuilder` instance with the specified initial capacity.
// target is:

package "moonbitlang/core/builtin"
#alias(new)
pub fn StringBuilder::StringBuilder(size_hint? : Int) -> Self
  Creates a new string builder with an optional initial capacity hint.
   Parameters:
   * `size_hint` : An optional initial capacity hint for the internal buffer. If
   less than 1, a minimum capacity of 1 is used. Defaults to 0. It is the size of bytes, 
   not the size of characters. `size_hint` may be ignored on some platforms, JS for example.
   Returns a new `StringBuilder` instance with the specified initial capacity.
```

```mooncram
$ run_moon_ide moon ide doc StringBuilder::write_string
package "moonbitlang/core/builtin"
pub fn StringBuilder::write_string(Self, String) -> Unit
  Writes a string to the StringBuilder.
```

```mooncram
$ run_moon_ide moon ide doc StringBuilder::to_string
package "moonbitlang/core/builtin"
pub fn StringBuilder::to_string(Self) -> String
  Returns the current content of the StringBuilder as a string.
```

```mooncram
$ run_moon_ide moon ide doc Int::abs
package "moonbitlang/core/int"
pub fn Int::abs(Int) -> Int
  Computes the absolute value of an integer.
   Parameters:
   * `self` : The integer whose absolute value is to be computed.
   Returns the absolute value of the integer.
   Example:
   ```mbt check
   test {
     inspect(Int::abs(42), content="42")
     inspect(Int::abs(-42), content="42")
     inspect(Int::abs(0), content="0")
   }
   ```
```

```mooncram
$ run_moon_ide moon ide doc Int::to_string
package "moonbitlang/core/int"
pub fn Int::to_string(Int, radix? : Int) -> String
  Converts an integer to its string representation in the specified radix (base).
   Example:
   ```
   inspect((255).to_string(radix=16), content="ff")
   inspect((-255).to_string(radix=16), content="-ff")
   ```
```

```mooncram
$ run_moon_ide moon ide doc Option::map
package "moonbitlang/core/option"
pub fn[T, U] Option::map(T?, (T) -> U raise?) -> U? raise?
  Maps the value of an `Option` using a provided function.
   # Example
   ```mbt check
   test {
     let a = Some(5)
     @test.assert_eq(a.map(x => x * 2), Some(10))
     let b = None
     @test.assert_eq(b.map(x => x * 2), None)
   }
   ```
```

```mooncram
$ run_moon_ide moon ide doc Result::map
package "moonbitlang/core/result"
pub fn[T, E, U] Result::map(Self[T, E], (T) -> U) -> Self[U, E]
  Maps the value of a Result if it is `Ok` into another, otherwise returns the `Err` value unchanged.
   # Example
   ```mbt check
   test {
     let x : Result[Int, Unit] = Ok(6)
     let y = x.map((v : Int) => v * 7) (escaped)
     @test.assert_eq(y, Ok(42))
   }
   ```
```

```mooncram
$ run_moon_ide moon ide doc Iter::map
package "moonbitlang/core/builtin"
pub fn[X, Y] Iter::map(Self[X], (X) -> Y) -> Self[Y]
  Transforms the elements of the iterator using a mapping function.
   # Type Parameters
   - `X`: The type of the elements in the iterator.
   - `Y`: The type of the transformed elements.
   # Arguments
   * `self` - The input iterator.
   * `f` - The mapping function that transforms each element of the iterator.
   # Returns
   A new iterator that contains the transformed elements.
   # Note
   The old iterator `self` must not be used again after calling `map`.
```

```mooncram
$ run_moon_ide moon ide doc Iter::filter
package "moonbitlang/core/builtin"
pub fn[X] Iter::filter(Self[X], (X) -> Bool) -> Self[X]
  Filters the elements of the iterator based on a predicate function.
   # Type Parameters
   - `X`: The type of the elements in the iterator.
   # Arguments
   * `self` - The input iterator.
   * `f` - The predicate function that determines whether an element should be included in the filtered iterator.
   # Returns
   A new iterator that only contains the elements for which the predicate function returns `IterContinue`.
   # Note
   The old iterator `self` must not be used again after calling `filter`.
```

```mooncram
$ run_moon_ide moon ide doc Iter::to_array
package "moonbitlang/core/builtin"
#alias(collect)
pub fn[X] Iter::to_array(Self[X]) -> Array[X]
  Collects the elements of the iterator into an array.
   The old iterator `self` must not be used again.
```

```mooncram
$ run_moon_ide moon ide doc List::map
package "moonbitlang/core/list"
pub fn[A, B] List::map(Self[A], (A) -> B raise?) -> Self[B] raise?
  Maps the list.
   # Example
   ```mbt check
   test {
     @debug.assert_eq(
       @list.List([1, 2, 3, 4, 5]).map(x => x * 2),
       List([2, 4, 6, 8, 10]),
     )
   }
   ```
```

```mooncram
$ run_moon_ide moon ide doc List::from_array
package "moonbitlang/core/list"
#alias(of, deprecated)
#as_free_fn(of, deprecated)
#as_free_fn(deprecated)
#deprecated
pub fn[A] List::from_array(ArrayView[A]) -> Self[A]
  Convert array to list.
   # Example
   ```mbt check
   test {
     let ls = @list.List([1, 2, 3, 4, 5])
     @debug.assert_eq(ls, List([1, 2, 3, 4, 5]))
   }
   ```
```

```mooncram
$ run_moon_ide moon ide doc @moonbitlang/core/list.List
package "moonbitlang/core/list"
enum List[A] {
  Empty
  More(A, mut tail~ : List[A])
}
  Type `List` used by this package APIs.

  pub fn[A] List::List(ArrayView[A]) -> Self[A]
  pub fn[A] List::all(Self[A], (A) -> Bool raise?) -> Bool raise?
  pub fn[A] List::any(Self[A], (A) -> Bool raise?) -> Bool raise?
  pub fn[X : @quickcheck.Arbitrary] List::arbitrary(Int, @splitmix.RandomState) -> Self[X]
  pub fn[A : Compare] List::compare(Self[A], Self[A]) -> Int
  pub fn[A] List::concat(Self[A], Self[A]) -> Self[A]
  #as_free_fn
  pub fn[A] List::cons(A, Self[A]) -> Self[A]
  pub fn[A : Eq] List::contains(Self[A], A) -> Bool
  pub fn[X] List::default() -> Self[X]
  pub fn[A] List::drop(Self[A], Int) -> Self[A]
  pub fn[A] List::drop_while(Self[A], (A) -> Bool raise?) -> Self[A] raise?
  pub fn[A] List::each(Self[A], (A) -> Unit raise?) -> Unit raise?
  pub fn[A] List::eachi(Self[A], (Int, A) -> Unit raise?) -> Unit raise?
  pub fn[A : Eq] List::equal(Self[A], Self[A]) -> Bool
  pub fn[A] List::filter(Self[A], (A) -> Bool raise?) -> Self[A] raise?
  pub fn[A, B] List::filter_map(Self[A], (A) -> B? raise?) -> Self[B] raise?
  pub fn[A] List::find(Self[A], (A) -> Bool raise?) -> A? raise?
  pub fn[A] List::find_index(Self[A], (A) -> Bool raise?) -> Int? raise?
  pub fn[A] List::findi(Self[A], (A, Int) -> Bool raise?) -> A? raise?
  pub fn[A, B] List::flat_map(Self[A], (A) -> Self[B] raise?) -> Self[B] raise?
  pub fn[A] List::flatten(Self[Self[A]]) -> Self[A]
  pub fn[A, B] List::fold(Self[A], init~ : B, (B, A) -> B raise?) -> B raise?
  pub fn[A, B] List::foldi(Self[A], init~ : B, (Int, B, A) -> B raise?) -> B raise?
  #as_free_fn
  pub fn[A] List::from_iter(Iter[A]) -> Self[A]
  #as_free_fn
  pub fn[A] List::from_iter_rev(Iter[A]) -> Self[A]
  #as_free_fn
  pub fn[A : @json.FromJson] List::from_json(Json) -> Self[A] raise @json.JsonDecodeError
  pub fn[A : Hash] List::hash(Self[A]) -> Int
  pub fn[A : Hash] List::hash_combine(Self[A], Hasher) -> Unit
  pub fn[A] List::head(Self[A]) -> A?
  pub fn[A] List::intercalate(Self[Self[A]], Self[A]) -> Self[A]
  pub fn[A] List::intersperse(Self[A], A) -> Self[A]
  pub fn[A] List::is_empty(Self[A]) -> Bool
  pub fn[A : Eq] List::is_prefix(Self[A], Self[A]) -> Bool
  pub fn[A : Eq] List::is_suffix(Self[A], Self[A]) -> Bool
  pub fn[A] List::iter(Self[A]) -> Iter[A]
  pub fn[A] List::iter2(Self[A]) -> Iter2[Int, A]
  pub fn[A] List::last(Self[A]) -> A?
  pub fn[A] List::length(Self[A]) -> Int
  pub fn[A : Eq, B] List::lookup(Self[(A, B)], A) -> B?
  pub fn[A, B] List::map(Self[A], (A) -> B raise?) -> Self[B] raise?
  pub fn[A, B] List::mapi(Self[A], (Int, A) -> B raise?) -> Self[B] raise?
  pub fn[A : Compare] List::maximum(Self[A]) -> A?
  pub fn[A : Compare] List::minimum(Self[A]) -> A?
  #alias(empty)
  #as_free_fn(empty)
  #as_free_fn
  pub fn[A] List::new() -> Self[A]
  pub fn[A : Eq] List::not_equal(Self[A], Self[A]) -> Bool
  pub fn[A] List::nth(Self[A], Int) -> A?
  pub fn[A : Compare] List::op_ge(Self[A], Self[A]) -> Bool
  pub fn[A : Compare] List::op_gt(Self[A], Self[A]) -> Bool
  pub fn[A : Compare] List::op_le(Self[A], Self[A]) -> Bool
  pub fn[A : Compare] List::op_lt(Self[A], Self[A]) -> Bool
  #alias(add)
  pub fn[A] List::prepend(Self[A], A) -> Self[A]
  pub fn[A : Eq] List::remove(Self[A], A) -> Self[A]
  pub fn[A] List::remove_at(Self[A], Int) -> Self[A]
  #as_free_fn
  pub fn[A] List::repeat(Int, A) -> Self[A]
  pub fn[A] List::rev(Self[A]) -> Self[A]
  pub fn[A] List::rev_concat(Self[A], Self[A]) -> Self[A]
  pub fn[A, B] List::rev_map(Self[A], (A) -> B raise?) -> Self[B] raise?
  #as_free_fn
  pub fn[A, S] List::rev_unfold((S) -> (A, S)? raise?, init~ : S) -> Self[A] raise?
  pub fn[A, E] List::scan_left(Self[A], (E, A) -> E raise?, init~ : E) -> Self[E] raise?
  pub fn[A, B] List::scan_right(Self[A], (B, A) -> B raise?, init~ : B) -> Self[B] raise?
  #as_free_fn
  pub fn[A] List::singleton(A) -> Self[A]
  pub fn[A : Compare] List::sort(Self[A]) -> Self[A]
  pub fn[A] List::take(Self[A], Int) -> Self[A]
  pub fn[A] List::take_while(Self[A], (A) -> Bool raise?) -> Self[A] raise?
  pub fn[A] List::to_array(Self[A]) -> Array[A]
  pub fn[A : ToJson] List::to_json(Self[A]) -> Json
  #as_free_fn
  pub fn[A, S] List::unfold((S) -> (A, S)? raise?, init~ : S) -> Self[A] raise?
  pub fn[A] List::unsafe_tail(Self[A]) -> Self[A]
  pub fn[A, B] List::unzip(Self[(A, B)]) -> (Self[A], Self[B])
  #as_free_fn
  pub fn[A, B] List::zip(Self[A], Self[B]) -> Self[(A, B)]
  pub impl[A] Add for List[A]
  pub impl[A : Compare] Compare for List[A]
  pub impl[X] Default for List[X]
  pub impl[A : Eq] Eq for List[A]
  pub impl[A : Hash] Hash for List[A]
  #deprecated
  pub impl[A : Show] Show for List[A]
  pub impl[A : ToJson] ToJson for List[A]
  pub impl[A : @debug.Debug] @debug.Debug for List[A]
  pub impl[A : @json.FromJson] @json.FromJson for List[A]
  pub impl[X : @quickcheck.Arbitrary] @quickcheck.Arbitrary for List[X]
```

```mooncram
$ run_moon_ide moon ide doc @moonbitlang/core/hashmap.HashMap::get
package "moonbitlang/core/hashmap"
pub fn[K : Hash + Eq, V] HashMap::get(Self[K, V], K) -> V?
  Retrieves the value associated with a given key in the hash map.
   Parameters:
   * `self` : The hash map to search in.
   * `key` : The key to look up in the map.
   Returns `Some(value)` if the key exists in the map, `None` otherwise.
   Example:
   ```mbt check
   test {
     let map = @hashmap.from_array([("key", 42)])
     debug_inspect(map.get("key"), content="Some(42)")
     debug_inspect(map.get("nonexistent"), content="None")
   }
   ```
```

```mooncram
$ run_moon_ide moon ide doc @moonbitlang/core/hashmap.HashMap::map
package "moonbitlang/core/hashmap"
pub fn[K, V, V2] HashMap::map(Self[K, V], (K, V) -> V2) -> Self[K, V2]
  Applies a function to each key-value pair in the map and 
   returns a new map with the results, using the original keys.
```
