# rabbita rename Val rabbita\deprecated.mbt:6:23

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\rabbita' moon ide rename 'Val' 'ValRenamed' --loc 'rabbita\deprecated.mbt:6:23'
*** Begin Patch
*** Update File: <WORKDIR>/doc\001_intro\using_test.mbt
@@
 ///|
-using @rabbita {type Val, type Html}
+using @rabbita {type ValRenamed, type Html}
 
 ///|
 using @html {div, h1, button}
*** Update File: <WORKDIR>/doc\003_router\using_test.mbt
@@
 ///|
-using @rabbita {type Html, type Val, none}
+using @rabbita {type Html, type ValRenamed, none}
 
 ///|
 using @html {ul, div, li, a, p, h1}
*** Update File: <WORKDIR>/doc\component_and_incremental\using_test.mbt
@@
 ///|
-using @rabbita {type Cmd, type Emit, type Html, type Val}
+using @rabbita {type Cmd, type Emit, type Html, type ValRenamed}
 
 ///|
 using @html {button, div, h1, h2, li, main_, nothing, p, section, span, ul}
*** Update File: <WORKDIR>/doc\using_subscriptions\using_test.mbt
@@
 ///|
-using @rabbita {type Emit, type Val, type Html, none}
+using @rabbita {type Emit, type ValRenamed, type Html, none}
 
 ///|
 using @html {div, h1, p}
*** Update File: <WORKDIR>/e2e\apps\collections-lifecycle\components.mbt
@@
 ///|
-using @rabbita {type Html, type Val}
+using @rabbita {type Html, type ValRenamed}
 
 ///|
 using @html {button, div, h1, input, li, p, span, ul}
*** Update File: <WORKDIR>/e2e\apps\commands-and-async\commands.mbt
@@
 ///|
-using @rabbita {type Cmd, type Emit, type Html, type Val}
+using @rabbita {type Cmd, type Emit, type Html, type ValRenamed}
 
 ///|
 using @html {button, div, h1, p}
*** Update File: <WORKDIR>/e2e\apps\counter\main.mbt
@@
 ///|
-using @rabbita {type Html, type Val}
+using @rabbita {type Html, type ValRenamed}
 
 ///|
 using @html {button, div, h1}
*** Update File: <WORKDIR>/e2e\apps\dom-api\app.mbt
@@
 ///|
-using @rabbita {type Html, type Val}
+using @rabbita {type Html, type ValRenamed}
 
 ///|
 using @html {button, div, h1, input, p}
*** Update File: <WORKDIR>/e2e\apps\forms-and-events\view.mbt
@@
 ///|
-using @rabbita {type Html, type Val}
+using @rabbita {type Html, type ValRenamed}
 
 ///|
 using @html {button, div, form, h1, input, label, option, p, select}
*** Update File: <WORKDIR>/e2e\apps\http\http_app.mbt
@@
 ///|
-using @rabbita {type Cmd, type Emit, type Html, type Resource, type Val}
+using @rabbita {type Cmd, type Emit, type Html, type Resource, type ValRenamed}
 
 ///|
 using @html {button, div, h1, p}
*** Update File: <WORKDIR>/e2e\apps\memo\app.mbt
@@
 ///|
-using @rabbita {type Html, type Val, type Emit}
+using @rabbita {type Html, type ValRenamed, type Emit}
 
 ///|
 using @html {button, div, h1, input, p, span}
*** Update File: <WORKDIR>/e2e\apps\navigation-history\navigation.mbt
@@
 ///|
-using @rabbita {type Cmd, type Emit, type Html, type Val}
+using @rabbita {type Cmd, type Emit, type Html, type ValRenamed}
 
 ///|
 using @html {button, div, h1, p}
*** Update File: <WORKDIR>/e2e\apps\rui\main.mbt
@@
 ///|
