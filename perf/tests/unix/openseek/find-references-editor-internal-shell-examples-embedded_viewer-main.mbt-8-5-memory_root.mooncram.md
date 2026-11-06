# openseek find-references memory_root editor/internal/shell/examples/embedded_viewer/main.mbt:8:5

```mooncram
$ moonx '../../../../scripts/bench-moon-ide.mbtx' find-references 'memory_root' --loc 'editor/internal/shell/examples/embedded_viewer/main.mbt:8:5' --target js --no-check
Found 41 references for symbol 'memory_root':
e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\shell\examples\embedded_viewer\main.mbt:45:24-45:35:
   | ///|
   | fn memory_file(path : String, name : String) -> @workspace.WorkspaceStat {
   |   {
45 |     uri: memory_uri("\{memory_root}/\{path}"),
   |                        ^^^^^^^^^^^
   |     name,
   |     kind: File,

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\shell\examples\embedded_viewer\main.mbt:55:24-55:35:
   | ///|
   | fn memory_dir(path : String, name : String) -> @workspace.WorkspaceStat {
   |   {
55 |     uri: memory_uri("\{memory_root}/\{path}"),
   |                        ^^^^^^^^^^^
   |     name,
   |     kind: Directory,

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\shell\examples\embedded_viewer\main.mbt:65:15-65:26:
   | ///|
   | fn memory_workspace() -> MemoryWorkspace {
   |   let directories : Map[String, Array[@workspace.WorkspaceStat]] = Map([])
65 |   directories[memory_root] = [
   |               ^^^^^^^^^^^
   |     memory_dir("src", "src"),
   |     memory_file("broken.mbt", "broken.mbt"),

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\shell\examples\embedded_viewer\main.mbt:83:18-83:29:
   |     memory_file("tour.MBT.MD", "tour.MBT.MD"),
   |     memory_file("moon.mod", "moon.mod"),
   |   ]
83 |   directories["\{memory_root}/src"] = [
   |                  ^^^^^^^^^^^
   |     memory_dir("src/lib", "lib"),
   |     memory_file("src/main.mbt", "main.mbt"),

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\shell\examples\embedded_viewer\main.mbt:87:18-87:29:
   |     memory_dir("src/lib", "lib"),
   |     memory_file("src/main.mbt", "main.mbt"),
   |   ]
87 |   directories["\{memory_root}/src/lib"] = [
   |                  ^^^^^^^^^^^
   |     memory_file("src/lib/util.mbt", "util.mbt"),
   |   ]

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\shell\examples\embedded_viewer\main.mbt:91:16-91:27:
   |     memory_file("src/lib/util.mbt", "util.mbt"),
   |   ]
   |   let documents : Map[String, String] = Map([])
91 |   documents["\{memory_root}/broken.mbt"] = "fn okay() {}\n"
   |                ^^^^^^^^^^^
   |   documents["\{memory_root}/comments-only.mbt"] = [
   |     "fn stable() -> Int {", "", "  // updated note", "  1", "}",

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\shell\examples\embedded_viewer\main.mbt:92:16-92:27:
   |   ]
   |   let documents : Map[String, String] = Map([])
   |   documents["\{memory_root}/broken.mbt"] = "fn okay() {}\n"
92 |   documents["\{memory_root}/comments-only.mbt"] = [
   |                ^^^^^^^^^^^
   |     "fn stable() -> Int {", "", "  // updated note", "  1", "}",
   |   ].join("\n")

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\shell\examples\embedded_viewer\main.mbt:95:16-95:27:
   |   documents["\{memory_root}/comments-only.mbt"] = [
   |     "fn stable() -> Int {", "", "  // updated note", "  1", "}",
   |   ].join("\n")
95 |   documents["\{memory_root}/comments.mbt"] = [
   |                ^^^^^^^^^^^
   |     "fn review_value() -> Int {", "", "  // updated explanation", "  new_value()",
   |     "}",

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\shell\examples\embedded_viewer\main.mbt:99:16-99:27:
   |     "fn review_value() -> Int {", "", "  // updated explanation", "  new_value()",
   |     "}",
   |   ].join("\n")
99 |   documents["\{memory_root}/alignment-zones.mbt"] = alignment_diff_document(
   |                ^^^^^^^^^^^
   |     false,
   |   )

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\shell\examples\embedded_viewer\main.mbt:102:16-102:27:
    |   documents["\{memory_root}/alignment-zones.mbt"] = alignment_diff_document(
    |     false,
    |   )
102 |   documents["\{memory_root}/large.mbt"] = large_diff_document("modified")
    |                ^^^^^^^^^^^
    |   documents["\{memory_root}/fragmented-large.mbt"] = fragmented_deletion_document(
    |     false,

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\shell\examples\embedded_viewer\main.mbt:103:16-103:27:
    |     false,
    |   )
    |   documents["\{memory_root}/large.mbt"] = large_diff_document("modified")
103 |   documents["\{memory_root}/fragmented-large.mbt"] = fragmented_deletion_document(
    |                ^^^^^^^^^^^
    |     false,
    |   )

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\shell\examples\embedded_viewer\main.mbt:106:16-106:27:
    |   documents["\{memory_root}/fragmented-large.mbt"] = fragmented_deletion_document(
    |     false,
    |   )
106 |   documents["\{memory_root}/navigation-anchors.mbt"] = [
    |                ^^^^^^^^^^^
    |     "fn navigation_anchors() {", "  let stable_head = 0", "  let stable_middle_one = 2",
    |     "  let stable_middle_two = 3", "  let stable_middle_three = 4", "  let stable_middle_four = 5",

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\shell\examples\embedded_viewer\main.mbt:112:16-112:27:
    |     "  let stable_middle_five = 6", "  let stable_middle_six = 7", "  let inserted_only = 8",
    |     "  let stable_tail = 9", "}",
    |   ].join("\n")
112 |   documents["\{memory_root}/scroll-sync.mbt"] = scroll_sync_document(false)
    |                ^^^^^^^^^^^
    |   documents["\{memory_root}/tabbed-deletion.mbt"] = "let retained = 1\n"
    |   documents["\{memory_root}/oversized-line.mbt"] = oversized_diff_line("m")

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\shell\examples\embedded_viewer\main.mbt:113:16-113:27:
    |     "  let stable_tail = 9", "}",
    |   ].join("\n")
    |   documents["\{memory_root}/scroll-sync.mbt"] = scroll_sync_document(false)
113 |   documents["\{memory_root}/tabbed-deletion.mbt"] = "let retained = 1\n"
    |                ^^^^^^^^^^^
    |   documents["\{memory_root}/oversized-line.mbt"] = oversized_diff_line("m")
    |   documents["\{memory_root}/identical.mbt"] = identical_diff_document()

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\shell\examples\embedded_viewer\main.mbt:114:16-114:27:
    |   ].join("\n")
    |   documents["\{memory_root}/scroll-sync.mbt"] = scroll_sync_document(false)
    |   documents["\{memory_root}/tabbed-deletion.mbt"] = "let retained = 1\n"
114 |   documents["\{memory_root}/oversized-line.mbt"] = oversized_diff_line("m")
    |                ^^^^^^^^^^^
    |   documents["\{memory_root}/identical.mbt"] = identical_diff_document()
    |   documents["\{memory_root}/README.md"] = (

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\shell\examples\embedded_viewer\main.mbt:115:16-115:27:
    |   documents["\{memory_root}/scroll-sync.mbt"] = scroll_sync_document(false)
    |   documents["\{memory_root}/tabbed-deletion.mbt"] = "let retained = 1\n"
    |   documents["\{memory_root}/oversized-line.mbt"] = oversized_diff_line("m")
115 |   documents["\{memory_root}/identical.mbt"] = identical_diff_document()
    |                ^^^^^^^^^^^
    |   documents["\{memory_root}/README.md"] = (
    |     #|# Embedded Markdown document

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\shell\examples\embedded_viewer\main.mbt:116:16-116:27:
    |   documents["\{memory_root}/tabbed-deletion.mbt"] = "let retained = 1\n"
    |   documents["\{memory_root}/oversized-line.mbt"] = oversized_diff_line("m")
    |   documents["\{memory_root}/identical.mbt"] = identical_diff_document()
116 |   documents["\{memory_root}/README.md"] = (
    |                ^^^^^^^^^^^
    |     #|# Embedded Markdown document
    |     #|

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\shell\examples\embedded_viewer\main.mbt:125:16-125:27:
    |     #|- No remote protocol or WebSocket participates.
    |     #|
    |   )
125 |   documents["\{memory_root}/Guide.MD"] = "# Uppercase Markdown\n"
    |                ^^^^^^^^^^^
    |   documents["\{memory_root}/tour.MBT.MD"] = (
    |     #|# MoonBit Markdown

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\shell\examples\embedded_viewer\main.mbt:126:16-126:27:
    |     #|
    |   )
    |   documents["\{memory_root}/Guide.MD"] = "# Uppercase Markdown\n"
126 |   documents["\{memory_root}/tour.MBT.MD"] = (
    |                ^^^^^^^^^^^
    |     #|# MoonBit Markdown
    |     #|

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\shell\examples\embedded_viewer\main.mbt:134:16-134:27:
    |     #|```
    |     #|
    |   )
