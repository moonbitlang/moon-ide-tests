# rabbita rename Val rabbita/deprecated.mbt:6:23

```mooncram
$ export MOON_HOME="${MOON_HOME:-$HOME/.moon}"
```

```mooncram
$ export TEST_REPO_ROOT="$(cd "$TESTDIR/../../../fixtures/repos/rabbita" && pwd)"
```

```mooncram
$ normalize_moon_ide_output() { sed -e "s|$TEST_REPO_ROOT|<WORKDIR>|g" -e "s|$MOON_HOME|<MOON_HOME>|g"; }
```

```mooncram
$ run_moon_ide() { status_file="${TMPDIR:-/tmp}/moon-ide-status.$$"; ( cd "$TEST_REPO_ROOT" && "$@"; echo "$?" > "$status_file" ) 2>&1 | normalize_moon_ide_output; status=$(cat "$status_file"); rm -f "$status_file"; return "$status"; }
```

```mooncram
$ run_moon_ide moon ide rename 'Val' 'ValRenamed' --loc 'rabbita/deprecated.mbt:6:23'
*** Begin Patch
*** Update File: <WORKDIR>/examples/SSR/main/server.mbt
@@
 #cfg(target="native")
 async fn main {
   let rendered = @rabbita.render_to_string(() => {
-    @rabbita.Val::constant(view(@rabbita.none, 0))
+    @rabbita.ValRenamed::constant(view(@rabbita.none, 0))
   })
   let html =
     $| <!DOCTYPE html>
*** Update File: <WORKDIR>/rabbita/deprecated.mbt
@@
 ///
 /// New components should return `Val[Html]` directly.
 #deprecated("Use a `() -> Val[Html]` component. Nested `Cell::view()` composition is no longer supported; use `Val::map`, `Val::switch`, or `Val::assoc` instead.", skip_current_package=true)
-pub type Cell = () -> Val[Html]
+pub type Cell = () -> ValRenamed[Html]
 
 ///|
 #cfg(target="js")
@@
   ignore(update)
   ignore(subscriptions)
   let emit : Emit[Msg] = @cmd.make_legacy_emitter((_, _) => ())
-  (emit, () => Val::constant(view(emit, model)))
+  (emit, () => ValRenamed::constant(view(emit, model)))
 }
 
 ///|
@@
 /// Compatibility wrapper for the former static Cell constructor.
 #deprecated("Use a component returning `Val::constant(html)` instead.", skip_current_package=true)
 pub fn static_cell(html : Html) -> Cell {
-  () => Val::constant(html)
+  () => ValRenamed::constant(html)
 }
 
 ///|
*** Update File: <WORKDIR>/rabbita/incremental.mbt
@@
 ///
 /// Derived values are recomputed on demand after one of their dependencies
 /// changes.
-struct Val[A](@duplix.Node[A])
+struct ValRenamed[A](@duplix.Node[A])
 
 ///|
 #cfg(target="js")
@@
 /// Creates an incremental value by applying `f` to `a`.
 ///
 /// The function is reevaluated when the value of `a` changes.
-pub fn[A : Eq, B] Val::map(a : Val[A], f : (A) -> B) -> Val[B] {
+pub fn[A : Eq, B] ValRenamed::map(a : ValRenamed[A], f : (A) -> B) -> ValRenamed[B] {
   a.0.map1(f)
 }
 
 ///|
 /// Creates an incremental value that always contains `a`.
-pub fn[A] Val::constant(a : A) -> Val[A] {
+pub fn[A] ValRenamed::constant(a : A) -> ValRenamed[A] {
   @duplix.constant(a)
 }
 
@@
 /// Creates an incremental value derived from two inputs.
 ///
 /// The function is reevaluated when either input value changes.
-pub fn[A : Eq, B : Eq, C] Val::map2(
+pub fn[A : Eq, B : Eq, C] ValRenamed::map2(
-  a : Val[A],
+  a : ValRenamed[A],
-  b : Val[B],
+  b : ValRenamed[B],
   f : (A, B) -> C,
-) -> Val[C] {
+) -> ValRenamed[C] {
   a.0.map2(b.0, f)
 }
 
@@
 /// Creates an incremental value derived from three inputs.
 ///
 /// The function is reevaluated when any input value changes.
-pub fn[A : Eq, B : Eq, C : Eq, D] Val::map3(
+pub fn[A : Eq, B : Eq, C : Eq, D] ValRenamed::map3(
-  a : Val[A],
+  a : ValRenamed[A],
-  b : Val[B],
+  b : ValRenamed[B],
-  c : Val[C],
+  c : ValRenamed[C],
   f : (A, B, C) -> D,
-) -> Val[D] {
+) -> ValRenamed[D] {
   a.0.map3(b.0, c.0, f)
 }
 
@@
 /// Creates an incremental value derived from four inputs.
 ///
 /// The function is reevaluated when any input value changes.
-pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E] Val::map4(
+pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E] ValRenamed::map4(
-  a : Val[A],
+  a : ValRenamed[A],
-  b : Val[B],
+  b : ValRenamed[B],
-  c : Val[C],
+  c : ValRenamed[C],
-  d : Val[D],
+  d : ValRenamed[D],
   f : (A, B, C, D) -> E,
-) -> Val[E] {
+) -> ValRenamed[E] {
   a.0.map4(b.0, c.0, d.0, f)
 }
 
@@
 /// Creates an incremental value derived from five inputs.
 ///
 /// The function is reevaluated when any input value changes.
-pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E : Eq, F] Val::map5(
+pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E : Eq, F] ValRenamed::map5(
-  a : Val[A],
+  a : ValRenamed[A],
-  b : Val[B],
+  b : ValRenamed[B],
-  c : Val[C],
+  c : ValRenamed[C],
-  d : Val[D],
+  d : ValRenamed[D],
-  e : Val[E],
+  e : ValRenamed[E],
   f : (A, B, C, D, E) -> F,
-) -> Val[F] {
+) -> ValRenamed[F] {
   a.0.map5(b.0, c.0, d.0, e.0, f)
 }
 
@@
 /// Creates an incremental value derived from six inputs.
 ///
 /// The function is reevaluated when any input value changes.
-pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E : Eq, F : Eq, G] Val::map6(
+pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E : Eq, F : Eq, G] ValRenamed::map6(
-  a : Val[A],
+  a : ValRenamed[A],
-  b : Val[B],
+  b : ValRenamed[B],
-  c : Val[C],
+  c : ValRenamed[C],
-  d : Val[D],
+  d : ValRenamed[D],
-  e : Val[E],
+  e : ValRenamed[E],
-  f : Val[F],
+  f : ValRenamed[F],
   g : (A, B, C, D, E, F) -> G,
-) -> Val[G] {
+) -> ValRenamed[G] {
   a.0.map6(b.0, c.0, d.0, e.0, f.0, g)
 }
 
@@
 /// Creates an incremental value derived from seven inputs.
 ///
 /// The function is reevaluated when any input value changes.
-pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E : Eq, F : Eq, G : Eq, H] Val::map7(
+pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E : Eq, F : Eq, G : Eq, H] ValRenamed::map7(
-  a : Val[A],
+  a : ValRenamed[A],
-  b : Val[B],
+  b : ValRenamed[B],
-  c : Val[C],
+  c : ValRenamed[C],
-  d : Val[D],
+  d : ValRenamed[D],
-  e : Val[E],
+  e : ValRenamed[E],
-  f : Val[F],
+  f : ValRenamed[F],
-  g : Val[G],
+  g : ValRenamed[G],
   h : (A, B, C, D, E, F, G) -> H,
-) -> Val[H] {
+) -> ValRenamed[H] {
   a.0.map7(b.0, c.0, d.0, e.0, f.0, g.0, h)
 }
 
@@
 /// Creates an incremental value derived from eight inputs.
 ///
 /// The function is reevaluated when any input value changes.
-pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E : Eq, F : Eq, G : Eq, H : Eq, I] Val::map8(
+pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E : Eq, F : Eq, G : Eq, H : Eq, I] ValRenamed::map8(
-  a : Val[A],
+  a : ValRenamed[A],
-  b : Val[B],
+  b : ValRenamed[B],
-  c : Val[C],
+  c : ValRenamed[C],
-  d : Val[D],
+  d : ValRenamed[D],
-  e : Val[E],
+  e : ValRenamed[E],
-  f : Val[F],
+  f : ValRenamed[F],
-  g : Val[G],
+  g : ValRenamed[G],
-  h : Val[H],
+  h : ValRenamed[H],
   i : (A, B, C, D, E, F, G, H) -> I,
-) -> Val[I] {
+) -> ValRenamed[I] {
   a.0.map8(b.0, c.0, d.0, e.0, f.0, g.0, h.0, i)
 }
 
@@
   H : Eq,
   I : Eq,
   J,
-] Val::map9(
+] ValRenamed::map9(
-  a : Val[A],
+  a : ValRenamed[A],
-  b : Val[B],
+  b : ValRenamed[B],
-  c : Val[C],
+  c : ValRenamed[C],
-  d : Val[D],
+  d : ValRenamed[D],
-  e : Val[E],
+  e : ValRenamed[E],
-  f : Val[F],
+  f : ValRenamed[F],
-  g : Val[G],
+  g : ValRenamed[G],
-  h : Val[H],
+  h : ValRenamed[H],
-  i : Val[I],
+  i : ValRenamed[I],
   j : (A, B, C, D, E, F, G, H, I) -> J,
-) -> Val[J] {
+) -> ValRenamed[J] {
   a.0.map9(b.0, c.0, d.0, e.0, f.0, g.0, h.0, i.0, j)
 }
 
@@
 /// Creates an HTML view derived from one incremental value.
 ///
 /// The render function is reevaluated when `a` changes.
-pub fn[A : Eq] Val::view(a : Val[A], render : (A) -> Html) -> Val[Html] {
+pub fn[A : Eq] ValRenamed::view(a : ValRenamed[A], render : (A) -> Html) -> ValRenamed[Html] {
   a.0.map(render)
 }
 
@@
 /// Creates an HTML view derived from two incremental values.
 ///
 /// The render function is reevaluated when either input changes.
-pub fn[A : Eq, B : Eq] Val::view2(
+pub fn[A : Eq, B : Eq] ValRenamed::view2(
-  a : Val[A],
+  a : ValRenamed[A],
-  b : Val[B],
+  b : ValRenamed[B],
   render : (A, B) -> Html,
-) -> Val[Html] {
+) -> ValRenamed[Html] {
   a.0.map2(b.0, render)
 }
 
@@
 /// Creates an HTML view derived from three incremental values.
 ///
 /// The render function is reevaluated when any input changes.
-pub fn[A : Eq, B : Eq, C : Eq] Val::view3(
+pub fn[A : Eq, B : Eq, C : Eq] ValRenamed::view3(
-  a : Val[A],
+  a : ValRenamed[A],
-  b : Val[B],
+  b : ValRenamed[B],
-  c : Val[C],
+  c : ValRenamed[C],
   render : (A, B, C) -> Html,
-) -> Val[Html] {
+) -> ValRenamed[Html] {
   a.0.map3(b.0, c.0, render)
 }
 
@@
 /// Creates an HTML view derived from four incremental values.
 ///
 /// The render function is reevaluated when any input changes.
-pub fn[A : Eq, B : Eq, C : Eq, D : Eq] Val::view4(
+pub fn[A : Eq, B : Eq, C : Eq, D : Eq] ValRenamed::view4(
-  a : Val[A],
+  a : ValRenamed[A],
-  b : Val[B],
+  b : ValRenamed[B],
-  c : Val[C],
+  c : ValRenamed[C],
-  d : Val[D],
+  d : ValRenamed[D],
   render : (A, B, C, D) -> Html,
-) -> Val[Html] {
+) -> ValRenamed[Html] {
   a.0.map4(b.0, c.0, d.0, render)
 }
 
@@
 /// Creates an HTML view derived from five incremental values.
 ///
 /// The render function is reevaluated when any input changes.
-pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E : Eq] Val::view5(
+pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E : Eq] ValRenamed::view5(
-  a : Val[A],
+  a : ValRenamed[A],
-  b : Val[B],
+  b : ValRenamed[B],
-  c : Val[C],
+  c : ValRenamed[C],
-  d : Val[D],
+  d : ValRenamed[D],
-  e : Val[E],
+  e : ValRenamed[E],
   render : (A, B, C, D, E) -> Html,
-) -> Val[Html] {
+) -> ValRenamed[Html] {
   a.0.map5(b.0, c.0, d.0, e.0, render)
 }
 
@@
 /// Creates an HTML view derived from six incremental values.
 ///
 /// The render function is reevaluated when any input changes.
-pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E : Eq, F : Eq] Val::view6(
+pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E : Eq, F : Eq] ValRenamed::view6(
-  a : Val[A],
+  a : ValRenamed[A],
-  b : Val[B],
+  b : ValRenamed[B],
-  c : Val[C],
+  c : ValRenamed[C],
-  d : Val[D],
+  d : ValRenamed[D],
-  e : Val[E],
+  e : ValRenamed[E],
-  f : Val[F],
+  f : ValRenamed[F],
   render : (A, B, C, D, E, F) -> Html,
-) -> Val[Html] {
+) -> ValRenamed[Html] {
   a.0.map6(b.0, c.0, d.0, e.0, f.0, render)
 }
 
@@
 /// Creates an HTML view derived from seven incremental values.
 ///
 /// The render function is reevaluated when any input changes.
-pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E : Eq, F : Eq, G : Eq] Val::view7(
+pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E : Eq, F : Eq, G : Eq] ValRenamed::view7(
-  a : Val[A],
+  a : ValRenamed[A],
-  b : Val[B],
+  b : ValRenamed[B],
-  c : Val[C],
+  c : ValRenamed[C],
-  d : Val[D],
+  d : ValRenamed[D],
-  e : Val[E],
+  e : ValRenamed[E],
-  f : Val[F],
+  f : ValRenamed[F],
-  g : Val[G],
+  g : ValRenamed[G],
   render : (A, B, C, D, E, F, G) -> Html,
-) -> Val[Html] {
+) -> ValRenamed[Html] {
   a.0.map7(b.0, c.0, d.0, e.0, f.0, g.0, render)
 }
 
@@
 /// Creates an HTML view derived from eight incremental values.
 ///
 /// The render function is reevaluated when any input changes.
-pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E : Eq, F : Eq, G : Eq, H : Eq] Val::view8(
+pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E : Eq, F : Eq, G : Eq, H : Eq] ValRenamed::view8(
-  a : Val[A],
+  a : ValRenamed[A],
-  b : Val[B],
+  b : ValRenamed[B],
-  c : Val[C],
+  c : ValRenamed[C],
-  d : Val[D],
+  d : ValRenamed[D],
-  e : Val[E],
+  e : ValRenamed[E],
-  f : Val[F],
+  f : ValRenamed[F],
-  g : Val[G],
+  g : ValRenamed[G],
-  h : Val[H],
+  h : ValRenamed[H],
   render : (A, B, C, D, E, F, G, H) -> Html,
-) -> Val[Html] {
+) -> ValRenamed[Html] {
   a.0.map8(b.0, c.0, d.0, e.0, f.0, g.0, h.0, render)
 }
 
@@
 /// Creates an HTML view derived from nine incremental values.
 ///
 /// The render function is reevaluated when any input changes.
-pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E : Eq, F : Eq, G : Eq, H : Eq, I : Eq] Val::view9(
+pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E : Eq, F : Eq, G : Eq, H : Eq, I : Eq] ValRenamed::view9(
-  a : Val[A],
+  a : ValRenamed[A],
-  b : Val[B],
+  b : ValRenamed[B],
-  c : Val[C],
+  c : ValRenamed[C],
-  d : Val[D],
+  d : ValRenamed[D],
-  e : Val[E],
+  e : ValRenamed[E],
-  f : Val[F],
+  f : ValRenamed[F],
-  g : Val[G],
+  g : ValRenamed[G],
-  h : Val[H],
+  h : ValRenamed[H],
-  i : Val[I],
+  i : ValRenamed[I],
   render : (A, B, C, D, E, F, G, H, I) -> Html,
-) -> Val[Html] {
+) -> ValRenamed[Html] {
   a.0.map9(b.0, c.0, d.0, e.0, f.0, g.0, h.0, i.0, render)
 }
 
@@
 ///   rows.view(rows => @html.ul(rows))
 /// }
 /// ```
