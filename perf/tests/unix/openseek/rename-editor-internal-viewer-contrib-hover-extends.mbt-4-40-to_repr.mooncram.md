# openseek rename to_repr editor/internal/viewer/contrib/hover/extends.mbt:4:40

```mooncram
$ moonx '../../../../scripts/bench-moon-ide.mbtx' rename 'to_repr' 'to_repr_renamed' --loc 'editor/internal/viewer/contrib/hover/extends.mbt:4:40' --target js --no-check
*** Begin Patch
*** Update File: e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\viewer\contrib\hover\extends.mbt
@@
 ///|
 #deprecated("Use `Debug::to_repr` via the trait or `Repr(value)` instead", skip_current_package=true)
 #doc(hidden)
-pub extend HoverDebouncer with Debug::{to_repr}
+pub extend HoverDebouncer with Debug::{to_repr_renamed}
 
 ///|
 #deprecated("Use `Debug::to_repr` via the trait or `Repr(value)` instead", skip_current_package=true)
*** End Patch
"" (escaped)
```
