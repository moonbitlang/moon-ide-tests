# openseek peek-def

```mooncram
$ moonx '../../../../scripts/bench-moon-ide.mbtx' peek-def 'dir' --loc 'desktop/backend/host/host_wbtest.mbt:9:7' --target native --no-check
Definition found at file e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\backend\host\host_wbtest.mbt
  | /// They are package-private because the host ops are reached through their
  | /// endpoints, not from another package.
  | 
  | ///|
  | async test "native language preference survives independent reads and rejects invalid writes" {
9 |   let dir = @fs.tmpdir(prefix="openseek-ui-language-")
  |       ^^^
  |   defer @fs.rmdir(dir, recursive=true)
  |   assert_eq(read_ui_language(Some(dir)).language, None)
  |   write_ui_language(Some(dir), { language: Some("zh-Hans"), }) |> ignore
  |   assert_eq(read_ui_language(Some(dir)).language, Some("zh-Hans"))
  |   let rejected = try {
  |     write_ui_language(Some(dir), { language: Some("unknown"), }) |> ignore
  |     false
  |   } catch {
  |     _ => true
  |   }
  |   assert_true(rejected)
  |   assert_eq(read_ui_language(Some(dir)).language, Some("zh-Hans"))
  |   write_ui_language(Some(dir), { language: Some("en"), }) |> ignore
  |   assert_eq(read_ui_language(Some(dir)).language, Some("en"))
```
