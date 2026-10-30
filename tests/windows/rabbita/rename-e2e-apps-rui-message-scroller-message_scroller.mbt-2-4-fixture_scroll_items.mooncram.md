# rabbita rename fixture_scroll_items e2e\apps\rui\message-scroller\message_scroller.mbt:2:4

````mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../fixtures/repos/rabbita' moon ide rename 'fixture_scroll_items' 'fixture_scroll_items_renamed' --loc 'e2e\apps\rui\message-scroller\message_scroller.mbt:2:4'
*** Begin Patch
*** Update File: <WORKDIR>/e2e\apps\rui\message-scroller\message_scroller.mbt
@@
 ///|
-fn fixture_scroll_items(prefix : String) -> Array[Html] {
+fn fixture_scroll_items_renamed(prefix : String) -> Array[Html] {
   let items : Array[Html] = []
   for index in 1..<=18 {
     items.push(
@@
         @rui.message_scroller_viewport(
           scope~,
           @rui.message_scroller_content(
-            fixture_scroll_items("message-scroller-item").map(item => {
+            fixture_scroll_items_renamed("message-scroller-item").map(item => {
               @rui.message_scroller_item(style=["min-height:3rem"], item)
             }),
           ),
*** End Patch
"" (escaped)
````
