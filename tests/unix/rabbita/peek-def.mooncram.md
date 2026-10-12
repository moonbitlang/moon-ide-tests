# rabbita peek-def

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
$ run_moon_ide moon ide peek-def 'Html' --loc 'e2e/apps/rui/fixture/fixture.mbt:2:22'
Definition found at file <WORKDIR>/rabbita/top.mbt
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
Definition found at file <WORKDIR>/rabbita/html/html.mbt
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
$ run_moon_ide moon ide peek-def 'Val' --loc 'e2e/apps/rui/fixture/fixture.mbt:2:33'
Definition found at file <WORKDIR>/rabbita/incremental.mbt
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
$ run_moon_ide moon ide peek-def 'fixture_scroll_items' --loc 'e2e/apps/rui/message-scroller/message_scroller.mbt:2:4'
Definition found at file <WORKDIR>/e2e/apps/rui/message-scroller/message_scroller.mbt
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
$ run_moon_ide moon ide peek-def 'prefix' --loc 'e2e/apps/rui/message-scroller/message_scroller.mbt:2:25'
Definition found at file <WORKDIR>/e2e/apps/rui/message-scroller/message_scroller.mbt
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
$ run_moon_ide moon ide peek-def 'Html' --loc 'e2e/apps/rui/toast/main.mbt:2:22'
Definition found at file <WORKDIR>/rabbita/top.mbt
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
Definition found at file <WORKDIR>/rabbita/html/html.mbt
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
$ run_moon_ide moon ide peek-def 'Val' --loc 'e2e/apps/rui/toast/main.mbt:2:33'
Definition found at file <WORKDIR>/rabbita/incremental.mbt
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
$ run_moon_ide moon ide peek-def 'Item' --loc 'rabbita/clipboard/clipboard.mbt:2:15'
Definition found at file <WORKDIR>/rabbita/clipboard/clipboard.mbt
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
$ run_moon_ide moon ide peek-def 'Text' --loc 'rabbita/clipboard/clipboard.mbt:3:3'
Definition found at file <WORKDIR>/rabbita/clipboard/clipboard.mbt
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
$ run_moon_ide moon ide peek-def 'VDom' --loc 'rabbita/internal/vdom/diff.mbt:3:8'
Definition found at file <WORKDIR>/rabbita/internal/vdom/diff.mbt
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
$ run_moon_ide moon ide peek-def 'inode' --loc 'rabbita/internal/vdom/diff.mbt:4:7'
Definition found at file <WORKDIR>/rabbita/internal/vdom/diff.mbt
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
$ run_moon_ide moon ide peek-def 'Scheduler' --loc 'rabbita/internal/vdom/vdom.mbt:2:19'
Definition found at file <WORKDIR>/rabbita/cmd/scheduler.mbt
   |   #internal(experimental, "This API is unstable and may change in the future.")
   |   fn inject_url_request(Self, String) -> Cmd
   | }
   | 
   | ///|
13 | pub(open) trait Scheduler: Context {
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
   |   get_origin,
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
$ run_moon_ide moon ide peek-def 'VNode' --loc 'rabbita/internal/vdom/vdom.mbt:6:10'
Definition found at file <WORKDIR>/rabbita/internal/vdom/vdom.mbt
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
  |   Thunk(Int, () -> VNode)
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
$ run_moon_ide moon ide peek-def 'Path' --loc 'warren/path/sourcetree_path.mbt:2:15'
Definition found at file <WORKDIR>/warren/path/sourcetree_path.mbt
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
Definition found at file <WORKDIR>/.mooncakes/moonbitlang/x/path/path.mbt
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
$ run_moon_ide moon ide peek-def 'SourcePath' --loc 'warren/path/sourcetree_path.mbt:5:8'
Definition found at file <WORKDIR>/warren/path/sourcetree_path.mbt
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

```mooncram
$ run_moon_ide moon ide peek-def 'Val' --loc 'warren/templates/minimized/main.mbt:1:23'
Error: no metadata is available for any backend
[1]
```

```mooncram
$ run_moon_ide moon ide peek-def 'Html' --loc 'warren/templates/minimized/main.mbt:1:33'
Error: no metadata is available for any backend
[1]
```

```mooncram
$ run_moon_ide moon ide peek-def 'host' --loc 'warren/templates/server/cmd/server/main.mbt:3:7'
Error: no metadata is available for any backend
[1]
```

```mooncram
$ run_moon_ide moon ide peek-def 'unwrap_or' --loc 'warren/templates/server/cmd/server/main.mbt:3:46'
Error: no metadata is available for any backend
[1]
```
