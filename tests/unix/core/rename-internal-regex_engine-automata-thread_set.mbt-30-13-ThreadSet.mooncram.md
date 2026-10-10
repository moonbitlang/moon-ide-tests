# core rename ThreadSet internal/regex_engine/automata/thread_set.mbt:30:13

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
$ run_moon_ide moon ide rename 'ThreadSet' 'ThreadSetRenamed' --loc 'internal/regex_engine/automata/thread_set.mbt:30:13'
*** Begin Patch
*** Update File: <WORKDIR>/internal/regex_engine/automata/delta.mbt
@@
 
 ///|
 fn delta_threads(
-  curr : ThreadSet,
+  curr : ThreadSetRenamed,
   c : DeltaContext,
   rem : Array[Thread],
 ) -> Unit {
@@
 /// Uses the SlotBook to track which slots are already in use by threads
 /// in the descriptor, then finds an unused slot. If no unassigned marks
 /// exist in any thread, returns an unassigned slot (no tracking needed).
-fn find_slot(ctx~ : Context, desc : ThreadSet) -> Slot {
+fn find_slot(ctx~ : Context, desc : ThreadSetRenamed) -> Slot {
   if ctx.book_dirty {
     ctx.book.clear()
   }
@@
   delta_threads(state.desc, { prev_cat, next_cat, c, }, rem)
   ctx.seen.clear()
   remove_duplicates(rem, e_eps, ctx.seen)
-  let desc = ThreadSet(rem)
+  let desc = ThreadSetRenamed(rem)
   let slot = find_slot(ctx~, desc)
   if slot.is_assigned() {
     desc.assign_slot_in_place(slot)
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
   { slot, cat, desc, hash: Hash::hash((slot, cat, desc)), }
 }
@@
   State::new(
     Slot::unassigned(),
     cat,
-    ThreadSet([Exp(MarkSlotMap::empty(), expr)]),
+    ThreadSetRenamed([Exp(MarkSlotMap::empty(), expr)]),
   )
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
 /// nested `Seq` threads and `remove_duplicates` rebuilds every level), so
 /// `assign_slot_in_place` may mutate them. Once a set is stored in a
 /// `State` it is never mutated again.
-priv struct ThreadSet(Array[Thread])
+priv struct ThreadSetRenamed(Array[Thread])
 
 ///|
-impl Eq for ThreadSet with fn equal(self, other) {
+impl Eq for ThreadSetRenamed with fn equal(self, other) {
   self.0 == other.0
 }
 
 ///|
-impl Hash for ThreadSet with fn hash_combine(self, hasher) {
+impl Hash for ThreadSetRenamed with fn hash_combine(self, hasher) {
   for thread in self.0 {
     hasher.combine(thread)
   }
@@
 }
 
 ///|
-let ts_empty : ThreadSet = ThreadSet([])
+let ts_empty : ThreadSetRenamed = ThreadSetRenamed([])
 
 ///|
-fn ThreadSet::first(self : ThreadSet) -> Thread? {
+fn ThreadSetRenamed::first(self : ThreadSetRenamed) -> Thread? {
   self.0.get(0)
 }
 
@@
   match first {
     [] => () (escaped)
     [Exp(marks, { def: Eps, .. })] => rem.push(Exp(marks, next))
-    _ => rem.push(Seq(pref, ThreadSet(first), next))
+    _ => rem.push(Seq(pref, ThreadSetRenamed(first), next))
   }
 }
 
@@
 ///|
 /// Give every unassigned mark in the set the state's slot. Mutates the
 /// arrays in place; see the ownership note on `ThreadSet`.
-fn ThreadSet::assign_slot_in_place(self : ThreadSet, slot : Slot) -> Unit {
+fn ThreadSetRenamed::assign_slot_in_place(self : ThreadSetRenamed, slot : Slot) -> Unit {
   guard slot.is_assigned() else { panic() }
   for i, thread in self.0 {
     match thread {
@@
 
 ///|
 /// Visit the marks of every thread, including those nested in `Seq` threads.
-fn ThreadSet::each_marks(self : ThreadSet, f : (MarkSlotMap) -> Unit) -> Unit {
+fn ThreadSetRenamed::each_marks(self : ThreadSetRenamed, f : (MarkSlotMap) -> Unit) -> Unit {
   for thread in self.0 {
     match thread {
       End(marks) | Exp(marks, _) => f(marks)
*** End Patch

```
