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
$ run_moon_ide moon ide hover 'Html' --loc 'e2e/apps/rui/fixture/fixture.mbt:2:22'
///|
using @rabbita {type Html, type Val}
                     ^^^^
                     ```moonbit
                     #alias(T)
                     struct @html.Html(@moonbit-community/rabbita/internal/vdom.VNode) derive(Eq)
                     ```
                     ---
                     
                      An HTML value produced by the constructors in this package.

///|
```

```mooncram
$ run_moon_ide moon ide hover 'Val' --loc 'e2e/apps/rui/fixture/fixture.mbt:2:33'
///|
using @rabbita {type Html, type Val}
                                ^^^
                                ```moonbit
                                type @rabbita.Val[A]
                                ```
                                ---
                                
                                 A lazily evaluated value in Rabbita's incremental graph.
                                
                                 Derived values are recomputed on demand after one of their dependencies
                                 changes.

///|
```

```mooncram
$ run_moon_ide moon ide hover 'fixture_scroll_items' --loc 'e2e/apps/rui/message-scroller/message_scroller.mbt:2:4'
///|
fn fixture_scroll_items(prefix : String) -> Array[Html] {
   ^^^^^^^^^^^^^^^^^^^^
   ```moonbit
   fn fixture_scroll_items(prefix : String) -> Array[@html.Html]
   ```
  let items : Array[Html] = []
  for index in 1..<=18 {
```

```mooncram
$ run_moon_ide moon ide hover 'prefix' --loc 'e2e/apps/rui/message-scroller/message_scroller.mbt:2:25'
///|
fn fixture_scroll_items(prefix : String) -> Array[Html] {
                        ^^^^^^
                        ```moonbit
                        String
                        ```
  let items : Array[Html] = []
  for index in 1..<=18 {
```

```mooncram
$ run_moon_ide moon ide hover 'Html' --loc 'e2e/apps/rui/toast/main.mbt:2:22'
///|
using @rabbita {type Html, type Val}
                     ^^^^
                     ```moonbit
                     #alias(T)
                     struct @html.Html(@moonbit-community/rabbita/internal/vdom.VNode) derive(Eq)
                     ```
                     ---
                     
                      An HTML value produced by the constructors in this package.

///|
```

```mooncram
$ run_moon_ide moon ide hover 'Val' --loc 'e2e/apps/rui/toast/main.mbt:2:33'
///|
using @rabbita {type Html, type Val}
                                ^^^
                                ```moonbit
                                type @rabbita.Val[A]
                                ```
                                ---
                                
                                 A lazily evaluated value in Rabbita's incremental graph.
                                
                                 Derived values are recomputed on demand after one of their dependencies
                                 changes.

///|
```

```mooncram
$ run_moon_ide moon ide hover 'Item' --loc 'rabbita/clipboard/clipboard.mbt:2:15'
///|
pub(all) enum Item {
              ^^^^
              ```moonbit
              enum Item {
                Text(String)
              }
              ```
  Text(String)
}
```

```mooncram
$ run_moon_ide moon ide hover 'Text' --loc 'rabbita/clipboard/clipboard.mbt:3:3'
///|
pub(all) enum Item {
  Text(String)
  ^^^^
  ```moonbit
  (String) -> Item
  ```
}

```

```mooncram
$ run_moon_ide moon ide hover 'VDom' --loc 'rabbita/internal/vdom/diff.mbt:3:8'
///|
#cfg(target="js")
struct VDom {
       ^^^^
       ```moonbit
       struct VDom {
         mut inode: INode
         target_element: @dom.Element?
         captured_link_listener: (@dom.Event) -> Unit
       }
       ```
  mut inode : INode
  target_element : @dom.Element?
```

```mooncram
$ run_moon_ide moon ide hover 'inode' --loc 'rabbita/internal/vdom/diff.mbt:4:7'
///|
#cfg(target="js")
struct VDom {
  mut inode : INode
      ^^^^^
      ```moonbit
      INode
      ```
  target_element : @dom.Element?
  captured_link_listener : @dom.Listener
```

```mooncram
$ run_moon_ide moon ide hover 'Scheduler' --loc 'rabbita/internal/vdom/vdom.mbt:2:19'
No hover information found for symbol 'Scheduler' at rabbita/internal/vdom/vdom.mbt:2:19
[1]
```

```mooncram
$ run_moon_ide moon ide hover 'VNode' --loc 'rabbita/internal/vdom/vdom.mbt:6:10'
///|
#warnings("-unused_constructor")
pub enum VNode {
         ^^^^^
         ```moonbit
         #warnings("-unused_constructor")
         enum VNode {
           Elem(String, Props, Children[VNode], namespace_uri~ : String?)
           Text(String)
           Frag(Array[VNode])
           Thunk(Int, () -> VNode)
         }
         ```
  Elem(String, Props, Children[VNode], namespace_uri~ : String?)
  Text(String)
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
Error: no metadata is available for any backend
[1]
```

```mooncram
$ run_moon_ide moon ide hover 'Html' --loc 'warren/templates/minimized/main.mbt:1:33'
Error: no metadata is available for any backend
[1]
```

```mooncram
$ run_moon_ide moon ide hover 'host' --loc 'warren/templates/server/cmd/server/main.mbt:3:7'
Error: no metadata is available for any backend
[1]
```

```mooncram
$ run_moon_ide moon ide hover 'unwrap_or' --loc 'warren/templates/server/cmd/server/main.mbt:3:46'
Error: no metadata is available for any backend
[1]
```
