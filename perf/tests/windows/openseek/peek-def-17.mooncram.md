# openseek peek-def

```mooncram
$ moonx '../../../../scripts/bench-moon-ide.mbtx' peek-def 'HoverDebouncer' --loc 'editor/internal/viewer/contrib/hover/extends.mbt:4:12' --target js --no-check
Definition found at file e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\viewer\contrib\hover\hover_controller.mbt
    | 
    | ///|
    | /// Pure latest-options half of Monaco's `Debouncer`. The browser controller
    | /// owns the clearable timer handle; this value owns the deterministic schedule
    | /// generation, selected delay, and latest options read by the callback.
278 | struct HoverDebouncer {
    |        ^^^^^^^^^^^^^^
    |   default_delay_ms : Int32
    |   generation : Int32
    |   scheduled : Bool
    |   delay_ms : Int32
    |   options : HoverOperationOptions?
    | } derive(Eq, Debug)
    | 
    | ///|
    | /// Creates an idle latest-options debouncer with a caller-selected fallback
    | /// delay. Browser timer ownership remains outside this pure value.
    | pub fn HoverDebouncer::HoverDebouncer(
    |   default_delay_ms~ : Int32 = 0,
    | ) -> HoverDebouncer {
    |   {
```
