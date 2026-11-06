# openseek rename HoverDebouncer editor/internal/viewer/contrib/hover/extends.mbt:4:12

```mooncram
$ moonx '../../../../scripts/bench-moon-ide.mbtx' rename 'HoverDebouncer' 'HoverDebouncerRenamed' --loc 'editor/internal/viewer/contrib/hover/extends.mbt:4:12' --target js --no-check
*** Begin Patch
*** Update File: e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\viewer\contrib\hover\browser\content_hover_controller.mbt
@@
   priv mut hover_loading_timer : @base_common.Disposable?
   /// Source-shaped latest-options debouncers paired with the three owned
   /// browser handles above.
-  mut hover_async_debouncer : @hover.HoverDebouncer
+  mut hover_async_debouncer : @hover.HoverDebouncerRenamed
-  mut hover_sync_debouncer : @hover.HoverDebouncer
+  mut hover_sync_debouncer : @hover.HoverDebouncerRenamed
-  mut hover_loading_debouncer : @hover.HoverDebouncer
+  mut hover_loading_debouncer : @hover.HoverDebouncerRenamed
   /// Viewer-lifetime async request generation/source. Model swaps and content
   /// invalidation advance the generation; it never resets while the
   /// contribution remains attached.
@@
     hover_async_timer: None,
     hover_sync_timer: None,
     hover_loading_timer: None,
-    hover_async_debouncer: HoverDebouncer(),
+    hover_async_debouncer: HoverDebouncerRenamed(),
-    hover_sync_debouncer: HoverDebouncer(),
+    hover_sync_debouncer: HoverDebouncerRenamed(),
-    hover_loading_debouncer: HoverDebouncer(),
+    hover_loading_debouncer: HoverDebouncerRenamed(),
     hover_request_generation: 0,
     hover_request_source: None,
     hover_is_mouse_down: false,
*** Update File: e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\viewer\contrib\hover\extends.mbt
@@
 ///|
 #deprecated("Use `Debug::to_repr` via the trait or `Repr(value)` instead", skip_current_package=true)
 #doc(hidden)
-pub extend HoverDebouncer with Debug::{to_repr}
+pub extend HoverDebouncerRenamed with Debug::{to_repr}
 
 ///|
 #deprecated("Use `Debug::to_repr` via the trait or `Repr(value)` instead", skip_current_package=true)
*** Update File: e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\viewer\contrib\hover\hover_controller.mbt
@@
 /// Pure latest-options half of Monaco's `Debouncer`. The browser controller
 /// owns the clearable timer handle; this value owns the deterministic schedule
 /// generation, selected delay, and latest options read by the callback.
-struct HoverDebouncer {
+struct HoverDebouncerRenamed {
   default_delay_ms : Int32
   generation : Int32
   scheduled : Bool
@@
 ///|
 /// Creates an idle latest-options debouncer with a caller-selected fallback
 /// delay. Browser timer ownership remains outside this pure value.
-pub fn HoverDebouncer::HoverDebouncer(
+pub fn HoverDebouncerRenamed::HoverDebouncerRenamed(
   default_delay_ms~ : Int32 = 0,
-) -> HoverDebouncer {
+) -> HoverDebouncerRenamed {
   {
     default_delay_ms,
     generation: 0,
@@
 ///|
 /// Stores the latest options before arming a new generation, exactly the
 /// source's schedule order. Omitted delay selects the constructor default.
-pub fn HoverDebouncer::schedule(
+pub fn HoverDebouncerRenamed::schedule(
-  self : HoverDebouncer,
+  self : HoverDebouncerRenamed,
   options : HoverOperationOptions,
   delay_ms~ : Int32 = -1,
-) -> (Int32, HoverDebouncer) {
+) -> (Int32, HoverDebouncerRenamed) {
   let generation = self.generation + 1
   let delay_ms = if delay_ms < 0 { self.default_delay_ms } else { delay_ms }
   (
@@
 ///|
 /// Cancels the scheduled generation while retaining the latest options, as
 /// Monaco's debouncer does.
-pub fn HoverDebouncer::cancel(self : HoverDebouncer) -> HoverDebouncer {
+pub fn HoverDebouncerRenamed::cancel(self : HoverDebouncerRenamed) -> HoverDebouncerRenamed {
   { ..self, generation: self.generation + 1, scheduled: false, }
 }
 
@@
 ///|
 /// Consumes the latest options only for the still-current scheduled callback.
 /// A stale or canceled callback is a no-op.
-pub fn HoverDebouncer::take(
+pub fn HoverDebouncerRenamed::take(
-  self : HoverDebouncer,
+  self : HoverDebouncerRenamed,
   generation : Int32,
-) -> (HoverOperationOptions?, HoverDebouncer) {
+) -> (HoverOperationOptions?, HoverDebouncerRenamed) {
   if !self.scheduled || generation != self.generation {
     return (None, self)
   }
@@
 pub extend HoverController with Eq::{equal, not_equal}
 
 ///|
-pub extend HoverDebouncer with Eq::{equal, not_equal}
+pub extend HoverDebouncerRenamed with Eq::{equal, not_equal}
 
 ///|
 pub extend HoverOperation with Debug::{to_repr}
*** Update File: e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\viewer\contrib\hover\hover_controller_wbtest.mbt
@@
 
 ///|
 test "pure debouncer retains latest options and rejects stale or canceled runs" {
-  assert_eq(HoverDebouncer().default_delay_ms, 0)
+  assert_eq(HoverDebouncerRenamed().default_delay_ms, 0)
-  let initial = HoverDebouncer(default_delay_ms=25)
+  let initial = HoverDebouncerRenamed(default_delay_ms=25)
   assert_eq(initial.default_delay_ms, 25)
   let first_options = operation_options(3)
   let (first_generation, first) = initial.schedule(first_options)
*** End Patch
"" (escaped)
```
