# core-project hover

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
$ run_moon_ide moon ide hover 'HashMap' --loc 'core_ide_cases.mbt:5:28'
type CoreIntArray = Array[Int]

///|
type CoreScores = @hashmap.HashMap[String, Int]
                  ^^^^^^^^^^^^^^^^
                  ```moonbit
                  #alias(T, deprecated="`T` is deprecated, use `HashMap` instead")
                  struct @hashmap.HashMap[K, V] {
                    // private fields
                  }
                  ```
                  ---
                  
                   Mutable hash map, not thread safe.
                  
                   # Example
                  
                   ```mbt check
                   test {
                     let map = @hashmap.HashMap([(3, "three"), (8, "eight"), (1, "one")])
                     assert_eq(map.get(2), None)
                     assert_eq(map.get(3), Some("three"))
                     map.set(3, "updated")
                     assert_eq(map.get(3), Some("updated"))
                   }
                   ```

///|
````

````mooncram
$ run_moon_ide moon ide hover 'List' --loc 'core_ide_cases.mbt:8:26'
type CoreScores = @hashmap.HashMap[String, Int]

///|
type CoreIntList = @list.List[Int]
                   ^^^^^^^^^^
                   ```moonbit
                   #alias(T, deprecated="`T` is deprecated, use `List` instead")
                   enum @list.List[A] {
                     Empty
                     More(A, tail~ : @list.List[A])
                   }
                   ```
                   ---
                   
                    Type `List` used by this package APIs.

///|
````

