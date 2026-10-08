# rabbita rename inode rabbita/internal/vdom/diff.mbt:4:7

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
$ run_moon_ide moon ide rename 'inode' 'inode_renamed' --loc 'rabbita/internal/vdom/diff.mbt:4:7'
*** Begin Patch
*** Update File: <WORKDIR>/rabbita/internal/vdom/diff.mbt
@@
 ///|
 #cfg(target="js")
 struct VDom {
-  mut inode : INode
+  mut inode_renamed : INode
   target_element : @dom.Element?
   captured_link_listener : @dom.Listener
 }
@@
 ///|
 #cfg(target="js")
 fn VDom::to_vnode(self : Self) -> VNode {
-  self.inode.to_vnode()
+  self.inode_renamed.to_vnode()
 }
 
 ///|
@@
 ///|
 #cfg(target="js")
 pub fn VDom::update(self : Self, root : VNode, scheduler : &Scheduler) -> Unit {
-  self.inode = diff_document(
+  self.inode_renamed = diff_document(
-    self.inode,
+    self.inode_renamed,
     root,
     scheduler,
     container?=self.target_element,
@@
 ) -> VDom {
   let captured_link_listener = new_captured_link_listener(scheduler)
   let inode = hydrate_root(vnode, scheduler, captured_link_listener)
-  { inode, captured_link_listener, target_element: None, }
+  { inode_renamed: inode, captured_link_listener, target_element: None, }
 }
 
 ///|
@@
         container.as_node(),
         null(),
       )
-      VDom::{ target_element: Some(container), inode, captured_link_listener, }
+      VDom::{ target_element: Some(container), inode_renamed: inode, captured_link_listener, }
     }
     (
       None,
@@
         html,
         namespace_uri=None,
       )
-      VDom::{ target_element: None, inode, captured_link_listener, }
+      VDom::{ target_element: None, inode_renamed: inode, captured_link_listener, }
     }
     // VDom root invariant: the root must be either a `(Some(id), _)` or a 
     // `(None, Elem("html", _, Array([Elem("head", ..), Elem("body", ..)]), ..)`
*** End Patch

```
