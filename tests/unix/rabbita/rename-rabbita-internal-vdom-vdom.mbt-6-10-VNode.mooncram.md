# rabbita rename VNode rabbita/internal/vdom/vdom.mbt:6:10

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
$ run_moon_ide moon ide rename 'VNode' 'VNodeRenamed' --loc 'rabbita/internal/vdom/vdom.mbt:6:10'
*** Begin Patch
*** Update File: <WORKDIR>/rabbita/html/html.mbt
@@
 ///|
-using @vdom {type Children, type VNode}
+using @vdom {type Children, type VNodeRenamed}
 
 ///|
 using @cmd {type Cmd, type Emit}
@@
 ///|
 /// An HTML value produced by the constructors in this package.
 #alias(T)
-pub(all) struct Html(@vdom.VNode) derive(Eq)
+pub(all) struct Html(@vdom.VNodeRenamed) derive(Eq)
 
 ///|
-pub fn Html::to_virtual_dom(self : Html) -> @vdom.VNode {
+pub fn Html::to_virtual_dom(self : Html) -> @vdom.VNodeRenamed {
   self.0
 }
 
 ///|
-pub fn Html::from_vnode(vdom : @vdom.VNode) -> Html {
+pub fn Html::from_vnode(vdom : @vdom.VNodeRenamed) -> Html {
   Html(vdom)
 }
 
@@
 
 ///|
 pub fn fragment(children : Array[Html]) -> Html {
-  @vdom.VNode::fragment(children.map(x => x.0))
+  @vdom.VNodeRenamed::fragment(children.map(x => x.0))
 }
 
 ///|
@@
   push_style(style, attrs)
   push_class(class, attrs)
   push_id(id, attrs)
-  @vdom.VNode::link(attrs.to_props(), children, escape~)
+  @vdom.VNodeRenamed::link(attrs.to_props(), children, escape~)
 }
 
 ///|
*** Update File: <WORKDIR>/rabbita/internal/runtime/ambient.mbt
@@
 ///|
-pub using @vdom {type Children, type Props, type VNode, type VDom}
+pub using @vdom {type Children, type Props, type VNodeRenamed, type VDom}
 
 ///|
 using @cmd {trait Context, trait Scheduler}
@@
 const RABBITA_TRANSCRIPT_ID = "__rabbita_transcript"
 
 ///|
-type GraphBuilder = () -> @duplix.Node[@vdom.VNode]
+type GraphBuilder = () -> @duplix.Node[@vdom.VNodeRenamed]
 
 ///|
 pub trait Host: Scheduler {
*** Update File: <WORKDIR>/rabbita/internal/vdom/diff.mbt
@@
 #cfg(target="js")
 fn insert_children(
   node : @dom.Node,
-  children : Children[VNode],
+  children : Children[VNodeRenamed],
   scheduler : &Scheduler,
   captured_link_listener : @dom.Listener,
 ) -> Children[INode] {
@@
 
 ///|
 #cfg(target="js")
-fn VNode::insert(
+fn VNodeRenamed::insert(
   self : Self,
   scheduler : &Scheduler,
   captured_link_listener : @dom.Listener,
@@
 
 ///|
 #cfg(target="js")
-fn INode::to_vnode(self : Self) -> VNode {
+fn INode::to_vnode(self : Self) -> VNodeRenamed {
   match self {
     Elem(tag, mounted_props, children, namespace_uri~, _) =>
       Elem(
@@
 
 ///|
 #cfg(target="js")
-fn VDom::to_vnode(self : Self) -> VNode {
+fn VDom::to_vnode(self : Self) -> VNodeRenamed {
   self.inode.to_vnode()
 }
 
@@
 
 ///|
 #cfg(target="js")
-pub fn VDom::update(self : Self, root : VNode, scheduler : &Scheduler) -> Unit {
+pub fn VDom::update(self : Self, root : VNodeRenamed, scheduler : &Scheduler) -> Unit {
   self.inode = diff_document(
     self.inode,
     root,
@@
 ///|
 #cfg(target="js")
 pub fn VDom::initialize_with_hydration(
-  vnode : VNode,
+  vnode : VNodeRenamed,
   scheduler : &Scheduler,
 ) -> VDom {
   let captured_link_listener = new_captured_link_listener(scheduler)
@@
 ///|
 #cfg(target="js")
 pub fn VDom::initialize(
-  vnode : VNode,
+  vnode : VNodeRenamed,
   scheduler : &Scheduler,
   target_element_id? : String,
 ) -> VDom {
@@
 #cfg(target="js")
 fn diff_document(
   old : INode,
-  new : VNode,
+  new : VNodeRenamed,
   scheduler : &Scheduler,
   container? : @dom.Element,
   captured_link_listener~ : @dom.Listener,
@@
 #cfg(target="js")
 fn diff_node(
   old : INode,
-  new : VNode,
+  new : VNodeRenamed,
   scheduler : &Scheduler,
   captured_link_listener : @dom.Listener,
   parent : @dom.Node,
@@
 #cfg(target="js")
 fn diff_children(
   old : Children[INode],
-  new : Children[VNode],
+  new : Children[VNodeRenamed],
   scheduler : &Scheduler,
   captured_link_listener : @dom.Listener,
   parent : @dom.Node,
*** Update File: <WORKDIR>/rabbita/internal/vdom/hydrate.mbt
@@
 /// identity-bearing attributes of `meta`, `link`, and `script` are also checked to
 /// avoid claiming the wrong same-tag sibling while skipping externally injected nodes.
 #cfg(target="js")
-fn node_matches(vnode : VNode, node : @dom.Node) -> Bool {
+fn node_matches(vnode : VNodeRenamed, node : @dom.Node) -> Bool {
   fn element_identity_matches(
     element : @dom.Element,
     tag : String,
@@
 /// Finds a DOM node that `vnode` can claim without crossing `boundary`.
 #cfg(target="js")
 fn find_hydratable(
-  vnode : VNode,
+  vnode : VNodeRenamed,
   current : @dom.Node?,
   boundary : @dom.Node?,
   allow_skip~ : Bool,
@@
 ///|
 #cfg(target="js")
 fn recover_mismatch(
-  vnode : VNode,
+  vnode : VNodeRenamed,
   scheduler : &Scheduler,
   captured_link_listener : @dom.Listener,
   parent : @dom.Node,
@@
 fn hydrate_existing_element(
   tag : String,
   props : Props,
-  children : Children[VNode],
+  children : Children[VNodeRenamed],
   namespace_uri : String?,
   element : @dom.Element,
   scheduler : &Scheduler,
@@
 ///|
 #cfg(target="js")
 fn hydrate_fragment(
-  children : Array[VNode],
+  children : Array[VNodeRenamed],
   scheduler : &Scheduler,
   captured_link_listener : @dom.Listener,
   parent : @dom.Node,
@@
 ///|
 #cfg(target="js")
 fn hydrate_node(
-  vnode : VNode,
+  vnode : VNodeRenamed,
   scheduler : &Scheduler,
   captured_link_listener : @dom.Listener,
   parent : @dom.Node,
@@
 ///|
 #cfg(target="js")
 fn hydrate_children(
-  children : Children[VNode],
+  children : Children[VNodeRenamed],
   current : @dom.Node?,
   scheduler : &Scheduler,
   captured_link_listener : @dom.Listener,
@@
 ///|
 #cfg(target="js")
 fn hydrate_root(
-  vnode : VNode,
+  vnode : VNodeRenamed,
   scheduler : &Scheduler,
   captured_link_listener : @dom.Listener,
 ) -> INode {
*** Update File: <WORKDIR>/rabbita/internal/vdom/ssr.mbt
@@
 ///|
 fn vnode_to_string(
   buf : StringBuilder,
-  vnode : VNode,
+  vnode : VNodeRenamed,
   in_raw_text_element : Bool,
 ) -> Unit {
   match vnode {
@@
 ///|
 fn children_to_string(
   buf : StringBuilder,
-  children : Children[VNode],
+  children : Children[VNodeRenamed],
   in_raw_text_element : Bool,
 ) -> Unit {
   match children {
@@
 }
 
 ///|
-pub fn server_side_render(render : () -> VNode) -> String {
+pub fn server_side_render(render : () -> VNodeRenamed) -> String {
   let vnode = render()
   let buf = StringBuilder()
   buf.write_string("<!DOCTYPE html>")
*** Update File: <WORKDIR>/rabbita/internal/vdom/ssr_wbtest.mbt
@@
 ///|
 test "SSR applies raw-text rules inside script and style elements" {
   let props = Props::new({}, {}, {}, {})
-  let script = VNode::elem(
+  let script = VNodeRenamed::elem(
     "script",
     props,
     Array([
-      VNode::text("const comparison = 'a < b && b > c';"),
+      VNodeRenamed::text("const comparison = 'a < b && b > c';"),
-      VNode::fragment([]),
+      VNodeRenamed::fragment([]),
     ]),
   )
   inspect(
@@
     ),
   )
 
-  let style = VNode::elem(
+  let style = VNodeRenamed::elem(
     "style",
     props,
-    Array([VNode::text("a > b { content: '<&>'; }")]),
+    Array([VNodeRenamed::text("a > b { content: '<&>'; }")]),
   )
   inspect(
     server_side_render(() => style),
@@
 
 ///|
 test "SSR keeps escaping text in normal elements" {
-  let div = VNode::elem(
+  let div = VNodeRenamed::elem(
     "div",
     Props::new({}, {}, {}, {}),
-    Array([VNode::text("a < b && b > c")]),
+    Array([VNodeRenamed::text("a < b && b > c")]),
   )
   inspect(
     server_side_render(() => div),
*** Update File: <WORKDIR>/rabbita/internal/vdom/vdom.mbt
@@
 
 ///|
 #warnings("-unused_constructor")
-pub enum VNode {
+pub enum VNodeRenamed {
-  Elem(String, Props, Children[VNode], namespace_uri~ : String?)
+  Elem(String, Props, Children[VNodeRenamed], namespace_uri~ : String?)
   Text(String)
-  Frag(Array[VNode])
+  Frag(Array[VNodeRenamed])
-  Thunk(Int, () -> VNode)
+  Thunk(Int, () -> VNodeRenamed)
 }
 
 ///|
-pub impl Eq for VNode with fn equal(a, b) {
+pub impl Eq for VNodeRenamed with fn equal(a, b) {
   physical_equal(a, b)
 }
 
@@
 }
 
 ///|
-pub fn VNode::thunk(hash : Int, f : () -> VNode) -> VNode {
+pub fn VNodeRenamed::thunk(hash : Int, f : () -> VNodeRenamed) -> VNodeRenamed {
-  VNode::Thunk(hash, f)
+  VNodeRenamed::Thunk(hash, f)
 }
 
 ///|
-pub fn VNode::elem(
+pub fn VNodeRenamed::elem(
   tag : String,
   props : Props,
-  children : Children[VNode],
+  children : Children[VNodeRenamed],
   namespace_uri? : String,
-) -> VNode {
+) -> VNodeRenamed {
   Elem(tag, props, children, namespace_uri~)
 }
 
 ///|
-pub fn VNode::text(s : String) -> VNode {
+pub fn VNodeRenamed::text(s : String) -> VNodeRenamed {
   Text(s)
 }
 
 ///|
-pub fn VNode::link(
+pub fn VNodeRenamed::link(
   props : Props,
-  children : Children[VNode],
+  children : Children[VNodeRenamed],
   escape? : Bool = false,
-) -> VNode {
+) -> VNodeRenamed {
   let tag = if escape { "a" } else { CAPTURED_LINK_TAG }
-  VNode::elem(tag, props, children)
+  VNodeRenamed::elem(tag, props, children)
 }
 
 ///|
-pub fn VNode::fragment(childs : Array[VNode]) -> VNode {
+pub fn VNodeRenamed::fragment(childs : Array[VNodeRenamed]) -> VNodeRenamed {
   Frag(childs)
 }
 
 ///|
-pub fn VNode::document(props : Props, head : VNode, body : VNode) -> VNode {
+pub fn VNodeRenamed::document(props : Props, head : VNodeRenamed, body : VNodeRenamed) -> VNodeRenamed {
   Elem("html", props, Array([head, body]), namespace_uri=None)
 }
 
*** Update File: <WORKDIR>/rabbita/internal/vdom/vdom_relocation_wbtest.mbt
@@
       ("second", INode::Text("second", second)),
     ]),
   )
-  let new : Children[VNode] = Map(
+  let new : Children[VNodeRenamed] = Map(
     Map::from_array([
-      ("first", VNode::text("first")),
+      ("first", VNodeRenamed::text("first")),
-      ("second", VNode::text("second")),
+      ("second", VNodeRenamed::text("second")),
     ]),
   )
 
*** Update File: <WORKDIR>/rabbita/svg/svg.mbt
@@
 ///|
 #alias(T)
-pub(all) struct Svg(@vdom.VNode)
+pub(all) struct Svg(@vdom.VNodeRenamed)
 
 ///|
-pub fn Svg::to_virtual_dom(self : Svg) -> @vdom.VNode {
+pub fn Svg::to_virtual_dom(self : Svg) -> @vdom.VNodeRenamed {
   self.0
 }
 
@@
 }
 
 ///|
-pub fn Svg::from_vnode(vdom : @vdom.VNode) -> Svg {
+pub fn Svg::from_vnode(vdom : @vdom.VNodeRenamed) -> Svg {
   Svg(vdom)
 }
 
@@
   children : Array[Svg],
   ns? : String = @dom.namespace_svg,
 ) -> Svg {
-  let vnode = @vdom.VNode::elem(
+  let vnode = @vdom.VNodeRenamed::elem(
     tag,
     attrs.to_props(),
     Array(children.map(x => x.0)),
@@
 
 ///|
 pub fn text(value : String) -> Svg {
-  Svg(@vdom.VNode::text(value))
+  Svg(@vdom.VNodeRenamed::text(value))
 }
 
 ///|
*** End Patch

```
