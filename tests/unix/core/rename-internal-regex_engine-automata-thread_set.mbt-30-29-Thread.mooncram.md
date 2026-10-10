# core rename Thread internal/regex_engine/automata/thread_set.mbt:30:29

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
$ run_moon_ide moon ide rename 'Thread' 'ThreadRenamed' --loc 'internal/regex_engine/automata/thread_set.mbt:30:29'
*** Begin Patch
*** Update File: <WORKDIR>/internal/regex_engine/automata/delta.mbt
@@
   inner : Expr,
   c : DeltaContext,
   marks : MarkSlotMap,
-  rem : Array[Thread],
+  rem : Array[ThreadRenamed],
 ) -> Unit {
   let inner_delta = []
   delta_expr(inner, c, marks, inner_delta)
@@
   expr : Expr,
   c : DeltaContext,
   marks : MarkSlotMap,
-  rem : Array[Thread],
+  rem : Array[ThreadRenamed],
 ) -> Unit {
   match expr.def {
     Chr(s) => if s.contains(c.c) { rem.push(Exp(marks, e_eps)) }
@@
 ///|
 fn delta_seq(
   pref : @shared_types.Preference,
-  first : Array[Thread],
+  first : Array[ThreadRenamed],
   next : Expr,
   c : DeltaContext,
-  rem : Array[Thread],
+  rem : Array[ThreadRenamed],
 ) -> Unit {
   match first_match(first) {
     None => ts_seq(pref, first, next, rem)
@@
 }
 
 ///|
-fn delta_thread(thread : Thread, c : DeltaContext, rem : Array[Thread]) -> Unit {
+fn delta_thread(thread : ThreadRenamed, c : DeltaContext, rem : Array[ThreadRenamed]) -> Unit {
   match thread {
     End(_) => rem.push(thread)
     Exp(marks, expr) => delta_expr(expr, c, marks, rem)
@@
 fn delta_threads(
   curr : ThreadSet,
   c : DeltaContext,
-  rem : Array[Thread],
+  rem : Array[ThreadRenamed],
 ) -> Unit {
   for thread in curr.0 {
     delta_thread(thread, c, rem)
*** Update File: <WORKDIR>/internal/regex_engine/automata/thread.mbt
@@
 ///    - May transition to `Seq` for sequences
 ///    - May reach `End` when matching succeeds
 /// 3. Threads are eliminated if they can't match the current input
-priv enum Thread {
+priv enum ThreadRenamed {
   End(MarkSlotMap)
   Exp(MarkSlotMap, Expr)
   Seq(@shared_types.Preference, ThreadSet, Expr)
*** Update File: <WORKDIR>/internal/regex_engine/automata/thread_set.mbt
@@
 /// nested `Seq` threads and `remove_duplicates` rebuilds every level), so
 /// `assign_slot_in_place` may mutate them. Once a set is stored in a
 /// `State` it is never mutated again.
-priv struct ThreadSet(Array[Thread])
+priv struct ThreadSet(Array[ThreadRenamed])
 
 ///|
 impl Eq for ThreadSet with fn equal(self, other) {
@@
 let ts_empty : ThreadSet = ThreadSet([])
 
 ///|
-fn ThreadSet::first(self : ThreadSet) -> Thread? {
+fn ThreadSet::first(self : ThreadSet) -> ThreadRenamed? {
   self.0.get(0)
 }
 
@@
 ///|
 /// Marks of the first `End` thread, if any (nested `Seq` threads never
 /// contain `End`: their matches were consumed by `delta_seq`).
-fn first_match(threads : Array[Thread]) -> MarkSlotMap? {
+fn first_match(threads : Array[ThreadRenamed]) -> MarkSlotMap? {
   for thread in threads {
     if thread is End(marks) {
       return Some(marks)
@@
 
 ///|
 /// Drop every `End` thread, in place (the array is owned by this delta).
-fn remove_matches(threads : Array[Thread]) -> Unit {
+fn remove_matches(threads : Array[ThreadRenamed]) -> Unit {
   threads.retain(thread => !(thread is End(_)))
 }
 
 ///|
 /// Shrink an owned array to its first `len` elements.
-fn truncate(threads : Array[Thread], len : Int) -> Unit {
+fn truncate(threads : Array[ThreadRenamed], len : Int) -> Unit {
   while threads.length() > len {
     threads.unsafe_pop() |> ignore
   }
@@
 /// Split at the first `End`: `threads` keeps what came before it, and the
 /// threads after it (with any further `End` removed) are returned. The
 /// caller has checked an `End` exists.
-fn split_at_first_match(threads : Array[Thread]) -> Array[Thread] {
+fn split_at_first_match(threads : Array[ThreadRenamed]) -> Array[ThreadRenamed] {
   for i, thread in threads {
     if thread is End(_) {
       let after = threads.drain(i + 1, threads.length())
@@
 /// a single finished thread (which is exactly a thread sitting at `next`).
 fn ts_seq(
   pref : @shared_types.Preference,
-  first : Array[Thread],
+  first : Array[ThreadRenamed],
   next : Expr,
-  rem : Array[Thread],
+  rem : Array[ThreadRenamed],
 ) -> Unit {
   match first {
     [] => () (escaped)
@@
 /// wrapper separately retains one thread per partition of the input and
 /// makes the set grow exponentially.
 fn remove_duplicates(
-  threads : Array[Thread],
+  threads : Array[ThreadRenamed],
   next : Expr,
   seen : @hashset.HashSet[ExprId],
 ) -> Unit {
*** End Patch

```
