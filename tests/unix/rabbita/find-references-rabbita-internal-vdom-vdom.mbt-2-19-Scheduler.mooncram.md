# rabbita find-references Scheduler rabbita/internal/vdom/vdom.mbt:2:19

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
$ run_moon_ide moon ide find-references 'Scheduler' --loc 'rabbita/internal/vdom/vdom.mbt:2:19'
Found 21 references for symbol 'Scheduler':
<WORKDIR>/rabbita/internal/vdom/diff.mbt:19:41-19:50:
   | #cfg(target="js")
   | priv struct IProps {
   |   props : Props
19 |   slots : Map[String, Ref[(@dom.Event, &Scheduler) -> Unit]]
   |                                         ^^^^^^^^^
   | }
   | 

<WORKDIR>/rabbita/internal/vdom/diff.mbt:123:16-123:25:
    |   element : @dom.Element,
    |   tag : String,
    |   props : Props,
123 |   scheduler : &Scheduler,
    |                ^^^^^^^^^
    |   captured_link_listener : @dom.Listener,
    | ) -> IProps {

<WORKDIR>/rabbita/internal/vdom/diff.mbt:127:45-127:54:
    |   captured_link_listener : @dom.Listener,
    | ) -> IProps {
    |   let { handlers, attrs, props: properties, styles, } = props
127 |   let slots : Map[String, Ref[(@dom.Event, &Scheduler) -> Unit]] = Map([])
    |                                             ^^^^^^^^^
    |   for event, handler in handlers {
    |     let slot = @ref.new(handler)

<WORKDIR>/rabbita/internal/vdom/diff.mbt:175:16-175:25:
    | fn insert_children(
    |   node : @dom.Node,
    |   children : Children[VNode],
175 |   scheduler : &Scheduler,
    |                ^^^^^^^^^
    |   captured_link_listener : @dom.Listener,
    | ) -> Children[INode] {

<WORKDIR>/rabbita/internal/vdom/diff.mbt:208:16-208:25:
    | #cfg(target="js")
    | fn VNode::insert(
    |   self : Self,
208 |   scheduler : &Scheduler,
    |                ^^^^^^^^^
    |   captured_link_listener : @dom.Listener,
    |   parent : @dom.Node,

<WORKDIR>/rabbita/internal/vdom/diff.mbt:315:61-315:70:
    | 
    | ///|
    | #cfg(target="js")
315 | pub fn VDom::update(self : Self, root : VNode, scheduler : &Scheduler) -> Unit {
    |                                                             ^^^^^^^^^
    |   self.inode = diff_document(
    |     self.inode,

<WORKDIR>/rabbita/internal/vdom/diff.mbt:335:16-335:25:
    | #cfg(target="js")
    | pub fn VDom::initialize_with_hydration(
    |   vnode : VNode,
335 |   scheduler : &Scheduler,
    |                ^^^^^^^^^
    | ) -> VDom {
    |   let captured_link_listener = new_captured_link_listener(scheduler)

<WORKDIR>/rabbita/internal/vdom/diff.mbt:344:44-344:53:
    | 
    | ///|
    | #cfg(target="js")
344 | fn new_captured_link_listener(scheduler : &Scheduler) -> @dom.Listener {
    |                                            ^^^^^^^^^
    |   event => {
    |     if event.to_mouse_event() is Some(mouse_event) &&

<WORKDIR>/rabbita/internal/vdom/diff.mbt:365:16-365:25:
    | #cfg(target="js")
    | pub fn VDom::initialize(
    |   vnode : VNode,
365 |   scheduler : &Scheduler,
    |                ^^^^^^^^^
    |   target_element_id? : String,
    | ) -> VDom {

<WORKDIR>/rabbita/internal/vdom/diff.mbt:458:16-458:25:
    | fn diff_document(
    |   old : INode,
    |   new : VNode,
458 |   scheduler : &Scheduler,
    |                ^^^^^^^^^
    |   container? : @dom.Element,
    |   captured_link_listener~ : @dom.Listener,

<WORKDIR>/rabbita/internal/vdom/diff.mbt:539:16-539:25:
    | fn diff_node(
    |   old : INode,
    |   new : VNode,
539 |   scheduler : &Scheduler,
    |                ^^^^^^^^^
    |   captured_link_listener : @dom.Listener,
    |   parent : @dom.Node,

<WORKDIR>/rabbita/internal/vdom/diff.mbt:605:16-605:25:
    | fn diff_props(
    |   old : IProps,
    |   new : Props,
605 |   scheduler : &Scheduler,
    |                ^^^^^^^^^
    |   parent : @dom.Element,
    | ) -> IProps {

<WORKDIR>/rabbita/internal/vdom/diff.mbt:681:16-681:25:
    | fn diff_children(
    |   old : Children[INode],
    |   new : Children[VNode],
681 |   scheduler : &Scheduler,
    |                ^^^^^^^^^
    |   captured_link_listener : @dom.Listener,
    |   parent : @dom.Node,

<WORKDIR>/rabbita/internal/vdom/hydrate.mbt:112:16-112:25:
    | #cfg(target="js")
    | fn recover_mismatch(
    |   vnode : VNode,
112 |   scheduler : &Scheduler,
    |                ^^^^^^^^^
    |   captured_link_listener : @dom.Listener,
    |   parent : @dom.Node,

<WORKDIR>/rabbita/internal/vdom/hydrate.mbt:156:16-156:25:
    |   children : Children[VNode],
    |   namespace_uri : String?,
    |   element : @dom.Element,
156 |   scheduler : &Scheduler,
    |                ^^^^^^^^^
    |   captured_link_listener : @dom.Listener,
    |   allow_skip_children~ : Bool,

<WORKDIR>/rabbita/internal/vdom/hydrate.mbt:190:16-190:25:
    | #cfg(target="js")
    | fn hydrate_fragment(
    |   children : Array[VNode],
190 |   scheduler : &Scheduler,
    |                ^^^^^^^^^
    |   captured_link_listener : @dom.Listener,
    |   parent : @dom.Node,

<WORKDIR>/rabbita/internal/vdom/hydrate.mbt:272:16-272:25:
    | #cfg(target="js")
    | fn hydrate_node(
    |   vnode : VNode,
272 |   scheduler : &Scheduler,
    |                ^^^^^^^^^
    |   captured_link_listener : @dom.Listener,
    |   parent : @dom.Node,

<WORKDIR>/rabbita/internal/vdom/hydrate.mbt:341:16-341:25:
    | fn hydrate_children(
    |   children : Children[VNode],
    |   current : @dom.Node?,
341 |   scheduler : &Scheduler,
    |                ^^^^^^^^^
    |   captured_link_listener : @dom.Listener,
    |   parent : @dom.Node,

<WORKDIR>/rabbita/internal/vdom/hydrate.mbt:394:16-394:25:
    | #cfg(target="js")
    | fn hydrate_root(
    |   vnode : VNode,
394 |   scheduler : &Scheduler,
    |                ^^^^^^^^^
    |   captured_link_listener : @dom.Listener,
    | ) -> INode {

<WORKDIR>/rabbita/internal/vdom/vdom.mbt:120:35-120:44:
    | 
    | ///|
    | pub struct Props {
120 |   handlers : Map[String, (Event, &Scheduler) -> Unit]
    |                                   ^^^^^^^^^
    |   attrs : Map[String, String]
    |   props : Map[String, @variant.Variant]

<WORKDIR>/rabbita/internal/vdom/vdom.mbt:131:35-131:44:
    |   attrs : Map[String, String],
    |   props : Map[String, @variant.Variant],
    |   styles : Map[String, String],
131 |   handlers : Map[String, (Event, &Scheduler) -> Unit],
    |                                   ^^^^^^^^^
    | ) -> Props {
    |   { handlers, attrs, styles, props, }

```
