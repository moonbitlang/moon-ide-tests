# rabbita find-references Val rabbita/deprecated.mbt:6:23

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
$ run_moon_ide moon ide find-references 'Val' --loc 'rabbita/deprecated.mbt:6:23'
Found 287 references for symbol 'Val':
<WORKDIR>/doc/001_intro/using_test.mbt:2:22-2:25:
  | ///|
2 | using @rabbita {type Val, type Html}
  |                      ^^^
  | 
  | ///|

<WORKDIR>/doc/003_router/using_test.mbt:2:33-2:36:
  | ///|
2 | using @rabbita {type Html, type Val, none}
  |                                 ^^^
  | 
  | ///|

<WORKDIR>/doc/component_and_incremental/using_test.mbt:2:54-2:57:
  | ///|
2 | using @rabbita {type Cmd, type Emit, type Html, type Val}
  |                                                      ^^^
  | 
  | ///|

<WORKDIR>/doc/using_subscriptions/using_test.mbt:2:33-2:36:
  | ///|
2 | using @rabbita {type Emit, type Val, type Html, none}
  |                                 ^^^
  | 
  | ///|

<WORKDIR>/e2e/apps/collections-lifecycle/components.mbt:2:33-2:36:
  | ///|
2 | using @rabbita {type Html, type Val}
  |                                 ^^^
  | 
  | ///|

<WORKDIR>/e2e/apps/commands-and-async/commands.mbt:2:54-2:57:
  | ///|
2 | using @rabbita {type Cmd, type Emit, type Html, type Val}
  |                                                      ^^^
  | 
  | ///|

<WORKDIR>/e2e/apps/counter/main.mbt:2:33-2:36:
  | ///|
2 | using @rabbita {type Html, type Val}
  |                                 ^^^
  | 
  | ///|

<WORKDIR>/e2e/apps/dom-api/app.mbt:2:33-2:36:
  | ///|
2 | using @rabbita {type Html, type Val}
  |                                 ^^^
  | 
  | ///|

<WORKDIR>/e2e/apps/forms-and-events/view.mbt:2:33-2:36:
  | ///|
2 | using @rabbita {type Html, type Val}
  |                                 ^^^
  | 
  | ///|

<WORKDIR>/e2e/apps/http/http_app.mbt:2:69-2:72:
  | ///|
2 | using @rabbita {type Cmd, type Emit, type Html, type Resource, type Val}
  |                                                                     ^^^
  | 
  | ///|

<WORKDIR>/e2e/apps/memo/app.mbt:2:33-2:36:
  | ///|
2 | using @rabbita {type Html, type Val, type Emit}
  |                                 ^^^
  | 
  | ///|

<WORKDIR>/e2e/apps/navigation-history/navigation.mbt:2:54-2:57:
  | ///|
2 | using @rabbita {type Cmd, type Emit, type Html, type Val}
  |                                                      ^^^
  | 
  | ///|

<WORKDIR>/e2e/apps/rui/main.mbt:2:54-2:57:
  | ///|
2 | using @rabbita {type Cmd, type Emit, type Html, type Val}
  |                                                      ^^^
  | 
  | ///|

