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
$ run_moon_ide moon ide outline 'rabbita/clipboard/aliases.mbt'
2 |using @cmd {type Cmd}
  |...

```

```mooncram
$ run_moon_ide moon ide outline 'rabbita/clipboard/clipboard.mbt'
 2 |pub(all) enum Item {
   |...
13 |#cfg(target="js")
14 |pub fn copy(item : Item, copied? : Cmd, failed? : (String) -> Cmd) -> Cmd {
   |...
41 |#cfg(target="js")
42 |pub fn paste(pasted~ : (Item) -> Cmd, failed? : (String) -> Cmd) -> Cmd {
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
$ run_moon_ide moon ide outline 'rabbita/dom/image_data.mbt'
 2 |#cfg(target="js")
 3 |#external
 4 |type ImageData
   |...
 7 |#cfg(target="js")
 8 |pub extern "js" fn ImageData::new(
 9 |  sw : Int,
10 |  sh : Int,
11 |  settings : @js.Optional[ImageDataSettings],
12 |) -> ImageData = "(sw,sh,settings) => new ImageData(sw,sh,settings)"
   |...
15 |#cfg(target="js")
16 |pub extern "js" fn ImageData::new_with_data(
17 |  data : Uint8ClampedArray,
18 |  sw : Int,
19 |  sh : Int,
20 |  settings? : @js.Optional[ImageDataSettings] = @js.Optional::undefined(),
21 |) -> ImageData = "(data,sw,sh,settings) => new ImageData(data,sw,sh,settings)"
   |...
24 |#cfg(target="js")
25 |pub extern "js" fn ImageData::get_width(self : Self) -> Int = "(self) => self.width"
   |...
28 |#cfg(target="js")
29 |pub extern "js" fn ImageData::get_height(self : Self) -> Int = "(self) => self.height"
   |...
32 |#cfg(target="js")
33 |pub extern "js" fn ImageData::get_data(self : Self) -> Uint8ClampedArray = "(self) => self.data"
   |...
38 |#cfg(target="js")
39 |pub extern "js" fn ImageData::get_color_space(
40 |  self : ImageData,
41 |) -> PredefinedColorSpace = "(self) => self.colorSpace"
   |...
45 |#cfg(target="js")
46 |pub type PredefinedColorSpace = String
   |...

```

```mooncram
$ run_moon_ide moon ide outline 'rabbita/dom/webgl_rendering_context.mbt'
2 |#cfg(target="js")
3 |#external
4 |type WebGLRenderingContext
  |...

```

```mooncram
$ run_moon_ide moon ide outline 'rabbita/internal/runtime/sandbox.mbt'
  2 |#cfg(target="js")
  3 |using @queue {type Queue}
    |...
 16 |#cfg(target="js")
 17 |pub(all) struct Sandbox {
    |...
 31 |#cfg(target="js")
 32 |pub fn Sandbox::new(root : &IsCell) -> Sandbox {
    |...
 71 |#cfg(target="js")
 72 |pub fn Sandbox::initialize(self : Self) -> Unit {
    |...
 90 |#cfg(target="js")
 91 |fn Sandbox::drop_live_subtree(self : Self, root : Instance) -> Unit {
    |...
122 |#cfg(target="js")
123 |pub fn Sandbox::flush(self : Self) -> Unit {
    |...
168 |#cfg(target="js")
169 |pub impl Scheduler for Sandbox with fn run_effect(self, kind, f) {
    |...
177 |#cfg(target="js")
178 |pub impl Scheduler for Sandbox with fn queue_message(self, id, send_message) {
    |...
185 |#cfg(target="js")
186 |pub impl Scheduler for Sandbox with fn drain_message(self) {
    |...
201 |#cfg(target="js")
202 |pub impl Scheduler for Sandbox with fn hooks(self) {
    |...

```

```mooncram
$ run_moon_ide moon ide outline 'warren/embbed_devtool.mbt'
2 |#warnings("-unused_value")
  |...
7 |#warnings("-unused_value")
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
1 |using @rabbita { new, simple_cell }
  |...
2 |using @html { button, div, h1 }
  |...
4 |enum Msg {
  |...
9 |fn main {
  |...

```
