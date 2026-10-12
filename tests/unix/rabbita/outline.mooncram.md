# rabbita outline

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
$ run_moon_ide moon ide outline 'e2e/apps/rui/fixture/fixture.mbt'
 2 |using @rabbita {type Html, type Val}
   |...
 5 |pub fn section(id : String, title : String, body : Array[Html]) -> Html {
   |...
24 |pub fn mount(name : String, app : () -> Val[Html]) -> Unit {
   |...

```

```mooncram
$ run_moon_ide moon ide outline 'e2e/apps/rui/message-scroller/message_scroller.mbt'
 2 |fn fixture_scroll_items(prefix : String) -> Array[Html] {
   |...
17 |fn message_scroller_fixture() -> Val[Html] {
   |...

```

```mooncram
$ run_moon_ide moon ide outline 'e2e/apps/rui/toast/main.mbt'
2 |using @rabbita {type Html, type Val}
  |...
5 |using @html {div}
  |...
8 |fn main {
  |...

```

```mooncram
$ run_moon_ide moon ide outline 'rabbita/clipboard/clipboard.mbt'
 2 |pub(all) enum Item {
   |...
13 |pub fn copy(item : Item, copied? : Cmd, failed? : (String) -> Cmd) -> Cmd {
   |...
23 |pub fn paste(pasted~ : (Item) -> Cmd, failed? : (String) -> Cmd) -> Cmd {
   |...

```

```mooncram
$ run_moon_ide moon ide outline 'rabbita/dom/gpu_canvas_context.mbt'
2 |#cfg(target="js")
3 |#external
4 |type GPUCanvasContext
  |...

```

```mooncram
$ run_moon_ide moon ide outline 'rabbita/internal/vdom/diff.mbt'
  2 |#cfg(target="js")
  3 |struct VDom {
    |...
 10 |#cfg(not(target="js"))
 11 |pub struct VDom {
    |...
 16 |#cfg(target="js")
 17 |priv struct IProps {
    |...
 23 |#cfg(target="js")
 24 |priv enum INode {
    |...
 32 |#cfg(target="js")
 33 |fn INode::start(self : Self) -> @dom.Node {
    |...
 42 |#cfg(target="js")
 43 |fn INode::end(self : Self) -> @dom.Node {
    |...
 52 |#cfg(target="js")
 53 |fn INode::needs_relocation(
 54 |  self : Self,
 55 |  anchor : @js.Nullable[@dom.Node],
 56 |) -> Bool {
    |...
 65 |#cfg(target="js")
 66 |fn INode::remove(self : Self, parent : @dom.Node) -> Unit {
    |...
 85 |#cfg(target="js")
 86 |fn INode::relocate(
 87 |  self : Self,
 88 |  parent : @dom.Node,
 89 |  before : @js.Nullable[@dom.Node],
 90 |) -> Unit {
    |...
118 |#cfg(target="js")
119 |fn insert_props(
120 |  element : @dom.Element,
121 |  tag : String,
122 |  props : Props,
123 |  scheduler : &Scheduler,
124 |  captured_link_listener : @dom.Listener,
125 |) -> IProps {
    |...
156 |#cfg(target="js")
157 |fn reapply_child_sensitive_properties(
158 |  element : @dom.Element,
159 |  tag : String,
160 |  props : Props,
161 |) -> Unit {
    |...
171 |#cfg(target="js")
172 |fn insert_children(
173 |  node : @dom.Node,
174 |  children : Children[VNode],
175 |  scheduler : &Scheduler,
176 |  captured_link_listener : @dom.Listener,
177 |) -> Children[INode] {
    |...
205 |#cfg(target="js")
206 |fn VNode::insert(
207 |  self : Self,
208 |  scheduler : &Scheduler,
209 |  captured_link_listener : @dom.Listener,
210 |  parent : @dom.Node,
211 |  before : @js.Nullable[@dom.Node],
212 |) -> INode {
    |...
268 |#cfg(target="js")
269 |fn INode::to_vnode(self : Self) -> VNode {
    |...
285 |#cfg(target="js")
286 |fn VDom::to_vnode(self : Self) -> VNode {
    |...
291 |#cfg(not(target="js"))
292 |fn VDom::to_vnode(self : Self) -> VNode {
    |...
297 |pub fn VDom::to_string(self : Self) -> String {
    |...
302 |#cfg(target="js")
303 |fn[A] nullable(value : A) -> @js.Nullable[A] {
    |...
308 |#cfg(target="js")
309 |fn[A] null() -> @js.Nullable[A] {
    |...
314 |#cfg(target="js")
315 |pub fn VDom::update(self : Self, root : VNode, scheduler : &Scheduler) -> Unit {
    |...
326 |#cfg(not(target="js"))
327 |pub fn VDom::update(self : Self, vnode : VNode, _ : &Scheduler) -> Unit {
    |...
332 |#cfg(target="js")
333 |pub fn VDom::initialize_with_hydration(
334 |  vnode : VNode,
335 |  scheduler : &Scheduler,
336 |) -> VDom {
    |...
343 |#cfg(target="js")
344 |fn new_captured_link_listener(scheduler : &Scheduler) -> @dom.Listener {
    |...
362 |#cfg(target="js")
363 |pub fn VDom::initialize(
364 |  vnode : VNode,
365 |  scheduler : &Scheduler,
366 |  target_element_id? : String,
367 |) -> VDom {
    |...
443 |#cfg(not(target="js"))
444 |pub fn VDom::initialize(
445 |  vnode : VNode,
446 |  _ : &Scheduler,
447 |  target_element_id? : String,
448 |) -> VDom {
    |...
454 |#cfg(target="js")
455 |fn diff_document(
456 |  old : INode,
457 |  new : VNode,
458 |  scheduler : &Scheduler,
459 |  container? : @dom.Element,
460 |  captured_link_listener~ : @dom.Listener,
461 |) -> INode {
    |...
535 |#cfg(target="js")
536 |fn diff_node(
537 |  old : INode,
538 |  new : VNode,
539 |  scheduler : &Scheduler,
540 |  captured_link_listener : @dom.Listener,
541 |  parent : @dom.Node,
542 |  anchor : @js.Nullable[@dom.Node],
543 |) -> INode {
    |...
601 |#cfg(target="js")
602 |fn diff_props(
603 |  old : IProps,
604 |  new : Props,
605 |  scheduler : &Scheduler,
606 |  parent : @dom.Element,
607 |) -> IProps {
    |...
681 |#cfg(target="js")
682 |fn diff_children(
683 |  old : Children[INode],
684 |  new : Children[VNode],
685 |  scheduler : &Scheduler,
686 |  captured_link_listener : @dom.Listener,
687 |  parent : @dom.Node,
688 |  anchor : @js.Nullable[@dom.Node],
689 |) -> Children[INode] {
    |...
770 |#cfg(target="js")
771 |fn[A, B] Children::map(self : Children[A], f : (A) -> B) -> Children[B] {
    |...
780 |#cfg(target="js")
781 |fn variant_to_js_value(value : @variant.Variant) -> @js.Value {
    |...

```

```mooncram
$ run_moon_ide moon ide outline 'rabbita/internal/vdom/vdom.mbt'
  2 |using @cmd {trait Scheduler}
    |...
  5 |#warnings("-unused_constructor")
  6 |pub enum VNode {
    |...
 14 |pub impl Eq for VNode with fn equal(a, b) {
    |...
 19 |pub extend VNode with Eq::{equal, not_equal}
    |...
 22 |const CAPTURED_LINK_TAG : String = "RABBITA_CAPTURED_LINK"
    |...
 25 |const FRAGMENT_START_MARKER : String = "["
    |...
 28 |const FRAGMENT_END_MARKER : String = "]"
    |...
 31 |fn rendered_tag(tag : String) -> String {
    |...
 40 |#cfg(target="js")
 41 |fn is_captured_link_tag(tag : String) -> Bool {
    |...
 46 |fn is_html_void_element(tag : String) -> Bool {
    |...
 67 |pub fn VNode::thunk(hash : Int, f : () -> VNode) -> VNode {
    |...
 72 |pub fn VNode::elem(
 73 |  tag : String,
 74 |  props : Props,
 75 |  children : Children[VNode],
 76 |  namespace_uri? : String,
 77 |) -> VNode {
    |...
 82 |pub fn VNode::text(s : String) -> VNode {
    |...
 87 |pub fn VNode::link(
 88 |  props : Props,
 89 |  children : Children[VNode],
 90 |  escape? : Bool = false,
 91 |) -> VNode {
    |...
 97 |pub fn VNode::fragment(childs : Array[VNode]) -> VNode {
    |...
102 |pub fn VNode::document(props : Props, head : VNode, body : VNode) -> VNode {
    |...
107 |pub(all) enum Children[T] {
    |...
114 |#cfg(target="js")
115 |type Event = @dom.Event
    |...
118 |#cfg(not(target="js"))
119 |type Event = Unit
    |...
122 |pub struct Props {
    |...
130 |pub fn Props::new(
131 |  attrs : Map[String, String],
132 |  props : Map[String, @variant.Variant],
133 |  styles : Map[String, String],
134 |  handlers : Map[String, (Event, &Scheduler) -> Unit],
135 |) -> Props {
    |...
140 |fn[K : Eq + Hash, V] copy_map(src : Map[K, V]) -> Map[K, V] {
    |...
149 |pub fn Props::copy(self : Props) -> Props {
    |...

```

```mooncram
$ run_moon_ide moon ide outline 'warren/path/sourcetree_path.mbt'
 2 |pub type Path = @p.Path
   |...
 5 |struct SourcePath(String) derive(Eq, Compare, Hash)
   |...
 8 |pub extend SourcePath with Eq::{equal, not_equal}
   |...
11 |pub extend SourcePath with Compare::{compare, op_ge, op_gt, op_le, op_lt}
   |...
14 |pub extend SourcePath with Hash::{hash, hash_combine}
   |...
17 |pub impl Debug for SourcePath with fn to_repr(self) {
   |...
22 |pub extend SourcePath with Debug::{to_repr}
   |...
25 |pub fn SourcePath::new(s : String) -> Self {
   |...
30 |pub impl Show for SourcePath with fn output(self, buf) {
   |...
35 |pub extend SourcePath with Show::{output, to_string}
   |...
38 |pub fn SourcePath::join(a : Self, b : String) -> Self {
   |...
43 |pub fn SourcePath::relative(a : Self, base : SourcePath) -> String {
   |...

```

```mooncram
$ run_moon_ide moon ide outline 'warren/templates/minimized/main.mbt'
 1 |using @rabbita { type Val, type Html }
   |...
 2 |using @html { button, div, h1 }
   |...
 4 |enum Msg {
   |...
 9 |fn app() -> Val[Html] {
   |...
29 |fn main {
   |...

```

```mooncram
$ run_moon_ide moon ide outline 'warren/templates/server/cmd/server/main.mbt'
2 |async fn main {
  |...

```
