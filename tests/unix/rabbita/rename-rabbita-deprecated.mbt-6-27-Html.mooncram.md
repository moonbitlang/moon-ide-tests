# rabbita rename Html rabbita/deprecated.mbt:6:27

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
$ run_moon_ide moon ide rename 'Html' 'HtmlRenamed' --loc 'rabbita/deprecated.mbt:6:27'
*** Begin Patch
*** Update File: <WORKDIR>/examples/SSR/main/common.mbt
@@
 using @html {a, div, h1, h2, li, text, ul}
 
 ///|
-using @rabbita {type Cmd, type Html}
+using @rabbita {type Cmd, type HtmlRenamed}
 
 ///|
 #cfg(target="js")
*** Update File: <WORKDIR>/rabbita/deprecated.mbt
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
   ignore(update)
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
 
*** Update File: <WORKDIR>/rabbita/incremental.mbt
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
 
*** Update File: <WORKDIR>/rabbita/top.mbt
@@
 pub type Cmd = @cmd.Cmd
 
 ///|
-pub type Html = @html.Html
+pub type HtmlRenamed = @html.Html
 
 ///|
 /// Creates an application from a root component builder.
@@
 /// }
 /// ```
 #internal(unstable, "Experimental API")
-pub fn render_to_string(builder : () -> Val[Html]) -> String {
+pub fn render_to_string(builder : () -> Val[HtmlRenamed]) -> String {
   @runtime.server_side_render(() => builder().0.read().0)
 }
*** End Patch

```
