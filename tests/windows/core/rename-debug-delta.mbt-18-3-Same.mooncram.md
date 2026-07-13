# core rename Same debug\delta.mbt:18:3

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\core' moon ide rename 'Same' 'SameRenamed' --loc 'debug\delta.mbt:18:3'
*** Begin Patch
*** Update File: <WORKDIR>/debug\delta.mbt
@@
 ///|
 /// Tree-shaped diff between two `Repr` values.
 priv enum ReprDelta {
-  Same(Repr, Array[ReprDelta])
+  SameRenamed(Repr, Array[ReprDelta])
   Different(Repr, Repr)
   Extra1(Repr)
   Extra2(Repr)
@@
       }
       if info_is_unimportant(left_node) &&
         !children.is_empty() &&
-        children.all(d => !(d is Same(_, _))) {
+        children.all(d => !(d is SameRenamed(_, _))) {
         Different(left_node, right_node)
       } else {
-        Same(left_node.shallow(), children)
+        SameRenamed(left_node.shallow(), children)
       }
     } else {
       Different(left_node, right_node)
@@
   fn go(d : Int, node : ReprDelta) -> ReprDelta {
     if d <= 0 {
       match node {
-        Same(label, children) =>
+        SameRenamed(label, children) =>
           if children.is_empty() {
             node
           } else if !label.info_adds_depth() {
-            Same(label, children.map(child => go(d, child)))
+            SameRenamed(label, children.map(child => go(d, child)))
           } else {
-            Same(Repr::omitted(), [])
+            SameRenamed(Repr::omitted(), [])
           }
-        Different(_, _) | Extra1(_) | Extra2(_) => Same(Repr::omitted(), [])
+        Different(_, _) | Extra1(_) | Extra2(_) => SameRenamed(Repr::omitted(), [])
       }
     } else {
       match node {
-        Same(label, children) => {
+        SameRenamed(label, children) => {
           let next_depth = if label.info_adds_depth() { d - 1 } else { d }
-          Same(label, children.map(child => go(next_depth, child)))
+          SameRenamed(label, children.map(child => go(next_depth, child)))
         }
         Different(left, right) =>
           Different(
@@
 /// Heuristic "size" of a delta for compact-vs-multiline decisions.
 fn delta_root_size(delta : ReprDelta) -> Int {
   match delta {
-    Same(label, _) => info_size(label)
+    SameRenamed(label, _) => info_size(label)
     _ => 0
   }
 }
@@
 /// Render a `ReprDelta` as `Content` with resizing decisions.
 fn render_delta(threshold : Int, use_ansi : Bool, delta : ReprDelta) -> Content {
   match delta {
-    Same(label, children_delta) => {
+    SameRenamed(label, children_delta) => {
       let children = children_delta.map(child => {
         render_delta(threshold, use_ansi, child)
       })
*** Update File: <WORKDIR>/debug\delta_wbtest.mbt
@@
 test "diff: empty containers stay Same" {
   let empty : Array[Int] = []
   let delta = diff_repr(Debug::to_repr(empty), Debug::to_repr(empty))
-  guard delta is Same(Array([]), []) else {
+  guard delta is SameRenamed(Array([]), []) else {
     fail("expected Same(Array([]), [])")
   }
   let empty = Empty::{  }
   let delta = diff_repr(Debug::to_repr(empty), Debug::to_repr(empty))
-  guard delta is Same(Record([]), []) else {
+  guard delta is SameRenamed(Record([]), []) else {
     fail("expected Same(Array([]), [])")
   }
 }
@@
   let x = Repr::array([Repr::integer("1"), Repr::integer("2")])
   let y = Repr::array([Repr::integer("1"), Repr::integer("3")])
   let delta = diff_repr(x, y)
-  guard delta is Same(Array([]), [Same(Integer("1"), []), _]) else {
+  guard delta is SameRenamed(Array([]), [SameRenamed(Integer("1"), []), _]) else {
     fail("expected Same(Array, children...)")
   }
 }
@@
   let x = Repr::array([Repr::integer("1")])
   let y = Repr::array([Repr::integer("1"), Repr::integer("2")])
   let delta = diff_repr(x, y)
-  guard delta is Same(Array([]), [Same(Integer("1"), []), Extra2(Integer("2"))]) else {
+  guard delta is SameRenamed(Array([]), [SameRenamed(Integer("1"), []), Extra2(Integer("2"))]) else {
     fail("expected Same(Array, [Same 1, Extra2 2])")
   }
 }
@@
   let x = Repr::double(1.0)
   let y = Repr::double(1.0 + 1.0e-13)
   let delta = diff_repr(x, y, max_relative_error=1.0e-12)
-  guard delta is Same(DoubleLit(_), []) else {
+  guard delta is SameRenamed(DoubleLit(_), []) else {
     fail("expected Same(DoubleLit, [])")
   }
 }
@@
   let x = Repr::array([Repr::integer("1"), Repr::integer("2")])
   let y = Repr::array([Repr::integer("1")])
   let delta = diff_repr(x, y)
-  guard delta is Same(Array([]), [Same(Integer("1"), []), Extra1(Integer("2"))]) else {
+  guard delta is SameRenamed(Array([]), [SameRenamed(Integer("1"), []), Extra1(Integer("2"))]) else {
     fail("expected Same(Array, [Same 1, Extra1 2])")
   }
 }
*** End Patch

```
