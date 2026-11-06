# openseek rename code_copy_button desktop/frontend/markdown/code_copy.mbt:2:4

```mooncram
$ moonx '../../../../scripts/bench-moon-ide.mbtx' rename 'code_copy_button' 'code_copy_button_renamed' --loc 'desktop/frontend/markdown/code_copy.mbt:2:4' --target js --no-check
*** Begin Patch
*** Update File: e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\markdown\code_copy.mbt
@@
 ///|
-fn code_copy_button(
+fn code_copy_button_renamed(
   locale~ : @i18n.Locale = English,
   source : String,
 ) -> @html.Html {
*** Update File: e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\markdown\markdown.mbt
@@
     }
   }
   @html.div(class="chat-code-block", [
-    @html.div(class="chat-code-toolbar", [code_copy_button(locale~, source)]),
+    @html.div(class="chat-code-toolbar", [code_copy_button_renamed(locale~, source)]),
     code_block_body(block, source, language),
   ])
 }
*** End Patch
"" (escaped)
```
