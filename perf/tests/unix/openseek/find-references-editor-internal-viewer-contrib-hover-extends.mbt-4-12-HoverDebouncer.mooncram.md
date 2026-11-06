# openseek find-references HoverDebouncer editor/internal/viewer/contrib/hover/extends.mbt:4:12

```mooncram
$ moonx '../../../../scripts/bench-moon-ide.mbtx' find-references 'HoverDebouncer' --loc 'editor/internal/viewer/contrib/hover/extends.mbt:4:12' --target js --no-check
Found 22 references for symbol 'HoverDebouncer':
e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\viewer\contrib\hover\browser\content_hover_controller.mbt:30:38-30:52:
   |   priv mut hover_loading_timer : @base_common.Disposable?
   |   /// Source-shaped latest-options debouncers paired with the three owned
   |   /// browser handles above.
30 |   mut hover_async_debouncer : @hover.HoverDebouncer
   |                                      ^^^^^^^^^^^^^^
   |   mut hover_sync_debouncer : @hover.HoverDebouncer
   |   mut hover_loading_debouncer : @hover.HoverDebouncer

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\viewer\contrib\hover\browser\content_hover_controller.mbt:31:37-31:51:
   |   /// Source-shaped latest-options debouncers paired with the three owned
   |   /// browser handles above.
   |   mut hover_async_debouncer : @hover.HoverDebouncer
31 |   mut hover_sync_debouncer : @hover.HoverDebouncer
   |                                     ^^^^^^^^^^^^^^
   |   mut hover_loading_debouncer : @hover.HoverDebouncer
   |   /// Viewer-lifetime async request generation/source. Model swaps and content

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\viewer\contrib\hover\browser\content_hover_controller.mbt:32:40-32:54:
   |   /// browser handles above.
   |   mut hover_async_debouncer : @hover.HoverDebouncer
   |   mut hover_sync_debouncer : @hover.HoverDebouncer
32 |   mut hover_loading_debouncer : @hover.HoverDebouncer
   |                                        ^^^^^^^^^^^^^^
   |   /// Viewer-lifetime async request generation/source. Model swaps and content
   |   /// invalidation advance the generation; it never resets while the

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\viewer\contrib\hover\browser\content_hover_controller.mbt:83:28-83:42:
   |     hover_async_timer: None,
   |     hover_sync_timer: None,
   |     hover_loading_timer: None,
83 |     hover_async_debouncer: HoverDebouncer(),
   |                            ^^^^^^^^^^^^^^
   |     hover_sync_debouncer: HoverDebouncer(),
   |     hover_loading_debouncer: HoverDebouncer(),

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\viewer\contrib\hover\browser\content_hover_controller.mbt:84:27-84:41:
   |     hover_sync_timer: None,
   |     hover_loading_timer: None,
   |     hover_async_debouncer: HoverDebouncer(),
84 |     hover_sync_debouncer: HoverDebouncer(),
   |                           ^^^^^^^^^^^^^^
   |     hover_loading_debouncer: HoverDebouncer(),
   |     hover_request_generation: 0,

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\viewer\contrib\hover\browser\content_hover_controller.mbt:85:30-85:44:
   |     hover_loading_timer: None,
   |     hover_async_debouncer: HoverDebouncer(),
   |     hover_sync_debouncer: HoverDebouncer(),
85 |     hover_loading_debouncer: HoverDebouncer(),
   |                              ^^^^^^^^^^^^^^
   |     hover_request_generation: 0,
   |     hover_request_source: None,

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\viewer\contrib\hover\extends.mbt:4:12-4:26:
  | ///|
  | #deprecated("Use `Debug::to_repr` via the trait or `Repr(value)` instead", skip_current_package=true)
  | #doc(hidden)
4 | pub extend HoverDebouncer with Debug::{to_repr}
  |            ^^^^^^^^^^^^^^
  | 
  | ///|

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\viewer\contrib\hover\hover_controller.mbt:289:8-289:22:
    | ///|
    | /// Creates an idle latest-options debouncer with a caller-selected fallback
    | /// delay. Browser timer ownership remains outside this pure value.
289 | pub fn HoverDebouncer::HoverDebouncer(
    |        ^^^^^^^^^^^^^^
    |   default_delay_ms~ : Int32 = 0,
    | ) -> HoverDebouncer {

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\viewer\contrib\hover\hover_controller.mbt:289:24-289:38:
    | ///|
    | /// Creates an idle latest-options debouncer with a caller-selected fallback
    | /// delay. Browser timer ownership remains outside this pure value.
289 | pub fn HoverDebouncer::HoverDebouncer(
    |                        ^^^^^^^^^^^^^^
    |   default_delay_ms~ : Int32 = 0,
    | ) -> HoverDebouncer {

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\viewer\contrib\hover\hover_controller.mbt:291:6-291:20:
    | /// delay. Browser timer ownership remains outside this pure value.
    | pub fn HoverDebouncer::HoverDebouncer(
    |   default_delay_ms~ : Int32 = 0,
291 | ) -> HoverDebouncer {
    |      ^^^^^^^^^^^^^^
    |   {
    |     default_delay_ms,

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\viewer\contrib\hover\hover_controller.mbt:304:8-304:22:
    | ///|
    | /// Stores the latest options before arming a new generation, exactly the
    | /// source's schedule order. Omitted delay selects the constructor default.
304 | pub fn HoverDebouncer::schedule(
    |        ^^^^^^^^^^^^^^
    |   self : HoverDebouncer,
    |   options : HoverOperationOptions,

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\viewer\contrib\hover\hover_controller.mbt:305:10-305:24:
    | /// Stores the latest options before arming a new generation, exactly the
    | /// source's schedule order. Omitted delay selects the constructor default.
    | pub fn HoverDebouncer::schedule(
305 |   self : HoverDebouncer,
    |          ^^^^^^^^^^^^^^
    |   options : HoverOperationOptions,
    |   delay_ms~ : Int32 = -1,

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\viewer\contrib\hover\hover_controller.mbt:308:14-308:28:
    |   self : HoverDebouncer,
    |   options : HoverOperationOptions,
    |   delay_ms~ : Int32 = -1,
308 | ) -> (Int32, HoverDebouncer) {
    |              ^^^^^^^^^^^^^^
    |   let generation = self.generation + 1
    |   let delay_ms = if delay_ms < 0 { self.default_delay_ms } else { delay_ms }

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\viewer\contrib\hover\hover_controller.mbt:320:8-320:22:
    | ///|
    | /// Cancels the scheduled generation while retaining the latest options, as
    | /// Monaco's debouncer does.
320 | pub fn HoverDebouncer::cancel(self : HoverDebouncer) -> HoverDebouncer {
    |        ^^^^^^^^^^^^^^
    |   { ..self, generation: self.generation + 1, scheduled: false, }
    | }

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\viewer\contrib\hover\hover_controller.mbt:320:38-320:52:
    | ///|
    | /// Cancels the scheduled generation while retaining the latest options, as
    | /// Monaco's debouncer does.
320 | pub fn HoverDebouncer::cancel(self : HoverDebouncer) -> HoverDebouncer {
    |                                      ^^^^^^^^^^^^^^
    |   { ..self, generation: self.generation + 1, scheduled: false, }
    | }

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\viewer\contrib\hover\hover_controller.mbt:320:57-320:71:
    | ///|
    | /// Cancels the scheduled generation while retaining the latest options, as
    | /// Monaco's debouncer does.
320 | pub fn HoverDebouncer::cancel(self : HoverDebouncer) -> HoverDebouncer {
    |                                                         ^^^^^^^^^^^^^^
    |   { ..self, generation: self.generation + 1, scheduled: false, }
    | }

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\viewer\contrib\hover\hover_controller.mbt:327:8-327:22:
    | ///|
    | /// Consumes the latest options only for the still-current scheduled callback.
    | /// A stale or canceled callback is a no-op.
327 | pub fn HoverDebouncer::take(
    |        ^^^^^^^^^^^^^^
    |   self : HoverDebouncer,
    |   generation : Int32,

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\viewer\contrib\hover\hover_controller.mbt:328:10-328:24:
    | /// Consumes the latest options only for the still-current scheduled callback.
    | /// A stale or canceled callback is a no-op.
    | pub fn HoverDebouncer::take(
328 |   self : HoverDebouncer,
    |          ^^^^^^^^^^^^^^
    |   generation : Int32,
    | ) -> (HoverOperationOptions?, HoverDebouncer) {

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\viewer\contrib\hover\hover_controller.mbt:330:31-330:45:
    | pub fn HoverDebouncer::take(
    |   self : HoverDebouncer,
    |   generation : Int32,
330 | ) -> (HoverOperationOptions?, HoverDebouncer) {
    |                               ^^^^^^^^^^^^^^
    |   if !self.scheduled || generation != self.generation {
    |     return (None, self)

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\viewer\contrib\hover\hover_controller.mbt:938:12-938:26:
    | pub extend HoverController with Eq::{equal, not_equal}
    | 
    | ///|
938 | pub extend HoverDebouncer with Eq::{equal, not_equal}
    |            ^^^^^^^^^^^^^^
    | 
    | ///|

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\viewer\contrib\hover\hover_controller_wbtest.mbt:257:13-257:27:
    | 
    | ///|
    | test "pure debouncer retains latest options and rejects stale or canceled runs" {
257 |   assert_eq(HoverDebouncer().default_delay_ms, 0)
    |             ^^^^^^^^^^^^^^
    |   let initial = HoverDebouncer(default_delay_ms=25)
    |   assert_eq(initial.default_delay_ms, 25)

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\viewer\contrib\hover\hover_controller_wbtest.mbt:258:17-258:31:
    | ///|
    | test "pure debouncer retains latest options and rejects stale or canceled runs" {
    |   assert_eq(HoverDebouncer().default_delay_ms, 0)
258 |   let initial = HoverDebouncer(default_delay_ms=25)
    |                 ^^^^^^^^^^^^^^
    |   assert_eq(initial.default_delay_ms, 25)
    |   let first_options = operation_options(3)
"" (escaped)
```
