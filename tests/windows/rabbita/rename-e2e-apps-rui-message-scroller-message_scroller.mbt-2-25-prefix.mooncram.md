# rabbita rename prefix e2e\apps\rui\message-scroller\message_scroller.mbt:2:25

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\rabbita' moon ide rename 'prefix' 'prefix_renamed' --loc 'e2e\apps\rui\message-scroller\message_scroller.mbt:2:25'
*** Begin Patch
*** Update File: <WORKDIR>/e2e\apps\rui\message-scroller\message_scroller.mbt
@@
 ///|
-fn fixture_scroll_items(prefix : String) -> Array[Html] {
+fn fixture_scroll_items(prefix_renamed : String) -> Array[Html] {
   let items : Array[Html] = []
   for index in 1..<=18 {
     items.push(
       div(
-        id="\{prefix}-\{index}",
+        id="\{prefix_renamed}-\{index}",
         style=["height:2rem;flex:none;padding:0.25rem"],
         "Fixture item \{index}",
       ),
*** End Patch

```
