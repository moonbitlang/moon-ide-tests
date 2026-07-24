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
Found 160 references for symbol 'Val':
<WORKDIR>/examples/SSR/main/server.mbt:77:14-77:17:
   | #cfg(target="native")
   | async fn main {
   |   let rendered = @rabbita.render_to_string(() => {
77 |     @rabbita.Val::constant(view(@rabbita.none, 0))
   |              ^^^
   |   })
   |   let html =

<WORKDIR>/rabbita/deprecated.mbt:6:23-6:26:
  | ///
  | /// New components should return `Val[Html]` directly.
  | #deprecated("Use a `() -> Val[Html]` component. Nested `Cell::view()` composition is no longer supported; use `Val::map`, `Val::switch`, or `Val::assoc` instead.", skip_current_package=true)
6 | pub type Cell = () -> Val[Html]
  |                       ^^^
  | 
  | ///|

<WORKDIR>/rabbita/deprecated.mbt:74:16-74:19:
   |   ignore(update)
   |   ignore(subscriptions)
   |   let emit : Emit[Msg] = @cmd.make_legacy_emitter((_, _) => ())
74 |   (emit, () => Val::constant(view(emit, model)))
   |                ^^^
   | }
   | 

<WORKDIR>/rabbita/deprecated.mbt:143:9-143:12:
    | /// Compatibility wrapper for the former static Cell constructor.
    | #deprecated("Use a component returning `Val::constant(html)` instead.", skip_current_package=true)
    | pub fn static_cell(html : Html) -> Cell {
143 |   () => Val::constant(html)
    |         ^^^
    | }
    | 

<WORKDIR>/rabbita/incremental.mbt:16:8-16:11:
   | ///
   | /// Derived values are recomputed on demand after one of their dependencies
   | /// changes.
16 | struct Val[A](@duplix.Node[A])
   |        ^^^
   | 
   | ///|

<WORKDIR>/rabbita/incremental.mbt:34:19-34:22:
   | /// Creates an incremental value by applying `f` to `a`.
   | ///
   | /// The function is reevaluated when the value of `a` changes.
34 | pub fn[A : Eq, B] Val::map(a : Val[A], f : (A) -> B) -> Val[B] {
   |                   ^^^
   |   a.0.map1(f)
   | }

<WORKDIR>/rabbita/incremental.mbt:34:32-34:35:
   | /// Creates an incremental value by applying `f` to `a`.
   | ///
   | /// The function is reevaluated when the value of `a` changes.
34 | pub fn[A : Eq, B] Val::map(a : Val[A], f : (A) -> B) -> Val[B] {
   |                                ^^^
   |   a.0.map1(f)
   | }

<WORKDIR>/rabbita/incremental.mbt:34:57-34:60:
   | /// Creates an incremental value by applying `f` to `a`.
   | ///
   | /// The function is reevaluated when the value of `a` changes.
34 | pub fn[A : Eq, B] Val::map(a : Val[A], f : (A) -> B) -> Val[B] {
   |                                                         ^^^
   |   a.0.map1(f)
   | }

<WORKDIR>/rabbita/incremental.mbt:40:11-40:14:
   | 
   | ///|
   | /// Creates an incremental value that always contains `a`.
40 | pub fn[A] Val::constant(a : A) -> Val[A] {
   |           ^^^
   |   @duplix.constant(a)
   | }

<WORKDIR>/rabbita/incremental.mbt:40:35-40:38:
   | 
   | ///|
   | /// Creates an incremental value that always contains `a`.
40 | pub fn[A] Val::constant(a : A) -> Val[A] {
   |                                   ^^^
   |   @duplix.constant(a)
   | }

<WORKDIR>/rabbita/incremental.mbt:48:27-48:30:
   | /// Creates an incremental value derived from two inputs.
   | ///
   | /// The function is reevaluated when either input value changes.
