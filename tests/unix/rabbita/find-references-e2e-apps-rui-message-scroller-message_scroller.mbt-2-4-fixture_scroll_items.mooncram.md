# rabbita find-references fixture_scroll_items e2e/apps/rui/message-scroller/message_scroller.mbt:2:4

````mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../fixtures/repos/rabbita' moon ide find-references 'fixture_scroll_items' --loc 'e2e/apps/rui/message-scroller/message_scroller.mbt:2:4'
Found 1 references for symbol 'fixture_scroll_items':
<WORKDIR>/e2e/apps/rui/message-scroller/message_scroller.mbt:29:13-29:33:
   |         @rui.message_scroller_viewport(
   |           scope~,
   |           @rui.message_scroller_content(
29 |             fixture_scroll_items("message-scroller-item").map(item => {
   |             ^^^^^^^^^^^^^^^^^^^^
   |               @rui.message_scroller_item(style=["min-height:3rem"], item)
   |             }),
"" (escaped)
````
