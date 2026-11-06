# openseek rename memory_root editor/internal/shell/examples/embedded_viewer/main.mbt:8:5

```mooncram
$ moonx '../../../../scripts/bench-moon-ide.mbtx' rename 'memory_root' 'memory_root_renamed' --loc 'editor/internal/shell/examples/embedded_viewer/main.mbt:8:5' --target js --no-check
*** Begin Patch
*** Update File: e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\shell\examples\embedded_viewer\main.mbt
@@
 // text models directly to the viewer.
 
 ///|
-let memory_root : String = "memory://workspace"
+let memory_root_renamed : String = "memory://workspace"
 
 ///|
 priv suberror StartupSubscription
@@
 ///|
 fn memory_file(path : String, name : String) -> @workspace.WorkspaceStat {
   {
-    uri: memory_uri("\{memory_root}/\{path}"),
+    uri: memory_uri("\{memory_root_renamed}/\{path}"),
     name,
     kind: File,
     children: None,
@@
 ///|
 fn memory_dir(path : String, name : String) -> @workspace.WorkspaceStat {
   {
-    uri: memory_uri("\{memory_root}/\{path}"),
+    uri: memory_uri("\{memory_root_renamed}/\{path}"),
     name,
     kind: Directory,
     children: None,
@@
 ///|
 fn memory_workspace() -> MemoryWorkspace {
   let directories : Map[String, Array[@workspace.WorkspaceStat]] = Map([])
-  directories[memory_root] = [
+  directories[memory_root_renamed] = [
     memory_dir("src", "src"),
     memory_file("broken.mbt", "broken.mbt"),
     memory_file("comments-only.mbt", "comments-only.mbt"),
@@
     memory_file("tour.MBT.MD", "tour.MBT.MD"),
     memory_file("moon.mod", "moon.mod"),
   ]
-  directories["\{memory_root}/src"] = [
+  directories["\{memory_root_renamed}/src"] = [
     memory_dir("src/lib", "lib"),
     memory_file("src/main.mbt", "main.mbt"),
   ]
-  directories["\{memory_root}/src/lib"] = [
+  directories["\{memory_root_renamed}/src/lib"] = [
     memory_file("src/lib/util.mbt", "util.mbt"),
   ]
   let documents : Map[String, String] = Map([])
-  documents["\{memory_root}/broken.mbt"] = "fn okay() {}\n"
+  documents["\{memory_root_renamed}/broken.mbt"] = "fn okay() {}\n"
-  documents["\{memory_root}/comments-only.mbt"] = [
+  documents["\{memory_root_renamed}/comments-only.mbt"] = [
     "fn stable() -> Int {", "", "  // updated note", "  1", "}",
   ].join("\n")
-  documents["\{memory_root}/comments.mbt"] = [
+  documents["\{memory_root_renamed}/comments.mbt"] = [
     "fn review_value() -> Int {", "", "  // updated explanation", "  new_value()",
     "}",
   ].join("\n")
-  documents["\{memory_root}/alignment-zones.mbt"] = alignment_diff_document(
+  documents["\{memory_root_renamed}/alignment-zones.mbt"] = alignment_diff_document(
     false,
   )
-  documents["\{memory_root}/large.mbt"] = large_diff_document("modified")
+  documents["\{memory_root_renamed}/large.mbt"] = large_diff_document("modified")
-  documents["\{memory_root}/fragmented-large.mbt"] = fragmented_deletion_document(
+  documents["\{memory_root_renamed}/fragmented-large.mbt"] = fragmented_deletion_document(
     false,
   )
-  documents["\{memory_root}/navigation-anchors.mbt"] = [
+  documents["\{memory_root_renamed}/navigation-anchors.mbt"] = [
     "fn navigation_anchors() {", "  let stable_head = 0", "  let stable_middle_one = 2",
     "  let stable_middle_two = 3", "  let stable_middle_three = 4", "  let stable_middle_four = 5",
     "  let stable_middle_five = 6", "  let stable_middle_six = 7", "  let inserted_only = 8",
     "  let stable_tail = 9", "}",
   ].join("\n")
-  documents["\{memory_root}/scroll-sync.mbt"] = scroll_sync_document(false)
+  documents["\{memory_root_renamed}/scroll-sync.mbt"] = scroll_sync_document(false)
-  documents["\{memory_root}/tabbed-deletion.mbt"] = "let retained = 1\n"
+  documents["\{memory_root_renamed}/tabbed-deletion.mbt"] = "let retained = 1\n"
-  documents["\{memory_root}/oversized-line.mbt"] = oversized_diff_line("m")
+  documents["\{memory_root_renamed}/oversized-line.mbt"] = oversized_diff_line("m")
-  documents["\{memory_root}/identical.mbt"] = identical_diff_document()
+  documents["\{memory_root_renamed}/identical.mbt"] = identical_diff_document()
-  documents["\{memory_root}/README.md"] = (
+  documents["\{memory_root_renamed}/README.md"] = (
     #|# Embedded Markdown document
     #|
     #|This URI-backed in-memory model is rendered directly by the public **MarkdownViewer**.
@@
     #|- No remote protocol or WebSocket participates.
     #|
   )
-  documents["\{memory_root}/Guide.MD"] = "# Uppercase Markdown\n"
+  documents["\{memory_root_renamed}/Guide.MD"] = "# Uppercase Markdown\n"
-  documents["\{memory_root}/tour.MBT.MD"] = (
+  documents["\{memory_root_renamed}/tour.MBT.MD"] = (
     #|# MoonBit Markdown
     #|
     #|```mbt check