<WORKDIR>/e2e/apps/rui/main.mbt:719:12-719:15:
    | 
    | ///|
    | fn fixture_index_page() -> Val[Html] {
719 |   @rabbita.Val::constant(
    |            ^^^
    |     fixture_shell("Index", [
    |       fixture_section("fixture-section-index", "Fixture pages", [

<WORKDIR>/e2e/apps/rui/main.mbt:858:12-858:15:
    | 
    | ///|
    | fn fixture_missing_page(path : String) -> Val[Html] {
858 |   @rabbita.Val::constant(
    |            ^^^
    |     fixture_shell("Not found", [
    |       fixture_section("fixture-section-missing", "Fixture page not found", [

<WORKDIR>/e2e/apps/state-and-messages/state.mbt:2:33-2:36:
  | ///|
2 | using @rabbita {type Html, type Val}
  |                                 ^^^
  | 
  | ///|

<WORKDIR>/e2e/apps/subscriptions/subscriptions.mbt:2:54-2:57:
  | ///|
2 | using @rabbita {type Cmd, type Emit, type Html, type Val}
  |                                                      ^^^
  | 
  | ///|

<WORKDIR>/examples/animation/main/client.mbt:5:54-5:57:
  | using @html {div, h1}
  | 
  | ///|
5 | using @rabbita {type Cmd, type Emit, type Html, type Val}
  |                                                      ^^^
  | 
  | ///|

<WORKDIR>/examples/counter/main/main.mbt:1:23-1:26:
1 | using @rabbita { type Val, type Html, create_pure_state, new }
  |                       ^^^
  | using @html {div, h1, button}
  | 

<WORKDIR>/examples/document/app/app.mbt:2:22-2:25:
  | ///|
2 | using @rabbita {type Val, type Resource, none, batch, create_resource}
  |                      ^^^
  | 
  | ///|

<WORKDIR>/examples/grocery/main/main.mbt:1:23-1:26:
1 | using @rabbita { type Val, new }
  |                       ^^^
  | using @html { type Html, div, h1, li, ul}
  | 

<WORKDIR>/examples/shiki_editor/main/client.mbt:5:44-5:47:
  | using @html {div, h1, option, p, select, textarea, nothing}
  | 
  | ///|
5 | using @rabbita {type Emit, type Html, type Val}
  |                                            ^^^
  | 
  | ///|

<WORKDIR>/examples/sokoban/main/main.mbt:8:44-8:47:
  | using @html {div, input, label, main_, nothing, section, span}
  | 
  | ///|
8 | using @rabbita {type Emit, type Html, type Val, new, create_state, none}
  |                                            ^^^
  | 
  | ///|

<WORKDIR>/examples/subscriptions/main/client.mbt:8:54-8:57:
  | using @common {type Keyboard, type Mouse, type Scroll, type Viewport}
  | 
  | ///|
8 | using @rabbita {type Cmd, type Emit, type Html, type Val}
  |                                                      ^^^
  | 
  | ///|

<WORKDIR>/examples/todo/main/main.mbt:8:22-8:25:
  | using @vector {type Vector, from_iter}
  | 
  | ///|
8 | using @rabbita {type Val, none, type Emit, type Html }
  |                      ^^^
  | 
  | ///|

<WORKDIR>/examples/websocket/main/client.mbt:5:54-5:57:
  | using @html {button, code, div, fragment, h1, h2, input, nothing, p, textarea}
  | 
  | ///|
5 | using @rabbita {type Cmd, type Emit, type Html, type Val}
  |                                                      ^^^
  | 
  | ///|

<WORKDIR>/rabbita/deprecated.mbt:6:23-6:26:
  | ///
  | /// New components should return `Val[Html]` directly.
  | #deprecated("Use a `() -> Val[Html]` component. Nested `Cell::view()` composition is no longer supported; use `Val::map`, `Val::switch`, or `Val::assoc` instead.", skip_current_package=true)
6 | pub type Cell = () -> Val[Html]
  |                       ^^^
  | 
  | ///|

<WORKDIR>/rabbita/deprecated.mbt:143:9-143:12:
    | /// Compatibility wrapper for the former static Cell constructor.
    | #deprecated("Use a component returning `Val::constant(html)` instead.", skip_current_package=true)
    | pub fn static_cell(html : Html) -> Cell {
143 |   () => Val::constant(html)
    |         ^^^
    | }

<WORKDIR>/rabbita/incremental.mbt:18:19-18:22:
   | /// Creates an incremental value by applying `f` to `a`.
   | ///
   | /// The function is reevaluated when the value of `a` changes.
18 | pub fn[A : Eq, B] Val::map(a : Val[A], f : (A) -> B) -> Val[B] {
   |                   ^^^
   |   a.0.map1(f)
   | }

<WORKDIR>/rabbita/incremental.mbt:18:32-18:35:
   | /// Creates an incremental value by applying `f` to `a`.
   | ///
   | /// The function is reevaluated when the value of `a` changes.
18 | pub fn[A : Eq, B] Val::map(a : Val[A], f : (A) -> B) -> Val[B] {
   |                                ^^^
   |   a.0.map1(f)
   | }

<WORKDIR>/rabbita/incremental.mbt:18:57-18:60:
   | /// Creates an incremental value by applying `f` to `a`.
   | ///
   | /// The function is reevaluated when the value of `a` changes.
18 | pub fn[A : Eq, B] Val::map(a : Val[A], f : (A) -> B) -> Val[B] {
   |                                                         ^^^
   |   a.0.map1(f)
   | }

<WORKDIR>/rabbita/incremental.mbt:24:11-24:14:
   | 
   | ///|
   | /// Creates an incremental value that always contains `a`.
24 | pub fn[A] Val::constant(a : A) -> Val[A] {
   |           ^^^
   |   @duplix.constant(a)
   | }

<WORKDIR>/rabbita/incremental.mbt:24:35-24:38:
   | 
   | ///|
   | /// Creates an incremental value that always contains `a`.
24 | pub fn[A] Val::constant(a : A) -> Val[A] {
   |                                   ^^^
   |   @duplix.constant(a)
   | }

<WORKDIR>/rabbita/incremental.mbt:32:27-32:30:
   | /// Creates an incremental value derived from two inputs.
   | ///
   | /// The function is reevaluated when either input value changes.
32 | pub fn[A : Eq, B : Eq, C] Val::map2(
   |                           ^^^
   |   a : Val[A],
   |   b : Val[B],

<WORKDIR>/rabbita/incremental.mbt:33:7-33:10:
   | ///
   | /// The function is reevaluated when either input value changes.
   | pub fn[A : Eq, B : Eq, C] Val::map2(
33 |   a : Val[A],
   |       ^^^
   |   b : Val[B],
   |   f : (A, B) -> C,

<WORKDIR>/rabbita/incremental.mbt:34:7-34:10:
   | /// The function is reevaluated when either input value changes.
   | pub fn[A : Eq, B : Eq, C] Val::map2(
   |   a : Val[A],
34 |   b : Val[B],
   |       ^^^
   |   f : (A, B) -> C,
   | ) -> Val[C] {

<WORKDIR>/rabbita/incremental.mbt:36:6-36:9:
   |   a : Val[A],
   |   b : Val[B],
   |   f : (A, B) -> C,
36 | ) -> Val[C] {
   |      ^^^
   |   a.0.map2(b.0, f)
   | }

<WORKDIR>/rabbita/incremental.mbt:44:35-44:38:
   | /// Creates an incremental value derived from three inputs.
   | ///
   | /// The function is reevaluated when any input value changes.
44 | pub fn[A : Eq, B : Eq, C : Eq, D] Val::map3(
   |                                   ^^^
   |   a : Val[A],
   |   b : Val[B],

<WORKDIR>/rabbita/incremental.mbt:45:7-45:10:
   | ///
   | /// The function is reevaluated when any input value changes.
   | pub fn[A : Eq, B : Eq, C : Eq, D] Val::map3(
45 |   a : Val[A],
   |       ^^^
   |   b : Val[B],
   |   c : Val[C],

<WORKDIR>/rabbita/incremental.mbt:46:7-46:10:
   | /// The function is reevaluated when any input value changes.
   | pub fn[A : Eq, B : Eq, C : Eq, D] Val::map3(
   |   a : Val[A],
46 |   b : Val[B],
   |       ^^^
   |   c : Val[C],
   |   f : (A, B, C) -> D,

<WORKDIR>/rabbita/incremental.mbt:47:7-47:10:
   | pub fn[A : Eq, B : Eq, C : Eq, D] Val::map3(
   |   a : Val[A],
   |   b : Val[B],
47 |   c : Val[C],
   |       ^^^
   |   f : (A, B, C) -> D,
   | ) -> Val[D] {

<WORKDIR>/rabbita/incremental.mbt:49:6-49:9:
   |   b : Val[B],
   |   c : Val[C],
   |   f : (A, B, C) -> D,
49 | ) -> Val[D] {
   |      ^^^
   |   a.0.map3(b.0, c.0, f)
   | }

<WORKDIR>/rabbita/incremental.mbt:57:43-57:46:
   | /// Creates an incremental value derived from four inputs.
   | ///
   | /// The function is reevaluated when any input value changes.
57 | pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E] Val::map4(
   |                                           ^^^
   |   a : Val[A],
   |   b : Val[B],

<WORKDIR>/rabbita/incremental.mbt:58:7-58:10:
   | ///
   | /// The function is reevaluated when any input value changes.
   | pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E] Val::map4(
58 |   a : Val[A],
   |       ^^^
   |   b : Val[B],
   |   c : Val[C],

<WORKDIR>/rabbita/incremental.mbt:59:7-59:10:
   | /// The function is reevaluated when any input value changes.
   | pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E] Val::map4(
   |   a : Val[A],
59 |   b : Val[B],
   |       ^^^
   |   c : Val[C],
   |   d : Val[D],

<WORKDIR>/rabbita/incremental.mbt:60:7-60:10:
   | pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E] Val::map4(
   |   a : Val[A],
   |   b : Val[B],
60 |   c : Val[C],
   |       ^^^
   |   d : Val[D],
   |   f : (A, B, C, D) -> E,

<WORKDIR>/rabbita/incremental.mbt:61:7-61:10:
   |   a : Val[A],
   |   b : Val[B],
   |   c : Val[C],
61 |   d : Val[D],
   |       ^^^
   |   f : (A, B, C, D) -> E,
   | ) -> Val[E] {

<WORKDIR>/rabbita/incremental.mbt:63:6-63:9:
   |   c : Val[C],
   |   d : Val[D],
   |   f : (A, B, C, D) -> E,
63 | ) -> Val[E] {
   |      ^^^
   |   a.0.map4(b.0, c.0, d.0, f)
   | }

<WORKDIR>/rabbita/incremental.mbt:71:51-71:54:
   | /// Creates an incremental value derived from five inputs.
   | ///
   | /// The function is reevaluated when any input value changes.
71 | pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E : Eq, F] Val::map5(
   |                                                   ^^^
   |   a : Val[A],
   |   b : Val[B],

<WORKDIR>/rabbita/incremental.mbt:72:7-72:10:
   | ///
   | /// The function is reevaluated when any input value changes.
   | pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E : Eq, F] Val::map5(
72 |   a : Val[A],
   |       ^^^
   |   b : Val[B],
   |   c : Val[C],

<WORKDIR>/rabbita/incremental.mbt:73:7-73:10:
   | /// The function is reevaluated when any input value changes.
   | pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E : Eq, F] Val::map5(
   |   a : Val[A],
73 |   b : Val[B],
   |       ^^^
   |   c : Val[C],
   |   d : Val[D],

<WORKDIR>/rabbita/incremental.mbt:74:7-74:10:
   | pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E : Eq, F] Val::map5(
   |   a : Val[A],
   |   b : Val[B],
74 |   c : Val[C],
   |       ^^^
   |   d : Val[D],
   |   e : Val[E],

<WORKDIR>/rabbita/incremental.mbt:75:7-75:10:
   |   a : Val[A],
   |   b : Val[B],
   |   c : Val[C],
75 |   d : Val[D],
   |       ^^^
   |   e : Val[E],
   |   f : (A, B, C, D, E) -> F,

<WORKDIR>/rabbita/incremental.mbt:76:7-76:10:
   |   b : Val[B],
   |   c : Val[C],
   |   d : Val[D],
76 |   e : Val[E],
   |       ^^^
   |   f : (A, B, C, D, E) -> F,
   | ) -> Val[F] {

<WORKDIR>/rabbita/incremental.mbt:78:6-78:9:
   |   d : Val[D],
   |   e : Val[E],
   |   f : (A, B, C, D, E) -> F,
78 | ) -> Val[F] {
   |      ^^^
   |   a.0.map5(b.0, c.0, d.0, e.0, f)
   | }

<WORKDIR>/rabbita/incremental.mbt:86:59-86:62:
   | /// Creates an incremental value derived from six inputs.
   | ///
   | /// The function is reevaluated when any input value changes.
86 | pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E : Eq, F : Eq, G] Val::map6(
   |                                                           ^^^
   |   a : Val[A],
   |   b : Val[B],

<WORKDIR>/rabbita/incremental.mbt:87:7-87:10:
   | ///
   | /// The function is reevaluated when any input value changes.
   | pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E : Eq, F : Eq, G] Val::map6(
87 |   a : Val[A],
   |       ^^^
   |   b : Val[B],
   |   c : Val[C],

<WORKDIR>/rabbita/incremental.mbt:88:7-88:10:
   | /// The function is reevaluated when any input value changes.
   | pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E : Eq, F : Eq, G] Val::map6(
   |   a : Val[A],
88 |   b : Val[B],
   |       ^^^
   |   c : Val[C],
   |   d : Val[D],

<WORKDIR>/rabbita/incremental.mbt:89:7-89:10:
   | pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E : Eq, F : Eq, G] Val::map6(
   |   a : Val[A],
   |   b : Val[B],
89 |   c : Val[C],
   |       ^^^
   |   d : Val[D],
   |   e : Val[E],

<WORKDIR>/rabbita/incremental.mbt:90:7-90:10:
   |   a : Val[A],
   |   b : Val[B],
   |   c : Val[C],
90 |   d : Val[D],
   |       ^^^
   |   e : Val[E],
   |   f : Val[F],

<WORKDIR>/rabbita/incremental.mbt:91:7-91:10:
   |   b : Val[B],
   |   c : Val[C],
   |   d : Val[D],
91 |   e : Val[E],
   |       ^^^
   |   f : Val[F],
   |   g : (A, B, C, D, E, F) -> G,

<WORKDIR>/rabbita/incremental.mbt:92:7-92:10:
   |   c : Val[C],
   |   d : Val[D],
   |   e : Val[E],
92 |   f : Val[F],
   |       ^^^
   |   g : (A, B, C, D, E, F) -> G,
   | ) -> Val[G] {

<WORKDIR>/rabbita/incremental.mbt:94:6-94:9:
   |   e : Val[E],
   |   f : Val[F],
   |   g : (A, B, C, D, E, F) -> G,
94 | ) -> Val[G] {
   |      ^^^
   |   a.0.map6(b.0, c.0, d.0, e.0, f.0, g)
   | }

<WORKDIR>/rabbita/incremental.mbt:102:67-102:70:
    | /// Creates an incremental value derived from seven inputs.
    | ///
    | /// The function is reevaluated when any input value changes.
102 | pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E : Eq, F : Eq, G : Eq, H] Val::map7(
    |                                                                   ^^^
    |   a : Val[A],
    |   b : Val[B],

<WORKDIR>/rabbita/incremental.mbt:103:7-103:10:
    | ///
    | /// The function is reevaluated when any input value changes.
    | pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E : Eq, F : Eq, G : Eq, H] Val::map7(
103 |   a : Val[A],
    |       ^^^
    |   b : Val[B],
    |   c : Val[C],

<WORKDIR>/rabbita/incremental.mbt:104:7-104:10:
    | /// The function is reevaluated when any input value changes.
    | pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E : Eq, F : Eq, G : Eq, H] Val::map7(
    |   a : Val[A],
104 |   b : Val[B],
    |       ^^^
    |   c : Val[C],
    |   d : Val[D],

<WORKDIR>/rabbita/incremental.mbt:105:7-105:10:
    | pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E : Eq, F : Eq, G : Eq, H] Val::map7(
    |   a : Val[A],
    |   b : Val[B],
105 |   c : Val[C],
    |       ^^^
    |   d : Val[D],
    |   e : Val[E],

<WORKDIR>/rabbita/incremental.mbt:106:7-106:10:
    |   a : Val[A],
    |   b : Val[B],
    |   c : Val[C],
106 |   d : Val[D],
    |       ^^^
    |   e : Val[E],
    |   f : Val[F],

<WORKDIR>/rabbita/incremental.mbt:107:7-107:10:
    |   b : Val[B],
    |   c : Val[C],
    |   d : Val[D],
107 |   e : Val[E],
    |       ^^^
    |   f : Val[F],
    |   g : Val[G],

<WORKDIR>/rabbita/incremental.mbt:108:7-108:10:
    |   c : Val[C],
    |   d : Val[D],
    |   e : Val[E],
108 |   f : Val[F],
    |       ^^^
    |   g : Val[G],
    |   h : (A, B, C, D, E, F, G) -> H,

<WORKDIR>/rabbita/incremental.mbt:109:7-109:10:
    |   d : Val[D],
    |   e : Val[E],
    |   f : Val[F],
109 |   g : Val[G],
    |       ^^^
    |   h : (A, B, C, D, E, F, G) -> H,
    | ) -> Val[H] {

<WORKDIR>/rabbita/incremental.mbt:111:6-111:9:
    |   f : Val[F],
    |   g : Val[G],
    |   h : (A, B, C, D, E, F, G) -> H,
111 | ) -> Val[H] {
    |      ^^^
    |   a.0.map7(b.0, c.0, d.0, e.0, f.0, g.0, h)
    | }

<WORKDIR>/rabbita/incremental.mbt:119:75-119:78:
    | /// Creates an incremental value derived from eight inputs.
    | ///
    | /// The function is reevaluated when any input value changes.
119 | pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E : Eq, F : Eq, G : Eq, H : Eq, I] Val::map8(
    |                                                                           ^^^
    |   a : Val[A],
    |   b : Val[B],

<WORKDIR>/rabbita/incremental.mbt:120:7-120:10:
    | ///
    | /// The function is reevaluated when any input value changes.
    | pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E : Eq, F : Eq, G : Eq, H : Eq, I] Val::map8(
120 |   a : Val[A],
    |       ^^^
    |   b : Val[B],
    |   c : Val[C],

<WORKDIR>/rabbita/incremental.mbt:121:7-121:10:
    | /// The function is reevaluated when any input value changes.
    | pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E : Eq, F : Eq, G : Eq, H : Eq, I] Val::map8(
    |   a : Val[A],
121 |   b : Val[B],
    |       ^^^
    |   c : Val[C],
    |   d : Val[D],

<WORKDIR>/rabbita/incremental.mbt:122:7-122:10:
    | pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E : Eq, F : Eq, G : Eq, H : Eq, I] Val::map8(
    |   a : Val[A],
    |   b : Val[B],
122 |   c : Val[C],
    |       ^^^
    |   d : Val[D],
    |   e : Val[E],

<WORKDIR>/rabbita/incremental.mbt:123:7-123:10:
    |   a : Val[A],
    |   b : Val[B],
    |   c : Val[C],
123 |   d : Val[D],
    |       ^^^
    |   e : Val[E],
    |   f : Val[F],

<WORKDIR>/rabbita/incremental.mbt:124:7-124:10:
    |   b : Val[B],
    |   c : Val[C],
    |   d : Val[D],
124 |   e : Val[E],
    |       ^^^
    |   f : Val[F],
    |   g : Val[G],

<WORKDIR>/rabbita/incremental.mbt:125:7-125:10:
    |   c : Val[C],
    |   d : Val[D],
    |   e : Val[E],
125 |   f : Val[F],
    |       ^^^
    |   g : Val[G],
    |   h : Val[H],

<WORKDIR>/rabbita/incremental.mbt:126:7-126:10:
    |   d : Val[D],
    |   e : Val[E],
    |   f : Val[F],
126 |   g : Val[G],
    |       ^^^
    |   h : Val[H],
    |   i : (A, B, C, D, E, F, G, H) -> I,

<WORKDIR>/rabbita/incremental.mbt:127:7-127:10:
    |   e : Val[E],
    |   f : Val[F],
    |   g : Val[G],
127 |   h : Val[H],
    |       ^^^
    |   i : (A, B, C, D, E, F, G, H) -> I,
    | ) -> Val[I] {

<WORKDIR>/rabbita/incremental.mbt:129:6-129:9:
    |   g : Val[G],
    |   h : Val[H],
    |   i : (A, B, C, D, E, F, G, H) -> I,
129 | ) -> Val[I] {
    |      ^^^
    |   a.0.map8(b.0, c.0, d.0, e.0, f.0, g.0, h.0, i)
    | }

<WORKDIR>/rabbita/incremental.mbt:148:3-148:6:
    |   H : Eq,
    |   I : Eq,
    |   J,
148 | ] Val::map9(
    |   ^^^
    |   a : Val[A],
    |   b : Val[B],

<WORKDIR>/rabbita/incremental.mbt:149:7-149:10:
    |   I : Eq,
    |   J,
    | ] Val::map9(
149 |   a : Val[A],
    |       ^^^
    |   b : Val[B],
    |   c : Val[C],

<WORKDIR>/rabbita/incremental.mbt:150:7-150:10:
    |   J,
    | ] Val::map9(
    |   a : Val[A],
150 |   b : Val[B],
    |       ^^^
    |   c : Val[C],
    |   d : Val[D],

<WORKDIR>/rabbita/incremental.mbt:151:7-151:10:
    | ] Val::map9(
    |   a : Val[A],
    |   b : Val[B],
151 |   c : Val[C],
    |       ^^^
    |   d : Val[D],
    |   e : Val[E],

<WORKDIR>/rabbita/incremental.mbt:152:7-152:10:
    |   a : Val[A],
    |   b : Val[B],
    |   c : Val[C],
152 |   d : Val[D],
    |       ^^^
    |   e : Val[E],
    |   f : Val[F],

<WORKDIR>/rabbita/incremental.mbt:153:7-153:10:
    |   b : Val[B],
    |   c : Val[C],
    |   d : Val[D],
153 |   e : Val[E],
    |       ^^^
    |   f : Val[F],
    |   g : Val[G],

<WORKDIR>/rabbita/incremental.mbt:154:7-154:10:
    |   c : Val[C],
    |   d : Val[D],
    |   e : Val[E],
154 |   f : Val[F],
    |       ^^^
    |   g : Val[G],
    |   h : Val[H],

<WORKDIR>/rabbita/incremental.mbt:155:7-155:10:
    |   d : Val[D],
    |   e : Val[E],
    |   f : Val[F],
155 |   g : Val[G],
    |       ^^^
    |   h : Val[H],
    |   i : Val[I],

<WORKDIR>/rabbita/incremental.mbt:156:7-156:10:
    |   e : Val[E],
    |   f : Val[F],
    |   g : Val[G],
156 |   h : Val[H],
    |       ^^^
    |   i : Val[I],
    |   j : (A, B, C, D, E, F, G, H, I) -> J,

<WORKDIR>/rabbita/incremental.mbt:157:7-157:10:
    |   f : Val[F],
    |   g : Val[G],
    |   h : Val[H],
157 |   i : Val[I],
    |       ^^^
    |   j : (A, B, C, D, E, F, G, H, I) -> J,
    | ) -> Val[J] {

<WORKDIR>/rabbita/incremental.mbt:159:6-159:9:
    |   h : Val[H],
    |   i : Val[I],
    |   j : (A, B, C, D, E, F, G, H, I) -> J,
159 | ) -> Val[J] {
    |      ^^^
    |   a.0.map9(b.0, c.0, d.0, e.0, f.0, g.0, h.0, i.0, j)
    | }

<WORKDIR>/rabbita/incremental.mbt:167:16-167:19:
    | /// Creates an HTML view derived from one incremental value.
    | ///
    | /// The render function is reevaluated when `a` changes.
167 | pub fn[A : Eq] Val::view(a : Val[A], render : (A) -> Html) -> Val[Html] {
    |                ^^^
    |   a.0.map(render)
    | }

<WORKDIR>/rabbita/incremental.mbt:167:30-167:33:
    | /// Creates an HTML view derived from one incremental value.
    | ///
    | /// The render function is reevaluated when `a` changes.
167 | pub fn[A : Eq] Val::view(a : Val[A], render : (A) -> Html) -> Val[Html] {
    |                              ^^^
    |   a.0.map(render)
    | }

<WORKDIR>/rabbita/incremental.mbt:167:63-167:66:
    | /// Creates an HTML view derived from one incremental value.
    | ///
    | /// The render function is reevaluated when `a` changes.
167 | pub fn[A : Eq] Val::view(a : Val[A], render : (A) -> Html) -> Val[Html] {
    |                                                               ^^^
    |   a.0.map(render)
    | }

<WORKDIR>/rabbita/incremental.mbt:175:24-175:27:
    | /// Creates an HTML view derived from two incremental values.
    | ///
    | /// The render function is reevaluated when either input changes.
175 | pub fn[A : Eq, B : Eq] Val::view2(
    |                        ^^^
    |   a : Val[A],
    |   b : Val[B],

<WORKDIR>/rabbita/incremental.mbt:176:7-176:10:
    | ///
    | /// The render function is reevaluated when either input changes.
    | pub fn[A : Eq, B : Eq] Val::view2(
176 |   a : Val[A],
    |       ^^^
    |   b : Val[B],
    |   render : (A, B) -> Html,

<WORKDIR>/rabbita/incremental.mbt:177:7-177:10:
    | /// The render function is reevaluated when either input changes.
    | pub fn[A : Eq, B : Eq] Val::view2(
    |   a : Val[A],
177 |   b : Val[B],
    |       ^^^
    |   render : (A, B) -> Html,
    | ) -> Val[Html] {

<WORKDIR>/rabbita/incremental.mbt:179:6-179:9:
    |   a : Val[A],
    |   b : Val[B],
    |   render : (A, B) -> Html,
179 | ) -> Val[Html] {
    |      ^^^
    |   a.0.map2(b.0, render)
    | }

<WORKDIR>/rabbita/incremental.mbt:187:32-187:35:
    | /// Creates an HTML view derived from three incremental values.
    | ///
    | /// The render function is reevaluated when any input changes.
187 | pub fn[A : Eq, B : Eq, C : Eq] Val::view3(
    |                                ^^^
    |   a : Val[A],
    |   b : Val[B],

<WORKDIR>/rabbita/incremental.mbt:188:7-188:10:
    | ///
    | /// The render function is reevaluated when any input changes.
    | pub fn[A : Eq, B : Eq, C : Eq] Val::view3(
188 |   a : Val[A],
    |       ^^^
    |   b : Val[B],
    |   c : Val[C],

<WORKDIR>/rabbita/incremental.mbt:189:7-189:10:
    | /// The render function is reevaluated when any input changes.
    | pub fn[A : Eq, B : Eq, C : Eq] Val::view3(
    |   a : Val[A],
189 |   b : Val[B],
    |       ^^^
    |   c : Val[C],
    |   render : (A, B, C) -> Html,

<WORKDIR>/rabbita/incremental.mbt:190:7-190:10:
    | pub fn[A : Eq, B : Eq, C : Eq] Val::view3(
    |   a : Val[A],
    |   b : Val[B],
190 |   c : Val[C],
    |       ^^^
    |   render : (A, B, C) -> Html,
    | ) -> Val[Html] {

<WORKDIR>/rabbita/incremental.mbt:192:6-192:9:
    |   b : Val[B],
    |   c : Val[C],
    |   render : (A, B, C) -> Html,
192 | ) -> Val[Html] {
    |      ^^^
    |   a.0.map3(b.0, c.0, render)
    | }

<WORKDIR>/rabbita/incremental.mbt:200:40-200:43:
    | /// Creates an HTML view derived from four incremental values.
    | ///
    | /// The render function is reevaluated when any input changes.
200 | pub fn[A : Eq, B : Eq, C : Eq, D : Eq] Val::view4(
    |                                        ^^^
    |   a : Val[A],
    |   b : Val[B],

<WORKDIR>/rabbita/incremental.mbt:201:7-201:10:
    | ///
    | /// The render function is reevaluated when any input changes.
    | pub fn[A : Eq, B : Eq, C : Eq, D : Eq] Val::view4(
201 |   a : Val[A],
    |       ^^^
    |   b : Val[B],
    |   c : Val[C],

<WORKDIR>/rabbita/incremental.mbt:202:7-202:10:
    | /// The render function is reevaluated when any input changes.
    | pub fn[A : Eq, B : Eq, C : Eq, D : Eq] Val::view4(
    |   a : Val[A],
202 |   b : Val[B],
    |       ^^^
    |   c : Val[C],
    |   d : Val[D],

<WORKDIR>/rabbita/incremental.mbt:203:7-203:10:
    | pub fn[A : Eq, B : Eq, C : Eq, D : Eq] Val::view4(
    |   a : Val[A],
    |   b : Val[B],
203 |   c : Val[C],
    |       ^^^
    |   d : Val[D],
    |   render : (A, B, C, D) -> Html,

<WORKDIR>/rabbita/incremental.mbt:204:7-204:10:
    |   a : Val[A],
    |   b : Val[B],
    |   c : Val[C],
204 |   d : Val[D],
    |       ^^^
    |   render : (A, B, C, D) -> Html,
    | ) -> Val[Html] {

<WORKDIR>/rabbita/incremental.mbt:206:6-206:9:
    |   c : Val[C],
    |   d : Val[D],
    |   render : (A, B, C, D) -> Html,
206 | ) -> Val[Html] {
    |      ^^^
    |   a.0.map4(b.0, c.0, d.0, render)
    | }

<WORKDIR>/rabbita/incremental.mbt:214:48-214:51:
    | /// Creates an HTML view derived from five incremental values.
    | ///
    | /// The render function is reevaluated when any input changes.
214 | pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E : Eq] Val::view5(
    |                                                ^^^
    |   a : Val[A],
    |   b : Val[B],

<WORKDIR>/rabbita/incremental.mbt:215:7-215:10:
    | ///
    | /// The render function is reevaluated when any input changes.
    | pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E : Eq] Val::view5(
215 |   a : Val[A],
    |       ^^^
    |   b : Val[B],
    |   c : Val[C],

<WORKDIR>/rabbita/incremental.mbt:216:7-216:10:
    | /// The render function is reevaluated when any input changes.
    | pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E : Eq] Val::view5(
    |   a : Val[A],
216 |   b : Val[B],
    |       ^^^
    |   c : Val[C],
    |   d : Val[D],

<WORKDIR>/rabbita/incremental.mbt:217:7-217:10:
    | pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E : Eq] Val::view5(
    |   a : Val[A],
    |   b : Val[B],
217 |   c : Val[C],
    |       ^^^
    |   d : Val[D],
    |   e : Val[E],

<WORKDIR>/rabbita/incremental.mbt:218:7-218:10:
    |   a : Val[A],
    |   b : Val[B],
    |   c : Val[C],
218 |   d : Val[D],
    |       ^^^
    |   e : Val[E],
    |   render : (A, B, C, D, E) -> Html,

<WORKDIR>/rabbita/incremental.mbt:219:7-219:10:
    |   b : Val[B],
    |   c : Val[C],
    |   d : Val[D],
219 |   e : Val[E],
    |       ^^^
    |   render : (A, B, C, D, E) -> Html,
    | ) -> Val[Html] {

<WORKDIR>/rabbita/incremental.mbt:221:6-221:9:
    |   d : Val[D],
    |   e : Val[E],
    |   render : (A, B, C, D, E) -> Html,
221 | ) -> Val[Html] {
    |      ^^^
    |   a.0.map5(b.0, c.0, d.0, e.0, render)
    | }

<WORKDIR>/rabbita/incremental.mbt:229:56-229:59:
    | /// Creates an HTML view derived from six incremental values.
    | ///
    | /// The render function is reevaluated when any input changes.
229 | pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E : Eq, F : Eq] Val::view6(
    |                                                        ^^^
    |   a : Val[A],
    |   b : Val[B],

<WORKDIR>/rabbita/incremental.mbt:230:7-230:10:
    | ///
    | /// The render function is reevaluated when any input changes.
    | pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E : Eq, F : Eq] Val::view6(
230 |   a : Val[A],
    |       ^^^
    |   b : Val[B],
    |   c : Val[C],

<WORKDIR>/rabbita/incremental.mbt:231:7-231:10:
    | /// The render function is reevaluated when any input changes.
    | pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E : Eq, F : Eq] Val::view6(
    |   a : Val[A],
231 |   b : Val[B],
    |       ^^^
    |   c : Val[C],
    |   d : Val[D],

<WORKDIR>/rabbita/incremental.mbt:232:7-232:10:
    | pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E : Eq, F : Eq] Val::view6(
    |   a : Val[A],
    |   b : Val[B],
232 |   c : Val[C],
    |       ^^^
    |   d : Val[D],
    |   e : Val[E],

<WORKDIR>/rabbita/incremental.mbt:233:7-233:10:
    |   a : Val[A],
    |   b : Val[B],
    |   c : Val[C],
233 |   d : Val[D],
    |       ^^^
    |   e : Val[E],
    |   f : Val[F],

<WORKDIR>/rabbita/incremental.mbt:234:7-234:10:
    |   b : Val[B],
    |   c : Val[C],
    |   d : Val[D],
234 |   e : Val[E],
    |       ^^^
    |   f : Val[F],
    |   render : (A, B, C, D, E, F) -> Html,

<WORKDIR>/rabbita/incremental.mbt:235:7-235:10:
    |   c : Val[C],
    |   d : Val[D],
    |   e : Val[E],
235 |   f : Val[F],
    |       ^^^
    |   render : (A, B, C, D, E, F) -> Html,
    | ) -> Val[Html] {

<WORKDIR>/rabbita/incremental.mbt:237:6-237:9:
    |   e : Val[E],
    |   f : Val[F],
    |   render : (A, B, C, D, E, F) -> Html,
237 | ) -> Val[Html] {
    |      ^^^
    |   a.0.map6(b.0, c.0, d.0, e.0, f.0, render)
    | }

<WORKDIR>/rabbita/incremental.mbt:245:64-245:67:
    | /// Creates an HTML view derived from seven incremental values.
    | ///
    | /// The render function is reevaluated when any input changes.
245 | pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E : Eq, F : Eq, G : Eq] Val::view7(
    |                                                                ^^^
    |   a : Val[A],
    |   b : Val[B],

<WORKDIR>/rabbita/incremental.mbt:246:7-246:10:
    | ///
    | /// The render function is reevaluated when any input changes.
    | pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E : Eq, F : Eq, G : Eq] Val::view7(
246 |   a : Val[A],
    |       ^^^
    |   b : Val[B],
    |   c : Val[C],

<WORKDIR>/rabbita/incremental.mbt:247:7-247:10:
    | /// The render function is reevaluated when any input changes.
    | pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E : Eq, F : Eq, G : Eq] Val::view7(
    |   a : Val[A],
247 |   b : Val[B],
    |       ^^^
    |   c : Val[C],
    |   d : Val[D],

<WORKDIR>/rabbita/incremental.mbt:248:7-248:10:
    | pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E : Eq, F : Eq, G : Eq] Val::view7(
    |   a : Val[A],
    |   b : Val[B],
248 |   c : Val[C],
    |       ^^^
    |   d : Val[D],
    |   e : Val[E],

<WORKDIR>/rabbita/incremental.mbt:249:7-249:10:
    |   a : Val[A],
    |   b : Val[B],
    |   c : Val[C],
249 |   d : Val[D],
    |       ^^^
    |   e : Val[E],
    |   f : Val[F],

<WORKDIR>/rabbita/incremental.mbt:250:7-250:10:
    |   b : Val[B],
    |   c : Val[C],
    |   d : Val[D],
250 |   e : Val[E],
    |       ^^^
    |   f : Val[F],
    |   g : Val[G],

<WORKDIR>/rabbita/incremental.mbt:251:7-251:10:
    |   c : Val[C],
    |   d : Val[D],
    |   e : Val[E],
251 |   f : Val[F],
    |       ^^^
    |   g : Val[G],
    |   render : (A, B, C, D, E, F, G) -> Html,

<WORKDIR>/rabbita/incremental.mbt:252:7-252:10:
    |   d : Val[D],
    |   e : Val[E],
    |   f : Val[F],
252 |   g : Val[G],
    |       ^^^
    |   render : (A, B, C, D, E, F, G) -> Html,
    | ) -> Val[Html] {

<WORKDIR>/rabbita/incremental.mbt:254:6-254:9:
    |   f : Val[F],
    |   g : Val[G],
    |   render : (A, B, C, D, E, F, G) -> Html,
254 | ) -> Val[Html] {
    |      ^^^
    |   a.0.map7(b.0, c.0, d.0, e.0, f.0, g.0, render)
    | }

<WORKDIR>/rabbita/incremental.mbt:262:72-262:75:
    | /// Creates an HTML view derived from eight incremental values.
    | ///
    | /// The render function is reevaluated when any input changes.
262 | pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E : Eq, F : Eq, G : Eq, H : Eq] Val::view8(
    |                                                                        ^^^
    |   a : Val[A],
    |   b : Val[B],

<WORKDIR>/rabbita/incremental.mbt:263:7-263:10:
    | ///
    | /// The render function is reevaluated when any input changes.
    | pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E : Eq, F : Eq, G : Eq, H : Eq] Val::view8(
263 |   a : Val[A],
    |       ^^^
    |   b : Val[B],
    |   c : Val[C],

<WORKDIR>/rabbita/incremental.mbt:264:7-264:10:
    | /// The render function is reevaluated when any input changes.
    | pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E : Eq, F : Eq, G : Eq, H : Eq] Val::view8(
    |   a : Val[A],
264 |   b : Val[B],
    |       ^^^
    |   c : Val[C],
    |   d : Val[D],

<WORKDIR>/rabbita/incremental.mbt:265:7-265:10:
    | pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E : Eq, F : Eq, G : Eq, H : Eq] Val::view8(
    |   a : Val[A],
    |   b : Val[B],
265 |   c : Val[C],
    |       ^^^
    |   d : Val[D],
    |   e : Val[E],

<WORKDIR>/rabbita/incremental.mbt:266:7-266:10:
    |   a : Val[A],
    |   b : Val[B],
    |   c : Val[C],
266 |   d : Val[D],
    |       ^^^
    |   e : Val[E],
    |   f : Val[F],

<WORKDIR>/rabbita/incremental.mbt:267:7-267:10:
    |   b : Val[B],
    |   c : Val[C],
    |   d : Val[D],
267 |   e : Val[E],
    |       ^^^
    |   f : Val[F],
    |   g : Val[G],

<WORKDIR>/rabbita/incremental.mbt:268:7-268:10:
    |   c : Val[C],
    |   d : Val[D],
    |   e : Val[E],
268 |   f : Val[F],
    |       ^^^
    |   g : Val[G],
    |   h : Val[H],

<WORKDIR>/rabbita/incremental.mbt:269:7-269:10:
    |   d : Val[D],
    |   e : Val[E],
    |   f : Val[F],
269 |   g : Val[G],
    |       ^^^
    |   h : Val[H],
    |   render : (A, B, C, D, E, F, G, H) -> Html,

<WORKDIR>/rabbita/incremental.mbt:270:7-270:10:
    |   e : Val[E],
    |   f : Val[F],
    |   g : Val[G],
270 |   h : Val[H],
    |       ^^^
    |   render : (A, B, C, D, E, F, G, H) -> Html,
    | ) -> Val[Html] {

<WORKDIR>/rabbita/incremental.mbt:272:6-272:9:
    |   g : Val[G],
    |   h : Val[H],
    |   render : (A, B, C, D, E, F, G, H) -> Html,
272 | ) -> Val[Html] {
    |      ^^^
    |   a.0.map8(b.0, c.0, d.0, e.0, f.0, g.0, h.0, render)
    | }

<WORKDIR>/rabbita/incremental.mbt:280:80-280:83:
    | /// Creates an HTML view derived from nine incremental values.
    | ///
    | /// The render function is reevaluated when any input changes.
280 | pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E : Eq, F : Eq, G : Eq, H : Eq, I : Eq] Val::view9(
    |                                                                                ^^^
    |   a : Val[A],
    |   b : Val[B],

<WORKDIR>/rabbita/incremental.mbt:281:7-281:10:
    | ///
    | /// The render function is reevaluated when any input changes.
    | pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E : Eq, F : Eq, G : Eq, H : Eq, I : Eq] Val::view9(
281 |   a : Val[A],
    |       ^^^
    |   b : Val[B],
    |   c : Val[C],

<WORKDIR>/rabbita/incremental.mbt:282:7-282:10:
    | /// The render function is reevaluated when any input changes.
    | pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E : Eq, F : Eq, G : Eq, H : Eq, I : Eq] Val::view9(
    |   a : Val[A],
282 |   b : Val[B],
    |       ^^^
    |   c : Val[C],
    |   d : Val[D],

<WORKDIR>/rabbita/incremental.mbt:283:7-283:10:
    | pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E : Eq, F : Eq, G : Eq, H : Eq, I : Eq] Val::view9(
    |   a : Val[A],
    |   b : Val[B],
283 |   c : Val[C],
    |       ^^^
    |   d : Val[D],
    |   e : Val[E],

<WORKDIR>/rabbita/incremental.mbt:284:7-284:10:
    |   a : Val[A],
    |   b : Val[B],
    |   c : Val[C],
284 |   d : Val[D],
    |       ^^^
    |   e : Val[E],
    |   f : Val[F],

<WORKDIR>/rabbita/incremental.mbt:285:7-285:10:
    |   b : Val[B],
    |   c : Val[C],
    |   d : Val[D],
285 |   e : Val[E],
    |       ^^^
    |   f : Val[F],
    |   g : Val[G],

<WORKDIR>/rabbita/incremental.mbt:286:7-286:10:
    |   c : Val[C],
    |   d : Val[D],
    |   e : Val[E],
286 |   f : Val[F],
    |       ^^^
    |   g : Val[G],
    |   h : Val[H],

<WORKDIR>/rabbita/incremental.mbt:287:7-287:10:
    |   d : Val[D],
    |   e : Val[E],
    |   f : Val[F],
287 |   g : Val[G],
    |       ^^^
    |   h : Val[H],
    |   i : Val[I],

<WORKDIR>/rabbita/incremental.mbt:288:7-288:10:
    |   e : Val[E],
    |   f : Val[F],
    |   g : Val[G],
288 |   h : Val[H],
    |       ^^^
    |   i : Val[I],
    |   render : (A, B, C, D, E, F, G, H, I) -> Html,

<WORKDIR>/rabbita/incremental.mbt:289:7-289:10:
    |   f : Val[F],
    |   g : Val[G],
    |   h : Val[H],
289 |   i : Val[I],
    |       ^^^
    |   render : (A, B, C, D, E, F, G, H, I) -> Html,
    | ) -> Val[Html] {

<WORKDIR>/rabbita/incremental.mbt:291:6-291:9:
    |   h : Val[H],
    |   i : Val[I],
    |   render : (A, B, C, D, E, F, G, H, I) -> Html,
291 | ) -> Val[Html] {
    |      ^^^
    |   a.0.map9(b.0, c.0, d.0, e.0, f.0, g.0, h.0, i.0, render)
    | }

<WORKDIR>/rabbita/incremental.mbt:329:7-329:10:
    | pub fn[Model : Eq, Msg] create_pure_state(
    |   model : Model,
    |   update~ : (Model, Msg) -> Model,
329 | ) -> (Val[Model], Emit[Msg]) {
    |       ^^^
    |   let (node, emit) = @runtime.create_state_machine(_ => (model, none), (
    |     model,

<WORKDIR>/rabbita/incremental.mbt:369:7-369:10:
    |   model : Model,
    |   update~ : (Model, Msg, Emit[Msg]) -> (Model, Cmd),
    |   subscriptions? : (Model, Emit[Msg]) -> @sub.Sub,
369 | ) -> (Val[Model], Emit[Msg]) {
    |       ^^^
    |   let (node, emit) = @runtime.create_state_machine(
    |     _ => (model, none),

<WORKDIR>/rabbita/incremental.mbt:375:4-375:7:
    |     update,
    |     subscriptions?,
    |   )
375 |   (Val(node), emit)
    |    ^^^
    | }
    | 

<WORKDIR>/rabbita/incremental.mbt:397:39-397:42:
    | ///   rows.view(rows => @html.ul(rows))
    | /// }
    | /// ```
397 | pub fn[K : Hash + Eq, V : Eq, C : Eq] Val::assoc(
    |                                       ^^^
    |   a : Val[Vector[(K, V)]],
    |   f : (K, Val[V]) -> Val[C],

<WORKDIR>/rabbita/incremental.mbt:398:7-398:10:
    | /// }
    | /// ```
    | pub fn[K : Hash + Eq, V : Eq, C : Eq] Val::assoc(
398 |   a : Val[Vector[(K, V)]],
    |       ^^^
    |   f : (K, Val[V]) -> Val[C],
    | ) -> Val[Vector[C]] {

<WORKDIR>/rabbita/incremental.mbt:399:11-399:14:
    | /// ```
    | pub fn[K : Hash + Eq, V : Eq, C : Eq] Val::assoc(
    |   a : Val[Vector[(K, V)]],
399 |   f : (K, Val[V]) -> Val[C],
    |           ^^^
    | ) -> Val[Vector[C]] {
    |   a.0.assoc((k, v) => f(k, v).0)

<WORKDIR>/rabbita/incremental.mbt:399:22-399:25:
    | /// ```
    | pub fn[K : Hash + Eq, V : Eq, C : Eq] Val::assoc(
    |   a : Val[Vector[(K, V)]],
399 |   f : (K, Val[V]) -> Val[C],
    |                      ^^^
    | ) -> Val[Vector[C]] {
    |   a.0.assoc((k, v) => f(k, v).0)

<WORKDIR>/rabbita/incremental.mbt:400:6-400:9:
    | pub fn[K : Hash + Eq, V : Eq, C : Eq] Val::assoc(
    |   a : Val[Vector[(K, V)]],
    |   f : (K, Val[V]) -> Val[C],
400 | ) -> Val[Vector[C]] {
    |      ^^^
    |   a.0.assoc((k, v) => f(k, v).0)
    | }

<WORKDIR>/rabbita/incremental.mbt:408:39-408:42:
    | /// Incrementally maps values using keys derived by `by`.
    | ///
    | /// Derived keys must be unique and stable. Output follows source vector order.
408 | pub fn[K : Hash + Eq, V : Eq, C : Eq] Val::assoc_by(
    |                                       ^^^
    |   a : Val[Vector[V]],
    |   f : (K, Val[V]) -> Val[C],

<WORKDIR>/rabbita/incremental.mbt:409:7-409:10:
    | ///
    | /// Derived keys must be unique and stable. Output follows source vector order.
    | pub fn[K : Hash + Eq, V : Eq, C : Eq] Val::assoc_by(
409 |   a : Val[Vector[V]],
    |       ^^^
    |   f : (K, Val[V]) -> Val[C],
    |   by~ : (V) -> K,

<WORKDIR>/rabbita/incremental.mbt:410:11-410:14:
    | /// Derived keys must be unique and stable. Output follows source vector order.
    | pub fn[K : Hash + Eq, V : Eq, C : Eq] Val::assoc_by(
    |   a : Val[Vector[V]],
410 |   f : (K, Val[V]) -> Val[C],
    |           ^^^
    |   by~ : (V) -> K,
    | ) -> Val[Vector[C]] {

<WORKDIR>/rabbita/incremental.mbt:410:22-410:25:
    | /// Derived keys must be unique and stable. Output follows source vector order.
    | pub fn[K : Hash + Eq, V : Eq, C : Eq] Val::assoc_by(
    |   a : Val[Vector[V]],
410 |   f : (K, Val[V]) -> Val[C],
    |                      ^^^
    |   by~ : (V) -> K,
    | ) -> Val[Vector[C]] {

<WORKDIR>/rabbita/incremental.mbt:412:6-412:9:
    |   a : Val[Vector[V]],
    |   f : (K, Val[V]) -> Val[C],
    |   by~ : (V) -> K,
412 | ) -> Val[Vector[C]] {
    |      ^^^
    |   a.0.assoc_by((k, v) => f(k, v).0, by~)
    | }

<WORKDIR>/rabbita/incremental.mbt:455:36-455:39:
    | ///   })
    | /// }
    | /// ```
455 | pub fn[E : Enumerate + Eq, C : Eq] Val::enumerate(
    |                                    ^^^
    |   a : Val[E],
    |   f : (E) -> Val[C],

<WORKDIR>/rabbita/incremental.mbt:456:7-456:10:
    | /// }
    | /// ```
    | pub fn[E : Enumerate + Eq, C : Eq] Val::enumerate(
456 |   a : Val[E],
    |       ^^^
    |   f : (E) -> Val[C],
    | ) -> Val[C] {

<WORKDIR>/rabbita/incremental.mbt:457:14-457:17:
    | /// ```
    | pub fn[E : Enumerate + Eq, C : Eq] Val::enumerate(
    |   a : Val[E],
457 |   f : (E) -> Val[C],
    |              ^^^
    | ) -> Val[C] {
    |   a.0.enumerate(e => f(e).0)

<WORKDIR>/rabbita/incremental.mbt:458:6-458:9:
    | pub fn[E : Enumerate + Eq, C : Eq] Val::enumerate(
    |   a : Val[E],
    |   f : (E) -> Val[C],
458 | ) -> Val[C] {
    |      ^^^
    |   a.0.enumerate(e => f(e).0)
    | }

<WORKDIR>/rabbita/incremental.mbt:466:24-466:27:
    | /// Selects and caches branches using the tag returned by `by`.
    | ///
    | /// Values with the same tag reuse the branch created for its first value.
466 | pub fn[E : Eq, C : Eq] Val::enumerate_by(
    |                        ^^^
    |   a : Val[E],
    |   f : (E) -> Val[C],

<WORKDIR>/rabbita/incremental.mbt:467:7-467:10:
    | ///
    | /// Values with the same tag reuse the branch created for its first value.
    | pub fn[E : Eq, C : Eq] Val::enumerate_by(
467 |   a : Val[E],
    |       ^^^
    |   f : (E) -> Val[C],
    |   by~ : (E) -> String,

<WORKDIR>/rabbita/incremental.mbt:468:14-468:17:
    | /// Values with the same tag reuse the branch created for its first value.
    | pub fn[E : Eq, C : Eq] Val::enumerate_by(
    |   a : Val[E],
468 |   f : (E) -> Val[C],
    |              ^^^
    |   by~ : (E) -> String,
    | ) -> Val[C] {

<WORKDIR>/rabbita/incremental.mbt:470:6-470:9:
    |   a : Val[E],
    |   f : (E) -> Val[C],
    |   by~ : (E) -> String,
470 | ) -> Val[C] {
    |      ^^^
    |   a.0.enumerate_by(e => f(e).0, by~)
    | }

<WORKDIR>/rabbita/incremental.mbt:513:36-513:39:
    | ///   })
    | /// }
    | /// ```
513 | pub fn[E : Enumerate + Eq, C : Eq] Val::switch(
    |                                    ^^^
    |   a : Val[E],
    |   f : (E) -> Val[C],

<WORKDIR>/rabbita/incremental.mbt:514:7-514:10:
    | /// }
    | /// ```
    | pub fn[E : Enumerate + Eq, C : Eq] Val::switch(
514 |   a : Val[E],
    |       ^^^
    |   f : (E) -> Val[C],
    | ) -> Val[C] {

<WORKDIR>/rabbita/incremental.mbt:515:14-515:17:
    | /// ```
    | pub fn[E : Enumerate + Eq, C : Eq] Val::switch(
    |   a : Val[E],
515 |   f : (E) -> Val[C],
    |              ^^^
    | ) -> Val[C] {
    |   a.0.switch(e => f(e).0)

<WORKDIR>/rabbita/incremental.mbt:516:6-516:9:
    | pub fn[E : Enumerate + Eq, C : Eq] Val::switch(
    |   a : Val[E],
    |   f : (E) -> Val[C],
516 | ) -> Val[C] {
    |      ^^^
    |   a.0.switch(e => f(e).0)
    | }

<WORKDIR>/rabbita/incremental.mbt:525:24-525:27:
    | ///
    | /// Values with the same tag keep the current branch; changing it disposes the
    | /// branch before creating the next one.
525 | pub fn[E : Eq, C : Eq] Val::switch_by(
    |                        ^^^
    |   a : Val[E],
    |   f : (E) -> Val[C],

<WORKDIR>/rabbita/incremental.mbt:526:7-526:10:
    | /// Values with the same tag keep the current branch; changing it disposes the
    | /// branch before creating the next one.
    | pub fn[E : Eq, C : Eq] Val::switch_by(
526 |   a : Val[E],
    |       ^^^
    |   f : (E) -> Val[C],
    |   by~ : (E) -> String,

<WORKDIR>/rabbita/incremental.mbt:527:14-527:17:
    | /// branch before creating the next one.
    | pub fn[E : Eq, C : Eq] Val::switch_by(
    |   a : Val[E],
527 |   f : (E) -> Val[C],
    |              ^^^
    |   by~ : (E) -> String,
    | ) -> Val[C] {

<WORKDIR>/rabbita/incremental.mbt:529:6-529:9:
    |   a : Val[E],
    |   f : (E) -> Val[C],
    |   by~ : (E) -> String,
529 | ) -> Val[C] {
    |      ^^^
    |   a.0.switch_by(e => f(e).0, by~)
    | }

<WORKDIR>/rabbita/incremental.mbt:571:7-571:10:
    |   init~ : (Emit[Msg]) -> (Model, Cmd),
    |   update~ : (Model, Msg, Emit[Msg]) -> (Model, Cmd),
    |   subscriptions? : (Model, Emit[Msg]) -> @sub.Sub,
571 | ) -> (Val[Model], Emit[Msg]) {
    |       ^^^
    |   let (node, emit) = @runtime.create_state_machine(init, update, subscriptions?)
    |   (node, emit)

<WORKDIR>/rabbita/incremental.mbt:617:12-617:15:
    |   init~ : (Emit[Msg], Input) -> (Model, Cmd),
    |   update~ : (Model, Input, Msg, Emit[Msg]) -> (Model, Cmd),
    |   subscriptions? : (Model, Input, Emit[Msg]) -> @sub.Sub,
617 |   input~ : Val[Input],
    |            ^^^
    | ) -> (Val[Model], Emit[Msg]) {
    |   let (node, emit) = @runtime.create_state_machine_with_input(

<WORKDIR>/rabbita/incremental.mbt:618:7-618:10:
    |   update~ : (Model, Input, Msg, Emit[Msg]) -> (Model, Cmd),
    |   subscriptions? : (Model, Input, Emit[Msg]) -> @sub.Sub,
    |   input~ : Val[Input],
618 | ) -> (Val[Model], Emit[Msg]) {
    |       ^^^
    |   let (node, emit) = @runtime.create_state_machine_with_input(
    |     init,

<WORKDIR>/rabbita/incremental.mbt:654:7-654:10:
    | /// ```
    | pub fn[Model : Eq] create_variable(
    |   init : Model,
654 | ) -> (Val[Model], Emit[(Model) -> Model]) {
    |       ^^^
    |   fn update(model, f) {
    |     f(model)

<WORKDIR>/rabbita/incremental.mbt:693:24-693:27:
    | 
    | ///|
    | /// An incremental asynchronous resource state.
693 | pub type Resource[T] = Val[Status[T]]
    |                        ^^^
    | 
    | ///|

<WORKDIR>/rabbita/top.mbt:14:19-14:22:
   | ///|
   | /// A running Rabbita application.
   | struct App {
14 |   builder : () -> Val[Html]
   |                   ^^^
   | }
   | 

<WORKDIR>/rabbita/top.mbt:23:28-23:31:
   | /// The builder runs when the app is mounted and must return its root
   | /// incremental HTML value. Use `Val::map`, `Val::switch`, and `Val::assoc` to
   | /// express subsequent changes, then call `App::mount` to start the app.
23 | pub fn new(builder : () -> Val[Html]) -> App {
   |                            ^^^
   |   { builder, }
   | }

<WORKDIR>/rui/accordion.mbt:575:15-575:18:
    |   item_style? : Array[String] = [],
    |   trigger_style? : Array[String] = [],
    |   content_style? : Array[String] = [],
575 | ) -> @rabbita.Val[@html.Html] {
    |               ^^^
    |   let initial = accordion_initial_values(
    |     items, type_, default_value, default_values,

<WORKDIR>/rui/alert_dialog.mbt:24:15-24:18:
   |   on_open_change? : @cmd.Emit[Bool],
   |   on_close? : @cmd.Emit[String],
   |   children : (AlertDialogScope) -> @html.Html,
24 | ) -> @rabbita.Val[@html.Html] {
   |               ^^^
   |   dialog(
   |     id~,

<WORKDIR>/rui/avatar.mbt:332:15-332:18:
    |   fallback_attrs? : @html.Attrs,
    |   fallback_style? : Array[String] = [],
    |   fallback : C,
332 | ) -> @rabbita.Val[@html.Html] {
    |               ^^^
    |   let initial = if src == "" { AvatarError } else { AvatarLoading }
    |   let (status, _) = @rabbita.create_state_with_init(

<WORKDIR>/rui/calendar.mbt:1207:15-1207:18:
     |   weekday_style? : Array[String] = [],
     |   cell_style? : Array[String] = [],
     |   day_style? : Array[String] = [],
1207 | ) -> @rabbita.Val[@html.Html] {
     |               ^^^
     |   let initial = calendar_initial_model(default_month, default_selected, today)
     |   let (model, emit) = @rabbita.create_state(initial, update=fn(model, msg, _) {

<WORKDIR>/rui/calendar_selection.mbt:384:15-384:18:
    |   weekday_style? : Array[String] = [],
    |   cell_style? : Array[String] = [],
    |   day_style? : Array[String] = [],
384 | ) -> @rabbita.Val[@html.Html] {
    |               ^^^
    |   let initial = calendar_range_initial_model(
    |     default_month, default_selected, today,

<WORKDIR>/rui/calendar_selection.mbt:534:15-534:18:
    |   weekday_style? : Array[String] = [],
    |   cell_style? : Array[String] = [],
    |   day_style? : Array[String] = [],
534 | ) -> @rabbita.Val[@html.Html] {
    |               ^^^
    |   let initial = calendar_multiple_initial_model(
    |     default_month, default_selected, today,

<WORKDIR>/rui/carousel.mbt:1514:15-1514:18:
     |   attrs? : @html.Attrs,
     |   style? : Array[String] = [],
     |   children : (CarouselScope) -> C,
1514 | ) -> @rabbita.Val[@html.Html] {
     |               ^^^
     |   let count = carousel_count(count)
     |   let initial = carousel_index(default_index, count)

<WORKDIR>/rui/checkbox.mbt:214:15-214:18:
    |   on_checked_change? : @cmd.Emit[Bool],
    |   attrs? : @html.Attrs,
    |   style? : Array[String] = [],
214 | ) -> @rabbita.Val[@html.Html] {
    |               ^^^
    |   let initial = {
    |     checked: default_checked,

<WORKDIR>/rui/collapsible.mbt:375:15-375:18:
    |   content_body_style? : Array[String] = [],
    |   trigger~ : T,
    |   content~ : C,
375 | ) -> @rabbita.Val[@html.Html] {
    |               ^^^
    |   let (open, set_open) = @rabbita.create_variable(default_open)
    |   let on_open_change = set_open.map(next => _ => next)

<WORKDIR>/rui/combobox.mbt:1446:15-1446:18:
     |   attrs? : @html.Attrs,
     |   style? : Array[String] = [],
     |   render? : (ComboboxScope) -> @html.Html,
1446 | ) -> @rabbita.Val[@html.Html] {
     |               ^^^
     |   let requested = default_values.copy()
     |   if default_value is Some(value) && !combobox_contains(requested, value) {

<WORKDIR>/rui/command.mbt:1019:15-1019:18:
     |   attrs? : @html.Attrs,
     |   style? : Array[String] = [],
     |   children : (CommandScope) -> @html.Html,
1019 | ) -> @rabbita.Val[@html.Html] {
     |               ^^^
     |   let matcher = filter.unwrap_or(command_default_filter)
     |   let initial : CommandModel = {

<WORKDIR>/rui/command.mbt:1312:15-1312:18:
     |   native_style? : Array[String] = [],
     |   trigger? : (CommandScope) -> @html.Html,
     |   children : (CommandScope) -> @html.Html,
1312 | ) -> @rabbita.Val[@html.Html] {
     |               ^^^
     |   let matcher = filter.unwrap_or(command_default_filter)
     |   let initial : CommandModel = {

<WORKDIR>/rui/context_menu.mbt:489:15-489:18:
    |   attrs? : @html.Attrs,
    |   style? : Array[String] = [],
    |   children : (ContextMenuScope) -> @html.Html,
489 | ) -> @rabbita.Val[@html.Html] {
    |               ^^^
    |   let initial : ContextMenuModel = {
    |     menu: menu_core_model(

<WORKDIR>/rui/context_menu.mbt:713:15-713:18:
    |   attrs? : @html.Attrs,
    |   style? : Array[String] = [],
    |   children : (ContextMenuScope) -> @html.Html,
713 | ) -> @rabbita.Val[@html.Html] {
    |               ^^^
    |   context_menu(
    |     id~,

<WORKDIR>/rui/data_table.mbt:871:15-871:18:
    |   title? : String,
    |   attrs? : @html.Attrs,
    |   style? : Array[String] = [],
871 | ) -> @rabbita.Val[@html.Html] {
    |               ^^^
    |   let initial = data_table_initial_model(
    |     default_sort_key, default_sort_descending, default_selected, default_hidden_columns,

<WORKDIR>/rui/date_picker.mbt:839:15-839:18:
    |   day_attrs? : @html.Attrs,
    |   day_style? : Array[String] = [],
    |   preset_style? : Array[String] = [],
839 | ) -> @rabbita.Val[@html.Html] {
    |               ^^^
    |   let initial = date_picker_initial_model(
    |     default_open, disabled, default_month, default_value, today,

<WORKDIR>/rui/date_picker.mbt:1023:15-1023:18:
     |   calendar_style? : Array[String] = [],
     |   day_attrs? : @html.Attrs,
     |   day_style? : Array[String] = [],
1023 | ) -> @rabbita.Val[@html.Html] {
     |               ^^^
     |   let initial = date_range_picker_initial_model(
     |     default_open, disabled, default_month, default_value, today,

<WORKDIR>/rui/dialog.mbt:267:15-267:18:
    |   on_open_change? : @cmd.Emit[Bool],
    |   on_close? : @cmd.Emit[String],
    |   children : (DialogScope) -> @html.Html,
267 | ) -> @rabbita.Val[@html.Html] {
    |               ^^^
    |   dialog_with_input(
    |     id~,

<WORKDIR>/rui/dialog.mbt:270:20-270:23:
    | ) -> @rabbita.Val[@html.Html] {
    |   dialog_with_input(
    |     id~,
270 |     input=@rabbita.Val::constant(()),
    |                    ^^^
    |     default_open~,
    |     modal~,

<WORKDIR>/rui/dialog.mbt:293:21-293:24:
    | #cfg(target="js")
    | pub fn[Input : Eq] dialog_with_input(
    |   id~ : String,
293 |   input~ : @rabbita.Val[Input],
    |                     ^^^
    |   default_open? : Bool = false,
    |   modal? : Bool = true,

<WORKDIR>/rui/dialog.mbt:300:15-300:18:
    |   on_open_change? : @cmd.Emit[Bool],
    |   on_close? : @cmd.Emit[String],
    |   children : (DialogScope, Input) -> @html.Html,
300 | ) -> @rabbita.Val[@html.Html] {
    |               ^^^
    |   let (model, emit) = @rabbita.create_state_with_init(
    |     init=emit => {

<WORKDIR>/rui/drawer.mbt:428:15-428:18:
    |   on_open_change? : @cmd.Emit[Bool],
    |   on_close? : @cmd.Emit[String],
    |   children : (DrawerScope) -> @html.Html,
428 | ) -> @rabbita.Val[@html.Html] {
    |               ^^^
    |   dialog(
    |     id~,

<WORKDIR>/rui/dropdown_menu.mbt:145:15-145:18:
    |   attrs? : @html.Attrs,
    |   style? : Array[String] = [],
    |   children : (DropdownMenuScope) -> @html.Html,
145 | ) -> @rabbita.Val[@html.Html] {
    |               ^^^
    |   let initial = menu_core_model(
    |     default_open, default_checked_values, default_radio_values,

<WORKDIR>/rui/dropdown_menu.mbt:334:15-334:18:
    |   attrs? : @html.Attrs,
    |   style? : Array[String] = [],
    |   children : (DropdownMenuScope) -> @html.Html,
334 | ) -> @rabbita.Val[@html.Html] {
    |               ^^^
    |   dropdown_menu(
    |     id~,

<WORKDIR>/rui/hover_card.mbt:672:15-672:18:
    |   content_style? : Array[String] = [],
    |   trigger : T,
    |   content : C,
672 | ) -> @rabbita.Val[@html.Html] {
    |               ^^^
    |   let actual_open_delay = hover_card_delay(open_delay)
    |   let actual_close_delay = hover_card_delay(close_delay)

<WORKDIR>/rui/input_otp.mbt:279:15-279:18:
    |   input_attrs? : @html.Attrs,
    |   style? : Array[String] = [],
    |   render? : (InputOtpScope) -> @html.Html,
279 | ) -> @rabbita.Val[@html.Html] {
    |               ^^^
    |   let initial_value = otp_normalize(default_value, max_length)
    |   let (model, emit) = @rabbita.create_state({ value: initial_value, }, update=fn(

<WORKDIR>/rui/menubar.mbt:700:15-700:18:
    |   attrs? : @html.Attrs,
    |   style? : Array[String] = [],
    |   children : (MenubarScope) -> @html.Html,
700 | ) -> @rabbita.Val[@html.Html] {
    |               ^^^
    |   let initial : MenubarModel = {
    |     active_value: default_value,

<WORKDIR>/rui/menubar.mbt:1066:15-1066:18:
     |   attrs? : @html.Attrs,
     |   style? : Array[String] = [],
     |   children : (MenubarScope) -> @html.Html,
1066 | ) -> @rabbita.Val[@html.Html] {
     |               ^^^
     |   menubar(
     |     id~,

<WORKDIR>/rui/message_scroller.mbt:92:15-92:18:
   |   attrs? : @html.Attrs,
   |   style? : Array[String] = [],
   |   children : (MessageScrollerScope) -> C,
92 | ) -> @rabbita.Val[@html.Html] {
   |               ^^^
   |   let viewport_id = "\{id}-viewport"
   |   let initial = { at_start: !default_at_end, at_end: default_at_end, }

<WORKDIR>/rui/navigation_menu.mbt:588:15-588:18:
    |   attrs? : @html.Attrs,
    |   style? : Array[String] = [],
    |   children : (NavigationMenuScope) -> @html.Html,
588 | ) -> @rabbita.Val[@html.Html] {
    |               ^^^
    |   let initial : NavigationMenuModel = {
    |     value: default_value,

<WORKDIR>/rui/navigation_menu.mbt:846:15-846:18:
    |   attrs? : @html.Attrs,
    |   style? : Array[String] = [],
    |   children : (NavigationMenuScope) -> @html.Html,
846 | ) -> @rabbita.Val[@html.Html] {
    |               ^^^
    |   navigation_menu(
    |     id~,

<WORKDIR>/rui/popover.mbt:1806:15-1806:18:
     |   content_style? : Array[String] = [],
     |   trigger : T,
     |   content : C,
1806 | ) -> @rabbita.Val[@html.Html] {
     |               ^^^
     |   let initial_open = default_open && !disabled
     |   let (open, emit) = @rabbita.create_state_with_init(

<WORKDIR>/rui/radio_group.mbt:277:15-277:18:
    |   attrs? : @html.Attrs,
    |   style? : Array[String] = [],
    |   children : (RadioGroupScope) -> C,
277 | ) -> @rabbita.Val[@html.Html] {
    |               ^^^
    |   let (value, set_value) = @rabbita.create_variable(default_value)
    |   value.view(value => {

<WORKDIR>/rui/resizable.mbt:651:15-651:18:
    |   attrs? : @html.Attrs,
    |   style? : Array[String] = [],
    |   children : (ResizableGroupScope) -> C,
651 | ) -> @rabbita.Val[@html.Html] {
    |               ^^^
    |   let (initial, minimums, maximums) = resizable_prepare_layout(
    |     default_sizes, min_sizes, max_sizes,

<WORKDIR>/rui/resizable.mbt:933:15-933:18:
    |   attrs? : @html.Attrs,
    |   style? : Array[String] = [],
    |   children : (ResizableScope) -> C,
933 | ) -> @rabbita.Val[@html.Html] {
    |               ^^^
    |   let min = resizable_clamp(min, 0, 100)
    |   let max = resizable_clamp(max, min, 100)

<WORKDIR>/rui/scroll_area.mbt:620:15-620:18:
    |   attrs? : @html.Attrs,
    |   style? : Array[String] = [],
    |   children : C,
620 | ) -> @rabbita.Val[@html.Html] {
    |               ^^^
    |   let viewport_id = "\{id}-viewport"
    |   let (metrics, emit) = @rabbita.create_state_with_init(

<WORKDIR>/rui/select.mbt:942:15-942:18:
    |   attrs? : @html.Attrs,
    |   style? : Array[String] = [],
    |   render? : (SelectScope) -> @html.Html,
942 | ) -> @rabbita.Val[@html.Html] {
    |               ^^^
    |   let selected = select_find_value(options, default_value)
    |   let initial_value = if selected >= 0 {

<WORKDIR>/rui/sheet.mbt:111:15-111:18:
    |   on_open_change? : @cmd.Emit[Bool],
    |   on_close? : @cmd.Emit[String],
    |   children : (SheetScope) -> @html.Html,
111 | ) -> @rabbita.Val[@html.Html] {
    |               ^^^
    |   dialog(
    |     id~,

<WORKDIR>/rui/sidebar.mbt:1554:16-1554:19:
     |   default_mobile_open : Bool,
     |   on_collapsed_change : @cmd.Emit[Bool]?,
     |   on_mobile_open_change : @cmd.Emit[Bool]?,
1554 | ) -> (@rabbita.Val[SidebarState], @cmd.Emit[SidebarMessage]) {
     |                ^^^
     |   let initial : SidebarState = {
     |     collapsed: default_collapsed,

<WORKDIR>/rui/sidebar.mbt:1655:15-1655:18:
     |   attrs? : @html.Attrs,
     |   style? : Array[String] = [],
     |   children : (SidebarScope) -> @html.Html,
1655 | ) -> @rabbita.Val[@html.Html] {
     |               ^^^
     |   let (state, emit) = sidebar_provider_state(
     |     default_collapsed, default_mobile_open, on_collapsed_change, on_mobile_open_change,

<WORKDIR>/rui/sidebar.mbt:1680:21-1680:24:
     | /// rebuilding either state owner.
     | #cfg(target="js")
     | pub fn[Input : Eq] sidebar_provider_with_input(
1680 |   input~ : @rabbita.Val[Input],
     |                     ^^^
     |   default_collapsed? : Bool = false,
     |   default_mobile_open? : Bool = false,

<WORKDIR>/rui/sidebar.mbt:1691:15-1691:18:
     |   attrs? : @html.Attrs,
     |   style? : Array[String] = [],
     |   children : (SidebarScope, Input) -> @html.Html,
1691 | ) -> @rabbita.Val[@html.Html] {
     |               ^^^
     |   let (state, emit) = sidebar_provider_state(
     |     default_collapsed, default_mobile_open, on_collapsed_change, on_mobile_open_change,

<WORKDIR>/rui/sidebar.mbt:2547:15-2547:18:
     |   tooltip_attrs? : @html.Attrs,
     |   tooltip_style? : Array[String] = [],
     |   children : C,
2547 | ) -> @rabbita.Val[@html.Html] {
     |               ^^^
     |   let content_id = id + "-tooltip"
     |   let initial_model : TooltipModel = {

<WORKDIR>/rui/slider.mbt:884:15-884:18:
    |   attrs : @html.Attrs?,
    |   input_attrs : @html.Attrs?,
    |   style : Array[String],
884 | ) -> @rabbita.Val[@html.Html] {
    |               ^^^
    |   let max = if max < min { min } else { max }
    |   let step = slider_step_amount(step)

<WORKDIR>/rui/slider.mbt:1012:15-1012:18:
     |   attrs? : @html.Attrs,
     |   input_attrs? : @html.Attrs,
     |   style? : Array[String] = [],
1012 | ) -> @rabbita.Val[@html.Html] {
     |               ^^^
     |   slider_values_impl(
     |     default_values, min, max, step, large_step, min_steps_between_values, orientation,

<WORKDIR>/rui/slider.mbt:1054:15-1054:18:
     |   attrs? : @html.Attrs,
     |   input_attrs? : @html.Attrs,
     |   style? : Array[String] = [],
1054 | ) -> @rabbita.Val[@html.Html] {
     |               ^^^
     |   let fallback = slider_clamp(default_value, min, max)
     |   slider_values_impl(

<WORKDIR>/rui/sonner.mbt:36:15-36:18:
   |   attrs? : @html.Attrs,
   |   style? : Array[String] = [],
   |   children : (ToastScope) -> @html.Html,
36 | ) -> @rabbita.Val[@html.Html] {
   |               ^^^
   |   toaster_impl("sonner", true, max_toasts, position, class, attrs, style, scope => {
   |     @html.fragment([sonner_rich_color_stylesheet(), children(scope)])

<WORKDIR>/rui/switch.mbt:233:15-233:18:
    |   on_checked_change? : @cmd.Emit[Bool],
    |   attrs? : @html.Attrs,
    |   style? : Array[String] = [],
233 | ) -> @rabbita.Val[@html.Html] {
    |               ^^^
    |   let (checked, set_checked) = @rabbita.create_variable(default_checked)
    |   checked.view(checked => {

<WORKDIR>/rui/tabs.mbt:550:15-550:18:
    |   list_style? : Array[String] = [],
    |   trigger_style? : Array[String] = [],
    |   content_style? : Array[String] = [],
550 | ) -> @rabbita.Val[@html.Html] {
    |               ^^^
    |   let (value, set_value) = @rabbita.create_variable(
    |     tabs_initial_value(items, default_value),

<WORKDIR>/rui/toast.mbt:810:15-810:18:
    |   attrs : @html.Attrs?,
    |   style : Array[String],
    |   children : (ToastScope) -> @html.Html,
810 | ) -> @rabbita.Val[@html.Html] {
    |               ^^^
    |   let (model, emit) = @rabbita.create_state_with_init(
    |     init=emit => {

<WORKDIR>/rui/toast.mbt:1002:15-1002:18:
     |   attrs? : @html.Attrs,
     |   style? : Array[String] = [],
     |   children : (ToastScope) -> @html.Html,
1002 | ) -> @rabbita.Val[@html.Html] {
     |               ^^^
     |   toaster_impl(
     |     "toaster", false, max_toasts, position, class, attrs, style, children,

<WORKDIR>/rui/toggle.mbt:176:15-176:18:
    |   style? : Array[String] = [],
    |   slot? : String = "toggle",
    |   children : C,
176 | ) -> @rabbita.Val[@html.Html] {
    |               ^^^
    |   let (pressed, set_pressed) = @rabbita.create_variable(default_pressed)
    |   pressed.view(pressed => {

<WORKDIR>/rui/toggle_group.mbt:189:15-189:18:
    |   attrs? : @html.Attrs,
    |   style? : Array[String] = [],
    |   children : (ToggleGroupScope) -> C,
189 | ) -> @rabbita.Val[@html.Html] {
    |               ^^^
    |   let (values, emit) = @rabbita.create_state(default_values, update=fn(
    |     values,

<WORKDIR>/rui/tooltip.mbt:878:15-878:18:
    |   arrow_style? : Array[String] = [],
    |   trigger : T,
    |   content : C,
878 | ) -> @rabbita.Val[@html.Html] {
    |               ^^^
    |   let initial_open = default_open && !disabled
    |   let initial_model : TooltipModel = {

<WORKDIR>/utils/shiki/shiki.mbt:413:33-413:36:
    | }
    | 
    | ///|
413 | using @rabbita {type Html, type Val}
    |                                 ^^^

<WORKDIR>/website/homepage/components/calendar_showcase.mbt:45:36-45:39:
   |   #|
   | 
   | ///|
45 | fn calendar_showcase() -> @rabbita.Val[@html.Html] {
   |                                    ^^^
   |   let today = @rui.calendar_date(year=2026, month=7, day=16)
   |   let single = @rui.calendar(

<WORKDIR>/website/homepage/components/date_picker_showcase.mbt:142:39-142:42:
    | }
    | 
    | ///|
142 | fn date_picker_showcase() -> @rabbita.Val[@html.Html] {
    |                                       ^^^
    |   let today = @rui.calendar_date(year=2026, month=7, day=16)
    |   let single = @rui.date_picker(

<WORKDIR>/website/homepage/components/forms_input_group_variants.mbt:697:45-697:48:
    |   #|
    | 
    | ///|
697 | fn forms_input_group_variants() -> @rabbita.Val[@html.Html] {
    |                                             ^^^
    |   let connection_info = @rui.popover(
    |     id="forms-variants-input-group-connection-info",

<WORKDIR>/website/homepage/components/forms_variants.mbt:907:42-907:45:
    |   )
    | 
    | ///|
907 | fn forms_checkbox_variants() -> @rabbita.Val[@html.Html] {
    |                                          ^^^
    |   let checkbox_mixed = @rui.checkbox(
    |     id="forms-variants-checkbox-mixed",

<WORKDIR>/website/homepage/components/forms_variants.mbt:994:40-994:43:
    | }
    | 
    | ///|
994 | fn forms_switch_variants() -> @rabbita.Val[@html.Html] {
    |                                        ^^^
    |   let switch_default = @rui.switch(
    |     id="forms-variants-switch-default",

<WORKDIR>/website/homepage/components/forms_variants.mbt:1109:42-1109:45:
     | }
     | 
     | ///|
1109 | fn forms_combobox_variants() -> @rabbita.Val[@html.Html] {
     |                                          ^^^
     |   let framework_options = [
     |     @rui.combobox_option(value="moonbit", label="MoonBit"),

<WORKDIR>/website/homepage/components/forms_variants.mbt:1275:40-1275:43:
     | }
     | 
     | ///|
1275 | fn forms_select_variants() -> @rabbita.Val[@html.Html] {
     |                                        ^^^
     |   let deployment_options = [
     |     @rui.select_option(value="iad", label="Washington, D.C."),

<WORKDIR>/website/homepage/components/forms_variants.mbt:1648:37-1648:40:
     | } derive(Eq)
     | 
     | ///|
1648 | fn forms_otp_variants() -> @rabbita.Val[@html.Html] {
     |                                     ^^^
     |   let continuous = @rui.input_otp(
     |     id="forms-variants-otp-continuous",

<WORKDIR>/website/homepage/components/foundations_data_variants.mbt:1035:38-1035:41:
     | }
     | 
     | ///|
1035 | fn fdv_data_table_view() -> @rabbita.Val[@html.Html] {
     |                                      ^^^
     |   let rows : Array[FdvPayment] = [
     |     {

<WORKDIR>/website/homepage/components/interactions_collapsible.mbt:32:44-32:47:
   | const IgCollapsibleTreeLeafStyle : String = "display:flex;min-height:2rem;min-width:0;align-items:center;gap:0.5rem;padding:0.25rem 0.375rem;color:var(--rui-foreground);font-size:0.875rem;line-height:1.25rem"
   | 
   | ///|
32 | fn ig_collapsible_order_view() -> @rabbita.Val[@html.Html] {
   |                                            ^^^
   |   @rui.collapsible(
   |     id="showcase-collapsible-order",

<WORKDIR>/website/homepage/components/interactions_collapsible.mbt:72:44-72:47:
   | }
   | 
   | ///|
72 | fn ig_collapsible_basic_view() -> @rabbita.Val[@html.Html] {
   |                                            ^^^
   |   @rui.collapsible(
   |     id="showcase-collapsible-basic",

<WORKDIR>/website/homepage/components/interactions_collapsible.mbt:87:47-87:50:
   | }
   | 
   | ///|
87 | fn ig_collapsible_settings_view() -> @rabbita.Val[@html.Html] {
   |                                               ^^^
   |   @rui.collapsible(
   |     id="showcase-collapsible-settings",

<WORKDIR>/website/homepage/components/interactions_collapsible.mbt:208:48-208:51:
    | }
    | 
    | ///|
208 | fn ig_collapsible_file_tree_view() -> @rabbita.Val[@html.Html] {
    |                                                ^^^
    |   let view_tabs = @rui.tabs(
    |     id="showcase-file-tree-tabs",

<WORKDIR>/website/homepage/components/interactions_gallery.mbt:525:15-525:18:
    |   use_inset : Bool,
    |   mobile : Bool,
    |   resizable : Bool,
525 | ) -> @rabbita.Val[@html.Html] {
    |               ^^^
    |   @rui.sidebar_provider(
    |     default_collapsed~,

<WORKDIR>/website/homepage/components/interactions_gallery.mbt:558:45-558:48:
    | }
    | 
    | ///|
558 | fn ig_sidebar_loading_variant() -> @rabbita.Val[@html.Html] {
    |                                             ^^^
    |   @rui.sidebar_provider(
    |     default_collapsed=false,

<WORKDIR>/website/homepage/components/interactions_gallery.mbt:694:54-694:57:
    | }
    | 
    | ///|
694 | fn ig_navigation_page(selected : String) -> @rabbita.Val[@html.Html] {
    |                                                      ^^^
    |   let accordion_view = @rui.accordion(
    |     id="showcase-accordion",

<WORKDIR>/website/homepage/components/interactions_gallery.mbt:1222:15-1222:18:
     |   modal : Bool,
     |   trigger_variant : @rui.ButtonVariant,
     |   trigger_label : String,
1222 | ) -> @rabbita.Val[@html.Html] {
     |               ^^^
     |   @rui.dialog(id~, modal~, scope => {
     |     @html.fragment([

<WORKDIR>/website/homepage/components/interactions_gallery.mbt:1255:15-1255:18:
     |   id : String,
     |   direction : @rui.DrawerDirection,
     |   trigger_label : String,
1255 | ) -> @rabbita.Val[@html.Html] {
     |               ^^^
     |   @rui.drawer(id~, scope => {
     |     @html.fragment([

<WORKDIR>/website/homepage/components/interactions_gallery.mbt:1286:15-1286:18:
     |   id : String,
     |   side : @rui.SheetSide,
     |   trigger_label : String,
1286 | ) -> @rabbita.Val[@html.Html] {
     |               ^^^
     |   @rui.sheet(id~, scope => {
     |     @html.fragment([

<WORKDIR>/website/homepage/components/interactions_gallery.mbt:1313:15-1313:18:
     |   side : @rui.PopupSide,
     |   align : @rui.PopupAlign,
     |   trigger_label : String,
1313 | ) -> @rabbita.Val[@html.Html] {
     |               ^^^
     |   let title_id = id + "-title"
     |   let description_id = id + "-description"

<WORKDIR>/website/homepage/components/interactions_gallery.mbt:1347:15-1347:18:
     |   side : @rui.PopupSide,
     |   align : @rui.PopupAlign,
     |   trigger_label : String,
1347 | ) -> @rabbita.Val[@html.Html] {
     |               ^^^
     |   @rui.hover_card(
     |     id~,

<WORKDIR>/website/homepage/components/interactions_gallery.mbt:1378:15-1378:18:
     |   align : @rui.PopupAlign,
     |   size : @rui.ButtonSize,
     |   label : String,
1378 | ) -> @rabbita.Val[@html.Html] {
     |               ^^^
     |   @rui.tooltip(
     |     id~,

<WORKDIR>/website/homepage/components/interactions_gallery.mbt:1641:51-1641:54:
     | }
     | 
     | ///|
1641 | fn ig_overlay_page(selected : String) -> @rabbita.Val[@html.Html] {
     |                                                   ^^^
     |   let alert_dialog_view = @rui.alert_dialog(id="showcase-alert-dialog", scope => {
     |     @html.fragment([

<WORKDIR>/website/homepage/components/interactions_gallery.mbt:2798:52-2798:55:
     | }
     | 
     | ///|
2798 | fn ig_feedback_page(selected : String) -> @rabbita.Val[@html.Html] {
     |                                                    ^^^
     |   let sonner_default_view = @rui.sonner(max_toasts=3, position="bottom-right", scope => {
     |     @rui.button(

<WORKDIR>/website/homepage/components/page.mbt:159:55-159:58:
    | }
    | 
    | ///|
159 | fn showcase_component_page(slug : String) -> @rabbita.Val[@html.Html] {
    |                                                       ^^^
    |   match slug {
    |     "alert"

<WORKDIR>/website/homepage/components/page.mbt:264:19-264:22:
    | 
    | ///|
    | pub fn components_page(
264 |   dark : @rabbita.Val[Bool],
    |                   ^^^
    |   slug : String,
    | ) -> @rabbita.Val[@html.Html] {

<WORKDIR>/website/homepage/components/page.mbt:266:15-266:18:
    | pub fn components_page(
    |   dark : @rabbita.Val[Bool],
    |   slug : String,
266 | ) -> @rabbita.Val[@html.Html] {
    |               ^^^
    |   let component = showcase_component_page(slug)
    |   dark.view2(component, (dark, component) => {

<WORKDIR>/website/homepage/components/showcase_pages_forms.mbt:2:38-2:41:
  | ///|
2 | fn showcase_input_page() -> @rabbita.Val[@html.Html] {
  |                                      ^^^
  |   let (input_name, set_input_name) = @rabbita.create_variable("Ada Lovelace")
  |   let (input_email, set_input_email) = @rabbita.create_variable(

<WORKDIR>/website/homepage/components/showcase_pages_forms.mbt:46:41-46:44:
   | }
   | 
   | ///|
46 | fn showcase_textarea_page() -> @rabbita.Val[@html.Html] {
   |                                         ^^^
   |   let (textarea_note, set_textarea_note) = @rabbita.create_variable(
   |     "Ship the first programmable workspace.",

<WORKDIR>/website/homepage/components/showcase_pages_forms.mbt:84:44-84:47:
   | }
   | 
   | ///|
84 | fn showcase_radio_group_page() -> @rabbita.Val[@html.Html] {
   |                                            ^^^
   |   let (plan, set_plan) = @rabbita.create_variable("monthly")
   |   let horizontal = @rui.radio_group(

<WORKDIR>/website/homepage/components/showcase_pages_forms.mbt:161:39-161:42:
    | }
    | 
    | ///|
161 | fn showcase_slider_page() -> @rabbita.Val[@html.Html] {
    |                                       ^^^
    |   let (density_value, set_density) = @rabbita.create_variable(64)
    |   let density_slider = @rui.slider(

<WORKDIR>/website/homepage/components/showcase_pages_forms.mbt:221:38-221:41:
    | }
    | 
    | ///|
221 | fn showcase_field_page() -> @rabbita.Val[@html.Html] {
    |                                      ^^^
    |   let (form_state, set_form_state) = @rabbita.create_variable(
    |     (

<WORKDIR>/website/homepage/components/showcase_pages_forms.mbt:362:51-362:54:
    | }
    | 
    | ///|
362 | fn showcase_forms_page(slug : String) -> @rabbita.Val[@html.Html] {
    |                                                   ^^^
    |   match slug {
    |     "calendar" => calendar_showcase()

<WORKDIR>/website/homepage/components/showcase_pages_foundations.mbt:2:56-2:59:
  | ///|
2 | fn showcase_static_page(body : @html.Html) -> @rabbita.Val[@html.Html] {
  |                                                        ^^^
  |   @rabbita.Val::constant(body)
  | }

<WORKDIR>/website/homepage/components/showcase_pages_foundations.mbt:3:12-3:15:
  | ///|
  | fn showcase_static_page(body : @html.Html) -> @rabbita.Val[@html.Html] {
3 |   @rabbita.Val::constant(body)
  |            ^^^
  | }
  | 

<WORKDIR>/website/homepage/components/showcase_pages_foundations.mbt:7:39-7:42:
  | }
  | 
  | ///|
7 | fn showcase_toggle_page() -> @rabbita.Val[@html.Html] {
  |                                       ^^^
  |   let pin_view = @rui.toggle(
  |     variant=Outline,

<WORKDIR>/website/homepage/components/showcase_pages_foundations.mbt:24:45-24:48:
   | }
   | 
   | ///|
24 | fn showcase_toggle_group_page() -> @rabbita.Val[@html.Html] {
   |                                             ^^^
   |   let density_view = @rui.toggle_group(
   |     default_values=["grid"],

<WORKDIR>/website/homepage/components/showcase_pages_foundations.mbt:70:57-70:60:
   | }
   | 
   | ///|
70 | fn showcase_foundations_page(slug : String) -> @rabbita.Val[@html.Html] {
   |                                                         ^^^
   |   match slug {
   |     "alert" => showcase_static_page(foundations_alert_demo())

<WORKDIR>/website/homepage/main/main.mbt:42:33-42:36:
   | }
   | 
   | ///|
42 | using @rabbita {type Html, type Val, type Cmd, batch, none}
   |                                 ^^^
   | 
   | ///|

<WORKDIR>/website/playground/main/main.mbt:5:54-5:57:
  | using @html {a, button, div, iframe, li, nothing, option, pre, select, span, ul}
  | 
  | ///|
5 | using @rabbita {type Cmd, type Emit, type Html, type Val}
  |                                                      ^^^
  | 
  | ///|

```
