# rabbita hover

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\rabbita' moon ide hover 'Item' --loc 'rabbita\clipboard\clipboard.mbt:2:15'
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
$ run_moon_ide '..\..\..\fixtures\repos\rabbita' moon ide hover 'Text' --loc 'rabbita\clipboard\clipboard.mbt:3:3'
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
$ run_moon_ide '..\..\..\fixtures\repos\rabbita' moon ide hover 'Val' --loc 'rabbita\deprecated.mbt:6:23'
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
$ run_moon_ide '..\..\..\fixtures\repos\rabbita' moon ide hover 'Html' --loc 'rabbita\deprecated.mbt:6:27'
///
/// New components should return `Val[Html]` directly.
#deprecated("Use a `() -> Val[Html]` component. Nested `Cell::view()` composition is no longer supported; use `Val::map`, `Val::switch`, or `Val::assoc` instead.", skip_current_package=true)
pub type Cell = () -> Val[Html]
                          ^^^^
                          ```moonbit
                          #alias(T)
                          struct @html.Html(@vdom.VNode) derive(Eq)
                          ```
                          ---
                          
                           An HTML value produced by the constructors in this package.

///|
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\rabbita' moon ide hover 'ClipboardEvent' --loc 'rabbita\dom\clipboard_event.mbt:8:22'
///|
#cfg(target="js")
pub impl IsEvent for ClipboardEvent
                     ^^^^^^^^^^^^^^
                     ```moonbit
                     type ClipboardEvent
                     ```

///|
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\rabbita' moon ide hover 'IsEvent' --loc 'rabbita\dom\clipboard_event.mbt:8:10'
///|
#cfg(target="js")
pub impl IsEvent for ClipboardEvent
         ^^^^^^^
         ```moonbit
         trait IsEvent : @js.Cast {
           fn target(Self) -> EventTarget = _
           fn current_target(Self) -> @js.Nullable[EventTarget] = _
           fn get_default_prevented(Self) -> Bool = _
           fn get_time_stamp(Self) -> Double = _
           fn composed_path(Self) -> FixedArray[EventTarget] = _
           fn prevent_default(Self) -> Unit = _
           fn stop_propagation(Self) -> Unit = _
           fn stop_immediate_propagation(Self) -> Unit = _
           fn as_event(Self) -> Event = _
           fn to_ui_event(Self) -> UIEvent? = _
           fn to_clipboard_event(Self) -> ClipboardEvent? = _
           fn to_mouse_event(Self) -> MouseEvent? = _
           fn to_pointer_event(Self) -> PointerEvent? = _
           fn to_input_event(Self) -> InputEvent? = _
           fn to_focus_event(Self) -> FocusEvent? = _
           fn to_keyboard_event(Self) -> KeyboardEvent? = _
           fn to_animation_event(Self) -> AnimationEvent? = _
           fn to_before_unload_event(Self) -> BeforeUnloadEvent? = _
           fn to_blob_event(Self) -> BlobEvent? = _
           fn to_close_event(Self) -> CloseEvent? = _
           fn to_composition_event(Self) -> CompositionEvent? = _
           fn to_custom_event(Self) -> CustomEvent? = _
           fn to_drag_event(Self) -> DragEvent? = _
           fn to_message_event(Self) -> MessageEvent? = _
           fn to_wheel_event(Self) -> WheelEvent? = _
         }
         ```

///|
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\rabbita' moon ide hover 'VDom' --loc 'rabbita\internal\vdom\diff.mbt:3:8'
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
$ run_moon_ide '..\..\..\fixtures\repos\rabbita' moon ide hover 'inode' --loc 'rabbita\internal\vdom\diff.mbt:4:7'
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
$ run_moon_ide '..\..\..\fixtures\repos\rabbita' moon ide hover 'Scheduler' --loc 'rabbita\internal\vdom\vdom.mbt:2:19'
No hover information found for symbol 'Scheduler' at rabbita\internal\vdom\vdom.mbt:2:19
[1]
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\rabbita' moon ide hover 'VNode' --loc 'rabbita\internal\vdom\vdom.mbt:6:10'
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
$ run_moon_ide '..\..\..\fixtures\repos\rabbita' moon ide hover 'CardSize' --loc 'rui\card.mbt:2:15'
///|
pub(all) enum CardSize {
              ^^^^^^^^
              ```moonbit
              enum CardSize {
                Default
                Sm
              } derive(@debug.Debug, Eq)
              ```
  Default
  Sm
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\rabbita' moon ide hover 'Sm' --loc 'rui\card.mbt:4:3'
///|
pub(all) enum CardSize {
  Default
  Sm
  ^^
  ```moonbit
  CardSize
  ```
} derive(Debug, Eq)

```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\rabbita' moon ide hover 'SheetSide' --loc 'rui\sheet.mbt:3:15'
///|
/// Edge from which a [`sheet_content`] surface enters the viewport.
pub(all) enum SheetSide {
              ^^^^^^^^^
              ```moonbit
              enum SheetSide {
                SheetTop
                SheetRight
                SheetBottom
                SheetLeft
              } derive(@debug.Debug, Eq)
              ```
              ---
              
               Edge from which a [`sheet_content`] surface enters the viewport.
  SheetTop
  SheetRight
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\rabbita' moon ide hover 'SheetTop' --loc 'rui\sheet.mbt:4:3'
///|
/// Edge from which a [`sheet_content`] surface enters the viewport.
pub(all) enum SheetSide {
  SheetTop
  ^^^^^^^^
  ```moonbit
  SheetSide
  ```
  SheetRight
  SheetBottom
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\rabbita' moon ide hover 'Path' --loc 'warren\path\sourcetree_path.mbt:2:15'
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
$ run_moon_ide '..\..\..\fixtures\repos\rabbita' moon ide hover 'SourcePath' --loc 'warren\path\sourcetree_path.mbt:5:8'
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
$ run_moon_ide '..\..\..\fixtures\repos\rabbita' moon ide hover 'Val' --loc 'warren\templates\minimized\main.mbt:1:23'
Error: no metadata is available for any backend
[1]
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\rabbita' moon ide hover 'Html' --loc 'warren\templates\minimized\main.mbt:1:33'
Error: no metadata is available for any backend
[1]
```
