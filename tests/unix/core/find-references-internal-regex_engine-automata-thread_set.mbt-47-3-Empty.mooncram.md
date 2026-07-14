# core find-references Empty internal/regex_engine/automata/thread_set.mbt:47:3

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
$ run_moon_ide moon ide find-references 'Empty' --loc 'internal/regex_engine/automata/thread_set.mbt:47:3'
Found 31 references for symbol 'Empty':
<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:47:3-47:8:
   | /// possible execution paths from that state. When computing the derivative with
   | /// respect to input, threads are transformed and may split into multiple threads.
   | priv enum ThreadSet {
47 |   Empty
   |   ^^^^^
   |   Node(
   |     i~ : ThreadSetNodeInfo,

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:66:11-66:16:
   | 
   | ///|
   | fn ThreadSet::is_empty(self : ThreadSet) -> Bool {
66 |   self is Empty
   |           ^^^^^
   | }
   | 

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:71:18-71:23:
   | 
   | ///|
   | fn ThreadSet::is_singleton(self : ThreadSet) -> Bool {
71 |   self is Node(l=Empty, r=Empty, ..)
   |                  ^^^^^
   | }
   | 

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:71:27-71:32:
   | 
   | ///|
   | fn ThreadSet::is_singleton(self : ThreadSet) -> Bool {
71 |   self is Node(l=Empty, r=Empty, ..)
   |                           ^^^^^
   | }
   | 

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:77:5-77:10:
   | ///|
   | fn ThreadSet::first(self : ThreadSet) -> Thread? {
   |   match self {
77 |     Empty => None
   |     ^^^^^
   |     Node(l=Empty, t~, ..) => Some(t)
   |     Node(l~, ..) => l.first()

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:78:12-78:17:
   | fn ThreadSet::first(self : ThreadSet) -> Thread? {
   |   match self {
   |     Empty => None
78 |     Node(l=Empty, t~, ..) => Some(t)
   |            ^^^^^
   |     Node(l~, ..) => l.first()
   |   }

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:86:12-86:17:
   | ///|
   | fn ThreadSet::choose(self : ThreadSet) -> Thread {
   |   match self {
86 |     Node(l=Empty, t~, r=Empty, ..) => t
   |            ^^^^^
   |     _ => panic()
   |   }

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:86:25-86:30:
   | ///|
   | fn ThreadSet::choose(self : ThreadSet) -> Thread {
   |   match self {
86 |     Node(l=Empty, t~, r=Empty, ..) => t
   |                         ^^^^^
   |     _ => panic()
   |   }

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:94:5-94:10:
   | ///|
   | fn ThreadSet::no_match(self : ThreadSet) -> Bool {
   |   match self {
94 |     Empty => true
   |     ^^^^^
   |     Node(i~, ..) => i.no_match
   |   }

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:123:24-123:29:
    | 
    | ///|
    | fn ThreadSet::singleton(t : Thread) -> ThreadSet {
123 |   ThreadSet::make_node(Empty, t, Empty, p=rand_int())
    |                        ^^^^^
    | }
    | 

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:123:34-123:39:
    | 
    | ///|
    | fn ThreadSet::singleton(t : Thread) -> ThreadSet {
123 |   ThreadSet::make_node(Empty, t, Empty, p=rand_int())
    |                                  ^^^^^
    | }
    | 

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:129:6-129:11:
    | ///|
    | fn ThreadSet::merge(l : ThreadSet, r : ThreadSet) -> ThreadSet {
    |   match (l, r) {
129 |     (Empty, r) => r
    |      ^^^^^
    |     (l, Empty) => l
    |     (Node(..) as l, Node(..) as r) =>

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:130:9-130:14:
    | fn ThreadSet::merge(l : ThreadSet, r : ThreadSet) -> ThreadSet {
    |   match (l, r) {
    |     (Empty, r) => r
130 |     (l, Empty) => l
    |         ^^^^^
    |     (Node(..) as l, Node(..) as r) =>
    |       if l.p > r.p {

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:151:5-151:10:
    |   f : (Thread) -> ThreadSet,
    | ) -> ThreadSet {
    |   match self {
151 |     Empty => Empty
    |     ^^^^^
    |     Node(l~, t~, r~, ..) => {
    |       let l2 = l.flat_map(f)

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:151:14-151:19:
    |   f : (Thread) -> ThreadSet,
    | ) -> ThreadSet {
    |   match self {
151 |     Empty => Empty
    |              ^^^^^
    |     Node(l~, t~, r~, ..) => {
    |       let l2 = l.flat_map(f)

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:164:5-164:10:
    | ///|
    | fn ThreadSet::find_first_match(self : ThreadSet) -> MarkSlotMap? {
    |   match self {
164 |     Empty => None
    |     ^^^^^
    |     Node(i={ no_match: true }, ..) => None
    |     Node(l=Empty, t=End(marks), ..) => Some(marks)

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:166:12-166:17:
    |   match self {
    |     Empty => None
    |     Node(i={ no_match: true }, ..) => None
166 |     Node(l=Empty, t=End(marks), ..) => Some(marks)
    |            ^^^^^
    |     Node(l~, t~, r~, ..) =>
    |       match l.find_first_match() {

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:182:5-182:10:
    | ///|
    | fn ThreadSet::remove_matches(self : ThreadSet) -> ThreadSet {
    |   match self {
182 |     Empty => Empty
    |     ^^^^^
    |     Node(i={ no_match: true }, ..) => self
    |     Node(l~, t~, r~, p~, ..) =>

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:182:14-182:19:
    | ///|
    | fn ThreadSet::remove_matches(self : ThreadSet) -> ThreadSet {
    |   match self {
182 |     Empty => Empty
    |              ^^^^^
    |     Node(i={ no_match: true }, ..) => self
    |     Node(l~, t~, r~, p~, ..) =>

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:196:5-196:10:
    | ///|
    | fn ThreadSet::split_at_first_match(self : ThreadSet) -> (ThreadSet, ThreadSet) {
    |   match self {
196 |     Empty => (Empty, Empty)
    |     ^^^^^
    |     Node(i={ no_match: true }, ..) => (self, Empty)
    |     Node(l=Empty | Node(i={ no_match: true }, ..) as l, t=End(_), r~, ..) =>

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:196:15-196:20:
    | ///|
    | fn ThreadSet::split_at_first_match(self : ThreadSet) -> (ThreadSet, ThreadSet) {
    |   match self {
196 |     Empty => (Empty, Empty)
    |               ^^^^^
    |     Node(i={ no_match: true }, ..) => (self, Empty)
    |     Node(l=Empty | Node(i={ no_match: true }, ..) as l, t=End(_), r~, ..) =>

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:196:22-196:27:
    | ///|
    | fn ThreadSet::split_at_first_match(self : ThreadSet) -> (ThreadSet, ThreadSet) {
    |   match self {
196 |     Empty => (Empty, Empty)
    |                      ^^^^^
    |     Node(i={ no_match: true }, ..) => (self, Empty)
    |     Node(l=Empty | Node(i={ no_match: true }, ..) as l, t=End(_), r~, ..) =>

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:197:46-197:51:
    | fn ThreadSet::split_at_first_match(self : ThreadSet) -> (ThreadSet, ThreadSet) {
    |   match self {
    |     Empty => (Empty, Empty)
197 |     Node(i={ no_match: true }, ..) => (self, Empty)
    |                                              ^^^^^
    |     Node(l=Empty | Node(i={ no_match: true }, ..) as l, t=End(_), r~, ..) =>
    |       (l, r)

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:198:12-198:17:
    |   match self {
    |     Empty => (Empty, Empty)
    |     Node(i={ no_match: true }, ..) => (self, Empty)
198 |     Node(l=Empty | Node(i={ no_match: true }, ..) as l, t=End(_), r~, ..) =>
    |            ^^^^^
    |       (l, r)
    |     Node(

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:201:9-201:14:
    |     Node(l=Empty | Node(i={ no_match: true }, ..) as l, t=End(_), r~, ..) =>
    |       (l, r)
    |     Node(
201 |       l=Empty
    |         ^^^^^
    |       | Node(i={ no_match: true }, ..) as l,
    |       t=Exp(_)

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:268:26-268:31:
    |   Iter::new(() => {
    |     for curr = node {
    |       match curr {
268 |         Node(t=thread, l=Empty, r=right, ..) => {
    |                          ^^^^^
    |           node = right
    |           break Some(thread)

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:276:9-276:14:
    |           parents.push((thread, right))
    |           continue left
    |         }
276 |         Empty if parents.pop() is Some((thread, right)) => {
    |         ^^^^^
    |           node = right
    |           break Some(thread)

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:280:9-280:14:
    |           node = right
    |           break Some(thread)
    |         }
280 |         Empty => break None
    |         ^^^^^
    |       }
    |     }

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:301:5-301:10:
    | ///|
    | fn ThreadSet::map(self : ThreadSet, f : (Thread) -> Thread) -> ThreadSet {
    |   match self {
301 |     Empty => Empty
    |     ^^^^^
    |     Node(l~, t~, r~, p~, ..) => {
    |       let l2 = l.map(f)

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:301:14-301:19:
    | ///|
    | fn ThreadSet::map(self : ThreadSet, f : (Thread) -> Thread) -> ThreadSet {
    |   match self {
301 |     Empty => Empty
    |              ^^^^^
    |     Node(l~, t~, r~, p~, ..) => {
    |       let l2 = l.map(f)

<WORKDIR>/internal/regex_engine/automata/thread_set.mbt:312:28-312:33:
    | }
    | 
    | ///|
312 | let ts_empty : ThreadSet = Empty
    |                            ^^^^^
    | 
    | ///|

```
