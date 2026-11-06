# openseek find-references worktree_of desktop/protocol/session_import_test.mbt:3:7

```mooncram
$ moonx '../../../../scripts/bench-moon-ide.mbtx' find-references 'worktree_of' --loc 'desktop/protocol/session_import_test.mbt:3:7' --target native --no-check
Found 2 references for symbol 'worktree_of':
e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\protocol\session_import_test.mbt:12:9-12:20:
   |       let payload : @protocol.SessionImportPayload = {
   |         source,
   |         workspace: "/project",
12 |         worktree_of,
   |         ^^^^^^^^^^^
   |       }
   |       let encoded = payload.to_json()

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\protocol\session_import_test.mbt:18:15-18:26:
   |       let decoded : @protocol.SessionImportPayload = @json.from_json(encoded)
   |       assert_eq(decoded, payload)
   |       assert_true(
18 |         match worktree_of {
   |               ^^^^^^^^^^^
   |           None => encoded is { "worktree_of": Null, .. }
   |           Some(_) => encoded is { "worktree_of": String("source-session"), .. }
"" (escaped)
```
