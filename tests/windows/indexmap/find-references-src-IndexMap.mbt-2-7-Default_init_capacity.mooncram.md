# indexmap find-references Default_init_capacity src\IndexMap.mbt:2:7

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\indexmap' moon ide find-references 'Default_init_capacity' --loc 'src\IndexMap.mbt:2:7'
Found 2 references for symbol 'Default_init_capacity':
<WORKDIR>/src\IndexMap.mbt:2:7-2:28:
  | ///|
2 | const Default_init_capacity = 8
  |       ^^^^^^^^^^^^^^^^^^^^^
  | 
  | ///|

<WORKDIR>/src\IndexMap.mbt:27:36-27:57:
   | /// let map : @IndexMap.T[String, Int] = @IndexMap.new(capacity=16)
   | /// inspect(map.capacity(), content="16")
   | /// inspect(map.is_empty(), content="true")
27 | pub fn[K, V] new(capacity? : Int = Default_init_capacity) -> T[K, V] {
   |                                    ^^^^^^^^^^^^^^^^^^^^^
   |   {
   |     core: {

```
