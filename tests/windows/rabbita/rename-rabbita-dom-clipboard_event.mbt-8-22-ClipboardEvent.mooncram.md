# rabbita rename ClipboardEvent rabbita\dom\clipboard_event.mbt:8:22

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\rabbita' moon ide rename 'ClipboardEvent' 'ClipboardEventRenamed' --loc 'rabbita\dom\clipboard_event.mbt:8:22'
*** Begin Patch
*** Update File: <WORKDIR>/rabbita\dom\clipboard_event.mbt
@@
 ///|
 #cfg(target="js")
 #external
-type ClipboardEvent
+type ClipboardEventRenamed
 
 ///|
 #cfg(target="js")
-pub impl IsEvent for ClipboardEvent
+pub impl IsEvent for ClipboardEventRenamed
 
 ///|
 #cfg(target="js")
-pub impl @js.Cast for ClipboardEvent with fn into(value) {
+pub impl @js.Cast for ClipboardEventRenamed with fn into(value) {
   value |> ffi_to_clipboard_event |> y => { y.to_option() }
 }
 
 ///|
 #cfg(target="js")
-pub impl @js.Cast for ClipboardEvent with fn from(value) {
+pub impl @js.Cast for ClipboardEventRenamed with fn from(value) {
   value |> js_identity
 }
 
 ///|
 #cfg(target="js")
-pub extern "js" fn ClipboardEvent::clipboard_data(self : Self) -> DataTransfer = "(e) => e.clipboardData"
+pub extern "js" fn ClipboardEventRenamed::clipboard_data(self : Self) -> DataTransfer = "(e) => e.clipboardData"
*** Update File: <WORKDIR>/rabbita\dom\event.mbt
@@
   fn stop_immediate_propagation(Self) -> Unit = _
   fn as_event(Self) -> Event = _
   fn to_ui_event(Self) -> UIEvent? = _
-  fn to_clipboard_event(Self) -> ClipboardEvent? = _
+  fn to_clipboard_event(Self) -> ClipboardEventRenamed? = _
   fn to_mouse_event(Self) -> MouseEvent? = _
   /// https://developer.mozilla.org/en-US/docs/Web/API/PointerEvent
   fn to_pointer_event(Self) -> PointerEvent? = _
@@
 #cfg(target="js")
 extern "js" fn ffi_to_clipboard_event(
   x : @js.Value,
-) -> @js.Nullable[ClipboardEvent] =
+) -> @js.Nullable[ClipboardEventRenamed] =
   #| (x) => x instanceof ClipboardEvent ? x : null
 
 ///|
*** Update File: <WORKDIR>/rabbita\html\attrs_event.mbt
@@
 
 ///|
 #cfg(target="js")
-type ClipboardEvent = @dom.ClipboardEvent
+type ClipboardEvent = @dom.ClipboardEventRenamed
 
 ///|
 #cfg(target="js")
*** End Patch

```
