# rabbita rename IsEvent rabbita\dom\clipboard_event.mbt:8:10

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\rabbita' moon ide rename 'IsEvent' 'IsEventRenamed' --loc 'rabbita\dom\clipboard_event.mbt:8:10'
*** Begin Patch
*** Update File: <WORKDIR>/e2e\apps\dom-api\probe_events.mbt
@@
     calls[0] += 1
     record(
       failures,
-      @dom.IsEventTarget::to_element(@dom.IsEvent::target(event)) is Some(_),
+      @dom.IsEventTarget::to_element(@dom.IsEventRenamed::target(event)) is Some(_),
       "event_target",
     )
     record(
       failures,
-      @dom.IsEvent::current_target(event).to_option() is Some(_),
+      @dom.IsEventRenamed::current_target(event).to_option() is Some(_),
       "event_current_target",
     )
     record(
       failures,
-      @dom.IsEvent::get_time_stamp(event) >= 0.0,
+      @dom.IsEventRenamed::get_time_stamp(event) >= 0.0,
       "event_timestamp",
     )
-    let path = @dom.IsEvent::composed_path(event)
+    let path = @dom.IsEventRenamed::composed_path(event)
     record(failures, !path.is_empty(), "event_composed_path")
     record(
       failures,
@@
       first_node.is_same_node(target_node),
       "event_composed_path_target_first",
     )
-    @dom.IsEvent::prevent_default(event)
+    @dom.IsEventRenamed::prevent_default(event)
     record(
       failures,
-      @dom.IsEvent::get_default_prevented(event),
+      @dom.IsEventRenamed::get_default_prevented(event),
       "event_prevent_default",
     )
-    @dom.IsEvent::stop_propagation(event)
+    @dom.IsEventRenamed::stop_propagation(event)
   }
   let once_listener : @dom.Listener = _ => once_calls[0] += 1
   let removed_listener : @dom.Listener = _ => removed_calls[0] += 1
