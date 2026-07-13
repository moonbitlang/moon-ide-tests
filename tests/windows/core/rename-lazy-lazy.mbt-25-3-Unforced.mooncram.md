# core rename Unforced lazy\lazy.mbt:25:3

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\core' moon ide rename 'Unforced' 'UnforcedRenamed' --loc 'lazy\lazy.mbt:25:3'
*** Begin Patch
*** Update File: <WORKDIR>/lazy\debug.mbt
@@
   match self.state {
     Forced(v) => @debug.Repr::opaque_("Lazy", @debug.to_repr(v))
     Forcing => @debug.Repr::opaque_("Lazy", @debug.Repr::literal("forcing"))
-    Unforced(_) => @debug.Repr::opaque_("Lazy", @debug.Repr::omitted())
+    UnforcedRenamed(_) => @debug.Repr::opaque_("Lazy", @debug.Repr::omitted())
   }
 }
*** Update File: <WORKDIR>/lazy\lazy.mbt
@@
 /// - `Forced(v)`: the thunk has produced `v`; the thunk reference is
 ///   dropped so its captures can be reclaimed.
 priv enum LazyState[A] {
-  Unforced(() -> A)
+  UnforcedRenamed(() -> A)
   Forcing
   Forced(A)
 }
@@
 /// }
 /// ```
 pub fn[A] Lazy::Lazy(thunk : () -> A) -> Lazy[A] {
-  { state: Unforced(thunk) }
+  { state: UnforcedRenamed(thunk) }
 }
 
 ///|
@@
   match self.state {
     Forced(v) => v
     Forcing => abort("Lazy::force: reentrant force on the same cell")
-    Unforced(thunk) => {
+    UnforcedRenamed(thunk) => {
       self.state = Forcing
       let v = thunk()
       self.state = Forced(v)
*** End Patch

```