````mooncram
$ run_moon_ide moon ide hover 'map' --loc 'core_ide_cases.mbt:12:22'
///|
pub fn exercise_array_core(nums : CoreIntArray) -> Int {
  let doubled = nums.map(x => x * 2) (escaped)
                     ^^^
                     ```moonbit
                     fn[T, U] Array::map(self : Array[T], f : (T) -> U raise?) -> Array[U] raise?
                     ```
                     ---
                     
                      Maps a function over the elements of the array.
                     
                      # Example
                      ```mbt check
                      test {
                        let v = [3, 4, 5]
                        let v2 = v.map(x => x + 1) (escaped)
                        assert_eq(v2, [4, 5, 6])
                      }
                      ```
  let large = doubled.filter(x => x > 3) (escaped)
  large.fold(init=0, (sum, x) => sum + x) (escaped)
````

````mooncram
$ run_moon_ide moon ide hover 'filter' --loc 'core_ide_cases.mbt:13:23'
///|
pub fn exercise_array_core(nums : CoreIntArray) -> Int {
  let doubled = nums.map(x => x * 2) (escaped)
  let large = doubled.filter(x => x > 3) (escaped)
                      ^^^^^^
                      ```moonbit
                      fn[T] Array::filter(self : Array[T], f : (T) -> Bool raise?) -> Array[T] raise?
                      ```
                      ---
                      
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
  large.fold(init=0, (sum, x) => sum + x) (escaped)
}
````

````mooncram
$ run_moon_ide moon ide hover 'fold' --loc 'core_ide_cases.mbt:14:9'
pub fn exercise_array_core(nums : CoreIntArray) -> Int {
  let doubled = nums.map(x => x * 2) (escaped)
  let large = doubled.filter(x => x > 3) (escaped)
  large.fold(init=0, (sum, x) => sum + x) (escaped)
        ^^^^
        ```moonbit
        fn[A, B] Array::fold(self : Array[A], init~ : B, f : (B, A) -> B raise?) -> B raise?
        ```
        ---
        
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
           assert_eq(sum, 15)
         }
         ```
}

````

````mooncram
$ run_moon_ide moon ide hover 'new' --loc 'core_ide_cases.mbt:19:32'
///|
pub fn exercise_string_core(text : String) -> (Int, Array[StringView], String) {
  let builder = StringBuilder::new()
                               ^^^
                               ```moonbit
                               fn StringBuilder::new(size_hint? : Int) -> StringBuilder
                               ```
                               ---
                               
                                Creates a new string builder with an optional initial capacity hint.
                               
                                Parameters:
                               
                                * `size_hint` : An optional initial capacity hint for the internal buffer. If
                                less than 1, a minimum capacity of 1 is used. Defaults to 0. It is the size of bytes, 
                                not the size of characters. `size_hint` may be ignored on some platforms, JS for example.
                               
                                Returns a new `StringBuilder` instance with the specified initial capacity.
  builder.write_string(text)
  (text.length(), text.split(" ").to_array(), builder.to_string())
````

````mooncram
$ run_moon_ide moon ide hover 'write_string' --loc 'core_ide_cases.mbt:20:11'
///|
pub fn exercise_string_core(text : String) -> (Int, Array[StringView], String) {
  let builder = StringBuilder::new()
  builder.write_string(text)
          ^^^^^^^^^^^^
          ```moonbit
          fn Logger::write_string(self : StringBuilder, str : String) -> Unit
          ```
          ---
          
           Writes a string to the StringBuilder.
  (text.length(), text.split(" ").to_array(), builder.to_string())
}
````

````mooncram
$ run_moon_ide moon ide hover 'length' --loc 'core_ide_cases.mbt:21:9'
pub fn exercise_string_core(text : String) -> (Int, Array[StringView], String) {
  let builder = StringBuilder::new()
  builder.write_string(text)
  (text.length(), text.split(" ").to_array(), builder.to_string())
        ^^^^^^
        ```moonbit
        fn String::length(self : String) -> Int
        ```
        ---
        
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
}

````

````mooncram
$ run_moon_ide moon ide hover 'split' --loc 'core_ide_cases.mbt:21:24'
pub fn exercise_string_core(text : String) -> (Int, Array[StringView], String) {
  let builder = StringBuilder::new()
  builder.write_string(text)
  (text.length(), text.split(" ").to_array(), builder.to_string())
                       ^^^^^
                       ```moonbit
                       fn String::split(self : String, sep : StringView) -> Iter[StringView]
                       ```
                       ---
                       
                        Splits the string into all substrings separated by the given separator.
                        
                        If the string does not contain the separator and the separator is not empty,
                        the returned iterator will contain only one element, which is the original
                        string.
                        
                        If the separator is empty, the returned iterator will contain all the
                        characters in the string as single elements.
}

````

````mooncram
$ run_moon_ide moon ide hover 'to_array' --loc 'core_ide_cases.mbt:21:35'
pub fn exercise_string_core(text : String) -> (Int, Array[StringView], String) {
  let builder = StringBuilder::new()
  builder.write_string(text)
  (text.length(), text.split(" ").to_array(), builder.to_string())
                                  ^^^^^^^^
                                  ```moonbit
                                  fn[X] Iter::to_array(self : Iter[X]) -> Array[X]
                                  ```
                                  ---
                                  
                                   Collects the elements of the iterator into an array.
                                   The old iterator `self` must not be used again.
}

````

````mooncram
$ run_moon_ide moon ide hover 'abs' --loc 'core_ide_cases.mbt:26:5'
///|
pub fn exercise_int_core(n : Int) -> String {
  n.abs().to_string(radix=16)
    ^^^
    ```moonbit
    fn Int::abs(self : Int) -> Int
    ```
    ---
    
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
}

````

````mooncram
$ run_moon_ide moon ide hover 'to_string' --loc 'core_ide_cases.mbt:26:11'
///|
pub fn exercise_int_core(n : Int) -> String {
  n.abs().to_string(radix=16)
          ^^^^^^^^^
          ```moonbit
          fn Int::to_string(self : Int, radix~ : Int) -> String
          ```
          ---
          
           Converts an integer to its string representation in the specified radix (base).
           Example:
           ```
           inspect((255).to_string(radix=16), content="ff")
           inspect((-255).to_string(radix=16), content="-ff")
           ```
}

````

````mooncram
$ run_moon_ide moon ide hover 'map' --loc 'core_ide_cases.mbt:31:9'
///|
pub fn exercise_option_core(value : Int?) -> Int? {
  value.map(x => x + 1) (escaped)
        ^^^
        ```moonbit
        fn[T, U] Option::map(self : T?, f : (T) -> U raise?) -> U? raise?
        ```
        ---
        
         Maps the value of an `Option` using a provided function.
        
         # Example
        
         ```mbt check
         test {
           let a = Some(5)
           assert_eq(a.map(x => x * 2), Some(10)) (escaped)
           let b = None
           assert_eq(b.map(x => x * 2), None) (escaped)
         }
         ```
}

````

````mooncram
$ run_moon_ide moon ide hover 'map' --loc 'core_ide_cases.mbt:38:9'
pub fn exercise_result_core(
  value : Result[Int, String],
) -> Result[String, String] {
  value.map(x => x.to_string()) (escaped)
        ^^^
        ```moonbit
        fn[T, E, U] Result::map(self : Result[T, E], f : (T) -> U) -> Result[U, E]
        ```
        ---
        
         Maps the value of a Result if it is `Ok` into another, otherwise returns the `Err` value unchanged.
        
         # Example
        
         ```mbt check
         test {
           let x : Result[Int, Unit] = Ok(6)
           let y = x.map((v : Int) => v * 7) (escaped)
           assert_eq(y, Ok(42))
         }
         ```
}

````

````mooncram
$ run_moon_ide moon ide hover 'map' --loc 'core_ide_cases.mbt:43:15'
///|
pub fn exercise_iter_core(nums : Array[Int]) -> Array[String] {
  nums.iter().map(x => x.abs().to_string()).to_array() (escaped)
              ^^^
              ```moonbit
              fn[X, Y] Iter::map(self : Iter[X], f : (X) -> Y) -> Iter[Y]
              ```
              ---
              
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
}

````

````mooncram
$ run_moon_ide moon ide hover 'to_array' --loc 'core_ide_cases.mbt:43:45'
///|
pub fn exercise_iter_core(nums : Array[Int]) -> Array[String] {
  nums.iter().map(x => x.abs().to_string()).to_array() (escaped)
                                            ^^^^^^^^
                                            ```moonbit
                                            fn[X] Iter::to_array(self : Iter[X]) -> Array[X]
                                            ```
                                            ---
                                            
                                             Collects the elements of the iterator into an array.
                                             The old iterator `self` must not be used again.
}

````

````mooncram
$ run_moon_ide moon ide hover 'map' --loc 'core_ide_cases.mbt:48:6'
///|
pub fn exercise_list_core(xs : CoreIntList) -> @list.List[String] {
  xs.map(x => x.to_string()) (escaped)
     ^^^
     ```moonbit
     fn[A, B] @list.List::map(self : @list.List[A], f : (A) -> B raise?) -> @list.List[B] raise?
     ```
     ---
     
      Maps the list.
     
      # Example
     
      ```mbt check
      test {
        @debug.assert_eq(
          @list.from_array([1, 2, 3, 4, 5]).map(x => x * 2), (escaped)
          @list.from_array([2, 4, 6, 8, 10]),
        )
      }
      ```
}

````

````mooncram
$ run_moon_ide moon ide hover 'get' --loc 'core_ide_cases.mbt:53:10'
///|
pub fn exercise_hashmap_lookup(scores : CoreScores) -> Int? {
  scores.get("moon").map(x => x + 1) (escaped)
         ^^^
         ```moonbit
         fn[K : Hash + Eq, V] @hashmap.HashMap::get(self : @hashmap.HashMap[K, V], key : K) -> V?
         ```
         ---
         
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
}

````

````mooncram
$ run_moon_ide moon ide hover 'map' --loc 'core_ide_cases.mbt:53:22'
///|
pub fn exercise_hashmap_lookup(scores : CoreScores) -> Int? {
  scores.get("moon").map(x => x + 1) (escaped)
                     ^^^
                     ```moonbit
                     fn[T, U] Option::map(self : T?, f : (T) -> U raise?) -> U? raise?
                     ```
                     ---
                     
                      Maps the value of an `Option` using a provided function.
                     
                      # Example
                     
                      ```mbt check
                      test {
                        let a = Some(5)
                        assert_eq(a.map(x => x * 2), Some(10)) (escaped)
                        let b = None
                        assert_eq(b.map(x => x * 2), None) (escaped)
                      }
                      ```
}

````

````mooncram
$ run_moon_ide moon ide hover 'map' --loc 'core_ide_cases.mbt:60:10'
pub fn exercise_hashmap_map(
  scores : CoreScores,
) -> @hashmap.HashMap[String, String] {
  scores.map((key, value) => key + ":" + value.to_string()) (escaped)
         ^^^
         ```moonbit
         fn[K, V, V2] @hashmap.HashMap::map(self : @hashmap.HashMap[K, V], f : (K, V) -> V2) -> @hashmap.HashMap[K, V2]
         ```
         ---
         
          Applies a function to each key-value pair in the map and 
          returns a new map with the results, using the original keys.
}

````

````mooncram
$ run_moon_ide moon ide hover 'map' --loc 'core_ide_cases.mbt:65:13'
///|
pub fn exercise_local_map(container : Container[Int]) -> Container[String] {
  container.map(x => x.to_string()) (escaped)
            ^^^
            ```moonbit
            fn[T, U] Container::map(self : Container[T], f : (T) -> U) -> Container[U]
            ```
            ---
            
             Maps a function over the container
}

````

````mooncram
$ run_moon_ide moon ide hover 'split' --loc 'core_ide_cases.mbt:71:4'
///|
pub fn exercise_chained_core(text : String) -> Array[Int] {
  text
  .split(",")
   ^^^^^
   ```moonbit
   fn String::split(self : String, sep : StringView) -> Iter[StringView]
   ```
   ---
   
    Splits the string into all substrings separated by the given separator.
    
    If the string does not contain the separator and the separator is not empty,
    the returned iterator will contain only one element, which is the original
    string.
    
    If the separator is empty, the returned iterator will contain all the
    characters in the string as single elements.
  .map(part => part.length()) (escaped)
  .filter(length => length > 0) (escaped)
````

````mooncram
$ run_moon_ide moon ide hover 'filter' --loc 'core_ide_cases.mbt:73:4'
  text
  .split(",")
  .map(part => part.length()) (escaped)
  .filter(length => length > 0) (escaped)
   ^^^^^^
   ```moonbit
   fn[X] Iter::filter(self : Iter[X], f : (X) -> Bool) -> Iter[X]
   ```
   ---
   
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
  .to_array()
}
````

````mooncram
$ run_moon_ide moon ide hover 'from_array' --loc 'core_ide_cases.mbt:79:12'
///|
pub fn build_core_scores() -> CoreScores {
  @hashmap.from_array([("moon", 1), ("core", 2)])
  ^^^^^^^^^^^^^^^^^^^
  ```moonbit
  fn[K : Hash + Eq, V] @moonbitlang/core/hashmap.from_array(arr : ArrayView[(K, V)], capacity? : Int) -> @hashmap.HashMap[K, V]
  ```
  ---
  
   Creates a new hash map from an array of key-value pairs. Pairs with duplicate
   keys will keep the latest value, overwriting the previous ones.
   The optional `capacity` is treated as a minimum initial capacity and will be
   rounded up to the smallest power of 2 that can hold the requested capacity.
  
   Parameters:
  
   * `arr` : An array of key-value tuples. Each tuple contains a hashable and
   comparable key of type `K`, and an associated value of type `V`.
  
   Returns a new hash map containing all the key-value pairs from the input
   array.
  
   Example:
  
   ```mbt check
   test {
     let arr = [(1, "one"), (2, "two"), (1, "ONE")]
     let map = @hashmap.HashMap(arr)
     debug_inspect(map.get(1), content="Some(\"ONE\")")
     debug_inspect(map.get(2), content="Some(\"two\")")
   }
   ```
}

````
