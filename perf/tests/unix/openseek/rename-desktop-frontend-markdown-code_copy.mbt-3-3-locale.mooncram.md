# openseek rename locale desktop/frontend/markdown/code_copy.mbt:3:3

```mooncram
$ moonx '../../../../scripts/bench-moon-ide.mbtx' rename 'locale' 'locale_renamed' --loc 'desktop/frontend/markdown/code_copy.mbt:3:3' --target js --no-check
*** Begin Patch
*** Update File: e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\markdown\code_copy.mbt
@@
 ///|
 fn code_copy_button(
-  locale~ : @i18n.Locale = English,
+  locale_renamed~ : @i18n.Locale = English,
   source : String,
 ) -> @html.Html {
   copy_button(
-    locale~,
+    locale=locale_renamed,
     source,
     class="button secondary chat-code-copy",
-    title=match locale {
+    title=match locale_renamed {
       SimplifiedChinese => "复制代码"
       TraditionalChinese => "複製程式碼"
       Japanese => "コードをコピー"
@@
       English => "Copy code"
       Spanish => "Copiar código"
     },
-    label=match locale {
+    label=match locale_renamed {
       SimplifiedChinese => "复制代码"
       TraditionalChinese => "複製程式碼"
       Japanese => "コードをコピー"
*** Update File: e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\markdown\markdown.mbt
@@
     }
   }
   @html.div(class="chat-code-block", [
-    @html.div(class="chat-code-toolbar", [code_copy_button(locale~, source)]),
+    @html.div(class="chat-code-toolbar", [code_copy_button(locale_renamed=locale, source)]),
     code_block_body(block, source, language),
   ])
 }
*** End Patch
"" (escaped)
```
