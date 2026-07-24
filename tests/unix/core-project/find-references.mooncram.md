# core-project find-references

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
$ run_moon_ide moon ide find-references 'map' --loc 'core_ide_cases.mbt:12:22'
Found 3 references for symbol 'map':
<MOON_HOME>/lib/core/builtin/array.mbt:593:21-593:24:
    | /// } (escaped)
    | /// ``` (escaped)
    | #locals(f) (escaped)
593 | pub fn[T, U] Array::map(
    |                     ^^^ (escaped)
    |   self : Array[T], (escaped)
    |   f : (T) -> U raise?, (escaped)

<WORKDIR>/core_ide_cases.mbt:12:22-12:25:
   |  (escaped)
   | ///| (escaped)
   | pub fn exercise_array_core(nums : CoreIntArray) -> Int { (escaped)
12 |   let doubled = nums.map(x => x * 2) (escaped)
   |                      ^^^ (escaped)
   |   let large = doubled.filter(x => x > 3) (escaped)
   |   large.fold(init=0, (sum, x) => sum + x) (escaped)

<WORKDIR>/test_project_test.mbt:3:31-3:34:
  | ///| (escaped)
  | test "fib" { (escaped)
3 |   let array = [1, 2, 3, 4, 5].map(fib) (escaped)
  |                               ^^^ (escaped)
  |  (escaped)
  |   // `inspect` is used to check the output of the function (escaped)

```

```mooncram
$ run_moon_ide moon ide find-references 'filter' --loc 'core_ide_cases.mbt:13:23'
Found 2 references for symbol 'filter':
<MOON_HOME>/lib/core/builtin/array.mbt:697:18-697:24:
    | /// } (escaped)
    | /// ``` (escaped)
    | #locals(f) (escaped)
697 | pub fn[T] Array::filter(
    |                  ^^^^^^ (escaped)
    |   self : Array[T], (escaped)
    |   f : (T) -> Bool raise?, (escaped)

<WORKDIR>/core_ide_cases.mbt:13:23-13:29:
   | ///| (escaped)
   | pub fn exercise_array_core(nums : CoreIntArray) -> Int { (escaped)
   |   let doubled = nums.map(x => x * 2) (escaped)
13 |   let large = doubled.filter(x => x > 3) (escaped)
   |                       ^^^^^^ (escaped)
   |   large.fold(init=0, (sum, x) => sum + x) (escaped)
   | } (escaped)

```

```mooncram
$ run_moon_ide moon ide find-references 'fold' --loc 'core_ide_cases.mbt:14:9'
Found 2 references for symbol 'fold':
<MOON_HOME>/lib/core/builtin/array.mbt:1338:21-1338:25:
     | /// ``` (escaped)
     | #locals(f) (escaped)
     | #alias(fold_left, deprecated) (escaped)
1338 | pub fn[A, B] Array::fold(
     |                     ^^^^ (escaped)
     |   self : Array[A], (escaped)
     |   init~ : B, (escaped)

<WORKDIR>/core_ide_cases.mbt:14:9-14:13:
   | pub fn exercise_array_core(nums : CoreIntArray) -> Int { (escaped)
   |   let doubled = nums.map(x => x * 2) (escaped)
   |   let large = doubled.filter(x => x > 3) (escaped)
14 |   large.fold(init=0, (sum, x) => sum + x) (escaped)
   |         ^^^^ (escaped)
   | } (escaped)
   |  (escaped)

```

```mooncram
$ run_moon_ide moon ide find-references 'length' --loc 'core_ide_cases.mbt:21:9'
Found 2 references for symbol 'length':
<MOON_HOME>/lib/core/builtin/intrinsics.mbt:1735:16-1735:22:
     | /// } (escaped)
     | /// ``` (escaped)
     | #alias(charcode_length, deprecated) (escaped)
1735 | pub fn String::length(self : String) -> Int = "%string_length"
     |                ^^^^^^ (escaped)
     |  (escaped)
     | ///| (escaped)

<WORKDIR>/core_ide_cases.mbt:21:9-21:15:
   | pub fn exercise_string_core(text : String) -> (Int, Array[StringView], String) { (escaped)
   |   let builder = StringBuilder::new() (escaped)
   |   builder.write_string(text) (escaped)
21 |   (text.length(), text.split(" ").to_array(), builder.to_string()) (escaped)
   |         ^^^^^^ (escaped)
   | } (escaped)
   |  (escaped)

```

```mooncram
$ run_moon_ide moon ide find-references 'split' --loc 'core_ide_cases.mbt:21:24'
Found 3 references for symbol 'split':
<MOON_HOME>/lib/core/builtin/string_methods.mbt:1168:16-1168:21:
     | ///  (escaped)
     | /// If the separator is empty, the returned iterator will contain all the (escaped)
     | /// characters in the string as single elements. (escaped)
1168 | pub fn String::split(self : String, sep : StringView) -> Iter[StringView] {
     |                ^^^^^ (escaped)
     |   self[:].split(sep) (escaped)
     | } (escaped)

<WORKDIR>/core_ide_cases.mbt:21:24-21:29:
   | pub fn exercise_string_core(text : String) -> (Int, Array[StringView], String) { (escaped)
   |   let builder = StringBuilder::new() (escaped)
   |   builder.write_string(text) (escaped)
21 |   (text.length(), text.split(" ").to_array(), builder.to_string()) (escaped)
   |                        ^^^^^ (escaped)
   | } (escaped)
   |  (escaped)

<WORKDIR>/core_ide_cases.mbt:71:4-71:9:
   | ///| (escaped)
   | pub fn exercise_chained_core(text : String) -> Array[Int] { (escaped)
   |   text (escaped)
71 |   .split(",") (escaped)
   |    ^^^^^ (escaped)
   |   .map(part => part.length()) (escaped)
   |   .filter(length => length > 0) (escaped)

```

```mooncram
$ run_moon_ide moon ide find-references 'abs' --loc 'core_ide_cases.mbt:26:5'
Found 5 references for symbol 'abs':
<MOON_HOME>/lib/core/builtin/int.mbt:176:13-176:16:
    | ///   inspect(Int::abs(0), content="0") (escaped)
    | /// } (escaped)
    | /// ``` (escaped)
176 | pub fn Int::abs(self : Int) -> Int { (escaped)
    |             ^^^ (escaped)
    |   if self < 0 { (escaped)
    |     -self (escaped)

<WORKDIR>/core_ide_cases.mbt:26:5-26:8:
   |  (escaped)
   | ///| (escaped)
   | pub fn exercise_int_core(n : Int) -> String { (escaped)
26 |   n.abs().to_string(radix=16) (escaped)
   |     ^^^ (escaped)
   | } (escaped)
   |  (escaped)

<WORKDIR>/core_ide_cases.mbt:43:26-43:29:
   |  (escaped)
   | ///| (escaped)
   | pub fn exercise_iter_core(nums : Array[Int]) -> Array[String] { (escaped)
43 |   nums.iter().map(x => x.abs().to_string()).to_array() (escaped)
   |                          ^^^ (escaped)
   | } (escaped)
   |  (escaped)

<WORKDIR>/types.mbt:23:10-23:13:
   | ///| (escaped)
   | /// Calculates the Manhattan distance from origin (escaped)
   | pub fn Point::distance_from_origin(self : Point) -> Int { (escaped)
23 |   self.x.abs() + self.y.abs() (escaped)
   |          ^^^ (escaped)
   | } (escaped)
   |  (escaped)

<WORKDIR>/types.mbt:23:25-23:28:
   | ///| (escaped)
   | /// Calculates the Manhattan distance from origin (escaped)
   | pub fn Point::distance_from_origin(self : Point) -> Int { (escaped)
23 |   self.x.abs() + self.y.abs() (escaped)
   |                         ^^^ (escaped)
   | } (escaped)
   |  (escaped)

```

```mooncram
$ run_moon_ide moon ide find-references 'to_string' --loc 'core_ide_cases.mbt:26:11'
Found 7 references for symbol 'to_string':
<MOON_HOME>/lib/core/builtin/to_string.mbt:210:13-210:22:
    | /// inspect((-255).to_string(radix=16), content="-ff") (escaped)
    | /// ``` (escaped)
    | #cfg(not(target="js")) (escaped)
210 | pub fn Int::to_string(self : Int, radix? : Int = 10) -> String { (escaped)
    |             ^^^^^^^^^ (escaped)
    |   // Validate radix (escaped)
    |   if radix < 2 || radix > 36 { (escaped)

<WORKDIR>/core_ide_cases.mbt:26:11-26:20:
   |  (escaped)
   | ///| (escaped)
   | pub fn exercise_int_core(n : Int) -> String { (escaped)
26 |   n.abs().to_string(radix=16) (escaped)
   |           ^^^^^^^^^ (escaped)
   | } (escaped)
   |  (escaped)

<WORKDIR>/core_ide_cases.mbt:38:20-38:29:
   | pub fn exercise_result_core( (escaped)
   |   value : Result[Int, String], (escaped)
   | ) -> Result[String, String] { (escaped)
38 |   value.map(x => x.to_string()) (escaped)
   |                    ^^^^^^^^^ (escaped)
   | } (escaped)
   |  (escaped)

<WORKDIR>/core_ide_cases.mbt:43:32-43:41:
   |  (escaped)
   | ///| (escaped)
   | pub fn exercise_iter_core(nums : Array[Int]) -> Array[String] { (escaped)
43 |   nums.iter().map(x => x.abs().to_string()).to_array() (escaped)
   |                                ^^^^^^^^^ (escaped)
   | } (escaped)
   |  (escaped)

<WORKDIR>/core_ide_cases.mbt:48:17-48:26:
   |  (escaped)
   | ///| (escaped)
   | pub fn exercise_list_core(xs : CoreIntList) -> @list.List[String] { (escaped)
48 |   xs.map(x => x.to_string()) (escaped)
   |                 ^^^^^^^^^ (escaped)
   | } (escaped)
   |  (escaped)

<WORKDIR>/core_ide_cases.mbt:60:48-60:57:
   | pub fn exercise_hashmap_map( (escaped)
   |   scores : CoreScores, (escaped)
   | ) -> @hashmap.HashMap[String, String] { (escaped)
60 |   scores.map((key, value) => key + ":" + value.to_string()) (escaped)
   |                                                ^^^^^^^^^ (escaped)
   | } (escaped)
   |  (escaped)

<WORKDIR>/core_ide_cases.mbt:65:24-65:33:
   |  (escaped)
   | ///| (escaped)
   | pub fn exercise_local_map(container : Container[Int]) -> Container[String] { (escaped)
65 |   container.map(x => x.to_string()) (escaped)
   |                        ^^^^^^^^^ (escaped)
   | } (escaped)
   |  (escaped)

```

```mooncram
$ run_moon_ide moon ide find-references 'map' --loc 'core_ide_cases.mbt:31:9'
Found 3 references for symbol 'map':
<MOON_HOME>/lib/core/builtin/option.mbt:132:22-132:25:
    | ///   @test.assert_eq(b.map(x => x * 2), None)
    | /// } (escaped)
    | /// ``` (escaped)
132 | pub fn[T, U] Option::map(self : T?, f : (T) -> U raise?) -> U? raise? { (escaped)
    |                      ^^^ (escaped)
    |   match self { (escaped)
    |     Some(t) => Some(f(t)) (escaped)

<WORKDIR>/core_ide_cases.mbt:31:9-31:12:
   |  (escaped)
   | ///| (escaped)
   | pub fn exercise_option_core(value : Int?) -> Int? { (escaped)
31 |   value.map(x => x + 1) (escaped)
   |         ^^^ (escaped)
   | } (escaped)
   |  (escaped)

<WORKDIR>/core_ide_cases.mbt:53:22-53:25:
   |  (escaped)
   | ///| (escaped)
   | pub fn exercise_hashmap_lookup(scores : CoreScores) -> Int? { (escaped)
53 |   scores.get("moon").map(x => x + 1) (escaped)
   |                      ^^^ (escaped)
   | } (escaped)
   |  (escaped)

```

```mooncram
$ run_moon_ide moon ide find-references 'map' --loc 'core_ide_cases.mbt:38:9'
Found 2 references for symbol 'map':
<MOON_HOME>/lib/core/builtin/result.mbt:27:25-27:28:
   | ///   @test.assert_eq(y, Ok(42))
   | /// } (escaped)
   | /// ``` (escaped)
27 | pub fn[T, E, U] Result::map(self : Result[T, E], f : (T) -> U) -> Result[U, E] { (escaped)
   |                         ^^^ (escaped)
   |   match self { (escaped)
   |     Ok(value) => Ok(f(value)) (escaped)

<WORKDIR>/core_ide_cases.mbt:38:9-38:12:
   | pub fn exercise_result_core( (escaped)
   |   value : Result[Int, String], (escaped)
   | ) -> Result[String, String] { (escaped)
38 |   value.map(x => x.to_string()) (escaped)
   |         ^^^ (escaped)
   | } (escaped)
   |  (escaped)

```

```mooncram
$ run_moon_ide moon ide find-references 'map' --loc 'core_ide_cases.mbt:43:15'
Found 3 references for symbol 'map':
<MOON_HOME>/lib/core/builtin/iterator.mbt:360:20-360:23:
    | /// (escaped)
    | /// # Note (escaped)
    | /// The old iterator `self` must not be used again after calling `map`. (escaped)
360 | pub fn[X, Y] Iter::map(self : Iter[X], f : (X) -> Y) -> Iter[Y] {
    |                    ^^^ (escaped)
    |   { (escaped)
    |     f: fn() { (escaped)

<WORKDIR>/core_ide_cases.mbt:43:15-43:18:
   |  (escaped)
   | ///| (escaped)
   | pub fn exercise_iter_core(nums : Array[Int]) -> Array[String] { (escaped)
43 |   nums.iter().map(x => x.abs().to_string()).to_array() (escaped)
   |               ^^^ (escaped)
   | } (escaped)
   |  (escaped)

<WORKDIR>/core_ide_cases.mbt:72:4-72:7:
   | pub fn exercise_chained_core(text : String) -> Array[Int] { (escaped)
   |   text (escaped)
   |   .split(",") (escaped)
72 |   .map(part => part.length()) (escaped)
   |    ^^^ (escaped)
   |   .filter(length => length > 0) (escaped)
   |   .to_array() (escaped)

```

```mooncram
$ run_moon_ide moon ide find-references 'map' --loc 'core_ide_cases.mbt:48:6'
Found 2 references for symbol 'map':
<MOON_HOME>/lib/core/list/list.mbt:276:20-276:23:
    | /// } (escaped)
    | /// ``` (escaped)
    | #locals(f) (escaped)
276 | pub fn[A, B] List::map(self : List[A], f : (A) -> B raise?) -> List[B] raise? {
    |                    ^^^ (escaped)
    |   match self { (escaped)
    |     Empty => Empty (escaped)

<WORKDIR>/core_ide_cases.mbt:48:6-48:9:
   |  (escaped)
   | ///| (escaped)
   | pub fn exercise_list_core(xs : CoreIntList) -> @list.List[String] { (escaped)
48 |   xs.map(x => x.to_string()) (escaped)
   |      ^^^ (escaped)
   | } (escaped)
   |  (escaped)

```

```mooncram
$ run_moon_ide moon ide find-references 'get' --loc 'core_ide_cases.mbt:53:10'
Found 2 references for symbol 'get':
<MOON_HOME>/lib/core/hashmap/hashmap.mbt:205:35-205:38:
    | ///   debug_inspect(map.get("nonexistent"), content="None") (escaped)
    | /// } (escaped)
    | /// ``` (escaped)
205 | pub fn[K : Hash + Eq, V] HashMap::get(self : HashMap[K, V], key : K) -> V? { (escaped)
    |                                   ^^^ (escaped)
    |   // self.get_with_hash(key, key.hash()) (escaped)
    |   let hash = key.hash() (escaped)

<WORKDIR>/core_ide_cases.mbt:53:10-53:13:
   |  (escaped)
   | ///| (escaped)
   | pub fn exercise_hashmap_lookup(scores : CoreScores) -> Int? { (escaped)
53 |   scores.get("moon").map(x => x + 1) (escaped)
   |          ^^^ (escaped)
   | } (escaped)
   |  (escaped)

```

```mooncram
$ run_moon_ide moon ide find-references 'map' --loc 'core_ide_cases.mbt:60:10'
Found 2 references for symbol 'map':
<MOON_HOME>/lib/core/hashmap/hashmap.mbt:820:27-820:30:
    | ///| (escaped)
    | /// Applies a function to each key-value pair in the map and  (escaped)
    | /// returns a new map with the results, using the original keys. (escaped)
820 | pub fn[K, V, V2] HashMap::map(
    |                           ^^^ (escaped)
    |   self : HashMap[K, V], (escaped)
    |   f : (K, V) -> V2, (escaped)

<WORKDIR>/core_ide_cases.mbt:60:10-60:13:
   | pub fn exercise_hashmap_map( (escaped)
   |   scores : CoreScores, (escaped)
   | ) -> @hashmap.HashMap[String, String] { (escaped)
60 |   scores.map((key, value) => key + ":" + value.to_string()) (escaped)
   |          ^^^ (escaped)
   | } (escaped)
   |  (escaped)

```

```mooncram
$ run_moon_ide moon ide find-references 'map' --loc 'core_ide_cases.mbt:65:13'
Found 2 references for symbol 'map':
<WORKDIR>/core_ide_cases.mbt:65:13-65:16:
   |  (escaped)
   | ///| (escaped)
   | pub fn exercise_local_map(container : Container[Int]) -> Container[String] { (escaped)
65 |   container.map(x => x.to_string()) (escaped)
   |             ^^^ (escaped)
   | } (escaped)
   |  (escaped)

<WORKDIR>/types.mbt:41:25-41:28:
   |  (escaped)
   | ///| (escaped)
   | /// Maps a function over the container (escaped)
41 | pub fn[T, U] Container::map(self : Container[T], f : (T) -> U) -> Container[U] { (escaped)
   |                         ^^^ (escaped)
   |   match self { (escaped)
   |     Empty => Empty (escaped)

```

```mooncram
$ run_moon_ide moon ide find-references 'List' --loc 'tuple_type_bug.mbt:3:19'
Found 3 references for symbol 'List':
<WORKDIR>/core_ide_cases.mbt:8:26-8:30:
  | type CoreScores = @hashmap.HashMap[String, Int] (escaped)
  |  (escaped)
  | ///| (escaped)
8 | type CoreIntList = @list.List[Int] (escaped)
  |                          ^^^^ (escaped)
  |  (escaped)
  | ///| (escaped)

<WORKDIR>/core_ide_cases.mbt:47:54-47:58:
   | } (escaped)
   |  (escaped)
   | ///| (escaped)
47 | pub fn exercise_list_core(xs : CoreIntList) -> @list.List[String] { (escaped)
   |                                                      ^^^^ (escaped)
   |   xs.map(x => x.to_string()) (escaped)
   | } (escaped)

<WORKDIR>/tuple_type_bug.mbt:3:19-3:23:
  | type Hello = (Int, String) (escaped)
  |  (escaped)
3 | type Heyx = @list.List[Int] (escaped)
  |                   ^^^^ (escaped)
  |  (escaped)
  | fn hello(x : Hello, y : Heyx ) -> Int { (escaped)

```

```mooncram
$ run_moon_ide moon ide find-references 'HashMap' --loc 'core_ide_cases.mbt:5:28'
Found 2 references for symbol 'HashMap':
<WORKDIR>/core_ide_cases.mbt:5:28-5:35:
  | type CoreIntArray = Array[Int] (escaped)
  |  (escaped)
  | ///| (escaped)
5 | type CoreScores = @hashmap.HashMap[String, Int] (escaped)
  |                            ^^^^^^^ (escaped)
  |  (escaped)
  | ///| (escaped)

<WORKDIR>/core_ide_cases.mbt:59:15-59:22:
   | ///| (escaped)
   | pub fn exercise_hashmap_map( (escaped)
   |   scores : CoreScores, (escaped)
59 | ) -> @hashmap.HashMap[String, String] { (escaped)
   |               ^^^^^^^ (escaped)
   |   scores.map((key, value) => key + ":" + value.to_string()) (escaped)
   | } (escaped)

```

```mooncram
$ run_moon_ide moon ide find-references 'from_array' --loc 'core_ide_cases.mbt:79:12'
Found 2 references for symbol 'from_array':
<MOON_HOME>/lib/core/hashmap/hashmap.mbt:59:13-59:23:
   | /// } (escaped)
   | /// ``` (escaped)
   | #alias(from_array) (escaped)
59 | #as_free_fn(from_array) (escaped)
   |             ^^^^^^^^^^ (escaped)
   | #alias(of, deprecated="Use from_array instead") (escaped)
   | #as_free_fn(of, deprecated="Use from_array instead") (escaped)

<WORKDIR>/core_ide_cases.mbt:79:12-79:22:
   |  (escaped)
   | ///| (escaped)
   | pub fn build_core_scores() -> CoreScores { (escaped)
79 |   @hashmap.from_array([("moon", 1), ("core", 2)]) (escaped)
   |            ^^^^^^^^^^ (escaped)
   | } (escaped)
   |  (escaped)

```

```mooncram
$ run_moon_ide moon ide find-references 'from_array' --loc 'core_ide_cases.mbt:84:9'
Found 2 references for symbol 'from_array':
<MOON_HOME>/lib/core/list/list.mbt:170:17-170:27:
    | #alias(of, deprecated="Use @list.List([...]) instead")
    | #as_free_fn(of, deprecated="Use @list.List([...]) instead")
    | #deprecated("Use @list.List([...]) instead")
170 | pub fn[A] List::from_array(arr : ArrayView[A]) -> List[A] {
    |                 ^^^^^^^^^^ (escaped)
    |   for i = arr.length() - 1, list = Empty; i >= 0; { (escaped)
    |     continue i - 1, More(arr[i], tail=list) (escaped)

<WORKDIR>/core_ide_cases.mbt:84:9-84:19:
   |  (escaped)
   | ///| (escaped)
   | pub fn build_core_list() -> CoreIntList { (escaped)
84 |   @list.from_array([1, 2, 3]) (escaped)
   |         ^^^^^^^^^^ (escaped)
   | } (escaped)

```
