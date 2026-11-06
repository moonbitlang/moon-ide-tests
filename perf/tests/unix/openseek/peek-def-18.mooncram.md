# openseek peek-def

```mooncram
$ moonx '../../../../scripts/bench-moon-ide.mbtx' peek-def 'to_repr' --loc 'editor/internal/viewer/contrib/hover/extends.mbt:4:40' --target js --no-check
Definition found at file e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\viewer\contrib\hover\extends.mbt
  | ///|
  | #deprecated("Use `Debug::to_repr` via the trait or `Repr(value)` instead", skip_current_package=true)
  | #doc(hidden)
4 | pub extend HoverDebouncer with Debug::{to_repr}
  |                                        ^^^^^^^
  | 
  | ///|
  | #deprecated("Use `Debug::to_repr` via the trait or `Repr(value)` instead", skip_current_package=true)
  | #doc(hidden)
  | pub extend HoverParticipantOwner with Debug::{to_repr}
Definition found at file e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\viewer\contrib\hover\hover_controller.mbt
    |   default_delay_ms : Int32
    |   generation : Int32
    |   scheduled : Bool
    |   delay_ms : Int32
    |   options : HoverOperationOptions?
284 | } derive(Eq, Debug)
    |              ^^^^^
    | 
    | ///|
    | /// Creates an idle latest-options debouncer with a caller-selected fallback
    | /// delay. Browser timer ownership remains outside this pure value.
    | pub fn HoverDebouncer::HoverDebouncer(
    |   default_delay_ms~ : Int32 = 0,
    | ) -> HoverDebouncer {
    |   {
    |     default_delay_ms,
    |     generation: 0,
    |     scheduled: false,
    |     delay_ms: default_delay_ms,
    |     options: None,
    |   }
```
