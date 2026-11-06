# openseek outline

```mooncram
$ moonx '../../../../scripts/bench-moon-ide.mbtx' outline 'editor/internal/viewer/contrib/hover/extends.mbt' --target js --no-check
2 |#deprecated("Use `Debug::to_repr` via the trait or `Repr(value)` instead", skip_current_package=true)
3 |#doc(hidden)
4 |pub extend HoverDebouncer with Debug::{to_repr}
  |...
7 |#deprecated("Use `Debug::to_repr` via the trait or `Repr(value)` instead", skip_current_package=true)
8 |#doc(hidden)
9 |pub extend HoverParticipantOwner with Debug::{to_repr}
  |...
"" (escaped)
```