-pub fn[K : Hash + Eq, V : Eq, C : Eq] Val::assoc(
+pub fn[K : Hash + Eq, V : Eq, C : Eq] ValRenamed::assoc(
-  a : Val[Vector[(K, V)]],
+  a : ValRenamed[Vector[(K, V)]],
-  f : (K, Val[V]) -> Val[C],
+  f : (K, ValRenamed[V]) -> ValRenamed[C],
-) -> Val[Vector[C]] {
+) -> ValRenamed[Vector[C]] {
   a.0.assoc((k, v) => f(k, v).0)
 }
 
@@
 /// Incrementally maps values using keys derived by `by`.
 ///
 /// Derived keys must be unique and stable. Output follows source vector order.
-pub fn[K : Hash + Eq, V : Eq, C : Eq] Val::assoc_by(
+pub fn[K : Hash + Eq, V : Eq, C : Eq] ValRenamed::assoc_by(
-  a : Val[Vector[V]],
+  a : ValRenamed[Vector[V]],
-  f : (K, Val[V]) -> Val[C],
+  f : (K, ValRenamed[V]) -> ValRenamed[C],
   by~ : (V) -> K,
-) -> Val[Vector[C]] {
+) -> ValRenamed[Vector[C]] {
   a.0.assoc_by((k, v) => f(k, v).0, by~)
 }
 
@@
 ///   })
 /// }
 /// ```
-pub fn[E : Enumerate + Eq, C : Eq] Val::enumerate(
+pub fn[E : Enumerate + Eq, C : Eq] ValRenamed::enumerate(
-  a : Val[E],
+  a : ValRenamed[E],
-  f : (E) -> Val[C],
+  f : (E) -> ValRenamed[C],
-) -> Val[C] {
+) -> ValRenamed[C] {
   a.0.enumerate(e => f(e).0)
 }
 
@@
 /// Selects and caches branches using the tag returned by `by`.
 ///
 /// Values with the same tag reuse the branch created for its first value.
-pub fn[E : Eq, C : Eq] Val::enumerate_by(
+pub fn[E : Eq, C : Eq] ValRenamed::enumerate_by(
-  a : Val[E],
+  a : ValRenamed[E],
-  f : (E) -> Val[C],
+  f : (E) -> ValRenamed[C],
   by~ : (E) -> String,
-) -> Val[C] {
+) -> ValRenamed[C] {
   a.0.enumerate_by(e => f(e).0, by~)
 }
 
@@
 ///   })
 /// }
 /// ```
-pub fn[E : Enumerate + Eq, C : Eq] Val::switch(
+pub fn[E : Enumerate + Eq, C : Eq] ValRenamed::switch(
-  a : Val[E],
+  a : ValRenamed[E],
-  f : (E) -> Val[C],
+  f : (E) -> ValRenamed[C],
-) -> Val[C] {
+) -> ValRenamed[C] {
   a.0.switch(e => f(e).0)
 }
 
@@
 ///
 /// Values with the same tag keep the current branch; changing it disposes the
 /// branch before creating the next one.
-pub fn[E : Eq, C : Eq] Val::switch_by(
+pub fn[E : Eq, C : Eq] ValRenamed::switch_by(
-  a : Val[E],
+  a : ValRenamed[E],
-  f : (E) -> Val[C],
+  f : (E) -> ValRenamed[C],
   by~ : (E) -> String,
-) -> Val[C] {
+) -> ValRenamed[C] {
   a.0.switch_by(e => f(e).0, by~)
 }
 
*** Update File: <WORKDIR>/rabbita/top.mbt
@@
 /// }
 /// ```
 #internal(unstable, "Experimental API")
-pub fn render_to_string(builder : () -> Val[Html]) -> String {
+pub fn render_to_string(builder : () -> ValRenamed[Html]) -> String {
   @runtime.server_side_render(() => builder().0.read().0)
 }
*** End Patch

```
