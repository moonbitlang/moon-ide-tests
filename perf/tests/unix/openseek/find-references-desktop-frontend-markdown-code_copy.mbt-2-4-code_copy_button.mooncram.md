# openseek find-references code_copy_button desktop/frontend/markdown/code_copy.mbt:2:4

```mooncram
$ moonx '../../../../scripts/bench-moon-ide.mbtx' find-references 'code_copy_button' --loc 'desktop/frontend/markdown/code_copy.mbt:2:4' --target js --no-check
Found 1 references for symbol 'code_copy_button':
e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\frontend\markdown\markdown.mbt:181:43-181:59:
    |     }
    |   }
    |   @html.div(class="chat-code-block", [
181 |     @html.div(class="chat-code-toolbar", [code_copy_button(locale~, source)]),
    |                                           ^^^^^^^^^^^^^^^^
    |     code_block_body(block, source, language),
    |   ])
"" (escaped)
```
