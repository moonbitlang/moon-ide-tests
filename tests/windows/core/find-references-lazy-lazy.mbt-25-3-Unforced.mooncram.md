# core find-references Unforced lazy\lazy.mbt:25:3

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\core' moon ide find-references 'Unforced' --loc 'lazy\lazy.mbt:25:3'
Found 3 references for symbol 'Unforced':
<WORKDIR>/lazy\debug.mbt:30:5-30:13:
   |   match self.state {
   |     Forced(v) => @debug.Repr::opaque_("Lazy", Repr(v))
   |     Forcing => @debug.Repr::opaque_("Lazy", @debug.Repr::literal("forcing"))
30 |     Unforced(_) => @debug.Repr::opaque_("Lazy", @debug.Repr::omitted())
   |     ^^^^^^^^
   |   }
   | }

<WORKDIR>/lazy\lazy.mbt:89:12-89:20:
   | /// ```
   | #owned(thunk)
   | pub fn[A] Lazy::Lazy(thunk : () -> A) -> Lazy[A] {
89 |   { state: Unforced(thunk), }
   |            ^^^^^^^^
   | }
   | 

<WORKDIR>/lazy\lazy.mbt:144:5-144:13:
    |   match self.state {
    |     Forced(v) => v
    |     Forcing => abort("Lazy::force: reentrant force on the same cell")
144 |     Unforced(thunk) => {
    |     ^^^^^^^^
    |       self.state = Forcing
    |       let v = thunk()

```
