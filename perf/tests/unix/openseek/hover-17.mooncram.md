# openseek hover

```mooncram
$ moonx '../../../../scripts/bench-moon-ide.mbtx' hover 'HoverDebouncer' --loc 'editor/internal/viewer/contrib/hover/extends.mbt:4:12' --target js --no-check
///|
#deprecated("Use `Debug::to_repr` via the trait or `Repr(value)` instead", skip_current_package=true)
#doc(hidden)
pub extend HoverDebouncer with Debug::{to_repr}
           ^^^^^^^^^^^^^^
           ```moonbit
           struct HoverDebouncer {
             default_delay_ms: Int
             generation: Int
             scheduled: Bool
             delay_ms: Int
             options: HoverOperationOptions?
           } derive(Eq, @debug.Debug)
           ```
           ---
           
            Pure latest-options half of Monaco's `Debouncer`. The browser controller
            owns the clearable timer handle; this value owns the deterministic schedule
            generation, selected delay, and latest options read by the callback.

///|
```