48 | pub fn[A : Eq, B : Eq, C] Val::map2(
   |                           ^^^
   |   a : Val[A],
   |   b : Val[B],

<WORKDIR>/rabbita/incremental.mbt:49:7-49:10:
   | ///
   | /// The function is reevaluated when either input value changes.
   | pub fn[A : Eq, B : Eq, C] Val::map2(
49 |   a : Val[A],
   |       ^^^
   |   b : Val[B],
   |   f : (A, B) -> C,

<WORKDIR>/rabbita/incremental.mbt:50:7-50:10:
   | /// The function is reevaluated when either input value changes.
   | pub fn[A : Eq, B : Eq, C] Val::map2(
   |   a : Val[A],
50 |   b : Val[B],
   |       ^^^
   |   f : (A, B) -> C,
   | ) -> Val[C] {

<WORKDIR>/rabbita/incremental.mbt:52:6-52:9:
   |   a : Val[A],
   |   b : Val[B],
   |   f : (A, B) -> C,
52 | ) -> Val[C] {
   |      ^^^
   |   a.0.map2(b.0, f)
   | }

<WORKDIR>/rabbita/incremental.mbt:60:35-60:38:
   | /// Creates an incremental value derived from three inputs.
   | ///
   | /// The function is reevaluated when any input value changes.
60 | pub fn[A : Eq, B : Eq, C : Eq, D] Val::map3(
   |                                   ^^^
   |   a : Val[A],
   |   b : Val[B],

<WORKDIR>/rabbita/incremental.mbt:61:7-61:10:
   | ///
   | /// The function is reevaluated when any input value changes.
   | pub fn[A : Eq, B : Eq, C : Eq, D] Val::map3(
61 |   a : Val[A],
   |       ^^^
   |   b : Val[B],
   |   c : Val[C],

<WORKDIR>/rabbita/incremental.mbt:62:7-62:10:
   | /// The function is reevaluated when any input value changes.
   | pub fn[A : Eq, B : Eq, C : Eq, D] Val::map3(
   |   a : Val[A],
62 |   b : Val[B],
   |       ^^^
   |   c : Val[C],
   |   f : (A, B, C) -> D,

<WORKDIR>/rabbita/incremental.mbt:63:7-63:10:
   | pub fn[A : Eq, B : Eq, C : Eq, D] Val::map3(
   |   a : Val[A],
   |   b : Val[B],
63 |   c : Val[C],
   |       ^^^
   |   f : (A, B, C) -> D,
   | ) -> Val[D] {

<WORKDIR>/rabbita/incremental.mbt:65:6-65:9:
   |   b : Val[B],
   |   c : Val[C],
   |   f : (A, B, C) -> D,
65 | ) -> Val[D] {
   |      ^^^
   |   a.0.map3(b.0, c.0, f)
   | }

<WORKDIR>/rabbita/incremental.mbt:73:43-73:46:
   | /// Creates an incremental value derived from four inputs.
   | ///
   | /// The function is reevaluated when any input value changes.
73 | pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E] Val::map4(
   |                                           ^^^
   |   a : Val[A],
   |   b : Val[B],

<WORKDIR>/rabbita/incremental.mbt:74:7-74:10:
   | ///
   | /// The function is reevaluated when any input value changes.
   | pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E] Val::map4(
74 |   a : Val[A],
   |       ^^^
   |   b : Val[B],
   |   c : Val[C],

<WORKDIR>/rabbita/incremental.mbt:75:7-75:10:
   | /// The function is reevaluated when any input value changes.
   | pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E] Val::map4(
   |   a : Val[A],
75 |   b : Val[B],
   |       ^^^
   |   c : Val[C],
   |   d : Val[D],

<WORKDIR>/rabbita/incremental.mbt:76:7-76:10:
   | pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E] Val::map4(
   |   a : Val[A],
   |   b : Val[B],
76 |   c : Val[C],
   |       ^^^
   |   d : Val[D],
   |   f : (A, B, C, D) -> E,

<WORKDIR>/rabbita/incremental.mbt:77:7-77:10:
   |   a : Val[A],
   |   b : Val[B],
   |   c : Val[C],
77 |   d : Val[D],
   |       ^^^
   |   f : (A, B, C, D) -> E,
   | ) -> Val[E] {

<WORKDIR>/rabbita/incremental.mbt:79:6-79:9:
   |   c : Val[C],
   |   d : Val[D],
   |   f : (A, B, C, D) -> E,
79 | ) -> Val[E] {
   |      ^^^
   |   a.0.map4(b.0, c.0, d.0, f)
   | }

<WORKDIR>/rabbita/incremental.mbt:87:51-87:54:
   | /// Creates an incremental value derived from five inputs.
   | ///
   | /// The function is reevaluated when any input value changes.
87 | pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E : Eq, F] Val::map5(
   |                                                   ^^^
   |   a : Val[A],
   |   b : Val[B],

<WORKDIR>/rabbita/incremental.mbt:88:7-88:10:
   | ///
   | /// The function is reevaluated when any input value changes.
   | pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E : Eq, F] Val::map5(
88 |   a : Val[A],
   |       ^^^
   |   b : Val[B],
   |   c : Val[C],

<WORKDIR>/rabbita/incremental.mbt:89:7-89:10:
   | /// The function is reevaluated when any input value changes.
   | pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E : Eq, F] Val::map5(
   |   a : Val[A],
89 |   b : Val[B],
   |       ^^^
   |   c : Val[C],
   |   d : Val[D],

<WORKDIR>/rabbita/incremental.mbt:90:7-90:10:
   | pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E : Eq, F] Val::map5(
   |   a : Val[A],
   |   b : Val[B],
90 |   c : Val[C],
   |       ^^^
   |   d : Val[D],
   |   e : Val[E],

<WORKDIR>/rabbita/incremental.mbt:91:7-91:10:
   |   a : Val[A],
   |   b : Val[B],
   |   c : Val[C],
91 |   d : Val[D],
   |       ^^^
   |   e : Val[E],
   |   f : (A, B, C, D, E) -> F,

<WORKDIR>/rabbita/incremental.mbt:92:7-92:10:
   |   b : Val[B],
   |   c : Val[C],
   |   d : Val[D],
92 |   e : Val[E],
   |       ^^^
   |   f : (A, B, C, D, E) -> F,
   | ) -> Val[F] {

<WORKDIR>/rabbita/incremental.mbt:94:6-94:9:
   |   d : Val[D],
   |   e : Val[E],
   |   f : (A, B, C, D, E) -> F,
94 | ) -> Val[F] {
   |      ^^^
   |   a.0.map5(b.0, c.0, d.0, e.0, f)
   | }

<WORKDIR>/rabbita/incremental.mbt:102:59-102:62:
    | /// Creates an incremental value derived from six inputs.
    | ///
    | /// The function is reevaluated when any input value changes.
102 | pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E : Eq, F : Eq, G] Val::map6(
    |                                                           ^^^
    |   a : Val[A],
    |   b : Val[B],

<WORKDIR>/rabbita/incremental.mbt:103:7-103:10:
    | ///
    | /// The function is reevaluated when any input value changes.
    | pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E : Eq, F : Eq, G] Val::map6(
103 |   a : Val[A],
    |       ^^^
    |   b : Val[B],
    |   c : Val[C],

<WORKDIR>/rabbita/incremental.mbt:104:7-104:10:
    | /// The function is reevaluated when any input value changes.
    | pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E : Eq, F : Eq, G] Val::map6(
    |   a : Val[A],
104 |   b : Val[B],
    |       ^^^
    |   c : Val[C],
    |   d : Val[D],

<WORKDIR>/rabbita/incremental.mbt:105:7-105:10:
    | pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E : Eq, F : Eq, G] Val::map6(
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
    |   g : (A, B, C, D, E, F) -> G,

<WORKDIR>/rabbita/incremental.mbt:108:7-108:10:
    |   c : Val[C],
    |   d : Val[D],
    |   e : Val[E],
108 |   f : Val[F],
    |       ^^^
    |   g : (A, B, C, D, E, F) -> G,
    | ) -> Val[G] {

<WORKDIR>/rabbita/incremental.mbt:110:6-110:9:
    |   e : Val[E],
    |   f : Val[F],
    |   g : (A, B, C, D, E, F) -> G,
110 | ) -> Val[G] {
    |      ^^^
    |   a.0.map6(b.0, c.0, d.0, e.0, f.0, g)
    | }

<WORKDIR>/rabbita/incremental.mbt:118:67-118:70:
    | /// Creates an incremental value derived from seven inputs.
    | ///
    | /// The function is reevaluated when any input value changes.
118 | pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E : Eq, F : Eq, G : Eq, H] Val::map7(
    |                                                                   ^^^
    |   a : Val[A],
    |   b : Val[B],

<WORKDIR>/rabbita/incremental.mbt:119:7-119:10:
    | ///
    | /// The function is reevaluated when any input value changes.
    | pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E : Eq, F : Eq, G : Eq, H] Val::map7(
119 |   a : Val[A],
    |       ^^^
    |   b : Val[B],
    |   c : Val[C],

<WORKDIR>/rabbita/incremental.mbt:120:7-120:10:
    | /// The function is reevaluated when any input value changes.
    | pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E : Eq, F : Eq, G : Eq, H] Val::map7(
    |   a : Val[A],
120 |   b : Val[B],
    |       ^^^
    |   c : Val[C],
    |   d : Val[D],

<WORKDIR>/rabbita/incremental.mbt:121:7-121:10:
    | pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E : Eq, F : Eq, G : Eq, H] Val::map7(
    |   a : Val[A],
    |   b : Val[B],
121 |   c : Val[C],
    |       ^^^
    |   d : Val[D],
    |   e : Val[E],

<WORKDIR>/rabbita/incremental.mbt:122:7-122:10:
    |   a : Val[A],
    |   b : Val[B],
    |   c : Val[C],
122 |   d : Val[D],
    |       ^^^
    |   e : Val[E],
    |   f : Val[F],

<WORKDIR>/rabbita/incremental.mbt:123:7-123:10:
    |   b : Val[B],
    |   c : Val[C],
    |   d : Val[D],
123 |   e : Val[E],
    |       ^^^
    |   f : Val[F],
    |   g : Val[G],

<WORKDIR>/rabbita/incremental.mbt:124:7-124:10:
    |   c : Val[C],
    |   d : Val[D],
    |   e : Val[E],
124 |   f : Val[F],
    |       ^^^
    |   g : Val[G],
    |   h : (A, B, C, D, E, F, G) -> H,

<WORKDIR>/rabbita/incremental.mbt:125:7-125:10:
    |   d : Val[D],
    |   e : Val[E],
    |   f : Val[F],
125 |   g : Val[G],
    |       ^^^
    |   h : (A, B, C, D, E, F, G) -> H,
    | ) -> Val[H] {

<WORKDIR>/rabbita/incremental.mbt:127:6-127:9:
    |   f : Val[F],
    |   g : Val[G],
    |   h : (A, B, C, D, E, F, G) -> H,
127 | ) -> Val[H] {
    |      ^^^
    |   a.0.map7(b.0, c.0, d.0, e.0, f.0, g.0, h)
    | }

<WORKDIR>/rabbita/incremental.mbt:135:75-135:78:
    | /// Creates an incremental value derived from eight inputs.
    | ///
    | /// The function is reevaluated when any input value changes.
135 | pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E : Eq, F : Eq, G : Eq, H : Eq, I] Val::map8(
    |                                                                           ^^^
    |   a : Val[A],
    |   b : Val[B],

<WORKDIR>/rabbita/incremental.mbt:136:7-136:10:
    | ///
    | /// The function is reevaluated when any input value changes.
    | pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E : Eq, F : Eq, G : Eq, H : Eq, I] Val::map8(
136 |   a : Val[A],
    |       ^^^
    |   b : Val[B],
    |   c : Val[C],

<WORKDIR>/rabbita/incremental.mbt:137:7-137:10:
    | /// The function is reevaluated when any input value changes.
    | pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E : Eq, F : Eq, G : Eq, H : Eq, I] Val::map8(
    |   a : Val[A],
137 |   b : Val[B],
    |       ^^^
    |   c : Val[C],
    |   d : Val[D],

<WORKDIR>/rabbita/incremental.mbt:138:7-138:10:
    | pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E : Eq, F : Eq, G : Eq, H : Eq, I] Val::map8(
    |   a : Val[A],
    |   b : Val[B],
138 |   c : Val[C],
    |       ^^^
    |   d : Val[D],
    |   e : Val[E],

<WORKDIR>/rabbita/incremental.mbt:139:7-139:10:
    |   a : Val[A],
    |   b : Val[B],
    |   c : Val[C],
139 |   d : Val[D],
    |       ^^^
    |   e : Val[E],
    |   f : Val[F],

<WORKDIR>/rabbita/incremental.mbt:140:7-140:10:
    |   b : Val[B],
    |   c : Val[C],
    |   d : Val[D],
140 |   e : Val[E],
    |       ^^^
    |   f : Val[F],
    |   g : Val[G],

<WORKDIR>/rabbita/incremental.mbt:141:7-141:10:
    |   c : Val[C],
    |   d : Val[D],
    |   e : Val[E],
141 |   f : Val[F],
    |       ^^^
    |   g : Val[G],
    |   h : Val[H],

<WORKDIR>/rabbita/incremental.mbt:142:7-142:10:
    |   d : Val[D],
    |   e : Val[E],
    |   f : Val[F],
142 |   g : Val[G],
    |       ^^^
    |   h : Val[H],
    |   i : (A, B, C, D, E, F, G, H) -> I,

<WORKDIR>/rabbita/incremental.mbt:143:7-143:10:
    |   e : Val[E],
    |   f : Val[F],
    |   g : Val[G],
143 |   h : Val[H],
    |       ^^^
    |   i : (A, B, C, D, E, F, G, H) -> I,
    | ) -> Val[I] {

<WORKDIR>/rabbita/incremental.mbt:145:6-145:9:
    |   g : Val[G],
    |   h : Val[H],
    |   i : (A, B, C, D, E, F, G, H) -> I,
145 | ) -> Val[I] {
    |      ^^^
    |   a.0.map8(b.0, c.0, d.0, e.0, f.0, g.0, h.0, i)
    | }