134 |   documents["\{memory_root}/moon.mod"] = "name = \"embedded-example\"\n"
    |                ^^^^^^^^^^^
    |   documents["\{memory_root}/src/main.mbt"] = (
    |     #|///|

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\shell\examples\embedded_viewer\main.mbt:135:16-135:27:
    |     #|
    |   )
    |   documents["\{memory_root}/moon.mod"] = "name = \"embedded-example\"\n"
135 |   documents["\{memory_root}/src/main.mbt"] = (
    |                ^^^^^^^^^^^
    |     #|///|
    |     #|fn main {

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\shell\examples\embedded_viewer\main.mbt:142:16-142:27:
    |     #|}
    |     #|
    |   )
142 |   documents["\{memory_root}/src/lib/util.mbt"] = (
    |                ^^^^^^^^^^^
    |     #|///|
    |     #|pub fn util_answer() -> Int {

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\shell\examples\embedded_viewer\main.mbt:150:25-150:36:
    |     #|
    |   )
    |   let original_documents : Map[String, String] = Map([])
150 |   original_documents["\{memory_root}/broken.mbt"] = "fn broken( {\n"
    |                         ^^^^^^^^^^^
    |   original_documents["\{memory_root}/comments-only.mbt"] = [
    |     "fn stable() -> Int {", "  // obsolete note", "  1", "}",

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\shell\examples\embedded_viewer\main.mbt:151:25-151:36:
    |   )
    |   let original_documents : Map[String, String] = Map([])
    |   original_documents["\{memory_root}/broken.mbt"] = "fn broken( {\n"
