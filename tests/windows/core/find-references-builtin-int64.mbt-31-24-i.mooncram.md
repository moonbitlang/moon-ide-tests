# core find-references i builtin\int64.mbt:31:24

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\core' moon ide find-references 'i' --loc 'builtin\int64.mbt:31:24'
Found 2 references for symbol 'i':
<WORKDIR>/builtin\int64.mbt:31:24-31:25:
   | ///   inspect(Int64::from_int(42), content="42")
   | /// }
   | /// ```
31 | pub fn Int64::from_int(i : Int) -> Int64 {
   |                        ^
   |   i.to_int64()
   | }

<WORKDIR>/builtin\int64.mbt:96:24-96:28:
   | 
   | ///|
   | pub impl Hash for Int64 with fn hash_combine(self, hasher) {
96 |   hasher.combine_int64(self)
   |                        ^^^^
   | }
   | 

```
