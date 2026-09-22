# core find-references arr builtin\exact_view_test.mbt:17:7

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\core' moon ide find-references 'arr' --loc 'builtin\exact_view_test.mbt:17:7'
Found 2 references for symbol 'arr':
<WORKDIR>/builtin\exact_view_test.mbt:21:17-21:20:
   |   let fixed : FixedArray[Int] = [1, 2, 3, 4]
   |   let ro : ReadOnlyArray[Int] = [1, 2, 3, 4]
   |   let view = [0, 1, 2, 3, 4, 5][1:5]
21 |   let mutable = arr.mut_view()
   |                 ^^^
   |   let raw = @builtin.UninitializedArray::make(4)
   |   for i in 0..<4 {

<WORKDIR>/builtin\exact_view_test.mbt:28:7-28:10:
   |   }
   |   for
   |     result in [
28 |       arr.exact_view(start=1, end=3),
   |       ^^^
   |       fixed.exact_view(start=1, end=3),
   |       ro.exact_view(start=1, end=3),

```
