# indexmap rename m src\IndexMap_test.mbt:17:7

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\indexmap' moon ide rename 'm' 'm_renamed' --loc 'src\IndexMap_test.mbt:17:7'
*** Begin Patch
*** Update File: <WORKDIR>/src\IndexMap_test.mbt
@@
 
 ///|
 test "new" {
-  let m : @IndexMap.T[Int, Int] = @IndexMap.new()
+  let m_renamed : @IndexMap.T[Int, Int] = @IndexMap.new()
-  inspect(m.capacity(), content="8")
+  inspect(m_renamed.capacity(), content="8")
-  @debug.assert_eq(m.size(), 0)
+  @debug.assert_eq(m_renamed.size(), 0)
 }
 
 ///|
*** End Patch

```
