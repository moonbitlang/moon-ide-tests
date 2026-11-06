# openseek peek-def

```mooncram
$ moonx '../../../../scripts/bench-moon-ide.mbtx' peek-def 'locale' --loc 'desktop/frontend/markdown/code_copy.mbt:3:3' --target js --no-check
Definition found at file e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\markdown\code_copy.mbt
  | ///|
  | fn code_copy_button(
3 |   locale~ : @i18n.Locale = English,
  |   ^^^^^^
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
  |     label=match locale {
```
