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
Found 1 references for symbol 'map':
<WORKDIR>/core_ide_cases.mbt:12:22-12:25:
   | 
   | ///|
   | pub fn exercise_array_core(nums : CoreIntArray) -> Int {
12 |   let doubled = nums.map(x => x * 2)
   |                      ^^^
   |   let large = doubled.filter(x => x > 3)
   |   large.fold(init=0, (sum, x) => sum + x)

```

```mooncram
$ run_moon_ide moon ide find-references 'filter' --loc 'core_ide_cases.mbt:13:23'
Found 1 references for symbol 'filter':
<WORKDIR>/core_ide_cases.mbt:13:23-13:29:
   | ///|
   | pub fn exercise_array_core(nums : CoreIntArray) -> Int {
   |   let doubled = nums.map(x => x * 2)
13 |   let large = doubled.filter(x => x > 3)
   |                       ^^^^^^
   |   large.fold(init=0, (sum, x) => sum + x)
   | }

```

```mooncram
$ run_moon_ide moon ide find-references 'fold' --loc 'core_ide_cases.mbt:14:9'
Found 1 references for symbol 'fold':
<WORKDIR>/core_ide_cases.mbt:14:9-14:13:
   | pub fn exercise_array_core(nums : CoreIntArray) -> Int {
   |   let doubled = nums.map(x => x * 2)
   |   let large = doubled.filter(x => x > 3)
14 |   large.fold(init=0, (sum, x) => sum + x)
   |         ^^^^
   | }
   | 

```

```mooncram
$ run_moon_ide moon ide find-references 'length' --loc 'core_ide_cases.mbt:21:9'
Found 1 references for symbol 'length':
<WORKDIR>/core_ide_cases.mbt:21:9-21:15:
   | pub fn exercise_string_core(text : String) -> (Int, Array[StringView], String) {
   |   let builder = StringBuilder::new()
   |   builder.write_string(text)
21 |   (text.length(), text.split(" ").to_array(), builder.to_string())
   |         ^^^^^^
   | }
   | 

```

```mooncram
$ run_moon_ide moon ide find-references 'split' --loc 'core_ide_cases.mbt:21:24'
Found 2 references for symbol 'split':
<WORKDIR>/core_ide_cases.mbt:21:24-21:29:
   | pub fn exercise_string_core(text : String) -> (Int, Array[StringView], String) {
   |   let builder = StringBuilder::new()
   |   builder.write_string(text)
21 |   (text.length(), text.split(" ").to_array(), builder.to_string())
   |                        ^^^^^
   | }
   | 

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
Found 4 references for symbol 'abs':
<WORKDIR>/core_ide_cases.mbt:26:5-26:8:
   | 
   | ///|
   | pub fn exercise_int_core(n : Int) -> String {
26 |   n.abs().to_string(radix=16)
   |     ^^^
   | }
   | 

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
Found 6 references for symbol 'to_string':
<WORKDIR>/core_ide_cases.mbt:26:11-26:20:
   | 
   | ///|
   | pub fn exercise_int_core(n : Int) -> String {
26 |   n.abs().to_string(radix=16)
   |           ^^^^^^^^^
   | }
   | 

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
Found 2 references for symbol 'map':
<WORKDIR>/core_ide_cases.mbt:31:9-31:12:
   | 
   | ///|
   | pub fn exercise_option_core(value : Int?) -> Int? {
31 |   value.map(x => x + 1)
   |         ^^^
   | }
   | 

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
Found 1 references for symbol 'map':
<WORKDIR>/core_ide_cases.mbt:38:9-38:12:
   | pub fn exercise_result_core(
   |   value : Result[Int, String],
   | ) -> Result[String, String] {
38 |   value.map(x => x.to_string())
   |         ^^^
   | }
   | 

```

```mooncram
$ run_moon_ide moon ide find-references 'map' --loc 'core_ide_cases.mbt:43:15'
Found 2 references for symbol 'map':
<WORKDIR>/core_ide_cases.mbt:43:15-43:18:
   | 
   | ///|
   | pub fn exercise_iter_core(nums : Array[Int]) -> Array[String] {
43 |   nums.iter().map(x => x.abs().to_string()).to_array()
   |               ^^^
   | }
   | 

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
Found 1 references for symbol 'map':
<WORKDIR>/core_ide_cases.mbt:48:6-48:9:
   | 
   | ///|
   | pub fn exercise_list_core(xs : CoreIntList) -> @list.List[String] {
48 |   xs.map(x => x.to_string())
   |      ^^^
   | }
   | 

```

```mooncram
$ run_moon_ide moon ide find-references 'get' --loc 'core_ide_cases.mbt:53:10'
Found 1 references for symbol 'get':
<WORKDIR>/core_ide_cases.mbt:53:10-53:13:
   | 
   | ///|
   | pub fn exercise_hashmap_lookup(scores : CoreScores) -> Int? {
53 |   scores.get("moon").map(x => x + 1)
   |          ^^^
   | }
   | 

```

```mooncram
$ run_moon_ide moon ide find-references 'map' --loc 'core_ide_cases.mbt:60:10'
Found 1 references for symbol 'map':
<WORKDIR>/core_ide_cases.mbt:60:10-60:13:
   | pub fn exercise_hashmap_map(
   |   scores : CoreScores,
   | ) -> @hashmap.HashMap[String, String] {
60 |   scores.map((key, value) => key + ":" + value.to_string())
   |          ^^^
   | }
   | 

```

```mooncram
$ run_moon_ide moon ide find-references 'map' --loc 'core_ide_cases.mbt:65:13'
Found 1 references for symbol 'map':
<WORKDIR>/core_ide_cases.mbt:65:13-65:16:
   |  (escaped)
   | ///| (escaped)
   | pub fn exercise_local_map(container : Container[Int]) -> Container[String] { (escaped)
65 |   container.map(x => x.to_string()) (escaped)
   |             ^^^ (escaped)
   | } (escaped)
   |  (escaped)

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
Found 1 references for symbol 'from_array':
<WORKDIR>/core_ide_cases.mbt:79:12-79:22:
   | 
   | ///|
   | pub fn build_core_scores() -> CoreScores {
79 |   @hashmap.from_array([("moon", 1), ("core", 2)])
   |            ^^^^^^^^^^
   | }
   | 

```

```mooncram
$ run_moon_ide moon ide find-references 'from_array' --loc 'core_ide_cases.mbt:84:9'
Found 1 references for symbol 'from_array':
<WORKDIR>/core_ide_cases.mbt:84:9-84:19:
   | 
   | ///|
   | pub fn build_core_list() -> CoreIntList {
84 |   @list.from_array([1, 2, 3])
   |         ^^^^^^^^^^
   | }

```
