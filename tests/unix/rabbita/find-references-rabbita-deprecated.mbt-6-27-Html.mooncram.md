# rabbita find-references Html rabbita/deprecated.mbt:6:27

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
$ run_moon_ide moon ide find-references 'Html' --loc 'rabbita/deprecated.mbt:6:27'
Found 28 references for symbol 'Html':
<WORKDIR>/examples/SSR/main/common.mbt:5:32-5:36:
  | using @html {a, div, h1, h2, li, text, ul}
  | 
  | ///|
5 | using @rabbita {type Cmd, type Html}
  |                                ^^^^
  | 
  | ///|

<WORKDIR>/rabbita/deprecated.mbt:6:27-6:31:
  | ///
  | /// New components should return `Val[Html]` directly.
  | #deprecated("Use a `() -> Val[Html]` component. Nested `Cell::view()` composition is no longer supported; use `Val::map`, `Val::switch`, or `Val::assoc` instead.", skip_current_package=true)
6 | pub type Cell = () -> Val[Html]
  |                           ^^^^
  | 
  | ///|

<WORKDIR>/rabbita/deprecated.mbt:68:33-68:37:
   | fn[Model, Msg] make_deprecated_cell(
   |   model~ : Model,
   |   update~ : (Emit[Msg], Msg, Model) -> (Cmd, Model),
68 |   view~ : (Emit[Msg], Model) -> Html,
   |                                 ^^^^
   |   subscriptions? : (Emit[Msg], Model) -> @sub.Sub,
   | ) -> (Emit[Msg], Cell) {

<WORKDIR>/rabbita/deprecated.mbt:87:33-87:37:
   | pub fn[Model, Msg] cell(
   |   model~ : Model,
   |   update~ : (Emit[Msg], Msg, Model) -> (Cmd, Model),
87 |   view~ : (Emit[Msg], Model) -> Html,
   |                                 ^^^^
   |   subscriptions? : (Emit[Msg], Model) -> @sub.Sub,
   | ) -> Cell {

<WORKDIR>/rabbita/deprecated.mbt:100:33-100:37:
    | pub fn[Model, Msg] cell_with_emit(
    |   model~ : Model,
    |   update~ : (Emit[Msg], Msg, Model) -> (Cmd, Model),
100 |   view~ : (Emit[Msg], Model) -> Html,
    |                                 ^^^^
    |   subscriptions? : (Emit[Msg], Model) -> @sub.Sub,
    | ) -> (Emit[Msg], Cell) {

<WORKDIR>/rabbita/deprecated.mbt:112:33-112:37:
    | pub fn[Model, Msg] simple_cell(
    |   model~ : Model,
    |   update~ : (Msg, Model) -> Model,
112 |   view~ : (Emit[Msg], Model) -> Html,
    |                                 ^^^^
    | ) -> Cell {
    |   make_deprecated_cell(

<WORKDIR>/rabbita/deprecated.mbt:128:33-128:37:
    | pub fn[Model, Msg] simple_cell_with_emit(
    |   model~ : Model,
    |   update~ : (Msg, Model) -> Model,
128 |   view~ : (Emit[Msg], Model) -> Html,
    |                                 ^^^^
    |   subscriptions? : (Emit[Msg], Model) -> @sub.Sub,
    | ) -> (Emit[Msg], Cell) {

<WORKDIR>/rabbita/deprecated.mbt:142:27-142:31:
    | ///|
    | /// Compatibility wrapper for the former static Cell constructor.
    | #deprecated("Use a component returning `Val::constant(html)` instead.", skip_current_package=true)
142 | pub fn static_cell(html : Html) -> Cell {
    |                           ^^^^
    |   () => Val::constant(html)
    | }

<WORKDIR>/rabbita/incremental.mbt:183:54-183:58:
    | /// Creates an HTML view derived from one incremental value.
    | ///
    | /// The render function is reevaluated when `a` changes.
183 | pub fn[A : Eq] Val::view(a : Val[A], render : (A) -> Html) -> Val[Html] {
    |                                                      ^^^^
    |   a.0.map(render)
    | }

<WORKDIR>/rabbita/incremental.mbt:183:67-183:71:
    | /// Creates an HTML view derived from one incremental value.
    | ///
    | /// The render function is reevaluated when `a` changes.
183 | pub fn[A : Eq] Val::view(a : Val[A], render : (A) -> Html) -> Val[Html] {
    |                                                                   ^^^^
    |   a.0.map(render)
    | }

<WORKDIR>/rabbita/incremental.mbt:194:22-194:26:
    | pub fn[A : Eq, B : Eq] Val::view2(
    |   a : Val[A],
    |   b : Val[B],
194 |   render : (A, B) -> Html,
    |                      ^^^^
    | ) -> Val[Html] {
    |   a.0.map2(b.0, render)

<WORKDIR>/rabbita/incremental.mbt:195:10-195:14:
    |   a : Val[A],
    |   b : Val[B],
    |   render : (A, B) -> Html,
195 | ) -> Val[Html] {
    |          ^^^^
    |   a.0.map2(b.0, render)
    | }

<WORKDIR>/rabbita/incremental.mbt:207:25-207:29:
    |   a : Val[A],
    |   b : Val[B],
    |   c : Val[C],
207 |   render : (A, B, C) -> Html,
    |                         ^^^^
    | ) -> Val[Html] {
    |   a.0.map3(b.0, c.0, render)

<WORKDIR>/rabbita/incremental.mbt:208:10-208:14:
    |   b : Val[B],
    |   c : Val[C],
    |   render : (A, B, C) -> Html,
208 | ) -> Val[Html] {
    |          ^^^^
    |   a.0.map3(b.0, c.0, render)
    | }

<WORKDIR>/rabbita/incremental.mbt:221:28-221:32:
    |   b : Val[B],
    |   c : Val[C],
    |   d : Val[D],
221 |   render : (A, B, C, D) -> Html,
    |                            ^^^^
    | ) -> Val[Html] {
    |   a.0.map4(b.0, c.0, d.0, render)

<WORKDIR>/rabbita/incremental.mbt:222:10-222:14:
    |   c : Val[C],
    |   d : Val[D],
    |   render : (A, B, C, D) -> Html,
222 | ) -> Val[Html] {
    |          ^^^^
    |   a.0.map4(b.0, c.0, d.0, render)
    | }

<WORKDIR>/rabbita/incremental.mbt:236:31-236:35:
    |   c : Val[C],
    |   d : Val[D],
    |   e : Val[E],
236 |   render : (A, B, C, D, E) -> Html,
    |                               ^^^^
    | ) -> Val[Html] {
    |   a.0.map5(b.0, c.0, d.0, e.0, render)

<WORKDIR>/rabbita/incremental.mbt:237:10-237:14:
    |   d : Val[D],
    |   e : Val[E],
    |   render : (A, B, C, D, E) -> Html,
237 | ) -> Val[Html] {
    |          ^^^^
    |   a.0.map5(b.0, c.0, d.0, e.0, render)
    | }

<WORKDIR>/rabbita/incremental.mbt:252:34-252:38:
    |   d : Val[D],
    |   e : Val[E],
    |   f : Val[F],
252 |   render : (A, B, C, D, E, F) -> Html,
    |                                  ^^^^
    | ) -> Val[Html] {
    |   a.0.map6(b.0, c.0, d.0, e.0, f.0, render)

<WORKDIR>/rabbita/incremental.mbt:253:10-253:14:
    |   e : Val[E],
    |   f : Val[F],
    |   render : (A, B, C, D, E, F) -> Html,
253 | ) -> Val[Html] {
    |          ^^^^
    |   a.0.map6(b.0, c.0, d.0, e.0, f.0, render)
    | }

<WORKDIR>/rabbita/incremental.mbt:269:37-269:41:
    |   e : Val[E],
    |   f : Val[F],
    |   g : Val[G],
269 |   render : (A, B, C, D, E, F, G) -> Html,
    |                                     ^^^^
    | ) -> Val[Html] {
    |   a.0.map7(b.0, c.0, d.0, e.0, f.0, g.0, render)

<WORKDIR>/rabbita/incremental.mbt:270:10-270:14:
    |   f : Val[F],
    |   g : Val[G],
    |   render : (A, B, C, D, E, F, G) -> Html,
270 | ) -> Val[Html] {
    |          ^^^^
    |   a.0.map7(b.0, c.0, d.0, e.0, f.0, g.0, render)
    | }

<WORKDIR>/rabbita/incremental.mbt:287:40-287:44:
    |   f : Val[F],
    |   g : Val[G],
    |   h : Val[H],
287 |   render : (A, B, C, D, E, F, G, H) -> Html,
    |                                        ^^^^
    | ) -> Val[Html] {
    |   a.0.map8(b.0, c.0, d.0, e.0, f.0, g.0, h.0, render)

<WORKDIR>/rabbita/incremental.mbt:288:10-288:14:
    |   g : Val[G],
    |   h : Val[H],
    |   render : (A, B, C, D, E, F, G, H) -> Html,
288 | ) -> Val[Html] {
    |          ^^^^
    |   a.0.map8(b.0, c.0, d.0, e.0, f.0, g.0, h.0, render)
    | }

