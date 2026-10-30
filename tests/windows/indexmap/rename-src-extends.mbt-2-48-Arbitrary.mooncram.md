# indexmap rename Arbitrary src\extends.mbt:2:48

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\indexmap' moon ide rename 'Arbitrary' 'ArbitraryRenamed' --loc 'src\extends.mbt:2:48'
Error: cannot rename symbol 'Arbitrary' in package 'moonbitlang/core/quickcheck' outside of module 'kesmeey/IndexMap'
[1]
```
