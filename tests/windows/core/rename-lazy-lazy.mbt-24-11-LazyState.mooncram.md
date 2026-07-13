# core rename LazyState lazy\lazy.mbt:24:11

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\core' moon ide rename 'LazyState' 'LazyStateRenamed' --loc 'lazy\lazy.mbt:24:11'
*** Begin Patch
*** Update File: <WORKDIR>/lazy\lazy.mbt
@@
 ///   the thunk and silently break the at-most-once guarantee.
 /// - `Forced(v)`: the thunk has produced `v`; the thunk reference is
 ///   dropped so its captures can be reclaimed.
-priv enum LazyState[A] {
+priv enum LazyStateRenamed[A] {
   Unforced(() -> A)
   Forcing
   Forced(A)
@@
 /// `Lazy[A]` is not thread-safe. Sharing one across threads requires
 /// external synchronization.
 struct Lazy[A] {
-  mut state : LazyState[A]
+  mut state : LazyStateRenamed[A]
 }
 
 ///|
*** End Patch

```
