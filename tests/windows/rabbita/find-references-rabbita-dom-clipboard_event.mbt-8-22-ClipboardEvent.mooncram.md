# rabbita find-references ClipboardEvent rabbita\dom\clipboard_event.mbt:8:22

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\rabbita' moon ide find-references 'ClipboardEvent' --loc 'rabbita\dom\clipboard_event.mbt:8:22'
Found 7 references for symbol 'ClipboardEvent':
<WORKDIR>/rabbita\dom\clipboard_event.mbt:8:22-8:36:
  | 
  | ///|
  | #cfg(target="js")
8 | pub impl IsEvent for ClipboardEvent
  |                      ^^^^^^^^^^^^^^
  | 
  | ///|

<WORKDIR>/rabbita\dom\clipboard_event.mbt:12:23-12:37:
   | 
   | ///|
   | #cfg(target="js")
12 | pub impl @js.Cast for ClipboardEvent with fn into(value) {
   |                       ^^^^^^^^^^^^^^
   |   value |> ffi_to_clipboard_event |> y => { y.to_option() }
   | }

<WORKDIR>/rabbita\dom\clipboard_event.mbt:18:23-18:37:
   | 
   | ///|
   | #cfg(target="js")
18 | pub impl @js.Cast for ClipboardEvent with fn from(value) {
   |                       ^^^^^^^^^^^^^^
   |   value |> js_identity
   | }

<WORKDIR>/rabbita\dom\clipboard_event.mbt:24:20-24:34:
   | 
   | ///|
   | #cfg(target="js")
24 | pub extern "js" fn ClipboardEvent::clipboard_data(self : Self) -> DataTransfer = "(e) => e.clipboardData"
   |                    ^^^^^^^^^^^^^^

<WORKDIR>/rabbita\dom\event.mbt:44:34-44:48:
   |   fn stop_immediate_propagation(Self) -> Unit = _
   |   fn as_event(Self) -> Event = _
   |   fn to_ui_event(Self) -> UIEvent? = _
44 |   fn to_clipboard_event(Self) -> ClipboardEvent? = _
   |                                  ^^^^^^^^^^^^^^
   |   fn to_mouse_event(Self) -> MouseEvent? = _
   |   /// https://developer.mozilla.org/en-US/docs/Web/API/PointerEvent

<WORKDIR>/rabbita\dom\event.mbt:261:19-261:33:
    | #cfg(target="js")
    | extern "js" fn ffi_to_clipboard_event(
    |   x : @js.Value,
261 | ) -> @js.Nullable[ClipboardEvent] =
    |                   ^^^^^^^^^^^^^^
    |   #| (x) => x instanceof ClipboardEvent ? x : null
    | 

<WORKDIR>/rabbita\html\attrs_event.mbt:19:28-19:42:
   | 
   | ///|
   | #cfg(target="js")
19 | type ClipboardEvent = @dom.ClipboardEvent
   |                            ^^^^^^^^^^^^^^
   | 
   | ///|

```
