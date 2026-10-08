# rabbita find-references VNode rabbita/internal/vdom/vdom.mbt:6:10

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
$ run_moon_ide moon ide find-references 'VNode' --loc 'rabbita/internal/vdom/vdom.mbt:6:10'
Found 68 references for symbol 'VNode':
<WORKDIR>/rabbita/html/html.mbt:2:34-2:39:
  | ///|
2 | using @vdom {type Children, type VNode}
  |                                  ^^^^^
  | 
  | ///|

<WORKDIR>/rabbita/html/html.mbt:10:28-10:33:
   | ///|
   | /// An HTML value produced by the constructors in this package.
   | #alias(T)
10 | pub(all) struct Html(@vdom.VNode) derive(Eq)
   |                            ^^^^^
   | 
   | ///|

<WORKDIR>/rabbita/html/html.mbt:13:51-13:56:
   | pub(all) struct Html(@vdom.VNode) derive(Eq)
   | 
   | ///|
13 | pub fn Html::to_virtual_dom(self : Html) -> @vdom.VNode {
   |                                                   ^^^^^
   |   self.0
   | }

<WORKDIR>/rabbita/html/html.mbt:18:38-18:43:
   | }
   | 
   | ///|
18 | pub fn Html::from_vnode(vdom : @vdom.VNode) -> Html {
   |                                      ^^^^^
   |   Html(vdom)
   | }

<WORKDIR>/rabbita/html/html.mbt:58:9-58:14:
   | 
   | ///|
   | pub fn fragment(children : Array[Html]) -> Html {
58 |   @vdom.VNode::fragment(children.map(x => x.0))
   |         ^^^^^
   | }
   | 

<WORKDIR>/rabbita/html/html.mbt:878:9-878:14:
    |   push_style(style, attrs)
    |   push_class(class, attrs)
    |   push_id(id, attrs)
878 |   @vdom.VNode::link(attrs.to_props(), children, escape~)
    |         ^^^^^
    | }
    | 

<WORKDIR>/rabbita/internal/runtime/ambient.mbt:2:50-2:55:
  | ///|
2 | pub using @vdom {type Children, type Props, type VNode, type VDom}
  |                                                  ^^^^^
  | 
  | ///|

<WORKDIR>/rabbita/internal/runtime/ambient.mbt:14:46-14:51:
   | const RABBITA_TRANSCRIPT_ID = "__rabbita_transcript"
   | 
   | ///|
14 | type GraphBuilder = () -> @duplix.Node[@vdom.VNode]
   |                                              ^^^^^
   | 
   | ///|

