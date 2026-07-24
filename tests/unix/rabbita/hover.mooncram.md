# rabbita hover

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
$ run_moon_ide moon ide hover 'Item' --loc 'rabbita/clipboard/clipboard.mbt:2:15'
Error: could not get package of loc rabbita/clipboard/clipboard.mbt:2:15
[1]
```

```mooncram
$ run_moon_ide moon ide hover 'Text' --loc 'rabbita/clipboard/clipboard.mbt:3:3'
Error: could not get package of loc rabbita/clipboard/clipboard.mbt:3:3
[1]
```

```mooncram
$ run_moon_ide moon ide hover 'Val' --loc 'rabbita/deprecated.mbt:6:23'
///
/// New components should return `Val[Html]` directly.
#deprecated("Use a `() -> Val[Html]` component. Nested `Cell::view()` composition is no longer supported; use `Val::map`, `Val::switch`, or `Val::assoc` instead.", skip_current_package=true)
pub type Cell = () -> Val[Html]
                      ^^^
                      ```moonbit
                      struct Val[A](@duplix.Node[A])
                      ```
                      ---
                      
                       A lazily evaluated value in Rabbita's incremental graph.
                      
                       Derived values are recomputed on demand after one of their dependencies
                       changes.

///|
```

```mooncram
$ run_moon_ide moon ide hover 'Html' --loc 'rabbita/deprecated.mbt:6:27'
///
/// New components should return `Val[Html]` directly.
#deprecated("Use a `() -> Val[Html]` component. Nested `Cell::view()` composition is no longer supported; use `Val::map`, `Val::switch`, or `Val::assoc` instead.", skip_current_package=true)
pub type Cell = () -> Val[Html]
                          ^^^^
                          ```moonbit
                          type Html = @html.Html
                          ```
                          ---
                          
                           An HTML value produced by the constructors in this package.

///|
```

```mooncram
$ run_moon_ide moon ide hover 'ClipboardEvent' --loc 'rabbita/dom/clipboard_event.mbt:8:22'
No hover information found for symbol 'ClipboardEvent' at rabbita/dom/clipboard_event.mbt:8:22
[1]
```

```mooncram
$ run_moon_ide moon ide hover 'IsEvent' --loc 'rabbita/dom/clipboard_event.mbt:8:10'
No hover information found for symbol 'IsEvent' at rabbita/dom/clipboard_event.mbt:8:10
[1]
```

```mooncram
$ run_moon_ide moon ide hover 'Queue' --loc 'rabbita/internal/runtime/sandbox.mbt:3:20'
No hover information found for symbol 'Queue' at rabbita/internal/runtime/sandbox.mbt:3:20
[1]
```

```mooncram
$ run_moon_ide moon ide hover 'Sandbox' --loc 'rabbita/internal/runtime/sandbox.mbt:17:17'
No hover information found for symbol 'Sandbox' at rabbita/internal/runtime/sandbox.mbt:17:17
[1]
```

```mooncram
$ run_moon_ide moon ide hover 'CardSize' --loc 'rui/card.mbt:2:15'
Error: could not get package of loc rui/card.mbt:2:15
[1]
```

```mooncram
$ run_moon_ide moon ide hover 'Sm' --loc 'rui/card.mbt:4:3'
Error: could not get package of loc rui/card.mbt:4:3
[1]
```

```mooncram
$ run_moon_ide moon ide hover 'install_date_picker_test_window' --loc 'rui/date_picker_test.mbt:3:16'
Error: could not get package of loc rui/date_picker_test.mbt:3:16
[1]
```

```mooncram
$ run_moon_ide moon ide hover 'render_incremental_date_picker' --loc 'rui/date_picker_test.mbt:13:4'
Error: could not get package of loc rui/date_picker_test.mbt:13:4
[1]
```

```mooncram
$ run_moon_ide moon ide hover 'SheetSide' --loc 'rui/sheet.mbt:3:15'
Error: could not get package of loc rui/sheet.mbt:3:15
[1]
```

```mooncram
$ run_moon_ide moon ide hover 'SheetTop' --loc 'rui/sheet.mbt:4:3'
Error: could not get package of loc rui/sheet.mbt:4:3
[1]
```

```mooncram
$ run_moon_ide moon ide hover 'Path' --loc 'warren/path/sourcetree_path.mbt:2:15'
///|
pub type Path = @p.Path
         ^^^^
         ```moonbit
         type Path = @p.Path
         ```
         ---
         
          A newtype wrapper provide path operation methods.

///|
```

```mooncram
$ run_moon_ide moon ide hover 'SourcePath' --loc 'warren/path/sourcetree_path.mbt:5:8'
pub type Path = @p.Path

///|
struct SourcePath(String) derive(Eq, Compare, Hash)
       ^^^^^^^^^^
       ```moonbit
       struct SourcePath(String) derive(Eq, Compare, Hash)
       ```

///|
```

```mooncram
$ run_moon_ide moon ide hover 'Val' --loc 'warren/templates/minimized/main.mbt:1:23'
Error: <WORKDIR>/warren/templates/minimized/_build/packages.json: No such file or directory
[1]
```

```mooncram
$ run_moon_ide moon ide hover 'Html' --loc 'warren/templates/minimized/main.mbt:1:33'
Error: <WORKDIR>/warren/templates/minimized/_build/packages.json: No such file or directory
[1]
```
