# rabbita rename VDom rabbita\internal\vdom\diff.mbt:3:8

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\rabbita' moon ide rename 'VDom' 'VDomRenamed' --loc 'rabbita\internal\vdom\diff.mbt:3:8'
*** Begin Patch
*** Update File: <WORKDIR>/rabbita\internal\runtime\ambient.mbt
@@
 ///|
-pub using @vdom {type Children, type Props, type VNode, type VDom}
+pub using @vdom {type Children, type Props, type VNode, type VDomRenamed}
 
 ///|
 using @cmd {trait Context, trait Scheduler}
*** Update File: <WORKDIR>/rabbita\internal\runtime\host_browser.mbt
@@
   mut graph_output : @duplix.Node[VNode]?
   mut drain_scheduled : Bool
   mut paint_scheduled : Bool
-  mut document : @vdom.VDom?
+  mut document : @vdom.VDomRenamed?
   mut url_request : @cmd.Injector[String]
   mut url_changed : @cmd.Injector[String]
 }
@@
   Scheduler::queue_command(host, cmd)
   let root = ambient_host.protect(host, () => output.read())
   host.document = Some(
-    @vdom.VDom::initialize(root, host, target_element_id?=element_id),
+    @vdom.VDomRenamed::initialize(root, host, target_element_id?=element_id),
   )
   host.drain_scheduled = false
   host
*** Update File: <WORKDIR>/rabbita\internal\runtime\host_hydration.mbt
@@
     }
   }
 
-  let vdom = @vdom.VDom::initialize_with_hydration(vnode, host)
+  let vdom = @vdom.VDomRenamed::initialize_with_hydration(vnode, host)
   host.browser.document = Some(vdom)
   host.browser.drain_scheduled = false
   host
*** Update File: <WORKDIR>/rabbita\internal\vdom\diff.mbt
@@
 ///|
 #cfg(target="js")
-struct VDom {
+struct VDomRenamed {
   mut inode : INode
   target_element : @dom.Element?
   captured_link_listener : @dom.Listener
@@
 
 ///|
 #cfg(target="js")
-fn VDom::to_vnode(self : Self) -> VNode {
+fn VDomRenamed::to_vnode(self : Self) -> VNode {
   self.inode.to_vnode()
 }
 
@@
 }
 
 ///|
-pub fn VDom::to_string(self : Self) -> String {
+pub fn VDomRenamed::to_string(self : Self) -> String {
   server_side_render(() => self.to_vnode())
 }
 
@@
 
 ///|
 #cfg(target="js")
-pub fn VDom::update(self : Self, root : VNode, scheduler : &Scheduler) -> Unit {
+pub fn VDomRenamed::update(self : Self, root : VNode, scheduler : &Scheduler) -> Unit {
   self.inode = diff_document(
     self.inode,
     root,
@@
 
 ///|
 #cfg(target="js")
-pub fn VDom::initialize_with_hydration(
+pub fn VDomRenamed::initialize_with_hydration(
   vnode : VNode,
   scheduler : &Scheduler,
-) -> VDom {
+) -> VDomRenamed {
   let captured_link_listener = new_captured_link_listener(scheduler)
   let inode = hydrate_root(vnode, scheduler, captured_link_listener)
   { inode, captured_link_listener, target_element: None, }
@@
 
 ///|
 #cfg(target="js")
-pub fn VDom::initialize(
+pub fn VDomRenamed::initialize(
   vnode : VNode,
   scheduler : &Scheduler,
   target_element_id? : String,
-) -> VDom {
+) -> VDomRenamed {
   let captured_link_listener = new_captured_link_listener(scheduler)
   match (target_element_id, vnode) {
     (Some(id), vnode) => {
@@
         container.as_node(),
         null(),
       )
-      VDom::{ target_element: Some(container), inode, captured_link_listener, }
+      VDomRenamed::{ target_element: Some(container), inode, captured_link_listener, }
     }
     (
       None,
@@
         html,
         namespace_uri=None,
       )
-      VDom::{ target_element: None, inode, captured_link_listener, }
+      VDomRenamed::{ target_element: None, inode, captured_link_listener, }
     }
     // VDom root invariant: the root must be either a `(Some(id), _)` or a 
     // `(None, Elem("html", _, Array([Elem("head", ..), Elem("body", ..)]), ..)`
*** End Patch

```
