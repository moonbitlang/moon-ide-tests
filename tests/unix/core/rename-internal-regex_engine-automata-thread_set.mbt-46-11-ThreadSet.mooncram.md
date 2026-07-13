# core rename ThreadSet internal/regex_engine/automata/thread_set.mbt:46:11

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
$ run_moon_ide moon ide rename 'ThreadSet' 'ThreadSetRenamed' --loc 'internal/regex_engine/automata/thread_set.mbt:46:11'
*** Begin Patch
*** Update File: <WORKDIR>/internal/regex_engine/automata/delta.mbt
@@
   inner : Expr,
   c : DeltaContext,
   marks : MarkSlotMap,
-) -> ThreadSet {
+) -> ThreadSetRenamed {
   let inner_delta = delta_expr(inner, c, marks)
   let first_match_marks = inner_delta.find_first_match()
   match mode {
@@
 }
 
 ///|
-fn delta_expr(expr : Expr, c : DeltaContext, marks : MarkSlotMap) -> ThreadSet {
+fn delta_expr(expr : Expr, c : DeltaContext, marks : MarkSlotMap) -> ThreadSetRenamed {
   match expr.def {
     Chr(cs) => if cs.contains(c.c) { ts_exp(marks, e_eps) } else { ts_empty }
     Alt(exprs) =>
@@
 ///|
 fn delta_seq(
   pref : @shared_types.Preference,
-  first : ThreadSet,
+  first : ThreadSetRenamed,
   next : Expr,
   c : DeltaContext,
-) -> ThreadSet {
+) -> ThreadSetRenamed {
   match first.find_first_match() {
     None => ts_seq(pref, first, next)
     Some(marks) =>
@@
   thread : Thread,
   c : DeltaContext,
   marks : MarkSlotMap,
-) -> ThreadSet {
+) -> ThreadSetRenamed {
   match thread {
     End(_) => ts_one(thread)
     Exp(marks, expr) => delta_expr(expr, c, marks)
@@
 
 ///|
 fn delta_threads(
-  curr : ThreadSet,
+  curr : ThreadSetRenamed,
   c : DeltaContext,
   marks : MarkSlotMap,
-) -> ThreadSet {
+) -> ThreadSetRenamed {
   curr.flat_map(thread => delta_thread(thread, c, marks))
 }
 
@@
 /// Uses the SlotBook to track which slots are already in use by threads
 /// in the descriptor, then finds an unused slot. If no unassigned marks
 /// exist in any thread, returns an unassigned slot (no tracking needed).
-fn find_slot(ctx~ : Context, desc : ThreadSet) -> Slot {
+fn find_slot(ctx~ : Context, desc : ThreadSetRenamed) -> Slot {
   if ctx.book_dirty {
     ctx.book.clear()
   }
*** Update File: <WORKDIR>/internal/regex_engine/automata/state.mbt
@@
 pub struct State {
   priv slot : Slot
   priv cat : @shared_types.Category
-  priv desc : ThreadSet
+  priv desc : ThreadSetRenamed
   priv hash : Int
 }
 
@@
 fn State::new(
   slot : Slot,
   cat : @shared_types.Category,
-  desc : ThreadSet,
+  desc : ThreadSetRenamed,
 ) -> State {
   { slot, cat, desc, hash: (slot, cat, desc).hash() }
 }
*** Update File: <WORKDIR>/internal/regex_engine/automata/thread.mbt
@@
 priv enum Thread {
   End(MarkSlotMap)
   Exp(MarkSlotMap, Expr)
-  Seq(@shared_types.Preference, ThreadSet, Expr)
+  Seq(@shared_types.Preference, ThreadSetRenamed, Expr)
 } derive(Eq, Hash)
*** Update File: <WORKDIR>/internal/regex_engine/automata/thread_set.mbt
@@
 /// During execution, each `State` contains a `ThreadSet` collection representing all
 /// possible execution paths from that state. When computing the derivative with
 /// respect to input, threads are transformed and may split into multiple threads.
-priv enum ThreadSet {
+priv enum ThreadSetRenamed {
   Empty
   Node(
     i~ : ThreadSetNodeInfo,
-    l~ : ThreadSet,
+    l~ : ThreadSetRenamed,
     t~ : Thread,
-    r~ : ThreadSet,
+    r~ : ThreadSetRenamed,
     p~ : Int
   )
 }
@@
 }
 
 ///|
-fn ThreadSet::is_empty(self : ThreadSet) -> Bool {
+fn ThreadSetRenamed::is_empty(self : ThreadSetRenamed) -> Bool {
   self is Empty
 }
 
 ///|
-fn ThreadSet::is_singleton(self : ThreadSet) -> Bool {
+fn ThreadSetRenamed::is_singleton(self : ThreadSetRenamed) -> Bool {
   self is Node(l=Empty, r=Empty, ..)
 }
 
 ///|
-fn ThreadSet::first(self : ThreadSet) -> Thread? {
+fn ThreadSetRenamed::first(self : ThreadSetRenamed) -> Thread? {
   match self {
     Empty => None
     Node(l=Empty, t~, ..) => Some(t)
@@
 }
 
 ///|
-fn ThreadSet::choose(self : ThreadSet) -> Thread {
+fn ThreadSetRenamed::choose(self : ThreadSetRenamed) -> Thread {
   match self {
     Node(l=Empty, t~, r=Empty, ..) => t
     _ => panic()
@@
 }
 
 ///|
-fn ThreadSet::no_match(self : ThreadSet) -> Bool {
+fn ThreadSetRenamed::no_match(self : ThreadSetRenamed) -> Bool {
   match self {
     Empty => true
     Node(i~, ..) => i.no_match
@@
 }
 
 ///|
-fn ThreadSet::make_node(
+fn ThreadSetRenamed::make_node(
-  l : ThreadSet,
+  l : ThreadSetRenamed,
   t : Thread,
-  r : ThreadSet,
+  r : ThreadSetRenamed,
   p~ : Int,
-) -> ThreadSet {
+) -> ThreadSetRenamed {
   let i = ThreadSetNodeInfo::{
     no_match: !(t is End(_)) && l.no_match() && r.no_match(),
   }
@@
 }
 
 ///|
-fn ThreadSet::singleton(t : Thread) -> ThreadSet {
+fn ThreadSetRenamed::singleton(t : Thread) -> ThreadSetRenamed {
-  ThreadSet::make_node(Empty, t, Empty, p=rand_int())
+  ThreadSetRenamed::make_node(Empty, t, Empty, p=rand_int())
 }
 
 ///|
-fn ThreadSet::merge(l : ThreadSet, r : ThreadSet) -> ThreadSet {
+fn ThreadSetRenamed::merge(l : ThreadSetRenamed, r : ThreadSetRenamed) -> ThreadSetRenamed {
   match (l, r) {
     (Empty, r) => r
     (l, Empty) => l
     (Node(..) as l, Node(..) as r) =>
       if l.p > r.p {
-        ThreadSet::make_node(l.l, l.t, ThreadSet::merge(l.r, r), p=l.p)
+        ThreadSetRenamed::make_node(l.l, l.t, ThreadSetRenamed::merge(l.r, r), p=l.p)
       } else {
-        ThreadSet::make_node(ThreadSet::merge(l, r.l), r.t, r.r, p=r.p)
+        ThreadSetRenamed::make_node(ThreadSetRenamed::merge(l, r.l), r.t, r.r, p=r.p)
       }
   }
 }
 
 ///|
-impl Add for ThreadSet with fn add(self, other) {
+impl Add for ThreadSetRenamed with fn add(self, other) {
-  ThreadSet::merge(self, other)
+  ThreadSetRenamed::merge(self, other)
 }
 
 ///|
-fn ThreadSet::flat_map(
+fn ThreadSetRenamed::flat_map(
-  self : ThreadSet,
+  self : ThreadSetRenamed,
-  f : (Thread) -> ThreadSet,
+  f : (Thread) -> ThreadSetRenamed,
-) -> ThreadSet {
+) -> ThreadSetRenamed {
   match self {
     Empty => Empty
     Node(l~, t~, r~, ..) => {
@@
 }
 
 ///|
-fn ThreadSet::find_first_match(self : ThreadSet) -> MarkSlotMap? {
+fn ThreadSetRenamed::find_first_match(self : ThreadSetRenamed) -> MarkSlotMap? {
   match self {
     Empty => None
     Node(i={ no_match: true }, ..) => None
@@
 }
 
 ///|
-fn ThreadSet::remove_matches(self : ThreadSet) -> ThreadSet {
+fn ThreadSetRenamed::remove_matches(self : ThreadSetRenamed) -> ThreadSetRenamed {
   match self {
     Empty => Empty
     Node(i={ no_match: true }, ..) => self
@@
       match t {
         End(_) => l.remove_matches() + r.remove_matches()
         Exp(_) | Seq(_) =>
-          ThreadSet::make_node(l.remove_matches(), t, r.remove_matches(), p~)
+          ThreadSetRenamed::make_node(l.remove_matches(), t, r.remove_matches(), p~)
       }
   }
 }
 
 ///|
-fn ThreadSet::split_at_first_match(self : ThreadSet) -> (ThreadSet, ThreadSet) {
+fn ThreadSetRenamed::split_at_first_match(self : ThreadSetRenamed) -> (ThreadSetRenamed, ThreadSetRenamed) {
   match self {
     Empty => (Empty, Empty)
     Node(i={ no_match: true }, ..) => (self, Empty)
@@
       ..
     ) => {
       let (r1, r2) = r.split_at_first_match()
-      (ThreadSet::make_node(l, t, r1, p~), r2)
+      (ThreadSetRenamed::make_node(l, t, r1, p~), r2)
     }
     Node(l=Node(i={ no_match: false }, ..) as l, t~, r~, p~, ..) => {
       let (l1, l2) = l.split_at_first_match()
-      (l1, ThreadSet::make_node(l2, t, r, p~))
+      (l1, ThreadSetRenamed::make_node(l2, t, r, p~))
     }
   }
 }
 
 ///|
-fn ThreadSet::remove_duplicates(self : ThreadSet, next : Expr) -> ThreadSet {
+fn ThreadSetRenamed::remove_duplicates(self : ThreadSetRenamed, next : Expr) -> ThreadSetRenamed {
   let seen = @hashset.HashSet([])
   for thread in self; result = ts_empty {
     match thread {
@@
 }
 
 ///|
-fn ThreadSet::assign_slot(desc : ThreadSet, slot : Slot) -> ThreadSet {
+fn ThreadSetRenamed::assign_slot(desc : ThreadSetRenamed, slot : Slot) -> ThreadSetRenamed {
   guard slot.is_assigned() else { panic() }
   desc.map(thread => {
     match thread {
@@
 }
 
 ///|
-fn ThreadSet::iter(self : ThreadSet) -> Iter[Thread] {
+fn ThreadSetRenamed::iter(self : ThreadSetRenamed) -> Iter[Thread] {
   let mut node = self
   let parents = []
   Iter::new(() => {
@@
 }
 
 ///|
-fn ThreadSet::iter_marks(self : ThreadSet) -> Iter[MarkSlotMap] {
+fn ThreadSetRenamed::iter_marks(self : ThreadSetRenamed) -> Iter[MarkSlotMap] {
   self
   .iter()
   .flat_map(thread => {
@@
 }
 
 ///|
-fn ThreadSet::map(self : ThreadSet, f : (Thread) -> Thread) -> ThreadSet {
+fn ThreadSetRenamed::map(self : ThreadSetRenamed, f : (Thread) -> Thread) -> ThreadSetRenamed {
   match self {
     Empty => Empty
     Node(l~, t~, r~, p~, ..) => {
@@
       let l2 = l.map(f)
       let b2 = f(t)
       let r2 = r.map(f)
-      ThreadSet::make_node(l2, b2, r2, p~)
+      ThreadSetRenamed::make_node(l2, b2, r2, p~)
     }
   }
 }
 
 ///|
-let ts_empty : ThreadSet = Empty
+let ts_empty : ThreadSetRenamed = Empty
 
 ///|
-fn ts_one(t : Thread) -> ThreadSet {
+fn ts_one(t : Thread) -> ThreadSetRenamed {
-  ThreadSet::singleton(t)
+  ThreadSetRenamed::singleton(t)
 }
 
 ///|
-fn ts_end(marks : MarkSlotMap) -> ThreadSet {
+fn ts_end(marks : MarkSlotMap) -> ThreadSetRenamed {
   ts_one(End(marks))
 }
 
 ///|
-fn ts_exp(marks : MarkSlotMap, expr : Expr) -> ThreadSet {
+fn ts_exp(marks : MarkSlotMap, expr : Expr) -> ThreadSetRenamed {
   ts_one(Exp(marks, expr))
 }
 
@@
 ///|
 fn ts_seq(
   pref : @shared_types.Preference,
-  first : ThreadSet,
+  first : ThreadSetRenamed,
   next : Expr,
-) -> ThreadSet {
+) -> ThreadSetRenamed {
   if first.is_empty() {
     ts_empty
   } else if first.is_singleton() &&
@@
 }
 
 ///|
-impl Eq for ThreadSet with fn equal(self, other) {
+impl Eq for ThreadSetRenamed with fn equal(self, other) {
   let it1 = self.iter()
   let it2 = other.iter()
   for v1 = it1.next(), v2 = it2.next() {
@@
 }
 
 ///|
-impl Hash for ThreadSet with fn hash_combine(self, hasher) {
+impl Hash for ThreadSetRenamed with fn hash_combine(self, hasher) {
   for thread in self {
     hasher.combine(thread)
   }
*** End Patch

```
