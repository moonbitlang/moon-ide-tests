# core find-references LazyState lazy\lazy.mbt:24:11

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\core' moon ide find-references 'LazyState' --loc 'lazy\lazy.mbt:24:11'
Found 2 references for symbol 'LazyState':
<WORKDIR>/lazy\lazy.mbt:24:11-24:20:
   | ///   the thunk and silently break the at-most-once guarantee.
   | /// - `Forced(v)`: the thunk has produced `v`; the thunk reference is
   | ///   dropped so its captures can be reclaimed.
24 | priv enum LazyState[A] {
   |           ^^^^^^^^^
   |   Unforced(() -> A)
   |   Forcing

<WORKDIR>/lazy\lazy.mbt:68:15-68:24:
   | /// `Lazy[A]` is not thread-safe. Sharing one across threads requires
   | /// external synchronization.
   | struct Lazy[A] {
68 |   mut state : LazyState[A]
   |               ^^^^^^^^^
   | }
   | 

```
