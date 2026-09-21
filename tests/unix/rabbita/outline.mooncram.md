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
$ run_moon_ide moon ide outline 'rabbita/clipboard/clipboard.mbt'
 2 |pub(all) enum Item {
   |...
13 |pub fn copy(item : Item, copied? : Cmd, failed? : (String) -> Cmd) -> Cmd {
   |...
23 |pub fn paste(pasted~ : (Item) -> Cmd, failed? : (String) -> Cmd) -> Cmd {
   |...

```

```mooncram
$ run_moon_ide moon ide outline 'rabbita/deprecated.mbt'
  5 |#deprecated("Use a `() -> Val[Html]` component. Nested `Cell::view()` composition is no longer supported; use `Val::map`, `Val::switch`, or `Val::assoc` instead.", skip_current_package=true)
  6 |pub type Cell = () -> Val[Html]
    |...
  9 |#cfg(target="js")
 10 |priv struct DeprecatedModel[Model](Model)
    |...
 13 |#cfg(target="js")
 14 |impl[Model] Eq for DeprecatedModel[Model] with fn equal(_, _) {
    |...
 19 |#cfg(target="js")
 20 |fn[Model, Msg] make_deprecated_cell(
 21 |  model~ : Model,
 22 |  update~ : (Emit[Msg], Msg, Model) -> (Cmd, Model),
 23 |  view~ : (Emit[Msg], Model) -> Html,
 24 |  subscriptions? : (Emit[Msg], Model) -> @sub.Sub,
 25 |) -> (Emit[Msg], Cell) {
    |...
 64 |#cfg(not(target="js"))
 65 |fn[Model, Msg] make_deprecated_cell(
 66 |  model~ : Model,
 67 |  update~ : (Emit[Msg], Msg, Model) -> (Cmd, Model),
 68 |  view~ : (Emit[Msg], Model) -> Html,
 69 |  subscriptions? : (Emit[Msg], Model) -> @sub.Sub,
 70 |) -> (Emit[Msg], Cell) {
    |...
 83 |#deprecated("Use `create_state` inside a `() -> Val[Html]` component; return `(Model, Cmd)` from `update`, then map the model to `Html`.", skip_current_package=true)
 84 |pub fn[Model, Msg] cell(
 85 |  model~ : Model,
 86 |  update~ : (Emit[Msg], Msg, Model) -> (Cmd, Model),
 87 |  view~ : (Emit[Msg], Model) -> Html,
 88 |  subscriptions? : (Emit[Msg], Model) -> @sub.Sub,
 89 |) -> Cell {
    |...
 96 |#deprecated("Use `create_state` inside a component and pass its returned `Emit` explicitly where it is needed.", skip_current_package=true)
 97 |pub fn[Model, Msg] cell_with_emit(
 98 |  model~ : Model,
 99 |  update~ : (Emit[Msg], Msg, Model) -> (Cmd, Model),
100 |  view~ : (Emit[Msg], Model) -> Html,
101 |  subscriptions? : (Emit[Msg], Model) -> @sub.Sub,
102 |) -> (Emit[Msg], Cell) {
    |...
108 |#deprecated("Use `create_pure_state` inside a `() -> Val[Html]` component, then map the model to `Html`.", skip_current_package=true)
109 |pub fn[Model, Msg] simple_cell(
110 |  model~ : Model,
111 |  update~ : (Msg, Model) -> Model,
112 |  view~ : (Emit[Msg], Model) -> Html,
113 |) -> Cell {
    |...
124 |#deprecated("Use `create_pure_state` inside a component and pass its returned `Emit` explicitly where it is needed.", skip_current_package=true)
125 |pub fn[Model, Msg] simple_cell_with_emit(
126 |  model~ : Model,
127 |  update~ : (Msg, Model) -> Model,
128 |  view~ : (Emit[Msg], Model) -> Html,
129 |  subscriptions? : (Emit[Msg], Model) -> @sub.Sub,
130 |) -> (Emit[Msg], Cell) {
    |...
141 |#deprecated("Use a component returning `Val::constant(html)` instead.", skip_current_package=true)
142 |pub fn static_cell(html : Html) -> Cell {
    |...

```

```mooncram
$ run_moon_ide moon ide outline 'rabbita/dom/clipboard_event.mbt'
 2 |#cfg(target="js")
 3 |#external
 4 |type ClipboardEvent
   |...
 7 |#cfg(target="js")
   |...
11 |#cfg(target="js")
12 |pub impl @js.Cast for ClipboardEvent with fn into(value) {
   |...
17 |#cfg(target="js")
18 |pub impl @js.Cast for ClipboardEvent with fn from(value) {
   |...
23 |#cfg(target="js")
24 |pub extern "js" fn ClipboardEvent::clipboard_data(self : Self) -> DataTransfer = "(e) => e.clipboardData"
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
677 |#cfg(target="js")
678 |fn diff_children(
679 |  old : Children[INode],
680 |  new : Children[VNode],
681 |  scheduler : &Scheduler,
682 |  captured_link_listener : @dom.Listener,
683 |  parent : @dom.Node,
684 |  anchor : @js.Nullable[@dom.Node],
685 |) -> Children[INode] {
    |...
766 |#cfg(target="js")
767 |fn[A, B] Children::map(self : Children[A], f : (A) -> B) -> Children[B] {
    |...
776 |#cfg(target="js")
777 |fn variant_to_js_value(value : @variant.Variant) -> @js.Value {
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
 19 |const CAPTURED_LINK_TAG : String = "RABBITA_CAPTURED_LINK"
    |...
 22 |const FRAGMENT_START_MARKER : String = "["
    |...
 25 |const FRAGMENT_END_MARKER : String = "]"
    |...
 28 |fn rendered_tag(tag : String) -> String {
    |...
 37 |#cfg(target="js")
 38 |fn is_captured_link_tag(tag : String) -> Bool {
    |...
 43 |fn is_html_void_element(tag : String) -> Bool {
    |...
 64 |pub fn VNode::thunk(hash : Int, f : () -> VNode) -> VNode {
    |...
 69 |pub fn VNode::elem(
 70 |  tag : String,
 71 |  props : Props,
 72 |  children : Children[VNode],
 73 |  namespace_uri? : String,
 74 |) -> VNode {
    |...
 79 |pub fn VNode::text(s : String) -> VNode {
    |...
 84 |pub fn VNode::link(
 85 |  props : Props,
 86 |  children : Children[VNode],
 87 |  escape? : Bool = false,
 88 |) -> VNode {
    |...
 94 |pub fn VNode::fragment(childs : Array[VNode]) -> VNode {
    |...
 99 |pub fn VNode::document(props : Props, head : VNode, body : VNode) -> VNode {
    |...
104 |pub(all) enum Children[T] {
    |...
111 |#cfg(target="js")
112 |type Event = @dom.Event
    |...
115 |#cfg(not(target="js"))
116 |type Event = Unit
    |...
119 |pub struct Props {
    |...
127 |pub fn Props::new(
128 |  attrs : Map[String, String],
129 |  props : Map[String, @variant.Variant],
130 |  styles : Map[String, String],
131 |  handlers : Map[String, (Event, &Scheduler) -> Unit],
132 |) -> Props {
    |...
137 |fn[K : Eq + Hash, V] copy_map(src : Map[K, V]) -> Map[K, V] {
    |...
146 |pub fn Props::copy(self : Props) -> Props {
    |...

```

```mooncram
$ run_moon_ide moon ide outline 'rui/card.mbt'
  2 |pub(all) enum CardSize {
    |...
  8 |const CardBaseStyle : String = "--rui-card-radius:calc(var(--rui-radius,0.625rem) + 0.125rem);display:flex;flex-direction:column;gap:var(--rui-card-spacing,1.5rem);border:1px solid var(--rui-border,oklch(0.922 0 0));border-radius:var(--rui-card-radius,0.75rem);background:var(--rui-card,oklch(1 0 0));padding-block:var(--rui-card-spacing,1.5rem);color:var(--rui-card-foreground,oklch(0.145 0 0));font-size:0.875rem;line-height:1.25rem;box-shadow:0 1px 3px 0 rgb(0 0 0 / 0.1),0 1px 2px -1px rgb(0 0 0 / 0.1)"
    |...
 11 |const CardDefaultSizeStyle : String = "--rui-card-spacing:1.5rem;--rui-card-title-size:1rem;--rui-card-title-line-height:1"
    |...
 14 |const CardSmSizeStyle : String = "--rui-card-spacing:1rem;--rui-card-title-size:0.875rem;--rui-card-title-line-height:1.25rem"
    |...
 17 |const CardHeaderStyle : String = "display:grid;grid-template-columns:var(--rui-card-header-columns,minmax(0,1fr));grid-template-rows:auto auto;align-items:start;column-gap:var(--rui-card-header-column-gap,0);row-gap:0.5rem;padding-inline:var(--rui-card-spacing,1.5rem);border-radius:var(--rui-card-radius,0.75rem) var(--rui-card-radius,0.75rem) 0 0"
    |...
 20 |const CardTitleStyle : String = "grid-column:1;grid-row:1;min-width:0;font-size:var(--rui-card-title-size,1rem);line-height:var(--rui-card-title-line-height,1);font-weight:600;overflow-wrap:anywhere"
    |...
 23 |const CardDescriptionStyle : String = "grid-column:1;grid-row:2;min-width:0;color:var(--rui-muted-foreground,oklch(0.556 0 0));font-size:0.875rem;line-height:1.25rem;overflow-wrap:anywhere"
    |...
 26 |const CardActionStyle : String = "grid-column:2;grid-row:1 / span 2;align-self:start;justify-self:end"
    |...
 29 |const CardContentStyle : String = "min-width:0;padding-inline:var(--rui-card-spacing,1.5rem)"
    |...
 32 |const CardFooterStyle : String = "display:flex;align-items:center;padding-inline:var(--rui-card-spacing,1.5rem);border-radius:0 0 var(--rui-card-radius,0.875rem) var(--rui-card-radius,0.875rem)"
    |...
 35 |fn card_size_style(size : CardSize) -> String {
    |...
 43 |fn card_size_value(size : CardSize) -> String {
    |...
 51 |fn card_part_attrs(attrs : @html.Attrs?, slot : String) -> @html.Attrs {
    |...
 60 |pub fn[C : @html.IsChildren] card(
 61 |  size? : CardSize = Default,
 62 |  id? : String,
 63 |  class? : String,
 64 |  title? : String,
 65 |  attrs? : @html.Attrs,
 66 |  style? : Array[String] = [],
 67 |  children : C,
 68 |) -> @html.Html {
    |...
 93 |pub fn[C : @html.IsChildren] card_header(
 94 |  id? : String,
 95 |  class? : String,
 96 |  title? : String,
 97 |  attrs? : @html.Attrs,
 98 |  style? : Array[String] = [],
 99 |  children : C,
100 |) -> @html.Html {
    |...
112 |pub fn[C : @html.IsChildren] card_title(
113 |  id? : String,
114 |  class? : String,
115 |  title? : String,
116 |  attrs? : @html.Attrs,
117 |  style? : Array[String] = [],
118 |  children : C,
119 |) -> @html.Html {
    |...
131 |pub fn[C : @html.IsChildren] card_description(
132 |  id? : String,
133 |  class? : String,
134 |  title? : String,
135 |  attrs? : @html.Attrs,
136 |  style? : Array[String] = [],
137 |  children : C,
138 |) -> @html.Html {
    |...
150 |pub fn[C : @html.IsChildren] card_action(
151 |  id? : String,
152 |  class? : String,
153 |  title? : String,
154 |  attrs? : @html.Attrs,
155 |  style? : Array[String] = [],
156 |  children : C,
157 |) -> @html.Html {
    |...
169 |pub fn[C : @html.IsChildren] card_content(
170 |  id? : String,
171 |  class? : String,
172 |  title? : String,
173 |  attrs? : @html.Attrs,
174 |  style? : Array[String] = [],
175 |  children : C,
176 |) -> @html.Html {
    |...
188 |pub fn[C : @html.IsChildren] card_footer(
189 |  id? : String,
190 |  class? : String,
191 |  title? : String,
192 |  attrs? : @html.Attrs,
193 |  style? : Array[String] = [],
194 |  children : C,
195 |) -> @html.Html {
    |...

```

```mooncram
$ run_moon_ide moon ide outline 'rui/sheet.mbt'
  3 |pub(all) enum SheetSide {
    |...
 12 |struct SheetScope(DialogScope)
    |...
 15 |const SheetPositionerStyle : String = "position:fixed;inset:0;z-index:51;display:flex;overflow:hidden;pointer-events:none"
    |...
 18 |const SheetSurfaceStyle : String = "position:relative;display:flex;min-width:0;min-height:0;flex-direction:column;gap:1rem;overflow:auto;background:var(--rui-popover,var(--rui-background,oklch(1 0 0)));color:var(--rui-popover-foreground,var(--rui-foreground,oklch(0.145 0 0)));padding:1.5rem;box-shadow:0 16px 48px rgb(0 0 0 / 0.2);opacity:var(--rui-sheet-opacity,1);transform:var(--rui-sheet-transform,translate3d(0,0,0));will-change:opacity,transform;pointer-events:auto"
    |...
 21 |const SheetCloseButtonStyle : String = "position:absolute;top:1rem;inset-inline-end:1rem;background:var(--rui-close-bg,var(--rui-button-bg,var(--rui-button-base-bg,transparent)));color:var(--rui-close-fg,var(--rui-button-fg,var(--rui-button-base-fg,currentColor)));box-shadow:var(--rui-close-shadow,var(--rui-button-shadow,var(--rui-button-base-shadow,none)));opacity:var(--rui-close-opacity,var(--rui-close-base-opacity,0.7))"
    |...
 24 |fn sheet_side_value(side : SheetSide) -> String {
    |...
 34 |fn sheet_positioner_side_style(side : SheetSide) -> String {
    |...
 44 |fn sheet_surface_side_style(side : SheetSide) -> String {
    |...
 58 |fn sheet_closed_transform(side : SheetSide) -> String {
    |...
 68 |fn sheet_motion_style(side : SheetSide, open : Bool) -> String {
    |...
 78 |fn sheet_close_icon(scope : DialogScope, label : String) -> @html.Html {
    |...
103 |pub fn sheet(
104 |  id~ : String,
105 |  default_open? : Bool = false,
106 |  modal? : Bool = true,
107 |  close_on_escape? : Bool = true,
108 |  on_open_change? : @cmd.Emit[Bool],
109 |  on_close? : @cmd.Emit[String],
110 |  children : (SheetScope) -> @html.Html,
111 |) -> @rabbita.Val[@html.Html] {
    |...
124 |pub fn[C : @html.IsChildren] sheet_trigger(
125 |  scope : SheetScope,
126 |  variant? : ButtonVariant = Outline,
127 |  size? : ButtonSize = Default,
128 |  disabled? : Bool = false,
129 |  id? : String,
130 |  class? : String,
131 |  title? : String,
132 |  aria_label? : String,
133 |  on_click? : @cmd.Cmd,
134 |  attrs? : @html.Attrs,
135 |  style? : Array[String] = [],
136 |  children : C,
137 |) -> @html.Html {
    |...
168 |pub fn[C : @html.IsChildren] sheet_content(
169 |  scope : SheetScope,
170 |  side? : SheetSide = SheetRight,
171 |  close_on_overlay? : Bool = true,
172 |  show_close? : Bool = true,
173 |  close_label? : String = "Close",
174 |  described? : Bool = true,
175 |  aria_label? : String,
176 |  id? : String,
177 |  class? : String,
178 |  title? : String,
179 |  hidden? : Bool,
180 |  attrs? : @html.Attrs,
181 |  style? : Array[String] = [],
182 |  overlay_attrs? : @html.Attrs,
183 |  overlay_style? : Array[String] = [],
184 |  native_attrs? : @html.Attrs,
185 |  native_style? : Array[String] = [],
186 |  children : C,
187 |) -> @html.Html {
    |...
309 |pub fn[C : @html.IsChildren] sheet_header(
310 |  id? : String,
311 |  class? : String,
312 |  title? : String,
313 |  attrs? : @html.Attrs,
314 |  style? : Array[String] = [],
315 |  children : C,
316 |) -> @html.Html {
    |...
328 |pub fn[C : @html.IsChildren] sheet_footer(
329 |  id? : String,
330 |  class? : String,
331 |  title? : String,
332 |  attrs? : @html.Attrs,
333 |  style? : Array[String] = [],
334 |  children : C,
335 |) -> @html.Html {
    |...
347 |pub fn[C : @html.IsChildren] sheet_title(
348 |  scope : SheetScope,
349 |  id? : String,
350 |  class? : String,
351 |  title? : String,
352 |  attrs? : @html.Attrs,
353 |  style? : Array[String] = [],
354 |  children : C,
355 |) -> @html.Html {
    |...
368 |pub fn[C : @html.IsChildren] sheet_description(
369 |  scope : SheetScope,
370 |  id? : String,
371 |  class? : String,
372 |  title? : String,
373 |  attrs? : @html.Attrs,
374 |  style? : Array[String] = [],
375 |  children : C,
376 |) -> @html.Html {
    |...
389 |pub fn[C : @html.IsChildren] sheet_close(
390 |  scope : SheetScope,
391 |  variant? : ButtonVariant = Outline,
392 |  size? : ButtonSize = Default,
393 |  disabled? : Bool = false,
394 |  id? : String,
395 |  class? : String,
396 |  title? : String,
397 |  aria_label? : String,
398 |  on_click? : @cmd.Cmd,
399 |  attrs? : @html.Attrs,
400 |  style? : Array[String] = [],
401 |  children : C,
402 |) -> @html.Html {
    |...

```

```mooncram
$ run_moon_ide moon ide outline 'warren/path/sourcetree_path.mbt'
 2 |pub type Path = @p.Path
   |...
 5 |struct SourcePath(String) derive(Eq, Compare, Hash)
   |...
 8 |pub impl Debug for SourcePath with fn to_repr(self) {
   |...
13 |pub fn SourcePath::new(s : String) -> Self {
   |...
18 |pub impl Show for SourcePath with fn output(self, buf) {
   |...
23 |pub fn SourcePath::join(a : Self, b : String) -> Self {
   |...
28 |pub fn SourcePath::relative(a : Self, base : SourcePath) -> String {
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
