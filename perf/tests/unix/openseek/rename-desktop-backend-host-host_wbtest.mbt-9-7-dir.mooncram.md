# openseek rename dir desktop/backend/host/host_wbtest.mbt:9:7

```mooncram
$ moonx '../../../../scripts/bench-moon-ide.mbtx' rename 'dir' 'dir_renamed' --loc 'desktop/backend/host/host_wbtest.mbt:9:7' --target native --no-check
*** Begin Patch
*** Update File: e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\desktop\backend\host\host_wbtest.mbt
@@
 
 ///|
 async test "native language preference survives independent reads and rejects invalid writes" {
-  let dir = @fs.tmpdir(prefix="openseek-ui-language-")
+  let dir_renamed = @fs.tmpdir(prefix="openseek-ui-language-")
-  defer @fs.rmdir(dir, recursive=true)
+  defer @fs.rmdir(dir_renamed, recursive=true)
-  assert_eq(read_ui_language(Some(dir)).language, None)
+  assert_eq(read_ui_language(Some(dir_renamed)).language, None)
-  write_ui_language(Some(dir), { language: Some("zh-Hans"), }) |> ignore
+  write_ui_language(Some(dir_renamed), { language: Some("zh-Hans"), }) |> ignore
-  assert_eq(read_ui_language(Some(dir)).language, Some("zh-Hans"))
+  assert_eq(read_ui_language(Some(dir_renamed)).language, Some("zh-Hans"))
   let rejected = try {
-    write_ui_language(Some(dir), { language: Some("unknown"), }) |> ignore
+    write_ui_language(Some(dir_renamed), { language: Some("unknown"), }) |> ignore
     false
   } catch {
     _ => true
   }
   assert_true(rejected)
-  assert_eq(read_ui_language(Some(dir)).language, Some("zh-Hans"))
+  assert_eq(read_ui_language(Some(dir_renamed)).language, Some("zh-Hans"))
-  write_ui_language(Some(dir), { language: Some("en"), }) |> ignore
+  write_ui_language(Some(dir_renamed), { language: Some("en"), }) |> ignore
-  assert_eq(read_ui_language(Some(dir)).language, Some("en"))
+  assert_eq(read_ui_language(Some(dir_renamed)).language, Some("en"))
-  write_ui_language(Some(dir), { language: Some("ja"), }) |> ignore
+  write_ui_language(Some(dir_renamed), { language: Some("ja"), }) |> ignore
-  assert_eq(read_ui_language(Some(dir)).language, Some("ja"))
+  assert_eq(read_ui_language(Some(dir_renamed)).language, Some("ja"))
-  write_ui_language(Some(dir), { language: Some("zh-Hant"), }) |> ignore
+  write_ui_language(Some(dir_renamed), { language: Some("zh-Hant"), }) |> ignore
-  assert_eq(read_ui_language(Some(dir)).language, Some("zh-Hant"))
+  assert_eq(read_ui_language(Some(dir_renamed)).language, Some("zh-Hant"))
-  write_ui_language(Some(dir), { language: Some("es"), }) |> ignore
+  write_ui_language(Some(dir_renamed), { language: Some("es"), }) |> ignore
-  assert_eq(read_ui_language(Some(dir)).language, Some("es"))
+  assert_eq(read_ui_language(Some(dir_renamed)).language, Some("es"))
-  write_ui_language(Some(dir), { language: None, }) |> ignore
+  write_ui_language(Some(dir_renamed), { language: None, }) |> ignore
-  assert_eq(read_ui_language(Some(dir)).language, None)
+  assert_eq(read_ui_language(Some(dir_renamed)).language, None)
 }
 
 ///|
*** End Patch
"" (escaped)
```
