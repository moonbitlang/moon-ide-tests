# indexmap find-references Arbitrary src\extends.mbt:2:48

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\indexmap' moon ide find-references 'Arbitrary' --loc 'src\extends.mbt:2:48'
Found 5 references for symbol 'Arbitrary':
<WORKDIR>/src\IndexMap.mbt:503:26-503:35:
    | ///
    | /// let samples : Array[@IndexMap.T[Int, String]] = @quickcheck.samples(5)
    | /// inspect(samples.length(), content="5")
503 | pub impl[K : @quickcheck.Arbitrary + Hash + Eq, V : @quickcheck.Arbitrary] @quickcheck.Arbitrary for T[
    |                          ^^^^^^^^^
    |   K,
    |   V,

<WORKDIR>/src\IndexMap.mbt:503:65-503:74:
    | ///
    | /// let samples : Array[@IndexMap.T[Int, String]] = @quickcheck.samples(5)
    | /// inspect(samples.length(), content="5")
503 | pub impl[K : @quickcheck.Arbitrary + Hash + Eq, V : @quickcheck.Arbitrary] @quickcheck.Arbitrary for T[
    |                                                                 ^^^^^^^^^
    |   K,
    |   V,

<WORKDIR>/src\IndexMap.mbt:503:88-503:97:
    | ///
    | /// let samples : Array[@IndexMap.T[Int, String]] = @quickcheck.samples(5)
    | /// inspect(samples.length(), content="5")
503 | pub impl[K : @quickcheck.Arbitrary + Hash + Eq, V : @quickcheck.Arbitrary] @quickcheck.Arbitrary for T[
    |                                                                                        ^^^^^^^^^
    |   K,
    |   V,

<WORKDIR>/src\IndexMap.mbt:508:16-508:25:
    |   V,
    | ] with fn arbitrary(size, rs) {
    |   let m = new()
508 |   (@quickcheck.Arbitrary::arbitrary(size, rs) : Iter[(K, V)]).each(fn(kv) {
    |                ^^^^^^^^^
    |     let (k, v) = kv
    |     m.set(k, v)

<WORKDIR>/src\extends.mbt:2:48-2:57:
  | ///|
2 | pub extend T with @moonbitlang/core/quickcheck.Arbitrary::{arbitrary}
  |                                                ^^^^^^^^^
  | 
  | ///|

```
