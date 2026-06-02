///|
type CoreIntArray = Array[Int]

///|
type CoreScores = @hashmap.HashMap[String, Int]

///|
type CoreIntList = @list.List[Int]

///|
pub fn exercise_array_core(nums : CoreIntArray) -> Int {
  let doubled = nums.map(x => x * 2)
  let large = doubled.filter(x => x > 3)
  large.fold(init=0, (sum, x) => sum + x)
}

///|
pub fn exercise_string_core(text : String) -> (Int, Array[StringView], String) {
  let builder = StringBuilder::new()
  builder.write_string(text)
  (text.length(), text.split(" ").to_array(), builder.to_string())
}

///|
pub fn exercise_int_core(n : Int) -> String {
  n.abs().to_string(radix=16)
}

///|
pub fn exercise_option_core(value : Int?) -> Int? {
  value.map(x => x + 1)
}

///|
pub fn exercise_result_core(
  value : Result[Int, String],
) -> Result[String, String] {
  value.map(x => x.to_string())
}

///|
pub fn exercise_iter_core(nums : Array[Int]) -> Array[String] {
  nums.iter().map(x => x.abs().to_string()).to_array()
}

///|
pub fn exercise_list_core(xs : CoreIntList) -> @list.List[String] {
  xs.map(x => x.to_string())
}

///|
pub fn exercise_hashmap_lookup(scores : CoreScores) -> Int? {
  scores.get("moon").map(x => x + 1)
}

///|
pub fn exercise_hashmap_map(
  scores : CoreScores,
) -> @hashmap.HashMap[String, String] {
  scores.map((key, value) => key + ":" + value.to_string())
}

///|
pub fn exercise_local_map(container : Container[Int]) -> Container[String] {
  container.map(x => x.to_string())
}

///|
pub fn exercise_chained_core(text : String) -> Array[Int] {
  text
  .split(",")
  .map(part => part.length())
  .filter(length => length > 0)
  .to_array()
}

///|
pub fn build_core_scores() -> CoreScores {
  @hashmap.from_array([("moon", 1), ("core", 2)])
}

///|
pub fn build_core_list() -> CoreIntList {
  @list.from_array([1, 2, 3])
}
