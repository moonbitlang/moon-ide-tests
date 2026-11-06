# openseek find-references dir desktop/backend/host/host_wbtest.mbt:9:7

```mooncram
$ moonx '../../../../scripts/bench-moon-ide.mbtx' find-references 'dir' --loc 'desktop/backend/host/host_wbtest.mbt:9:7' --target native --no-check
Found 16 references for symbol 'dir':
e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\backend\host\host_wbtest.mbt:10:19-10:22:
   | ///|
   | async test "native language preference survives independent reads and rejects invalid writes" {
   |   let dir = @fs.tmpdir(prefix="openseek-ui-language-")
10 |   defer @fs.rmdir(dir, recursive=true)
   |                   ^^^
   |   assert_eq(read_ui_language(Some(dir)).language, None)
   |   write_ui_language(Some(dir), { language: Some("zh-Hans"), }) |> ignore

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\backend\host\host_wbtest.mbt:11:35-11:38:
   | async test "native language preference survives independent reads and rejects invalid writes" {
   |   let dir = @fs.tmpdir(prefix="openseek-ui-language-")
   |   defer @fs.rmdir(dir, recursive=true)
11 |   assert_eq(read_ui_language(Some(dir)).language, None)
   |                                   ^^^
   |   write_ui_language(Some(dir), { language: Some("zh-Hans"), }) |> ignore
   |   assert_eq(read_ui_language(Some(dir)).language, Some("zh-Hans"))

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\backend\host\host_wbtest.mbt:12:26-12:29:
   |   let dir = @fs.tmpdir(prefix="openseek-ui-language-")
   |   defer @fs.rmdir(dir, recursive=true)
   |   assert_eq(read_ui_language(Some(dir)).language, None)
12 |   write_ui_language(Some(dir), { language: Some("zh-Hans"), }) |> ignore
   |                          ^^^
   |   assert_eq(read_ui_language(Some(dir)).language, Some("zh-Hans"))
   |   let rejected = try {

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\backend\host\host_wbtest.mbt:13:35-13:38:
   |   defer @fs.rmdir(dir, recursive=true)
   |   assert_eq(read_ui_language(Some(dir)).language, None)
   |   write_ui_language(Some(dir), { language: Some("zh-Hans"), }) |> ignore
13 |   assert_eq(read_ui_language(Some(dir)).language, Some("zh-Hans"))
   |                                   ^^^
   |   let rejected = try {
   |     write_ui_language(Some(dir), { language: Some("unknown"), }) |> ignore

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\backend\host\host_wbtest.mbt:15:28-15:31:
   |   write_ui_language(Some(dir), { language: Some("zh-Hans"), }) |> ignore
   |   assert_eq(read_ui_language(Some(dir)).language, Some("zh-Hans"))
   |   let rejected = try {
15 |     write_ui_language(Some(dir), { language: Some("unknown"), }) |> ignore
   |                            ^^^
   |     false
   |   } catch {

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\backend\host\host_wbtest.mbt:21:35-21:38:
   |     _ => true
   |   }
   |   assert_true(rejected)
21 |   assert_eq(read_ui_language(Some(dir)).language, Some("zh-Hans"))
   |                                   ^^^
   |   write_ui_language(Some(dir), { language: Some("en"), }) |> ignore
   |   assert_eq(read_ui_language(Some(dir)).language, Some("en"))

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\backend\host\host_wbtest.mbt:22:26-22:29:
   |   }
   |   assert_true(rejected)
   |   assert_eq(read_ui_language(Some(dir)).language, Some("zh-Hans"))
22 |   write_ui_language(Some(dir), { language: Some("en"), }) |> ignore
   |                          ^^^
   |   assert_eq(read_ui_language(Some(dir)).language, Some("en"))
   |   write_ui_language(Some(dir), { language: Some("ja"), }) |> ignore

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\backend\host\host_wbtest.mbt:23:35-23:38:
   |   assert_true(rejected)
   |   assert_eq(read_ui_language(Some(dir)).language, Some("zh-Hans"))
   |   write_ui_language(Some(dir), { language: Some("en"), }) |> ignore
23 |   assert_eq(read_ui_language(Some(dir)).language, Some("en"))
   |                                   ^^^
   |   write_ui_language(Some(dir), { language: Some("ja"), }) |> ignore
   |   assert_eq(read_ui_language(Some(dir)).language, Some("ja"))

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\backend\host\host_wbtest.mbt:24:26-24:29:
   |   assert_eq(read_ui_language(Some(dir)).language, Some("zh-Hans"))
   |   write_ui_language(Some(dir), { language: Some("en"), }) |> ignore
   |   assert_eq(read_ui_language(Some(dir)).language, Some("en"))
24 |   write_ui_language(Some(dir), { language: Some("ja"), }) |> ignore
   |                          ^^^
   |   assert_eq(read_ui_language(Some(dir)).language, Some("ja"))
   |   write_ui_language(Some(dir), { language: Some("zh-Hant"), }) |> ignore

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\backend\host\host_wbtest.mbt:25:35-25:38:
   |   write_ui_language(Some(dir), { language: Some("en"), }) |> ignore
   |   assert_eq(read_ui_language(Some(dir)).language, Some("en"))
   |   write_ui_language(Some(dir), { language: Some("ja"), }) |> ignore
25 |   assert_eq(read_ui_language(Some(dir)).language, Some("ja"))
   |                                   ^^^
   |   write_ui_language(Some(dir), { language: Some("zh-Hant"), }) |> ignore
   |   assert_eq(read_ui_language(Some(dir)).language, Some("zh-Hant"))

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\backend\host\host_wbtest.mbt:26:26-26:29:
   |   assert_eq(read_ui_language(Some(dir)).language, Some("en"))
   |   write_ui_language(Some(dir), { language: Some("ja"), }) |> ignore
   |   assert_eq(read_ui_language(Some(dir)).language, Some("ja"))
26 |   write_ui_language(Some(dir), { language: Some("zh-Hant"), }) |> ignore
   |                          ^^^
   |   assert_eq(read_ui_language(Some(dir)).language, Some("zh-Hant"))
   |   write_ui_language(Some(dir), { language: Some("es"), }) |> ignore

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\backend\host\host_wbtest.mbt:27:35-27:38:
   |   write_ui_language(Some(dir), { language: Some("ja"), }) |> ignore
   |   assert_eq(read_ui_language(Some(dir)).language, Some("ja"))
   |   write_ui_language(Some(dir), { language: Some("zh-Hant"), }) |> ignore
27 |   assert_eq(read_ui_language(Some(dir)).language, Some("zh-Hant"))
   |                                   ^^^
   |   write_ui_language(Some(dir), { language: Some("es"), }) |> ignore
   |   assert_eq(read_ui_language(Some(dir)).language, Some("es"))

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\backend\host\host_wbtest.mbt:28:26-28:29:
   |   assert_eq(read_ui_language(Some(dir)).language, Some("ja"))
   |   write_ui_language(Some(dir), { language: Some("zh-Hant"), }) |> ignore
   |   assert_eq(read_ui_language(Some(dir)).language, Some("zh-Hant"))
28 |   write_ui_language(Some(dir), { language: Some("es"), }) |> ignore
   |                          ^^^
   |   assert_eq(read_ui_language(Some(dir)).language, Some("es"))
   |   write_ui_language(Some(dir), { language: None, }) |> ignore

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\backend\host\host_wbtest.mbt:29:35-29:38:
   |   write_ui_language(Some(dir), { language: Some("zh-Hant"), }) |> ignore
   |   assert_eq(read_ui_language(Some(dir)).language, Some("zh-Hant"))
   |   write_ui_language(Some(dir), { language: Some("es"), }) |> ignore
29 |   assert_eq(read_ui_language(Some(dir)).language, Some("es"))
   |                                   ^^^
   |   write_ui_language(Some(dir), { language: None, }) |> ignore
   |   assert_eq(read_ui_language(Some(dir)).language, None)

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\backend\host\host_wbtest.mbt:30:26-30:29:
   |   assert_eq(read_ui_language(Some(dir)).language, Some("zh-Hant"))
   |   write_ui_language(Some(dir), { language: Some("es"), }) |> ignore
   |   assert_eq(read_ui_language(Some(dir)).language, Some("es"))
30 |   write_ui_language(Some(dir), { language: None, }) |> ignore
   |                          ^^^
   |   assert_eq(read_ui_language(Some(dir)).language, None)
   | }

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\backend\host\host_wbtest.mbt:31:35-31:38:
   |   write_ui_language(Some(dir), { language: Some("es"), }) |> ignore
   |   assert_eq(read_ui_language(Some(dir)).language, Some("es"))
   |   write_ui_language(Some(dir), { language: None, }) |> ignore
31 |   assert_eq(read_ui_language(Some(dir)).language, None)
   |                                   ^^^
   | }
   | 
"" (escaped)
```
