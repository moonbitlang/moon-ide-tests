# rabbita find-references Html rabbita\deprecated.mbt:6:27

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\rabbita' moon ide find-references 'Html' --loc 'rabbita\deprecated.mbt:6:27'
Found 58 references for symbol 'Html':
<WORKDIR>/doc\001_intro\using_test.mbt:2:32-2:36:
  | ///|
2 | using @rabbita {type Val, type Html}
  |                                ^^^^
  | 
  | ///|

<WORKDIR>/doc\002_writing_html\using_test.mbt:2:33-2:37:
  | ///|
2 | using @rabbita {type Emit, type Html}
  |                                 ^^^^
  | 
  | ///|

<WORKDIR>/doc\003_router\using_test.mbt:2:22-2:26:
  | ///|
2 | using @rabbita {type Html, type Val, none}
  |                      ^^^^
  | 
  | ///|

<WORKDIR>/doc\004_using_command\using_test.mbt:2:43-2:47:
  | ///|
2 | using @rabbita {type Emit, type Cmd, type Html, none, batch}
  |                                           ^^^^
  | 
  | ///|

<WORKDIR>/doc\005_http\using_test.mbt:2:43-2:47:
  | ///|
2 | using @rabbita {type Emit, type Cmd, type Html, none}
  |                                           ^^^^
  | 
  | ///|

<WORKDIR>/doc\component_and_incremental\using_test.mbt:2:43-2:47:
  | ///|
2 | using @rabbita {type Cmd, type Emit, type Html, type Val}
  |                                           ^^^^
  | 
  | ///|

<WORKDIR>/doc\using_subscriptions\using_test.mbt:2:43-2:47:
  | ///|
2 | using @rabbita {type Emit, type Val, type Html, none}
  |                                           ^^^^
  | 
  | ///|

<WORKDIR>/e2e\apps\collections-lifecycle\components.mbt:2:22-2:26:
  | ///|
2 | using @rabbita {type Html, type Val}
  |                      ^^^^
  | 
  | ///|

<WORKDIR>/e2e\apps\commands-and-async\commands.mbt:2:43-2:47:
  | ///|
2 | using @rabbita {type Cmd, type Emit, type Html, type Val}
  |                                           ^^^^
  | 
  | ///|

<WORKDIR>/e2e\apps\counter\main.mbt:2:22-2:26:
  | ///|
2 | using @rabbita {type Html, type Val}
  |                      ^^^^
  | 
  | ///|

<WORKDIR>/e2e\apps\dom-api\app.mbt:2:22-2:26:
  | ///|
2 | using @rabbita {type Html, type Val}
  |                      ^^^^
  | 
  | ///|

<WORKDIR>/e2e\apps\forms-and-events\view.mbt:2:22-2:26:
  | ///|
2 | using @rabbita {type Html, type Val}
  |                      ^^^^
  | 
  | ///|

<WORKDIR>/e2e\apps\http\http_app.mbt:2:43-2:47:
  | ///|
2 | using @rabbita {type Cmd, type Emit, type Html, type Resource, type Val}
  |                                           ^^^^
  | 
  | ///|

<WORKDIR>/e2e\apps\memo\app.mbt:2:22-2:26:
  | ///|
2 | using @rabbita {type Html, type Val, type Emit}
  |                      ^^^^
  | 
  | ///|

<WORKDIR>/e2e\apps\navigation-history\navigation.mbt:2:43-2:47:
  | ///|
2 | using @rabbita {type Cmd, type Emit, type Html, type Val}
  |                                           ^^^^
  | 
  | ///|

<WORKDIR>/e2e\apps\rui\main.mbt:2:43-2:47:
  | ///|
2 | using @rabbita {type Cmd, type Emit, type Html, type Val}
  |                                           ^^^^
  | 
  | ///|

<WORKDIR>/e2e\apps\state-and-messages\state.mbt:2:22-2:26:
  | ///|
2 | using @rabbita {type Html, type Val}
  |                      ^^^^
  | 
  | ///|

<WORKDIR>/e2e\apps\subscriptions\subscriptions.mbt:2:43-2:47:
  | ///|
2 | using @rabbita {type Cmd, type Emit, type Html, type Val}
  |                                           ^^^^
  | 
  | ///|

<WORKDIR>/examples\animation\main\animation_tab.mbt:58:15-58:19:
   |   emit : @rabbita.Emit[Msg],
   |   active_index : Int,
   |   index : Int,
