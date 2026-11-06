# openseek hover

````mooncram
$ moonx '../../../../scripts/bench-moon-ide.mbtx' hover 'code_copy_button' --loc 'desktop/frontend/markdown/code_copy.mbt:2:4' --target js --no-check
///|
fn code_copy_button(
   ^^^^^^^^^^^^^^^^
   ```moonbit
   fn code_copy_button(locale? : @i18n.Locale, source : String) -> @html.Html
   ```
  locale~ : @i18n.Locale = English,
  source : String,
````