@@
   )
   let immediate_calls = [0]
   let immediate_listener : @dom.Listener = event => {
-    @dom.IsEvent::stop_immediate_propagation(event)
+    @dom.IsEventRenamed::stop_immediate_propagation(event)
   }
   let skipped_listener : @dom.Listener = _ => immediate_calls[0] += 1
   @dom.IsEventTarget::add_event_listener(
@@
   record(failures, removed_calls[0] == 0, "event_listener_remove")
   record(
     failures,
-    @dom.IsEvent::to_ui_event(first) is None,
+    @dom.IsEventRenamed::to_ui_event(first) is None,
     "generic_not_ui_event",
   )
   record(
     failures,
-    @dom.IsEvent::to_pointer_event(first) is None,
+    @dom.IsEventRenamed::to_pointer_event(first) is None,
     "generic_not_pointer_event",
   )
   record(
     failures,
-    @dom.IsEvent::to_mouse_event(first) is None,
+    @dom.IsEventRenamed::to_mouse_event(first) is None,
     "generic_not_mouse_event",
   )
   record(
     failures,
-    physical_equal(@dom.IsEvent::as_event(first), first),
+    physical_equal(@dom.IsEventRenamed::as_event(first), first),
     "as_event",
   )
   let custom = @dom.CustomEvent::new(
@@
   ignore(composition.get_data())
   record(
     failures,
-    @dom.IsEvent::to_composition_event(composition) is Some(_),
+    @dom.IsEventRenamed::to_composition_event(composition) is Some(_),
     "composition_constructor",
   )
   let blob_event = @dom.BlobEvent::new()
@@
 fn install_fractional_pointer_event_probe(target : @dom.Element) -> Unit {
   let listener : @dom.Listener = event => {
     let failures : Array[String] = []
-    if @dom.IsEvent::to_pointer_event(event) is Some(pointer) {
+    if @dom.IsEventRenamed::to_pointer_event(event) is Some(pointer) {
       record(
         failures,
-        @dom.IsEvent::to_mouse_event(pointer) is Some(_),
+        @dom.IsEventRenamed::to_mouse_event(pointer) is Some(_),
         "pointer_fractional_mouse_event",
       )
       record(
@@
 fn install_pointer_event_probe(target : @dom.Element) -> Unit {
   let listener : @dom.Listener = event => {
     let failures : Array[String] = []
-    if @dom.IsEvent::to_pointer_event(event) is Some(pointer) {
+    if @dom.IsEventRenamed::to_pointer_event(event) is Some(pointer) {
       record(
         failures,
-        @dom.IsEvent::to_mouse_event(pointer) is Some(_),
+        @dom.IsEventRenamed::to_mouse_event(pointer) is Some(_),
         "pointer_mouse_event",
       )
       ignore(@dom.IsMouseEvent::as_mouse_event(pointer))
@@
 fn install_keyboard_event_probe(target : @dom.Element) -> Unit {
   let listener : @dom.Listener = event => {
     let failures : Array[String] = []
-    if @dom.IsEvent::to_keyboard_event(event) is Some(keyboard) {
+    if @dom.IsEventRenamed::to_keyboard_event(event) is Some(keyboard) {
       record(failures, keyboard.key() == "K", "keyboard_key")
       record(failures, keyboard.code() == "KeyK", "keyboard_code")
       record(failures, keyboard.shift_key(), "keyboard_shift")
@@
       )
       record(
         failures,
-        @dom.IsEvent::to_ui_event(keyboard) is Some(_),
+        @dom.IsEventRenamed::to_ui_event(keyboard) is Some(_),
         "keyboard_ui_event",
       )
     } else {
@@
 fn install_input_event_probe(target : @dom.Element) -> Unit {
   let listener : @dom.Listener = event => {
     let failures : Array[String] = []
-    if @dom.IsEvent::to_input_event(event) is Some(input) {
+    if @dom.IsEventRenamed::to_input_event(event) is Some(input) {
       record(failures, input.data() == "x", "input_data")
       record(failures, input.input_type() == "insertText", "input_type")
       record(failures, !input.is_composing(), "input_composing")
@@
     }
   }
   let wheel_listener : @dom.Listener = event => {
-    if @dom.IsEvent::to_wheel_event(event) is Some(wheel) {
+    if @dom.IsEventRenamed::to_wheel_event(event) is Some(wheel) {
       record(failures, wheel.get_delta_x() == 1.0, "wheel_delta_x")
       record(failures, wheel.get_delta_y() == 2.0, "wheel_delta_y")
       record(failures, wheel.get_delta_z() == 3.0, "wheel_delta_z")
@@
   @dom.IsEventTarget::add_event_listener(target, "wheel-probe", wheel_listener)
 
   @dom.IsEventTarget::add_event_listener(target, "focus-probe", event => {
-    if @dom.IsEvent::to_focus_event(event) is Some(focus) {
+    if @dom.IsEventRenamed::to_focus_event(event) is Some(focus) {
       record(failures, focus.related_target() is None, "focus_related_target")
       record(
         failures,
-        @dom.IsEvent::to_ui_event(focus) is Some(_),
+        @dom.IsEventRenamed::to_ui_event(focus) is Some(_),
         "focus_ui_event",
       )
     } else {
@@
     complete()
   })
   @dom.IsEventTarget::add_event_listener(target, "composition-probe", event => {
-    if @dom.IsEvent::to_composition_event(event) is Some(composition) {
+    if @dom.IsEventRenamed::to_composition_event(event) is Some(composition) {
       record(failures, composition.get_data() == "compose", "composition_data")
     } else {
       failures.push("composition_conversion")
@@
     complete()
   })
   @dom.IsEventTarget::add_event_listener(target, "animation-probe", event => {
-    if @dom.IsEvent::to_animation_event(event) is Some(animation) {
+    if @dom.IsEventRenamed::to_animation_event(event) is Some(animation) {
       record(
         failures,
         animation.get_animation_name() == "fade",
@@
     complete()
   })
   @dom.IsEventTarget::add_event_listener(target, "custom-probe", event => {
-    if @dom.IsEvent::to_custom_event(event) is Some(custom) {
+    if @dom.IsEventRenamed::to_custom_event(event) is Some(custom) {
       record(
         failures,
         custom.get_detail().to_string() == "custom detail",
@@
     complete()
   })
   @dom.IsEventTarget::add_event_listener(target, "message-probe", event => {
-    if @dom.IsEvent::to_message_event(event) is Some(message) {
+    if @dom.IsEventRenamed::to_message_event(event) is Some(message) {
       record(
         failures,
         message.get_data_string() == Some("message data"),
@@
     complete()
   })
   @dom.IsEventTarget::add_event_listener(target, "blob-probe", event => {
-    if @dom.IsEvent::to_blob_event(event) is Some(blob) {
+    if @dom.IsEventRenamed::to_blob_event(event) is Some(blob) {
       record(failures, blob.get_data().get_size() == 4, "blob_event_data")
       record(failures, blob.get_timecode() == 1.5, "blob_event_timecode")
     } else {
@@
     complete()
   })
   @dom.IsEventTarget::add_event_listener(target, "drag-probe", event => {
-    if @dom.IsEvent::to_drag_event(event) is Some(drag) {
+    if @dom.IsEventRenamed::to_drag_event(event) is Some(drag) {
       let transfer = drag.get_data_transfer()
       ignore(transfer.drop_effect())
       ignore(transfer.effect_allowed())
@@
     complete()
   })
   @dom.IsEventTarget::add_event_listener(target, "clipboard-probe", event => {
-    if @dom.IsEvent::to_clipboard_event(event) is Some(clipboard) {
+    if @dom.IsEventRenamed::to_clipboard_event(event) is Some(clipboard) {
       let items = clipboard.clipboard_data().items()
       items.add("copy", "text/plain")
       record(failures, items.length() == 1, "clipboard_event_data")
@@
   })
   @dom.IsEventTarget::add_event_listener(@dom.window(), "beforeunload", event => {
     record_before_unload_probe(
-      @dom.IsEvent::to_before_unload_event(event) is Some(_),
+      @dom.IsEventRenamed::to_before_unload_event(event) is Some(_),
     )
   })
 }
*** Update File: <WORKDIR>/e2e\apps\dom-api\probe_io.mbt
@@
         ignore(socket.get_protocol())
       }
       let message_listener : @dom.Listener = event => {
-        if @dom.IsEvent::to_message_event(event) is Some(message) {
+        if @dom.IsEventRenamed::to_message_event(event) is Some(message) {
           let data = message.get_data_string()
           record(
             failures,
@@
         }
       }
       let close_listener : @dom.Listener = event => {
-        if @dom.IsEvent::to_close_event(event) is Some(close) {
+        if @dom.IsEventRenamed::to_close_event(event) is Some(close) {
           record(failures, close.get_code() == 1000, "close_event_code")
           record(failures, close.get_reason() == "done", "close_event_reason")
           ignore(close.get_was_clean())
*** Update File: <WORKDIR>/rabbita\dom\animation_event.mbt
@@
 
 ///|
 #cfg(target="js")
-pub impl IsEvent for AnimationEvent
+pub impl IsEventRenamed for AnimationEvent
 
 ///|
 #cfg(target="js")
*** Update File: <WORKDIR>/rabbita\dom\before_unload_event.mbt
@@
 
 ///|
 #cfg(target="js")
-pub impl IsEvent for BeforeUnloadEvent
+pub impl IsEventRenamed for BeforeUnloadEvent
 
 ///|
 #cfg(target="js")
*** Update File: <WORKDIR>/rabbita\dom\blob_event.mbt
@@
 
 ///|
 #cfg(target="js")
-pub impl IsEvent for BlobEvent
+pub impl IsEventRenamed for BlobEvent
 
 ///|
 #cfg(target="js")
*** Update File: <WORKDIR>/rabbita\dom\clipboard_event.mbt
@@
 
 ///|
 #cfg(target="js")
-pub impl IsEvent for ClipboardEvent
+pub impl IsEventRenamed for ClipboardEvent
 
 ///|
 #cfg(target="js")
*** Update File: <WORKDIR>/rabbita\dom\close_event.mbt
@@
 
 ///|
 #cfg(target="js")
-pub impl IsEvent for CloseEvent
+pub impl IsEventRenamed for CloseEvent
 
 ///|
 #cfg(target="js")
*** Update File: <WORKDIR>/rabbita\dom\composition_event.mbt
@@
 
 ///|
 #cfg(target="js")
-pub impl IsEvent for CompositionEvent
+pub impl IsEventRenamed for CompositionEvent
 
 ///|
 #cfg(target="js")
*** Update File: <WORKDIR>/rabbita\dom\custom_event.mbt
@@
 
 ///|
 #cfg(target="js")
-pub impl IsEvent for CustomEvent
+pub impl IsEventRenamed for CustomEvent
 
 ///|
 #cfg(target="js")
*** Update File: <WORKDIR>/rabbita\dom\drag_event.mbt
@@
 
 ///|
 #cfg(target="js")
-pub impl IsEvent for DragEvent
+pub impl IsEventRenamed for DragEvent
 
 ///|
 #cfg(target="js")
*** Update File: <WORKDIR>/rabbita\dom\event.mbt
@@
 
 ///|
 #cfg(target="js")
-pub trait IsEvent: @js.Cast {
+pub trait IsEventRenamed: @js.Cast {
   fn target(Self) -> EventTarget = _
   fn current_target(Self) -> @js.Nullable[EventTarget] = _
   /// https://developer.mozilla.org/en-US/docs/Web/API/Event/defaultPrevented
@@
 
 ///|
 #cfg(target="js")
-pub impl IsEvent for Event
+pub impl IsEventRenamed for Event
 
 ///|
 #cfg(target="js")
@@
 
 ///|
 #cfg(target="js")
-impl IsEvent with fn target(s) {
+impl IsEventRenamed with fn target(s) {
   s |> js_identity |> ffi_event_target
 }
 
 ///|
 #cfg(target="js")
-impl IsEvent with fn current_target(s) {
+impl IsEventRenamed with fn current_target(s) {
   s |> js_identity |> ffi_event_current_target
 }
 
 ///|
 #cfg(target="js")
-impl IsEvent with fn get_default_prevented(s) {
+impl IsEventRenamed with fn get_default_prevented(s) {
   s |> js_identity |> ffi_event_get_default_prevented
 }
 
 ///|
 #cfg(target="js")
-impl IsEvent with fn get_time_stamp(s) {
+impl IsEventRenamed with fn get_time_stamp(s) {
   s |> js_identity |> ffi_event_get_time_stamp
 }
 
 ///|
 #cfg(target="js")
-impl IsEvent with fn composed_path(s) {
+impl IsEventRenamed with fn composed_path(s) {
   ffi_event_composed_path(js_identity(s))
 }
 
 ///|
 #cfg(target="js")
-impl IsEvent with fn prevent_default(s) {
+impl IsEventRenamed with fn prevent_default(s) {
   s.as_event() |> ffi_event_prevent_default
 }
 
 ///|
 #cfg(target="js")
-impl IsEvent with fn stop_propagation(s) {
+impl IsEventRenamed with fn stop_propagation(s) {
   s.as_event() |> ffi_event_stop_propagation
 }
 
 ///|
 #cfg(target="js")
-impl IsEvent with fn stop_immediate_propagation(s) {
+impl IsEventRenamed with fn stop_immediate_propagation(s) {
   s.as_event() |> ffi_event_stop_immediate_propagation
 }
 
 ///|
 #cfg(target="js")
-impl IsEvent with fn as_event(s) {
+impl IsEventRenamed with fn as_event(s) {
   js_identity(s)
 }
 
 ///|
 #cfg(target="js")
-impl IsEvent with fn to_ui_event(s) {
+impl IsEventRenamed with fn to_ui_event(s) {
   s |> js_identity |> ffi_to_ui_event |> y => { y.to_option() }
 }
 
 ///|
 #cfg(target="js")
-impl IsEvent with fn to_clipboard_event(s) {
+impl IsEventRenamed with fn to_clipboard_event(s) {
   s |> js_identity |> ffi_to_clipboard_event |> y => { y.to_option() }
 }
 
 ///|
 #cfg(target="js")
-impl IsEvent with fn to_mouse_event(s) {
+impl IsEventRenamed with fn to_mouse_event(s) {
   s |> js_identity |> ffi_to_mouse_event |> y => { y.to_option() }
 }
 
 ///|
 #cfg(target="js")
-impl IsEvent with fn to_pointer_event(s) {
+impl IsEventRenamed with fn to_pointer_event(s) {
   s |> js_identity |> ffi_to_pointer_event |> y => { y.to_option() }
 }
 
 ///|
 #cfg(target="js")
-impl IsEvent with fn to_input_event(s) {
+impl IsEventRenamed with fn to_input_event(s) {
   s |> js_identity |> ffi_to_input_event |> y => { y.to_option() }
 }
 
 ///|
 #cfg(target="js")
-impl IsEvent with fn to_focus_event(s) {
+impl IsEventRenamed with fn to_focus_event(s) {
   s |> js_identity |> ffi_to_focus_event |> y => { y.to_option() }
 }
 
 ///|
 #cfg(target="js")
-impl IsEvent with fn to_keyboard_event(s) {
+impl IsEventRenamed with fn to_keyboard_event(s) {
   s |> js_identity |> ffi_to_keyboard_event |> y => { y.to_option() }
 }
 
 ///|
 #cfg(target="js")
-impl IsEvent with fn to_animation_event(s) {
+impl IsEventRenamed with fn to_animation_event(s) {
   s |> js_identity |> ffi_to_animation_event |> y => { y.to_option() }
 }
 
 ///|
 #cfg(target="js")
-impl IsEvent with fn to_before_unload_event(s) {
+impl IsEventRenamed with fn to_before_unload_event(s) {
   s |> js_identity |> ffi_to_before_unload_event |> y => { y.to_option() }
 }
 
 ///|
 #cfg(target="js")
-impl IsEvent with fn to_blob_event(s) {
+impl IsEventRenamed with fn to_blob_event(s) {
   s |> js_identity |> ffi_to_blob_event |> y => { y.to_option() }
 }
 
 ///|
 #cfg(target="js")
-impl IsEvent with fn to_close_event(s) {
+impl IsEventRenamed with fn to_close_event(s) {
   s |> js_identity |> ffi_to_close_event |> y => { y.to_option() }
 }
 
 ///|
 #cfg(target="js")
-impl IsEvent with fn to_composition_event(s) {
+impl IsEventRenamed with fn to_composition_event(s) {
   s |> js_identity |> ffi_to_composition_event |> y => { y.to_option() }
 }
 
 ///|
 #cfg(target="js")
-impl IsEvent with fn to_custom_event(s) {
+impl IsEventRenamed with fn to_custom_event(s) {
   s |> js_identity |> ffi_to_custom_event |> y => { y.to_option() }
 }
 
 ///|
 #cfg(target="js")
-impl IsEvent with fn to_drag_event(s) {
+impl IsEventRenamed with fn to_drag_event(s) {
   s |> js_identity |> ffi_to_drag_event |> y => { y.to_option() }
 }
 
 ///|
 #cfg(target="js")
-impl IsEvent with fn to_message_event(s) {
+impl IsEventRenamed with fn to_message_event(s) {
   s |> js_identity |> ffi_to_message_event |> y => { y.to_option() }
 }
 
 ///|
 #cfg(target="js")
-impl IsEvent with fn to_wheel_event(s) {
+impl IsEventRenamed with fn to_wheel_event(s) {
   s |> js_identity |> ffi_to_wheel_event |> y => { y.to_option() }
 }
 
*** Update File: <WORKDIR>/rabbita\dom\focus_event.mbt
@@
 
 ///|
 #cfg(target="js")
-pub impl IsEvent for FocusEvent
+pub impl IsEventRenamed for FocusEvent
 
 ///|
 #cfg(target="js")
*** Update File: <WORKDIR>/rabbita\dom\input_event.mbt
@@
 
 ///|
 #cfg(target="js")
-pub impl IsEvent for InputEvent
+pub impl IsEventRenamed for InputEvent
 
 ///|
 #cfg(target="js")
*** Update File: <WORKDIR>/rabbita\dom\keyboard_event.mbt
@@
 
 ///|
 #cfg(target="js")
-pub impl IsEvent for KeyboardEvent
+pub impl IsEventRenamed for KeyboardEvent
 
 ///|
 #cfg(target="js")
*** Update File: <WORKDIR>/rabbita\dom\message_event.mbt
@@
 
 ///|
 #cfg(target="js")
-pub impl IsEvent for MessageEvent
+pub impl IsEventRenamed for MessageEvent
 
 ///|
 #cfg(target="js")
*** Update File: <WORKDIR>/rabbita\dom\mouse_event.mbt
@@
 
 ///|
 #cfg(target="js")
-pub impl IsEvent for MouseEvent
+pub impl IsEventRenamed for MouseEvent
 
 ///|
 #cfg(target="js")
*** Update File: <WORKDIR>/rabbita\dom\pointer_event.mbt
@@
 
 ///|
 #cfg(target="js")
-pub impl IsEvent for PointerEvent
+pub impl IsEventRenamed for PointerEvent
 
 ///|
 #cfg(target="js")
*** Update File: <WORKDIR>/rabbita\dom\toggle_event.mbt
@@
 
 ///|
 #cfg(target="js")
-pub impl IsEvent for ToggleEvent
+pub impl IsEventRenamed for ToggleEvent
 
 ///|
 #cfg(target="js")
*** Update File: <WORKDIR>/rabbita\dom\transition_event.mbt
@@
 
 ///|
 #cfg(target="js")
-pub impl IsEvent for TransitionEvent
+pub impl IsEventRenamed for TransitionEvent
 
 ///|
 #cfg(target="js")
*** Update File: <WORKDIR>/rabbita\dom\ui_event.mbt
@@
 
 ///|
 #cfg(target="js")
-pub trait IsUIEvent: IsEvent {
+pub trait IsUIEvent: IsEventRenamed {
   fn as_ui_event(Self) -> UIEvent = _
 }
 
@@
 
 ///|
 #cfg(target="js")
-pub impl IsEvent for UIEvent
+pub impl IsEventRenamed for UIEvent
 
 ///|
 #cfg(target="js")
*** Update File: <WORKDIR>/rabbita\dom\wheel_event.mbt
@@
 
 ///|
 #cfg(target="js")
-pub impl IsEvent for WheelEvent
+pub impl IsEventRenamed for WheelEvent
 
 ///|
 #cfg(target="js")
*** End Patch

```