-using @rabbita {type Cmd, type Emit, type Html, type Val}
+using @rabbita {type Cmd, type Emit, type Html, type ValRenamed}
 
 ///|
 using @html {
@@
 
 ///|
 fn fixture_index_page() -> Val[Html] {
-  @rabbita.Val::constant(
+  @rabbita.ValRenamed::constant(
     fixture_shell("Index", [
       fixture_section("fixture-section-index", "Fixture pages", [
         p(
@@
 
 ///|
 fn fixture_missing_page(path : String) -> Val[Html] {
-  @rabbita.Val::constant(
+  @rabbita.ValRenamed::constant(
     fixture_shell("Not found", [
       fixture_section("fixture-section-missing", "Fixture page not found", [
         p(style=["margin:0"], "No fixture page exists for /\{path}."),
*** Update File: <WORKDIR>/e2e\apps\state-and-messages\state.mbt
@@
 ///|
-using @rabbita {type Html, type Val}
+using @rabbita {type Html, type ValRenamed}
 
 ///|
 using @html {button, div, h1, input, p}
*** Update File: <WORKDIR>/e2e\apps\subscriptions\subscriptions.mbt
@@
 ///|
-using @rabbita {type Cmd, type Emit, type Html, type Val}
+using @rabbita {type Cmd, type Emit, type Html, type ValRenamed}
 
 ///|
 using @html {button, div, h1, p}
*** Update File: <WORKDIR>/examples\animation\main\client.mbt
@@
 using @html {div, h1}
 
 ///|
-using @rabbita {type Cmd, type Emit, type Html, type Val}
+using @rabbita {type Cmd, type Emit, type Html, type ValRenamed}
 
 ///|
 enum Msg {
*** Update File: <WORKDIR>/examples\counter\main\main.mbt
@@
-using @rabbita { type Val, type Html, create_pure_state, new }
+using @rabbita { type ValRenamed, type Html, create_pure_state, new }
 using @html {div, h1, button}
 
 enum Msg {
*** Update File: <WORKDIR>/examples\document\app\app.mbt
@@
 ///|
-using @rabbita {type Val, type Resource, none, batch, create_resource}
+using @rabbita {type ValRenamed, type Resource, none, batch, create_resource}
 
 ///|
 using @html {type Html, title, div, h2, button, p, ul, li, html, body, head}
*** Update File: <WORKDIR>/examples\grocery\main\main.mbt
@@
-using @rabbita { type Val, new }
+using @rabbita { type ValRenamed, new }
 using @html { type Html, div, h1, li, ul}
 
 fn app() -> Val[Html] {
*** Update File: <WORKDIR>/examples\shiki_editor\main\client.mbt
@@
 using @html {div, h1, option, p, select, textarea, nothing}
 
 ///|
-using @rabbita {type Emit, type Html, type Val}
+using @rabbita {type Emit, type Html, type ValRenamed}
 
 ///|
 let language_items : Array[(String, String)] = [
*** Update File: <WORKDIR>/examples\sokoban\main\main.mbt
@@
 using @html {div, input, label, main_, nothing, section, span}
 
 ///|
-using @rabbita {type Emit, type Html, type Val, new, create_state, none}
+using @rabbita {type Emit, type Html, type ValRenamed, new, create_state, none}
 
 ///|
 using @string {parse_int}
*** Update File: <WORKDIR>/examples\subscriptions\main\client.mbt
@@
 using @common {type Keyboard, type Mouse, type Scroll, type Viewport}
 
 ///|
-using @rabbita {type Cmd, type Emit, type Html, type Val}
+using @rabbita {type Cmd, type Emit, type Html, type ValRenamed}
 
 ///|
 enum Tab {
*** Update File: <WORKDIR>/examples\todo\main\main.mbt
@@
 using @vector {type Vector, from_iter}
 
 ///|
-using @rabbita {type Val, none, type Emit, type Html }
+using @rabbita {type ValRenamed, none, type Emit, type Html }
 
 ///|
 using @html {button, div, h1, input, li, nav, span, ul, form, text, p}
*** Update File: <WORKDIR>/examples\websocket\main\client.mbt
@@
 using @html {button, code, div, fragment, h1, h2, input, nothing, p, textarea}
 
 ///|
-using @rabbita {type Cmd, type Emit, type Html, type Val}
+using @rabbita {type Cmd, type Emit, type Html, type ValRenamed}
 
 ///|
 using @websocket {type CloseInfo, type Event, type ReadyState, type Snapshot}
*** Update File: <WORKDIR>/rabbita\deprecated.mbt
@@
 ///
 /// New components should return `Val[Html]` directly.
 #deprecated("Use a `() -> Val[Html]` component. Nested `Cell::view()` composition is no longer supported; use `Val::map`, `Val::switch`, or `Val::assoc` instead.", skip_current_package=true)
-pub type Cell = () -> Val[Html]
+pub type Cell = () -> ValRenamed[Html]
 
 ///|
 #cfg(target="js")
@@
 /// Compatibility wrapper for the former static Cell constructor.
 #deprecated("Use a component returning `Val::constant(html)` instead.", skip_current_package=true)
 pub fn static_cell(html : Html) -> Cell {
-  () => Val::constant(html)
+  () => ValRenamed::constant(html)
 }
*** Update File: <WORKDIR>/rabbita\incremental.mbt
@@
 ///
 /// Derived values are recomputed on demand after one of their dependencies
 /// changes.
-struct Val[A](@duplix.Node[A])
+struct ValRenamed[A](@duplix.Node[A])
 
 ///|
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
 pub fn[Model : Eq, Msg] create_pure_state(
   model : Model,
   update~ : (Model, Msg) -> Model,
-) -> (Val[Model], Emit[Msg]) {
+) -> (ValRenamed[Model], Emit[Msg]) {
   let (node, emit) = @runtime.create_state_machine(_ => (model, none), (
     model,
     msg,
@@
   model : Model,
   update~ : (Model, Msg, Emit[Msg]) -> (Model, Cmd),
   subscriptions? : (Model, Emit[Msg]) -> @sub.Sub,
-) -> (Val[Model], Emit[Msg]) {
+) -> (ValRenamed[Model], Emit[Msg]) {
   let (node, emit) = @runtime.create_state_machine(
     _ => (model, none),
     update,
     subscriptions?,
   )
-  (Val(node), emit)
+  (ValRenamed(node), emit)
 }
 
 ///|
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
 
@@
   init~ : (Emit[Msg]) -> (Model, Cmd),
   update~ : (Model, Msg, Emit[Msg]) -> (Model, Cmd),
   subscriptions? : (Model, Emit[Msg]) -> @sub.Sub,
-) -> (Val[Model], Emit[Msg]) {
+) -> (ValRenamed[Model], Emit[Msg]) {
   let (node, emit) = @runtime.create_state_machine(init, update, subscriptions?)
   (node, emit)
 }
@@
   init~ : (Emit[Msg], Input) -> (Model, Cmd),
   update~ : (Model, Input, Msg, Emit[Msg]) -> (Model, Cmd),
   subscriptions? : (Model, Input, Emit[Msg]) -> @sub.Sub,
-  input~ : Val[Input],
+  input~ : ValRenamed[Input],
-) -> (Val[Model], Emit[Msg]) {
+) -> (ValRenamed[Model], Emit[Msg]) {
   let (node, emit) = @runtime.create_state_machine_with_input(
     init,
     update,
@@
 /// ```
 pub fn[Model : Eq] create_variable(
   init : Model,
-) -> (Val[Model], Emit[(Model) -> Model]) {
+) -> (ValRenamed[Model], Emit[(Model) -> Model]) {
   fn update(model, f) {
     f(model)
   }
@@
 
 ///|
 /// An incremental asynchronous resource state.
-pub type Resource[T] = Val[Status[T]]
+pub type Resource[T] = ValRenamed[Status[T]]
 
 ///|
 /// Starts an asynchronous resource command and tracks its result.
*** Update File: <WORKDIR>/rabbita\top.mbt
@@
 ///|
 /// A running Rabbita application.
 struct App {
-  builder : () -> Val[Html]
+  builder : () -> ValRenamed[Html]
 }
 
 ///|
@@
 /// The builder runs when the app is mounted and must return its root
 /// incremental HTML value. Use `Val::map`, `Val::switch`, and `Val::assoc` to
 /// express subsequent changes, then call `App::mount` to start the app.
-pub fn new(builder : () -> Val[Html]) -> App {
+pub fn new(builder : () -> ValRenamed[Html]) -> App {
   { builder, }
 }
 
*** Update File: <WORKDIR>/rui\accordion.mbt
@@
   item_style? : Array[String] = [],
   trigger_style? : Array[String] = [],
   content_style? : Array[String] = [],
-) -> @rabbita.Val[@html.Html] {
+) -> @rabbita.ValRenamed[@html.Html] {
   let initial = accordion_initial_values(
     items, type_, default_value, default_values,
   )
*** Update File: <WORKDIR>/rui\alert_dialog.mbt
@@
   on_open_change? : @cmd.Emit[Bool],
   on_close? : @cmd.Emit[String],
   children : (AlertDialogScope) -> @html.Html,
-) -> @rabbita.Val[@html.Html] {
+) -> @rabbita.ValRenamed[@html.Html] {
   dialog(
     id~,
     default_open~,
*** Update File: <WORKDIR>/rui\avatar.mbt
@@
   fallback_attrs? : @html.Attrs,
   fallback_style? : Array[String] = [],
   fallback : C,
-) -> @rabbita.Val[@html.Html] {
+) -> @rabbita.ValRenamed[@html.Html] {
   let initial = if src == "" { AvatarError } else { AvatarLoading }
   let (status, _) = @rabbita.create_state_with_init(
     init=emit => {
*** Update File: <WORKDIR>/rui\calendar.mbt
@@
   weekday_style? : Array[String] = [],
   cell_style? : Array[String] = [],
   day_style? : Array[String] = [],
-) -> @rabbita.Val[@html.Html] {
+) -> @rabbita.ValRenamed[@html.Html] {
   let initial = calendar_initial_model(default_month, default_selected, today)
   let (model, emit) = @rabbita.create_state(initial, update=fn(model, msg, _) {
     calendar_update(id, on_select, on_month_change, today, msg, model)
*** Update File: <WORKDIR>/rui\calendar_selection.mbt
@@
   weekday_style? : Array[String] = [],
   cell_style? : Array[String] = [],
   day_style? : Array[String] = [],
-) -> @rabbita.Val[@html.Html] {
+) -> @rabbita.ValRenamed[@html.Html] {
   let initial = calendar_range_initial_model(
     default_month, default_selected, today,
   )
@@
   weekday_style? : Array[String] = [],
   cell_style? : Array[String] = [],
   day_style? : Array[String] = [],
-) -> @rabbita.Val[@html.Html] {
+) -> @rabbita.ValRenamed[@html.Html] {
   let initial = calendar_multiple_initial_model(
     default_month, default_selected, today,
   )
*** Update File: <WORKDIR>/rui\carousel.mbt
@@
   attrs? : @html.Attrs,
   style? : Array[String] = [],
   children : (CarouselScope) -> C,
-) -> @rabbita.Val[@html.Html] {
+) -> @rabbita.ValRenamed[@html.Html] {
   let count = carousel_count(count)
   let initial = carousel_index(default_index, count)
   let root_id = id.unwrap_or(carousel_next_id())
*** Update File: <WORKDIR>/rui\checkbox.mbt
@@
   on_checked_change? : @cmd.Emit[Bool],
   attrs? : @html.Attrs,
   style? : Array[String] = [],
-) -> @rabbita.Val[@html.Html] {
+) -> @rabbita.ValRenamed[@html.Html] {
   let initial = {
     checked: default_checked,
     indeterminate: default_indeterminate,
*** Update File: <WORKDIR>/rui\collapsible.mbt
@@
   content_body_style? : Array[String] = [],
   trigger~ : T,
   content~ : C,
-) -> @rabbita.Val[@html.Html] {
+) -> @rabbita.ValRenamed[@html.Html] {
   let (open, set_open) = @rabbita.create_variable(default_open)
   let on_open_change = set_open.map(next => _ => next)
   open.view(open => {
*** Update File: <WORKDIR>/rui\combobox.mbt
@@
   attrs? : @html.Attrs,
   style? : Array[String] = [],
   render? : (ComboboxScope) -> @html.Html,
-) -> @rabbita.Val[@html.Html] {
+) -> @rabbita.ValRenamed[@html.Html] {
   let requested = default_values.copy()
   if default_value is Some(value) && !combobox_contains(requested, value) {
     requested.push(value)
*** Update File: <WORKDIR>/rui\command.mbt
@@
   attrs? : @html.Attrs,
   style? : Array[String] = [],
   children : (CommandScope) -> @html.Html,
-) -> @rabbita.Val[@html.Html] {
+) -> @rabbita.ValRenamed[@html.Html] {
   let matcher = filter.unwrap_or(command_default_filter)
   let initial : CommandModel = {
     query: default_query,
@@
   native_style? : Array[String] = [],
   trigger? : (CommandScope) -> @html.Html,
   children : (CommandScope) -> @html.Html,
-) -> @rabbita.Val[@html.Html] {
+) -> @rabbita.ValRenamed[@html.Html] {
   let matcher = filter.unwrap_or(command_default_filter)
   let initial : CommandModel = {
     query: default_query,
*** Update File: <WORKDIR>/rui\context_menu.mbt
@@
   attrs? : @html.Attrs,
   style? : Array[String] = [],
   children : (ContextMenuScope) -> @html.Html,
-) -> @rabbita.Val[@html.Html] {
+) -> @rabbita.ValRenamed[@html.Html] {
   let initial : ContextMenuModel = {
     menu: menu_core_model(
       default_open, default_checked_values, default_radio_values,
@@
   attrs? : @html.Attrs,
   style? : Array[String] = [],
   children : (ContextMenuScope) -> @html.Html,
-) -> @rabbita.Val[@html.Html] {
+) -> @rabbita.ValRenamed[@html.Html] {
   context_menu(
     id~,
     default_open~,
*** Update File: <WORKDIR>/rui\data_table.mbt
@@
   title? : String,
   attrs? : @html.Attrs,
   style? : Array[String] = [],
-) -> @rabbita.Val[@html.Html] {
+) -> @rabbita.ValRenamed[@html.Html] {
   let initial = data_table_initial_model(
     default_sort_key, default_sort_descending, default_selected, default_hidden_columns,
   )
*** Update File: <WORKDIR>/rui\date_picker.mbt
@@
   day_attrs? : @html.Attrs,
   day_style? : Array[String] = [],
   preset_style? : Array[String] = [],
-) -> @rabbita.Val[@html.Html] {
+) -> @rabbita.ValRenamed[@html.Html] {
   let initial = date_picker_initial_model(
     default_open, disabled, default_month, default_value, today,
   )
@@
   calendar_style? : Array[String] = [],
   day_attrs? : @html.Attrs,
   day_style? : Array[String] = [],
-) -> @rabbita.Val[@html.Html] {
+) -> @rabbita.ValRenamed[@html.Html] {
   let initial = date_range_picker_initial_model(
     default_open, disabled, default_month, default_value, today,
   )
*** Update File: <WORKDIR>/rui\dialog.mbt
@@
   on_open_change? : @cmd.Emit[Bool],
   on_close? : @cmd.Emit[String],
   children : (DialogScope) -> @html.Html,
-) -> @rabbita.Val[@html.Html] {
+) -> @rabbita.ValRenamed[@html.Html] {
   dialog_with_input(
     id~,
-    input=@rabbita.Val::constant(()),
+    input=@rabbita.ValRenamed::constant(()),
     default_open~,
     modal~,
     close_on_escape~,
@@
 #cfg(target="js")
 pub fn[Input : Eq] dialog_with_input(
   id~ : String,
-  input~ : @rabbita.Val[Input],
+  input~ : @rabbita.ValRenamed[Input],
   default_open? : Bool = false,
   modal? : Bool = true,
   close_on_escape? : Bool = true,
@@
   on_open_change? : @cmd.Emit[Bool],
   on_close? : @cmd.Emit[String],
   children : (DialogScope, Input) -> @html.Html,
-) -> @rabbita.Val[@html.Html] {
+) -> @rabbita.ValRenamed[@html.Html] {
   let (model, emit) = @rabbita.create_state_with_init(
     init=emit => {
       (
*** Update File: <WORKDIR>/rui\drawer.mbt
@@
   on_open_change? : @cmd.Emit[Bool],
   on_close? : @cmd.Emit[String],
   children : (DrawerScope) -> @html.Html,
-) -> @rabbita.Val[@html.Html] {
+) -> @rabbita.ValRenamed[@html.Html] {
   dialog(
     id~,
     default_open~,
*** Update File: <WORKDIR>/rui\dropdown_menu.mbt
@@
   attrs? : @html.Attrs,
   style? : Array[String] = [],
   children : (DropdownMenuScope) -> @html.Html,
-) -> @rabbita.Val[@html.Html] {
+) -> @rabbita.ValRenamed[@html.Html] {
   let initial = menu_core_model(
     default_open, default_checked_values, default_radio_values,
   )
@@
   attrs? : @html.Attrs,
   style? : Array[String] = [],
   children : (DropdownMenuScope) -> @html.Html,
-) -> @rabbita.Val[@html.Html] {
+) -> @rabbita.ValRenamed[@html.Html] {
   dropdown_menu(
     id~,
     default_open~,
*** Update File: <WORKDIR>/rui\hover_card.mbt
@@
   content_style? : Array[String] = [],
   trigger : T,
   content : C,
-) -> @rabbita.Val[@html.Html] {
+) -> @rabbita.ValRenamed[@html.Html] {
   let actual_open_delay = hover_card_delay(open_delay)
   let actual_close_delay = hover_card_delay(close_delay)
   let initial_open = default_open && !disabled
*** Update File: <WORKDIR>/rui\input_otp.mbt
@@
   input_attrs? : @html.Attrs,
   style? : Array[String] = [],
   render? : (InputOtpScope) -> @html.Html,
-) -> @rabbita.Val[@html.Html] {
+) -> @rabbita.ValRenamed[@html.Html] {
   let initial_value = otp_normalize(default_value, max_length)
   let (model, emit) = @rabbita.create_state({ value: initial_value, }, update=fn(
     model,
*** Update File: <WORKDIR>/rui\menubar.mbt
@@
   attrs? : @html.Attrs,
   style? : Array[String] = [],
   children : (MenubarScope) -> @html.Html,
-) -> @rabbita.Val[@html.Html] {
+) -> @rabbita.ValRenamed[@html.Html] {
   let initial : MenubarModel = {
     active_value: default_value,
     active_index: if default_value is Some(_) {
@@
   attrs? : @html.Attrs,
   style? : Array[String] = [],
   children : (MenubarScope) -> @html.Html,
-) -> @rabbita.Val[@html.Html] {
+) -> @rabbita.ValRenamed[@html.Html] {
   menubar(
     id~,
     default_value?,
*** Update File: <WORKDIR>/rui\message_scroller.mbt
@@
   attrs? : @html.Attrs,
   style? : Array[String] = [],
   children : (MessageScrollerScope) -> C,
-) -> @rabbita.Val[@html.Html] {
+) -> @rabbita.ValRenamed[@html.Html] {
   let viewport_id = "\{id}-viewport"
   let initial = { at_start: !default_at_end, at_end: default_at_end, }
   let (position, emit) = @rabbita.create_state_with_init(
*** Update File: <WORKDIR>/rui\navigation_menu.mbt
@@
   attrs? : @html.Attrs,
   style? : Array[String] = [],
   children : (NavigationMenuScope) -> @html.Html,
-) -> @rabbita.Val[@html.Html] {
+) -> @rabbita.ValRenamed[@html.Html] {
   let initial : NavigationMenuModel = {
     value: default_value,
     index: if default_value is Some(_) {
@@
   attrs? : @html.Attrs,
   style? : Array[String] = [],
   children : (NavigationMenuScope) -> @html.Html,
-) -> @rabbita.Val[@html.Html] {
+) -> @rabbita.ValRenamed[@html.Html] {
   navigation_menu(
     id~,
     default_value?,
*** Update File: <WORKDIR>/rui\popover.mbt
@@
   content_style? : Array[String] = [],
   trigger : T,
   content : C,
-) -> @rabbita.Val[@html.Html] {
+) -> @rabbita.ValRenamed[@html.Html] {
   let initial_open = default_open && !disabled
   let (open, emit) = @rabbita.create_state_with_init(
     init=emit => {
*** Update File: <WORKDIR>/rui\radio_group.mbt
@@
   attrs? : @html.Attrs,
   style? : Array[String] = [],
   children : (RadioGroupScope) -> C,
-) -> @rabbita.Val[@html.Html] {
+) -> @rabbita.ValRenamed[@html.Html] {
   let (value, set_value) = @rabbita.create_variable(default_value)
   value.view(value => {
     render_radio_group(
*** Update File: <WORKDIR>/rui\resizable.mbt
@@
   attrs? : @html.Attrs,
   style? : Array[String] = [],
   children : (ResizableGroupScope) -> C,
-) -> @rabbita.Val[@html.Html] {
+) -> @rabbita.ValRenamed[@html.Html] {
   let (initial, minimums, maximums) = resizable_prepare_layout(
     default_sizes, min_sizes, max_sizes,
   )
@@
   attrs? : @html.Attrs,
   style? : Array[String] = [],
   children : (ResizableScope) -> C,
-) -> @rabbita.Val[@html.Html] {
+) -> @rabbita.ValRenamed[@html.Html] {
   let min = resizable_clamp(min, 0, 100)
   let max = resizable_clamp(max, min, 100)
   let initial = resizable_clamp(default_size, min, max)
*** Update File: <WORKDIR>/rui\scroll_area.mbt
@@
   attrs? : @html.Attrs,
   style? : Array[String] = [],
   children : C,
-) -> @rabbita.Val[@html.Html] {
+) -> @rabbita.ValRenamed[@html.Html] {
   let viewport_id = "\{id}-viewport"
   let (metrics, emit) = @rabbita.create_state_with_init(
     init=emit => {
*** Update File: <WORKDIR>/rui\select.mbt
@@
   attrs? : @html.Attrs,
   style? : Array[String] = [],
   render? : (SelectScope) -> @html.Html,
-) -> @rabbita.Val[@html.Html] {
+) -> @rabbita.ValRenamed[@html.Html] {
   let selected = select_find_value(options, default_value)
   let initial_value = if selected >= 0 {
     Some(options[selected].value)
*** Update File: <WORKDIR>/rui\sheet.mbt
@@
   on_open_change? : @cmd.Emit[Bool],
   on_close? : @cmd.Emit[String],
   children : (SheetScope) -> @html.Html,
-) -> @rabbita.Val[@html.Html] {
+) -> @rabbita.ValRenamed[@html.Html] {
   dialog(
     id~,
     default_open~,
*** Update File: <WORKDIR>/rui\sidebar.mbt
@@
   default_mobile_open : Bool,
   on_collapsed_change : @cmd.Emit[Bool]?,
   on_mobile_open_change : @cmd.Emit[Bool]?,
-) -> (@rabbita.Val[SidebarState], @cmd.Emit[SidebarMessage]) {
+) -> (@rabbita.ValRenamed[SidebarState], @cmd.Emit[SidebarMessage]) {
   let initial : SidebarState = {
     collapsed: default_collapsed,
     mobile_open: default_mobile_open,
@@
   attrs? : @html.Attrs,
   style? : Array[String] = [],
   children : (SidebarScope) -> @html.Html,
-) -> @rabbita.Val[@html.Html] {
+) -> @rabbita.ValRenamed[@html.Html] {
   let (state, emit) = sidebar_provider_state(
     default_collapsed, default_mobile_open, on_collapsed_change, on_mobile_open_change,
   )
@@
 /// rebuilding either state owner.
 #cfg(target="js")
 pub fn[Input : Eq] sidebar_provider_with_input(
-  input~ : @rabbita.Val[Input],
+  input~ : @rabbita.ValRenamed[Input],
   default_collapsed? : Bool = false,
   default_mobile_open? : Bool = false,
   on_collapsed_change? : @cmd.Emit[Bool],
@@
   attrs? : @html.Attrs,
   style? : Array[String] = [],
   children : (SidebarScope, Input) -> @html.Html,
-) -> @rabbita.Val[@html.Html] {
+) -> @rabbita.ValRenamed[@html.Html] {
   let (state, emit) = sidebar_provider_state(
     default_collapsed, default_mobile_open, on_collapsed_change, on_mobile_open_change,
   )
@@
   tooltip_attrs? : @html.Attrs,
   tooltip_style? : Array[String] = [],
   children : C,
-) -> @rabbita.Val[@html.Html] {
+) -> @rabbita.ValRenamed[@html.Html] {
   let content_id = id + "-tooltip"
   let initial_model : TooltipModel = {
     open: false,
*** Update File: <WORKDIR>/rui\slider.mbt
@@
   attrs : @html.Attrs?,
   input_attrs : @html.Attrs?,
   style : Array[String],
-) -> @rabbita.Val[@html.Html] {
+) -> @rabbita.ValRenamed[@html.Html] {
   let max = if max < min { min } else { max }
   let step = slider_step_amount(step)
   let large_step = if large_step > 0 { large_step } else { 10 }
@@
   attrs? : @html.Attrs,
   input_attrs? : @html.Attrs,
   style? : Array[String] = [],
-) -> @rabbita.Val[@html.Html] {
+) -> @rabbita.ValRenamed[@html.Html] {
   slider_values_impl(
     default_values, min, max, step, large_step, min_steps_between_values, orientation,
     disabled, aria_label, on_value_change, on_value_commit, id, false, class, title,
@@
   attrs? : @html.Attrs,
   input_attrs? : @html.Attrs,
   style? : Array[String] = [],
-) -> @rabbita.Val[@html.Html] {
+) -> @rabbita.ValRenamed[@html.Html] {
   let fallback = slider_clamp(default_value, min, max)
   slider_values_impl(
     [default_value],
*** Update File: <WORKDIR>/rui\sonner.mbt
@@
   attrs? : @html.Attrs,
   style? : Array[String] = [],
   children : (ToastScope) -> @html.Html,
-) -> @rabbita.Val[@html.Html] {
+) -> @rabbita.ValRenamed[@html.Html] {
   toaster_impl("sonner", true, max_toasts, position, class, attrs, style, scope => {
     @html.fragment([sonner_rich_color_stylesheet(), children(scope)])
   })
*** Update File: <WORKDIR>/rui\switch.mbt
@@
   on_checked_change? : @cmd.Emit[Bool],
   attrs? : @html.Attrs,
   style? : Array[String] = [],
-) -> @rabbita.Val[@html.Html] {
+) -> @rabbita.ValRenamed[@html.Html] {
   let (checked, set_checked) = @rabbita.create_variable(default_checked)
   checked.view(checked => {
     render_switch(
*** Update File: <WORKDIR>/rui\tabs.mbt
@@
   list_style? : Array[String] = [],
   trigger_style? : Array[String] = [],
   content_style? : Array[String] = [],
-) -> @rabbita.Val[@html.Html] {
+) -> @rabbita.ValRenamed[@html.Html] {
   let (value, set_value) = @rabbita.create_variable(
     tabs_initial_value(items, default_value),
   )
*** Update File: <WORKDIR>/rui\toast.mbt
@@
   attrs : @html.Attrs?,
   style : Array[String],
   children : (ToastScope) -> @html.Html,
-) -> @rabbita.Val[@html.Html] {
+) -> @rabbita.ValRenamed[@html.Html] {
   let (model, emit) = @rabbita.create_state_with_init(
     init=emit => {
       (
@@
   attrs? : @html.Attrs,
   style? : Array[String] = [],
   children : (ToastScope) -> @html.Html,
-) -> @rabbita.Val[@html.Html] {
+) -> @rabbita.ValRenamed[@html.Html] {
   toaster_impl(
     "toaster", false, max_toasts, position, class, attrs, style, children,
   )
*** Update File: <WORKDIR>/rui\toggle.mbt
@@
   style? : Array[String] = [],
   slot? : String = "toggle",
   children : C,
-) -> @rabbita.Val[@html.Html] {
+) -> @rabbita.ValRenamed[@html.Html] {
   let (pressed, set_pressed) = @rabbita.create_variable(default_pressed)
   pressed.view(pressed => {
     render_toggle(
*** Update File: <WORKDIR>/rui\toggle_group.mbt
@@
   attrs? : @html.Attrs,
   style? : Array[String] = [],
   children : (ToggleGroupScope) -> C,
-) -> @rabbita.Val[@html.Html] {
+) -> @rabbita.ValRenamed[@html.Html] {
   let (values, emit) = @rabbita.create_state(default_values, update=fn(
     values,
     msg,
*** Update File: <WORKDIR>/rui\tooltip.mbt
@@
   arrow_style? : Array[String] = [],
   trigger : T,
   content : C,
-) -> @rabbita.Val[@html.Html] {
+) -> @rabbita.ValRenamed[@html.Html] {
   let initial_open = default_open && !disabled
   let initial_model : TooltipModel = {
     open: initial_open,
*** Update File: <WORKDIR>/utils\shiki\shiki.mbt
@@
 }
 
 ///|
-using @rabbita {type Html, type Val}
+using @rabbita {type Html, type ValRenamed}
*** Update File: <WORKDIR>/website\homepage\components\calendar_showcase.mbt
@@
   #|
 
 ///|
-fn calendar_showcase() -> @rabbita.Val[@html.Html] {
+fn calendar_showcase() -> @rabbita.ValRenamed[@html.Html] {
   let today = @rui.calendar_date(year=2026, month=7, day=16)
   let single = @rui.calendar(
     id="forms-gallery-calendar-single",
*** Update File: <WORKDIR>/website\homepage\components\date_picker_showcase.mbt
@@
 }
 
 ///|
-fn date_picker_showcase() -> @rabbita.Val[@html.Html] {
+fn date_picker_showcase() -> @rabbita.ValRenamed[@html.Html] {
   let today = @rui.calendar_date(year=2026, month=7, day=16)
   let single = @rui.date_picker(
     id="forms-gallery-date-picker-single",
*** Update File: <WORKDIR>/website\homepage\components\forms_input_group_variants.mbt
@@
   #|
 
 ///|
-fn forms_input_group_variants() -> @rabbita.Val[@html.Html] {
+fn forms_input_group_variants() -> @rabbita.ValRenamed[@html.Html] {
   let connection_info = @rui.popover(
     id="forms-variants-input-group-connection-info",
     side=Bottom,
*** Update File: <WORKDIR>/website\homepage\components\forms_variants.mbt
@@
   )
 
 ///|
-fn forms_checkbox_variants() -> @rabbita.Val[@html.Html] {
+fn forms_checkbox_variants() -> @rabbita.ValRenamed[@html.Html] {
   let checkbox_mixed = @rui.checkbox(
     id="forms-variants-checkbox-mixed",
     default_indeterminate=true,
@@
 }
 
 ///|
-fn forms_switch_variants() -> @rabbita.Val[@html.Html] {
+fn forms_switch_variants() -> @rabbita.ValRenamed[@html.Html] {
   let switch_default = @rui.switch(
     id="forms-variants-switch-default",
     default_checked=true,
@@
 }
 
 ///|
-fn forms_combobox_variants() -> @rabbita.Val[@html.Html] {
+fn forms_combobox_variants() -> @rabbita.ValRenamed[@html.Html] {
   let framework_options = [
     @rui.combobox_option(value="moonbit", label="MoonBit"),
     @rui.combobox_option(value="rabbita", label="Rabbita"),
@@
 }
 
 ///|
-fn forms_select_variants() -> @rabbita.Val[@html.Html] {
+fn forms_select_variants() -> @rabbita.ValRenamed[@html.Html] {
   let deployment_options = [
     @rui.select_option(value="iad", label="Washington, D.C."),
     @rui.select_option(value="ord", label="Chicago"),
@@
 } derive(Eq)
 
 ///|
-fn forms_otp_variants() -> @rabbita.Val[@html.Html] {
+fn forms_otp_variants() -> @rabbita.ValRenamed[@html.Html] {
   let continuous = @rui.input_otp(
     id="forms-variants-otp-continuous",
     max_length=6,
*** Update File: <WORKDIR>/website\homepage\components\foundations_data_variants.mbt
@@
 }
 
 ///|
-fn fdv_data_table_view() -> @rabbita.Val[@html.Html] {
+fn fdv_data_table_view() -> @rabbita.ValRenamed[@html.Html] {
   let rows : Array[FdvPayment] = [
     {
       id: "pay-001",
*** Update File: <WORKDIR>/website\homepage\components\interactions_collapsible.mbt
@@
 const IgCollapsibleTreeLeafStyle : String = "display:flex;min-height:2rem;min-width:0;align-items:center;gap:0.5rem;padding:0.25rem 0.375rem;color:var(--rui-foreground);font-size:0.875rem;line-height:1.25rem"
 
 ///|
-fn ig_collapsible_order_view() -> @rabbita.Val[@html.Html] {
+fn ig_collapsible_order_view() -> @rabbita.ValRenamed[@html.Html] {
   @rui.collapsible(
     id="showcase-collapsible-order",
     default_open=true,
@@
 }
 
 ///|
-fn ig_collapsible_basic_view() -> @rabbita.Val[@html.Html] {
+fn ig_collapsible_basic_view() -> @rabbita.ValRenamed[@html.Html] {
   @rui.collapsible(
     id="showcase-collapsible-basic",
     style=[IgCollapsibleWidthStyle],
@@
 }
 
 ///|
-fn ig_collapsible_settings_view() -> @rabbita.Val[@html.Html] {
+fn ig_collapsible_settings_view() -> @rabbita.ValRenamed[@html.Html] {
   @rui.collapsible(
     id="showcase-collapsible-settings",
     style=[IgCollapsibleCardStyle],
@@
 }
 
 ///|
-fn ig_collapsible_file_tree_view() -> @rabbita.Val[@html.Html] {
+fn ig_collapsible_file_tree_view() -> @rabbita.ValRenamed[@html.Html] {
   let view_tabs = @rui.tabs(
     id="showcase-file-tree-tabs",
     default_value="explorer",
*** Update File: <WORKDIR>/website\homepage\components\interactions_gallery.mbt
@@
   use_inset : Bool,
   mobile : Bool,
   resizable : Bool,
-) -> @rabbita.Val[@html.Html] {
+) -> @rabbita.ValRenamed[@html.Html] {
   @rui.sidebar_provider(
     default_collapsed~,
     style=[IgSidebarVariantFrameStyle],
@@
 }
 
 ///|
-fn ig_sidebar_loading_variant() -> @rabbita.Val[@html.Html] {
+fn ig_sidebar_loading_variant() -> @rabbita.ValRenamed[@html.Html] {
   @rui.sidebar_provider(
     default_collapsed=false,
     style=[IgSidebarVariantFrameStyle],
@@
 }
 
 ///|
-fn ig_navigation_page(selected : String) -> @rabbita.Val[@html.Html] {
+fn ig_navigation_page(selected : String) -> @rabbita.ValRenamed[@html.Html] {
   let accordion_view = @rui.accordion(
     id="showcase-accordion",
     type_=Single,
@@
   modal : Bool,
   trigger_variant : @rui.ButtonVariant,
   trigger_label : String,
-) -> @rabbita.Val[@html.Html] {
+) -> @rabbita.ValRenamed[@html.Html] {
   @rui.dialog(id~, modal~, scope => {
     @html.fragment([
       @rui.dialog_trigger(scope, variant=trigger_variant, trigger_label),
@@
   id : String,
   direction : @rui.DrawerDirection,
   trigger_label : String,
-) -> @rabbita.Val[@html.Html] {
+) -> @rabbita.ValRenamed[@html.Html] {
   @rui.drawer(id~, scope => {
     @html.fragment([
       @rui.drawer_trigger(scope, variant=Outline, trigger_label),
@@
   id : String,
   side : @rui.SheetSide,
   trigger_label : String,
-) -> @rabbita.Val[@html.Html] {
+) -> @rabbita.ValRenamed[@html.Html] {
   @rui.sheet(id~, scope => {
     @html.fragment([
       @rui.sheet_trigger(scope, variant=Outline, trigger_label),
@@
   side : @rui.PopupSide,
   align : @rui.PopupAlign,
   trigger_label : String,
-) -> @rabbita.Val[@html.Html] {
+) -> @rabbita.ValRenamed[@html.Html] {
   let title_id = id + "-title"
   let description_id = id + "-description"
   @rui.popover(
@@
   side : @rui.PopupSide,
   align : @rui.PopupAlign,
   trigger_label : String,
-) -> @rabbita.Val[@html.Html] {
+) -> @rabbita.ValRenamed[@html.Html] {
   @rui.hover_card(
     id~,
     href="#rabbita-profile",
@@
   align : @rui.PopupAlign,
   size : @rui.ButtonSize,
   label : String,
-) -> @rabbita.Val[@html.Html] {
+) -> @rabbita.ValRenamed[@html.Html] {
   @rui.tooltip(
     id~,
     delay=100,
@@
 }
 
 ///|
-fn ig_overlay_page(selected : String) -> @rabbita.Val[@html.Html] {
+fn ig_overlay_page(selected : String) -> @rabbita.ValRenamed[@html.Html] {
   let alert_dialog_view = @rui.alert_dialog(id="showcase-alert-dialog", scope => {
     @html.fragment([
       @rui.alert_dialog_trigger(scope, variant=Destructive, "Delete snapshot"),
@@
 }
 
 ///|
-fn ig_feedback_page(selected : String) -> @rabbita.Val[@html.Html] {
+fn ig_feedback_page(selected : String) -> @rabbita.ValRenamed[@html.Html] {
   let sonner_default_view = @rui.sonner(max_toasts=3, position="bottom-right", scope => {
     @rui.button(
       size=Sm,
*** Update File: <WORKDIR>/website\homepage\components\page.mbt
@@
 }
 
 ///|
-fn showcase_component_page(slug : String) -> @rabbita.Val[@html.Html] {
+fn showcase_component_page(slug : String) -> @rabbita.ValRenamed[@html.Html] {
   match slug {
     "alert"
     | "aspect-ratio"
@@
 
 ///|
 pub fn components_page(
-  dark : @rabbita.Val[Bool],
+  dark : @rabbita.ValRenamed[Bool],
   slug : String,
-) -> @rabbita.Val[@html.Html] {
+) -> @rabbita.ValRenamed[@html.Html] {
   let component = showcase_component_page(slug)
   dark.view2(component, (dark, component) => {
     showcase_view(dark, slug, component)
*** Update File: <WORKDIR>/website\homepage\components\showcase_pages_forms.mbt
@@
 ///|
-fn showcase_input_page() -> @rabbita.Val[@html.Html] {
+fn showcase_input_page() -> @rabbita.ValRenamed[@html.Html] {
   let (input_name, set_input_name) = @rabbita.create_variable("Ada Lovelace")
   let (input_email, set_input_email) = @rabbita.create_variable(
     "ada@example.com",
@@
 }
 
 ///|
-fn showcase_textarea_page() -> @rabbita.Val[@html.Html] {
+fn showcase_textarea_page() -> @rabbita.ValRenamed[@html.Html] {
   let (textarea_note, set_textarea_note) = @rabbita.create_variable(
     "Ship the first programmable workspace.",
   )
@@
 }
 
 ///|
-fn showcase_radio_group_page() -> @rabbita.Val[@html.Html] {
+fn showcase_radio_group_page() -> @rabbita.ValRenamed[@html.Html] {
   let (plan, set_plan) = @rabbita.create_variable("monthly")
   let horizontal = @rui.radio_group(
     default_value="monthly",
@@
 }
 
 ///|
-fn showcase_slider_page() -> @rabbita.Val[@html.Html] {
+fn showcase_slider_page() -> @rabbita.ValRenamed[@html.Html] {
   let (density_value, set_density) = @rabbita.create_variable(64)
   let density_slider = @rui.slider(
     id="forms-gallery-density",
@@
 }
 
 ///|
-fn showcase_field_page() -> @rabbita.Val[@html.Html] {
+fn showcase_field_page() -> @rabbita.ValRenamed[@html.Html] {
   let (form_state, set_form_state) = @rabbita.create_variable(
     (
       "Ada Lovelace", "ada@example.com", "analytical-engine", "Ship the first programmable workspace.",
@@
 }
 
 ///|
-fn showcase_forms_page(slug : String) -> @rabbita.Val[@html.Html] {
+fn showcase_forms_page(slug : String) -> @rabbita.ValRenamed[@html.Html] {
   match slug {
     "calendar" => calendar_showcase()
     "checkbox" => forms_checkbox_variants()
*** Update File: <WORKDIR>/website\homepage\components\showcase_pages_foundations.mbt
@@
 ///|
-fn showcase_static_page(body : @html.Html) -> @rabbita.Val[@html.Html] {
+fn showcase_static_page(body : @html.Html) -> @rabbita.ValRenamed[@html.Html] {
-  @rabbita.Val::constant(body)
+  @rabbita.ValRenamed::constant(body)
 }
 
 ///|
-fn showcase_toggle_page() -> @rabbita.Val[@html.Html] {
+fn showcase_toggle_page() -> @rabbita.ValRenamed[@html.Html] {
   let pin_view = @rui.toggle(
     variant=Outline,
     size=Lg,
@@
 }
 
 ///|
-fn showcase_toggle_group_page() -> @rabbita.Val[@html.Html] {
+fn showcase_toggle_group_page() -> @rabbita.ValRenamed[@html.Html] {
   let density_view = @rui.toggle_group(
     default_values=["grid"],
     variant=Outline,
@@
 }
 
 ///|
-fn showcase_foundations_page(slug : String) -> @rabbita.Val[@html.Html] {
+fn showcase_foundations_page(slug : String) -> @rabbita.ValRenamed[@html.Html] {
   match slug {
     "alert" => showcase_static_page(foundations_alert_demo())
     "aspect-ratio" => showcase_static_page(foundations_aspect_ratio_demo())
*** Update File: <WORKDIR>/website\homepage\main\main.mbt
@@
 }
 
 ///|
-using @rabbita {type Html, type Val, type Cmd, batch, none}
+using @rabbita {type Html, type ValRenamed, type Cmd, batch, none}
 
 ///|
 enum Theme {
*** Update File: <WORKDIR>/website\playground\main\main.mbt
@@
 using @html {a, button, div, iframe, li, nothing, option, pre, select, span, ul}
 
 ///|
-using @rabbita {type Cmd, type Emit, type Html, type Val}
+using @rabbita {type Cmd, type Emit, type Html, type ValRenamed}
 
 ///|
 struct Diagnostic {
*** End Patch

```
