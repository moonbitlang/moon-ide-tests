# core find-references fixed builtin\exact_view_test.mbt:18:7

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\core' moon ide find-references 'fixed' --loc 'builtin\exact_view_test.mbt:18:7'
Found 1 references for symbol 'fixed':
<WORKDIR>/builtin\exact_view_test.mbt:29:7-29:12:
   |   for
   |     result in [
   |       arr.exact_view(start=1, end=3),
29 |       fixed.exact_view(start=1, end=3),
   |       ^^^^^
   |       ro.exact_view(start=1, end=3),
   |       view.exact_view(start=1, end=3),

```