<WORKDIR>/rabbita/incremental.mbt:164:3-164:6:
    |   H : Eq,
    |   I : Eq,
    |   J,
164 | ] Val::map9(
    |   ^^^
    |   a : Val[A],
    |   b : Val[B],

<WORKDIR>/rabbita/incremental.mbt:165:7-165:10:
    |   I : Eq,
    |   J,
    | ] Val::map9(
165 |   a : Val[A],
    |       ^^^
    |   b : Val[B],
    |   c : Val[C],

<WORKDIR>/rabbita/incremental.mbt:166:7-166:10:
    |   J,
    | ] Val::map9(
    |   a : Val[A],
166 |   b : Val[B],
    |       ^^^
    |   c : Val[C],
    |   d : Val[D],

<WORKDIR>/rabbita/incremental.mbt:167:7-167:10:
    | ] Val::map9(
    |   a : Val[A],
    |   b : Val[B],
167 |   c : Val[C],
    |       ^^^
    |   d : Val[D],
    |   e : Val[E],

<WORKDIR>/rabbita/incremental.mbt:168:7-168:10:
    |   a : Val[A],
    |   b : Val[B],
    |   c : Val[C],
168 |   d : Val[D],
    |       ^^^
    |   e : Val[E],
    |   f : Val[F],

<WORKDIR>/rabbita/incremental.mbt:169:7-169:10:
    |   b : Val[B],
    |   c : Val[C],
    |   d : Val[D],
169 |   e : Val[E],
    |       ^^^
    |   f : Val[F],
    |   g : Val[G],

<WORKDIR>/rabbita/incremental.mbt:170:7-170:10:
    |   c : Val[C],
    |   d : Val[D],
    |   e : Val[E],
170 |   f : Val[F],
    |       ^^^
    |   g : Val[G],
    |   h : Val[H],

<WORKDIR>/rabbita/incremental.mbt:171:7-171:10:
    |   d : Val[D],
    |   e : Val[E],
    |   f : Val[F],
171 |   g : Val[G],
    |       ^^^
    |   h : Val[H],
    |   i : Val[I],

<WORKDIR>/rabbita/incremental.mbt:172:7-172:10:
    |   e : Val[E],
    |   f : Val[F],
    |   g : Val[G],
172 |   h : Val[H],
    |       ^^^
    |   i : Val[I],
    |   j : (A, B, C, D, E, F, G, H, I) -> J,

<WORKDIR>/rabbita/incremental.mbt:173:7-173:10:
    |   f : Val[F],
    |   g : Val[G],
    |   h : Val[H],
173 |   i : Val[I],
    |       ^^^
    |   j : (A, B, C, D, E, F, G, H, I) -> J,
    | ) -> Val[J] {

<WORKDIR>/rabbita/incremental.mbt:175:6-175:9:
    |   h : Val[H],
    |   i : Val[I],
    |   j : (A, B, C, D, E, F, G, H, I) -> J,
175 | ) -> Val[J] {
    |      ^^^
    |   a.0.map9(b.0, c.0, d.0, e.0, f.0, g.0, h.0, i.0, j)
    | }