<WORKDIR>/rabbita/internal/vdom/diff.mbt:174:23-174:28:
    | #cfg(target="js")
    | fn insert_children(
    |   node : @dom.Node,
174 |   children : Children[VNode],
    |                       ^^^^^
    |   scheduler : &Scheduler,
    |   captured_link_listener : @dom.Listener,

<WORKDIR>/rabbita/internal/vdom/diff.mbt:206:4-206:9:
    | 
    | ///|
    | #cfg(target="js")
206 | fn VNode::insert(
    |    ^^^^^
    |   self : Self,
    |   scheduler : &Scheduler,

<WORKDIR>/rabbita/internal/vdom/diff.mbt:269:36-269:41:
    | 
    | ///|
    | #cfg(target="js")
269 | fn INode::to_vnode(self : Self) -> VNode {
    |                                    ^^^^^
    |   match self {
    |     Elem(tag, mounted_props, children, namespace_uri~, _) =>

<WORKDIR>/rabbita/internal/vdom/diff.mbt:286:35-286:40:
    | 
    | ///|
    | #cfg(target="js")
286 | fn VDom::to_vnode(self : Self) -> VNode {
    |                                   ^^^^^
    |   self.inode.to_vnode()
    | }

<WORKDIR>/rabbita/internal/vdom/diff.mbt:315:41-315:46:
    | 
    | ///|
    | #cfg(target="js")
315 | pub fn VDom::update(self : Self, root : VNode, scheduler : &Scheduler) -> Unit {
    |                                         ^^^^^
    |   self.inode = diff_document(
    |     self.inode,

<WORKDIR>/rabbita/internal/vdom/diff.mbt:334:11-334:16:
    | ///|
    | #cfg(target="js")
    | pub fn VDom::initialize_with_hydration(
334 |   vnode : VNode,
    |           ^^^^^
    |   scheduler : &Scheduler,
    | ) -> VDom {

<WORKDIR>/rabbita/internal/vdom/diff.mbt:364:11-364:16:
    | ///|
    | #cfg(target="js")
    | pub fn VDom::initialize(
364 |   vnode : VNode,
    |           ^^^^^
    |   scheduler : &Scheduler,
    |   target_element_id? : String,

<WORKDIR>/rabbita/internal/vdom/diff.mbt:457:9-457:14:
    | #cfg(target="js")
    | fn diff_document(
    |   old : INode,
457 |   new : VNode,
    |         ^^^^^
    |   scheduler : &Scheduler,
    |   container? : @dom.Element,

<WORKDIR>/rabbita/internal/vdom/diff.mbt:538:9-538:14:
    | #cfg(target="js")
    | fn diff_node(
    |   old : INode,
538 |   new : VNode,
    |         ^^^^^
    |   scheduler : &Scheduler,
    |   captured_link_listener : @dom.Listener,

<WORKDIR>/rabbita/internal/vdom/diff.mbt:680:18-680:23:
    | #cfg(target="js")
    | fn diff_children(
    |   old : Children[INode],
680 |   new : Children[VNode],
    |                  ^^^^^
    |   scheduler : &Scheduler,
    |   captured_link_listener : @dom.Listener,

<WORKDIR>/rabbita/internal/vdom/hydrate.mbt:19:25-19:30:
   | /// identity-bearing attributes of `meta`, `link`, and `script` are also checked to
   | /// avoid claiming the wrong same-tag sibling while skipping externally injected nodes.
   | #cfg(target="js")
19 | fn node_matches(vnode : VNode, node : @dom.Node) -> Bool {
   |                         ^^^^^
   |   fn element_identity_matches(
   |     element : @dom.Element,

<WORKDIR>/rabbita/internal/vdom/hydrate.mbt:87:11-87:16:
   | /// Finds a DOM node that `vnode` can claim without crossing `boundary`.
   | #cfg(target="js")
   | fn find_hydratable(
87 |   vnode : VNode,
   |           ^^^^^
   |   current : @dom.Node?,
   |   boundary : @dom.Node?,

<WORKDIR>/rabbita/internal/vdom/hydrate.mbt:111:11-111:16:
    | ///|
    | #cfg(target="js")
    | fn recover_mismatch(
111 |   vnode : VNode,
    |           ^^^^^
    |   scheduler : &Scheduler,
    |   captured_link_listener : @dom.Listener,

<WORKDIR>/rabbita/internal/vdom/hydrate.mbt:153:23-153:28:
    | fn hydrate_existing_element(
    |   tag : String,
    |   props : Props,
153 |   children : Children[VNode],
    |                       ^^^^^
    |   namespace_uri : String?,
    |   element : @dom.Element,

<WORKDIR>/rabbita/internal/vdom/hydrate.mbt:189:20-189:25:
    | ///|
    | #cfg(target="js")
    | fn hydrate_fragment(
189 |   children : Array[VNode],
    |                    ^^^^^
    |   scheduler : &Scheduler,
    |   captured_link_listener : @dom.Listener,

<WORKDIR>/rabbita/internal/vdom/hydrate.mbt:271:11-271:16:
    | ///|
    | #cfg(target="js")
    | fn hydrate_node(
271 |   vnode : VNode,
    |           ^^^^^
    |   scheduler : &Scheduler,
    |   captured_link_listener : @dom.Listener,

<WORKDIR>/rabbita/internal/vdom/hydrate.mbt:339:23-339:28:
    | ///|
    | #cfg(target="js")
    | fn hydrate_children(
339 |   children : Children[VNode],
    |                       ^^^^^
    |   current : @dom.Node?,
    |   scheduler : &Scheduler,

<WORKDIR>/rabbita/internal/vdom/hydrate.mbt:393:11-393:16:
    | ///|
    | #cfg(target="js")
    | fn hydrate_root(
393 |   vnode : VNode,
    |           ^^^^^
    |   scheduler : &Scheduler,
    |   captured_link_listener : @dom.Listener,

<WORKDIR>/rabbita/internal/vdom/ssr.mbt:131:11-131:16:
    | ///|
    | fn vnode_to_string(
    |   buf : StringBuilder,
131 |   vnode : VNode,
    |           ^^^^^
    |   in_raw_text_element : Bool,
    | ) -> Unit {

<WORKDIR>/rabbita/internal/vdom/ssr.mbt:204:23-204:28:
    | ///|
    | fn children_to_string(
    |   buf : StringBuilder,
204 |   children : Children[VNode],
    |                       ^^^^^
    |   in_raw_text_element : Bool,
    | ) -> Unit {

<WORKDIR>/rabbita/internal/vdom/ssr.mbt:221:42-221:47:
    | }
    | 
    | ///|
221 | pub fn server_side_render(render : () -> VNode) -> String {
    |                                          ^^^^^
    |   let vnode = render()
    |   let buf = StringBuilder()

<WORKDIR>/rabbita/internal/vdom/ssr_wbtest.mbt:4:16-4:21:
  | ///|
  | test "SSR applies raw-text rules inside script and style elements" {
  |   let props = Props::new({}, {}, {}, {})
4 |   let script = VNode::elem(
  |                ^^^^^
  |     "script",
  |     props,

<WORKDIR>/rabbita/internal/vdom/ssr_wbtest.mbt:8:7-8:12:
  |     "script",
  |     props,
  |     Array([
8 |       VNode::text("const comparison = 'a < b && b > c';"),
  |       ^^^^^
  |       VNode::fragment([]),
  |     ]),

<WORKDIR>/rabbita/internal/vdom/ssr_wbtest.mbt:9:7-9:12:
  |     props,
  |     Array([
  |       VNode::text("const comparison = 'a < b && b > c';"),
9 |       VNode::fragment([]),
  |       ^^^^^
  |     ]),
  |   )

<WORKDIR>/rabbita/internal/vdom/ssr_wbtest.mbt:19:15-19:20:
   |     ),
   |   )
   | 
19 |   let style = VNode::elem(
   |               ^^^^^
   |     "style",
   |     props,

<WORKDIR>/rabbita/internal/vdom/ssr_wbtest.mbt:22:12-22:17:
   |   let style = VNode::elem(
   |     "style",
   |     props,
22 |     Array([VNode::text("a > b { content: '<&>'; }")]),
   |            ^^^^^
   |   )
   |   inspect(

<WORKDIR>/rabbita/internal/vdom/ssr_wbtest.mbt:34:13-34:18:
   | 
   | ///|
   | test "SSR keeps escaping text in normal elements" {
34 |   let div = VNode::elem(
   |             ^^^^^
   |     "div",
   |     Props::new({}, {}, {}, {}),

<WORKDIR>/rabbita/internal/vdom/ssr_wbtest.mbt:37:12-37:17:
   |   let div = VNode::elem(
   |     "div",
   |     Props::new({}, {}, {}, {}),
37 |     Array([VNode::text("a < b && b > c")]),
   |            ^^^^^
   |   )
   |   inspect(

<WORKDIR>/rabbita/internal/vdom/vdom.mbt:7:32-7:37:
  | ///|
  | #warnings("-unused_constructor")
  | pub enum VNode {
7 |   Elem(String, Props, Children[VNode], namespace_uri~ : String?)
  |                                ^^^^^
  |   Text(String)
  |   Frag(Array[VNode])

<WORKDIR>/rabbita/internal/vdom/vdom.mbt:9:14-9:19:
  | pub enum VNode {
  |   Elem(String, Props, Children[VNode], namespace_uri~ : String?)
  |   Text(String)
9 |   Frag(Array[VNode])
  |              ^^^^^
  |   Thunk(Int, () -> VNode)
  | }

<WORKDIR>/rabbita/internal/vdom/vdom.mbt:10:20-10:25:
   |   Elem(String, Props, Children[VNode], namespace_uri~ : String?)
   |   Text(String)
   |   Frag(Array[VNode])
10 |   Thunk(Int, () -> VNode)
   |                    ^^^^^
   | }
   | 

<WORKDIR>/rabbita/internal/vdom/vdom.mbt:14:17-14:22:
   | }
   | 
   | ///|
14 | pub impl Eq for VNode with fn equal(a, b) {
   |                 ^^^^^
   |   physical_equal(a, b)
   | }

<WORKDIR>/rabbita/internal/vdom/vdom.mbt:64:8-64:13:
   | }
   | 
   | ///|
64 | pub fn VNode::thunk(hash : Int, f : () -> VNode) -> VNode {
   |        ^^^^^
   |   VNode::Thunk(hash, f)
   | }

<WORKDIR>/rabbita/internal/vdom/vdom.mbt:64:43-64:48:
   | }
   | 
   | ///|
64 | pub fn VNode::thunk(hash : Int, f : () -> VNode) -> VNode {
   |                                           ^^^^^
   |   VNode::Thunk(hash, f)
   | }

<WORKDIR>/rabbita/internal/vdom/vdom.mbt:64:53-64:58:
   | }
   | 
   | ///|
64 | pub fn VNode::thunk(hash : Int, f : () -> VNode) -> VNode {
   |                                                     ^^^^^
   |   VNode::Thunk(hash, f)
   | }

<WORKDIR>/rabbita/internal/vdom/vdom.mbt:65:3-65:8:
   | 
   | ///|
   | pub fn VNode::thunk(hash : Int, f : () -> VNode) -> VNode {
65 |   VNode::Thunk(hash, f)
   |   ^^^^^
   | }
   | 

<WORKDIR>/rabbita/internal/vdom/vdom.mbt:69:8-69:13:
   | }
   | 
   | ///|
69 | pub fn VNode::elem(
   |        ^^^^^
   |   tag : String,
   |   props : Props,

<WORKDIR>/rabbita/internal/vdom/vdom.mbt:72:23-72:28:
   | pub fn VNode::elem(
   |   tag : String,
   |   props : Props,
72 |   children : Children[VNode],
   |                       ^^^^^
   |   namespace_uri? : String,
   | ) -> VNode {

<WORKDIR>/rabbita/internal/vdom/vdom.mbt:74:6-74:11:
   |   props : Props,
   |   children : Children[VNode],
   |   namespace_uri? : String,
74 | ) -> VNode {
   |      ^^^^^
   |   Elem(tag, props, children, namespace_uri~)
   | }

<WORKDIR>/rabbita/internal/vdom/vdom.mbt:79:8-79:13:
   | }
   | 
   | ///|
79 | pub fn VNode::text(s : String) -> VNode {
   |        ^^^^^
   |   Text(s)
   | }

<WORKDIR>/rabbita/internal/vdom/vdom.mbt:79:35-79:40:
   | }
   | 
   | ///|
79 | pub fn VNode::text(s : String) -> VNode {
   |                                   ^^^^^
   |   Text(s)
   | }

<WORKDIR>/rabbita/internal/vdom/vdom.mbt:84:8-84:13:
   | }
   | 
   | ///|
84 | pub fn VNode::link(
   |        ^^^^^
   |   props : Props,
   |   children : Children[VNode],

<WORKDIR>/rabbita/internal/vdom/vdom.mbt:86:23-86:28:
   | ///|
   | pub fn VNode::link(
   |   props : Props,
86 |   children : Children[VNode],
   |                       ^^^^^
   |   escape? : Bool = false,
   | ) -> VNode {

<WORKDIR>/rabbita/internal/vdom/vdom.mbt:88:6-88:11:
   |   props : Props,
   |   children : Children[VNode],
   |   escape? : Bool = false,
88 | ) -> VNode {
   |      ^^^^^
   |   let tag = if escape { "a" } else { CAPTURED_LINK_TAG }
   |   VNode::elem(tag, props, children)

<WORKDIR>/rabbita/internal/vdom/vdom.mbt:90:3-90:8:
   |   escape? : Bool = false,
   | ) -> VNode {
   |   let tag = if escape { "a" } else { CAPTURED_LINK_TAG }
90 |   VNode::elem(tag, props, children)
   |   ^^^^^
   | }
   | 

<WORKDIR>/rabbita/internal/vdom/vdom.mbt:94:8-94:13:
   | }
   | 
   | ///|
94 | pub fn VNode::fragment(childs : Array[VNode]) -> VNode {
   |        ^^^^^
   |   Frag(childs)
   | }

<WORKDIR>/rabbita/internal/vdom/vdom.mbt:94:39-94:44:
   | }
   | 
   | ///|
94 | pub fn VNode::fragment(childs : Array[VNode]) -> VNode {
   |                                       ^^^^^
   |   Frag(childs)
   | }

<WORKDIR>/rabbita/internal/vdom/vdom.mbt:94:50-94:55:
   | }
   | 
   | ///|
94 | pub fn VNode::fragment(childs : Array[VNode]) -> VNode {
   |                                                  ^^^^^
   |   Frag(childs)
   | }

<WORKDIR>/rabbita/internal/vdom/vdom.mbt:99:8-99:13:
   | }
   | 
   | ///|
99 | pub fn VNode::document(props : Props, head : VNode, body : VNode) -> VNode {
   |        ^^^^^
   |   Elem("html", props, Array([head, body]), namespace_uri=None)
   | }

<WORKDIR>/rabbita/internal/vdom/vdom.mbt:99:46-99:51:
   | }
   | 
   | ///|
99 | pub fn VNode::document(props : Props, head : VNode, body : VNode) -> VNode {
   |                                              ^^^^^
   |   Elem("html", props, Array([head, body]), namespace_uri=None)
   | }

<WORKDIR>/rabbita/internal/vdom/vdom.mbt:99:60-99:65:
   | }
   | 
   | ///|
99 | pub fn VNode::document(props : Props, head : VNode, body : VNode) -> VNode {
   |                                                            ^^^^^
   |   Elem("html", props, Array([head, body]), namespace_uri=None)
   | }

<WORKDIR>/rabbita/internal/vdom/vdom.mbt:99:70-99:75:
   | }
   | 
   | ///|
99 | pub fn VNode::document(props : Props, head : VNode, body : VNode) -> VNode {
   |                                                                      ^^^^^
   |   Elem("html", props, Array([head, body]), namespace_uri=None)
   | }

<WORKDIR>/rabbita/internal/vdom/vdom_relocation_wbtest.mbt:96:22-96:27:
   |       ("second", INode::Text("second", second)),
   |     ]),
   |   )
96 |   let new : Children[VNode] = Map(
   |                      ^^^^^
   |     Map::from_array([
   |       ("first", VNode::text("first")),

<WORKDIR>/rabbita/internal/vdom/vdom_relocation_wbtest.mbt:98:17-98:22:
   |   )
   |   let new : Children[VNode] = Map(
   |     Map::from_array([
98 |       ("first", VNode::text("first")),
   |                 ^^^^^
   |       ("second", VNode::text("second")),
   |     ]),

<WORKDIR>/rabbita/internal/vdom/vdom_relocation_wbtest.mbt:99:18-99:23:
   |   let new : Children[VNode] = Map(
   |     Map::from_array([
   |       ("first", VNode::text("first")),
99 |       ("second", VNode::text("second")),
   |                  ^^^^^
   |     ]),
   |   )

<WORKDIR>/rabbita/svg/svg.mbt:3:27-3:32:
  | ///|
  | #alias(T)
3 | pub(all) struct Svg(@vdom.VNode)
  |                           ^^^^^
  | 
  | ///|

<WORKDIR>/rabbita/svg/svg.mbt:6:49-6:54:
  | pub(all) struct Svg(@vdom.VNode)
  | 
  | ///|
6 | pub fn Svg::to_virtual_dom(self : Svg) -> @vdom.VNode {
  |                                                 ^^^^^
  |   self.0
  | }

<WORKDIR>/rabbita/svg/svg.mbt:16:37-16:42:
   | }
   | 
   | ///|
16 | pub fn Svg::from_vnode(vdom : @vdom.VNode) -> Svg {
   |                                     ^^^^^
   |   Svg(vdom)
   | }

<WORKDIR>/rabbita/svg/svg.mbt:27:21-27:26:
   |   children : Array[Svg],
   |   ns? : String = @dom.namespace_svg,
   | ) -> Svg {
27 |   let vnode = @vdom.VNode::elem(
   |                     ^^^^^
   |     tag,
   |     attrs.to_props(),

<WORKDIR>/rabbita/svg/svg.mbt:46:13-46:18:
   | 
   | ///|
   | pub fn text(value : String) -> Svg {
46 |   Svg(@vdom.VNode::text(value))
   |             ^^^^^
   | }
   | 

```
