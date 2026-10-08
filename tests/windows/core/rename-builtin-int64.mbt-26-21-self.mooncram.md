# core rename self builtin\int64.mbt:26:21

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\core' moon ide rename 'self' 'self_renamed' --loc 'builtin\int64.mbt:26:21'
*** Begin Patch
*** Update File: <WORKDIR>/builtin\int64.mbt
@@
 ///   inspect(Int64(3), content="3")
 /// }
 /// ```
-pub fn Int64::Int64(self : Int64) -> Int64 = "%identity"
+pub fn Int64::Int64(self_renamed : Int64) -> Int64 = "%identity"
 
 ///|
 /// Converts a 32-bit integer (`Int`) to a 64-bit integer (`Int64`).
*** End Patch

```
