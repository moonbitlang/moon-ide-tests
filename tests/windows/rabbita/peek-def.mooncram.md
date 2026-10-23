# rabbita peek-def

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\rabbita' moon ide peek-def 'Html' --loc 'e2e\apps\rui\fixture\fixture.mbt:2:22'
Definition found at file <WORKDIR>/rabbita\top.mbt
  | 
  | ///|
  | pub using @cmd {none, batch, delay, type Cmd}
  | 
  | ///|
9 | pub using @html {type Html}
  |                       ^^^^
  | 
  | ///|
  | /// A running Rabbita application.
  | struct App {
  |   builder : () -> Val[Html]
  | }
  | 
  | ///|
  | /// Creates an application from a root component builder.
  | ///
  | /// The builder runs when the app is mounted and must return its root
  | /// incremental HTML value. Use `Val::map`, `Val::switch`, and `Val::assoc` to
  | /// express subsequent changes, then call `App::mount` to start the app.
  | pub fn new(builder : () -> Val[Html]) -> App {
Definition found at file <WORKDIR>/rabbita\html\html.mbt
   | using @cmd {type Cmd, type Emit}
   | 
   | ///|
   | /// An HTML value produced by the constructors in this package.
   | #alias(T)
10 | pub(all) struct Html(@vdom.VNode) derive(Eq)
   |                 ^^^^
   | 
   | ///|
   | pub extend Html with Eq::{equal, not_equal}
   | 
   | ///|
   | pub fn Html::to_virtual_dom(self : Html) -> @vdom.VNode {
   |   self.0
   | }
   | 
   | ///|
   | pub fn Html::from_vnode(vdom : @vdom.VNode) -> Html {
   |   Html(vdom)
   | }
   | 
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\rabbita' moon ide peek-def 'Val' --loc 'e2e\apps\rui\fixture\fixture.mbt:2:33'
Definition found at file <WORKDIR>/rabbita\incremental.mbt
   | ///|
   | /// A lazily evaluated value in Rabbita's incremental graph.
   | ///
   | /// Derived values are recomputed on demand after one of their dependencies
   | /// changes.
12 | struct Val[A](@duplix.Node[A])
   |        ^^^
   | 
   | ///|
   | /// Creates an incremental value by applying `f` to `a`.
   | ///
   | /// The function is reevaluated when the value of `a` changes.
   | pub fn[A : Eq, B] Val::map(a : Val[A], f : (A) -> B) -> Val[B] {
   |   a.0.map1(f)
   | }
   | 
   | ///|
   | /// Creates an incremental value that always contains `a`.
   | pub fn[A] Val::constant(a : A) -> Val[A] {
   |   @duplix.constant(a)
   | }
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\rabbita' moon ide peek-def 'fixture_scroll_items' --loc 'e2e\apps\rui\message-scroller\message_scroller.mbt:2:4'
Definition found at file <WORKDIR>/e2e\apps\rui\message-scroller\message_scroller.mbt
  | ///|
2 | fn fixture_scroll_items(prefix : String) -> Array[Html] {
  |    ^^^^^^^^^^^^^^^^^^^^
  |   let items : Array[Html] = []
  |   for index in 1..<=18 {
  |     items.push(
  |       div(
  |         id="\{prefix}-\{index}",
  |         style=["height:2rem;flex:none;padding:0.25rem"],
  |         "Fixture item \{index}",
  |       ),
  |     )
  |   }
  |   items
  | }
  | 
  | ///|
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\rabbita' moon ide peek-def 'prefix' --loc 'e2e\apps\rui\message-scroller\message_scroller.mbt:2:25'
Definition found at file <WORKDIR>/e2e\apps\rui\message-scroller\message_scroller.mbt
  | ///|
2 | fn fixture_scroll_items(prefix : String) -> Array[Html] {
  |                         ^^^^^^
  |   let items : Array[Html] = []
  |   for index in 1..<=18 {
  |     items.push(
  |       div(
  |         id="\{prefix}-\{index}",
  |         style=["height:2rem;flex:none;padding:0.25rem"],
  |         "Fixture item \{index}",
  |       ),
  |     )
  |   }
  |   items
  | }
  | 
  | ///|
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\rabbita' moon ide peek-def 'Html' --loc 'e2e\apps\rui\toast\main.mbt:2:22'
Definition found at file <WORKDIR>/rabbita\top.mbt
  | 
  | ///|
  | pub using @cmd {none, batch, delay, type Cmd}
  | 
  | ///|
9 | pub using @html {type Html}
  |                       ^^^^
  | 
  | ///|
  | /// A running Rabbita application.
  | struct App {
  |   builder : () -> Val[Html]
  | }
  | 
  | ///|
  | /// Creates an application from a root component builder.
  | ///
  | /// The builder runs when the app is mounted and must return its root
  | /// incremental HTML value. Use `Val::map`, `Val::switch`, and `Val::assoc` to
  | /// express subsequent changes, then call `App::mount` to start the app.
  | pub fn new(builder : () -> Val[Html]) -> App {
Definition found at file <WORKDIR>/rabbita\html\html.mbt
   | using @cmd {type Cmd, type Emit}
   | 
   | ///|
   | /// An HTML value produced by the constructors in this package.
   | #alias(T)
10 | pub(all) struct Html(@vdom.VNode) derive(Eq)
   |                 ^^^^
   | 
   | ///|
   | pub extend Html with Eq::{equal, not_equal}
   | 
   | ///|
   | pub fn Html::to_virtual_dom(self : Html) -> @vdom.VNode {
   |   self.0
   | }
   | 
   | ///|
   | pub fn Html::from_vnode(vdom : @vdom.VNode) -> Html {
   |   Html(vdom)
   | }
   | 
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\rabbita' moon ide peek-def 'Val' --loc 'e2e\apps\rui\toast\main.mbt:2:33'
Definition found at file <WORKDIR>/rabbita\incremental.mbt
   | ///|
   | /// A lazily evaluated value in Rabbita's incremental graph.
   | ///
   | /// Derived values are recomputed on demand after one of their dependencies
   | /// changes.
12 | struct Val[A](@duplix.Node[A])
   |        ^^^
   | 
   | ///|
   | /// Creates an incremental value by applying `f` to `a`.
   | ///
   | /// The function is reevaluated when the value of `a` changes.
   | pub fn[A : Eq, B] Val::map(a : Val[A], f : (A) -> B) -> Val[B] {
   |   a.0.map1(f)
   | }
   | 
   | ///|
   | /// Creates an incremental value that always contains `a`.
   | pub fn[A] Val::constant(a : A) -> Val[A] {
   |   @duplix.constant(a)
   | }
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\rabbita' moon ide peek-def 'Item' --loc 'rabbita\clipboard\clipboard.mbt:2:15'
Definition found at file <WORKDIR>/rabbita\clipboard\clipboard.mbt
  | ///|
2 | pub(all) enum Item {
  |               ^^^^
  |   Text(String)
  | }
  | 
  | ///|
  | /// Returns a command that copies the given item to the clipboard.
  | /// 
  | /// # Message
  | /// 
  | /// - `copied` is triggered if the copy operation is successful.
  | /// - `failed` is triggered with the error message if the copy operation fails.
  | pub fn copy(item : Item, copied? : Cmd, failed? : (String) -> Cmd) -> Cmd {
  |   op.request(ClipboardCopy(item, copied, failed))
  | }
  | 
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\rabbita' moon ide peek-def 'Text' --loc 'rabbita\clipboard\clipboard.mbt:3:3'
Definition found at file <WORKDIR>/rabbita\clipboard\clipboard.mbt
  | ///|
  | pub(all) enum Item {
3 |   Text(String)
  |   ^^^^
  | }
  | 
  | ///|
  | /// Returns a command that copies the given item to the clipboard.
  | /// 
  | /// # Message
  | /// 
  | /// - `copied` is triggered if the copy operation is successful.
  | /// - `failed` is triggered with the error message if the copy operation fails.
  | pub fn copy(item : Item, copied? : Cmd, failed? : (String) -> Cmd) -> Cmd {
  |   op.request(ClipboardCopy(item, copied, failed))
  | }
  | 
  | ///|
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\rabbita' moon ide peek-def 'host' --loc 'rabbita\internal\runtime\host_ssr_wbtest.mbt:4:7' --target native
Definition found at file <WORKDIR>/rabbita\internal\runtime\host_ssr_wbtest.mbt
  | ///|
  | #cfg(not(target="js"))
  | async test "SSR base URI combines the base and request path without reading base tags" {
4 |   let host = SSRHost(
  |       ^^^^
  |     base_uri="https://example.test/site/",
  |     path="/uml/index.html?lang=en",
  |     () => {
  |       @duplix.constant(
  |         @vdom.VNode::elem(
  |           "base",
  |           @vdom.Props::new({ "href": "https://cdn.test/assets/" }, {}, {}, {}),
  |           Array([]),
  |         ),
  |       )
  |     },
  |   )
  |   defer host.cleanup()
  |   assert_eq(
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\rabbita' moon ide peek-def 'SSRHost' --loc 'rabbita\internal\runtime\host_ssr_wbtest.mbt:4:14' --target native
Definition found at file <WORKDIR>/rabbita\internal\runtime\host_ssr.mbt
   |   )
   |   document.to_string()
   | }
   | 
   | ///|
37 | pub async fn SSRHost::SSRHost(
   |                       ^^^^^^^
   |   base_uri~ : String,
   |   path~ : String,
   |   builder : GraphBuilder,
   | ) -> Self {
   |   let (host, output) = @duplix.with_scope(scope => {
   |     let host = SSRHost::{
   |       task_queue: Queue([]),
   |       document: None,
   |       url_request: _ => @cmd.none,
   |       url_changed: _ => @cmd.none,
   |       base_uri: base_uri.trim_end(chars="/").to_owned(),
   |       path,
   |       transcript: Map([]),
   |       stores: SlotMap(),
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\rabbita' moon ide peek-def 'VDom' --loc 'rabbita\internal\vdom\diff.mbt:3:8'
Definition found at file <WORKDIR>/rabbita\internal\vdom\diff.mbt
  | ///|
  | #cfg(target="js")
3 | struct VDom {
  |        ^^^^
  |   mut inode : INode
  |   target_element : @dom.Element?
  |   captured_link_listener : @dom.Listener
  | }
  | 
  | ///|
  | #cfg(not(target="js"))
  | pub struct VDom {
  |   mut vnode : VNode
  | }
  | 
  | ///|
  | #cfg(target="js")
  | priv struct IProps {
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\rabbita' moon ide peek-def 'inode' --loc 'rabbita\internal\vdom\diff.mbt:4:7'
Definition found at file <WORKDIR>/rabbita\internal\vdom\diff.mbt
  | ///|
  | #cfg(target="js")
  | struct VDom {
4 |   mut inode : INode
  |       ^^^^^
  |   target_element : @dom.Element?
  |   captured_link_listener : @dom.Listener
  | }
  | 
  | ///|
  | #cfg(not(target="js"))
  | pub struct VDom {
  |   mut vnode : VNode
  | }
  | 
  | ///|
  | #cfg(target="js")
  | priv struct IProps {
  |   props : Props
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\rabbita' moon ide peek-def 'Scheduler' --loc 'rabbita\internal\vdom\vdom.mbt:2:19'
Definition found at file <WORKDIR>/rabbita\cmd\scheduler.mbt
   |   #internal(experimental, "This API is unstable and may change in the future.")
   |   fn inject_url_request(Self, String) -> Cmd
   | }
   | 
   | ///|
14 | pub(open) trait Scheduler: Context {
   | ^
   |   fn add(Self, Cmd) -> Unit = _
   |   #internal(experimental, "This API is unstable and may change in the future.")
   |   fn queue_command(Self, Cmd) -> Unit
   |   #internal(experimental, "This API is unstable and may change in the future.")
   |   fn set_url_changed_injector(Self, Injector[String]) -> Unit
   |   #internal(experimental, "This API is unstable and may change in the future.")
   |   fn set_url_request_injector(Self, Injector[String]) -> Unit
   | }
   | 
   | ///|
   | pub extend &Scheduler with Context::{
   |   get_base_uri,
   |   inject_url_changed,
   |   inject_url_request,
   | }
   | 
   | ///|
   | impl Scheduler with fn add(self, cmd) {
   |   self.queue_command(cmd)
   | }
   | 
   | ///|
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\rabbita' moon ide peek-def 'VNode' --loc 'rabbita\internal\vdom\vdom.mbt:6:10'
Definition found at file <WORKDIR>/rabbita\internal\vdom\vdom.mbt
  | ///|
  | using @cmd {trait Scheduler}
  | 
  | ///|
  | #warnings("-unused_constructor")
6 | pub enum VNode {
  |          ^^^^^
  |   Elem(String, Props, Children[VNode], namespace_uri~ : String?)
  |   Text(String)
  |   Frag(Array[VNode])
  |   Thunk(Int32, () -> VNode)
  | }
  | 
  | ///|
  | pub impl Eq for VNode with fn equal(a, b) {
  |   physical_equal(a, b)
  | }
  | 
  | ///|
  | pub extend VNode with Eq::{equal, not_equal}
  | 
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\rabbita' moon ide peek-def 'SheetSide' --loc 'rui\sheet.mbt:3:15'
Definition found at file <WORKDIR>/rui\sheet.mbt
  | ///|
  | /// Edge from which a [`sheet`] enters the viewport.
3 | pub(all) enum SheetSide {
  |               ^^^^^^^^^
  |   SheetTop
  |   SheetRight
  |   SheetBottom
  |   SheetLeft
  | } derive(Debug, Eq)
  | 
  | ///|
  | pub extend SheetSide with Debug::{to_repr}
  | 
  | ///|
  | pub extend SheetSide with Eq::{equal, not_equal}
  | 
  | ///|
  | const SheetStyle : String = "min-width:0;min-height:0;max-height:100dvh;margin:0;border:0;border-radius:0;box-shadow:0 16px 48px rgb(0 0 0 / 0.2)"
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\rabbita' moon ide peek-def 'SheetTop' --loc 'rui\sheet.mbt:4:3'
Definition found at file <WORKDIR>/rui\sheet.mbt
  | ///|
  | /// Edge from which a [`sheet`] enters the viewport.
  | pub(all) enum SheetSide {
4 |   SheetTop
  |   ^^^^^^^^
  |   SheetRight
  |   SheetBottom
  |   SheetLeft
  | } derive(Debug, Eq)
  | 
  | ///|
  | pub extend SheetSide with Debug::{to_repr}
  | 
  | ///|
  | pub extend SheetSide with Eq::{equal, not_equal}
  | 
  | ///|
  | const SheetStyle : String = "min-width:0;min-height:0;max-height:100dvh;margin:0;border:0;border-radius:0;box-shadow:0 16px 48px rgb(0 0 0 / 0.2)"
  | 
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\rabbita' moon ide peek-def 'Path' --loc 'warren\path\sourcetree_path.mbt:2:15'
Definition found at file <WORKDIR>/warren\path\sourcetree_path.mbt
  | ///|
2 | pub type Path = @p.Path
  | ^^^^^^^^^^^^^^^^^^^^^^^
  | 
  | ///|
  | struct SourcePath(String) derive(Eq, Compare, Hash)
  | 
  | ///|
  | pub extend SourcePath with Eq::{equal, not_equal}
  | 
  | ///|
  | pub extend SourcePath with Compare::{compare, op_ge, op_gt, op_le, op_lt}
  | 
  | ///|
  | pub extend SourcePath with Hash::{hash, hash_combine}
  | 
  | ///|
Definition found at file <WORKDIR>/.mooncakes\moonbitlang\x\path\path.mbt
   | ///|
   | let is_windows : Bool = @ffi.is_windows()
   | 
   | ///|
   | /// A newtype wrapper provide path operation methods.
26 | pub(all) struct Path(String) derive(Eq, Debug)
   |                 ^^^^
   | 
   | ///|
   | pub impl Show for Path with fn output(path, logger) {
   |   logger.write_object(path.0)
   | }
   | 
   | ///|
   | pub impl Show for Path with fn to_string(path) {
   |   path.0
   | }
   | 
   | ///|
   | /// Returns the last path component of the given path.
   | ///
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\rabbita' moon ide peek-def 'SourcePath' --loc 'warren\path\sourcetree_path.mbt:5:8'
Definition found at file <WORKDIR>/warren\path\sourcetree_path.mbt
  | ///|
  | pub type Path = @p.Path
  | 
  | ///|
5 | struct SourcePath(String) derive(Eq, Compare, Hash)
  |        ^^^^^^^^^^
  | 
  | ///|
  | pub extend SourcePath with Eq::{equal, not_equal}
  | 
  | ///|
  | pub extend SourcePath with Compare::{compare, op_ge, op_gt, op_le, op_lt}
  | 
  | ///|
  | pub extend SourcePath with Hash::{hash, hash_combine}
  | 
  | ///|
  | pub impl Debug for SourcePath with fn to_repr(self) {
  |   @debug.Repr::string(self.0)
  | }
```