<WORKDIR>/rabbita/incremental.mbt:183:16-183:19:
    | /// Creates an HTML view derived from one incremental value.
    | ///
    | /// The render function is reevaluated when `a` changes.
183 | pub fn[A : Eq] Val::view(a : Val[A], render : (A) -> Html) -> Val[Html] {
    |                ^^^
    |   a.0.map(render)
    | }

<WORKDIR>/rabbita/incremental.mbt:183:30-183:33:
    | /// Creates an HTML view derived from one incremental value.
    | ///
    | /// The render function is reevaluated when `a` changes.
183 | pub fn[A : Eq] Val::view(a : Val[A], render : (A) -> Html) -> Val[Html] {
    |                              ^^^
    |   a.0.map(render)
    | }

<WORKDIR>/rabbita/incremental.mbt:183:63-183:66:
    | /// Creates an HTML view derived from one incremental value.
    | ///
    | /// The render function is reevaluated when `a` changes.
183 | pub fn[A : Eq] Val::view(a : Val[A], render : (A) -> Html) -> Val[Html] {
    |                                                               ^^^
    |   a.0.map(render)
    | }

<WORKDIR>/rabbita/incremental.mbt:191:24-191:27:
    | /// Creates an HTML view derived from two incremental values.
    | ///
    | /// The render function is reevaluated when either input changes.
