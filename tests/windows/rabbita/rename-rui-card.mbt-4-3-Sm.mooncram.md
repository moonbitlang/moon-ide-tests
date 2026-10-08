# rabbita rename Sm rui\card.mbt:4:3

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\rabbita' moon ide rename 'Sm' 'SmRenamed' --loc 'rui\card.mbt:4:3'
*** Begin Patch
*** Update File: <WORKDIR>/rui\card.mbt
@@
 ///|
 pub(all) enum CardSize {
   Default
-  Sm
+  SmRenamed
 } derive(Debug, Eq)
 
 ///|
@@
 fn card_size_style(size : CardSize) -> String {
   match size {
     Default => CardDefaultSizeStyle
-    Sm => CardSmSizeStyle
+    SmRenamed => CardSmSizeStyle
   }
 }
 
@@
 fn card_size_value(size : CardSize) -> String {
   match size {
     Default => "default"
-    Sm => "sm"
+    SmRenamed => "sm"
   }
 }
 
*** Update File: <WORKDIR>/website\homepage\components\foundations_identity_variants.mbt
@@
       identity_demo_section(
         "Small",
         "Compact card composition.",
-        @rui.card(size=Sm, [
+        @rui.card(size=SmRenamed, [
           @rui.card_header([
             @rui.card_title("Preview build"),
             @rui.card_description("A compact card using the same composition."),
*** Update File: <WORKDIR>/website\homepage\components\interactions_collapsible.mbt
@@
         public_images,
       ],
     )
-    @rui.card(size=Sm, style=[IgCollapsibleTreeCardStyle], [
+    @rui.card(size=SmRenamed, style=[IgCollapsibleTreeCardStyle], [
       @rui.card_header(tabs_html),
       @rui.card_content(
         @html.div(style=[IgCollapsibleTreeListStyle], [
*** End Patch

```