@@
     #|```
     #|
   )
-  documents["\{memory_root}/moon.mod"] = "name = \"embedded-example\"\n"
+  documents["\{memory_root_renamed}/moon.mod"] = "name = \"embedded-example\"\n"
-  documents["\{memory_root}/src/main.mbt"] = (
+  documents["\{memory_root_renamed}/src/main.mbt"] = (
     #|///|
     #|fn main {
     #|  println(greeting())
@@
     #|}
     #|
   )
-  documents["\{memory_root}/src/lib/util.mbt"] = (
+  documents["\{memory_root_renamed}/src/lib/util.mbt"] = (
     #|///|
     #|pub fn util_answer() -> Int {
     #|  42
@@
     #|
   )
   let original_documents : Map[String, String] = Map([])
-  original_documents["\{memory_root}/broken.mbt"] = "fn broken( {\n"
+  original_documents["\{memory_root_renamed}/broken.mbt"] = "fn broken( {\n"
-  original_documents["\{memory_root}/comments-only.mbt"] = [
+  original_documents["\{memory_root_renamed}/comments-only.mbt"] = [
     "fn stable() -> Int {", "  // obsolete note", "  1", "}",
   ].join("\n")
-  original_documents["\{memory_root}/comments.mbt"] = [
+  original_documents["\{memory_root_renamed}/comments.mbt"] = [
     "fn review_value() -> Int {", "  // obsolete explanation", "  old_value()", "}",
   ].join("\n")
-  original_documents["\{memory_root}/alignment-zones.mbt"] = alignment_diff_document(
+  original_documents["\{memory_root_renamed}/alignment-zones.mbt"] = alignment_diff_document(
     true,
   )
-  original_documents["\{memory_root}/large.mbt"] = large_diff_document(
+  original_documents["\{memory_root_renamed}/large.mbt"] = large_diff_document(
     "original",
   )
-  original_documents["\{memory_root}/fragmented-large.mbt"] = fragmented_deletion_document(
+  original_documents["\{memory_root_renamed}/fragmented-large.mbt"] = fragmented_deletion_document(
     true,
   )
-  original_documents["\{memory_root}/navigation-anchors.mbt"] = [
+  original_documents["\{memory_root_renamed}/navigation-anchors.mbt"] = [
     "fn navigation_anchors() {", "  let stable_head = 0", "  let deleted_only = 1",
     "  let stable_middle_one = 2", "  let stable_middle_two = 3", "  let stable_middle_three = 4",
     "  let stable_middle_four = 5", "  let stable_middle_five = 6", "  let stable_middle_six = 7",
     "  let stable_tail = 9", "}",
   ].join("\n")
-  original_documents["\{memory_root}/scroll-sync.mbt"] = scroll_sync_document(
+  original_documents["\{memory_root_renamed}/scroll-sync.mbt"] = scroll_sync_document(
     true,
   )
-  original_documents["\{memory_root}/tabbed-deletion.mbt"] = "\t".repeat(160) +
+  original_documents["\{memory_root_renamed}/tabbed-deletion.mbt"] = "\t".repeat(160) +
     "deleted_tail\n"
-  original_documents["\{memory_root}/oversized-line.mbt"] = oversized_diff_line(
+  original_documents["\{memory_root_renamed}/oversized-line.mbt"] = oversized_diff_line(
     "o",
   )
-  original_documents["\{memory_root}/identical.mbt"] = identical_diff_document()
+  original_documents["\{memory_root_renamed}/identical.mbt"] = identical_diff_document()
-  original_documents["\{memory_root}/README.md"] = (
+  original_documents["\{memory_root_renamed}/README.md"] = (
     #|# Embedded document
     #|
     #|This in-memory model is rendered by the public MarkdownViewer.
     #|
   )
-  original_documents["\{memory_root}/Guide.MD"] = "# Old uppercase Markdown\n"
+  original_documents["\{memory_root_renamed}/Guide.MD"] = "# Old uppercase Markdown\n"
-  original_documents["\{memory_root}/tour.MBT.MD"] = (
+  original_documents["\{memory_root_renamed}/tour.MBT.MD"] = (
     #|# Old MoonBit Markdown
     #|
     #|```mbt check
@@
     #|```
     #|
   )
-  original_documents["\{memory_root}/moon.mod"] = ""
+  original_documents["\{memory_root_renamed}/moon.mod"] = ""
-  original_documents["\{memory_root}/src/main.mbt"] = (
+  original_documents["\{memory_root_renamed}/src/main.mbt"] = (
     #|///|
     #|fn main {
     #|  println("hello")
@@
     #|}
     #|
   )
-  original_documents["\{memory_root}/src/lib/util.mbt"] = (
+  original_documents["\{memory_root_renamed}/src/lib/util.mbt"] = (
     #|///|
     #|pub fn util_answer() -> Int {
     #|  41
@@
     #|
   )
   {
-    root_uri: memory_uri(memory_root),
+    root_uri: memory_uri(memory_root_renamed),
     directories,
     documents,
     original_documents,
@@
 ) -> (@rabbita.Cmd, EmbedModel) {
   match msg {
     Boot => {
-      let first_file = memory_uri("\{memory_root}/src/main.mbt")
+      let first_file = memory_uri("\{memory_root_renamed}/src/main.mbt")
       (
         @rabbita.batch([
           embed_tree().refresh(),
*** End Patch
"" (escaped)
```