191 | pub fn[A : Eq, B : Eq] Val::view2(
    |                        ^^^
    |   a : Val[A],
    |   b : Val[B],

<WORKDIR>/rabbita/incremental.mbt:192:7-192:10:
    | ///
    | /// The render function is reevaluated when either input changes.
    | pub fn[A : Eq, B : Eq] Val::view2(
192 |   a : Val[A],
    |       ^^^
    |   b : Val[B],
    |   render : (A, B) -> Html,

<WORKDIR>/rabbita/incremental.mbt:193:7-193:10:
    | /// The render function is reevaluated when either input changes.
    | pub fn[A : Eq, B : Eq] Val::view2(
    |   a : Val[A],
193 |   b : Val[B],
    |       ^^^
    |   render : (A, B) -> Html,
    | ) -> Val[Html] {

<WORKDIR>/rabbita/incremental.mbt:195:6-195:9:
    |   a : Val[A],
    |   b : Val[B],
    |   render : (A, B) -> Html,
195 | ) -> Val[Html] {
    |      ^^^
    |   a.0.map2(b.0, render)
    | }

<WORKDIR>/rabbita/incremental.mbt:203:32-203:35:
    | /// Creates an HTML view derived from three incremental values.
    | ///
    | /// The render function is reevaluated when any input changes.
203 | pub fn[A : Eq, B : Eq, C : Eq] Val::view3(
    |                                ^^^
    |   a : Val[A],
    |   b : Val[B],

<WORKDIR>/rabbita/incremental.mbt:204:7-204:10:
    | ///
    | /// The render function is reevaluated when any input changes.
    | pub fn[A : Eq, B : Eq, C : Eq] Val::view3(
204 |   a : Val[A],
    |       ^^^
    |   b : Val[B],
    |   c : Val[C],

<WORKDIR>/rabbita/incremental.mbt:205:7-205:10:
    | /// The render function is reevaluated when any input changes.
    | pub fn[A : Eq, B : Eq, C : Eq] Val::view3(
    |   a : Val[A],
205 |   b : Val[B],
    |       ^^^
    |   c : Val[C],
    |   render : (A, B, C) -> Html,

<WORKDIR>/rabbita/incremental.mbt:206:7-206:10:
    | pub fn[A : Eq, B : Eq, C : Eq] Val::view3(
    |   a : Val[A],
    |   b : Val[B],
206 |   c : Val[C],
    |       ^^^
    |   render : (A, B, C) -> Html,
    | ) -> Val[Html] {

<WORKDIR>/rabbita/incremental.mbt:208:6-208:9:
    |   b : Val[B],
    |   c : Val[C],
    |   render : (A, B, C) -> Html,
208 | ) -> Val[Html] {
    |      ^^^
    |   a.0.map3(b.0, c.0, render)
    | }

<WORKDIR>/rabbita/incremental.mbt:216:40-216:43:
    | /// Creates an HTML view derived from four incremental values.
    | ///
    | /// The render function is reevaluated when any input changes.
216 | pub fn[A : Eq, B : Eq, C : Eq, D : Eq] Val::view4(
    |                                        ^^^
    |   a : Val[A],
    |   b : Val[B],

<WORKDIR>/rabbita/incremental.mbt:217:7-217:10:
    | ///
    | /// The render function is reevaluated when any input changes.
    | pub fn[A : Eq, B : Eq, C : Eq, D : Eq] Val::view4(
217 |   a : Val[A],
    |       ^^^
    |   b : Val[B],
    |   c : Val[C],

<WORKDIR>/rabbita/incremental.mbt:218:7-218:10:
    | /// The render function is reevaluated when any input changes.
    | pub fn[A : Eq, B : Eq, C : Eq, D : Eq] Val::view4(
    |   a : Val[A],
218 |   b : Val[B],
    |       ^^^
    |   c : Val[C],
    |   d : Val[D],

<WORKDIR>/rabbita/incremental.mbt:219:7-219:10:
    | pub fn[A : Eq, B : Eq, C : Eq, D : Eq] Val::view4(
    |   a : Val[A],
    |   b : Val[B],
219 |   c : Val[C],
    |       ^^^
    |   d : Val[D],
    |   render : (A, B, C, D) -> Html,

<WORKDIR>/rabbita/incremental.mbt:220:7-220:10:
    |   a : Val[A],
    |   b : Val[B],
    |   c : Val[C],
220 |   d : Val[D],
    |       ^^^
    |   render : (A, B, C, D) -> Html,
    | ) -> Val[Html] {

<WORKDIR>/rabbita/incremental.mbt:222:6-222:9:
    |   c : Val[C],
    |   d : Val[D],
    |   render : (A, B, C, D) -> Html,
222 | ) -> Val[Html] {
    |      ^^^
    |   a.0.map4(b.0, c.0, d.0, render)
    | }

<WORKDIR>/rabbita/incremental.mbt:230:48-230:51:
    | /// Creates an HTML view derived from five incremental values.
    | ///
    | /// The render function is reevaluated when any input changes.
230 | pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E : Eq] Val::view5(
    |                                                ^^^
    |   a : Val[A],
    |   b : Val[B],

<WORKDIR>/rabbita/incremental.mbt:231:7-231:10:
    | ///
    | /// The render function is reevaluated when any input changes.
    | pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E : Eq] Val::view5(
231 |   a : Val[A],
    |       ^^^
    |   b : Val[B],
    |   c : Val[C],

<WORKDIR>/rabbita/incremental.mbt:232:7-232:10:
    | /// The render function is reevaluated when any input changes.
    | pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E : Eq] Val::view5(
    |   a : Val[A],
232 |   b : Val[B],
    |       ^^^
    |   c : Val[C],
    |   d : Val[D],

<WORKDIR>/rabbita/incremental.mbt:233:7-233:10:
    | pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E : Eq] Val::view5(
    |   a : Val[A],
    |   b : Val[B],
233 |   c : Val[C],
    |       ^^^
    |   d : Val[D],
    |   e : Val[E],

<WORKDIR>/rabbita/incremental.mbt:234:7-234:10:
    |   a : Val[A],
    |   b : Val[B],
    |   c : Val[C],
234 |   d : Val[D],
    |       ^^^
    |   e : Val[E],
    |   render : (A, B, C, D, E) -> Html,

<WORKDIR>/rabbita/incremental.mbt:235:7-235:10:
    |   b : Val[B],
    |   c : Val[C],
    |   d : Val[D],
235 |   e : Val[E],
    |       ^^^
    |   render : (A, B, C, D, E) -> Html,
    | ) -> Val[Html] {

<WORKDIR>/rabbita/incremental.mbt:237:6-237:9:
    |   d : Val[D],
    |   e : Val[E],
    |   render : (A, B, C, D, E) -> Html,
237 | ) -> Val[Html] {
    |      ^^^
    |   a.0.map5(b.0, c.0, d.0, e.0, render)
    | }

<WORKDIR>/rabbita/incremental.mbt:245:56-245:59:
    | /// Creates an HTML view derived from six incremental values.
    | ///
    | /// The render function is reevaluated when any input changes.
245 | pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E : Eq, F : Eq] Val::view6(
    |                                                        ^^^
    |   a : Val[A],
    |   b : Val[B],

<WORKDIR>/rabbita/incremental.mbt:246:7-246:10:
    | ///
    | /// The render function is reevaluated when any input changes.
    | pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E : Eq, F : Eq] Val::view6(
246 |   a : Val[A],
    |       ^^^
    |   b : Val[B],
    |   c : Val[C],

<WORKDIR>/rabbita/incremental.mbt:247:7-247:10:
    | /// The render function is reevaluated when any input changes.
    | pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E : Eq, F : Eq] Val::view6(
    |   a : Val[A],
247 |   b : Val[B],
    |       ^^^
    |   c : Val[C],
    |   d : Val[D],

<WORKDIR>/rabbita/incremental.mbt:248:7-248:10:
    | pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E : Eq, F : Eq] Val::view6(
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
    |   render : (A, B, C, D, E, F) -> Html,

<WORKDIR>/rabbita/incremental.mbt:251:7-251:10:
    |   c : Val[C],
    |   d : Val[D],
    |   e : Val[E],
251 |   f : Val[F],
    |       ^^^
    |   render : (A, B, C, D, E, F) -> Html,
    | ) -> Val[Html] {

<WORKDIR>/rabbita/incremental.mbt:253:6-253:9:
    |   e : Val[E],
    |   f : Val[F],
    |   render : (A, B, C, D, E, F) -> Html,
253 | ) -> Val[Html] {
    |      ^^^
    |   a.0.map6(b.0, c.0, d.0, e.0, f.0, render)
    | }

<WORKDIR>/rabbita/incremental.mbt:261:64-261:67:
    | /// Creates an HTML view derived from seven incremental values.
    | ///
    | /// The render function is reevaluated when any input changes.
261 | pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E : Eq, F : Eq, G : Eq] Val::view7(
    |                                                                ^^^
    |   a : Val[A],
    |   b : Val[B],

<WORKDIR>/rabbita/incremental.mbt:262:7-262:10:
    | ///
    | /// The render function is reevaluated when any input changes.
    | pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E : Eq, F : Eq, G : Eq] Val::view7(
262 |   a : Val[A],
    |       ^^^
    |   b : Val[B],
    |   c : Val[C],

<WORKDIR>/rabbita/incremental.mbt:263:7-263:10:
    | /// The render function is reevaluated when any input changes.
    | pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E : Eq, F : Eq, G : Eq] Val::view7(
    |   a : Val[A],
263 |   b : Val[B],
    |       ^^^
    |   c : Val[C],
    |   d : Val[D],

<WORKDIR>/rabbita/incremental.mbt:264:7-264:10:
    | pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E : Eq, F : Eq, G : Eq] Val::view7(
    |   a : Val[A],
    |   b : Val[B],
264 |   c : Val[C],
    |       ^^^
    |   d : Val[D],
    |   e : Val[E],

<WORKDIR>/rabbita/incremental.mbt:265:7-265:10:
    |   a : Val[A],
    |   b : Val[B],
    |   c : Val[C],
265 |   d : Val[D],
    |       ^^^
    |   e : Val[E],
    |   f : Val[F],

<WORKDIR>/rabbita/incremental.mbt:266:7-266:10:
    |   b : Val[B],
    |   c : Val[C],
    |   d : Val[D],
266 |   e : Val[E],
    |       ^^^
    |   f : Val[F],
    |   g : Val[G],

<WORKDIR>/rabbita/incremental.mbt:267:7-267:10:
    |   c : Val[C],
    |   d : Val[D],
    |   e : Val[E],
267 |   f : Val[F],
    |       ^^^
    |   g : Val[G],
    |   render : (A, B, C, D, E, F, G) -> Html,

<WORKDIR>/rabbita/incremental.mbt:268:7-268:10:
    |   d : Val[D],
    |   e : Val[E],
    |   f : Val[F],
268 |   g : Val[G],
    |       ^^^
    |   render : (A, B, C, D, E, F, G) -> Html,
    | ) -> Val[Html] {

<WORKDIR>/rabbita/incremental.mbt:270:6-270:9:
    |   f : Val[F],
    |   g : Val[G],
    |   render : (A, B, C, D, E, F, G) -> Html,
270 | ) -> Val[Html] {
    |      ^^^
    |   a.0.map7(b.0, c.0, d.0, e.0, f.0, g.0, render)
    | }

<WORKDIR>/rabbita/incremental.mbt:278:72-278:75:
    | /// Creates an HTML view derived from eight incremental values.
    | ///
    | /// The render function is reevaluated when any input changes.
278 | pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E : Eq, F : Eq, G : Eq, H : Eq] Val::view8(
    |                                                                        ^^^
    |   a : Val[A],
    |   b : Val[B],

<WORKDIR>/rabbita/incremental.mbt:279:7-279:10:
    | ///
    | /// The render function is reevaluated when any input changes.
    | pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E : Eq, F : Eq, G : Eq, H : Eq] Val::view8(
279 |   a : Val[A],
    |       ^^^
    |   b : Val[B],
    |   c : Val[C],

<WORKDIR>/rabbita/incremental.mbt:280:7-280:10:
    | /// The render function is reevaluated when any input changes.
    | pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E : Eq, F : Eq, G : Eq, H : Eq] Val::view8(
    |   a : Val[A],
280 |   b : Val[B],
    |       ^^^
    |   c : Val[C],
    |   d : Val[D],

<WORKDIR>/rabbita/incremental.mbt:281:7-281:10:
    | pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E : Eq, F : Eq, G : Eq, H : Eq] Val::view8(
    |   a : Val[A],
    |   b : Val[B],
281 |   c : Val[C],
    |       ^^^
    |   d : Val[D],
    |   e : Val[E],

<WORKDIR>/rabbita/incremental.mbt:282:7-282:10:
    |   a : Val[A],
    |   b : Val[B],
    |   c : Val[C],
282 |   d : Val[D],
    |       ^^^
    |   e : Val[E],
    |   f : Val[F],

<WORKDIR>/rabbita/incremental.mbt:283:7-283:10:
    |   b : Val[B],
    |   c : Val[C],
    |   d : Val[D],
283 |   e : Val[E],
    |       ^^^
    |   f : Val[F],
    |   g : Val[G],

<WORKDIR>/rabbita/incremental.mbt:284:7-284:10:
    |   c : Val[C],
    |   d : Val[D],
    |   e : Val[E],
284 |   f : Val[F],
    |       ^^^
    |   g : Val[G],
    |   h : Val[H],

<WORKDIR>/rabbita/incremental.mbt:285:7-285:10:
    |   d : Val[D],
    |   e : Val[E],
    |   f : Val[F],
285 |   g : Val[G],
    |       ^^^
    |   h : Val[H],
    |   render : (A, B, C, D, E, F, G, H) -> Html,

<WORKDIR>/rabbita/incremental.mbt:286:7-286:10:
    |   e : Val[E],
    |   f : Val[F],
    |   g : Val[G],
286 |   h : Val[H],
    |       ^^^
    |   render : (A, B, C, D, E, F, G, H) -> Html,
    | ) -> Val[Html] {

<WORKDIR>/rabbita/incremental.mbt:288:6-288:9:
    |   g : Val[G],
    |   h : Val[H],
    |   render : (A, B, C, D, E, F, G, H) -> Html,
288 | ) -> Val[Html] {
    |      ^^^
    |   a.0.map8(b.0, c.0, d.0, e.0, f.0, g.0, h.0, render)
    | }

<WORKDIR>/rabbita/incremental.mbt:296:80-296:83:
    | /// Creates an HTML view derived from nine incremental values.
    | ///
    | /// The render function is reevaluated when any input changes.
296 | pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E : Eq, F : Eq, G : Eq, H : Eq, I : Eq] Val::view9(
    |                                                                                ^^^
    |   a : Val[A],
    |   b : Val[B],

<WORKDIR>/rabbita/incremental.mbt:297:7-297:10:
    | ///
    | /// The render function is reevaluated when any input changes.
    | pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E : Eq, F : Eq, G : Eq, H : Eq, I : Eq] Val::view9(
297 |   a : Val[A],
    |       ^^^
    |   b : Val[B],
    |   c : Val[C],

<WORKDIR>/rabbita/incremental.mbt:298:7-298:10:
    | /// The render function is reevaluated when any input changes.
    | pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E : Eq, F : Eq, G : Eq, H : Eq, I : Eq] Val::view9(
    |   a : Val[A],
298 |   b : Val[B],
    |       ^^^
    |   c : Val[C],
    |   d : Val[D],

<WORKDIR>/rabbita/incremental.mbt:299:7-299:10:
    | pub fn[A : Eq, B : Eq, C : Eq, D : Eq, E : Eq, F : Eq, G : Eq, H : Eq, I : Eq] Val::view9(
    |   a : Val[A],
    |   b : Val[B],
299 |   c : Val[C],
    |       ^^^
    |   d : Val[D],
    |   e : Val[E],

<WORKDIR>/rabbita/incremental.mbt:300:7-300:10:
    |   a : Val[A],
    |   b : Val[B],
    |   c : Val[C],
300 |   d : Val[D],
    |       ^^^
    |   e : Val[E],
    |   f : Val[F],

<WORKDIR>/rabbita/incremental.mbt:301:7-301:10:
    |   b : Val[B],
    |   c : Val[C],
    |   d : Val[D],
301 |   e : Val[E],
    |       ^^^
    |   f : Val[F],
    |   g : Val[G],

<WORKDIR>/rabbita/incremental.mbt:302:7-302:10:
    |   c : Val[C],
    |   d : Val[D],
    |   e : Val[E],
302 |   f : Val[F],
    |       ^^^
    |   g : Val[G],
    |   h : Val[H],

<WORKDIR>/rabbita/incremental.mbt:303:7-303:10:
    |   d : Val[D],
    |   e : Val[E],
    |   f : Val[F],
303 |   g : Val[G],
    |       ^^^
    |   h : Val[H],
    |   i : Val[I],

<WORKDIR>/rabbita/incremental.mbt:304:7-304:10:
    |   e : Val[E],
    |   f : Val[F],
    |   g : Val[G],
304 |   h : Val[H],
    |       ^^^
    |   i : Val[I],
    |   render : (A, B, C, D, E, F, G, H, I) -> Html,

<WORKDIR>/rabbita/incremental.mbt:305:7-305:10:
    |   f : Val[F],
    |   g : Val[G],
    |   h : Val[H],
305 |   i : Val[I],
    |       ^^^
    |   render : (A, B, C, D, E, F, G, H, I) -> Html,
    | ) -> Val[Html] {

<WORKDIR>/rabbita/incremental.mbt:307:6-307:9:
    |   h : Val[H],
    |   i : Val[I],
    |   render : (A, B, C, D, E, F, G, H, I) -> Html,
307 | ) -> Val[Html] {
    |      ^^^
    |   a.0.map9(b.0, c.0, d.0, e.0, f.0, g.0, h.0, i.0, render)
    | }

<WORKDIR>/rabbita/incremental.mbt:417:39-417:42:
    | ///   rows.view(rows => @html.ul(rows))
    | /// }
    | /// ```
417 | pub fn[K : Hash + Eq, V : Eq, C : Eq] Val::assoc(
    |                                       ^^^
    |   a : Val[Vector[(K, V)]],
    |   f : (K, Val[V]) -> Val[C],

<WORKDIR>/rabbita/incremental.mbt:418:7-418:10:
    | /// }
    | /// ```
    | pub fn[K : Hash + Eq, V : Eq, C : Eq] Val::assoc(
418 |   a : Val[Vector[(K, V)]],
    |       ^^^
    |   f : (K, Val[V]) -> Val[C],
    | ) -> Val[Vector[C]] {

<WORKDIR>/rabbita/incremental.mbt:419:11-419:14:
    | /// ```
    | pub fn[K : Hash + Eq, V : Eq, C : Eq] Val::assoc(
    |   a : Val[Vector[(K, V)]],
419 |   f : (K, Val[V]) -> Val[C],
    |           ^^^
    | ) -> Val[Vector[C]] {
    |   a.0.assoc((k, v) => f(k, v).0)

<WORKDIR>/rabbita/incremental.mbt:419:22-419:25:
    | /// ```
    | pub fn[K : Hash + Eq, V : Eq, C : Eq] Val::assoc(
    |   a : Val[Vector[(K, V)]],
419 |   f : (K, Val[V]) -> Val[C],
    |                      ^^^
    | ) -> Val[Vector[C]] {
    |   a.0.assoc((k, v) => f(k, v).0)

<WORKDIR>/rabbita/incremental.mbt:420:6-420:9:
    | pub fn[K : Hash + Eq, V : Eq, C : Eq] Val::assoc(
    |   a : Val[Vector[(K, V)]],
    |   f : (K, Val[V]) -> Val[C],
420 | ) -> Val[Vector[C]] {
    |      ^^^
    |   a.0.assoc((k, v) => f(k, v).0)
    | }

<WORKDIR>/rabbita/incremental.mbt:428:39-428:42:
    | /// Incrementally maps values using keys derived by `by`.
    | ///
    | /// Derived keys must be unique and stable. Output follows source vector order.
428 | pub fn[K : Hash + Eq, V : Eq, C : Eq] Val::assoc_by(
    |                                       ^^^
    |   a : Val[Vector[V]],
    |   f : (K, Val[V]) -> Val[C],

<WORKDIR>/rabbita/incremental.mbt:429:7-429:10:
    | ///
    | /// Derived keys must be unique and stable. Output follows source vector order.
    | pub fn[K : Hash + Eq, V : Eq, C : Eq] Val::assoc_by(
429 |   a : Val[Vector[V]],
    |       ^^^
    |   f : (K, Val[V]) -> Val[C],
    |   by~ : (V) -> K,

<WORKDIR>/rabbita/incremental.mbt:430:11-430:14:
    | /// Derived keys must be unique and stable. Output follows source vector order.
    | pub fn[K : Hash + Eq, V : Eq, C : Eq] Val::assoc_by(
    |   a : Val[Vector[V]],
430 |   f : (K, Val[V]) -> Val[C],
    |           ^^^
    |   by~ : (V) -> K,
    | ) -> Val[Vector[C]] {

<WORKDIR>/rabbita/incremental.mbt:430:22-430:25:
    | /// Derived keys must be unique and stable. Output follows source vector order.
    | pub fn[K : Hash + Eq, V : Eq, C : Eq] Val::assoc_by(
    |   a : Val[Vector[V]],
430 |   f : (K, Val[V]) -> Val[C],
    |                      ^^^
    |   by~ : (V) -> K,
    | ) -> Val[Vector[C]] {

<WORKDIR>/rabbita/incremental.mbt:432:6-432:9:
    |   a : Val[Vector[V]],
    |   f : (K, Val[V]) -> Val[C],
    |   by~ : (V) -> K,
432 | ) -> Val[Vector[C]] {
    |      ^^^
    |   a.0.assoc_by((k, v) => f(k, v).0, by~)
    | }

<WORKDIR>/rabbita/incremental.mbt:475:36-475:39:
    | ///   })
    | /// }
    | /// ```
475 | pub fn[E : Enumerate + Eq, C : Eq] Val::enumerate(
    |                                    ^^^
    |   a : Val[E],
    |   f : (E) -> Val[C],

<WORKDIR>/rabbita/incremental.mbt:476:7-476:10:
    | /// }
    | /// ```
    | pub fn[E : Enumerate + Eq, C : Eq] Val::enumerate(
476 |   a : Val[E],
    |       ^^^
    |   f : (E) -> Val[C],
    | ) -> Val[C] {

<WORKDIR>/rabbita/incremental.mbt:477:14-477:17:
    | /// ```
    | pub fn[E : Enumerate + Eq, C : Eq] Val::enumerate(
    |   a : Val[E],
477 |   f : (E) -> Val[C],
    |              ^^^
    | ) -> Val[C] {
    |   a.0.enumerate(e => f(e).0)

<WORKDIR>/rabbita/incremental.mbt:478:6-478:9:
    | pub fn[E : Enumerate + Eq, C : Eq] Val::enumerate(
    |   a : Val[E],
    |   f : (E) -> Val[C],
478 | ) -> Val[C] {
    |      ^^^
    |   a.0.enumerate(e => f(e).0)
    | }

<WORKDIR>/rabbita/incremental.mbt:486:24-486:27:
    | /// Selects and caches branches using the tag returned by `by`.
    | ///
    | /// Values with the same tag reuse the branch created for its first value.
486 | pub fn[E : Eq, C : Eq] Val::enumerate_by(
    |                        ^^^
    |   a : Val[E],
    |   f : (E) -> Val[C],

<WORKDIR>/rabbita/incremental.mbt:487:7-487:10:
    | ///
    | /// Values with the same tag reuse the branch created for its first value.
    | pub fn[E : Eq, C : Eq] Val::enumerate_by(
487 |   a : Val[E],
    |       ^^^
    |   f : (E) -> Val[C],
    |   by~ : (E) -> String,

<WORKDIR>/rabbita/incremental.mbt:488:14-488:17:
    | /// Values with the same tag reuse the branch created for its first value.
    | pub fn[E : Eq, C : Eq] Val::enumerate_by(
    |   a : Val[E],
488 |   f : (E) -> Val[C],
    |              ^^^
    |   by~ : (E) -> String,
    | ) -> Val[C] {

<WORKDIR>/rabbita/incremental.mbt:490:6-490:9:
    |   a : Val[E],
    |   f : (E) -> Val[C],
    |   by~ : (E) -> String,
490 | ) -> Val[C] {
    |      ^^^
    |   a.0.enumerate_by(e => f(e).0, by~)
    | }

<WORKDIR>/rabbita/incremental.mbt:533:36-533:39:
    | ///   })
    | /// }
    | /// ```
533 | pub fn[E : Enumerate + Eq, C : Eq] Val::switch(
    |                                    ^^^
    |   a : Val[E],
    |   f : (E) -> Val[C],

<WORKDIR>/rabbita/incremental.mbt:534:7-534:10:
    | /// }
    | /// ```
    | pub fn[E : Enumerate + Eq, C : Eq] Val::switch(
534 |   a : Val[E],
    |       ^^^
    |   f : (E) -> Val[C],
    | ) -> Val[C] {

<WORKDIR>/rabbita/incremental.mbt:535:14-535:17:
    | /// ```
    | pub fn[E : Enumerate + Eq, C : Eq] Val::switch(
    |   a : Val[E],
535 |   f : (E) -> Val[C],
    |              ^^^
    | ) -> Val[C] {
    |   a.0.switch(e => f(e).0)

<WORKDIR>/rabbita/incremental.mbt:536:6-536:9:
    | pub fn[E : Enumerate + Eq, C : Eq] Val::switch(
    |   a : Val[E],
    |   f : (E) -> Val[C],
536 | ) -> Val[C] {
    |      ^^^
    |   a.0.switch(e => f(e).0)
    | }

<WORKDIR>/rabbita/incremental.mbt:545:24-545:27:
    | ///
    | /// Values with the same tag keep the current branch; changing it disposes the
    | /// branch before creating the next one.
545 | pub fn[E : Eq, C : Eq] Val::switch_by(
    |                        ^^^
    |   a : Val[E],
    |   f : (E) -> Val[C],

<WORKDIR>/rabbita/incremental.mbt:546:7-546:10:
    | /// Values with the same tag keep the current branch; changing it disposes the
    | /// branch before creating the next one.
    | pub fn[E : Eq, C : Eq] Val::switch_by(
546 |   a : Val[E],
    |       ^^^
    |   f : (E) -> Val[C],
    |   by~ : (E) -> String,

<WORKDIR>/rabbita/incremental.mbt:547:14-547:17:
    | /// branch before creating the next one.
    | pub fn[E : Eq, C : Eq] Val::switch_by(
    |   a : Val[E],
547 |   f : (E) -> Val[C],
    |              ^^^
    |   by~ : (E) -> String,
    | ) -> Val[C] {

<WORKDIR>/rabbita/incremental.mbt:549:6-549:9:
    |   a : Val[E],
    |   f : (E) -> Val[C],
    |   by~ : (E) -> String,
549 | ) -> Val[C] {
    |      ^^^
    |   a.0.switch_by(e => f(e).0, by~)
    | }

<WORKDIR>/rabbita/top.mbt:147:41-147:44:
    | /// }
    | /// ```
    | #internal(unstable, "Experimental API")
147 | pub fn render_to_string(builder : () -> Val[Html]) -> String {
    |                                         ^^^
    |   @runtime.server_side_render(() => builder().0.read().0)
    | }

```
