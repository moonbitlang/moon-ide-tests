# openseek outline

```mooncram
$ moonx '../../../../scripts/bench-moon-ide.mbtx' outline 'desktop/frontend/markdown/code_copy.mbt' --target js --no-check
  2 |fn code_copy_button(
  3 |  locale~ : @i18n.Locale = English,
  4 |  source : String,
  5 |) -> @html.Html {
    |...
 29 |pub fn copy_button(
 30 |  locale~ : @i18n.Locale = English,
 31 |  source : String,
 32 |  class~ : String,
 33 |  title~ : String,
 34 |  label~ : String,
 35 |) -> @html.Html {
    |...
 95 |fn copy_button_feedback(
 96 |  button : @dom.EventTarget,
 97 |  copied : Bool,
 98 |  title : String,
 99 |  label : String,
100 |  feedback : String,
101 |) -> Unit {
    |...
139 |let copy_feedback_timers : @js.Value = @js.globalThis.new_with_string(
    |...
"" (escaped)
```
