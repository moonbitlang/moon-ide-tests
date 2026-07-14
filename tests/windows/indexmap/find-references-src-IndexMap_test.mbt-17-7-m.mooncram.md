# indexmap find-references m src\IndexMap_test.mbt:17:7

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\indexmap' moon ide find-references 'm' --loc 'src\IndexMap_test.mbt:17:7'
Found 3 references for symbol 'm':
<WORKDIR>/src\IndexMap_test.mbt:17:7-17:8:
   | 
   | ///|
   | test "new" {
17 |   let m : @IndexMap.T[Int, Int] = @IndexMap.new()
   |       ^
   |   inspect(m.capacity(), content="8")
   |   @debug.assert_eq(m.size(), 0)

<WORKDIR>/src\IndexMap_test.mbt:18:11-18:12:
   | ///|
   | test "new" {
   |   let m : @IndexMap.T[Int, Int] = @IndexMap.new()
18 |   inspect(m.capacity(), content="8")
   |           ^
   |   @debug.assert_eq(m.size(), 0)
   | }

<WORKDIR>/src\IndexMap_test.mbt:19:20-19:21:
   | test "new" {
   |   let m : @IndexMap.T[Int, Int] = @IndexMap.new()
   |   inspect(m.capacity(), content="8")
19 |   @debug.assert_eq(m.size(), 0)
   |                    ^
   | }
   | 

```
