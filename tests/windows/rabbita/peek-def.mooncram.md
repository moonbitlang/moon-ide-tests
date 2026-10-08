# rabbita peek-def

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
$ run_moon_ide '..\..\..\fixtures\repos\rabbita' moon ide peek-def 'Val' --loc 'rabbita\deprecated.mbt:6:23'
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
$ run_moon_ide '..\..\..\fixtures\repos\rabbita' moon ide peek-def 'Html' --loc 'rabbita\deprecated.mbt:6:27'
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
   | pub fn Html::to_virtual_dom(self : Html) -> @vdom.VNode {
   |   self.0
   | }
   | 
   | ///|
   | pub fn Html::from_vnode(vdom : @vdom.VNode) -> Html {
   |   Html(vdom)
   | }
   | 
   | ///|
   | pub fn[C : IsChildren] node(tag : String, attrs : Attrs, children : C) -> Html {
   |   let props = attrs.to_props()
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\rabbita' moon ide peek-def 'ClipboardEvent' --loc 'rabbita\dom\clipboard_event.mbt:8:22'
Definition found at file <WORKDIR>/rabbita\dom\clipboard_event.mbt
  | ///|
  | #cfg(target="js")
  | #external
4 | type ClipboardEvent
  |      ^^^^^^^^^^^^^^
  | 
  | ///|
  | #cfg(target="js")
  | pub impl IsEvent for ClipboardEvent
  | 
  | ///|
  | #cfg(target="js")
  | pub impl @js.Cast for ClipboardEvent with fn into(value) {
  |   value |> ffi_to_clipboard_event |> y => { y.to_option() }
  | }
  | 
  | ///|
  | #cfg(target="js")
  | pub impl @js.Cast for ClipboardEvent with fn from(value) {
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\rabbita' moon ide peek-def 'IsEvent' --loc 'rabbita\dom\clipboard_event.mbt:8:10'
Definition found at file <WORKDIR>/rabbita\dom\event.mbt
   | fn[A, B] js_identity(a : A) -> B {
   |   @js.Value::cast_from(a).cast()
   | }
   | 
   | ///|
28 | #cfg(target="js")
   | ^
   | pub trait IsEvent: @js.Cast {
   |   fn target(Self) -> EventTarget = _
   |   fn current_target(Self) -> @js.Nullable[EventTarget] = _
   |   /// https://developer.mozilla.org/en-US/docs/Web/API/Event/defaultPrevented
   |   fn get_default_prevented(Self) -> Bool = _
   |   /// https://developer.mozilla.org/en-US/docs/Web/API/Event/timeStamp
   |   fn get_time_stamp(Self) -> DOMHighResTimeStamp = _
   |   /// https://developer.mozilla.org/en-US/docs/Web/API/Event/composedPath
   |   fn composed_path(Self) -> FixedArray[EventTarget] = _
   |   fn prevent_default(Self) -> Unit = _
   |   fn stop_propagation(Self) -> Unit = _
   |   /// https://developer.mozilla.org/en-US/docs/Web/API/Event/stopImmediatePropagation
   |   fn stop_immediate_propagation(Self) -> Unit = _
   |   fn as_event(Self) -> Event = _
   |   fn to_ui_event(Self) -> UIEvent? = _
   |   fn to_clipboard_event(Self) -> ClipboardEvent? = _
   |   fn to_mouse_event(Self) -> MouseEvent? = _
   |   /// https://developer.mozilla.org/en-US/docs/Web/API/PointerEvent
   |   fn to_pointer_event(Self) -> PointerEvent? = _
   |   fn to_input_event(Self) -> InputEvent? = _
   |   fn to_focus_event(Self) -> FocusEvent? = _
   |   fn to_keyboard_event(Self) -> KeyboardEvent? = _
   |   fn to_animation_event(Self) -> AnimationEvent? = _
   |   fn to_before_unload_event(Self) -> BeforeUnloadEvent? = _
   |   fn to_blob_event(Self) -> BlobEvent? = _
   |   fn to_close_event(Self) -> CloseEvent? = _
   |   fn to_composition_event(Self) -> CompositionEvent? = _
   |   fn to_custom_event(Self) -> CustomEvent? = _
   |   fn to_drag_event(Self) -> DragEvent? = _
   |   fn to_message_event(Self) -> MessageEvent? = _
   |   fn to_wheel_event(Self) -> WheelEvent? = _
   | }
   | 
   | ///|
   | #cfg(target="js")
   | pub impl IsEvent for Event
   | 
   | ///|
   | #cfg(target="js")
   | pub impl @js.Cast for Event with fn into(value) {
   |   value |> ffi_to_event |> y => { y.to_option() }
   | }
   | 
   | ///|
   | #cfg(target="js")
   | pub impl @js.Cast for Event with fn from(value) {
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
  |   Thunk(Int, () -> VNode)
  | }
  | 
  | ///|
  | pub impl Eq for VNode with fn equal(a, b) {
  |   physical_equal(a, b)
  | }
  | 
  | ///|
  | const CAPTURED_LINK_TAG : String = "RABBITA_CAPTURED_LINK"
  | 
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\rabbita' moon ide peek-def 'CardSize' --loc 'rui\card.mbt:2:15'
Definition found at file <WORKDIR>/rui\card.mbt
  | ///|
2 | pub(all) enum CardSize {
  |               ^^^^^^^^
  |   Default
  |   Sm
  | } derive(Debug, Eq)
  | 
  | ///|
  | const CardBaseStyle : String = "--rui-card-radius:calc(var(--rui-radius,0.625rem) + 0.125rem);display:flex;flex-direction:column;gap:var(--rui-card-spacing,1.5rem);border:1px solid var(--rui-border,oklch(0.922 0 0));border-radius:var(--rui-card-radius,0.75rem);background:var(--rui-card,oklch(1 0 0));padding-block:var(--rui-card-spacing,1.5rem);color:var(--rui-card-foreground,oklch(0.145 0 0));font-size:0.875rem;line-height:1.25rem;box-shadow:0 1px 3px 0 rgb(0 0 0 / 0.1),0 1px 2px -1px rgb(0 0 0 / 0.1)"
  | 
  | ///|
  | const CardDefaultSizeStyle : String = "--rui-card-spacing:1.5rem;--rui-card-title-size:1rem;--rui-card-title-line-height:1"
  | 
  | ///|
  | const CardSmSizeStyle : String = "--rui-card-spacing:1rem;--rui-card-title-size:0.875rem;--rui-card-title-line-height:1.25rem"
  | 
  | ///|
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\rabbita' moon ide peek-def 'Sm' --loc 'rui\card.mbt:4:3'
Definition found at file <WORKDIR>/rui\card.mbt
  | ///|
  | pub(all) enum CardSize {
  |   Default
4 |   Sm
  |   ^^
  | } derive(Debug, Eq)
  | 
  | ///|
  | const CardBaseStyle : String = "--rui-card-radius:calc(var(--rui-radius,0.625rem) + 0.125rem);display:flex;flex-direction:column;gap:var(--rui-card-spacing,1.5rem);border:1px solid var(--rui-border,oklch(0.922 0 0));border-radius:var(--rui-card-radius,0.75rem);background:var(--rui-card,oklch(1 0 0));padding-block:var(--rui-card-spacing,1.5rem);color:var(--rui-card-foreground,oklch(0.145 0 0));font-size:0.875rem;line-height:1.25rem;box-shadow:0 1px 3px 0 rgb(0 0 0 / 0.1),0 1px 2px -1px rgb(0 0 0 / 0.1)"
  | 
  | ///|
  | const CardDefaultSizeStyle : String = "--rui-card-spacing:1.5rem;--rui-card-title-size:1rem;--rui-card-title-line-height:1"
  | 
  | ///|
  | const CardSmSizeStyle : String = "--rui-card-spacing:1rem;--rui-card-title-size:0.875rem;--rui-card-title-line-height:1.25rem"
  | 
  | ///|
  | const CardHeaderStyle : String = "display:grid;grid-template-columns:var(--rui-card-header-columns,minmax(0,1fr));grid-template-rows:auto auto;align-items:start;column-gap:var(--rui-card-header-column-gap,0);row-gap:0.5rem;padding-inline:var(--rui-card-spacing,1.5rem);border-radius:var(--rui-card-radius,0.75rem) var(--rui-card-radius,0.75rem) 0 0"
  | 
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\rabbita' moon ide peek-def 'SheetSide' --loc 'rui\sheet.mbt:3:15'
Definition found at file <WORKDIR>/rui\sheet.mbt
  | ///|
  | /// Edge from which a [`sheet_content`] surface enters the viewport.
3 | pub(all) enum SheetSide {
  |               ^^^^^^^^^
  |   SheetTop
  |   SheetRight
  |   SheetBottom
  |   SheetLeft
  | } derive(Debug, Eq)
  | 
  | ///|
  | /// Explicit compound-component scope created by [`sheet`].
  | struct SheetScope(DialogScope)
  | 
  | ///|
  | const SheetPositionerStyle : String = "position:fixed;inset:0;z-index:51;display:flex;overflow:hidden;pointer-events:none"
  | 
  | ///|
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\rabbita' moon ide peek-def 'SheetTop' --loc 'rui\sheet.mbt:4:3'
Definition found at file <WORKDIR>/rui\sheet.mbt
  | ///|
  | /// Edge from which a [`sheet_content`] surface enters the viewport.
  | pub(all) enum SheetSide {
4 |   SheetTop
  |   ^^^^^^^^
  |   SheetRight
  |   SheetBottom
  |   SheetLeft
  | } derive(Debug, Eq)
  | 
  | ///|
  | /// Explicit compound-component scope created by [`sheet`].
  | struct SheetScope(DialogScope)
  | 
  | ///|
  | const SheetPositionerStyle : String = "position:fixed;inset:0;z-index:51;display:flex;overflow:hidden;pointer-events:none"
  | 
  | ///|
  | const SheetSurfaceStyle : String = "position:relative;display:flex;min-width:0;min-height:0;flex-direction:column;gap:1rem;overflow:auto;background:var(--rui-popover,var(--rui-background,oklch(1 0 0)));color:var(--rui-popover-foreground,var(--rui-foreground,oklch(0.145 0 0)));padding:1.5rem;box-shadow:0 16px 48px rgb(0 0 0 / 0.2);opacity:var(--rui-sheet-opacity,1);transform:var(--rui-sheet-transform,translate3d(0,0,0));will-change:opacity,transform;pointer-events:auto"
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
  | pub impl Debug for SourcePath with fn to_repr(self) {
  |   @debug.Repr::string(self.0)
  | }
  | 
  | ///|
  | pub fn SourcePath::new(s : String) -> Self {
  |   Path::resolve(s).0
  | }
  | 
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
  | pub impl Debug for SourcePath with fn to_repr(self) {
  |   @debug.Repr::string(self.0)
  | }
  | 
  | ///|
  | pub fn SourcePath::new(s : String) -> Self {
  |   Path::resolve(s).0
  | }
  | 
  | ///|
  | pub impl Show for SourcePath with fn output(self, buf) {
  |   buf.write_string(self.0)
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\rabbita' moon ide peek-def 'Val' --loc 'warren\templates\minimized\main.mbt:1:23'
Error: no metadata is available for any backend
[1]
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\rabbita' moon ide peek-def 'Html' --loc 'warren\templates\minimized\main.mbt:1:33'
Error: no metadata is available for any backend
[1]
```
