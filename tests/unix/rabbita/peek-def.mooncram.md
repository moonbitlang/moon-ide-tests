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
$ run_moon_ide moon ide peek-def 'Item' --loc 'rabbita/clipboard/clipboard.mbt:2:15'
Error: could not get package of loc rabbita/clipboard/clipboard.mbt:2:15
[1]
```

```mooncram
$ run_moon_ide moon ide peek-def 'Text' --loc 'rabbita/clipboard/clipboard.mbt:3:3'
Error: could not get package of loc rabbita/clipboard/clipboard.mbt:3:3
[1]
```

```mooncram
$ run_moon_ide moon ide peek-def 'Val' --loc 'rabbita/deprecated.mbt:6:23'
Error: could not get package of loc rabbita/deprecated.mbt:6:23
[1]
```

```mooncram
$ run_moon_ide moon ide peek-def 'Html' --loc 'rabbita/deprecated.mbt:6:27'
Error: could not get package of loc rabbita/deprecated.mbt:6:27
[1]
```

```mooncram
$ run_moon_ide moon ide peek-def 'ClipboardEvent' --loc 'rabbita/dom/clipboard_event.mbt:8:22'
Error: could not get package of loc rabbita/dom/clipboard_event.mbt:8:22
[1]
```

```mooncram
$ run_moon_ide moon ide peek-def 'IsEvent' --loc 'rabbita/dom/clipboard_event.mbt:8:10'
Error: could not get package of loc rabbita/dom/clipboard_event.mbt:8:10
[1]
```

```mooncram
$ run_moon_ide moon ide peek-def 'ImageData' --loc 'rabbita/dom/image_data.mbt:8:20'
Error: could not get package of loc rabbita/dom/image_data.mbt:8:20
[1]
```

```mooncram
$ run_moon_ide moon ide peek-def 'new' --loc 'rabbita/dom/image_data.mbt:8:31'
Error: could not get package of loc rabbita/dom/image_data.mbt:8:31
[1]
```

```mooncram
$ run_moon_ide moon ide peek-def 'Queue' --loc 'rabbita/internal/runtime/sandbox.mbt:3:20'
Error: could not get package of loc rabbita/internal/runtime/sandbox.mbt:3:20
[1]
```

```mooncram
$ run_moon_ide moon ide peek-def 'Sandbox' --loc 'rabbita/internal/runtime/sandbox.mbt:17:17'
Error: could not get package of loc rabbita/internal/runtime/sandbox.mbt:17:17
[1]
```

```mooncram
$ run_moon_ide moon ide peek-def 'CardSize' --loc 'rui/card.mbt:2:15'
Error: could not get package of loc rui/card.mbt:2:15
[1]
```

```mooncram
$ run_moon_ide moon ide peek-def 'Sm' --loc 'rui/card.mbt:4:3'
Error: could not get package of loc rui/card.mbt:4:3
[1]
```

```mooncram
$ run_moon_ide moon ide peek-def 'SheetSide' --loc 'rui/sheet.mbt:3:15'
Error: could not get package of loc rui/sheet.mbt:3:15
[1]
```

```mooncram
$ run_moon_ide moon ide peek-def 'SheetTop' --loc 'rui/sheet.mbt:4:3'
Error: could not get package of loc rui/sheet.mbt:4:3
[1]
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
  | pub impl Debug for SourcePath with fn to_repr(self) {
  |   @debug.Repr::string(self.0)
  | }
  | 
  | ///|
  | pub fn SourcePath::new(s : String) -> Self {
  |   Path::resolve(s).0
  | }
  | 
Definition found at file <WORKDIR>/.mooncakes/moonbitlang/x/path/path.mbt
   | ///|
   | let is_windows : Bool = @ffi.is_windows()
   | 
   | ///|
   | /// A newtype wrapper provide path operation methods.
25 | pub(all) struct Path(String) derive(Eq, Debug)
   |                 ^^^^
   | 
   | ///|
   | pub impl Show for Path with output(path, logger) {
   |   logger.write_object(path.0)
   | }
   | 
   | ///|
   | pub impl Show for Path with to_string(path) {
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
$ run_moon_ide moon ide peek-def 'Val' --loc 'warren/templates/minimized/main.mbt:1:23'
Error: <WORKDIR>/warren/templates/minimized/_build/packages.json: No such file or directory
[1]
```

```mooncram
$ run_moon_ide moon ide peek-def 'Html' --loc 'warren/templates/minimized/main.mbt:1:33'
Error: <WORKDIR>/warren/templates/minimized/_build/packages.json: No such file or directory
[1]
```
