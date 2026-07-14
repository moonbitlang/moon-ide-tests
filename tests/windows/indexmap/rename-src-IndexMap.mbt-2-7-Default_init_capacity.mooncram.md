# indexmap rename Default_init_capacity src\IndexMap.mbt:2:7

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\indexmap' moon ide rename 'Default_init_capacity' 'Default_init_capacityRenamed' --loc 'src\IndexMap.mbt:2:7'
*** Begin Patch
*** Update File: <WORKDIR>/src\IndexMap.mbt
@@
 ///|
-const Default_init_capacity = 8
+const Default_init_capacityRenamed = 8
 
 ///|
 fn calc_grow_threshold(capacity : Int) -> Int {
@@
 /// let map : @IndexMap.T[String, Int] = @IndexMap.new(capacity=16)
 /// inspect(map.capacity(), content="16")
 /// inspect(map.is_empty(), content="true")
-pub fn[K, V] new(capacity? : Int = Default_init_capacity) -> T[K, V] {
+pub fn[K, V] new(capacity? : Int = Default_init_capacityRenamed) -> T[K, V] {
   {
     core: {
       hash_to_idx: @hashmap.HashMap([], capacity~),
*** End Patch

```