58 | ) -> @rabbita.Html {
   |               ^^^^
   |   let class = if active_index == index { "tab active" } else { "tab" }
   |   @html.button(

<WORKDIR>/examples\animation\main\animation_tab.mbt:71:21-71:25:
   | fn animation_actions(
   |   emit : @rabbita.Emit[Msg],
   |   active_index : Int,
71 | ) -> Array[@rabbita.Html] {
   |                     ^^^^
   |   animation_pattern_indices().map(index => {
   |     animation_pattern_button(emit, active_index, index)

<WORKDIR>/examples\animation\main\client.mbt:5:43-5:47:
  | using @html {div, h1}
  | 
  | ///|
5 | using @rabbita {type Cmd, type Emit, type Html, type Val}
  |                                           ^^^^
  | 
  | ///|

<WORKDIR>/examples\counter\main\main.mbt:1:33-1:37:
1 | using @rabbita { type Val, type Html, create_pure_state, new }
  |                                 ^^^^
  | using @html {div, h1, button}
  | 

<WORKDIR>/examples\shiki_editor\main\client.mbt:5:33-5:37:
  | using @html {div, h1, option, p, select, textarea, nothing}
  | 
  | ///|
5 | using @rabbita {type Emit, type Html, type Val}
  |                                 ^^^^
  | 
  | ///|

<WORKDIR>/examples\sokoban\main\main.mbt:8:33-8:37:
  | using @html {div, input, label, main_, nothing, section, span}
  | 
  | ///|
8 | using @rabbita {type Emit, type Html, type Val, new, create_state, none}
  |                                 ^^^^
  | 
  | ///|

<WORKDIR>/examples\subscriptions\main\client.mbt:8:43-8:47:
  | using @common {type Keyboard, type Mouse, type Scroll, type Viewport}
  | 
  | ///|
8 | using @rabbita {type Cmd, type Emit, type Html, type Val}
  |                                           ^^^^
  | 
  | ///|

<WORKDIR>/examples\todo\main\main.mbt:8:49-8:53:
  | using @vector {type Vector, from_iter}
  | 
  | ///|
8 | using @rabbita {type Val, none, type Emit, type Html }
  |                                                 ^^^^
  | 
  | ///|

<WORKDIR>/examples\websocket\main\client.mbt:5:43-5:47:
  | using @html {button, code, div, fragment, h1, h2, input, nothing, p, textarea}
  | 
  | ///|
5 | using @rabbita {type Cmd, type Emit, type Html, type Val}
  |                                           ^^^^
  | 
  | ///|

<WORKDIR>/rabbita\deprecated.mbt:6:27-6:31:
  | ///
  | /// New components should return `Val[Html]` directly.
  | #deprecated("Use a `() -> Val[Html]` component. Nested `Cell::view()` composition is no longer supported; use `Val::map`, `Val::switch`, or `Val::assoc` instead.", skip_current_package=true)
6 | pub type Cell = () -> Val[Html]
  |                           ^^^^
  | 
  | ///|

<WORKDIR>/rabbita\deprecated.mbt:23:33-23:37:
   | fn[Model, Msg] make_deprecated_cell(
   |   model~ : Model,
   |   update~ : (Emit[Msg], Msg, Model) -> (Cmd, Model),
23 |   view~ : (Emit[Msg], Model) -> Html,
   |                                 ^^^^
   |   subscriptions? : (Emit[Msg], Model) -> @sub.Sub,
   | ) -> (Emit[Msg], Cell) {

<WORKDIR>/rabbita\deprecated.mbt:87:33-87:37:
   | pub fn[Model, Msg] cell(
   |   model~ : Model,
   |   update~ : (Emit[Msg], Msg, Model) -> (Cmd, Model),
87 |   view~ : (Emit[Msg], Model) -> Html,
   |                                 ^^^^
   |   subscriptions? : (Emit[Msg], Model) -> @sub.Sub,
   | ) -> Cell {

<WORKDIR>/rabbita\deprecated.mbt:100:33-100:37:
    | pub fn[Model, Msg] cell_with_emit(
    |   model~ : Model,
    |   update~ : (Emit[Msg], Msg, Model) -> (Cmd, Model),
100 |   view~ : (Emit[Msg], Model) -> Html,
    |                                 ^^^^
    |   subscriptions? : (Emit[Msg], Model) -> @sub.Sub,
    | ) -> (Emit[Msg], Cell) {

<WORKDIR>/rabbita\deprecated.mbt:112:33-112:37:
    | pub fn[Model, Msg] simple_cell(
    |   model~ : Model,
    |   update~ : (Msg, Model) -> Model,
112 |   view~ : (Emit[Msg], Model) -> Html,
    |                                 ^^^^
    | ) -> Cell {
    |   make_deprecated_cell(

<WORKDIR>/rabbita\deprecated.mbt:128:33-128:37:
    | pub fn[Model, Msg] simple_cell_with_emit(
    |   model~ : Model,
    |   update~ : (Msg, Model) -> Model,
128 |   view~ : (Emit[Msg], Model) -> Html,
    |                                 ^^^^
    |   subscriptions? : (Emit[Msg], Model) -> @sub.Sub,
    | ) -> (Emit[Msg], Cell) {

<WORKDIR>/rabbita\deprecated.mbt:142:27-142:31:
    | ///|
    | /// Compatibility wrapper for the former static Cell constructor.
    | #deprecated("Use a component returning `Val::constant(html)` instead.", skip_current_package=true)
142 | pub fn static_cell(html : Html) -> Cell {
    |                           ^^^^
    |   () => Val::constant(html)
    | }

<WORKDIR>/rabbita\incremental.mbt:167:54-167:58:
    | /// Creates an HTML view derived from one incremental value.
    | ///
    | /// The render function is reevaluated when `a` changes.
167 | pub fn[A : Eq] Val::view(a : Val[A], render : (A) -> Html) -> Val[Html] {
    |                                                      ^^^^
    |   a.0.map(render)
    | }

<WORKDIR>/rabbita\incremental.mbt:167:67-167:71:
    | /// Creates an HTML view derived from one incremental value.
    | ///
    | /// The render function is reevaluated when `a` changes.
167 | pub fn[A : Eq] Val::view(a : Val[A], render : (A) -> Html) -> Val[Html] {
    |                                                                   ^^^^
    |   a.0.map(render)
    | }

<WORKDIR>/rabbita\incremental.mbt:178:22-178:26:
    | pub fn[A : Eq, B : Eq] Val::view2(
    |   a : Val[A],
    |   b : Val[B],
178 |   render : (A, B) -> Html,
    |                      ^^^^
    | ) -> Val[Html] {
    |   a.0.map2(b.0, render)

<WORKDIR>/rabbita\incremental.mbt:179:10-179:14:
    |   a : Val[A],
    |   b : Val[B],
    |   render : (A, B) -> Html,
179 | ) -> Val[Html] {
    |          ^^^^
    |   a.0.map2(b.0, render)
    | }

<WORKDIR>/rabbita\incremental.mbt:191:25-191:29:
    |   a : Val[A],
    |   b : Val[B],
    |   c : Val[C],
191 |   render : (A, B, C) -> Html,
    |                         ^^^^
    | ) -> Val[Html] {
    |   a.0.map3(b.0, c.0, render)

<WORKDIR>/rabbita\incremental.mbt:192:10-192:14:
    |   b : Val[B],
    |   c : Val[C],
    |   render : (A, B, C) -> Html,
192 | ) -> Val[Html] {
    |          ^^^^
    |   a.0.map3(b.0, c.0, render)
    | }

<WORKDIR>/rabbita\incremental.mbt:205:28-205:32:
    |   b : Val[B],
    |   c : Val[C],
    |   d : Val[D],
205 |   render : (A, B, C, D) -> Html,
    |                            ^^^^
    | ) -> Val[Html] {
    |   a.0.map4(b.0, c.0, d.0, render)

<WORKDIR>/rabbita\incremental.mbt:206:10-206:14:
    |   c : Val[C],
    |   d : Val[D],
    |   render : (A, B, C, D) -> Html,
206 | ) -> Val[Html] {
    |          ^^^^
    |   a.0.map4(b.0, c.0, d.0, render)
    | }

<WORKDIR>/rabbita\incremental.mbt:220:31-220:35:
    |   c : Val[C],
    |   d : Val[D],
    |   e : Val[E],
220 |   render : (A, B, C, D, E) -> Html,
    |                               ^^^^
    | ) -> Val[Html] {
    |   a.0.map5(b.0, c.0, d.0, e.0, render)

<WORKDIR>/rabbita\incremental.mbt:221:10-221:14:
    |   d : Val[D],
    |   e : Val[E],
    |   render : (A, B, C, D, E) -> Html,
221 | ) -> Val[Html] {
    |          ^^^^
    |   a.0.map5(b.0, c.0, d.0, e.0, render)
    | }

<WORKDIR>/rabbita\incremental.mbt:236:34-236:38:
    |   d : Val[D],
    |   e : Val[E],
    |   f : Val[F],
236 |   render : (A, B, C, D, E, F) -> Html,
    |                                  ^^^^
    | ) -> Val[Html] {
    |   a.0.map6(b.0, c.0, d.0, e.0, f.0, render)

<WORKDIR>/rabbita\incremental.mbt:237:10-237:14:
    |   e : Val[E],
    |   f : Val[F],
    |   render : (A, B, C, D, E, F) -> Html,
237 | ) -> Val[Html] {
    |          ^^^^
    |   a.0.map6(b.0, c.0, d.0, e.0, f.0, render)
    | }

<WORKDIR>/rabbita\incremental.mbt:253:37-253:41:
    |   e : Val[E],
    |   f : Val[F],
    |   g : Val[G],
253 |   render : (A, B, C, D, E, F, G) -> Html,
    |                                     ^^^^
    | ) -> Val[Html] {
    |   a.0.map7(b.0, c.0, d.0, e.0, f.0, g.0, render)

<WORKDIR>/rabbita\incremental.mbt:254:10-254:14:
    |   f : Val[F],
    |   g : Val[G],
    |   render : (A, B, C, D, E, F, G) -> Html,
254 | ) -> Val[Html] {
    |          ^^^^
    |   a.0.map7(b.0, c.0, d.0, e.0, f.0, g.0, render)
    | }

<WORKDIR>/rabbita\incremental.mbt:271:40-271:44:
    |   f : Val[F],
    |   g : Val[G],
    |   h : Val[H],
271 |   render : (A, B, C, D, E, F, G, H) -> Html,
    |                                        ^^^^
    | ) -> Val[Html] {
    |   a.0.map8(b.0, c.0, d.0, e.0, f.0, g.0, h.0, render)

<WORKDIR>/rabbita\incremental.mbt:272:10-272:14:
    |   g : Val[G],
    |   h : Val[H],
    |   render : (A, B, C, D, E, F, G, H) -> Html,
272 | ) -> Val[Html] {
    |          ^^^^
    |   a.0.map8(b.0, c.0, d.0, e.0, f.0, g.0, h.0, render)
    | }

<WORKDIR>/rabbita\incremental.mbt:290:43-290:47:
    |   g : Val[G],
    |   h : Val[H],
    |   i : Val[I],
290 |   render : (A, B, C, D, E, F, G, H, I) -> Html,
    |                                           ^^^^
    | ) -> Val[Html] {
    |   a.0.map9(b.0, c.0, d.0, e.0, f.0, g.0, h.0, i.0, render)

<WORKDIR>/rabbita\incremental.mbt:291:10-291:14:
    |   h : Val[H],
    |   i : Val[I],
    |   render : (A, B, C, D, E, F, G, H, I) -> Html,
291 | ) -> Val[Html] {
    |          ^^^^
    |   a.0.map9(b.0, c.0, d.0, e.0, f.0, g.0, h.0, i.0, render)
    | }

<WORKDIR>/rabbita\top.mbt:14:23-14:27:
   | ///|
   | /// A running Rabbita application.
   | struct App {
14 |   builder : () -> Val[Html]
   |                       ^^^^
   | }
   | 

<WORKDIR>/rabbita\top.mbt:23:32-23:36:
   | /// The builder runs when the app is mounted and must return its root
   | /// incremental HTML value. Use `Val::map`, `Val::switch`, and `Val::assoc` to
   | /// express subsequent changes, then call `App::mount` to start the app.
23 | pub fn new(builder : () -> Val[Html]) -> App {
   |                                ^^^^
   |   { builder, }
   | }

<WORKDIR>/rabbita\top.mbt:35:33-35:37:
   | /// optional subscriptions.
   | pub fn[Model : Eq, Msg] elmish(
   |   model~ : Model,
35 |   view~ : (Model, Emit[Msg]) -> Html,
   |                                 ^^^^
   |   update~ : (Model, Msg, Emit[Msg]) -> (Model, Cmd),
   |   subscriptions? : (Model, Emit[Msg]) -> @sub.Sub,

<WORKDIR>/utils\shiki\shiki.mbt:413:22-413:26:
    | }
    | 
    | ///|
413 | using @rabbita {type Html, type Val}
    |                      ^^^^

<WORKDIR>/website\homepage\main\main.mbt:42:22-42:26:
   | }
   | 
   | ///|
42 | using @rabbita {type Html, type Val, type Cmd, batch, none}
   |                      ^^^^
   | 
   | ///|

<WORKDIR>/website\playground\main\main.mbt:5:43-5:47:
  | using @html {a, button, div, iframe, li, nothing, option, pre, select, span, ul}
  | 
  | ///|
5 | using @rabbita {type Cmd, type Emit, type Html, type Val}
  |                                           ^^^^
  | 
  | ///|

```
