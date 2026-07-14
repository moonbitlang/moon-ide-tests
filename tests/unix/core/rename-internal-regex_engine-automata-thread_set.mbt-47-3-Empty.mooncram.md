# core rename Empty internal/regex_engine/automata/thread_set.mbt:47:3

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
$ run_moon_ide moon ide rename 'Empty' 'EmptyRenamed' --loc 'internal/regex_engine/automata/thread_set.mbt:47:3'
*** Begin Patch
*** Update File: <WORKDIR>/internal/regex_engine/automata/thread_set.mbt
@@
 /// possible execution paths from that state. When computing the derivative with
 /// respect to input, threads are transformed and may split into multiple threads.
 priv enum ThreadSet {
-  Empty
+  EmptyRenamed
   Node(
     i~ : ThreadSetNodeInfo,
     l~ : ThreadSet,
@@
 
 ///|
 fn ThreadSet::is_empty(self : ThreadSet) -> Bool {
-  self is Empty
+  self is EmptyRenamed
 }
 
 ///|
 fn ThreadSet::is_singleton(self : ThreadSet) -> Bool {
-  self is Node(l=Empty, r=Empty, ..)
+  self is Node(l=EmptyRenamed, r=EmptyRenamed, ..)
 }
 
 ///|
 fn ThreadSet::first(self : ThreadSet) -> Thread? {
   match self {
-    Empty => None
+    EmptyRenamed => None
-    Node(l=Empty, t~, ..) => Some(t)
+    Node(l=EmptyRenamed, t~, ..) => Some(t)
     Node(l~, ..) => l.first()
   }
 }
@@
 ///|
 fn ThreadSet::choose(self : ThreadSet) -> Thread {
   match self {
-    Node(l=Empty, t~, r=Empty, ..) => t
+    Node(l=EmptyRenamed, t~, r=EmptyRenamed, ..) => t
     _ => panic()
   }
 }
@@
 ///|
 fn ThreadSet::no_match(self : ThreadSet) -> Bool {
   match self {
-    Empty => true
+    EmptyRenamed => true
     Node(i~, ..) => i.no_match
   }
 }
@@
 
 ///|
 fn ThreadSet::singleton(t : Thread) -> ThreadSet {
-  ThreadSet::make_node(Empty, t, Empty, p=rand_int())
+  ThreadSet::make_node(EmptyRenamed, t, EmptyRenamed, p=rand_int())
 }
 
 ///|
 fn ThreadSet::merge(l : ThreadSet, r : ThreadSet) -> ThreadSet {
   match (l, r) {
-    (Empty, r) => r
+    (EmptyRenamed, r) => r
-    (l, Empty) => l
+    (l, EmptyRenamed) => l
     (Node(..) as l, Node(..) as r) =>
       if l.p > r.p {
         ThreadSet::make_node(l.l, l.t, ThreadSet::merge(l.r, r), p=l.p)
@@
   f : (Thread) -> ThreadSet,
 ) -> ThreadSet {
   match self {
-    Empty => Empty
+    EmptyRenamed => EmptyRenamed
     Node(l~, t~, r~, ..) => {
       let l2 = l.flat_map(f)
       let t2 = f(t)
@@
 ///|
 fn ThreadSet::find_first_match(self : ThreadSet) -> MarkSlotMap? {
   match self {
-    Empty => None
+    EmptyRenamed => None
     Node(i={ no_match: true }, ..) => None
-    Node(l=Empty, t=End(marks), ..) => Some(marks)
+    Node(l=EmptyRenamed, t=End(marks), ..) => Some(marks)
     Node(l~, t~, r~, ..) =>
       match l.find_first_match() {
         Some(marks) => Some(marks)
@@
 ///|
 fn ThreadSet::remove_matches(self : ThreadSet) -> ThreadSet {
   match self {
-    Empty => Empty
+    EmptyRenamed => EmptyRenamed
     Node(i={ no_match: true }, ..) => self
     Node(l~, t~, r~, p~, ..) =>
       match t {
@@
 ///|
 fn ThreadSet::split_at_first_match(self : ThreadSet) -> (ThreadSet, ThreadSet) {
   match self {
-    Empty => (Empty, Empty)
+    EmptyRenamed => (EmptyRenamed, EmptyRenamed)
-    Node(i={ no_match: true }, ..) => (self, Empty)
+    Node(i={ no_match: true }, ..) => (self, EmptyRenamed)
-    Node(l=Empty | Node(i={ no_match: true }, ..) as l, t=End(_), r~, ..) =>
+    Node(l=EmptyRenamed | Node(i={ no_match: true }, ..) as l, t=End(_), r~, ..) =>
       (l, r)
     Node(
-      l=Empty
+      l=EmptyRenamed
       | Node(i={ no_match: true }, ..) as l,
       t=Exp(_)
       | Seq(_) as t,
@@
   Iter::new(() => {
     for curr = node {
       match curr {
-        Node(t=thread, l=Empty, r=right, ..) => {
+        Node(t=thread, l=EmptyRenamed, r=right, ..) => {
           node = right
           break Some(thread)
         }
@@
           parents.push((thread, right))
           continue left
         }
-        Empty if parents.pop() is Some((thread, right)) => {
+        EmptyRenamed if parents.pop() is Some((thread, right)) => {
           node = right
           break Some(thread)
         }
-        Empty => break None
+        EmptyRenamed => break None
       }
     }
   })
@@
 ///|
 fn ThreadSet::map(self : ThreadSet, f : (Thread) -> Thread) -> ThreadSet {
   match self {
-    Empty => Empty
+    EmptyRenamed => EmptyRenamed
     Node(l~, t~, r~, p~, ..) => {
       let l2 = l.map(f)
       let b2 = f(t)
@@
 }
 
 ///|
-let ts_empty : ThreadSet = Empty
+let ts_empty : ThreadSet = EmptyRenamed
 
 ///|
 fn ts_one(t : Thread) -> ThreadSet {
*** End Patch

```