151 |   original_documents["\{memory_root}/comments-only.mbt"] = [
    |                         ^^^^^^^^^^^
    |     "fn stable() -> Int {", "  // obsolete note", "  1", "}",
    |   ].join("\n")

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\shell\examples\embedded_viewer\main.mbt:154:25-154:36:
    |   original_documents["\{memory_root}/comments-only.mbt"] = [
    |     "fn stable() -> Int {", "  // obsolete note", "  1", "}",
    |   ].join("\n")
154 |   original_documents["\{memory_root}/comments.mbt"] = [
    |                         ^^^^^^^^^^^
    |     "fn review_value() -> Int {", "  // obsolete explanation", "  old_value()", "}",
    |   ].join("\n")

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\shell\examples\embedded_viewer\main.mbt:157:25-157:36:
    |   original_documents["\{memory_root}/comments.mbt"] = [
    |     "fn review_value() -> Int {", "  // obsolete explanation", "  old_value()", "}",
    |   ].join("\n")
157 |   original_documents["\{memory_root}/alignment-zones.mbt"] = alignment_diff_document(
    |                         ^^^^^^^^^^^
    |     true,
    |   )

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\shell\examples\embedded_viewer\main.mbt:160:25-160:36:
    |   original_documents["\{memory_root}/alignment-zones.mbt"] = alignment_diff_document(
    |     true,
    |   )
160 |   original_documents["\{memory_root}/large.mbt"] = large_diff_document(
    |                         ^^^^^^^^^^^
    |     "original",
    |   )

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\shell\examples\embedded_viewer\main.mbt:163:25-163:36:
    |   original_documents["\{memory_root}/large.mbt"] = large_diff_document(
    |     "original",
    |   )
163 |   original_documents["\{memory_root}/fragmented-large.mbt"] = fragmented_deletion_document(
    |                         ^^^^^^^^^^^
    |     true,
    |   )

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\shell\examples\embedded_viewer\main.mbt:166:25-166:36:
    |   original_documents["\{memory_root}/fragmented-large.mbt"] = fragmented_deletion_document(
    |     true,
    |   )
166 |   original_documents["\{memory_root}/navigation-anchors.mbt"] = [
    |                         ^^^^^^^^^^^
    |     "fn navigation_anchors() {", "  let stable_head = 0", "  let deleted_only = 1",
    |     "  let stable_middle_one = 2", "  let stable_middle_two = 3", "  let stable_middle_three = 4",

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\shell\examples\embedded_viewer\main.mbt:172:25-172:36:
    |     "  let stable_middle_four = 5", "  let stable_middle_five = 6", "  let stable_middle_six = 7",
    |     "  let stable_tail = 9", "}",
    |   ].join("\n")
