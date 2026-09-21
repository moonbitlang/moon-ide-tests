# core find-references ThreadSet internal/regex_engine/automata/thread_set.mbt:46:11

```mooncram
$ export MOON_HOME="${MOON_HOME:-$HOME/.moon}"
```

```mooncram
$ export TEST_REPO_ROOT="$(cd "$TESTDIR/../../../fixtures/repos/core" && pwd)"
```

```mooncram
$ normalize_moon_ide_output() { sed -e "s|$TEST_REPO_ROOT|<WORKDIR>|g" -e "s|$MOON_HOME|<MOON_HOME>|g"; }
```

```mooncram
$ run_moon_ide() { status_file="${TMPDIR:-/tmp}/moon-ide-status.$$"; ( cd "$TEST_REPO_ROOT" && "$@"; echo "$?" > "$status_file" ) 2>&1 | normalize_moon_ide_output; status=$(cat "$status_file"); rm -f "$status_file"; return "$status"; }
```

```mooncram
$ run_moon_ide moon ide find-references 'ThreadSet' --loc 'internal/regex_engine/automata/thread_set.mbt:46:11'
Found 82 references for symbol 'ThreadSet':
<WORKDIR>/internal/regex_engine/automata/delta.mbt:64:6-64:15:
   |   inner : Expr,
   |   c : DeltaContext,
   |   marks : MarkSlotMap,
64 | ) -> ThreadSet {
   |      ^^^^^^^^^
   |   let inner_delta = delta_expr(inner, c, marks)
   |   let first_match_marks = inner_delta.find_first_match()

<WORKDIR>/internal/regex_engine/automata/delta.mbt:81:70-81:79:
   | }
   | 
   | ///|
81 | fn delta_expr(expr : Expr, c : DeltaContext, marks : MarkSlotMap) -> ThreadSet {
   |                                                                      ^^^^^^^^^
   |   match expr.def {
   |     Chr(cs) => if cs.contains(c.c) { ts_exp(marks, e_eps) } else { ts_empty }

<WORKDIR>/internal/regex_engine/automata/delta.mbt:111:11-111:20:
    | ///|
    | fn delta_seq(
    |   pref : @shared_types.Preference,
111 |   first : ThreadSet,
    |           ^^^^^^^^^
    |   next : Expr,
    |   c : DeltaContext,

<WORKDIR>/internal/regex_engine/automata/delta.mbt:114:6-114:15:
    |   first : ThreadSet,
    |   next : Expr,
    |   c : DeltaContext,
114 | ) -> ThreadSet {
    |      ^^^^^^^^^
    |   match first.find_first_match() {
    |     None => ts_seq(pref, first, next)

<WORKDIR>/internal/regex_engine/automata/delta.mbt:140:6-140:15:
    |   thread : Thread,
    |   c : DeltaContext,
    |   marks : MarkSlotMap,
140 | ) -> ThreadSet {
    |      ^^^^^^^^^
    |   match thread {
    |     End(_) => ts_one(thread)

<WORKDIR>/internal/regex_engine/automata/delta.mbt:153:10-153:19:
    | 
    | ///|
    | fn delta_threads(
153 |   curr : ThreadSet,
    |          ^^^^^^^^^
    |   c : DeltaContext,
    |   marks : MarkSlotMap,

<WORKDIR>/internal/regex_engine/automata/delta.mbt:156:6-156:15:
    |   curr : ThreadSet,
    |   c : DeltaContext,
    |   marks : MarkSlotMap,
156 | ) -> ThreadSet {
    |      ^^^^^^^^^
    |   curr.flat_map(thread => delta_thread(thread, c, marks))
    | }

<WORKDIR>/internal/regex_engine/automata/delta.mbt:166:37-166:46:
    | /// Uses the SlotBook to track which slots are already in use by threads
    | /// in the descriptor, then finds an unused slot. If no unassigned marks
    | /// exist in any thread, returns an unassigned slot (no tracking needed).
166 | fn find_slot(ctx~ : Context, desc : ThreadSet) -> Slot {
    |                                     ^^^^^^^^^
    |   if ctx.book_dirty {
    |     ctx.book.clear()

<WORKDIR>/internal/regex_engine/automata/state.mbt:46:15-46:24:
   | pub struct State {
   |   priv slot : Slot
   |   priv cat : @shared_types.Category
46 |   priv desc : ThreadSet
   |               ^^^^^^^^^
   |   priv hash : Int
   | }

<WORKDIR>/internal/regex_engine/automata/state.mbt:88:10-88:19:
   | fn State::new(
   |   slot : Slot,
   |   cat : @shared_types.Category,
88 |   desc : ThreadSet,
   |          ^^^^^^^^^
   | ) -> State {
   |   { slot, cat, desc, hash: Hash::hash((slot, cat, desc)), }

<WORKDIR>/internal/regex_engine/automata/thread.mbt:43:33-43:42:
   | priv enum Thread {
   |   End(MarkSlotMap)
   |   Exp(MarkSlotMap, Expr)
43 |   Seq(@shared_types.Preference, ThreadSet, Expr)
   |                                 ^^^^^^^^^
   | } derive(Eq, Hash)

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:50:10-50:19:
   |   Empty
   |   Node(
   |     i~ : ThreadSetNodeInfo,
50 |     l~ : ThreadSet,
   |          ^^^^^^^^^
   |     t~ : Thread,
   |     r~ : ThreadSet,

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:52:10-52:19:
   |     i~ : ThreadSetNodeInfo,
   |     l~ : ThreadSet,
   |     t~ : Thread,
52 |     r~ : ThreadSet,
   |          ^^^^^^^^^
   |     p~ : Int
   |   )

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:65:4-65:13:
   | }
   | 
   | ///|
65 | fn ThreadSet::is_empty(self : ThreadSet) -> Bool {
   |    ^^^^^^^^^
   |   self is Empty
   | }

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:65:31-65:40:
   | }
   | 
   | ///|
65 | fn ThreadSet::is_empty(self : ThreadSet) -> Bool {
   |                               ^^^^^^^^^
   |   self is Empty
   | }

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:70:4-70:13:
   | }
   | 
   | ///|
70 | fn ThreadSet::is_singleton(self : ThreadSet) -> Bool {
   |    ^^^^^^^^^
   |   self is Node(l=Empty, r=Empty, ..)
   | }

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:70:35-70:44:
   | }
   | 
   | ///|
70 | fn ThreadSet::is_singleton(self : ThreadSet) -> Bool {
   |                                   ^^^^^^^^^
   |   self is Node(l=Empty, r=Empty, ..)
   | }

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:75:4-75:13:
   | }
   | 
   | ///|
75 | fn ThreadSet::first(self : ThreadSet) -> Thread? {
   |    ^^^^^^^^^
   |   match self {
   |     Empty => None

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:75:28-75:37:
   | }
   | 
   | ///|
75 | fn ThreadSet::first(self : ThreadSet) -> Thread? {
   |                            ^^^^^^^^^
   |   match self {
   |     Empty => None

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:84:4-84:13:
   | }
   | 
   | ///|
84 | fn ThreadSet::choose(self : ThreadSet) -> Thread {
   |    ^^^^^^^^^
   |   match self {
   |     Node(l=Empty, t~, r=Empty, ..) => t

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:84:29-84:38:
   | }
   | 
   | ///|
84 | fn ThreadSet::choose(self : ThreadSet) -> Thread {
   |                             ^^^^^^^^^
   |   match self {
   |     Node(l=Empty, t~, r=Empty, ..) => t

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:92:4-92:13:
   | }
   | 
   | ///|
92 | fn ThreadSet::no_match(self : ThreadSet) -> Bool {
   |    ^^^^^^^^^
   |   match self {
   |     Empty => true

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:92:31-92:40:
   | }
   | 
   | ///|
92 | fn ThreadSet::no_match(self : ThreadSet) -> Bool {
   |                               ^^^^^^^^^
   |   match self {
   |     Empty => true

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:100:4-100:13:
    | }
    | 
    | ///|
100 | fn ThreadSet::make_node(
    |    ^^^^^^^^^
    |   l : ThreadSet,
    |   t : Thread,

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:101:7-101:16:
    | 
    | ///|
    | fn ThreadSet::make_node(
101 |   l : ThreadSet,
    |       ^^^^^^^^^
    |   t : Thread,
    |   r : ThreadSet,

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:103:7-103:16:
    | fn ThreadSet::make_node(
    |   l : ThreadSet,
    |   t : Thread,
103 |   r : ThreadSet,
    |       ^^^^^^^^^
    |   p~ : Int,
    | ) -> ThreadSet {

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:105:6-105:15:
    |   t : Thread,
    |   r : ThreadSet,
    |   p~ : Int,
105 | ) -> ThreadSet {
    |      ^^^^^^^^^
    |   let i = ThreadSetNodeInfo::{
    |     no_match: !(t is End(_)) && l.no_match() && r.no_match(),

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:122:4-122:13:
    | }
    | 
    | ///|
122 | fn ThreadSet::singleton(t : Thread) -> ThreadSet {
    |    ^^^^^^^^^
    |   ThreadSet::make_node(Empty, t, Empty, p=rand_int())
    | }

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:122:40-122:49:
    | }
    | 
    | ///|
122 | fn ThreadSet::singleton(t : Thread) -> ThreadSet {
    |                                        ^^^^^^^^^
    |   ThreadSet::make_node(Empty, t, Empty, p=rand_int())
    | }

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:123:3-123:12:
    | 
    | ///|
    | fn ThreadSet::singleton(t : Thread) -> ThreadSet {
123 |   ThreadSet::make_node(Empty, t, Empty, p=rand_int())
    |   ^^^^^^^^^
    | }
    | 

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:127:4-127:13:
    | }
    | 
    | ///|
127 | fn ThreadSet::merge(l : ThreadSet, r : ThreadSet) -> ThreadSet {
    |    ^^^^^^^^^
    |   match (l, r) {
    |     (Empty, r) => r

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:127:25-127:34:
    | }
    | 
    | ///|
127 | fn ThreadSet::merge(l : ThreadSet, r : ThreadSet) -> ThreadSet {
    |                         ^^^^^^^^^
    |   match (l, r) {
    |     (Empty, r) => r

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:127:40-127:49:
    | }
    | 
    | ///|
127 | fn ThreadSet::merge(l : ThreadSet, r : ThreadSet) -> ThreadSet {
    |                                        ^^^^^^^^^
    |   match (l, r) {
    |     (Empty, r) => r

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:127:54-127:63:
    | }
    | 
    | ///|
127 | fn ThreadSet::merge(l : ThreadSet, r : ThreadSet) -> ThreadSet {
    |                                                      ^^^^^^^^^
    |   match (l, r) {
    |     (Empty, r) => r

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:133:9-133:18:
    |     (l, Empty) => l
    |     (Node(..) as l, Node(..) as r) =>
    |       if l.p > r.p {
133 |         ThreadSet::make_node(l.l, l.t, ThreadSet::merge(l.r, r), p=l.p)
    |         ^^^^^^^^^
    |       } else {
    |         ThreadSet::make_node(ThreadSet::merge(l, r.l), r.t, r.r, p=r.p)

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:133:40-133:49:
    |     (l, Empty) => l
    |     (Node(..) as l, Node(..) as r) =>
    |       if l.p > r.p {
133 |         ThreadSet::make_node(l.l, l.t, ThreadSet::merge(l.r, r), p=l.p)
    |                                        ^^^^^^^^^
    |       } else {
    |         ThreadSet::make_node(ThreadSet::merge(l, r.l), r.t, r.r, p=r.p)

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:135:9-135:18:
    |       if l.p > r.p {
    |         ThreadSet::make_node(l.l, l.t, ThreadSet::merge(l.r, r), p=l.p)
    |       } else {
135 |         ThreadSet::make_node(ThreadSet::merge(l, r.l), r.t, r.r, p=r.p)
    |         ^^^^^^^^^
    |       }
    |   }

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:135:30-135:39:
    |       if l.p > r.p {
    |         ThreadSet::make_node(l.l, l.t, ThreadSet::merge(l.r, r), p=l.p)
    |       } else {
135 |         ThreadSet::make_node(ThreadSet::merge(l, r.l), r.t, r.r, p=r.p)
    |                              ^^^^^^^^^
    |       }
    |   }

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:141:14-141:23:
    | }
    | 
    | ///|
141 | impl Add for ThreadSet with fn add(self, other) {
    |              ^^^^^^^^^
    |   ThreadSet::merge(self, other)
    | }

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:142:3-142:12:
    | 
    | ///|
    | impl Add for ThreadSet with fn add(self, other) {
142 |   ThreadSet::merge(self, other)
    |   ^^^^^^^^^
    | }
    | 

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:146:4-146:13:
    | }
    | 
    | ///|
146 | fn ThreadSet::flat_map(
    |    ^^^^^^^^^
    |   self : ThreadSet,
    |   f : (Thread) -> ThreadSet,

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:147:10-147:19:
    | 
    | ///|
    | fn ThreadSet::flat_map(
147 |   self : ThreadSet,
    |          ^^^^^^^^^
    |   f : (Thread) -> ThreadSet,
    | ) -> ThreadSet {

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:148:19-148:28:
    | ///|
    | fn ThreadSet::flat_map(
    |   self : ThreadSet,
148 |   f : (Thread) -> ThreadSet,
    |                   ^^^^^^^^^
    | ) -> ThreadSet {
    |   match self {

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:149:6-149:15:
    | fn ThreadSet::flat_map(
    |   self : ThreadSet,
    |   f : (Thread) -> ThreadSet,
149 | ) -> ThreadSet {
    |      ^^^^^^^^^
    |   match self {
    |     Empty => Empty

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:162:4-162:13:
    | }
    | 
    | ///|
162 | fn ThreadSet::find_first_match(self : ThreadSet) -> MarkSlotMap? {
    |    ^^^^^^^^^
    |   match self {
    |     Empty | Node(i={ no_match: true, }, ..) => None

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:162:39-162:48:
    | }
    | 
    | ///|
162 | fn ThreadSet::find_first_match(self : ThreadSet) -> MarkSlotMap? {
    |                                       ^^^^^^^^^
    |   match self {
    |     Empty | Node(i={ no_match: true, }, ..) => None

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:179:4-179:13:
    | }
    | 
    | ///|
179 | fn ThreadSet::remove_matches(self : ThreadSet) -> ThreadSet {
    |    ^^^^^^^^^
    |   match self {
    |     Empty => Empty

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:179:37-179:46:
    | }
    | 
    | ///|
179 | fn ThreadSet::remove_matches(self : ThreadSet) -> ThreadSet {
    |                                     ^^^^^^^^^
    |   match self {
    |     Empty => Empty

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:179:51-179:60:
    | }
    | 
    | ///|
179 | fn ThreadSet::remove_matches(self : ThreadSet) -> ThreadSet {
    |                                                   ^^^^^^^^^
    |   match self {
    |     Empty => Empty

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:187:11-187:20:
    |       match t {
    |         End(_) => l.remove_matches() + r.remove_matches()
    |         Exp(_) | Seq(_) =>
187 |           ThreadSet::make_node(l.remove_matches(), t, r.remove_matches(), p~)
    |           ^^^^^^^^^
    |       }
    |   }

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:193:4-193:13:
    | }
    | 
    | ///|
193 | fn ThreadSet::split_at_first_match(self : ThreadSet) -> (ThreadSet, ThreadSet) {
    |    ^^^^^^^^^
    |   match self {
    |     Empty => (Empty, Empty)

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:193:43-193:52:
    | }
    | 
    | ///|
193 | fn ThreadSet::split_at_first_match(self : ThreadSet) -> (ThreadSet, ThreadSet) {
    |                                           ^^^^^^^^^
    |   match self {
    |     Empty => (Empty, Empty)

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:193:58-193:67:
    | }
    | 
    | ///|
193 | fn ThreadSet::split_at_first_match(self : ThreadSet) -> (ThreadSet, ThreadSet) {
    |                                                          ^^^^^^^^^
    |   match self {
    |     Empty => (Empty, Empty)

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:193:69-193:78:
    | }
    | 
    | ///|
193 | fn ThreadSet::split_at_first_match(self : ThreadSet) -> (ThreadSet, ThreadSet) {
    |                                                                     ^^^^^^^^^
    |   match self {
    |     Empty => (Empty, Empty)

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:209:8-209:17:
    |       ..
    |     ) => {
    |       let (r1, r2) = r.split_at_first_match()
209 |       (ThreadSet::make_node(l, t, r1, p~), r2)
    |        ^^^^^^^^^
    |     }
    |     Node(l=Node(i={ no_match: false, }, ..) as l, t~, r~, p~, ..) => {

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:213:12-213:21:
    |     }
    |     Node(l=Node(i={ no_match: false, }, ..) as l, t~, r~, p~, ..) => {
    |       let (l1, l2) = l.split_at_first_match()
213 |       (l1, ThreadSet::make_node(l2, t, r, p~))
    |            ^^^^^^^^^
    |     }
    |   }

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:242:4-242:13:
    | /// consumes a variable number of characters; limiting deduplication to each
    | /// wrapper separately retains one thread per partition of the input and
    | /// makes the set grow exponentially.
242 | fn ThreadSet::remove_duplicates(self : ThreadSet, next : Expr) -> ThreadSet {
    |    ^^^^^^^^^
    |   let seen = @hashset.HashSet([])
    |   self.remove_duplicates_with_seen(next, seen)

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:242:40-242:49:
    | /// consumes a variable number of characters; limiting deduplication to each
    | /// wrapper separately retains one thread per partition of the input and
    | /// makes the set grow exponentially.
242 | fn ThreadSet::remove_duplicates(self : ThreadSet, next : Expr) -> ThreadSet {
    |                                        ^^^^^^^^^
    |   let seen = @hashset.HashSet([])
    |   self.remove_duplicates_with_seen(next, seen)

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:242:67-242:76:
    | /// consumes a variable number of characters; limiting deduplication to each
    | /// wrapper separately retains one thread per partition of the input and
    | /// makes the set grow exponentially.
242 | fn ThreadSet::remove_duplicates(self : ThreadSet, next : Expr) -> ThreadSet {
    |                                                                   ^^^^^^^^^
    |   let seen = @hashset.HashSet([])
    |   self.remove_duplicates_with_seen(next, seen)

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:248:4-248:13:
    | }
    | 
    | ///|
248 | fn ThreadSet::remove_duplicates_with_seen(
    |    ^^^^^^^^^
    |   self : ThreadSet,
    |   next : Expr,

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:249:10-249:19:
    | 
    | ///|
    | fn ThreadSet::remove_duplicates_with_seen(
249 |   self : ThreadSet,
    |          ^^^^^^^^^
    |   next : Expr,
    |   seen : @hashset.HashSet[ExprId],

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:252:6-252:15:
    |   self : ThreadSet,
    |   next : Expr,
    |   seen : @hashset.HashSet[ExprId],
252 | ) -> ThreadSet {
    |      ^^^^^^^^^
    |   for thread in self; result = ts_empty {
    |     match thread {

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:281:4-281:13:
    | }
    | 
    | ///|
281 | fn ThreadSet::assign_slot(desc : ThreadSet, slot : Slot) -> ThreadSet {
    |    ^^^^^^^^^
    |   guard slot.is_assigned() else { panic() }
    |   desc.map(thread => {

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:281:34-281:43:
    | }
    | 
    | ///|
281 | fn ThreadSet::assign_slot(desc : ThreadSet, slot : Slot) -> ThreadSet {
    |                                  ^^^^^^^^^
    |   guard slot.is_assigned() else { panic() }
    |   desc.map(thread => {

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:281:61-281:70:
    | }
    | 
    | ///|
281 | fn ThreadSet::assign_slot(desc : ThreadSet, slot : Slot) -> ThreadSet {
    |                                                             ^^^^^^^^^
    |   guard slot.is_assigned() else { panic() }
    |   desc.map(thread => {

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:293:4-293:13:
    | }
    | 
    | ///|
293 | fn ThreadSet::iter(self : ThreadSet) -> Iter[Thread] {
    |    ^^^^^^^^^
    |   let mut node = self
    |   let parents = []

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:293:27-293:36:
    | }
    | 
    | ///|
293 | fn ThreadSet::iter(self : ThreadSet) -> Iter[Thread] {
    |                           ^^^^^^^^^
    |   let mut node = self
    |   let parents = []

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:318:4-318:13:
    | }
    | 
    | ///|
318 | fn ThreadSet::iter_marks(self : ThreadSet) -> Iter[MarkSlotMap] {
    |    ^^^^^^^^^
    |   self
    |   .iter()

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:318:33-318:42:
    | }
    | 
    | ///|
318 | fn ThreadSet::iter_marks(self : ThreadSet) -> Iter[MarkSlotMap] {
    |                                 ^^^^^^^^^
    |   self
    |   .iter()

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:330:4-330:13:
    | }
    | 
    | ///|
330 | fn ThreadSet::map(self : ThreadSet, f : (Thread) -> Thread) -> ThreadSet {
    |    ^^^^^^^^^
    |   match self {
    |     Empty => Empty

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:330:26-330:35:
    | }
    | 
    | ///|
330 | fn ThreadSet::map(self : ThreadSet, f : (Thread) -> Thread) -> ThreadSet {
    |                          ^^^^^^^^^
    |   match self {
    |     Empty => Empty

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:330:64-330:73:
    | }
    | 
    | ///|
330 | fn ThreadSet::map(self : ThreadSet, f : (Thread) -> Thread) -> ThreadSet {
    |                                                                ^^^^^^^^^
    |   match self {
    |     Empty => Empty

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:337:7-337:16:
    |       let l2 = l.map(f)
    |       let b2 = f(t)
    |       let r2 = r.map(f)
337 |       ThreadSet::make_node(l2, b2, r2, p~)
    |       ^^^^^^^^^
    |     }
    |   }

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:343:16-343:25:
    | }
    | 
    | ///|
343 | let ts_empty : ThreadSet = Empty
    |                ^^^^^^^^^
    | 
    | ///|

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:346:26-346:35:
    | let ts_empty : ThreadSet = Empty
    | 
    | ///|
346 | fn ts_one(t : Thread) -> ThreadSet {
    |                          ^^^^^^^^^
    |   ThreadSet::singleton(t)
    | }

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:347:3-347:12:
    | 
    | ///|
    | fn ts_one(t : Thread) -> ThreadSet {
347 |   ThreadSet::singleton(t)
    |   ^^^^^^^^^
    | }
    | 

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:351:35-351:44:
    | }
    | 
    | ///|
351 | fn ts_end(marks : MarkSlotMap) -> ThreadSet {
    |                                   ^^^^^^^^^
    |   ts_one(End(marks))
    | }

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:356:48-356:57:
    | }
    | 
    | ///|
356 | fn ts_exp(marks : MarkSlotMap, expr : Expr) -> ThreadSet {
    |                                                ^^^^^^^^^
    |   ts_one(Exp(marks, expr))
    | }

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:363:11-363:20:
    | ///|
    | fn ts_seq(
    |   pref : @shared_types.Preference,
363 |   first : ThreadSet,
    |           ^^^^^^^^^
    |   next : Expr,
    | ) -> ThreadSet {

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:365:6-365:15:
    |   pref : @shared_types.Preference,
    |   first : ThreadSet,
    |   next : Expr,
365 | ) -> ThreadSet {
    |      ^^^^^^^^^
    |   if first.is_empty() {
    |     ts_empty

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:377:13-377:22:
    | }
    | 
    | ///|
377 | impl Eq for ThreadSet with fn equal(self, other) {
    |             ^^^^^^^^^
    |   let it1 = self.iter()
    |   let it2 = other.iter()

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:395:15-395:24:
    | }
    | 
    | ///|
395 | impl Hash for ThreadSet with fn hash_combine(self, hasher) {
    |               ^^^^^^^^^
    |   for thread in self {
    |     hasher.combine(thread)

```
