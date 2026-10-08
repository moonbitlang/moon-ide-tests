# rabbita find-references CardSize rui\card.mbt:2:15

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\rabbita' moon ide find-references 'CardSize' --loc 'rui\card.mbt:2:15'
Found 3 references for symbol 'CardSize':
<WORKDIR>/rui\card.mbt:35:27-35:35:
   | const CardFooterStyle : String = "display:flex;align-items:center;padding-inline:var(--rui-card-spacing,1.5rem);border-radius:0 0 var(--rui-card-radius,0.875rem) var(--rui-card-radius,0.875rem)"
   | 
   | ///|
35 | fn card_size_style(size : CardSize) -> String {
   |                           ^^^^^^^^
   |   match size {
   |     Default => CardDefaultSizeStyle

<WORKDIR>/rui\card.mbt:43:27-43:35:
   | }
   | 
   | ///|
43 | fn card_size_value(size : CardSize) -> String {
   |                           ^^^^^^^^
   |   match size {
   |     Default => "default"

<WORKDIR>/rui\card.mbt:61:11-61:19:
   | /// `--rui-card-spacing` is inherited by every card part. Appending a value through
   | /// `style` changes the spacing of the complete composition without CSS setup.
   | pub fn[C : @html.IsChildren] card(
61 |   size? : CardSize = Default,
   |           ^^^^^^^^
   |   id? : String,
   |   class? : String,

```
