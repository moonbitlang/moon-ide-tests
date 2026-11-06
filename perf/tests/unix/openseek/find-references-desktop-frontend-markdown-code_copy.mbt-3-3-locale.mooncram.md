# openseek find-references locale desktop/frontend/markdown/code_copy.mbt:3:3

```mooncram
$ moonx '../../../../scripts/bench-moon-ide.mbtx' find-references 'locale' --loc 'desktop/frontend/markdown/code_copy.mbt:3:3' --target js --no-check
Found 4 references for symbol 'locale':
e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\markdown\code_copy.mbt:7:5-7:12:
  |   source : String,
  | ) -> @html.Html {
  |   copy_button(
7 |     locale~,
  |     ^^^^^^^
  |     source,
  |     class="button secondary chat-code-copy",

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\markdown\code_copy.mbt:10:17-10:23:
   |     locale~,
   |     source,
   |     class="button secondary chat-code-copy",
10 |     title=match locale {
   |                 ^^^^^^
   |       SimplifiedChinese => "复制代码"
   |       TraditionalChinese => "複製程式碼"

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\markdown\code_copy.mbt:17:17-17:23:
   |       English => "Copy code"
   |       Spanish => "Copiar código"
   |     },
17 |     label=match locale {
   |                 ^^^^^^
   |       SimplifiedChinese => "复制代码"
   |       TraditionalChinese => "複製程式碼"

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\markdown\markdown.mbt:181:60-181:67:
    |     }
    |   }
    |   @html.div(class="chat-code-block", [
181 |     @html.div(class="chat-code-toolbar", [code_copy_button(locale~, source)]),
    |                                                            ^^^^^^^
    |     code_block_body(block, source, language),
    |   ])
"" (escaped)
```
