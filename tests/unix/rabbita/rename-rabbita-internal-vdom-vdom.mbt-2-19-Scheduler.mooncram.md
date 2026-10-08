# rabbita rename Scheduler rabbita/internal/vdom/vdom.mbt:2:19

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
$ run_moon_ide moon ide rename 'Scheduler' 'SchedulerRenamed' --loc 'rabbita/internal/vdom/vdom.mbt:2:19'
*** Begin Patch
*** Update File: <WORKDIR>/rabbita/internal/vdom/diff.mbt
@@
 #cfg(target="js")
 priv struct IProps {
   props : Props
-  slots : Map[String, Ref[(@dom.Event, &Scheduler) -> Unit]]
+  slots : Map[String, Ref[(@dom.Event, &SchedulerRenamed) -> Unit]]
 }
 
 ///|
@@
   element : @dom.Element,
   tag : String,
   props : Props,
-  scheduler : &Scheduler,
+  scheduler : &SchedulerRenamed,
   captured_link_listener : @dom.Listener,
 ) -> IProps {
   let { handlers, attrs, props: properties, styles, } = props
-  let slots : Map[String, Ref[(@dom.Event, &Scheduler) -> Unit]] = Map([])
+  let slots : Map[String, Ref[(@dom.Event, &SchedulerRenamed) -> Unit]] = Map([])
   for event, handler in handlers {
     let slot = @ref.new(handler)
     element.add_event_listener(event, event => (slot.val)(event, scheduler))
@@
 fn insert_children(
   node : @dom.Node,
   children : Children[VNode],
-  scheduler : &Scheduler,
+  scheduler : &SchedulerRenamed,
   captured_link_listener : @dom.Listener,
 ) -> Children[INode] {
   match children {
@@
 #cfg(target="js")
 fn VNode::insert(
   self : Self,
-  scheduler : &Scheduler,
+  scheduler : &SchedulerRenamed,
   captured_link_listener : @dom.Listener,
   parent : @dom.Node,
   before : @js.Nullable[@dom.Node],
@@
 
 ///|
 #cfg(target="js")
-pub fn VDom::update(self : Self, root : VNode, scheduler : &Scheduler) -> Unit {
+pub fn VDom::update(self : Self, root : VNode, scheduler : &SchedulerRenamed) -> Unit {
   self.inode = diff_document(
     self.inode,
     root,
@@
 #cfg(target="js")
 pub fn VDom::initialize_with_hydration(
   vnode : VNode,
-  scheduler : &Scheduler,
+  scheduler : &SchedulerRenamed,
 ) -> VDom {
   let captured_link_listener = new_captured_link_listener(scheduler)
   let inode = hydrate_root(vnode, scheduler, captured_link_listener)
@@
 
 ///|
 #cfg(target="js")
-fn new_captured_link_listener(scheduler : &Scheduler) -> @dom.Listener {
+fn new_captured_link_listener(scheduler : &SchedulerRenamed) -> @dom.Listener {
   event => {
     if event.to_mouse_event() is Some(mouse_event) &&
       !(mouse_event.get_meta_key() || mouse_event.get_ctrl_key()) {
@@
 #cfg(target="js")
 pub fn VDom::initialize(
   vnode : VNode,
-  scheduler : &Scheduler,
+  scheduler : &SchedulerRenamed,
   target_element_id? : String,
 ) -> VDom {
   let captured_link_listener = new_captured_link_listener(scheduler)
@@
 fn diff_document(
   old : INode,
   new : VNode,
-  scheduler : &Scheduler,
+  scheduler : &SchedulerRenamed,
   container? : @dom.Element,
   captured_link_listener~ : @dom.Listener,
 ) -> INode {
@@
 fn diff_node(
   old : INode,
   new : VNode,
-  scheduler : &Scheduler,
+  scheduler : &SchedulerRenamed,
   captured_link_listener : @dom.Listener,
   parent : @dom.Node,
   anchor : @js.Nullable[@dom.Node],
@@
 fn diff_props(
   old : IProps,
   new : Props,
-  scheduler : &Scheduler,
+  scheduler : &SchedulerRenamed,
   parent : @dom.Element,
 ) -> IProps {
   let slots = old.slots
@@
 fn diff_children(
   old : Children[INode],
   new : Children[VNode],
-  scheduler : &Scheduler,
+  scheduler : &SchedulerRenamed,
   captured_link_listener : @dom.Listener,
   parent : @dom.Node,
   anchor : @js.Nullable[@dom.Node],
*** Update File: <WORKDIR>/rabbita/internal/vdom/hydrate.mbt
@@
 #cfg(target="js")
 fn recover_mismatch(
   vnode : VNode,
-  scheduler : &Scheduler,
+  scheduler : &SchedulerRenamed,
   captured_link_listener : @dom.Listener,
   parent : @dom.Node,
   current : @dom.Node?,
@@
   children : Children[VNode],
   namespace_uri : String?,
   element : @dom.Element,
-  scheduler : &Scheduler,
+  scheduler : &SchedulerRenamed,
   captured_link_listener : @dom.Listener,
   allow_skip_children~ : Bool,
 ) -> INode {
@@
 #cfg(target="js")
 fn hydrate_fragment(
   children : Array[VNode],
-  scheduler : &Scheduler,
+  scheduler : &SchedulerRenamed,
   captured_link_listener : @dom.Listener,
   parent : @dom.Node,
   current : @dom.Node?,
@@
 #cfg(target="js")
 fn hydrate_node(
   vnode : VNode,
-  scheduler : &Scheduler,
+  scheduler : &SchedulerRenamed,
   captured_link_listener : @dom.Listener,
   parent : @dom.Node,
   current : @dom.Node?,
@@
 fn hydrate_children(
   children : Children[VNode],
   current : @dom.Node?,
-  scheduler : &Scheduler,
+  scheduler : &SchedulerRenamed,
   captured_link_listener : @dom.Listener,
   parent : @dom.Node,
   boundary~ : @dom.Node?,
@@
 #cfg(target="js")
 fn hydrate_root(
   vnode : VNode,
-  scheduler : &Scheduler,
+  scheduler : &SchedulerRenamed,
   captured_link_listener : @dom.Listener,
 ) -> INode {
   match vnode {
*** Update File: <WORKDIR>/rabbita/internal/vdom/vdom.mbt
@@
 ///|
-using @cmd {trait Scheduler}
+using @cmd {trait SchedulerRenamed}
 
 ///|
 #warnings("-unused_constructor")
@@
 
 ///|
 pub struct Props {
-  handlers : Map[String, (Event, &Scheduler) -> Unit]
+  handlers : Map[String, (Event, &SchedulerRenamed) -> Unit]
   attrs : Map[String, String]
   props : Map[String, @variant.Variant]
   styles : Map[String, String]
@@
   attrs : Map[String, String],
   props : Map[String, @variant.Variant],
   styles : Map[String, String],
-  handlers : Map[String, (Event, &Scheduler) -> Unit],
+  handlers : Map[String, (Event, &SchedulerRenamed) -> Unit],
 ) -> Props {
   { handlers, attrs, styles, props, }
 }
*** End Patch

```