172 |   original_documents["\{memory_root}/scroll-sync.mbt"] = scroll_sync_document(
    |                         ^^^^^^^^^^^
    |     true,
    |   )

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\shell\examples\embedded_viewer\main.mbt:175:25-175:36:
    |   original_documents["\{memory_root}/scroll-sync.mbt"] = scroll_sync_document(
    |     true,
    |   )
175 |   original_documents["\{memory_root}/tabbed-deletion.mbt"] = "\t".repeat(160) +
    |                         ^^^^^^^^^^^
    |     "deleted_tail\n"
    |   original_documents["\{memory_root}/oversized-line.mbt"] = oversized_diff_line(

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\shell\examples\embedded_viewer\main.mbt:177:25-177:36:
    |   )
    |   original_documents["\{memory_root}/tabbed-deletion.mbt"] = "\t".repeat(160) +
    |     "deleted_tail\n"
177 |   original_documents["\{memory_root}/oversized-line.mbt"] = oversized_diff_line(
    |                         ^^^^^^^^^^^
    |     "o",
    |   )

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\shell\examples\embedded_viewer\main.mbt:180:25-180:36:
    |   original_documents["\{memory_root}/oversized-line.mbt"] = oversized_diff_line(
    |     "o",
    |   )
180 |   original_documents["\{memory_root}/identical.mbt"] = identical_diff_document()
    |                         ^^^^^^^^^^^
    |   original_documents["\{memory_root}/README.md"] = (
    |     #|# Embedded document

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\shell\examples\embedded_viewer\main.mbt:181:25-181:36:
    |     "o",
    |   )
    |   original_documents["\{memory_root}/identical.mbt"] = identical_diff_document()
181 |   original_documents["\{memory_root}/README.md"] = (
    |                         ^^^^^^^^^^^
    |     #|# Embedded document
    |     #|

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\shell\examples\embedded_viewer\main.mbt:187:25-187:36:
    |     #|This in-memory model is rendered by the public MarkdownViewer.
    |     #|
    |   )
187 |   original_documents["\{memory_root}/Guide.MD"] = "# Old uppercase Markdown\n"
    |                         ^^^^^^^^^^^
    |   original_documents["\{memory_root}/tour.MBT.MD"] = (
    |     #|# Old MoonBit Markdown

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\shell\examples\embedded_viewer\main.mbt:188:25-188:36:
    |     #|
    |   )
    |   original_documents["\{memory_root}/Guide.MD"] = "# Old uppercase Markdown\n"
188 |   original_documents["\{memory_root}/tour.MBT.MD"] = (
    |                         ^^^^^^^^^^^
    |     #|# Old MoonBit Markdown
    |     #|

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\shell\examples\embedded_viewer\main.mbt:196:25-196:36:
    |     #|```
    |     #|
    |   )
196 |   original_documents["\{memory_root}/moon.mod"] = ""
    |                         ^^^^^^^^^^^
    |   original_documents["\{memory_root}/src/main.mbt"] = (
    |     #|///|

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\shell\examples\embedded_viewer\main.mbt:197:25-197:36:
    |     #|
    |   )
    |   original_documents["\{memory_root}/moon.mod"] = ""
197 |   original_documents["\{memory_root}/src/main.mbt"] = (
    |                         ^^^^^^^^^^^
    |     #|///|
    |     #|fn main {

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\shell\examples\embedded_viewer\main.mbt:204:25-204:36:
    |     #|}
    |     #|
    |   )
204 |   original_documents["\{memory_root}/src/lib/util.mbt"] = (
    |                         ^^^^^^^^^^^
    |     #|///|
    |     #|pub fn util_answer() -> Int {

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\shell\examples\embedded_viewer\main.mbt:212:26-212:37:
    |     #|
    |   )
    |   {
212 |     root_uri: memory_uri(memory_root),
    |                          ^^^^^^^^^^^
    |     directories,
    |     documents,

e:\Git\warehouse\Working\moonbit\moon-ide-tests\.worktrees\openseek-ide-perf\perf\repos\openseek\editor\internal\shell\examples\embedded_viewer\main.mbt:796:38-796:49:
    | ) -> (@rabbita.Cmd, EmbedModel) {
    |   match msg {
    |     Boot => {
796 |       let first_file = memory_uri("\{memory_root}/src/main.mbt")
    |                                      ^^^^^^^^^^^
    |       (
    |         @rabbita.batch([
"" (escaped)
```
