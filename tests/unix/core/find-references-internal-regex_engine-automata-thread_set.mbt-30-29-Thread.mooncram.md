# core find-references Thread internal/regex_engine/automata/thread_set.mbt:30:29

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
$ run_moon_ide moon ide find-references 'Thread' --loc 'internal/regex_engine/automata/thread_set.mbt:30:29'
Found 17 references for symbol 'Thread':
<WORKDIR>/internal/regex_engine/automata/delta.mbt:67:15-67:21:
   |   inner : Expr,
   |   c : DeltaContext,
   |   marks : MarkSlotMap,
67 |   rem : Array[Thread],
   |               ^^^^^^
   | ) -> Unit {
   |   let inner_delta = []

<WORKDIR>/internal/regex_engine/automata/delta.mbt:95:15-95:21:
   |   expr : Expr,
   |   c : DeltaContext,
   |   marks : MarkSlotMap,
95 |   rem : Array[Thread],
   |               ^^^^^^
   | ) -> Unit {
   |   match expr.def {

<WORKDIR>/internal/regex_engine/automata/delta.mbt:125:17-125:23:
    | ///|
    | fn delta_seq(
    |   pref : @shared_types.Preference,
125 |   first : Array[Thread],
    |                 ^^^^^^
    |   next : Expr,
    |   c : DeltaContext,

<WORKDIR>/internal/regex_engine/automata/delta.mbt:128:15-128:21:
    |   first : Array[Thread],
    |   next : Expr,
    |   c : DeltaContext,
128 |   rem : Array[Thread],
    |               ^^^^^^
    | ) -> Unit {
    |   match first_match(first) {

<WORKDIR>/internal/regex_engine/automata/delta.mbt:155:26-155:32:
    | }
    | 
    | ///|
155 | fn delta_thread(thread : Thread, c : DeltaContext, rem : Array[Thread]) -> Unit {
    |                          ^^^^^^
    |   match thread {
    |     End(_) => rem.push(thread)

<WORKDIR>/internal/regex_engine/automata/delta.mbt:155:64-155:70:
    | }
    | 
    | ///|
155 | fn delta_thread(thread : Thread, c : DeltaContext, rem : Array[Thread]) -> Unit {
    |                                                                ^^^^^^
    |   match thread {
    |     End(_) => rem.push(thread)

<WORKDIR>/internal/regex_engine/automata/delta.mbt:171:15-171:21:
    | fn delta_threads(
    |   curr : ThreadSet,
    |   c : DeltaContext,
171 |   rem : Array[Thread],
    |               ^^^^^^
    | ) -> Unit {
    |   for thread in curr.0 {

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:30:29-30:35:
   | /// nested `Seq` threads and `remove_duplicates` rebuilds every level), so
   | /// `assign_slot_in_place` may mutate them. Once a set is stored in a
   | /// `State` it is never mutated again.
30 | priv struct ThreadSet(Array[Thread])
   |                             ^^^^^^
   | 
   | ///|

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:48:42-48:48:
   | let ts_empty : ThreadSet = ThreadSet([])
   | 
   | ///|
48 | fn ThreadSet::first(self : ThreadSet) -> Thread? {
   |                                          ^^^^^^
   |   self.0.get(0)
   | }

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:55:32-55:38:
   | ///|
   | /// Marks of the first `End` thread, if any (nested `Seq` threads never
   | /// contain `End`: their matches were consumed by `delta_seq`).
55 | fn first_match(threads : Array[Thread]) -> MarkSlotMap? {
   |                                ^^^^^^
   |   for thread in threads {
   |     if thread is End(marks) {

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:66:35-66:41:
   | 
   | ///|
   | /// Drop every `End` thread, in place (the array is owned by this delta).
66 | fn remove_matches(threads : Array[Thread]) -> Unit {
   |                                   ^^^^^^
   |   threads.retain(thread => !(thread is End(_)))
   | }

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:72:29-72:35:
   | 
   | ///|
   | /// Shrink an owned array to its first `len` elements.
72 | fn truncate(threads : Array[Thread], len : Int) -> Unit {
   |                             ^^^^^^
   |   while threads.length() > len {
   |     threads.unsafe_pop() |> ignore

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:82:41-82:47:
   | /// Split at the first `End`: `threads` keeps what came before it, and the
   | /// threads after it (with any further `End` removed) are returned. The
   | /// caller has checked an `End` exists.
82 | fn split_at_first_match(threads : Array[Thread]) -> Array[Thread] {
   |                                         ^^^^^^
   |   for i, thread in threads {
   |     if thread is End(_) {

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:82:59-82:65:
   | /// Split at the first `End`: `threads` keeps what came before it, and the
   | /// threads after it (with any further `End` removed) are returned. The
   | /// caller has checked an `End` exists.
82 | fn split_at_first_match(threads : Array[Thread]) -> Array[Thread] {
   |                                                           ^^^^^^
   |   for i, thread in threads {
   |     if thread is End(_) {

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:100:17-100:23:
    | /// a single finished thread (which is exactly a thread sitting at `next`).
    | fn ts_seq(
    |   pref : @shared_types.Preference,
100 |   first : Array[Thread],
    |                 ^^^^^^
    |   next : Expr,
    |   rem : Array[Thread],

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:102:15-102:21:
    |   pref : @shared_types.Preference,
    |   first : Array[Thread],
    |   next : Expr,
102 |   rem : Array[Thread],
    |               ^^^^^^
    | ) -> Unit {
    |   match first {

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:138:19-138:25:
    | /// wrapper separately retains one thread per partition of the input and
    | /// makes the set grow exponentially.
    | fn remove_duplicates(
138 |   threads : Array[Thread],
    |                   ^^^^^^
    |   next : Expr,
    |   seen : @hashset.HashSet[ExprId],

```
