# rabbita rename Html rabbita\deprecated.mbt:6:27

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\rabbita' moon ide rename 'Html' 'HtmlRenamed' --loc 'rabbita\deprecated.mbt:6:27'
*** Begin Patch
*** Update File: <WORKDIR>/doc\001_intro\using_test.mbt
@@
 ///|
-using @rabbita {type Val, type Html}
+using @rabbita {type Val, type HtmlRenamed}
 
 ///|
 using @html {div, h1, button}
*** Update File: <WORKDIR>/doc\002_writing_html\using_test.mbt
@@
 ///|
-using @rabbita {type Emit, type Html}
+using @rabbita {type Emit, type HtmlRenamed}
 
 ///|
 using @html {
*** Update File: <WORKDIR>/doc\003_router\using_test.mbt
@@
 ///|
-using @rabbita {type Html, type Val, none}
+using @rabbita {type HtmlRenamed, type Val, none}
 
 ///|
 using @html {ul, div, li, a, p, h1}
*** Update File: <WORKDIR>/doc\004_using_command\using_test.mbt
@@
 ///|
-using @rabbita {type Emit, type Cmd, type Html, none, batch}
+using @rabbita {type Emit, type Cmd, type HtmlRenamed, none, batch}
 
 ///|
 using @html {div, h1, p, button}
*** Update File: <WORKDIR>/doc\005_http\using_test.mbt
@@
 ///|
-using @rabbita {type Emit, type Cmd, type Html, none}
+using @rabbita {type Emit, type Cmd, type HtmlRenamed, none}
 
 ///|
 using @html {div, p, button}
*** Update File: <WORKDIR>/doc\component_and_incremental\using_test.mbt
@@
 ///|
-using @rabbita {type Cmd, type Emit, type Html, type Val}
+using @rabbita {type Cmd, type Emit, type HtmlRenamed, type Val}
 
 ///|
 using @html {button, div, h1, h2, li, main_, nothing, p, section, span, ul}
*** Update File: <WORKDIR>/doc\using_subscriptions\using_test.mbt
@@
 ///|
-using @rabbita {type Emit, type Val, type Html, none}
+using @rabbita {type Emit, type Val, type HtmlRenamed, none}
 
 ///|
 using @html {div, h1, p}
*** Update File: <WORKDIR>/e2e\apps\collections-lifecycle\components.mbt
@@
 ///|
-using @rabbita {type Html, type Val}
+using @rabbita {type HtmlRenamed, type Val}
 
 ///|
 using @html {button, div, h1, input, li, p, span, ul}
*** Update File: <WORKDIR>/e2e\apps\commands-and-async\commands.mbt
@@
 ///|
-using @rabbita {type Cmd, type Emit, type Html, type Val}
+using @rabbita {type Cmd, type Emit, type HtmlRenamed, type Val}
 
 ///|
 using @html {button, div, h1, p}
*** Update File: <WORKDIR>/e2e\apps\counter\main.mbt
@@
 ///|
-using @rabbita {type Html, type Val}
+using @rabbita {type HtmlRenamed, type Val}
 
 ///|
 using @html {button, div, h1}
*** Update File: <WORKDIR>/e2e\apps\dom-api\app.mbt
@@
 ///|
-using @rabbita {type Html, type Val}
+using @rabbita {type HtmlRenamed, type Val}
 
 ///|
 using @html {button, div, h1, input, p}
*** Update File: <WORKDIR>/e2e\apps\forms-and-events\view.mbt
@@
 ///|
-using @rabbita {type Html, type Val}
+using @rabbita {type HtmlRenamed, type Val}
 
 ///|
 using @html {button, div, form, h1, input, label, option, p, select}
*** Update File: <WORKDIR>/e2e\apps\http\http_app.mbt
@@
 ///|
-using @rabbita {type Cmd, type Emit, type Html, type Resource, type Val}
+using @rabbita {type Cmd, type Emit, type HtmlRenamed, type Resource, type Val}
 
 ///|
 using @html {button, div, h1, p}
*** Update File: <WORKDIR>/e2e\apps\memo\app.mbt
@@
 ///|
-using @rabbita {type Html, type Val, type Emit}
+using @rabbita {type HtmlRenamed, type Val, type Emit}
 
 ///|
 using @html {button, div, h1, input, p, span}
*** Update File: <WORKDIR>/e2e\apps\navigation-history\navigation.mbt
@@
 ///|
-using @rabbita {type Cmd, type Emit, type Html, type Val}
+using @rabbita {type Cmd, type Emit, type HtmlRenamed, type Val}
 
 ///|
 using @html {button, div, h1, p}
*** Update File: <WORKDIR>/e2e\apps\rui\main.mbt
@@
 ///|
-using @rabbita {type Cmd, type Emit, type Html, type Val}
+using @rabbita {type Cmd, type Emit, type HtmlRenamed, type Val}
 
 ///|
 using @html {
*** Update File: <WORKDIR>/e2e\apps\state-and-messages\state.mbt
@@
 ///|
-using @rabbita {type Html, type Val}
+using @rabbita {type HtmlRenamed, type Val}
 
 ///|
 using @html {button, div, h1, input, p}
*** Update File: <WORKDIR>/e2e\apps\subscriptions\subscriptions.mbt
@@
 ///|
-using @rabbita {type Cmd, type Emit, type Html, type Val}
+using @rabbita {type Cmd, type Emit, type HtmlRenamed, type Val}
 
 ///|
 using @html {button, div, h1, p}
*** Update File: <WORKDIR>/examples\animation\main\animation_tab.mbt
@@
   emit : @rabbita.Emit[Msg],
   active_index : Int,
   index : Int,
-) -> @rabbita.Html {
+) -> @rabbita.HtmlRenamed {
   let class = if active_index == index { "tab active" } else { "tab" }
   @html.button(
     class~,
@@
 fn animation_actions(
   emit : @rabbita.Emit[Msg],
   active_index : Int,
-) -> Array[@rabbita.Html] {
+) -> Array[@rabbita.HtmlRenamed] {
   animation_pattern_indices().map(index => {
     animation_pattern_button(emit, active_index, index)
   })
*** Update File: <WORKDIR>/examples\animation\main\client.mbt
@@
 using @html {div, h1}
 
 ///|
-using @rabbita {type Cmd, type Emit, type Html, type Val}
+using @rabbita {type Cmd, type Emit, type HtmlRenamed, type Val}
 
 ///|
 enum Msg {
*** Update File: <WORKDIR>/examples\counter\main\main.mbt
@@
-using @rabbita { type Val, type Html, create_pure_state, new }
+using @rabbita { type Val, type HtmlRenamed, create_pure_state, new }
 using @html {div, h1, button}
 
 enum Msg {
*** Update File: <WORKDIR>/examples\shiki_editor\main\client.mbt
@@
 using @html {div, h1, option, p, select, textarea, nothing}
 
 ///|
-using @rabbita {type Emit, type Html, type Val}
+using @rabbita {type Emit, type HtmlRenamed, type Val}
 
 ///|
 let language_items : Array[(String, String)] = [
*** Update File: <WORKDIR>/examples\sokoban\main\main.mbt
@@
 using @html {div, input, label, main_, nothing, section, span}
 
 ///|
-using @rabbita {type Emit, type Html, type Val, new, create_state, none}
+using @rabbita {type Emit, type HtmlRenamed, type Val, new, create_state, none}
 
 ///|
 using @string {parse_int}
*** Update File: <WORKDIR>/examples\subscriptions\main\client.mbt
@@
 using @common {type Keyboard, type Mouse, type Scroll, type Viewport}
 
 ///|
-using @rabbita {type Cmd, type Emit, type Html, type Val}
+using @rabbita {type Cmd, type Emit, type HtmlRenamed, type Val}
 
 ///|
 enum Tab {
*** Update File: <WORKDIR>/examples\todo\main\main.mbt
@@
 using @vector {type Vector, from_iter}
 
 ///|
-using @rabbita {type Val, none, type Emit, type Html }
+using @rabbita {type Val, none, type Emit, type HtmlRenamed }
 
 ///|
 using @html {button, div, h1, input, li, nav, span, ul, form, text, p}
*** Update File: <WORKDIR>/examples\websocket\main\client.mbt
@@
 using @html {button, code, div, fragment, h1, h2, input, nothing, p, textarea}
 
 ///|
-using @rabbita {type Cmd, type Emit, type Html, type Val}
+using @rabbita {type Cmd, type Emit, type HtmlRenamed, type Val}
 
 ///|
 using @websocket {type CloseInfo, type Event, type ReadyState, type Snapshot}
*** Update File: <WORKDIR>/rabbita\deprecated.mbt
@@
 ///
 /// New components should return `Val[Html]` directly.
 #deprecated("Use a `() -> Val[Html]` component. Nested `Cell::view()` composition is no longer supported; use `Val::map`, `Val::switch`, or `Val::assoc` instead.", skip_current_package=true)
-pub type Cell = () -> Val[Html]
+pub type Cell = () -> Val[HtmlRenamed]
 
 ///|
 #cfg(target="js")
@@
 fn[Model, Msg] make_deprecated_cell(
   model~ : Model,
   update~ : (Emit[Msg], Msg, Model) -> (Cmd, Model),
-  view~ : (Emit[Msg], Model) -> Html,
+  view~ : (Emit[Msg], Model) -> HtmlRenamed,
   subscriptions? : (Emit[Msg], Model) -> @sub.Sub,
 ) -> (Emit[Msg], Cell) {
   let actual_emit : Ref[Emit[Msg]?] = Ref(None)
@@
 pub fn[Model, Msg] cell(
   model~ : Model,
   update~ : (Emit[Msg], Msg, Model) -> (Cmd, Model),
-  view~ : (Emit[Msg], Model) -> Html,
+  view~ : (Emit[Msg], Model) -> HtmlRenamed,
   subscriptions? : (Emit[Msg], Model) -> @sub.Sub,
 ) -> Cell {
   make_deprecated_cell(model~, update~, view~, subscriptions?).1
@@
 pub fn[Model, Msg] cell_with_emit(
   model~ : Model,
   update~ : (Emit[Msg], Msg, Model) -> (Cmd, Model),
-  view~ : (Emit[Msg], Model) -> Html,
+  view~ : (Emit[Msg], Model) -> HtmlRenamed,
   subscriptions? : (Emit[Msg], Model) -> @sub.Sub,
 ) -> (Emit[Msg], Cell) {
   make_deprecated_cell(model~, update~, view~, subscriptions?)
@@
 pub fn[Model, Msg] simple_cell(
   model~ : Model,
   update~ : (Msg, Model) -> Model,
-  view~ : (Emit[Msg], Model) -> Html,
+  view~ : (Emit[Msg], Model) -> HtmlRenamed,
 ) -> Cell {
   make_deprecated_cell(
     model~,
@@
 pub fn[Model, Msg] simple_cell_with_emit(
   model~ : Model,
   update~ : (Msg, Model) -> Model,
-  view~ : (Emit[Msg], Model) -> Html,
+  view~ : (Emit[Msg], Model) -> HtmlRenamed,
   subscriptions? : (Emit[Msg], Model) -> @sub.Sub,
 ) -> (Emit[Msg], Cell) {
   make_deprecated_cell(
@@
 ///|
 /// Compatibility wrapper for the former static Cell constructor.
 #deprecated("Use a component returning `Val::constant(html)` instead.", skip_current_package=true)
-pub fn static_cell(html : Html) -> Cell {
+pub fn static_cell(html : HtmlRenamed) -> Cell {
   () => Val::constant(html)
 }
*** Update File: <WORKDIR>/rabbita\incremental.mbt
@@
 /// Creates an HTML view derived from one incremental value.
 ///
 /// The render function is reevaluated when `a` changes.
-pub fn[A : Eq] Val::view(a : Val[A], render : (A) -> Html) -> Val[Html] {
+pub fn[A : Eq] Val::view(a : Val[A], render : (A) -> HtmlRenamed) -> Val[HtmlRenamed] {
   a.0.map(render)
 }
 
@@
 pub fn[A : Eq, B : Eq] Val::view2(
   a : Val[A],
   b : Val[B],
-  render : (A, B) -> Html,
+  render : (A, B) -> HtmlRenamed,
-) -> Val[Html] {
+) -> Val[HtmlRenamed] {
   a.0.map2(b.0, render)
 }
 
@@
   a : Val[A],
   b : Val[B],
   c : Val[C],
-  render : (A, B, C) -> Html,
+  render : (A, B, C) -> HtmlRenamed,
-) -> Val[Html] {
+) -> Val[HtmlRenamed] {
   a.0.map3(b.0, c.0, render)
 }
 
@@
   b : Val[B],
   c : Val[C],
   d : Val[D],
-  render : (A, B, C, D) -> Html,
+  render : (A, B, C, D) -> HtmlRenamed,
-) -> Val[Html] {
+) -> Val[HtmlRenamed] {
   a.0.map4(b.0, c.0, d.0, render)
 }
 
@@
   c : Val[C],
   d : Val[D],
   e : Val[E],
-  render : (A, B, C, D, E) -> Html,
+  render : (A, B, C, D, E) -> HtmlRenamed,
-) -> Val[Html] {
+) -> Val[HtmlRenamed] {
   a.0.map5(b.0, c.0, d.0, e.0, render)
 }
 
@@
   d : Val[D],
   e : Val[E],
   f : Val[F],
-  render : (A, B, C, D, E, F) -> Html,
+  render : (A, B, C, D, E, F) -> HtmlRenamed,
-) -> Val[Html] {
+) -> Val[HtmlRenamed] {
   a.0.map6(b.0, c.0, d.0, e.0, f.0, render)
 }
 
@@
   e : Val[E],
   f : Val[F],
   g : Val[G],
-  render : (A, B, C, D, E, F, G) -> Html,
+  render : (A, B, C, D, E, F, G) -> HtmlRenamed,
-) -> Val[Html] {
+) -> Val[HtmlRenamed] {
   a.0.map7(b.0, c.0, d.0, e.0, f.0, g.0, render)
 }
 
@@
   f : Val[F],
   g : Val[G],
   h : Val[H],
-  render : (A, B, C, D, E, F, G, H) -> Html,
+  render : (A, B, C, D, E, F, G, H) -> HtmlRenamed,
-) -> Val[Html] {
+) -> Val[HtmlRenamed] {
   a.0.map8(b.0, c.0, d.0, e.0, f.0, g.0, h.0, render)
 }
 
@@
   g : Val[G],
   h : Val[H],
   i : Val[I],
-  render : (A, B, C, D, E, F, G, H, I) -> Html,
+  render : (A, B, C, D, E, F, G, H, I) -> HtmlRenamed,
-) -> Val[Html] {
+) -> Val[HtmlRenamed] {
   a.0.map9(b.0, c.0, d.0, e.0, f.0, g.0, h.0, i.0, render)
 }
 
*** Update File: <WORKDIR>/rabbita\top.mbt
@@
 pub using @cmd {none, batch, delay, type Cmd}
 
 ///|
-pub using @html {type Html}
+pub using @html {type HtmlRenamed}
 
 ///|
 /// A running Rabbita application.
 struct App {
-  builder : () -> Val[Html]
+  builder : () -> Val[HtmlRenamed]
 }
 
 ///|
@@
 /// The builder runs when the app is mounted and must return its root
 /// incremental HTML value. Use `Val::map`, `Val::switch`, and `Val::assoc` to
 /// express subsequent changes, then call `App::mount` to start the app.
-pub fn new(builder : () -> Val[Html]) -> App {
+pub fn new(builder : () -> Val[HtmlRenamed]) -> App {
   { builder, }
 }
 
@@
 /// optional subscriptions.
 pub fn[Model : Eq, Msg] elmish(
   model~ : Model,
-  view~ : (Model, Emit[Msg]) -> Html,
+  view~ : (Model, Emit[Msg]) -> HtmlRenamed,
   update~ : (Model, Msg, Emit[Msg]) -> (Model, Cmd),
   subscriptions? : (Model, Emit[Msg]) -> @sub.Sub,
 ) -> App {
*** Update File: <WORKDIR>/utils\shiki\shiki.mbt
@@
 }
 
 ///|
-using @rabbita {type Html, type Val}
+using @rabbita {type HtmlRenamed, type Val}
*** Update File: <WORKDIR>/website\homepage\main\main.mbt
@@
 }
 
 ///|
-using @rabbita {type Html, type Val, type Cmd, batch, none}
+using @rabbita {type HtmlRenamed, type Val, type Cmd, batch, none}
 
 ///|
 enum Theme {
*** Update File: <WORKDIR>/website\playground\main\main.mbt
@@
 using @html {a, button, div, iframe, li, nothing, option, pre, select, span, ul}
 
 ///|
-using @rabbita {type Cmd, type Emit, type Html, type Val}
+using @rabbita {type Cmd, type Emit, type HtmlRenamed, type Val}
 
 ///|
 struct Diagnostic {
*** End Patch

```