<WORKDIR>/rabbita/incremental.mbt:306:43-306:47:
    |   g : Val[G],
    |   h : Val[H],
    |   i : Val[I],
306 |   render : (A, B, C, D, E, F, G, H, I) -> Html,
    |                                           ^^^^
    | ) -> Val[Html] {
    |   a.0.map9(b.0, c.0, d.0, e.0, f.0, g.0, h.0, i.0, render)

<WORKDIR>/rabbita/incremental.mbt:307:10-307:14:
    |   h : Val[H],
    |   i : Val[I],
    |   render : (A, B, C, D, E, F, G, H, I) -> Html,
307 | ) -> Val[Html] {
    |          ^^^^
    |   a.0.map9(b.0, c.0, d.0, e.0, f.0, g.0, h.0, i.0, render)
    | }

<WORKDIR>/rabbita/top.mbt:12:10-12:14:
   | pub type Cmd = @cmd.Cmd
   | 
   | ///|
12 | pub type Html = @html.Html
   |          ^^^^
   | 
   | ///|

<WORKDIR>/rabbita/top.mbt:147:45-147:49:
    | /// }
    | /// ```
    | #internal(unstable, "Experimental API")
147 | pub fn render_to_string(builder : () -> Val[Html]) -> String {
    |                                             ^^^^
    |   @runtime.server_side_render(() => builder().0.read().0)
    | }

```
