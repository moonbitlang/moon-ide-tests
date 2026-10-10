# core find-references ThreadSet internal/regex_engine/automata/thread_set.mbt:30:13

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
$ run_moon_ide moon ide find-references 'ThreadSet' --loc 'internal/regex_engine/automata/thread_set.mbt:30:13'
Found 18 references for symbol 'ThreadSet':
<WORKDIR>/internal/regex_engine/automata/delta.mbt:169:10-169:19:
    | 
    | ///|
    | fn delta_threads(
169 |   curr : ThreadSet,
    |          ^^^^^^^^^
    |   c : DeltaContext,
    |   rem : Array[Thread],

<WORKDIR>/internal/regex_engine/automata/delta.mbt:184:37-184:46:
    | /// Uses the SlotBook to track which slots are already in use by threads
    | /// in the descriptor, then finds an unused slot. If no unassigned marks
    | /// exist in any thread, returns an unassigned slot (no tracking needed).
184 | fn find_slot(ctx~ : Context, desc : ThreadSet) -> Slot {
    |                                     ^^^^^^^^^
    |   if ctx.book_dirty {
    |     ctx.book.clear()

<WORKDIR>/internal/regex_engine/automata/delta.mbt:235:14-235:23:
    |   delta_threads(state.desc, { prev_cat, next_cat, c, }, rem)
    |   ctx.seen.clear()
    |   remove_duplicates(rem, e_eps, ctx.seen)
235 |   let desc = ThreadSet(rem)
    |              ^^^^^^^^^
    |   let slot = find_slot(ctx~, desc)
    |   if slot.is_assigned() {

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

<WORKDIR>/internal/regex_engine/automata/state.mbt:99:5-99:14:
   |   State::new(
   |     Slot::unassigned(),
   |     cat,
99 |     ThreadSet([Exp(MarkSlotMap::empty(), expr)]),
   |     ^^^^^^^^^
   |   )
   | }

<WORKDIR>/internal/regex_engine/automata/thread.mbt:43:33-43:42:
   | priv enum Thread {
   |   End(MarkSlotMap)
   |   Exp(MarkSlotMap, Expr)
43 |   Seq(@shared_types.Preference, ThreadSet, Expr)
   |                                 ^^^^^^^^^
   | } derive(Eq, Hash)

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:33:13-33:22:
   | priv struct ThreadSet(Array[Thread])
   | 
   | ///|
33 | impl Eq for ThreadSet with fn equal(self, other) {
   |             ^^^^^^^^^
   |   self.0 == other.0
   | }

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:38:15-38:24:
   | }
   | 
   | ///|
38 | impl Hash for ThreadSet with fn hash_combine(self, hasher) {
   |               ^^^^^^^^^
   |   for thread in self.0 {
   |     hasher.combine(thread)

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:45:16-45:25:
   | }
   | 
   | ///|
45 | let ts_empty : ThreadSet = ThreadSet([])
   |                ^^^^^^^^^
   | 
   | ///|

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:45:28-45:37:
   | }
   | 
   | ///|
45 | let ts_empty : ThreadSet = ThreadSet([])
   |                            ^^^^^^^^^
   | 
   | ///|

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:48:4-48:13:
   | let ts_empty : ThreadSet = ThreadSet([])
   | 
   | ///|
48 | fn ThreadSet::first(self : ThreadSet) -> Thread? {
   |    ^^^^^^^^^
   |   self.0.get(0)
   | }

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:48:28-48:37:
   | let ts_empty : ThreadSet = ThreadSet([])
   | 
   | ///|
48 | fn ThreadSet::first(self : ThreadSet) -> Thread? {
   |                            ^^^^^^^^^
   |   self.0.get(0)
   | }

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:107:29-107:38:
    |   match first {
    |     [] => () (escaped)
    |     [Exp(marks, { def: Eps, .. })] => rem.push(Exp(marks, next))
107 |     _ => rem.push(Seq(pref, ThreadSet(first), next))
    |                             ^^^^^^^^^
    |   }
    | }

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:183:4-183:13:
    | ///|
    | /// Give every unassigned mark in the set the state's slot. Mutates the
    | /// arrays in place; see the ownership note on `ThreadSet`.
183 | fn ThreadSet::assign_slot_in_place(self : ThreadSet, slot : Slot) -> Unit {
    |    ^^^^^^^^^
    |   guard slot.is_assigned() else { panic() }
    |   for i, thread in self.0 {

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:183:43-183:52:
    | ///|
    | /// Give every unassigned mark in the set the state's slot. Mutates the
    | /// arrays in place; see the ownership note on `ThreadSet`.
183 | fn ThreadSet::assign_slot_in_place(self : ThreadSet, slot : Slot) -> Unit {
    |                                           ^^^^^^^^^
    |   guard slot.is_assigned() else { panic() }
    |   for i, thread in self.0 {

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:196:4-196:13:
    | 
    | ///|
    | /// Visit the marks of every thread, including those nested in `Seq` threads.
196 | fn ThreadSet::each_marks(self : ThreadSet, f : (MarkSlotMap) -> Unit) -> Unit {
    |    ^^^^^^^^^
    |   for thread in self.0 {
    |     match thread {

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:196:33-196:42:
    | 
    | ///|
    | /// Visit the marks of every thread, including those nested in `Seq` threads.
196 | fn ThreadSet::each_marks(self : ThreadSet, f : (MarkSlotMap) -> Unit) -> Unit {
    |                                 ^^^^^^^^^
    |   for thread in self.0 {
    |     match thread {

```
