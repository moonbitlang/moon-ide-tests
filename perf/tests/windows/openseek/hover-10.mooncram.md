# openseek hover

````mooncram
$ moonx '../../../../scripts/bench-moon-ide.mbtx' hover 'locale' --loc 'desktop/frontend/markdown/code_copy.mbt:3:3' --target js --no-check
///|
fn code_copy_button(
  locale~ : @i18n.Locale = English,
  ^^^^^^
  ```moonbit
  @i18n.Locale
  ```
  source : String,
) -> @html.Html {
````
