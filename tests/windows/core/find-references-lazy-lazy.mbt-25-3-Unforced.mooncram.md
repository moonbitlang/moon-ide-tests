# core find-references Unforced lazy\lazy.mbt:25:3

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\core' moon ide find-references 'Unforced' --loc 'lazy\lazy.mbt:25:3'
Found 4 references for symbol 'Unforced':
<WORKDIR>/lazy\debug.mbt:30:5-30:13:
   |   match self.state {
   |     Forced(v) => @debug.Repr::opaque_("Lazy", @debug.to_repr(v))
   |     Forcing => @debug.Repr::opaque_("Lazy", @debug.Repr::literal("forcing"))
30 |     Unforced(_) => @debug.Repr::opaque_("Lazy", @debug.Repr::omitted())
   |     ^^^^^^^^
   |   }
   | }

<WORKDIR>/lazy\lazy.mbt:25:3-25:11:
   | /// - `Forced(v)`: the thunk has produced `v`; the thunk reference is
   | ///   dropped so its captures can be reclaimed.
   | priv enum LazyState[A] {
25 |   Unforced(() -> A)
   |   ^^^^^^^^
   |   Forcing
   |   Forced(A)

<WORKDIR>/lazy\lazy.mbt:88:12-88:20:
   | /// }
   | /// ```
   | pub fn[A] Lazy::Lazy(thunk : () -> A) -> Lazy[A] {
88 |   { state: Unforced(thunk) }
   |            ^^^^^^^^
   | }
   | 

<WORKDIR>/lazy\lazy.mbt:142:5-142:13:
    |   match self.state {
    |     Forced(v) => v
    |     Forcing => abort("Lazy::force: reentrant force on the same cell")
142 |     Unforced(thunk) => {
    |     ^^^^^^^^
    |       self.state = Forcing
    |       let v = thunk()

```
