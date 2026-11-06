# openseek peek-def

```mooncram
$ moonx '../../../../scripts/bench-moon-ide.mbtx' peek-def 'code_copy_button' --loc 'desktop/frontend/markdown/code_copy.mbt:2:4' --target js --no-check
Definition found at file e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\markdown\code_copy.mbt
  | ///|
2 | fn code_copy_button(
  |    ^^^^^^^^^^^^^^^^
  |   locale~ : @i18n.Locale = English,
  |   source : String,
  | ) -> @html.Html {
  |   copy_button(
  |     locale~,
  |     source,
  |     class="button secondary chat-code-copy",
  |     title=match locale {
  |       SimplifiedChinese => "复制代码"
  |       TraditionalChinese => "複製程式碼"
  |       Japanese => "コードをコピー"
  |       English => "Copy code"
  |       Spanish => "Copiar código"
  |     },
```
