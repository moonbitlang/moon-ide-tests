# rabbita rename

```mooncram
$ export MOON_HOME="${MOON_HOME:-$HOME/.moon}"
```

```mooncram
$ export TEST_REPO_ROOT="$(cd "$TESTDIR/../../../fixtures/repos/rabbita" && pwd)"
```

```mooncram
$ normalize_moon_ide_output() { sed -e "s|$TEST_REPO_ROOT|<WORKDIR>|g" -e "s|$MOON_HOME|<MOON_HOME>|g"; }
```

```mooncram
$ run_moon_ide() { status_file="${TMPDIR:-/tmp}/moon-ide-status.$$"; ( cd "$TEST_REPO_ROOT" && "$@"; echo "$?" > "$status_file" ) 2>&1 | normalize_moon_ide_output; status=$(cat "$status_file"); rm -f "$status_file"; return "$status"; }
```

```mooncram
$ run_moon_ide moon ide rename 'Cell' 'CellRenamed' --loc 'doc/005_http/using_test.mbt:2:22'
Error: could not get package of file <WORKDIR>/doc/005_http/using_test.mbt
[1]
```

```mooncram
$ run_moon_ide moon ide rename 'Emit' 'EmitRenamed' --loc 'doc/005_http/using_test.mbt:2:33'
Error: could not get package of file <WORKDIR>/doc/005_http/using_test.mbt
[1]
```

```mooncram
$ run_moon_ide moon ide rename 'Cell' 'CellRenamed' --loc 'doc/001_intro/using_test.mbt:2:22'
Error: could not get package of file <WORKDIR>/doc/001_intro/using_test.mbt
[1]
```

```mooncram
$ run_moon_ide moon ide rename 'div' 'div_renamed' --loc 'doc/001_intro/using_test.mbt:5:14'
Error: could not get package of file <WORKDIR>/doc/001_intro/using_test.mbt
[1]
```

```mooncram
$ run_moon_ide moon ide rename 'Emit' 'EmitRenamed' --loc 'doc/003_router/using_test.mbt:2:22'
Error: could not get package of file <WORKDIR>/doc/003_router/using_test.mbt
[1]
```

```mooncram
$ run_moon_ide moon ide rename 'Cmd' 'CmdRenamed' --loc 'doc/003_router/using_test.mbt:2:33'
Error: could not get package of file <WORKDIR>/doc/003_router/using_test.mbt
[1]
```

```mooncram
$ run_moon_ide moon ide rename 'Emit' 'EmitRenamed' --loc 'doc/002_writing_html/using_test.mbt:2:22'
Error: could not get package of file <WORKDIR>/doc/002_writing_html/using_test.mbt
[1]
```

```mooncram
$ run_moon_ide moon ide rename 'Html' 'HtmlRenamed' --loc 'doc/002_writing_html/using_test.mbt:2:33'
Error: could not get package of file <WORKDIR>/doc/002_writing_html/using_test.mbt
[1]
```

```mooncram
$ run_moon_ide moon ide rename 'Emit' 'EmitRenamed' --loc 'doc/004_using_command/using_test.mbt:2:22'
Error: could not get package of file <WORKDIR>/doc/004_using_command/using_test.mbt
[1]
```

```mooncram
$ run_moon_ide moon ide rename 'Cmd' 'CmdRenamed' --loc 'doc/004_using_command/using_test.mbt:2:33'
Error: could not get package of file <WORKDIR>/doc/004_using_command/using_test.mbt
[1]
```

```mooncram
$ run_moon_ide moon ide rename 'Emit' 'EmitRenamed' --loc 'doc/using_subscriptions/using_test.mbt:2:22'
Error: could not get package of file <WORKDIR>/doc/using_subscriptions/using_test.mbt
[1]
```

```mooncram
$ run_moon_ide moon ide rename 'Cell' 'CellRenamed' --loc 'doc/using_subscriptions/using_test.mbt:2:33'
Error: could not get package of file <WORKDIR>/doc/using_subscriptions/using_test.mbt
[1]
```

```mooncram
$ run_moon_ide moon ide rename 'load_shiki' 'load_shiki_renamed' --loc 'utils/shiki/shiki.mbt:2:16'
Error: could not get package of file <WORKDIR>/utils/shiki/shiki.mbt
[1]
```

```mooncram
$ run_moon_ide moon ide rename 'Promise' 'PromiseRenamed' --loc 'utils/shiki/shiki.mbt:2:28'
Error: could not get package of file <WORKDIR>/utils/shiki/shiki.mbt
[1]
```

```mooncram
$ run_moon_ide moon ide rename 'log' 'log_renamed' --loc 'warren/log/log.mbt:2:8'
*** Begin Patch
*** Update File: <WORKDIR>/warren/devhub/devhub.mbt
@@
 
     guard command.contains("warren") else {
       let detail = if command == "" { "" } else { ": \{command}" }
-      @log.log(
+      @log.log_renamed(
         "error",
         "Port \{port} is already in use by process \{pid}\{detail}. Stop it manually, or run `warren dev --port <port>`.",
       )
@@
       panic()
     }
 
-    @log.log(
+    @log.log_renamed(
       "warn",
       "Port \{port} is occupied by previous warren process \{pid}. Killing it...",
     )
     guard @process.run("kill", [pid]) == 0 else {
-      @log.log(
+      @log.log_renamed(
         "error",
         "Failed to kill previous warren process \{pid} on port \{port}. Stop it manually, or run `warren dev --port <port>`.",
       )
*** Update File: <WORKDIR>/warren/log.mbt
@@
 ///|
 fn log(tag : String, msg : String) -> Unit {
-  @log.log(tag, msg)
+  @log.log_renamed(tag, msg)
 }
 
 ///|
*** Update File: <WORKDIR>/warren/log/log.mbt
@@
 ///|
-pub fn log(tag : String, msg : String) -> Unit {
+pub fn log_renamed(tag : String, msg : String) -> Unit {
   let display_tag = if tag.length() < 7 {
     let prefix = " ".repeat(7 - tag.length())
     "\{prefix}[\{tag}]"
*** End Patch

```

```mooncram
$ run_moon_ide moon ide rename 'tag' 'tag_renamed' --loc 'warren/log/log.mbt:2:12'
*** Begin Patch
*** Update File: <WORKDIR>/warren/log/log.mbt
@@
 ///|
-pub fn log(tag : String, msg : String) -> Unit {
+pub fn log(tag_renamed : String, msg : String) -> Unit {
-  let display_tag = if tag.length() < 7 {
+  let display_tag = if tag_renamed.length() < 7 {
-    let prefix = " ".repeat(7 - tag.length())
+    let prefix = " ".repeat(7 - tag_renamed.length())
-    "\{prefix}[\{tag}]"
+    "\{prefix}[\{tag_renamed}]"
   } else {
-    "[\{tag}]"
+    "[\{tag_renamed}]"
   }
   let use_color = match @env.get_env_var("NO_COLOR") {
     Some(_) => false
@@
       }
   }
 
-  let tag_color = match tag {
+  let tag_color = match tag_renamed {
     "error" | "err" | "fatal" => "\u001b[31m"
     "info" => "\u001b[37m"
     "warn" | "warning" => "\u001b[33m"
@@
   let time = "\{hh}:\{mm}"
   if use_color {
     let reset = "\u001b[0m"
-    let display_msg = if tag == "info" {
+    let display_msg = if tag_renamed == "info" {
       "\u001b[37m\{msg}\{reset}"
     } else {
       msg
*** End Patch

```

```mooncram
$ run_moon_ide moon ide rename 'SourcePath' 'SourcePathRenamed' --loc 'warren/vfs/vfs.mbt:2:19'
*** Begin Patch
*** Update File: <WORKDIR>/warren/vfs/vfs.mbt
@@
 ///|
-using @path {type SourcePath}
+using @path {type SourcePathRenamed}
 
 ///|
 pub(all) enum VirtualFs {
-  DirectoryMapping(SourcePath)
+  DirectoryMapping(SourcePathRenamed)
-  FileMapping(SourcePath)
+  FileMapping(SourcePathRenamed)
   DirectoryContent(Map[String, VirtualFs])
   FileContent(String)
 } derive(Debug)
*** End Patch

```

```mooncram
$ run_moon_ide moon ide rename 'VirtualFs' 'VirtualFsRenamed' --loc 'warren/vfs/vfs.mbt:5:15'
*** Begin Patch
*** Update File: <WORKDIR>/warren/vfs/vfs.mbt
@@
 using @path {type SourcePath}
 
 ///|
-pub(all) enum VirtualFs {
+pub(all) enum VirtualFsRenamed {
   DirectoryMapping(SourcePath)
   FileMapping(SourcePath)
-  DirectoryContent(Map[String, VirtualFs])
+  DirectoryContent(Map[String, VirtualFsRenamed])
   FileContent(String)
 } derive(Debug)
 
 ///|
 struct VirtualFileSystem {
-  roots : Map[String, VirtualFs]
+  roots : Map[String, VirtualFsRenamed]
 } derive(Debug)
 
 ///|
 #as_free_fn
-pub fn VirtualFileSystem::new(map : Map[String, VirtualFs]) -> Self {
+pub fn VirtualFileSystem::new(map : Map[String, VirtualFsRenamed]) -> Self {
   let self = { roots: {} }
   for entry in map.iter() {
     let (path, node) = entry
@@
 pub fn VirtualFileSystem::mount(
   self : Self,
   path : String,
-  vfs : VirtualFs,
+  vfs : VirtualFsRenamed,
 ) -> Unit {
   let parts = path
     .split("/")
@@
     return
   }
 
-  fn remove(entries : Map[String, VirtualFs], i : Int) -> Unit {
+  fn remove(entries : Map[String, VirtualFsRenamed], i : Int) -> Unit {
     entries.update(parts[i], fn(node) {
       match node {
         Some(node) =>
*** End Patch

```

```mooncram
$ run_moon_ide moon ide rename 'ArtifactPath' 'ArtifactPathRenamed' --loc 'warren/path/artifact_path.mbt:2:8'
*** Begin Patch
*** Update File: <WORKDIR>/warren/path/artifact_path.mbt
@@
 ///|
-struct ArtifactPath {
+struct ArtifactPathRenamed {
   root : SourcePath
   mod_path : String?
   relative : String
@@
 } derive(Eq, Hash, Debug)
 
 ///|
-pub impl Debug for ArtifactPath with fn to_repr(self) {
+pub impl Debug for ArtifactPathRenamed with fn to_repr(self) {
   @debug.Repr::string(self.to_string(Js, Debug, Build).to_string())
 }
 
 ///|
-pub fn ArtifactPath::join_module_path(
+pub fn ArtifactPathRenamed::join_module_path(
   self : Self,
   mod : MooncakesPath,
-) -> ArtifactPath {
+) -> ArtifactPathRenamed {
   { ..self, mod_path: Some(mod.to_string()) }
 }
 
 ///|
-pub fn ArtifactPath::new(root : SourcePath) -> ArtifactPath {
+pub fn ArtifactPathRenamed::new(root : SourcePath) -> ArtifactPathRenamed {
   { root, relative: "", mod_path: None }
 }
 
 ///|
-pub fn ArtifactPath::join_relative(s1 : Self, s2 : String) -> ArtifactPath {
+pub fn ArtifactPathRenamed::join_relative(s1 : Self, s2 : String) -> ArtifactPathRenamed {
   { ..s1, relative: Path::join(s1.relative, s2).0 }
 }
 
 ///|
-pub fn ArtifactPath::to_string(
+pub fn ArtifactPathRenamed::to_string(
   self : Self,
   target : Target,
   build : Build,
*** End Patch

```

```mooncram
$ run_moon_ide moon ide rename 'root' 'root_renamed' --loc 'warren/path/artifact_path.mbt:3:3'
*** Begin Patch
*** Update File: <WORKDIR>/warren/path/artifact_path.mbt
@@
 ///|
 struct ArtifactPath {
-  root : SourcePath
+  root_renamed : SourcePath
   mod_path : String?
   relative : String
 }
@@
 
 ///|
 pub fn ArtifactPath::new(root : SourcePath) -> ArtifactPath {
-  { root, relative: "", mod_path: None }
+  { root_renamed: root, relative: "", mod_path: None }
 }
 
 ///|
@@
   build : Build,
   mode : Mode,
 ) -> SourcePath {
-  let mut acc = self.root
+  let mut acc = self.root_renamed
   acc = acc.join(
     match target {
       Js => "js"
*** End Patch

```

```mooncram
$ run_moon_ide moon ide rename 'MooncakesPath' 'MooncakesPathRenamed' --loc 'warren/path/mooncakeio_path.mbt:2:8'
*** Begin Patch
*** Update File: <WORKDIR>/warren/path/artifact_path.mbt
@@
 ///|
 pub fn ArtifactPath::join_module_path(
   self : Self,
-  mod : MooncakesPath,
+  mod : MooncakesPathRenamed,
 ) -> ArtifactPath {
   { ..self, mod_path: Some(mod.to_string()) }
 }
*** Update File: <WORKDIR>/warren/path/mooncakeio_path.mbt
@@
 ///|
-struct MooncakesPath(String) derive(Eq, Compare)
+struct MooncakesPathRenamed(String) derive(Eq, Compare)
 
 ///|
-pub fn MooncakesPath::new(s : String) -> Self {
+pub fn MooncakesPathRenamed::new(s : String) -> Self {
-  MooncakesPath(s)
+  MooncakesPathRenamed(s)
 }
 
 ///|
-pub fn MooncakesPath::to_string(s : Self) -> String {
+pub fn MooncakesPathRenamed::to_string(s : Self) -> String {
   s.0
 }
 
 ///|
-pub fn MooncakesPath::join(a : Self, b : String) -> Self {
+pub fn MooncakesPathRenamed::join(a : Self, b : String) -> Self {
   Path::join(a.0, b).0
 }
 
 ///|
-pub impl Debug for MooncakesPath with fn to_repr(self) {
+pub impl Debug for MooncakesPathRenamed with fn to_repr(self) {
   @debug.Repr::string(self.0)
 }
 
 ///|
-pub impl Show for MooncakesPath with fn output(self, buf) {
+pub impl Show for MooncakesPathRenamed with fn output(self, buf) {
   buf.write_string(self.0)
 }
*** End Patch

```

```mooncram
$ run_moon_ide moon ide rename 'MooncakesPath' 'MooncakesPathRenamed' --loc 'warren/path/mooncakeio_path.mbt:5:8'
*** Begin Patch
*** Update File: <WORKDIR>/warren/path/artifact_path.mbt
@@
 ///|
 pub fn ArtifactPath::join_module_path(
   self : Self,
-  mod : MooncakesPath,
+  mod : MooncakesPathRenamed,
 ) -> ArtifactPath {
   { ..self, mod_path: Some(mod.to_string()) }
 }
*** Update File: <WORKDIR>/warren/path/mooncakeio_path.mbt
@@
 ///|
-struct MooncakesPath(String) derive(Eq, Compare)
+struct MooncakesPathRenamed(String) derive(Eq, Compare)
 
 ///|
-pub fn MooncakesPath::new(s : String) -> Self {
+pub fn MooncakesPathRenamed::new(s : String) -> Self {
-  MooncakesPath(s)
+  MooncakesPathRenamed(s)
 }
 
 ///|
-pub fn MooncakesPath::to_string(s : Self) -> String {
+pub fn MooncakesPathRenamed::to_string(s : Self) -> String {
   s.0
 }
 
 ///|
-pub fn MooncakesPath::join(a : Self, b : String) -> Self {
+pub fn MooncakesPathRenamed::join(a : Self, b : String) -> Self {
   Path::join(a.0, b).0
 }
 
 ///|
-pub impl Debug for MooncakesPath with fn to_repr(self) {
+pub impl Debug for MooncakesPathRenamed with fn to_repr(self) {
   @debug.Repr::string(self.0)
 }
 
 ///|
-pub impl Show for MooncakesPath with fn output(self, buf) {
+pub impl Show for MooncakesPathRenamed with fn output(self, buf) {
   buf.write_string(self.0)
 }
*** End Patch

```

```mooncram
$ run_moon_ide moon ide rename 'Path' 'PathRenamed' --loc 'warren/path/sourcetree_path.mbt:2:15'
*** Begin Patch
*** Update File: <WORKDIR>/warren/devhub/devhub.mbt
@@
     path =>
       match self.vfs.read(path) {
         Some(content) => {
-          let content_type = match @path.Path::extname(path) {
+          let content_type = match @path.PathRenamed::extname(path) {
             ".png" => "image/png"
             ".jpg" | ".jpeg" => "image/jpeg"
             ".html" => "text/html"
*** Update File: <WORKDIR>/warren/main.mbt
@@
 ///|
-using @path {type SourcePath, type Path}
+using @path {type SourcePath, type PathRenamed}
 
 ///|
 using @devhub {type BroadcastMsg, type Devhub}
*** Update File: <WORKDIR>/warren/path/artifact_path.mbt
@@
 
 ///|
 pub fn ArtifactPath::join_relative(s1 : Self, s2 : String) -> ArtifactPath {
-  { ..s1, relative: Path::join(s1.relative, s2).0 }
+  { ..s1, relative: PathRenamed::join(s1.relative, s2).0 }
 }
 
 ///|
*** Update File: <WORKDIR>/warren/path/mooncakeio_path.mbt
@@
 
 ///|
 pub fn MooncakesPath::join(a : Self, b : String) -> Self {
-  Path::join(a.0, b).0
+  PathRenamed::join(a.0, b).0
 }
 
 ///|
*** Update File: <WORKDIR>/warren/path/sourcetree_path.mbt
@@
 ///|
-pub type Path = @p.Path
+pub type PathRenamed = @p.Path
 
 ///|
 struct SourcePath(String) derive(Eq, Compare, Hash)
@@
 
 ///|
 pub fn SourcePath::new(s : String) -> Self {
-  Path::resolve(s).0
+  PathRenamed::resolve(s).0
 }
 
 ///|
@@
 
 ///|
 pub fn SourcePath::join(a : Self, b : String) -> Self {
-  Path::join(a.0, b).normalize().0
+  PathRenamed::join(a.0, b).normalize().0
 }
 
 ///|
 pub fn SourcePath::relative(a : Self, base : SourcePath) -> String {
-  Path::relative(a.0, base=base.0).0
+  PathRenamed::relative(a.0, base=base.0).0
 }
*** Update File: <WORKDIR>/warren/utils.mbt
@@
       copy(src=src.join(entry), dst=dst.join(entry))
     }
   } else {
-    let parent = @path.Path::dirname(dst_str).to_string()
+    let parent = @path.PathRenamed::dirname(dst_str).to_string()
     if parent != "" && parent != "." && !@fs.exists(parent) {
       @fs.mkdir(parent, permission=0o755, recursive=true)
     }
*** End Patch

```

```mooncram
$ run_moon_ide moon ide rename 'SourcePath' 'SourcePathRenamed' --loc 'warren/path/sourcetree_path.mbt:5:8'
*** Begin Patch
*** Update File: <WORKDIR>/warren/main.mbt
@@
 ///|
-using @path {type SourcePath, type Path}
+using @path {type SourcePathRenamed, type Path}
 
 ///|
 using @devhub {type BroadcastMsg, type Devhub}
*** Update File: <WORKDIR>/warren/path/artifact_path.mbt
@@
 ///|
 struct ArtifactPath {
-  root : SourcePath
+  root : SourcePathRenamed
   mod_path : String?
   relative : String
 }
@@
 }
 
 ///|
-pub fn ArtifactPath::new(root : SourcePath) -> ArtifactPath {
+pub fn ArtifactPath::new(root : SourcePathRenamed) -> ArtifactPath {
   { root, relative: "", mod_path: None }
 }
 
@@
   target : Target,
   build : Build,
   mode : Mode,
-) -> SourcePath {
+) -> SourcePathRenamed {
   let mut acc = self.root
   acc = acc.join(
     match target {
*** Update File: <WORKDIR>/warren/path/sourcetree_path.mbt
@@
 pub type Path = @p.Path
 
 ///|
-struct SourcePath(String) derive(Eq, Compare, Hash)
+struct SourcePathRenamed(String) derive(Eq, Compare, Hash)
 
 ///|
-pub impl Debug for SourcePath with fn to_repr(self) {
+pub impl Debug for SourcePathRenamed with fn to_repr(self) {
   @debug.Repr::string(self.0)
 }
 
 ///|
-pub fn SourcePath::new(s : String) -> Self {
+pub fn SourcePathRenamed::new(s : String) -> Self {
   Path::resolve(s).0
 }
 
 ///|
-pub impl Show for SourcePath with fn output(self, buf) {
+pub impl Show for SourcePathRenamed with fn output(self, buf) {
   buf.write_string(self.0)
 }
 
 ///|
-pub fn SourcePath::join(a : Self, b : String) -> Self {
+pub fn SourcePathRenamed::join(a : Self, b : String) -> Self {
   Path::join(a.0, b).normalize().0
 }
 
 ///|
-pub fn SourcePath::relative(a : Self, base : SourcePath) -> String {
+pub fn SourcePathRenamed::relative(a : Self, base : SourcePathRenamed) -> String {
   Path::relative(a.0, base=base.0).0
 }
*** Update File: <WORKDIR>/warren/vfs/vfs.mbt
@@
 ///|
-using @path {type SourcePath}
+using @path {type SourcePathRenamed}
 
 ///|
 pub(all) enum VirtualFs {
*** End Patch

```

```mooncram
$ run_moon_ide moon ide rename 'BroadcastMsg' 'BroadcastMsgRenamed' --loc 'warren/devhub/devhub.mbt:2:15'
*** Begin Patch
*** Update File: <WORKDIR>/warren/devhub/devhub.mbt
@@
 ///|
-pub(all) enum BroadcastMsg {
+pub(all) enum BroadcastMsgRenamed {
   Building
   Reload
   BuildFailed(String)
@@
   priv vfs : @vfs.VirtualFileSystem
   priv client_msgs : @async.Queue[ClientMsg]
   priv mut next_id : Int
-  priv subscribers : Map[Int, @async.Queue[BroadcastMsg]]
+  priv subscribers : Map[Int, @async.Queue[BroadcastMsgRenamed]]
 }
 
 ///|
@@
 }
 
 ///|
-pub fn Devhub::broadcast(self : Self, msg : BroadcastMsg) -> Unit {
+pub fn Devhub::broadcast(self : Self, msg : BroadcastMsgRenamed) -> Unit {
   for entry in self.subscribers.iter() {
     let (_, queue) = entry
     ignore(queue.try_put(msg)) catch {
*** Update File: <WORKDIR>/warren/main.mbt
@@
 using @path {type SourcePath, type Path}
 
 ///|
-using @devhub {type BroadcastMsg, type Devhub}
+using @devhub {type BroadcastMsgRenamed, type Devhub}
 
 ///|
 using @string {parse_int}
*** End Patch

```

```mooncram
$ run_moon_ide moon ide rename 'Building' 'BuildingRenamed' --loc 'warren/devhub/devhub.mbt:3:3'
*** Begin Patch
*** Update File: <WORKDIR>/warren/devhub/devhub.mbt
@@
 ///|
 pub(all) enum BroadcastMsg {
-  Building
+  BuildingRenamed
   Reload
   BuildFailed(String)
 } derive(Debug)
@@
     group.spawn_bg(allow_failure=true, () => {
       while queue.get() is msg {
         match msg {
-          Building => ws.send_text("building")
+          BuildingRenamed => ws.send_text("building")
           Reload => ws.send_text("reload")
           BuildFailed(diagnostics) =>
             ws.send_text("build_failed\n\{diagnostics}")
*** Update File: <WORKDIR>/warren/main.mbt
@@
       let (stdin, close_stdin) = @process.write_to_process()
       close_stdin.close()
       @fs.rmdir(target_dir, recursive=true)
-      hub.broadcast(BroadcastMsg::Building)
+      hub.broadcast(BroadcastMsg::BuildingRenamed)
       log("warren", "Building...")
 
       defer reader.close()
*** End Patch

```

```mooncram
$ run_moon_ide moon ide rename 'Cmd' 'CmdRenamed' --loc 'warren/devtool/main.mbt:2:22'
*** Begin Patch
*** Update File: <WORKDIR>/warren/devtool/main.mbt
@@
 ///|
-using @rabbita {type Cmd, type Emit, type Html, delay, new, none}
+using @rabbita {type CmdRenamed, type Emit, type Html, delay, new, none}
 
 ///|
 using @common {type Mouse, type Viewport}
@@
 }
 
 ///|
-fn update(emit : Emit[Msg], msg : Msg, model : Model) -> (Cmd, Model) {
+fn update(emit : Emit[Msg], msg : Msg, model : Model) -> (CmdRenamed, Model) {
   match msg {
     HoverStarted => (none, { ..model, hovered: true })
     HoverEnded => (none, { ..model, hovered: false })
*** End Patch

```

```mooncram
$ run_moon_ide moon ide rename 'Emit' 'EmitRenamed' --loc 'warren/devtool/main.mbt:2:32'
*** Begin Patch
*** Update File: <WORKDIR>/warren/devtool/main.mbt
@@
 ///|
-using @rabbita {type Cmd, type Emit, type Html, delay, new, none}
+using @rabbita {type Cmd, type EmitRenamed, type Html, delay, new, none}
 
 ///|
 using @common {type Mouse, type Viewport}
@@
 }
 
 ///|
-fn update(emit : Emit[Msg], msg : Msg, model : Model) -> (Cmd, Model) {
+fn update(emit : EmitRenamed[Msg], msg : Msg, model : Model) -> (Cmd, Model) {
   match msg {
     HoverStarted => (none, { ..model, hovered: true })
     HoverEnded => (none, { ..model, hovered: false })
@@
 }
 
 ///|
-fn subscriptions(emit : Emit[Msg], model : Model) -> @sub.Sub {
+fn subscriptions(emit : EmitRenamed[Msg], model : Model) -> @sub.Sub {
   let socket_sub = if model.listening {
     @websocket.listen(
       websocket_url(),
@@
 }
 
 ///|
-fn drag_layer(emit : Emit[Msg], model : Model) -> Html {
+fn drag_layer(emit : EmitRenamed[Msg], model : Model) -> Html {
   match model.drag {
     Some(_) =>
       div(
@@
 }
 
 ///|
-fn view(emit : Emit[Msg], model : Model) -> Html {
+fn view(emit : EmitRenamed[Msg], model : Model) -> Html {
   let expansion_class = if panel_expanded(model) {
     "is-expanded"
   } else {
*** End Patch

```

```mooncram
$ run_moon_ide moon ide rename 'log' 'log_renamed' --loc 'warren/log.mbt:2:4'
*** Begin Patch
*** Update File: <WORKDIR>/warren/build.mbt
@@
     source_path_to_string(target_dir),
   ]
   let command = args.join(" ")
-  log("build", "Running `moon \{command}`")
+  log_renamed("build", "Running `moon \{command}`")
   let exit_code = @process.run("moon", args) catch {
     err => abort("Failed to run `moon build`: \{err}")
   }
@@
   cwd : SourcePath,
   label : String,
 ) -> Bool {
-  log("build", "Minifying JS with \{label}")
+  log_renamed("build", "Minifying JS with \{label}")
   try @process.run(cmd, args, cwd=source_path_to_string(cwd)) catch {
     err => {
-      log("warn", "\{label} failed: \{err}. Falling back to release JS")
+      log_renamed("warn", "\{label} failed: \{err}. Falling back to release JS")
       false
     }
   } noraise {
     0 => true
     code => {
-      log(
+      log_renamed(
         "warn",
         "\{label} exited with code \{code}, falling back to release JS",
       )
@@
     return
   }
 
-  log(
+  log_renamed(
     "warn", "terser not found and node/npm unavailable. Using Moon release JS without extra minification.",
   )
   copy(src~, dst~)
@@
   minify_or_copy_js(release_js, dist_dir.join("index.js"), mod_root)
   write_index_html(dist_dir)
 
-  log("build", "Build output written to \{dist_dir}")
+  log_renamed("build", "Build output written to \{dist_dir}")
 }
 
 ///|
*** Update File: <WORKDIR>/warren/log.mbt
@@
 ///|
-fn log(tag : String, msg : String) -> Unit {
+fn log_renamed(tag : String, msg : String) -> Unit {
   @log.log(tag, msg)
 }
 
 ///|
 pub fn debug_log(tag : String, msg : String) -> Unit {
-  log(tag, msg)
+  log_renamed(tag, msg)
 }
*** Update File: <WORKDIR>/warren/main.mbt
@@
   match tag {
     Some(p) => (html[:p] + patch + html[p:]).to_owned()
     None => {
-      log("warn", "No </head> or </html> tag in index.html")
+      log_renamed("warn", "No </head> or </html> tag in index.html")
       if html.has_suffix("\n") {
         html + patch
       } else {
@@
   @async.with_task_group <| group => {
     let hub = Devhub(port, vfs)
     group.spawn_bg(no_wait=true, allow_failure=true, () => hub.run_forever())
-    log("info", "Running server on http://127.0.0.1:\{hub.port()}")
+    log_renamed("info", "Running server on http://127.0.0.1:\{hub.port()}")
 
     while true {
       let (reader, out) = @process.read_from_process()
@@
       close_stdin.close()
       @fs.rmdir(target_dir, recursive=true)
       hub.broadcast(BroadcastMsg::Building)
-      log("warren", "Building...")
+      log_renamed("warren", "Building...")
 
       defer reader.close()
       let diagnostics = StringBuilder::new()
@@
           if line != "" {
             diagnostics.write_string(line)
             diagnostics.write_string("\n")
-            log("moon", line)
+            log_renamed("moon", line)
           }
         }
         exit_code.wait()
@@
       }
 
       if code == 0 {
-        log("warren", "moon build succeed at \{main_pkg_dir}.")
+        log_renamed("warren", "moon build succeed at \{main_pkg_dir}.")
         let js_paths = find_js_in(
           Path::join(target_dir, "js/debug/build").to_string(),
         )
         guard js_paths is [js_path] else {
-          log("error", "found multiple entries: \{to_repr(js_paths)}")
+          log_renamed("error", "found multiple entries: \{to_repr(js_paths)}")
-          log(
+          log_renamed(
             "info", "Use `warren dev path/to/main/package/dir` to choose one entry.",
           )
         }
@@
         vfs.mount("index.js", FileMapping(SourcePath::new(js_path)))
         // debug(vfs)
         hub.broadcast(BroadcastMsg::Reload)
-        log("warren", "Changes detected. Reloading...")
+        log_renamed("warren", "Changes detected. Reloading...")
       } else {
         hub.broadcast(
           BroadcastMsg::BuildFailed(
@@
             build_failure_diagnostics(diagnostics.to_string(), code),
           ),
         )
-        log("error", "moon exited with code \{code}.")
+        log_renamed("error", "moon exited with code \{code}.")
       }
 
       watcher.wait_any()
*** End Patch

```

```mooncram
$ run_moon_ide moon ide rename 'tag' 'tag_renamed' --loc 'warren/log.mbt:2:8'
*** Begin Patch
*** Update File: <WORKDIR>/warren/log.mbt
@@
 ///|
-fn log(tag : String, msg : String) -> Unit {
+fn log(tag_renamed : String, msg : String) -> Unit {
-  @log.log(tag, msg)
+  @log.log(tag_renamed, msg)
 }
 
 ///|
*** End Patch

```

```mooncram
$ run_moon_ide moon ide rename 'SourcePath' 'SourcePathRenamed' --loc 'warren/main.mbt:2:19'
*** Begin Patch
*** Update File: <WORKDIR>/warren/build.mbt
@@
   #|    <script src="./index.js" type="module"></script>
 
 ///|
-fn source_path_to_string(path : SourcePath) -> String {
+fn source_path_to_string(path : SourcePathRenamed) -> String {
   "\{path}"
 }
 
@@
 }
 
 ///|
-async fn ensure_clean_dir(path : SourcePath) -> Unit {
+async fn ensure_clean_dir(path : SourcePathRenamed) -> Unit {
   let path_str = source_path_to_string(path)
   if @fs.exists(path_str) {
     match @fs.kind(path_str) {
@@
 }
 
 ///|
-async fn copy_dir_contents(src : SourcePath, dst : SourcePath) -> Unit {
+async fn copy_dir_contents(src : SourcePathRenamed, dst : SourcePathRenamed) -> Unit {
   for entry in @fs.readdir(source_path_to_string(src), sort=true) {
     copy(src=src.join(entry), dst=dst.join(entry))
   }
@@
 
 ///|
 async fn run_release_build(
-  main_pkg_dir : SourcePath,
+  main_pkg_dir : SourcePathRenamed,
-  target_dir : SourcePath,
+  target_dir : SourcePathRenamed,
 ) -> Unit {
   let args = [
     "build",
@@
 async fn run_minifier(
   cmd : String,
   args : Array[String],
-  cwd : SourcePath,
+  cwd : SourcePathRenamed,
   label : String,
 ) -> Bool {
   log("build", "Minifying JS with \{label}")
@@
 }
 
 ///|
-async fn write_index_html(dist_dir : SourcePath) -> Unit {
+async fn write_index_html(dist_dir : SourcePathRenamed) -> Unit {
   let index_path = dist_dir.join("index.html")
   let index_str = source_path_to_string(index_path)
   if @fs.exists(index_str) {
@@
 
 ///|
 async fn minify_or_copy_js(
-  src : SourcePath,
+  src : SourcePathRenamed,
-  dst : SourcePath,
+  dst : SourcePathRenamed,
-  mod_root : SourcePath,
+  mod_root : SourcePathRenamed,
 ) -> Unit {
   let src_str = source_path_to_string(src)
   let dst_str = source_path_to_string(dst)
@@
 
 ///|
 pub async fn build_project(
-  main_pkg_dir : SourcePath,
+  main_pkg_dir : SourcePathRenamed,
-  dist_dir? : SourcePath,
+  dist_dir? : SourcePathRenamed,
 ) -> Unit {
   let main_pkg_dir_str = source_path_to_string(main_pkg_dir)
   let mod_root = if Path::basename(main_pkg_dir_str) == "main" {
-    SourcePath::new(Path::dirname(main_pkg_dir_str).to_string())
+    SourcePathRenamed::new(Path::dirname(main_pkg_dir_str).to_string())
   } else {
     main_pkg_dir
   }
-  let target_dir = SourcePath::new(@fs.tmpdir(prefix="warren"))
+  let target_dir = SourcePathRenamed::new(@fs.tmpdir(prefix="warren"))
   let dist_dir = dist_dir.unwrap_or(mod_root.join("dist"))
   let public_dir = mod_root.join("public")
 
@@
   ).to_string()
   let js_paths = find_js_in(build_dir)
   let release_js = match js_paths {
-    [js_path] => SourcePath::new(js_path)
+    [js_path] => SourcePathRenamed::new(js_path)
     [] => abort("Release JS artifact not found under \{build_dir}")
     _ =>
       abort(
*** Update File: <WORKDIR>/warren/main.mbt
@@
 ///|
-using @path {type SourcePath, type Path}
+using @path {type SourcePathRenamed, type Path}
 
 ///|
 using @devhub {type BroadcastMsg, type Devhub}
@@
         _ => Path::join(cwd, "dist").to_string()
       }
       build_project(
-        SourcePath::new(main_pkg_dir),
+        SourcePathRenamed::new(main_pkg_dir),
-        dist_dir=SourcePath::new(dist_dir),
+        dist_dir=SourcePathRenamed::new(dist_dir),
       )
     }
     "new" =>
@@
 
   let vfs = @vfs.new({})
   if public_dir is Some(dir) {
-    vfs.mount("/", DirectoryMapping(SourcePath::new(dir)))
+    vfs.mount("/", DirectoryMapping(SourcePathRenamed::new(dir)))
     let files = @fs.readdir(dir)
     if files.contains("index.html") {
       let html = @fs.read_file(Path::join(dir, "index.html").to_string()).text()
@@
           .to_string()
 
         if @fs.exists(js_map_path) {
-          vfs.mount("index.js.map", FileMapping(SourcePath::new(js_map_path)))
+          vfs.mount("index.js.map", FileMapping(SourcePathRenamed::new(js_map_path)))
         } else {
           vfs.unmount("index.js.map")
         }
 
-        vfs.mount("index.js", FileMapping(SourcePath::new(js_path)))
+        vfs.mount("index.js", FileMapping(SourcePathRenamed::new(js_path)))
         // debug(vfs)
         hub.broadcast(BroadcastMsg::Reload)
         log("warren", "Changes detected. Reloading...")
*** Update File: <WORKDIR>/warren/utils.mbt
@@
 ///|
-pub async fn copy(src~ : SourcePath, dst~ : SourcePath) -> Unit {
+pub async fn copy(src~ : SourcePathRenamed, dst~ : SourcePathRenamed) -> Unit {
   let src_str = "\{src}"
   let dst_str = "\{dst}"
   guard @fs.exists(src_str) else { fail("Source path does not exist: \{src}") }
*** End Patch

```

```mooncram
$ run_moon_ide moon ide rename 'Path' 'PathRenamed' --loc 'warren/main.mbt:2:36'
*** Begin Patch
*** Update File: <WORKDIR>/warren/build.mbt
@@
   dist_dir? : SourcePath,
 ) -> Unit {
   let main_pkg_dir_str = source_path_to_string(main_pkg_dir)
-  let mod_root = if Path::basename(main_pkg_dir_str) == "main" {
+  let mod_root = if PathRenamed::basename(main_pkg_dir_str) == "main" {
-    SourcePath::new(Path::dirname(main_pkg_dir_str).to_string())
+    SourcePath::new(PathRenamed::dirname(main_pkg_dir_str).to_string())
   } else {
     main_pkg_dir
   }
@@
   let public_dir = mod_root.join("public")
 
   run_release_build(main_pkg_dir, target_dir)
-  let build_dir = Path::join(
+  let build_dir = PathRenamed::join(
     source_path_to_string(target_dir),
     "js/release/build",
   ).to_string()
*** Update File: <WORKDIR>/warren/main.mbt
@@
 ///|
-using @path {type SourcePath, type Path}
+using @path {type SourcePath, type PathRenamed}
 
 ///|
 using @devhub {type BroadcastMsg, type Devhub}
@@
   guard cli.subcommand is Some((subcmd, submatches)) else { return }
   match subcmd {
     "dev" => {
-      let cwd_main = Path::join(cwd, "main").to_string()
+      let cwd_main = PathRenamed::join(cwd, "main").to_string()
       let main_pkg_dir = match submatches.values.get("main-package-dir") {
-        Some([path]) => Path::resolve(path).to_string()
+        Some([path]) => PathRenamed::resolve(path).to_string()
         _ if @fs.exists(cwd_main) => cwd_main
         _ => cwd
       }
-      let cwd_public = Path::join(cwd, "public").to_string()
+      let cwd_public = PathRenamed::join(cwd, "public").to_string()
       let public_dir = match submatches.values.get("public-dir") {
-        Some([path]) => Some(Path::resolve(path).to_string())
+        Some([path]) => Some(PathRenamed::resolve(path).to_string())
         _ if @fs.exists(cwd_public) => Some(cwd_public)
         _ => None
       }
@@
       dev_server(main_pkg_dir~, target_dir~, public_dir~, port~)
     }
     "build" => {
-      let cwd_main = Path::join(cwd, "main").to_string()
+      let cwd_main = PathRenamed::join(cwd, "main").to_string()
       let main_pkg_dir = match submatches.values.get("main-package-dir") {
-        Some([path]) => Path::resolve(path).to_string()
+        Some([path]) => PathRenamed::resolve(path).to_string()
         _ if @fs.exists(cwd_main) => cwd_main
         _ => cwd
       }
       let dist_dir = match submatches.values.get("dist") {
-        Some([path]) => Path::resolve(path).to_string()
+        Some([path]) => PathRenamed::resolve(path).to_string()
-        _ => Path::join(cwd, "dist").to_string()
+        _ => PathRenamed::join(cwd, "dist").to_string()
       }
       build_project(
         SourcePath::new(main_pkg_dir),
@@
     vfs.mount("/", DirectoryMapping(SourcePath::new(dir)))
     let files = @fs.readdir(dir)
     if files.contains("index.html") {
-      let html = @fs.read_file(Path::join(dir, "index.html").to_string()).text()
+      let html = @fs.read_file(PathRenamed::join(dir, "index.html").to_string()).text()
       vfs.mount(
         "/__warren/preview/index.html",
         FileContent(inject_preview_assets(html)),
@@
       if code == 0 {
         log("warren", "moon build succeed at \{main_pkg_dir}.")
         let js_paths = find_js_in(
-          Path::join(target_dir, "js/debug/build").to_string(),
+          PathRenamed::join(target_dir, "js/debug/build").to_string(),
         )
         guard js_paths is [js_path] else {
           log("error", "found multiple entries: \{to_repr(js_paths)}")
@@
           )
         }
 
-        let basename = Path::basename(js_path)
+        let basename = PathRenamed::basename(js_path)
-        let js_map_path = Path::dirname(js_path)
+        let js_map_path = PathRenamed::dirname(js_path)
           .join("\{basename}.map")
           .to_string()
 
@@
     let handle = @fs.opendir(dir)
     defer handle.close()
     while handle.next() is Some(entry) {
-      let path = Path::join(dir, entry.name).to_string()
+      let path = PathRenamed::join(dir, entry.name).to_string()
       if entry.is_dir {
         collect_js_in(path, js_paths)
       } else if entry.name.has_suffix(".js") {
*** Update File: <WORKDIR>/warren/new_project.mbt
@@
   relative_path : String,
   content : String,
 ) -> Unit {
-  let path = Path::join(root, relative_path).to_string()
+  let path = PathRenamed::join(root, relative_path).to_string()
-  let parent = Path::dirname(path).to_string()
+  let parent = PathRenamed::dirname(path).to_string()
   if parent != "" && parent != "." && !@fs.exists(parent) {
     @fs.mkdir(parent, permission=0o755, recursive=true)
   }
@@
       let path = if parent == "" {
         name
       } else {
-        Path::join(parent, name).to_string()
+        PathRenamed::join(parent, name).to_string()
       }
       write_new_project_file(
         root,
@@
       } else if parent == "" {
         name
       } else {
-        Path::join(parent, name).to_string()
+        PathRenamed::join(parent, name).to_string()
       }
       for child in children {
         write_template_entry(root, dir, child, project_name)
@@
 
 ///|
 async fn new_project(dir : String, template_name : String) -> Unit {
-  let target_dir = Path::resolve(dir).to_string()
+  let target_dir = PathRenamed::resolve(dir).to_string()
-  let project_name = Path::basename(target_dir).to_owned()
+  let project_name = PathRenamed::basename(target_dir).to_owned()
   let template_dir = match template_name {
     "default" => default_template_dir
     "minimized" => minimized_template_dir
*** End Patch

```

```mooncram
$ run_moon_ide moon ide rename 'build_entry_script' 'build_entry_script_renamed' --loc 'warren/build.mbt:2:5'
*** Begin Patch
*** Update File: <WORKDIR>/warren/build.mbt
@@
 ///|
-let build_entry_script =
+let build_entry_script_renamed =
   #|    <script src="./index.js" type="module"></script>
 
 ///|
@@
 ///|
 fn inject_build_entry_script(html : String) -> String {
   guard !has_build_entry_script(html) else { html }
-  let patch = build_entry_script + "\n"
+  let patch = build_entry_script_renamed + "\n"
   match html.rev_find("</head>") {
     Some(index) => html[:index].to_owned() + patch + html[index:].to_owned()
     None =>
@@
     $|    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     $|    <title>warren build</title>
     $|\{stylesheet}
-    $|\{build_entry_script}
+    $|\{build_entry_script_renamed}
     $|</head>
     $|<body>
     $|    <div id="app"></div>
*** End Patch

```

```mooncram
$ run_moon_ide moon ide rename 'source_path_to_string' 'source_path_to_string_renamed' --loc 'warren/build.mbt:6:4'
*** Begin Patch
*** Update File: <WORKDIR>/warren/build.mbt
@@
   #|    <script src="./index.js" type="module"></script>
 
 ///|
-fn source_path_to_string(path : SourcePath) -> String {
+fn source_path_to_string_renamed(path : SourcePath) -> String {
   "\{path}"
 }
 
@@
 
 ///|
 async fn ensure_clean_dir(path : SourcePath) -> Unit {
-  let path_str = source_path_to_string(path)
+  let path_str = source_path_to_string_renamed(path)
   if @fs.exists(path_str) {
     match @fs.kind(path_str) {
       Directory => @fs.rmdir(path_str, recursive=true)
@@
 
 ///|
 async fn copy_dir_contents(src : SourcePath, dst : SourcePath) -> Unit {
-  for entry in @fs.readdir(source_path_to_string(src), sort=true) {
+  for entry in @fs.readdir(source_path_to_string_renamed(src), sort=true) {
     copy(src=src.join(entry), dst=dst.join(entry))
   }
 }
@@
 ) -> Unit {
   let args = [
     "build",
-    source_path_to_string(main_pkg_dir),
+    source_path_to_string_renamed(main_pkg_dir),
     "--target",
     "js",
     "--release",
     "--target-dir",
-    source_path_to_string(target_dir),
+    source_path_to_string_renamed(target_dir),
   ]
   let command = args.join(" ")
   log("build", "Running `moon \{command}`")
@@
   label : String,
 ) -> Bool {
   log("build", "Minifying JS with \{label}")
-  try @process.run(cmd, args, cwd=source_path_to_string(cwd)) catch {
+  try @process.run(cmd, args, cwd=source_path_to_string_renamed(cwd)) catch {
     err => {
       log("warn", "\{label} failed: \{err}. Falling back to release JS")
       false
@@
 ///|
 async fn write_index_html(dist_dir : SourcePath) -> Unit {
   let index_path = dist_dir.join("index.html")
-  let index_str = source_path_to_string(index_path)
+  let index_str = source_path_to_string_renamed(index_path)
   if @fs.exists(index_str) {
     let html = @fs.read_file(index_str).text()
     @fs.write_file(
@@
     )
   } else {
     let has_stylesheet = @fs.exists(
-      source_path_to_string(dist_dir.join("styles.css")),
+      source_path_to_string_renamed(dist_dir.join("styles.css")),
     )
     @fs.write_file(
       index_str,
@@
   dst : SourcePath,
   mod_root : SourcePath,
 ) -> Unit {
-  let src_str = source_path_to_string(src)
+  let src_str = source_path_to_string_renamed(src)
-  let dst_str = source_path_to_string(dst)
+  let dst_str = source_path_to_string_renamed(dst)
   let terser_args = [
     src_str, "-c", "toplevel=true", "-m", "toplevel=true", "-o", dst_str,
   ]
@@
   main_pkg_dir : SourcePath,
   dist_dir? : SourcePath,
 ) -> Unit {
-  let main_pkg_dir_str = source_path_to_string(main_pkg_dir)
+  let main_pkg_dir_str = source_path_to_string_renamed(main_pkg_dir)
   let mod_root = if Path::basename(main_pkg_dir_str) == "main" {
     SourcePath::new(Path::dirname(main_pkg_dir_str).to_string())
   } else {
@@
 
   run_release_build(main_pkg_dir, target_dir)
   let build_dir = Path::join(
-    source_path_to_string(target_dir),
+    source_path_to_string_renamed(target_dir),
     "js/release/build",
   ).to_string()
   let js_paths = find_js_in(build_dir)
@@
   }
 
   ensure_clean_dir(dist_dir)
-  if @fs.exists(source_path_to_string(public_dir)) {
+  if @fs.exists(source_path_to_string_renamed(public_dir)) {
-    guard @fs.kind(source_path_to_string(public_dir)) is Directory else {
+    guard @fs.kind(source_path_to_string_renamed(public_dir)) is Directory else {
       abort("`public` exists but is not a directory: \{public_dir}")
     }
     copy_dir_contents(public_dir, dist_dir)
*** End Patch

```

```mooncram
$ run_moon_ide moon ide rename 'a' 'a_renamed' --loc 'warren/templates/default/main/main.mbt:2:14'
*** Begin Patch
*** Update File: <WORKDIR>/warren/templates/default/main/main.mbt
@@
 ///|
-using @html {a, button, div, h1, h2, li, text, ul}
+using @html {a_renamed, button, div, h1, h2, li, text, ul}
 
 ///|
 using @rabbita {new, simple_cell}
@@
             ),
             li <| [
               text("Explore "),
-              a(
+              a_renamed(
                 class="inline-link",
                 target=Blank,
                 href="https://github.com/moonbit-community/rabbita",
*** End Patch

```

```mooncram
$ run_moon_ide moon ide rename 'button' 'button_renamed' --loc 'warren/templates/default/main/main.mbt:2:17'
*** Begin Patch
*** Update File: <WORKDIR>/warren/templates/default/main/main.mbt
@@
 ///|
-using @html {a, button, div, h1, h2, li, text, ul}
+using @html {a, button_renamed, div, h1, h2, li, text, ul}
 
 ///|
 using @rabbita {new, simple_cell}
@@
       div(class="app") <| [
         h1(class="title", "Hello Rabbita"),
         div(class="lead", "You built it successfully!"),
-        button(class="click-btn", on_click=emit(Clicked), "You clicked \{count} times"),
+        button_renamed(class="click-btn", on_click=emit(Clicked), "You clicked \{count} times"),
         div(class="next") <| [
           h2(class="next-title", "What's next"),
           ul(class="next-list") <| [
*** End Patch

```

```mooncram
$ run_moon_ide moon ide rename 'new' 'new_renamed' --loc 'warren/templates/minimized/main.mbt:1:18'
*** Begin Patch
*** Update File: <WORKDIR>/warren/templates/minimized/main.mbt
@@
-using @rabbita { new, simple_cell }
+using @rabbita { new_renamed, simple_cell }
 using @html { button, div, h1 }
 
 enum Msg {
@@
       ],
     ],
   )
-  new(app).mount("app")
+  new_renamed(app).mount("app")
 }
*** End Patch

```

```mooncram
$ run_moon_ide moon ide rename 'simple_cell' 'simple_cell_renamed' --loc 'warren/templates/minimized/main.mbt:1:23'
*** Begin Patch
*** Update File: <WORKDIR>/warren/templates/minimized/main.mbt
@@
-using @rabbita { new, simple_cell }
+using @rabbita { new, simple_cell_renamed }
 using @html { button, div, h1 }
 
 enum Msg {
@@
 }
 
 fn main {
-  let app = simple_cell(
+  let app = simple_cell_renamed(
     model=0,
     update=(msg, model) => match msg {
       Inc => model + 1
*** End Patch

```

```mooncram
$ run_moon_ide moon ide rename 'copy' 'copy_renamed' --loc 'warren/utils.mbt:2:14'
*** Begin Patch
*** Update File: <WORKDIR>/warren/build.mbt
@@
 ///|
 async fn copy_dir_contents(src : SourcePath, dst : SourcePath) -> Unit {
   for entry in @fs.readdir(source_path_to_string(src), sort=true) {
-    copy(src=src.join(entry), dst=dst.join(entry))
+    copy_renamed(src=src.join(entry), dst=dst.join(entry))
   }
 }
 
@@
     guard !run_minifier("terser", terser_args, mod_root, "terser") else {
       return
     }
-    copy(src~, dst~)
+    copy_renamed(src~, dst~)
     return
   }
 
@@
     ) else {
       return
     }
-    copy(src~, dst~)
+    copy_renamed(src~, dst~)
     return
   }
 
@@
   log(
     "warn", "terser not found and node/npm unavailable. Using Moon release JS without extra minification.",
   )
-  copy(src~, dst~)
+  copy_renamed(src~, dst~)
 }
 
 ///|
*** Update File: <WORKDIR>/warren/utils.mbt
@@
 ///|
-pub async fn copy(src~ : SourcePath, dst~ : SourcePath) -> Unit {
+pub async fn copy_renamed(src~ : SourcePath, dst~ : SourcePath) -> Unit {
   let src_str = "\{src}"
   let dst_str = "\{dst}"
   guard @fs.exists(src_str) else { fail("Source path does not exist: \{src}") }
@@
   if @fs.kind(src_str) is Directory {
     @fs.mkdir(dst_str, permission=0o755, recursive=true)
     for entry in @fs.readdir(src_str, sort=true) {
-      copy(src=src.join(entry), dst=dst.join(entry))
+      copy_renamed(src=src.join(entry), dst=dst.join(entry))
     }
   } else {
     let parent = @path.Path::dirname(dst_str).to_string()
*** End Patch

```

```mooncram
$ run_moon_ide moon ide rename 'src' 'src_renamed' --loc 'warren/utils.mbt:2:19'
*** Begin Patch
*** Update File: <WORKDIR>/warren/build.mbt
@@
 ///|
 async fn copy_dir_contents(src : SourcePath, dst : SourcePath) -> Unit {
   for entry in @fs.readdir(source_path_to_string(src), sort=true) {
-    copy(src=src.join(entry), dst=dst.join(entry))
+    copy(src_renamed=src.join(entry), dst=dst.join(entry))
   }
 }
 
@@
     guard !run_minifier("terser", terser_args, mod_root, "terser") else {
       return
     }
-    copy(src~, dst~)
+    copy(src_renamed=src, dst~)
     return
   }
 
@@
     ) else {
       return
     }
-    copy(src~, dst~)
+    copy(src_renamed=src, dst~)
     return
   }
 
@@
   log(
     "warn", "terser not found and node/npm unavailable. Using Moon release JS without extra minification.",
   )
-  copy(src~, dst~)
+  copy(src_renamed=src, dst~)
 }
 
 ///|
*** Update File: <WORKDIR>/warren/utils.mbt
@@
 ///|
-pub async fn copy(src~ : SourcePath, dst~ : SourcePath) -> Unit {
+pub async fn copy(src_renamed~ : SourcePath, dst~ : SourcePath) -> Unit {
-  let src_str = "\{src}"
+  let src_str = "\{src_renamed}"
   let dst_str = "\{dst}"
-  guard @fs.exists(src_str) else { fail("Source path does not exist: \{src}") }
+  guard @fs.exists(src_str) else { fail("Source path does not exist: \{src_renamed}") }
   if @fs.kind(src_str) is Directory {
     @fs.mkdir(dst_str, permission=0o755, recursive=true)
     for entry in @fs.readdir(src_str, sort=true) {
-      copy(src=src.join(entry), dst=dst.join(entry))
+      copy(src_renamed=src_renamed.join(entry), dst=dst.join(entry))
     }
   } else {
     let parent = @path.Path::dirname(dst_str).to_string()
*** End Patch

```

```mooncram
$ run_moon_ide moon ide rename 'new_project_name_placeholder' 'new_project_name_placeholder_renamed' --loc 'warren/new_project.mbt:2:5'
*** Begin Patch
*** Update File: <WORKDIR>/warren/new_project.mbt
@@
 ///|
-let new_project_name_placeholder = "__WARREN_PROJECT_NAME__"
+let new_project_name_placeholder_renamed = "__WARREN_PROJECT_NAME__"
 
 ///|
 let default_new_project_template = "default"
@@
 
 ///|
 fn render_new_project_file(content : String, project_name : String) -> String {
-  content.split(new_project_name_placeholder).collect().join(project_name)
+  content.split(new_project_name_placeholder_renamed).collect().join(project_name)
 }
 
 ///|
*** End Patch

```

```mooncram
$ run_moon_ide moon ide rename 'default_new_project_template' 'default_new_project_template_renamed' --loc 'warren/new_project.mbt:5:5'
*** Begin Patch
*** Update File: <WORKDIR>/warren/main.mbt
@@
         Some([dir]) => {
           let template = match submatches.values.get("template") {
             Some([name]) => name
-            _ => default_new_project_template
+            _ => default_new_project_template_renamed
           }
           new_project(dir, template)
         }
*** Update File: <WORKDIR>/warren/new_project.mbt
@@
 let new_project_name_placeholder = "__WARREN_PROJECT_NAME__"
 
 ///|
-let default_new_project_template = "default"
+let default_new_project_template_renamed = "default"
 
 ///|
 enum TemplateEntry {
*** End Patch

```

```mooncram
$ run_moon_ide moon ide rename 'embbed_devtool_js' 'embbed_devtool_js_renamed' --loc 'warren/embbed_devtool.mbt:3:5'
*** Begin Patch
*** Update File: <WORKDIR>/warren/embbed_devtool.mbt
@@
 ///|
 #warnings("-unused_value")
-let embbed_devtool_js : String =
+let embbed_devtool_js_renamed : String =
   #|function t(t){this._0=t}function n(t,n){this._0=t,this._1=n}function e(t,n){this._0=t,this._1=n}function i(t,n,e,i){this._0=t,this._1=n,this._2=e,this._3=i}function o(t){this._0=t}function s(){}t.prototype.$tag=0,n.prototype.$tag=1,e.prototype.$tag=2,i.prototype.$tag=0,o.prototype.$tag=1,s.prototype.$tag=0;const r=new s;function c(){}c.prototype.$tag=1;const a=new c;function u(t){this._0=t}function f(t,n,e,i){this._0=t,this._1=n,this._2=e,this._3=i}function l(t){this._0=t}function d(t){this._0=t}u.prototype.$tag=2,f.prototype.$tag=0,l.prototype.$tag=1,d.prototype.$tag=2;class _ extends Error{}function h(){throw new _}function v(t){this.val=t}function p(t,n){return(t>=n)-(t<=n)}function w(t){this.acc=t}function b(t,n,e){this.str=t,this.start=n,this.end=e}function m(t){this._0=t}function g(t,n,e,i,o,s){this._0=t,this._1=n,this._2=e,this._3=i,this._4=o,this._5=s}function k(t,n){this._0=t,this._1=n}function y(t){this._0=t}function $(t){this._0=t}function x(t){this._0=t}function z(t,n){this.f=t,this.size_hint=n}function I(t,n){this.f=t,this.size_hint=n}function A(t,n){if(n<0||n>=t.length)throw new Error("Index out of bounds")}function B(t){this.val=t}function C(t,n){const e=new Array(t);return e.fill(n),e}m.prototype.$tag=0,g.prototype.$tag=11,k.prototype.$tag=10,y.prototype.$tag=6,$.prototype.$tag=5,x.prototype.$tag=0;const N=(t,n)=>{t.push(n)};function M(t,n){this.f=t,this.size_hint=n}function S(t){this.val=t}function U(t,n,e){this.buf=t,this.start=n,this.end=e}function E(){}E.prototype.$tag=0;const q=new E;function T(t){this._0=t}function K(t,n,e,i,o,s,r){this.entries=t,this.size=n,this.capacity=e,this.capacity_mask=i,this.grow_at=o,this.head=s,this.tail=r}function W(t,n,e,i,o,s,r){this.entries=t,this.size=n,this.capacity=e,this.capacity_mask=i,this.grow_at=o,this.head=s,this.tail=r}function R(t,n,e,i,o,s,r){this.entries=t,this.size=n,this.capacity=e,this.capacity_mask=i,this.grow_at=o,this.head=s,this.tail=r}function L(t,n,e,i,o,s,r){this.entries=t,this.size=n,this.capacity=e,this.capacity_mask=i,this.grow_at=o,this.head=s,this.tail=r}function P(t,n,e,i,o,s){this.prev=t,this.next=n,this.psl=e,this.hash=i,this.key=o,this.value=s}function V(t,n,e,i,o,s){this.prev=t,this.next=n,this.psl=e,this.hash=i,this.key=o,this.value=s}function D(t,n,e,i,o,s){this.prev=t,this.next=n,this.psl=e,this.hash=i,this.key=o,this.value=s}function F(t,n,e,i,o,s){this.prev=t,this.next=n,this.psl=e,this.hash=i,this.key=o,this.value=s}function H(t,n,e,i,o,s){this.prev=t,this.next=n,this.psl=e,this.hash=i,this.key=o,this.value=s}function X(t,n,e,i,o,s){this.prev=t,this.next=n,this.psl=e,this.hash=i,this.key=o,this.value=s}function Y(t,n,e,i,o,s){this.prev=t,this.next=n,this.psl=e,this.hash=i,this.key=o,this.value=s}function j(t,n,e,i,o,s){this.prev=t,this.next=n,this.psl=e,this.hash=i,this.key=o,this.value=s}function O(t,n,e,i,o,s){this.prev=t,this.next=n,this.psl=e,this.hash=i,this.key=o,this.value=s}function G(t,n,e,i,o,s){this.prev=t,this.next=n,this.psl=e,this.hash=i,this.key=o,this.value=s}function J(t){this.val=t}function Q(t){this.val=t}function Z(t){this.val=t}function tt(t){this.val=t}function nt(t,n,e,i,o,s,r){this.entries=t,this.size=n,this.capacity=e,this.capacity_mask=i,this.grow_at=o,this.head=s,this.tail=r}T.prototype.$tag=1;function et(t,n,e){this.buf=t,this.start=n,this.end=e}function it(t,n,e,i,o,s,r){this.entries=t,this.size=n,this.capacity=e,this.capacity_mask=i,this.grow_at=o,this.head=s,this.tail=r}function ot(t,n,e,i,o){this.prev=t,this.next=n,this.psl=e,this.hash=i,this.key=o}function st(t){this._0=t}function rt(t){this._0=t}function ct(t){this._0=t}function at(t){this._0=t}function ut(t){this._0=t}function ft(t){this._0=t}function lt(t){this._0=t}function dt(t){this.val=t}function _t(t){this.val=t}function ht(t){this.val=t}function vt(t,n,e){this.length=t,this.first=n,this.last=e}function pt(t,n,e){this.length=t,this.first=n,this.last=e}function wt(t,n){this.content=t,this.next=n}function bt(t,n){this.content=t,this.next=n}function mt(t,n,e){this.screen=t,this.offset=n,this.client=e}function gt(t,n,e,i,o,s,r,c,a){this.key_value=t,this.code_value=n,this.alt_pressed=e,this.ctrl_pressed=i,this.shift_pressed=o,this.meta_pressed=s,this.composing=r,this.repeated=c,this.location_value=a}function kt(t,n,e){this.scroll_offset=t,this.scroll_width=n,this.scroll_height=e}st.prototype.$tag=0,rt.prototype.$tag=1,ct.prototype.$tag=0,at.prototype.$tag=0,ut.prototype.$tag=0,ft.prototype.$tag=1,lt.prototype.$tag=1;const yt=()=>null,$t=t=>Object.is(t,null);function xt(){}xt.prototype.$tag=0;const zt=new xt;function It(t){this._0=t}It.prototype.$tag=1;const At=t=>t.location.href,Bt=t=>t.innerWidth,Ct=(t,n)=>t.requestAnimationFrame(n),Nt=()=>window,Mt=t=>t.parentNode,St=(t,n,e)=>t.insertBefore(n,e),Ut=t=>t.key,Et=t=>t.code,qt=t=>t.altKey,Tt=t=>t.ctrlKey,Kt=t=>t.shiftKey,Wt=t=>t.metaKey,Rt=t=>t.isComposing,Lt=t=>t.repeat,Pt=t=>t.location,Vt=(t,n,e)=>t.addEventListener(n,e),Dt=(t,n,e)=>t.removeEventListener(n,e),Ft=(t,n,e)=>t.setProperty(n,e),Ht=()=>document,Xt=(t,n)=>t.createComment(n),Yt=t=>t.createDocumentFragment(),jt=(t,n)=>t.getElementById(n);function Ot(t,n,e,i,o,s){this.cell=t,this.inode=n,this.link=e,this.old_childs=i,this.new_childs=o,this.id=s}function Gt(t){this.val=t}function Jt(t,n,e){this.buf=t,this.start=n,this.end=e}function Qt(t){this._0=t}function Zt(t,n,e,i,o){this._0=t,this._1=n,this._2=e,this._3=i,this._4=o}function tn(t,n){this._0=t,this._1=n}function nn(t,n,e){this._0=t,this._1=n,this._2=e}function en(t,n,e){this._0=t,this._1=n,this._2=e}function on(t,n,e){this.buf=t,this.start=n,this.end=e}function sn(t){this._0=t}function rn(t){this._0=t}function cn(t,n,e){this.buf=t,this.start=n,this.end=e}function an(t,n,e){this.buf=t,this.start=n,this.end=e}function un(t,n,e,i,o){this.slots=t,this.handlers=n,this.attrs=e,this.props=i,this.styles=o}function fn(t,n,e){this.buf=t,this.start=n,this.end=e}function ln(t,n,e){this.buf=t,this.start=n,this.end=e}function dn(t,n,e){this.buf=t,this.start=n,this.end=e}function _n(t){this._0=t}function hn(t){this.val=t}function vn(t,n,e){this.buf=t,this.start=n,this.end=e}function pn(t,n,e){this.buf=t,this.start=n,this.end=e}function wn(t,n){this.url_request=t,this.url_changed=n}function bn(t,n,e){this.buf=t,this.start=n,this.end=e}function mn(t,n,e,i,o,s,r,c,a,u){this.live_map=t,this.msg_queue=n,this.after_render_queue=e,this.drain_scheduled=i,this.dirty_set=o,this.paint_scheduled=s,this.root=r,this.captured_link_listener=c,this.mount=a,this.hooks=u}function gn(t,n,e,i){this.id=t,this.is_root=n,this.dirty=e,this.attach_count=i}function kn(t,n){this.x=t,this.y=n}function yn(t){this._0=t}function $n(t,n,e){this.buf=t,this.start=n,this.end=e}function xn(t){this._0=t}function zn(t,n,e,i,o,s){this.protocol=t,this.host=n,this.port=e,this.path=i,this.query=o,this.fragment=s}function In(){}Qt.prototype.$tag=1,Zt.prototype.$tag=0,tn.prototype.$tag=1,nn.prototype.$tag=2,en.prototype.$tag=3,sn.prototype.$tag=0,rn.prototype.$tag=1,_n.prototype.$tag=0,yn.prototype.$tag=0,xn.prototype.$tag=1,In.prototype.$tag=0;const An=new In;function Bn(t){this._0=t}function Cn(t,n){this.unload=t,this.update_tagger=n}function Nn(t){this.val=t}function Mn(t){this.val=t}function Sn(t){this.val=t}function Un(t,n){this.width=t,this.height=n}function En(t){this.val=t}function qn(t){this.val=t}function Tn(t){this.val=t}function Kn(t){this._0=t}function Wn(t){this._0=t}function Rn(t){this.val=t}function Ln(t,n,e){this.buf=t,this.start=n,this.end=e}function Pn(t,n){this.sandbox=t,this.init_cmd=n}function Vn(t,n,e){this.buf=t,this.start=n,this.end=e}function Dn(t,n,e){this.buf=t,this.start=n,this.end=e}function Fn(t,n,e,i,o,s,r,c,a){this.has_init=t,this.model=n,this.emit=e,this.inbox=i,this.update=o,this.view=s,this.subscriptions=r,this.sub_map=c,this.flags=a}function Hn(t){this.val=t}function Xn(t){this.val=t}function Yn(t){this.val=t}function jn(t,n,e){this.code=t,this.reason=n,this.clean=e}function On(t,n,e,i,o,s,r,c,a,u,f){this.pinned=t,this.hovered=n,this.tab_left=e,this.viewport_width=i,this.reload_nonce=o,this.drag=s,this.auto_open=r,this.listening=c,this.reconnecting=a,this.status=u,this.build_diagnostics=f}function Gn(t,n,e){this.start_x=t,this.start_left=n,this.moved=e}function Jn(){}Bn.prototype.$tag=1,Kn.prototype.$tag=0,Wn.prototype.$tag=1,Jn.prototype.$tag=0;const Qn=new Jn;function Zn(){}Zn.prototype.$tag=1;const te=new Zn;function ne(){}ne.prototype.$tag=2;const ee=new ne;function ie(t){this._0=t}function oe(t){this._0=t}function se(){}ie.prototype.$tag=3,oe.prototype.$tag=4,se.prototype.$tag=5;const re=new se;function ce(t){this._0=t}function ae(){}ce.prototype.$tag=6,ae.prototype.$tag=7;const ue=new ae;function fe(t){this._0=t}function le(){}fe.prototype.$tag=8,le.prototype.$tag=9;const de=new le;function _e(){}_e.prototype.$tag=10;const he=new _e;function ve(){}ve.prototype.$tag=11;const pe=new ve;function we(){}we.prototype.$tag=12;const be=new we;function me(){}me.prototype.$tag=0;const ge=new me;const ke={method_0:function(t,n){if(t.has_init)return;{t.has_init=!0;const e=t.subscriptions;if(void 0===e)return;{const i=Oo(qc(e(t.emit,t.model.val),Ce,!t.flags.is_root));for(;;){const e=ts(i);if(void 0===e)return;{const i=e,o=i._0,s=i._1,r=s._0,c=(0,s._1)(r,n);if(void 0===c);else{const n=c;_o(t.sub_map,o,n)}continue}}}}},method_1:function(t,n){const e=Ss(t.inbox);if(void 0===e)return;{const i=e,o=(0,t.update)(t.emit,i,t.model.val),s=o._0,r=o._1,c=t.subscriptions;if(void 0===c);else{const e=qc(c(t.emit,r),Ce,!t.flags.is_root),i=t.sub_map;t.sub_map=function(t,n,e){const i=[],o=$o(new Vn(i,0,0),void 0),s=Oo(t);for(;;){const t=ts(s);if(void 0===t)break;{const i=t,s=i._0,r=i._1;if(Ko(n,s))_o(o,s,r);else{(0,r.unload)(e)}continue}}const r=Oo(n);for(;;){const n=ts(r);if(void 0===n)break;{const i=n,s=i._0,r=i._1,c=r._0,a=r._1;if(!Wo(t,s)){const t=a(c,e);if(void 0===t);else{_o(o,s,t)}}continue}}return o}(i,e,n)}return t.model.val=r,n.method_table.method_3(n.self,s),void(t.flags.dirty=!0)}},method_2:function(t){return(0,t.view)(t.emit,t.model.val)},method_3:function(t){return t.flags}},ye={method_0:Gr,method_1:Jr,method_2:Qr,method_3:Ys,method_4:function(t){return t.hooks}},$e={method_0:si,method_1:function(t,n,e,i){Bi(t,wi(n,e,e+i|0))},method_2:Bi,method_3:function(t,n){t.val=`${t.val}${String.fromCodePoint(n)}`},method_4:function(t,n){n.method_table.method_0(n.self,{self:t,method_table:$e})}};function xe(t){switch(t.$tag){case 6:return"moonbit-community/rabbita/sub.BuiltinSub.MouseMove";case 7:return"moonbit-community/rabbita/sub.BuiltinSub.Keyup";case 0:return function(t){const n=Oe(0);return function(t,n){const e=t._0;n.method_table.method_0(n.self,"Failure("),i=n,o=e,bi(o,i),n.method_table.method_0(n.self,")");var i,o}(t,{self:n,method_table:$e}),n.val}(t);case 10:return"moonbit-community/rabbita/sub.BuiltinSub.Every";case 4:return"moonbit-community/rabbita/sub.BuiltinSub.UrlChanged";case 1:return"moonbit-community/rabbita/sub.BuiltinSub.VisibilityChange";case 5:return"moonbit-community/rabbita/sub.BuiltinSub.Resize";case 9:return"moonbit-community/rabbita/sub.BuiltinSub.AnimationFrame";case 2:return"moonbit-community/rabbita/sub.BuiltinSub.Scroll";case 11:return"moonbit-community/rabbita/websocket.WebsocketSubscription.Listen";case 8:return"moonbit-community/rabbita/sub.BuiltinSub.Keydown";default:return"moonbit-community/rabbita/sub.BuiltinSub.UrlRequest"}}const ze=0,Ie=0,Ae=0,Be="invalid syntax",Ce=void 0,Ne=new t([]),Me="Invalid protocol",Se="Invalid host",Ue="Invalid fragment",Ee="Invalid host",qe="Invalid host",Te="Invalid query",Ke=new o([]),We=",",Re="build_failed\n",Le=(()=>{if(globalThis.crypto?.getRandomValues){const t=new Uint32Array(1);return globalThis.crypto.getRandomValues(t),0|t[0]}return 0|Math.floor(4294967296*Math.random())})(),Pe=new _t(0);const Ve=new u(""),De=new d([]),Fe=function(t,n){let e,s;if(n.listening){const n=function(){let t;t:{const n=Mc(At(Nt()));let e;if(1!==n.$tag){t=n._0;break t}e=n._0;let i;i=1===e.protocol.$tag?"wss":"ws";const o=e.port;let s;if(void 0===o)s="";else{const t=o,n=Oe(1);si(n,":"),ni(n,t),s=n.val}const r=Oe(19);return ti(r,i),si(r,"://"),ti(r,e.host),ti(r,s),si(r,"/__warren/events"),r.val}return"ws://127.0.0.1:4300/__warren/events"}(),o=t(ue),s=js(t,(t=>new fe(t))),r=js(t,(t=>de));e=function(t,n,e,o,s,r){let c;if(1===n.$tag){c=n._0}else c=[];return function(t,n,e,o,s,r){const c=!(void 0===e),a=!(void 0===o),u=!(void 0===s),f=!(void 0===r);if(c||a||u||f){const l=us(n,new b(We,0,1)),d=Oe(64);si(d,"websocket.listen(url="),ti(d,t),si(d,",protocols=["),ti(d,l),si(d,"],open="),ei(d,c),si(d,",message="),ei(d,a),si(d,",close="),ei(d,u),si(d,",error="),ei(d,f),si(d,")");return new i(d.val,0,new g(t,n,e,o,s,r),Gc)}return Ke}(t,c,e,o,s,r)}(n,ge,o,s,r,t(he))}else e=Ke;if(n.reconnecting){s=function(t,n){const e=Oe(7);si(e,"every("),ni(e,t),si(e,")");const o=e.val,s=0,r=new k(t,n);return new i(o,s,r,Ec)}(1e3,t(pe))}else s=Ke;const r=void 0===n.drag?Ke:function(t){const n="on_mouse_move",e=0,o=new y(t);return new i(n,e,o,Ec)}(js(t,(t=>new oe(t))));return new o([e,s,r,Tc(js(t,(t=>new ce(t))))])};function He(t){h()}function Xe(t){return h()}function Ye(t,n){const e=(t>>>0)+((0|Math.imul(n,-1028477379))>>>0)|0;return 0|Math.imul(e<<17|e>>>15,668265263)}function je(t,n){t.acc=4+(t.acc>>>0)|0,function(t,n){t.acc=Ye(t.acc,n)}(t,n)}function Oe(t){return new v("")}function Ge(t){return li(t,55296)&&fi(t,56319)}function Je(t){return li(t,56320)&&fi(t,57343)}function Qe(t,n){return 65536+(((0|Math.imul(t-55296|0,1024))+n|0)-56320|0)|0}function Ze(t,n){const e=t.charCodeAt(n);if(Ge(e)){return Qe(e,t.charCodeAt(n+1|0))}return e}function ti(t,n){bi(n,{self:t,method_table:$e})}function ni(t,n){!function(t,n){n.method_table.method_0(n.self,function(t){return gi(t,10)}(t))}(n,{self:t,method_table:$e})}function ei(t,n){!function(t,n){n.method_table.method_0(n.self,t?"true":"false")}(n,{self:t,method_table:$e})}function ii(t,n){const e={self:t,method_table:$e};e.method_table.method_2(e.self,n)}function oi(t,n){!function(t,n){n.method_table.method_0(n.self,function(t){return xe(t)}(t))}(n,{self:t,method_table:$e})}function si(t,n){t.val=`${t.val}${n}`}function ri(t,n){os(n,t)}function ci(t,n){os(n,t)}function ai(t,n){return!function(t,n){if(void 0===t)return void 0===n;if(void 0===n)return!1;return t===n}(t,n)}function ui(t,n){return!function(t,n){switch(t.$tag){case 0:{const e=t._0;if(0===n.$tag){return e===n._0}return!1}case 1:{const e=t._0;if(1===n.$tag){return e===n._0}return!1}case 2:{const e=t._0;if(2===n.$tag){return e===n._0}return!1}default:{const e=t._0;if(3===n.$tag){return e===n._0}return!1}}}(t,n)}function fi(t,n){return p(t,n)<=0}function li(t,n){return p(t,n)>=0}function di(t){let n;if(void 0===t)n=Le;else{n=t}return function(t){return new w(374761393+(t>>>0)|0)}(n)}function _i(t){return function(t){let n=t;return n^=n>>>15,n=0|Math.imul(n,-2048144777),n^=n>>>13,n=0|Math.imul(n,-1028477379),n^=n>>>16,n}(t)}function hi(t){return _i(t.acc)}function vi(t){const n=di(void 0);return ri(n,t),hi(n)}function pi(t){const n=di(void 0);return ci(n,t),hi(n)}function wi(t,n,e){const i=t.length;let o;if(void 0===e)o=i;else{o=e<0?i+e|0:e}const s=n<0?i+n|0:n;return s>=0&&s<=o&&o<=i?(s<i&&Je(t.charCodeAt(s))&&h(),o<i&&Je(t.charCodeAt(o))&&h(),new b(t,s,o)):h()}function bi(t,n){n.method_table.method_0(n.self,t)}function mi(t){const n=(0,t.f)(),e=t.size_hint;if(void 0===n)t.size_hint=Ie;else if(void 0===e);else{const n=e;t.size_hint=n>0?n-1|0:ze}return n}function gi(t,n){return((t,n)=>t.toString(n))(t,n)}function ki(t,n){const e=Oe();return function(t,n){const e={self:t,method_table:$e};e.method_table.method_0(e.self,n)}(e,n),si(e," FAILED: "),ii(e,t),new m(new x(e.val))}function yi(t,n){let e;if(void 0===n)e=void 0;else{e=n>0?n:Ae}return new z(t,e)}function $i(t,n,e){let i;if(void 0===e)i=t.end-t.start|0;else{i=e}return n>=0&&n<=i&&i<=(t.end-t.start|0)?new b(t.str,t.start+n|0,t.start+i|0):Xe()}function xi(t){return t.str.substring(t.start,t.end)}function zi(t){const n=t.start,e=t.end,i=new B(n);return function(t,n){let e;e=void 0===n?void 0:n>0?n:0;return new I(t,e)}((()=>{if(i.val<e){const n=t.str.charCodeAt(i.val);if(Ge(n)&&(i.val+1|0)<t.end){const e=t.str.charCodeAt(i.val+1|0);if(Je(e))return i.val=i.val+2|0,Qe(n,e)}return i.val=i.val+1|0,n}return-1}),void 0)}function Ii(t,n,e,i){if(!(e>=0&&e<=i))return h();{let o=e,s=0;for(;;){const e=o,r=s;if(!(e<i&&r<n))return r<n||e>=i?void 0:e;if(Ge(t.charCodeAt(e))){o=e+2|0,s=r+1|0;continue}o=e+1|0,s=r+1|0}}}function Ai(t,n,e,i){let o;if(void 0===i)o=t.length;else{o=i}return n>=0?Ii(t,n,e,o):function(t,n,e,i){let o=i,s=0;for(;;){const i=o,r=s;if(!((i-1|0)>=e&&r<n))return r<n||i<e?void 0:i;Je(t.charCodeAt(i-1|0))?(o=i-2|0,s=r+1|0):(o=i-1|0,s=r+1|0)}}(t,0|-n,e,o)}function Bi(t,n){t.val=`${t.val}${xi(n)}`}function Ci(t,n){return(n.end-n.start|0)<=4?function(t,n){const e=t.end-t.start|0,i=n.end-n.start|0;if(!(i>0))return 0;if(e>=i){const o=0,s=n.str.charCodeAt(n.start+o|0),r=e-i|0;let c=0;for(;;){const e=c;if(!(e<=r))break;{if(t.str.charCodeAt(t.start+e|0)!==s){c=e+1|0;continue}let o=1;for(;;){const s=o;if(!(s<i))return e;{const i=e+s|0;if(t.str.charCodeAt(t.start+i|0)!==n.str.charCodeAt(n.start+s|0))break;o=s+1|0}}c=e+1|0}}}}(t,n):function(t,n){const e=t.end-t.start|0,i=n.end-n.start|0;if(!(i>0))return 0;if(e>=i){const o=C(256,i),s=i-1|0;let r=0;for(;;){const t=r;if(!(t<s))break;{const e=255&n.str.charCodeAt(n.start+t|0);A(o,e),o[e]=(i-1|0)-t|0,r=t+1|0}}let c=0;for(;;){const s=c;if(!(s<=(e-i|0)))break;{const e=i-1|0;let r=0;for(;;){const i=r;if(!(i<=e))return s;{const e=s+i|0;if(t.str.charCodeAt(t.start+e|0)!==n.str.charCodeAt(n.start+i|0))break;r=i+1|0}}const a=(s+i|0)-1|0,u=255&t.str.charCodeAt(t.start+a|0);A(o,u),c=s+o[u]|0}}}}(t,n)}function Ni(t,n){return function(t,n){const e=Ci(t,n);return void 0!==e&&0===e}(new b(t,0,t.length),n)}function Mi(t,n){N(t,n)}function Si(t,n){N(t,n)}function Ui(t,n){return new M((()=>{const e=mi(t);if(void 0!==e){return n(e)}}),t.size_hint)}function Ei(t,n){const e=n.end-n.start|0;if(0===e)return function(t,n){return new z((()=>{const e=function(t){const n=(0,t.f)(),e=t.size_hint;if(-1===n)t.size_hint=0;else if(void 0===e);else{const n=e;t.size_hint=n>0?n-1|0:0}return n}(t);if(-1!==e)return n(e)}),t.size_hint)}(zi(t),(t=>function(t,n,e){let i;i=void 0===e?t.length:e;return n>=0&&n<=i&&i<=t.length?new b(t,n,i):Xe()}(function(t){return String.fromCodePoint(t)}(t),0,void 0)));const i=new S(t);return yi((()=>{const t=i.val;if(void 0!==t){const o=t,s=Ci(o,n);if(void 0===s)return i.val=void 0,o;{const t=s;return i.val=$i(o,t+e|0,void 0),$i(o,0,t)}}}),void 0)}function qi(t){const n=t.size_hint;let e;if(void 0===n)e=[];else{e=[]}for(;;){const n=mi(t);if(void 0===n)break;Si(e,n);continue}return e}function Ti(t){return new b(t,0,t.length)}function Ki(t){const n=new B(0),e=t.end-t.start|0;return yi((()=>{if(n.val<e){const e=t.buf[t.start+n.val|0];return n.val=n.val+1|0,e}}),e)}function Wi(t){return Ki(new U(t,0,t.length))}function Ri(t,n){if(n>=0&&n<(t.end-t.start|0)){const e=t.buf,i=t.start+n|0;return A(e,i),e[i]}{const e=Oe();return si(e,"index out of bounds: the len is from 0 to "),ni(e,t.end-t.start|0),si(e," but the index is "),ni(e,n),Xe(e.val)}}function Li(t,n){if(n>=0&&n<(t.end-t.start|0)){const e=t.buf,i=t.start+n|0;return A(e,i),e[i]}{const e=Oe();return si(e,"index out of bounds: the len is from 0 to "),ni(e,t.end-t.start|0),si(e," but the index is "),ni(e,n),e.val,h()}}function Pi(t){if(0===t.$tag)return h();return t._0}function Vi(t,n){if(0===t.$tag)return n();return t._0}function Di(t){return t>=0?t<=1?1:t>1073741824?1073741824:1+(2147483647>>Math.clz32(t-1|0)-1)|0:h()}function Fi(t){const n=Di(t),e=n-1|0,i=(0|Math.imul(n,13))/16|0;return new K(C(n,void 0),0,n,e,i,undefined,-1)}function Hi(t){let n=Di(t);const e=n;return t>((0|Math.imul(e,13))/16|0)&&(n=0|Math.imul(n,2)),n}function Xi(t,n,e){const i=t.tail;if(-1===i)t.head=e;else{const n=t.entries;A(n,i);const o=n[i];let s;if(void 0===o)s=h();else{s=o}s.next=e}t.tail=n;const o=t.entries;A(o,n),o[n]=e,t.size=t.size+1|0}function Yi(t,n,e){const i=t.tail;if(-1===i)t.head=e;else{const n=t.entries;A(n,i);const o=n[i];let s;if(void 0===o)s=h();else{s=o}s.next=e}t.tail=n;const o=t.entries;A(o,n),o[n]=e,t.size=t.size+1|0}function ji(t,n,e){const i=t.tail;if(-1===i)t.head=e;else{const n=t.entries;A(n,i);const o=n[i];let s;if(void 0===o)s=h();else{s=o}s.next=e}t.tail=n;const o=t.entries;A(o,n),o[n]=e,t.size=t.size+1|0}function Oi(t,n,e){const i=t.tail;if(-1===i)t.head=e;else{const n=t.entries;A(n,i);const o=n[i];let s;if(void 0===o)s=h();else{s=o}s.next=e}t.tail=n;const o=t.entries;A(o,n),o[n]=e,t.size=t.size+1|0}function Gi(t,n,e){const i=t.entries;A(i,e),i[e]=n;const o=n.next;if(void 0===o)t.tail=e;else{o.prev=e}}function Ji(t,n,e){const i=t.entries;A(i,e),i[e]=n;const o=n.next;if(void 0===o)t.tail=e;else{o.prev=e}}function Qi(t,n,e){const i=t.entries;A(i,e),i[e]=n;const o=n.next;if(void 0===o)t.tail=e;else{o.prev=e}}function Zi(t,n,e){const i=t.entries;A(i,e),i[e]=n;const o=n.next;if(void 0===o)t.tail=e;else{o.prev=e}}function to(t,n,e){let i=e.psl+1|0,o=n+1&t.capacity_mask,s=e;for(;;){const n=i,e=o,r=s,c=t.entries;A(c,e);const a=c[e];if(void 0===a)return r.psl=n,void Gi(t,r,e);{const c=a;if(n>c.psl){r.psl=n,Gi(t,r,e),i=c.psl+1|0,o=e+1&t.capacity_mask,s=c;continue}i=n+1|0,o=e+1&t.capacity_mask;continue}}}function no(t,n,e){let i=e.psl+1|0,o=n+1&t.capacity_mask,s=e;for(;;){const n=i,e=o,r=s,c=t.entries;A(c,e);const a=c[e];if(void 0===a)return r.psl=n,void Ji(t,r,e);{const c=a;if(n>c.psl){r.psl=n,Ji(t,r,e),i=c.psl+1|0,o=e+1&t.capacity_mask,s=c;continue}i=n+1|0,o=e+1&t.capacity_mask;continue}}}function eo(t,n,e){let i=e.psl+1|0,o=n+1&t.capacity_mask,s=e;for(;;){const n=i,e=o,r=s,c=t.entries;A(c,e);const a=c[e];if(void 0===a)return r.psl=n,void Qi(t,r,e);{const c=a;if(n>c.psl){r.psl=n,Qi(t,r,e),i=c.psl+1|0,o=e+1&t.capacity_mask,s=c;continue}i=n+1|0,o=e+1&t.capacity_mask;continue}}}function io(t,n,e){let i=e.psl+1|0,o=n+1&t.capacity_mask,s=e;for(;;){const n=i,e=o,r=s,c=t.entries;A(c,e);const a=c[e];if(void 0===a)return r.psl=n,void Zi(t,r,e);{const c=a;if(n>c.psl){r.psl=n,Zi(t,r,e),i=c.psl+1|0,o=e+1&t.capacity_mask,s=c;continue}i=n+1|0,o=e+1&t.capacity_mask;continue}}}function oo(t,n){let e=0,i=n.hash&t.capacity_mask;for(;;){const o=e,s=i,r=t.entries;A(r,s);const c=r[s];if(void 0===c)return n.psl=o,n.prev=t.tail,void Xi(t,s,n);{const r=c;if(o>r.psl)return to(t,s,r),n.psl=o,n.prev=t.tail,void Xi(t,s,n);e=o+1|0,i=s+1&t.capacity_mask;continue}}}function so(t,n){let e=0,i=n.hash&t.capacity_mask;for(;;){const o=e,s=i,r=t.entries;A(r,s);const c=r[s];if(void 0===c)return n.psl=o,n.prev=t.tail,void Yi(t,s,n);{const r=c;if(o>r.psl)return no(t,s,r),n.psl=o,n.prev=t.tail,void Yi(t,s,n);e=o+1|0,i=s+1&t.capacity_mask;continue}}}function ro(t,n){let e=0,i=n.hash&t.capacity_mask;for(;;){const o=e,s=i,r=t.entries;A(r,s);const c=r[s];if(void 0===c)return n.psl=o,n.prev=t.tail,void ji(t,s,n);{const r=c;if(o>r.psl)return eo(t,s,r),n.psl=o,n.prev=t.tail,void ji(t,s,n);e=o+1|0,i=s+1&t.capacity_mask;continue}}}function co(t,n){let e=0,i=n.hash&t.capacity_mask;for(;;){const o=e,s=i,r=t.entries;A(r,s);const c=r[s];if(void 0===c)return n.psl=o,n.prev=t.tail,void Oi(t,s,n);{const r=c;if(o>r.psl)return io(t,s,r),n.psl=o,n.prev=t.tail,void Oi(t,s,n);e=o+1|0,i=s+1&t.capacity_mask;continue}}}function ao(t){const n=t.head,e=t.capacity<<1;t.entries=C(e,void 0),t.capacity=e,t.capacity_mask=e-1|0;const i=t.capacity;t.grow_at=(0|Math.imul(i,13))/16|0,t.size=0,t.head=void 0,t.tail=-1;let o=n;for(;;){if(void 0===o)return;{const n=o,e=n.next;n.next=void 0,oo(t,n),o=e;continue}}}function uo(t){const n=t.head,e=t.capacity<<1;t.entries=C(e,void 0),t.capacity=e,t.capacity_mask=e-1|0;const i=t.capacity;t.grow_at=(0|Math.imul(i,13))/16|0,t.size=0,t.head=void 0,t.tail=-1;let o=n;for(;;){if(void 0===o)return;{const n=o,e=n.next;n.next=void 0,so(t,n),o=e;continue}}}function fo(t){const n=t.head,e=t.capacity<<1;t.entries=C(e,void 0),t.capacity=e,t.capacity_mask=e-1|0;const i=t.capacity;t.grow_at=(0|Math.imul(i,13))/16|0,t.size=0,t.head=void 0,t.tail=-1;let o=n;for(;;){if(void 0===o)return;{const n=o,e=n.next;n.next=void 0,ro(t,n),o=e;continue}}}function lo(t){const n=t.head,e=t.capacity<<1;t.entries=C(e,void 0),t.capacity=e,t.capacity_mask=e-1|0;const i=t.capacity;t.grow_at=(0|Math.imul(i,13))/16|0,t.size=0,t.head=void 0,t.tail=-1;let o=n;for(;;){if(void 0===o)return;{const n=o,e=n.next;n.next=void 0,co(t,n),o=e;continue}}}function _o(t,n,e){!function(t,n,e,i){let o=0,s=i&t.capacity_mask;for(;;){const r=o,c=s,a=t.entries;A(a,c);const u=a[c];if(void 0===u){if(t.size>=t.grow_at){ao(t),o=0,s=i&t.capacity_mask;continue}return void Xi(t,c,new P(t.tail,void 0,r,i,n,e))}{const a=u;if(a.hash===i&&a.key===n)return void(a.value=e);if(r>a.psl){if(t.size>=t.grow_at){ao(t),o=0,s=i&t.capacity_mask;continue}return to(t,c,a),void Xi(t,c,new P(t.tail,void 0,r,i,n,e))}o=r+1|0,s=c+1&t.capacity_mask;continue}}}(t,n,e,is(n))}function ho(t,n,e){!function(t,n,e,i){let o=0,s=i&t.capacity_mask;for(;;){const r=o,c=s,a=t.entries;A(a,c);const u=a[c];if(void 0===u){if(t.size>=t.grow_at){uo(t),o=0,s=i&t.capacity_mask;continue}return void Yi(t,c,new V(t.tail,void 0,r,i,n,e))}{const a=u;let f;if(f=a.hash===i&&a.key===n,f)return void(a.value=e);if(r>a.psl){if(t.size>=t.grow_at){uo(t),o=0,s=i&t.capacity_mask;continue}return no(t,c,a),void Yi(t,c,new V(t.tail,void 0,r,i,n,e))}o=r+1|0,s=c+1&t.capacity_mask;continue}}}(t,n,e,pi(n))}function vo(t,n,e){!function(t,n,e,i){let o=0,s=i&t.capacity_mask;for(;;){const r=o,c=s,a=t.entries;A(a,c);const u=a[c];if(void 0===u){if(t.size>=t.grow_at){ao(t),o=0,s=i&t.capacity_mask;continue}return void Xi(t,c,new D(t.tail,void 0,r,i,n,e))}{const a=u;if(a.hash===i&&a.key===n)return void(a.value=e);if(r>a.psl){if(t.size>=t.grow_at){ao(t),o=0,s=i&t.capacity_mask;continue}return to(t,c,a),void Xi(t,c,new D(t.tail,void 0,r,i,n,e))}o=r+1|0,s=c+1&t.capacity_mask;continue}}}(t,n,e,is(n))}function po(t,n,e){!function(t,n,e,i){let o=0,s=i&t.capacity_mask;for(;;){const r=o,c=s,a=t.entries;A(a,c);const u=a[c];if(void 0===u){if(t.size>=t.grow_at){ao(t),o=0,s=i&t.capacity_mask;continue}return void Xi(t,c,new F(t.tail,void 0,r,i,n,e))}{const a=u;if(a.hash===i&&a.key===n)return void(a.value=e);if(r>a.psl){if(t.size>=t.grow_at){ao(t),o=0,s=i&t.capacity_mask;continue}return to(t,c,a),void Xi(t,c,new F(t.tail,void 0,r,i,n,e))}o=r+1|0,s=c+1&t.capacity_mask;continue}}}(t,n,e,is(n))}function wo(t,n,e){!function(t,n,e,i){let o=0,s=i&t.capacity_mask;for(;;){const r=o,c=s,a=t.entries;A(a,c);const u=a[c];if(void 0===u){if(t.size>=t.grow_at){ao(t),o=0,s=i&t.capacity_mask;continue}return void Xi(t,c,new H(t.tail,void 0,r,i,n,e))}{const a=u;if(a.hash===i&&a.key===n)return void(a.value=e);if(r>a.psl){if(t.size>=t.grow_at){ao(t),o=0,s=i&t.capacity_mask;continue}return to(t,c,a),void Xi(t,c,new H(t.tail,void 0,r,i,n,e))}o=r+1|0,s=c+1&t.capacity_mask;continue}}}(t,n,e,is(n))}function bo(t,n,e){!function(t,n,e,i){let o=0,s=i&t.capacity_mask;for(;;){const r=o,c=s,a=t.entries;A(a,c);const u=a[c];if(void 0===u){if(t.size>=t.grow_at){ao(t),o=0,s=i&t.capacity_mask;continue}return void Xi(t,c,new X(t.tail,void 0,r,i,n,e))}{const a=u;if(a.hash===i&&a.key===n)return void(a.value=e);if(r>a.psl){if(t.size>=t.grow_at){ao(t),o=0,s=i&t.capacity_mask;continue}return to(t,c,a),void Xi(t,c,new X(t.tail,void 0,r,i,n,e))}o=r+1|0,s=c+1&t.capacity_mask;continue}}}(t,n,e,is(n))}function mo(t,n,e){!function(t,n,e,i){let o=0,s=i&t.capacity_mask;for(;;){const r=o,c=s,a=t.entries;A(a,c);const u=a[c];if(void 0===u){if(t.size>=t.grow_at){fo(t),o=0,s=i&t.capacity_mask;continue}return void ji(t,c,new Y(t.tail,void 0,r,i,n,e))}{const a=u;let f;if(f=a.hash===i&&a.key===n,f)return void(a.value=e);if(r>a.psl){if(t.size>=t.grow_at){fo(t),o=0,s=i&t.capacity_mask;continue}return eo(t,c,a),void ji(t,c,new Y(t.tail,void 0,r,i,n,e))}o=r+1|0,s=c+1&t.capacity_mask;continue}}}(t,n,e,vi(n))}function go(t,n,e){!function(t,n,e,i){let o=0,s=i&t.capacity_mask;for(;;){const r=o,c=s,a=t.entries;A(a,c);const u=a[c];if(void 0===u){if(t.size>=t.grow_at){lo(t),o=0,s=i&t.capacity_mask;continue}return void Oi(t,c,new j(t.tail,void 0,r,i,n,e))}{const a=u;let f;if(f=a.hash===i&&a.key===n,f)return void(a.value=e);if(r>a.psl){if(t.size>=t.grow_at){lo(t),o=0,s=i&t.capacity_mask;continue}return io(t,c,a),void Oi(t,c,new j(t.tail,void 0,r,i,n,e))}o=r+1|0,s=c+1&t.capacity_mask;continue}}}(t,n,e,pi(n))}function ko(t,n,e){!function(t,n,e,i){let o=0,s=i&t.capacity_mask;for(;;){const r=o,c=s,a=t.entries;A(a,c);const u=a[c];if(void 0===u){if(t.size>=t.grow_at){ao(t),o=0,s=i&t.capacity_mask;continue}return void Xi(t,c,new O(t.tail,void 0,r,i,n,e))}{const a=u;if(a.hash===i&&a.key===n)return void(a.value=e);if(r>a.psl){if(t.size>=t.grow_at){ao(t),o=0,s=i&t.capacity_mask;continue}return to(t,c,a),void Xi(t,c,new O(t.tail,void 0,r,i,n,e))}o=r+1|0,s=c+1&t.capacity_mask;continue}}}(t,n,e,is(n))}function yo(t,n,e){!function(t,n,e,i){let o=0,s=i&t.capacity_mask;for(;;){const r=o,c=s,a=t.entries;A(a,c);const u=a[c];if(void 0===u){if(t.size>=t.grow_at){ao(t),o=0,s=i&t.capacity_mask;continue}return void Xi(t,c,new G(t.tail,void 0,r,i,n,e))}{const a=u;if(a.hash===i&&a.key===n)return void(a.value=e);if(r>a.psl){if(t.size>=t.grow_at){ao(t),o=0,s=i&t.capacity_mask;continue}return to(t,c,a),void Xi(t,c,new G(t.tail,void 0,r,i,n,e))}o=r+1|0,s=c+1&t.capacity_mask;continue}}}(t,n,e,is(n))}function $o(t,n){const e=t.end-t.start|0;let i;if(void 0===n)i=0===e?8:Hi(e);else{const t=n,o=Hi(e);i=t>o?t:o}const o=Fi(i),s=t.end-t.start|0;let r=0;for(;;){const n=r;if(!(n<s))break;{const e=t.buf[t.start+n|0];_o(o,e._0,e._1),r=n+1|0}}return o}function xo(t,n){const e=t.end-t.start|0;let i;if(void 0===n)i=0===e?8:Hi(e);else{const t=n,o=Hi(e);i=t>o?t:o}const o=Fi(i),s=t.end-t.start|0;let r=0;for(;;){const n=r;if(!(n<s))break;{const e=t.buf[t.start+n|0];po(o,e._0,e._1),r=n+1|0}}return o}function zo(t,n){const e=t.end-t.start|0;let i;if(void 0===n)i=0===e?8:Hi(e);else{const t=n,o=Hi(e);i=t>o?t:o}const o=Fi(i),s=t.end-t.start|0;let r=0;for(;;){const n=r;if(!(n<s))break;{const e=t.buf[t.start+n|0];wo(o,e._0,e._1),r=n+1|0}}return o}function Io(t,n){const e=t.end-t.start|0;let i;if(void 0===n)i=0===e?8:Hi(e);else{const t=n,o=Hi(e);i=t>o?t:o}const o=Fi(i),s=t.end-t.start|0;let r=0;for(;;){const n=r;if(!(n<s))break;{const e=t.buf[t.start+n|0];bo(o,e._0,e._1),r=n+1|0}}return o}function Ao(t,n){const e=t.end-t.start|0;let i;if(void 0===n)i=0===e?8:Hi(e);else{const t=n,o=Hi(e);i=t>o?t:o}const o=function(t){const n=Di(t),e=n-1|0,i=(0|Math.imul(n,13))/16|0;return new W(C(n,void 0),0,n,e,i,void 0,-1)}(i),s=t.end-t.start|0;let r=0;for(;;){const n=r;if(!(n<s))break;{const e=t.buf[t.start+n|0];ho(o,e._0,e._1),r=n+1|0}}return o}function Bo(t,n){const e=t.end-t.start|0;let i;if(void 0===n)i=0===e?8:Hi(e);else{const t=n,o=Hi(e);i=t>o?t:o}const o=function(t){const n=Di(t),e=n-1|0,i=(0|Math.imul(n,13))/16|0;return new R(C(n,void 0),0,n,e,i,void 0,-1)}(i),s=t.end-t.start|0;let r=0;for(;;){const n=r;if(!(n<s))break;{const e=t.buf[t.start+n|0];mo(o,e._0,e._1),r=n+1|0}}return o}function Co(t,n){const e=t.end-t.start|0;let i;if(void 0===n)i=0===e?8:Hi(e);else{const t=n,o=Hi(e);i=t>o?t:o}const o=function(t){const n=Di(t),e=n-1|0,i=(0|Math.imul(n,13))/16|0;return new L(C(n,void 0),0,n,e,i,void 0,-1)}(i),s=t.end-t.start|0;let r=0;for(;;){const n=r;if(!(n<s))break;{const e=t.buf[t.start+n|0];go(o,e._0,e._1),r=n+1|0}}return o}function No(t,n){const e=t.end-t.start|0;let i;if(void 0===n)i=0===e?8:Hi(e);else{const t=n,o=Hi(e);i=t>o?t:o}const o=Fi(i),s=t.end-t.start|0;let r=0;for(;;){const n=r;if(!(n<s))break;{const e=t.buf[t.start+n|0];ko(o,e._0,e._1),r=n+1|0}}return o}function Mo(t,n){const e=t.end-t.start|0;let i;if(void 0===n)i=0===e?8:Hi(e);else{const t=n,o=Hi(e);i=t>o?t:o}const o=Fi(i),s=t.end-t.start|0;let r=0;for(;;){const n=r;if(!(n<s))break;{const e=t.buf[t.start+n|0];yo(o,e._0,e._1),r=n+1|0}}return o}function So(t,n){const e=vi(n);let i=0,o=e&t.capacity_mask;for(;;){const s=i,r=o,c=t.entries;A(c,r);const a=c[r];if(void 0===a)return;{const c=a;let u;if(c.hash===e){u=c.key===n}else u=!1;if(u)return c.value;if(s>c.psl)return;i=s+1|0,o=r+1&t.capacity_mask;continue}}}function Uo(t,n){const e=is(n);let i=0,o=e&t.capacity_mask;for(;;){const s=i,r=o,c=t.entries;A(c,r);const a=c[r];if(void 0===a)return;{const c=a;if(c.hash===e&&c.key===n)return c.value;if(s>c.psl)return;i=s+1|0,o=r+1&t.capacity_mask;continue}}}function Eo(t,n){const e=is(n);let i=0,o=e&t.capacity_mask;for(;;){const s=i,r=o,c=t.entries;A(c,r);const a=c[r];if(void 0===a)return;{const c=a;if(c.hash===e&&c.key===n)return c.value;if(s>c.psl)return;i=s+1|0,o=r+1&t.capacity_mask;continue}}}function qo(t,n){const e=is(n);let i=0,o=e&t.capacity_mask;for(;;){const s=i,r=o,c=t.entries;A(c,r);const a=c[r];if(void 0===a)return;{const c=a;if(c.hash===e&&c.key===n)return c.value;if(s>c.psl)return;i=s+1|0,o=r+1&t.capacity_mask;continue}}}function To(t,n){const e=is(n);let i=0,o=e&t.capacity_mask;for(;;){const s=i,r=o,c=t.entries;A(c,r);const a=c[r];if(void 0===a)return;{const c=a;if(c.hash===e&&c.key===n)return c.value;if(s>c.psl)return;i=s+1|0,o=r+1&t.capacity_mask;continue}}}function Ko(t,n){const e=is(n);let i=0,o=e&t.capacity_mask;for(;;){const s=i,r=o,c=t.entries;A(c,r);const a=c[r];if(void 0===a)return!1;{const c=a;if(c.hash===e&&c.key===n)return!0;if(s>c.psl)return!1;i=s+1|0,o=r+1&t.capacity_mask;continue}}}function Wo(t,n){const e=is(n);let i=0,o=e&t.capacity_mask;for(;;){const s=i,r=o,c=t.entries;A(c,r);const a=c[r];if(void 0===a)return!1;{const c=a;if(c.hash===e&&c.key===n)return!0;if(s>c.psl)return!1;i=s+1|0,o=r+1&t.capacity_mask;continue}}}function Ro(t,n){const e=is(n);let i=0,o=e&t.capacity_mask;for(;;){const s=i,r=o,c=t.entries;A(c,r);const a=c[r];if(void 0===a)return!1;{const c=a;if(c.hash===e&&c.key===n)return!0;if(s>c.psl)return!1;i=s+1|0,o=r+1&t.capacity_mask;continue}}}function Lo(t,n){const e=is(n);let i=0,o=e&t.capacity_mask;for(;;){const s=i,r=o,c=t.entries;A(c,r);const a=c[r];if(void 0===a)return!1;{const c=a;if(c.hash===e&&c.key===n)return!0;if(s>c.psl)return!1;i=s+1|0,o=r+1&t.capacity_mask;continue}}}function Po(t,n){const e=is(n);let i=0,o=e&t.capacity_mask;for(;;){const s=i,r=o,c=t.entries;A(c,r);const a=c[r];if(void 0===a)return!1;{const c=a;if(c.hash===e&&c.key===n)return!0;if(s>c.psl)return!1;i=s+1|0,o=r+1&t.capacity_mask;continue}}}function Vo(t,n){const e=is(n);let i=0,o=e&t.capacity_mask;for(;;){const s=i,r=o,c=t.entries;A(c,r);const a=c[r];if(void 0===a)return!1;{const c=a;if(c.hash===e&&c.key===n)return!0;if(s>c.psl)return!1;i=s+1|0,o=r+1&t.capacity_mask;continue}}}function Do(t,n){const e=n.prev;if(-1===e)t.head=n.next;else{const i=t.entries;A(i,e);const o=i[e];let s;if(void 0===o)s=h();else{s=o}s.next=n.next}const i=n.next;if(void 0===i)t.tail=n.prev;else{i.prev=n.prev}}function Fo(t,n){const e=n.prev;if(-1===e)t.head=n.next;else{const i=t.entries;A(i,e);const o=i[e];let s;if(void 0===o)s=h();else{s=o}s.next=n.next}const i=n.next;if(void 0===i)t.tail=n.prev;else{i.prev=n.prev}}function Ho(t,n){let e=n;for(;;){const n=e,i=n+1&t.capacity_mask;t:{const o=t.entries;A(o,i);const s=o[i];if(void 0!==s){const o=s;if(0===o.psl)break t;o.psl=o.psl-1|0,Zi(t,o,n),e=i;continue}}const o=t.entries;return A(o,n),void(o[n]=void 0)}}function Xo(t,n){let e=n;for(;;){const n=e,i=n+1&t.capacity_mask;t:{const o=t.entries;A(o,i);const s=o[i];if(void 0!==s){const o=s;if(0===o.psl)break t;o.psl=o.psl-1|0,Qi(t,o,n),e=i;continue}}const o=t.entries;return A(o,n),void(o[n]=void 0)}}function Yo(t,n){!function(t,n,e){let i=0,o=e&t.capacity_mask;for(;;){const s=i,r=o,c=t.entries;A(c,r);const a=c[r];if(void 0===a)return;{const c=a;let u;if(u=c.hash===e&&c.key===n,u)return Do(t,c),Ho(t,r),void(t.size=t.size-1|0);if(s>c.psl)return;i=s+1|0,o=r+1&t.capacity_mask;continue}}}(t,n,pi(n))}function jo(t,n){!function(t,n,e){let i=0,o=e&t.capacity_mask;for(;;){const s=i,r=o,c=t.entries;A(c,r);const a=c[r];if(void 0===a)return;{const c=a;let u;if(u=c.hash===e&&c.key===n,u)return Fo(t,c),Xo(t,r),void(t.size=t.size-1|0);if(s>c.psl)return;i=s+1|0,o=r+1&t.capacity_mask;continue}}}(t,n,vi(n))}function Oo(t){return function(t){const n=new J(t.head),e=t.size,i=new B(e);return yi((()=>{t:if(i.val>0){const t=n.val;if(void 0===t)break t;{const e=t,o=e.key,s=e.value,r=e.next;return n.val=r,i.val=i.val-1|0,{_0:o,_1:s}}}}),e)}(t)}function Go(t){return function(t){const n=new Q(t.head),e=t.size,i=new B(e);return yi((()=>{t:if(i.val>0){const t=n.val;if(void 0===t)break t;{const e=t,o=e.key,s=e.value,r=e.next;return n.val=r,i.val=i.val-1|0,{_0:o,_1:s}}}}),e)}(t)}function Jo(t){return function(t){const n=new Z(t.head),e=t.size,i=new B(e);return yi((()=>{t:if(i.val>0){const t=n.val;if(void 0===t)break t;{const e=t,o=e.key,s=e.value,r=e.next;return n.val=r,i.val=i.val-1|0,{_0:o,_1:s}}}}),e)}(t)}function Qo(t){const n=new tt(t.head),e=t.size,i=new B(e);return yi((()=>{t:if(i.val>0){const t=n.val;if(void 0===t)break t;{const e=t,o=e.value,s=e.next;return n.val=s,i.val=i.val-1|0,o}}}),e)}function Zo(t,n){const e=Oe(),i=mi(t);if(void 0===i);else{for(Bi(e,Ti(i));;){const i=mi(t);if(void 0===i)break;{const t=i;Bi(e,n),Bi(e,Ti(t));continue}}}return e.val}function ts(t){return mi(t)}function ns(t){return mi(t)}function es(t){return mi(t)}function is(t){let n=374761393+(Le>>>0)|0;const e=t.length;let i=0;for(;;){const o=i;if(!(o<e))break;n=4+(n>>>0)|0;n=Ye(n,t.charCodeAt(o)),i=o+1|0}return _i(n)}function os(t,n){!function(t,n){je(t,n)}(n,t)}function ss(t){return t!=t?0:t>=2147483647?2147483647:t<=-2147483648?-2147483648:0|t}function rs(t){if(0!==t.length){const n=function(t){return t.pop()}(t);return n}}function cs(t,n){const e=t.length;return n>=0&&n<e?(A(t,n),t[n]):h()}function as(t,n){const e=n.size_hint;if(void 0===e);else{t.length}for(;;){const e=mi(n);if(void 0===e)return;Si(t,e);continue}}function us(t,n){return function(t,n){if(t.end-t.start|0){const e=t.buf[t.start],i=t.buf,o=1+t.start|0,s=t.end,r=Ti(e),c=s-o|0;let a,u=0,f=r.end-r.start|0;for(;;){const t=u,e=f;if(!(t<c)){a=e;break}{u=t+1|0;const s=Ti(i[o+t|0]);f=(e+(s.end-s.start|0)|0)+(n.end-n.start|0)|0}}const l=Oe();if(Bi(l,r),n.end-n.start|0){const t=s-o|0;let e=0;for(;;){const s=e;if(!(s<t))break;{const t=Ti(i[o+s|0]);Bi(l,n),Bi(l,t),e=s+1|0}}}else{const t=s-o|0;let n=0;for(;;){const e=n;if(!(e<t))break;Bi(l,Ti(i[o+e|0])),n=e+1|0}}return l.val}return""}(new et(t,0,t.length),n)}function fs(t){let n=Di(t);const e=n;return t>((0|Math.imul(e,13))/16|0)&&(n=0|Math.imul(n,2)),n}function ls(t,n,e){const i=t.tail;if(-1===i)t.head=e;else{const n=t.entries;A(n,i);const o=n[i];let s;if(void 0===o)s=h();else{s=o}s.next=e}t.tail=n;const o=t.entries;A(o,n),o[n]=e,t.size=t.size+1|0}function ds(t,n,e){const i=t.entries;A(i,e),i[e]=n;const o=n.next;if(void 0===o)t.tail=e;else{o.prev=e}}function _s(t,n,e){let i=e.psl+1|0,o=n+1&t.capacity_mask,s=e;for(;;){const n=i,e=o,r=s,c=t.entries;A(c,e);const a=c[e];if(void 0===a)return r.psl=n,void ds(t,r,e);{const c=a;if(n>c.psl){r.psl=n,ds(t,r,e),i=c.psl+1|0,o=e+1&t.capacity_mask,s=c;continue}i=n+1|0,o=e+1&t.capacity_mask;continue}}}function hs(t,n){let e=0,i=n.hash&t.capacity_mask;for(;;){const o=e,s=i,r=t.entries;A(r,s);const c=r[s];if(void 0===c)return n.psl=o,n.prev=t.tail,void ls(t,s,n);{const r=c;if(o>r.psl)return _s(t,s,r),n.psl=o,n.prev=t.tail,void ls(t,s,n);e=o+1|0,i=s+1&t.capacity_mask;continue}}}function vs(t,n,e){let i,o;t.size>=t.grow_at&&function(t){const n=t.head,e=t.capacity<<1;t.entries=C(e,void 0),t.capacity=e,t.capacity_mask=e-1|0;const i=t.capacity;t.grow_at=(0|Math.imul(i,13))/16|0,t.size=0,t.head=void 0,t.tail=-1;let o=n;for(;;){if(void 0===o)return;{const n=o,e=n.next;n.next=void 0,hs(t,n),o=e;continue}}}(t);t:{let s=0,r=e&t.capacity_mask;for(;;){const c=s,a=r,u=t.entries;A(u,a);const f=u[a];if(void 0===f){i=a,o=c;break t}{const u=f;let l;if(u.hash===e){l=u.key===n}else l=!1;if(l)return;if(c>u.psl){_s(t,a,u),i=a,o=c;break t}s=c+1|0,r=a+1&t.capacity_mask;continue}}}ls(t,i,new ot(t.tail,undefined,o,e,n))}function ps(t,n){vs(t,n,vi(n))}function ws(t,n){const e=t.end-t.start|0;let i;if(void 0===n)i=0===e?8:fs(e);else{const t=n,o=fs(e);i=t>o?t:o}const o=function(t){const n=Di(t),e=n-1|0,i=(0|Math.imul(n,13))/16|0;return new it(C(n,void 0),0,n,e,i,void 0,-1)}(i),s=t.end-t.start|0;let r=0;for(;;){const n=r;if(!(n<s))break;ps(o,t.buf[t.start+n|0]),r=n+1|0}return o}function bs(t,n){const e=n.prev;if(-1===e)t.head=n.next;else{const i=t.entries;A(i,e);const o=i[e];let s;if(void 0===o)s=h();else{s=o}s.next=n.next}const i=n.next;if(void 0===i)t.tail=n.prev;else{i.prev=n.prev}}function ms(t,n){let e=n;for(;;){const n=e,i=n+1&t.capacity_mask;t:{const o=t.entries;A(o,i);const s=o[i];if(void 0!==s){const o=s;if(0===o.psl)break t;o.psl=o.psl-1|0,ds(t,o,n),e=i;continue}}const o=t.entries;return A(o,n),void(o[n]=void 0)}}function gs(t,n){const e=vi(n);let i=0,o=e&t.capacity_mask;for(;;){const s=i,r=o,c=t.entries;A(c,r);const a=c[r];if(void 0===a)return;{const c=a;let u;if(c.hash===e){u=c.key===n}else u=!1;if(u)return bs(t,c),ms(t,r),void(t.size=t.size-1|0);if(s>c.psl)return;i=s+1|0,o=r+1&t.capacity_mask;continue}}}function ks(t){!function(t,n,e,i){const o=t.length;if(o>0){if(e>=0&&e<o){let s;return s=void 0===i?o-e|0:i>=e&&i<=o?i-e|0:h(),void t.fill(n,e,e+s)}h()}}(t.entries,void 0,0,void 0),t.size=0,t.head=void 0,t.tail=-1}function ys(t,n){if(0===n){t:{let n;n:{let e;e:{let i;i:{if(!((t.end-t.start|0)>=2))break t;if(48!==t.str.charCodeAt(t.start))break t;switch(t.str.charCodeAt(t.start+1|0)){case 120:i=new b(t.str,t.start+2|0,t.end);break i;case 88:i=new b(t.str,t.start+2|0,t.end);break i;case 111:e=new b(t.str,t.start+2|0,t.end);break e;case 79:e=new b(t.str,t.start+2|0,t.end);break e;case 98:n=new b(t.str,t.start+2|0,t.end);break n;case 66:n=new b(t.str,t.start+2|0,t.end);break n;default:break t}}return new rt({_0:16,_1:i,_2:!0})}return new rt({_0:8,_1:e,_2:!0})}return new rt({_0:2,_1:n,_2:!0})}return new rt({_0:10,_1:t,_2:!1})}t:{let e;n:{let i;e:{let o;i:{if(!((t.end-t.start|0)>=2))break t;if(48!==t.str.charCodeAt(t.start))break t;switch(t.str.charCodeAt(t.start+1|0)){case 120:{const e=new b(t.str,t.start+2|0,t.end);if(16===n){o=e;break i}break t}case 88:{const e=new b(t.str,t.start+2|0,t.end);if(16===n){o=e;break i}break t}case 111:{const e=new b(t.str,t.start+2|0,t.end);if(8===n){i=e;break e}break t}case 79:{const e=new b(t.str,t.start+2|0,t.end);if(8===n){i=e;break e}break t}case 98:{const i=new b(t.str,t.start+2|0,t.end);if(2===n){e=i;break n}break t}case 66:{const i=new b(t.str,t.start+2|0,t.end);if(2===n){e=i;break n}break t}default:break t}}return new rt({_0:16,_1:o,_2:!0})}return new rt({_0:8,_1:i,_2:!0})}return new rt({_0:2,_1:e,_2:!0})}return n>=2&&n<=36?new rt({_0:n,_1:t,_2:!1}):new st(new x("invalid base"))}function $s(){return new ct(new x("value out of range"))}function xs(){return new ct(new x(Be))}function zs(){return new ut(new x(Be))}function Is(t,n){if(function(t,n){return!function(t,n){const e=t.end-t.start|0;if(e===(n.end-n.start|0)){if(t.str===n.str&&t.start===n.start)return!0;let i=0;for(;;){const o=i;if(!(o<e))break;if(t.str.charCodeAt(t.start+o|0)!==n.str.charCodeAt(n.start+o|0))return!1;i=o+1|0}return!0}return!1}(t,n)}(t,new b("",0,0))){let e,i;t:{let n;n:{const o=$i(t,0,void 0);if((o.end-o.start|0)>=1){switch(o.str.charCodeAt(o.start)){case 43:e=!1,i=new b(o.str,o.start+1|0,o.end);break t;case 45:e=!0,i=new b(o.str,o.start+1|0,o.end);break t;default:n=o;break n}}else n=o}e=!1,i=n}const o=ys(i,n);let s;if(1!==o.$tag)return o;s=o._0;const r=s._0,c=s._1,a=s._2,u=function(t,n){if(n){if(10===t)return 17524406870024074036n;if(16===t)return 17870283321406128128n;{const n=BigInt.asUintN(64,BigInt(t));return 0n===n&&h(),BigInt.asUintN(64,BigInt.asIntN(64,9223372036854775808n)/BigInt.asIntN(64,n))}}if(10===t)return 922337203685477581n;if(16===t)return 576460752303423488n;{const n=BigInt.asUintN(64,BigInt(t));return 0n===n&&h(),BigInt.asUintN(64,BigInt.asUintN(64,BigInt.asIntN(64,9223372036854775807n)/BigInt.asIntN(64,n))+1n)}}(r,e);let f;if((c.end-c.start|0)>=1){const t=c.str.charCodeAt(c.start);if(t>=48&&t<=57)f=!0;else if(t>=97&&t<=122)f=!0;else if(t>=65&&t<=90)f=!0;else if((c.end-c.start|0)>=2)if(95===t){const t=c.str.charCodeAt(c.start+1|0);f=t>=48&&t<=57||(t>=97&&t<=122||t>=65&&t<=90)}else f=!1;else f=!1}else f=!1;if(f){let t,n=c,i=0n,o=a;for(;;){const s=n,c=i,a=o;let f,l,d;t:{n:{if(1==(s.end-s.start|0)){if(95!==s.str.charCodeAt(s.start)){const t=Ze(s.str,Ai(s.str,0,s.start,s.end)),n=s.str,e=Ai(s.str,1,s.start,s.end);let i;if(void 0===e)i=s.end;else{i=e}f=c,l=new b(n,i,s.end),d=t;break n}{const t=xs();if(1!==t.$tag)return t;t._0}}else{if(!((s.end-s.start|0)>=1)){t=c;break}if(95!==s.str.charCodeAt(s.start)){const t=Ze(s.str,Ai(s.str,0,s.start,s.end)),n=s.str,e=Ai(s.str,1,s.start,s.end);let i;if(void 0===e)i=s.end;else{i=e}f=c,l=new b(n,i,s.end),d=t;break n}if(!1!==a){n=new b(s.str,s.start+1|0,s.end),o=!1;continue}{const t=xs();if(1!==t.$tag)return t;t._0}}break t}let _;if(d>=48&&d<=57)_=d-48|0;else if(d>=97&&d<=122)_=d+-87|0;else if(d>=65&&d<=90)_=d+-55|0;else{const t=new at(new x(Be));if(1!==t.$tag)return t;_=t._0}if(_<r)if(e)if(BigInt.asIntN(64,f)>=BigInt.asIntN(64,u)){const t=BigInt.asUintN(64,BigInt.asUintN(64,f*BigInt.asUintN(64,BigInt(r)))-BigInt.asUintN(64,BigInt(_)));if(BigInt.asIntN(64,t)<=BigInt.asIntN(64,f)){n=l,i=t,o=!0;continue}{const t=$s();if(1!==t.$tag)return t;t._0}}else{const t=$s();if(1!==t.$tag)return t;t._0}else if(BigInt.asIntN(64,f)<BigInt.asIntN(64,u)){const t=BigInt.asUintN(64,BigInt.asUintN(64,f*BigInt.asUintN(64,BigInt(r)))+BigInt.asUintN(64,BigInt(_)));if(BigInt.asIntN(64,t)>=BigInt.asIntN(64,f)){n=l,i=t,o=!0;continue}{const t=$s();if(1!==t.$tag)return t;t._0}}else{const t=$s();if(1!==t.$tag)return t;t._0}else{const t=xs();if(1!==t.$tag)return t;t._0}}}return new ft(t)}return zs()}return zs()}function As(t){return new dt(t)}function Bs(t){return new ht(t)}function Cs(t){if((t.end-t.start|0)>0){const n=t.end-t.start|0,e=new wt(Ri(t,n-1|0),void 0);let i,o=n-2|0,s=e;for(;;){const n=o,e=s;if(!(n>=0)){i=e;break}o=n-1|0,s=new wt(Ri(t,n),e)}return new vt(n,i,e)}return new vt(0,void 0,void 0)}function Ns(t){if((t.end-t.start|0)>0){const n=t.end-t.start|0,e=new bt(Li(t,n-1|0),void 0);let i,o=n-2|0,s=e;for(;;){const n=o,e=s;if(!(n>=0)){i=e;break}o=n-1|0,s=new bt(Li(t,n),e)}return new pt(n,i,e)}return new pt(0,void 0,void 0)}function Ms(t,n){const e=new wt(n,void 0),i=t.last;if(void 0===i)return t.length=1,t.first=e,void(t.last=e);return i.next=e,t.length=t.length+1|0,void(t.last=e)}function Ss(t){const n=t.first;if(void 0!==n){const e=n,i=e.content,o=e.next;return void 0===o?(function(t){t.length=0,t.first=void 0,t.last=void 0}(t),i):(t.length=t.length-1|0,t.first=o,i)}}function Us(t){const n=t.first;if(void 0!==n){const e=n,i=e.content,o=e.next;return void 0===o?(function(t){t.length=0,t.first=void 0,t.last=void 0}(t),i):(t.length=t.length-1|0,t.first=o,i)}}function Es(){const t=Pe.val;return Pe.val=Pe.val+1|0,t}function qs(t,n,e){return new mt(t,n,e)}function Ts(t,n,e,i,o,s,r,c,a){return new gt(t,n,e,i,o,s,r,c,a)}function Ks(t,n,e){return new kt(t,n,e)}function Ws(t){return t}function Rs(t){return t}function Ls(t){return n=t,Object.is(n,void 0);var n}function Ps(t){return function(t){return $t(t)}(t)&&He(),t}function Vs(t){return function(t){return $t(t)}(t)&&He(),t}function Ds(t){return $t(t)?zt:new It(Ps(t))}function Fs(t){return Vi((e=Ws,void 0===(n=t)?q:new T(e(n))),yt);var n,e}function Hs(t){return Vi(function(t,n){if(1===t.$tag)return new T(n(t._0));return q}(t,Rs),yt)}function Xs(t,n){switch(n.$tag){case 0:{const e=n._0,i=e.length;let o=0;for(;;){const n=o;if(!(n<i))return;Xs(t,e[n]),o=n+1|0}}case 1:{const e=n;return void Gr(t,e._0,e._1)}default:{const e=n;return void Jr(t,e._0,e._1)}}}function Ys(t,n){Xs(t,n),Qr(t)}function js(t,n){return e=>t(n(e))}function Os(t,e){return function(t,e){let i;i=void 0===e?0:e;return new n(i,t)}((n=>{((t,n)=>{setTimeout(t,n)})((()=>{n.method_table.method_3(n.self,t)}),e)}),void 0)}function Gs(t){return t.style}function Js(t){return(t=>t.nextSibling)(t)}function Qs(t){return(t=>t.previousSibling)(t)}function Zs(t){return Mt(t)}function tr(t,n){var e;e=n,t.appendChild(e)}function nr(t,n){var e;e=n,t.removeChild(e)}function er(t,n,e){St(t,n,e)}function ir(t,n,e){St(t,n,e)}function or(t,n){return((t,n)=>t===n)(t,n)}function sr(t){return t.clientX}function rr(t){return t.clientY}function cr(t){return t.offsetX}function ar(t){return t.offsetY}function ur(t){return t.screenX}function fr(t){return t.screenY}function lr(t){return function(t){return $t(t)?void 0:Vs(t)}("string"==typeof(n=t).data?n.data:null);var n}function dr(t){return(t=>t.style)(t)}function _r(t){return(t=>{console.log(t)})(t),h()}function hr(t,n,e){Vt(t,n,e)}function vr(t,n,e){Vt(t,n,e)}function pr(t,n,e){Vt(t,n,e)}function wr(t,n,e){Dt(t,n,e)}function br(t,n,e){Dt(t,n,e)}function mr(t){const n=(t=>1===t.nodeType?t:null)(t);return Ds(n)}function gr(t){const n=(t=>t instanceof HTMLElement?t:null)(t);return Ds(n)}function kr(t){const n=(t=>t instanceof SVGElement?t:null)(t);return Ds(n)}function yr(t){const n=(t=>t instanceof UIEvent?t:null)(t);return Ds(n)}function $r(t){var n;return Ds((n=t)instanceof MouseEvent?n:null)}function xr(t){var n;return Ds((n=t)instanceof KeyboardEvent?n:null)}function zr(t){var n;return Ds((n=t)instanceof CloseEvent?n:null)}function Ir(t){var n;return Ds((n=t)instanceof MessageEvent?n:null)}function Ar(t,n,e){((t,n,e)=>{t.setAttribute(n,e)})(t,n,e)}function Br(t,n,e){((t,n,e)=>{t[n]=e})(t,n,e)}function Cr(t,n){((t,n)=>{delete t[n]})(t,n)}function Nr(t){return t.scrollWidth}function Mr(t){return t.scrollHeight}function Sr(t){return new Ot(t,void 0,new Gt(void 0),Ao(new Jt([],0,0),void 0),Ao(new Jt([],0,0),void 0),Es())}function Ur(t){let n;t:{let e;n:switch(t.$tag){case 0:e=t._4;break n;case 1:e=t._1;break n;case 2:n=t._1;break t;default:n=t._1;break t}return e}return n}function Er(t){let n;t:{let e;n:switch(t.$tag){case 0:e=t._4;break n;case 1:e=t._1;break n;case 2:n=t._2;break t;default:n=t._2;break t}return e}return n}function qr(t){t.val=void 0}function Tr(t,n){const e=[n];for(;;){const n=rs(e);if(void 0===n)return;{const i=n,o=i.cell,s=o.method_table.method_3(o.self);s.attach_count=s.attach_count-1|0;const r=So(t.live_map,s.id);if(void 0===r);else{const n=r._1;Yo(n,i.id),0===n.size&&(jo(t.live_map,s.id),gs(t.dirty_set,s.id))}const c=Jo(i.old_childs);for(;;){const t=es(c);if(void 0===t)break;{const n=t._1.val;if(void 0===n);else{Si(e,n)}continue}}const a=Jo(i.new_childs);for(;;){const t=es(a);if(void 0===t)break;{const n=t._1.val;if(void 0===n);else{Si(e,n)}continue}}continue}}}function Kr(t,n,e){const i=function(t){const n=[t],e=[];for(;;){const t=rs(n);if(void 0===t)break;{const i=t;switch(i.$tag){case 1:break;case 0:{const t=i._2;1===t.$tag?as(n,Qo(t._0)):as(n,Wi(t._0));break}case 2:as(n,Wi(i._0));break;default:Si(e,i._0.link)}continue}}return e}(t),o=i.length;let s,r,c=0;for(;;){const t=c;if(!(t<o))break;{const e=i[t],o=e.val;if(void 0===o);else{Tr(n,o)}qr(e),c=t+1|0}}t:{let n;n:switch(t.$tag){case 0:n=t._4;break n;case 1:n=t._1;break n;case 2:{const n=t,e=n._1;s=n._2,r=e;break t}default:{const n=t,e=n._1;s=n._2,r=e;break t}}return void nr(e,n)}const a=r,u=s;for(;;){const t=Ds(Js(a));if(1!==t.$tag)break;{const n=t._0;if(or(n,u))break;nr(e,n)}}nr(e,a),nr(e,u)}function Wr(t){return Hs(new Qt(t))}function Rr(t,n,e){let i,o;t:{let s;n:switch(t.$tag){case 0:s=t._4;break n;case 1:s=t._1;break n;case 2:{const n=t,e=n._1;i=n._2,o=e;break t}default:{const n=t,e=n._1;i=n._2,o=e;break t}}return void er(n,s,e)}const s=Ds(Zs(o));if(1===s.$tag){const t=s._0,n=Ds(Zs(i));if(1===n.$tag){or(t,n._0)||h()}else h()}else h();const r=o,c=i;let a=e;for(;;){const t=Ds(Qs(c));if(1!==t.$tag)break;{const e=t._0;if(or(e,r))break;er(n,e,a),a=Wr(e)}}er(n,c,e),er(n,r,a)}function Lr(t){switch(t.$tag){case 3:return t._0;case 2:return t._0;case 1:return t._0;default:return t._0}}function Pr(t,n,e,i,o){switch(t.$tag){case 1:{const n=t._0,e=(s=Ht(),r=n,s.createTextNode(r));return er(i,e,o),new tn(n,e)}case 3:{const s=t._0,r=s.method_table.method_3(s.self);0===r.attach_count&&s.method_table.method_0(s.self,{self:n,method_table:ye}),r.attach_count=r.attach_count+1|0;const c=Xt(Ht(),""),a=Xt(Ht(),""),u=Yt(Ht());ir(u,c,null);const f=Sr(s),l=Pr(s.method_table.method_2(s.self),n,f,u,null);f.inode=l;const d=So(n.live_map,r.id);if(void 0===d){mo(n.live_map,r.id,{_0:f.cell,_1:Co(new on([{_0:f.id,_1:f}],0,1),void 0)})}else{go(d._1,f.id,f)}return f.link.val=f,ho(e.new_childs,f.id,f.link),ir(u,a,null),er(i,u,o),new en(f,c,a)}case 2:{const s=t._0,r=Ht(),c=Yt(r),a=Xt(r,"start"),u=Xt(r,"end");tr(c,a);const f=new Array(s.length),l=s.length;let d=0;for(;;){const t=d;if(!(t<l))break;{const i=s[t];f[t]=Pr(i,n,e,c,null),d=t+1|0}}const _=f;return tr(c,u),er(i,c,o),new nn(_,a,u)}default:{const s=t,r=s._0,c=s._1,a=s._2,u=s._3,f="RABBITA_CAPTURED_LINK"===r?"a":r,l=Ht();let d;if(void 0===u)d=((t,n)=>t.createElement(n))(l,f);else{d=function(t,n,e,i,o){let s,r;s=void 0===i?_r:i;r=void 0===o?_r:o;return c=n,a=e,t.createElementNS(c,a);var c,a}(l,u,f,void 0,void 0)}const _=c.slots,v=c.handlers,p=c.attrs,w=c.props,b=c.styles,m=Oo(v);for(;;){const t=ts(m);if(void 0===t)break;{const e=t,i=e._0,o=Bs(e._1);vr(d,i,(t=>{(0,o.val)(t,{self:n,method_table:ye})})),ko(_,i,o);continue}}"RABBITA_CAPTURED_LINK"===r&&vr(d,"click",n.captured_link_listener);const g=Oo(p);for(;;){const t=ts(g);if(void 0===t)break;{const n=t;Ar(d,n._0,n._1);continue}}const k=Oo(w);for(;;){const t=ts(k);if(void 0===t)break;{const n=t;Br(d,n._0,Lr(n._1));continue}}const y=gr(d);let $;if(1===y.$tag){$=dr(y._0)}else{const t=kr(d);if(1===t.$tag){$=Gs(t._0)}else $=h()}const x=Oo(b);for(;;){const t=ts(x);if(void 0===t)break;{const n=t,e=n._0,i=n._1;Ft($,e,i);continue}}const z=d;let I;if(function(t){switch(t){case"area":case"base":case"br":case"col":case"embed":case"hr":case"img":case"input":case"link":case"meta":case"param":case"source":case"track":case"wbr":return!0;default:return!1}}(r))I=new sn([]);else if(0===a.$tag){const t=a._0,i=new Array(t.length),o=t.length;let s=0;for(;;){const r=s;if(!(r<o))break;{const o=t[r];i[r]=Pr(o,n,e,z,null),s=r+1|0}}I=new sn(i)}else{const t=a._0,i=Mo(new cn([],0,0),void 0),o=Oo(t);for(;;){const t=ts(o);if(void 0===t)break;{const o=t;yo(i,o._0,Pr(o._1,n,e,z,null));continue}}I=new rn(i)}return er(i,z,o),new Zt(r,c,I,u,d)}}var s,r}function Vr(t,n,e,i){return new un(No(new an([],0,0),void 0),i,t,n,e)}function Dr(t){const n=xo(new ln([],0,0),void 0),e=Oo(t);for(;;){const t=ts(e);if(void 0===t)break;{const e=t;po(n,e._0,e._1);continue}}return n}function Fr(t){return new un(function(t){const n=No(new an([],0,0),void 0),e=Oo(t);for(;;){const t=ts(e);if(void 0===t)break;{const e=t;ko(n,e._0,e._1);continue}}return n}(t.slots),function(t){const n=Io(new fn([],0,0),void 0),e=Oo(t);for(;;){const t=ts(e);if(void 0===t)break;{const e=t;bo(n,e._0,e._1);continue}}return n}(t.handlers),Dr(t.attrs),function(t){const n=zo(new dn([],0,0),void 0),e=Oo(t);for(;;){const t=ts(e);if(void 0===t)break;{const e=t;wo(n,e._0,e._1);continue}}return n}(t.props),Dr(t.styles))}function Hr(t,n){if(0===t.$tag){const e=t._0,i=new Array(e.length),o=e.length;let s=0;for(;;){const t=s;if(!(t<o))break;{const o=e[t];i[t]=n(o),s=t+1|0}}return new sn(i)}return new rn(function(t,n){const e=t.capacity,i=new nt(C(t.capacity,void 0),t.size,e,t.capacity_mask,t.grow_at,void 0,t.tail);if(0===t.size)return i;const o=t.entries,s=t.tail;A(o,s);const r=o[s];if(void 0===r)return h();{let e,o=r,s=t.tail;for(;;){const r=o,c=s,a=e,u=r.prev,f=r.psl,l=r.hash,d=r.key,_=new G(u,a,f,l,d,n(d,r.value)),v=i.entries;if(A(v,c),v[c]=_,-1===u){i.head=_;break}{const n=t.entries;A(n,u);const i=n[u];o=void 0===i?h():i,s=u,e=_}}return i}}(t._0,((t,e)=>n(e))))}function Xr(t,n,e,i,o,s){t:switch(t.$tag){case 0:{const r=t,c=r._0,a=r._1,u=r._2,f=r._3,l=r._4;if(0===n.$tag){const r=n,d=r._0,_=r._1,v=r._2,p=r._3;if(c!==d||ai(f,p))return Kr(t,e,i),Pr(n,e,s,i,o);!function(t,n,e,i){const o=t.slots,s=Oo(o);for(;;){const t=ts(s);if(void 0===t)break;{const e=t,i=e._0,o=e._1;Ro(n.handlers,i)||(o.val=(t,n)=>{});continue}}const r=Oo(n.handlers);for(;;){const t=ts(r);if(void 0===t)break;{const n=t,s=n._0,r=n._1,c=Uo(o,s);if(void 0===c){const t=Bs(r);vr(i,s,(n=>{(0,t.val)(n,{self:e,method_table:ye})})),ko(o,s,t)}else c.val=r;continue}}n.slots=o;const c=Oo(t.attrs);for(;;){const t=ts(c);if(void 0===t)break;{const e=t._0;Lo(n.attrs,e)||(a=e,i.removeAttribute(a));continue}}var a;const u=Oo(n.attrs);for(;;){const n=ts(u);if(void 0===n)break;{const e=n,o=e._0,s=e._1,r=Eo(t.attrs,o);(void 0===r||r!==s)&&Ar(i,o,s);continue}}const f=Oo(t.props);for(;;){const t=ts(f);if(void 0===t)break;{const e=t._0;Po(n.props,e)||Cr(i,e);continue}}const l=Oo(n.props);for(;;){const n=ts(l);if(void 0===n)break;{const e=n,o=e._0,s=e._1,r=qo(t.props,o);(void 0===r||ui(r,s))&&Br(i,o,Lr(s));continue}}const d=gr(i);let _;if(1===d.$tag)_=dr(d._0);else{const t=kr(i);_=1===t.$tag?Gs(t._0):h()}const v=Oo(t.styles);for(;;){const t=ts(v);if(void 0===t)break;{const e=t._0;Lo(n.styles,e)||(p=e,_.removeProperty(p));continue}}var p;const w=Oo(n.styles);for(;;){const n=ts(w);if(void 0===n)return;{const e=n,i=e._0,o=e._1,s=Eo(t.styles,i);(void 0===s||s!==o)&&Ft(_,i,o);continue}}}(a,_,e,l);return new Zt(d,_,Yr(u,v,e,l,null,s),p,l)}break t}case 1:{const e=t,i=e._0,o=e._1;if(1===n.$tag){const t=n._0;return i!==t&&(r=o,c=Fs(t),((t,n)=>{t.nodeValue=n})(r,c)),new tn(t,o)}break t}case 2:{const o=t,r=o._0,c=o._1,a=o._2;if(2===n.$tag){const t=n._0,o=Yr(new sn(r),new _n(t),e,i,Wr(a),s);if(0===o.$tag){return new nn(o._0,c,a)}return h()}break t}default:{const r=t._0;if(3===n.$tag){const c=n._0,a=r.cell;return function(t,n){return!(t===n)}(a.method_table.method_3(a.self).id,c.method_table.method_3(c.self).id)?(Kr(t,e,i),Pr(n,e,s,i,o)):t}break t}}var r,c;return Kr(t,e,i),Pr(n,e,s,i,o)}function Yr(t,n,e,i,o,s){if(0===t.$tag){const r=t._0;if(0===n.$tag){const t=n._0,c=r.length,a=t.length;let u=o;const f=[];let l;if(c>a){let t=c-1|0;for(;;){const n=t;if(!(n>=a))break;Kr(cs(r,n),e,i),t=n-1|0}l=a}else{let n=a-1|0;for(;;){const o=n;if(!(o>=c))break;{const r=Pr(cs(t,o),e,s,i,u);Si(f,r),u=Wr(Ur(r)),n=o-1|0}}l=c}let d=l-1|0;for(;;){const n=d;if(!(n>=0))break;{const o=Xr(cs(r,n),cs(t,n),e,i,u,s);Si(f,o),u=Wr(Ur(o)),d=n-1|0}}return new sn(function(t){const n=t.length,e=new Array(n);let i=0;for(;;){const o=i;if(!(o<n))break;e[o]=t[(n-o|0)-1|0],i=o+1|0}return e}(f))}}else{const o=t._0;if(1===n.$tag){const t=n._0,r=Oo(o);for(;;){const n=ts(r);if(void 0===n)break;{const o=n,s=o._0,r=o._1;Vo(t,s)||Kr(r,e,i);continue}}const c=function(t){const n=new Array(t.size);let e=0,i=t.head;for(;;){const t=i;if(void 0===t)break;{const o=t,s=o.key,r=o.value,c=o.next;n[e]={_0:s,_1:r},e=e+1|0,i=c;continue}}return n}(t);let a=null;const u=[];let f=c.length-1|0;for(;;){const t=f;if(!(t>=0))break;{const n=cs(c,t),r=n._0,l=n._1,d=To(o,r);let _;if(void 0===d)_=Pr(l,e,s,i,a);else{const t=Xr(d,l,e,i,a,s);Rr(t,i,a),_=t}Si(u,{_0:r,_1:_}),a=Wr(Ur(_)),f=t-1|0}}return new rn(Mo(new cn(u,0,u.length),void 0))}}if(1===t.$tag){let n=t._0.head;for(;;){const t=n;if(void 0===t)break;{const o=t,s=o.value,r=o.next;Kr(s,e,i),n=r;continue}}}else{const n=t._0,o=n.length;let s=0;for(;;){const t=s;if(!(t<o))break;Kr(n[t],e,i),s=t+1|0}}return Hr(n,(t=>Pr(t,e,s,i,null)))}function jr(t){const n=Sr(t),e=new hn(void 0),i=n.cell,o=Bo(new vn([{_0:i.method_table.method_3(i.self).id,_1:{_0:n.cell,_1:Co(new on([{_0:n.id,_1:n}],0,1),void 0)}}],0,1),void 0),s=Ns(new pn([],0,0)),r=ws(new pn([],0,0),void 0),c=new wn(void 0,void 0),a=Cs(new bn([],0,0));e.val=new mn(o,s,a,!1,r,!1,n,(t=>{const n=$r(t);if(1===n.$tag){const o=n._0,s=e.val;if(void 0===s)return;{const n=s,e=n.hooks.url_request;if(void 0===e)return;{const s=e;if(o.metaKey||function(t){return t.ctrlKey}(o))return;{!function(t){t.preventDefault()}(t);const e=(i=function(t,n){return((t,n)=>t[n])(t,n)}(Pi(mr(Ps(function(t){return t.currentTarget}(t)))),"href"),Ls(i)&&He(),i);return void s({self:n,method_table:ye},e)}}}}var i}),"",c);const u=e.val;if(void 0===u)return h();return u}function Or(t){return t.paint_scheduled?void 0:(t.paint_scheduled=!0,void Ct(Nt(),(n=>{const e=function(t){const n=(t.size,[]);let e=t.head;for(;;){const t=e;if(void 0===t)break;{const i=t,o=i.key,s=i.next;Mi(n,o),e=s;continue}}return n}(t.dirty_set),i=e.length;let o=0;for(;;){const n=o;if(!(n<i))break;{const i=e[n];t:{const n=So(t.live_map,i);if(void 0!==n){const e=n,i=e._0,o=e._1;if(!i.method_table.method_3(i.self).dirty)break t;{const n=i.method_table.method_3(i.self),e=Go(o);for(;;){const n=ns(e);if(void 0===n)break;{const e=n._1,i=e.cell,o=i.method_table.method_2(i.self),s=e.inode;if(void 0===s)h();else{const n=s,i=Er(n),r=Ps(Mt(i)),c=Js(i),a=Xr(n,o,t,r,c,e);e.inode=a;const u=Jo(e.old_childs);for(;;){const t=es(u);if(void 0===t)break;{const n=t,i=n._0,o=n._1;void 0===o.val||ho(e.new_childs,i,o);continue}}e.old_childs=e.new_childs;const f=[];e.new_childs=Ao(new Jt(f,0,0),void 0)}continue}}n.dirty=!1}}}o=n+1|0}}for(ks(t.dirty_set),t.paint_scheduled=!1;;){const n=Ss(t.after_render_queue);if(void 0===n)return;n({self:t,method_table:ye});continue}})))}function Gr(t,n,e){return 0===n?void e({self:t,method_table:ye}):void Ms(t.after_render_queue,e)}function Jr(t,n,e){e(),function(t,n){const e=new bt(n,void 0),i=t.last;void 0===i?(t.length=1,t.first=e,t.last=e):(i.next=e,t.length=t.length+1|0,t.last=e)}(t.msg_queue,n)}function Qr(t){if(!t.drain_scheduled){for(t.drain_scheduled=!0;;){const n=Us(t.msg_queue);if(void 0===n)break;{const e=n,i=So(t.live_map,e);if(void 0===i);else{const n=i._0;n.method_table.method_1(n.self,{self:t,method_table:ye}),ps(t.dirty_set,e)}continue}}return t.drain_scheduled=!1,void Or(t)}}function Zr(){return new gn(Es(),!1,!1,0)}function tc(t,n,e){return po(t.attrs,n,e),t}function nc(t,n){return t.length>0?void tc(n,"style",us(t,new b(";",0,1))):void 0}function ec(t,n){if(void 0===t);else{tc(n,"id",t)}}function ic(t,n){if(void 0===t);else{tc(n,"class",t)}}function oc(t,n,e){return bo(t.handlers,n,e),t}function sc(t,n,e){return oc(t,n,((t,n)=>{n.method_table.method_3(n.self,e(Pi($r(t))))}))}function rc(t,n){if(void 0===t);else{const e=t;sc(n,"click",(t=>e))}}function cc(t){return qs(new kn(ur(t),fr(t)),new kn(cr(t),ar(t)),new kn(sr(t),rr(t)))}function ac(t){return Ts(Ut(t),Et(t),qt(t),Tt(t),Kt(t),Wt(t),Rt(t),Lt(t),Pt(t))}function uc(t,n){if(void 0===t);else{const e=t;sc(n,"mousedown",(t=>e(cc(t))))}}function fc(t,n){if(void 0===t);else{const e=t;sc(n,"mouseup",(t=>e(cc(t))))}}function lc(t,n){var e;if(void 0!==t){const i=t;return e=t=>{const n=Pi(mr(t.target));return i(function(t){return Ks(new kn(ss(t.scrollLeft),ss(function(t){return t.scrollTop}(t))),ss(Nr(t)),ss(Mr(t)))}(n))},void oc(n,"scroll",((t,n)=>{n.method_table.method_3(n.self,e(Pi(yr(t))))}))}}function dc(t,n,e){return oc(t,n,((t,n)=>{n.method_table.method_3(n.self,e(Pi(xr(t))))}))}function _c(t,n){if(void 0===t);else{const e=t;dc(n,"keydown",(t=>e(ac(t))))}}function hc(t,n){if(void 0===t);else{const e=t;dc(n,"keyup",(t=>e(ac(t))))}}function vc(t,n,e){return wo(t.props,n,e),t}function pc(t,n){if(void 0===t);else{tc(n,"title",t)}}function wc(t,n){if(-1===t);else{vc(n,"hidden",new yn(t))}}function bc(t,n,e){const i=n,o=function(t){const n=new Array(t.length),e=t.length;let i=0;for(;;){const o=i;if(!(o<e))break;{const e=t[o];n[o]=e,i=o+1|0}}return new _n(n)}(e);return new f(t,i,o,undefined)}function mc(t,n,e){return new f(t,n,new _n([Cc(e)]),undefined)}function gc(){return Vr(xo(new ln([],0,0),void 0),zo(new dn([],0,0),void 0),xo(new ln([],0,0),void 0),Io(new fn([],0,0),void 0))}function kc(t){if(void 0===t)return gc();return Fr(t)}function yc(t,n,e,i,o,s,r,c,a,u,l,d,_){const h=kc(d);return pc(i,h),wc(o,h),function(t,n){void 0===t||tc(n,"type",t)}(s,h),function(t,n){-1===t||vc(n,"disabled",new yn(t))}(r,h),function(t,n){void 0===t||tc(n,"name",t)}(c,h),function(t,n){void 0===t||tc(n,"value",t)}(a,h),function(t,n){-1===t||vc(n,"autofocus",new yn(t))}(u,h),rc(l,h),nc(t,h),ic(e,h),ec(n,h),function(t,n,e){return new f(t,n,new _n([e]),void 0)}("button",h,_)}function $c(t,n,e,i,o,s,r,c,a,u,f,l,d){let _;if(1===t.$tag){_=t._0}else _=[];return yc(_,n,e,i,o,s,r,c,a,u,f,l,d)}function xc(t,n,e,i,o,s,r,c,a,u,f,l,d){const _=kc(l);return pc(i,_),wc(o,_),rc(s,_),uc(r,_),fc(c,_),lc(a,_),_c(u,_),hc(f,_),nc(t,_),ic(e,_),ec(n,_),bc("div",_,d)}function zc(t,n,e,i,o,s,r,c,a,u,f,l,d){let _;if(1===t.$tag){_=t._0}else _=[];return xc(_,n,e,i,o,s,r,c,a,u,f,l,d)}function Ic(t,n,e,i,o,s,r,c,a,u,f,l,d){let _;if(1===t.$tag){_=t._0}else _=[];return function(t,n,e,i,o,s,r,c,a,u,f,l,d){const _=kc(l);return pc(i,_),wc(o,_),rc(s,_),uc(r,_),fc(c,_),lc(a,_),_c(u,_),hc(f,_),nc(t,_),ic(e,_),ec(n,_),mc("div",_,d)}(_,n,e,i,o,s,r,c,a,u,f,l,d)}function Ac(t,n,e,i,o,s,r){let c;if(1===t.$tag){c=t._0}else c=[];return function(t,n,e,i,o,s,r){const c=kc(s);return pc(i,c),wc(o,c),nc(t,c),ic(e,c),ec(n,c),mc("pre",c,r)}(c,n,e,i,o,s,r)}function Bc(t,n,e,i,o,s,r){let c;if(1===t.$tag){c=t._0}else c=[];return function(t,n,e,i,o,s,r){const c=kc(s);return pc(i,c),wc(o,c),nc(t,c),ic(e,c),ec(n,c),mc("span",c,r)}(c,n,e,i,o,s,r)}function Cc(t){return new l(t)}function Nc(t,n,e,i,o,s,r,c,a,u,f,l,d){const _=kc(d);return wc(i,_),function(t,n){void 0===t||tc(n,"src",t)}(o,_),pc(s,_),function(t,n){void 0===t||tc(n,"width",gi(t,10))}(r,_),function(t,n){void 0===t||tc(n,"height",gi(t,10))}(c,_),function(t,n){void 0===t||tc(n,"loading",t)}(a,_),function(t,n){void 0===t||tc(n,"allow",t)}(u,_),function(t,n){void 0===t||tc(n,"sandbox",t)}(f,_),function(t,n){-1===t||vc(n,"allowfullscreen",new yn(t))}(l,_),nc(t,_),ic(e,_),ec(n,_),bc("iframe",_,[])}function Mc(t){let n,e,i;t:{n:{const c=qi((o=t,s=new b("://",0,3),Ei(new b(o,0,o.length),s)));if(2===c.length){const t=c[0];if(4==(t.end-t.start|0)){if(104!==t.str.charCodeAt(t.start)){e=t,i=c[1];break n}if(116!==t.str.charCodeAt(t.start+1|0)){e=t,i=c[1];break n}if(116!==t.str.charCodeAt(t.start+2|0)){e=t,i=c[1];break n}if(112!==t.str.charCodeAt(t.start+3|0)){e=t,i=c[1];break n}{const t=c[1];n={_0:r,_1:t}}}else{if(5!=(t.end-t.start|0)){e=t,i=c[1];break n}if(104!==t.str.charCodeAt(t.start)){e=t,i=c[1];break n}if(116!==t.str.charCodeAt(t.start+1|0)){e=t,i=c[1];break n}if(116!==t.str.charCodeAt(t.start+2|0)){e=t,i=c[1];break n}if(112!==t.str.charCodeAt(t.start+3|0)){e=t,i=c[1];break n}if(115!==t.str.charCodeAt(t.start+4|0)){e=t,i=c[1];break n}{const t=c[1];n={_0:a,_1:t}}}}else if(1===c.length){const t=c[0];n={_0:Ve,_1:t}}else{const t=ki(new b(Me,0,16),"url/url.mbt:81:10-81:34@moonbit-community/rabbita");if(1!==t.$tag)return t;n=t._0}break t}n={_0:new u(xi(e)),_1:i}}var o,s;const c=n._0,f=qi(Ei(n._1,new b("?",0,1)));let l;if(2===f.length){l={_0:f[0],_1:f[1]}}else if(1===f.length){l={_0:f[0],_1:new b("",0,0)}}else{const t=ki(new b(Se,0,12),"url/url.mbt:86:10-86:30@moonbit-community/rabbita");if(1!==t.$tag)return t;l=t._0}const d=l._0,_=l._1,h=qi(Ei(d,new b("#",0,1)));let v;if(2===h.length){v={_0:h[0],_1:h[1]}}else if(1===h.length){v={_0:h[0],_1:void 0}}else{const t=ki(new b(Ue,0,16),"url/url.mbt:91:10-91:34@moonbit-community/rabbita");if(1!==t.$tag)return t;v=t._0}const p=v._0,w=v._1,m=qi(Ei(p,new b("/",0,1)));let g;if(1===m.length){g={_0:m[0],_1:""}}else if(m.length>=1){g={_0:m[0],_1:Zo(Ui(Ki(new $n(m,1,m.length)),xi),new b("/",0,1))}}else{const t=ki(new b(Ee,0,12),"url/url.mbt:96:10-96:30@moonbit-community/rabbita");if(1!==t.$tag)return t;g=t._0}const k=g._0,y=g._1,$=qi(Ei(k,new b(":",0,1)));let x;if(2===$.length){const t=$[0];let n,e;t:{{const t=xi($[1]),i=function(t,n){const e=Is(t,n);let i;if(1!==e.$tag)return e;if(i=e._0,BigInt.asIntN(64,i)<BigInt.asIntN(64,18446744071562067968n)||BigInt.asIntN(64,i)>BigInt.asIntN(64,2147483647n)){const t=$s();if(1!==t.$tag)return t;t._0}return new lt(0|Number(BigInt.asIntN(32,i)))}(new b(t,0,t.length),0);let o;if(1===i.$tag){o=i._0;n=o;break t}e=i._0}n=void 0}x={_0:xi(t),_1:n}}else if(1===$.length){x={_0:xi($[0]),_1:void 0}}else{const t=ki(new b(qe,0,12),"url/url.mbt:108:10-108:30@moonbit-community/rabbita");if(1!==t.$tag)return t;x=t._0}const z=x._0,I=x._1,A=qi(Ei(_,new b("#",0,1)));let B;if(2===A.length){const t=A[0],n=A[1];B={_0:xi(t),_1:n}}else if(1===A.length){const t=A[0];B=function(t){return!(t.end-t.start|0)}(t)?{_0:void 0,_1:void 0}:{_0:xi(t),_1:void 0}}else if(0===A.length)B={_0:void 0,_1:void 0};else{const t=ki(new b(Te,0,13),"url/url.mbt:119:10-119:31@moonbit-community/rabbita");if(1!==t.$tag)return t;B=t._0}const C=B._0,N=B._1;let M;if(void 0===w)if(void 0===N)M=void 0;else{M=xi(N)}else{const t=w;if(void 0===N)M=xi(t);else{const n=N,e=Oe();ii(e,t),si(e,"#"),ii(e,n),M=e.val}}return new xn(new zn(c,z,I,y,C,M))}function Sc(t){return Ts(Ut(t),Et(t),qt(t),Tt(t),Kt(t),Wt(t),Rt(t),Lt(t),Pt(t))}function Uc(t){const n=t._3,e=t._2,i=t._1,o=t._0;i.val=new Bn(Ct(Nt(),(i=>{if(n.val){const n=e.val;return o.method_table.method_3(o.self,n(i)),void Uc(t)}})))}function Ec(t,n){switch(t.$tag){case 10:{const s=t,r=s._0,c=As(s._1),a=(e=Nt(),i=()=>{n.method_table.method_3(n.self,c.val)},o=r,e.setInterval(i,o)),u=t=>{((t,n)=>{t.clearInterval(n)})(Nt(),a)},f=t=>{if(10!==t.$tag);else{const n=t._1;c.val=n}};return new Cn(u,f)}case 9:{const e=As(t._0),i=new Nn(!0),o=new Mn(An);Uc({_0:n,_1:o,_2:e,_3:i});const s=t=>{i.val=!1;const n=o.val;if(1!==n.$tag);else{const t=n._0;((t,n)=>{t.cancelAnimationFrame(n)})(Nt(),t)}},r=t=>{if(9!==t.$tag);else{const n=t._0;e.val=n}};return new Cn(s,r)}case 8:{const e=As(t._0),i=t=>{const i=e.val;n.method_table.method_3(n.self,i(Sc(Pi(xr(t)))))},o=t=>{wr(Ht(),"keydown",i)},s=t=>{if(8!==t.$tag);else{const n=t._0;e.val=n}};return hr(Ht(),"keydown",i),new Cn(o,s)}case 7:{const e=As(t._0),i=t=>{const i=e.val;n.method_table.method_3(n.self,i(Sc(Pi(xr(t)))))},o=t=>{wr(Ht(),"keyup",i)},s=t=>{if(7!==t.$tag);else{const n=t._0;e.val=n}};return hr(Ht(),"keyup",i),new Cn(o,s)}case 6:{const e=As(t._0),i=t=>{const i=e.val;n.method_table.method_3(n.self,i(function(t){return qs(new kn(ur(t),fr(t)),new kn(cr(t),ar(t)),new kn(sr(t),rr(t)))}(Pi($r(t)))))},o=t=>{wr(Ht(),"mousemove",i)},s=t=>{if(6!==t.$tag);else{const n=t._0;e.val=n}};return hr(Ht(),"mousemove",i),new Cn(o,s)}case 5:{const e=new Sn(t._0),i=t=>{const i=e.val;n.method_table.method_3(n.self,i(new Un(Bt(Nt()),(t=>t.innerHeight)(Nt()))))},o=t=>{wr(Nt(),"resize",i)},s=t=>{if(5!==t.$tag);else{const n=t._0;e.val=n}};return hr(Nt(),"resize",i),new Cn(o,s)}case 2:{const e=new En(t._0),i=t=>{const i=e.val;n.method_table.method_3(n.self,i(function(){const t=Ps((n=Ht(),e="html",n.querySelector(e)));var n,e;return Ks(new kn(Nt().scrollX,Nt().scrollY),ss(Nr(t)),ss(Mr(t)))}()))},o=t=>{wr(Nt(),"scroll",i)},s=t=>{if(2!==t.$tag);else{const n=t._0;e.val=n}};return hr(Nt(),"scroll",i),new Cn(o,s)}case 4:{const e=new qn(t._0);n.method_table.method_4(n.self).url_changed=(t,n)=>{let i;t:{const o=Mc(n);let s;if(1!==o.$tag){i=o._0;break t}s=o._0;const r=e.val;return void t.method_table.method_3(t.self,r(s))}const o=Oe();var s;si(o,"failed to parse "),ti(o,n),si(o,": "),oi(o,i),s=o.val,console.log(s)};const i=t=>{const e=n.method_table.method_4(n.self).url_changed;if(void 0===e);else{e(n,At(Nt()))}},o=t=>{n.method_table.method_4(n.self).url_changed=void 0,wr(Nt(),"popstate",i)},s=t=>{if(4!==t.$tag);else{const n=t._0;e.val=n}};return hr(Nt(),"popstate",i),new Cn(o,s)}case 3:{const e=new Tn(t._0);n.method_table.method_4(n.self).url_request=(t,n)=>{let i,o,s,r;t:{{const t=Mc(At(Nt()));if(1===t.$tag){i=t._0;break t}o=t._0}i=h()}t:{{const t=Mc(n);if(1===t.$tag){s=t._0;break t}r=t._0}s=h()}const c=function(t,n){switch(t.$tag){case 0:return 0===n.$tag;case 1:return 1===n.$tag;default:{const e=t._0;return 2===n.$tag&&e===n._0}}}(i.protocol,s.protocol)&&i.host===s.host&&function(t,n){return void 0===t?void 0===n:void 0!==n&&t===n}(i.port,s.port)?new Kn(s):new Wn(n),a=e.val;t.method_table.method_3(t.self,a(c))};const i=t=>{if(3!==t.$tag);else{const n=t._0;e.val=n}};return new Cn((t=>{n.method_table.method_4(n.self).url_request=void 0}),i)}case 1:{const e=new Rn(t._0),i=t=>{const i=e.val;n.method_table.method_3(n.self,i(Ht().hidden))},o=t=>{wr(Ht(),"visibilitychange",i)},s=t=>{if(1!==t.$tag);else{const n=t._0;e.val=n}};return hr(Ht(),"visibilitychange",i),new Cn(o,s)}default:return}var e,i,o}function qc(t,n,e){const i=function(t,n){const e=t.end-t.start|0;let i;if(void 0===n)i=0===e?8:Hi(e);else{const t=n,o=Hi(e);i=t>o?t:o}const o=Fi(i),s=t.end-t.start|0;let r=0;for(;;){const n=r;if(!(n<s))break;{const e=t.buf[t.start+n|0];vo(o,e._0,e._1),r=n+1|0}}return o}(new Ln([],0,0),void 0),o=t=>{let n,s,r;t:{if(0===t.$tag){const i=t,o=i._0;if(1===i._1){const t=i._2,c=i._3;if(e)return;n=t,s=o,r=c;break t}n=i._2,s=o,r=i._3;break t}{const n=t._0,e=n.length;let i=0;for(;;){const t=i;if(!(t<e))return;{const e=n[t];o(e),i=t+1|0}}}}vo(i,s,{_0:n,_1:r})};return o(t),i}function Tc(t){return new i("on_resize",0,new $(t),Ec)}function Kc(t,n){t.sandbox.mount=n,((t,n)=>{t.innerHTML=n})(Ps(jt(Ht(),n)),"<div></div>");const e=t.init_cmd;if(void 0===e);else{const n=e;Ys(t.sandbox,n),t.init_cmd=void 0}!function(t){const n=t.root,e=Ps(jt(Ht(),t.mount)),i=t.dirty_set,o=n.cell;ps(i,o.method_table.method_3(o.self).id);const s=n.cell;s.method_table.method_0(s.self,{self:t,method_table:ye});const r=t.hooks.url_changed;void 0===r||r({self:t,method_table:ye},At(Nt()));const c=n.cell,a=Pr(c.method_table.method_2(c.self),t,n,e,null);t.root.inode=a}(t.sandbox),Or(t.sandbox)}function Wc(t,n,i,o){const s=Zr(),r=Cs(new Dn([],0,0)),c=function(t,n,i){return t=>new e(n,(()=>{Ms(i,t)}))}(0,s.id,r);return{self:new Fn(!1,Bs(t),c,r,n,i,o,$o(new Vn([],0,0),void 0),s),method_table:ke}}function Rc(t,n,e,i){let o;if(void 0===i)o="http://www.w3.org/2000/svg";else{o=i}return function(t,n,e,i){const o=new Array(e.length),s=e.length;let r=0;for(;;){const t=r;if(!(t<s))break;{const n=e[t];o[t]=n,r=t+1|0}}return new f(t,n,new _n(o),i)}(t,n,e,o)}function Lc(){return Vr(xo(new ln([],0,0),void 0),zo(new dn([],0,0),void 0),xo(new ln([],0,0),void 0),Io(new fn([],0,0),void 0))}function Pc(t){if(void 0===t)return Lc();return t}function Vc(t,n,e){return po(t.attrs,n,e),t}function Dc(t,n,e){if(void 0===n);else{Vc(e,t,n)}}function Fc(t,n){Dc("class",t,n)}function Hc(t,n,e){if(void 0===n);else{Vc(e,t,gi(n,10))}}function Xc(t,n){Dc("id",t,n)}function Yc(t,n){if(1!==t.$tag);else{!function(t,n){po(t.attrs,"style",n)}(n,us(t._0,new b(";",0,1)))}}function jc(t,n,e,i,o,s,r,c,a){const u=Pc(c);return function(t,n){Hc("width",t,n)}(i,u),function(t,n){Hc("height",t,n)}(o,u),function(t,n){Dc("viewBox",t,n)}(s,u),function(t,n){Dc("xmlns",t,n)}(r,u),Xc(t,u),Fc(n,u),Yc(e,u),Rc("svg",u,a,void 0)}function Oc(t,n,e,i,o,s,r,c,a,u){const f=Pc(u);return function(t,n){Dc("d",t,n)}(i,f),function(t,n){Dc("fill",t,n)}(o,f),function(t,n){Dc("stroke",t,n)}(s,f),function(t,n){Hc("stroke-width",t,n)}(r,f),function(t,n){Dc("transform",t,n)}(c,f),function(t,n){Dc("opacity",t,n)}(a,f),Xc(t,f),Fc(n,f),Yc(e,f),Rc("path",f,[],void 0)}function Gc(t,n){if(11===t.$tag){const e=t,i=e._0,o=e._1,s=e._2,r=e._3,c=e._4,a=e._5,u=0===o.length?new WebSocket(i):((t,n)=>new WebSocket(t,n))(i,o),f=new Hn(s),l=new Xn(r),d=new Yn(c),_=new Hn(a),h=t=>{const e=f.val;if(void 0===e);else{const t=e;n.method_table.method_3(n.self,t)}},v=t=>{const e=l.val;if(void 0===e);else{const i=e,o=Ir(t);if(1===o.$tag){const t=lr(o._0);if(void 0===t)return;{const e=t,o=i;return void n.method_table.method_3(n.self,o(e))}}}},p=t=>{const e=d.val;if(void 0===e);else{const i=e,o=zr(t);if(1===o.$tag){const t=o._0,e=new jn(t.code,(t=>t.reason)(t),(t=>t.wasClean)(t)),s=i;return void n.method_table.method_3(n.self,s(e))}}},w=t=>{const e=_.val;if(void 0===e);else{const t=e;n.method_table.method_3(n.self,t)}};return pr(u,"open",h),pr(u,"message",v),pr(u,"close",p),pr(u,"error",w),new Cn((t=>{br(u,"open",h),br(u,"message",v),br(u,"close",p),br(u,"error",w),(t=>{t.close()})(u)}),(t=>{if(11===t.$tag){const n=t,e=n._2,i=n._3,o=n._4,s=n._5;return f.val=e,l.val=i,d.val=o,void(_.val=s)}}))}}function Jc(t,n){const e=(n-(n<=560?84:92)|0)-12|0,i=e<12?12:e;return t<12?12:t>i?i:t}function Qc(t){switch(t){case 0:return"is-ready";case 1:return"is-building";case 2:return"is-reloading";default:return"is-build-failed"}}function Zc(t){switch(t){case 0:return"Ready";case 1:return"Building";case 2:return"Reloading";default:return"Build failed"}}function ta(t){switch(t){case 1:case 2:return!0;default:return!1}}function na(t,n,e){t:switch(n.$tag){case 0:return{_0:Ne,_1:new On(e.pinned,!0,e.tab_left,e.viewport_width,e.reload_nonce,e.drag,e.auto_open,e.listening,e.reconnecting,e.status,e.build_diagnostics)};case 1:return{_0:Ne,_1:new On(e.pinned,!1,e.tab_left,e.viewport_width,e.reload_nonce,e.drag,e.auto_open,e.listening,e.reconnecting,e.status,e.build_diagnostics)};case 2:return{_0:Ne,_1:new On(!e.pinned,!0,e.tab_left,e.viewport_width,e.reload_nonce,e.drag,e.auto_open,e.listening,e.reconnecting,e.status,e.build_diagnostics)};case 3:{const t=n._0.client.x;return{_0:Ne,_1:new On(e.pinned,!0,e.tab_left,e.viewport_width,e.reload_nonce,new Gn(t,e.tab_left,!1),e.auto_open,e.listening,e.reconnecting,e.status,e.build_diagnostics)}}case 4:{const t=n._0,i=e.drag;if(void 0===i)return{_0:Ne,_1:e};{const n=i,o=t.client.x-n.start_x|0,s=n.moved||(o<0?0|-o:o)>3,r=Jc(n.start_left+o|0,e.viewport_width);return{_0:Ne,_1:new On(e.pinned,e.hovered,r,e.viewport_width,e.reload_nonce,new Gn(n.start_x,n.start_left,s),e.auto_open,e.listening,e.reconnecting,e.status,e.build_diagnostics)}}}case 5:return void 0===e.drag?{_0:Ne,_1:e}:{_0:Ne,_1:new On(e.pinned,e.hovered,e.tab_left,e.viewport_width,e.reload_nonce,void 0,e.auto_open,e.listening,e.reconnecting,e.status,e.build_diagnostics)};case 6:{const t=n._0,i=Jc(e.tab_left,t.width);return{_0:Ne,_1:new On(e.pinned,e.hovered,i,t.width,e.reload_nonce,e.drag,e.auto_open,e.listening,e.reconnecting,e.status,e.build_diagnostics)}}case 7:return{_0:Ne,_1:new On(e.pinned,e.hovered,e.tab_left,e.viewport_width,e.reload_nonce,e.drag,e.auto_open,!0,!1,e.status,e.build_diagnostics)};case 8:{const o=n._0;switch(o){case"building":return{_0:Ne,_1:new On(e.pinned,e.hovered,e.tab_left,e.viewport_width,e.reload_nonce,e.drag,!1,e.listening,e.reconnecting,1,"")};case"reload":return{_0:Os(t(be),520),_1:new On(e.pinned,e.hovered,e.tab_left,e.viewport_width,e.reload_nonce+1|0,e.drag,!1,e.listening,e.reconnecting,2,"")};default:{const t="build_failed"===(i=o)?"moon build failed.":Ni(i,new b(Re,0,13))?xi(wi(i,13,void 0)):void 0;if(void 0===t)return{_0:Ne,_1:e};{const n=t;return{_0:Ne,_1:new On(e.pinned,e.hovered,e.tab_left,e.viewport_width,e.reload_nonce,e.drag,!0,e.listening,e.reconnecting,3,n)}}}}}case 9:case 10:break t;case 11:return e.reconnecting?{_0:Ne,_1:new On(e.pinned,e.hovered,e.tab_left,e.viewport_width,e.reload_nonce,e.drag,e.auto_open,!0,!1,e.status,e.build_diagnostics)}:{_0:Ne,_1:e};default:return 2===e.status?{_0:Ne,_1:new On(e.pinned,e.hovered,e.tab_left,e.viewport_width,e.reload_nonce,e.drag,!1,e.listening,e.reconnecting,0,"")}:{_0:Ne,_1:e}}var i;return{_0:Ne,_1:new On(e.pinned,e.hovered,e.tab_left,e.viewport_width,e.reload_nonce,e.drag,e.auto_open,!1,!0,e.status,e.build_diagnostics)}}function ea(t,n){return void 0===n.drag?De:Ic(ge,void 0,"warren-devtool-drag-layer",void 0,-1,void 0,void 0,js(t,(t=>re)),void 0,void 0,void 0,void 0,"")}function ia(){return jc(void 0,"warren-devtool-pin-svg",ge,void 0,void 0,"0 0 24 24",void 0,(t=Lc(),n="none",po(t.attrs,"fill",n),t),[Oc(void 0,void 0,ge,"M16 9V4l1 1V3H7v2l1-1v5l-2 2v2h5v7l1 1 1-1v-7h5v-2l-2-2z","currentColor",void 0,void 0,void 0,void 0,void 0)]);var t,n}function oa(t){return 3===t.status?Ac(ge,void 0,"warren-devtool-diagnostics",void 0,-1,void 0,t.build_diagnostics):De}function sa(t,n){const e=function(t){if(t.pinned)return!0;{let n;if(t.hovered)n=!0;else{let e;e=!!t.auto_open||!(void 0===t.drag),n=e}return n}}(n)?"is-expanded":"is-collapsed",i=n.pinned?"is-pinned":"is-unpinned",o=ta(n.status)?"is-loading":"is-idle",s=Oe();si(s,"warren-devtool "),ti(s,e),si(s," "),ti(s,i),si(s," "),ti(s,Qc(n.status)),si(s," "),ti(s,o);const r=s.val,c=ta(n.status)?"warren-preview-frame is-loading":"warren-preview-frame",a=Oe();si(a,"warren-devtool-status "),ti(a,Qc(n.status));const u=a.val,f=n.pinned?"Drag Warren devtool":"Hover to open Warren devtool",l=n.pinned?"Unpin Warren devtool":"Pin Warren devtool",d=n.pinned?"warren-devtool-pin is-pinned":"warren-devtool-pin",_=(h=gc(),v=n.pinned?"true":"false",tc(h,"aria-pressed",v));var h,v;const p=function(t,n){return sc(t,"mouseleave",n)}(function(t,n){return sc(t,"mouseenter",n)}(gc(),(n=>t(Qn))),(n=>t(te))),w=Oe();si(w,"--warren-devtool-tab-left: "),ni(w,Jc(n.tab_left,n.viewport_width)),si(w,"px");const b=w.val,m=Oe();si(m,"--warren-devtool-tab-width: ");ni(m,n.viewport_width<=560?84:92),si(m,"px");const g=[b,m.val],k=Oe();si(k,"/__warren/preview/index.html?warren_reload="),ni(k,n.reload_nonce);const y=function(t,n,e,i,o,s,r,c,a,u,f,l,d){let _;_=1===t.$tag?t._0:[];return Nc(_,n,e,i,o,s,r,c,a,u,f,l,d)}(ge,void 0,c,-1,k.val,"Warren preview",void 0,void 0,void 0,void 0,void 0,-1,void 0),$=zc(ge,void 0,"warren-devtool-tab",f,-1,void 0,js(t,(t=>new ie(t))),js(t,(t=>re)),void 0,void 0,void 0,void 0,[Bc(ge,void 0,"warren-devtool-tab-indicator",void 0,-1,void 0,""),Bc(ge,void 0,"warren-devtool-tab-label",void 0,-1,void 0,"Warren")]);return xc(g,void 0,r,void 0,-1,void 0,void 0,void 0,void 0,void 0,void 0,void 0,[y,zc(ge,void 0,"warren-devtool-hover-zone",void 0,-1,void 0,void 0,void 0,void 0,void 0,void 0,p,[$,zc(ge,void 0,"warren-devtool-drawer",void 0,-1,void 0,void 0,void 0,void 0,void 0,void 0,void 0,[$c(ge,void 0,d,l,-1,void 0,-1,void 0,void 0,-1,t(ee),_,ia()),zc(ge,void 0,"warren-devtool-body",void 0,-1,void 0,void 0,void 0,void 0,void 0,void 0,void 0,[zc(ge,void 0,u,void 0,-1,void 0,void 0,void 0,void 0,void 0,void 0,void 0,[Bc(ge,void 0,void 0,void 0,-1,void 0,Zc(n.status))]),oa(n)])])]),ea(t,n)])}Kc(function(t){const n=jr(t);return t.method_table.method_3(t.self).is_root=!0,new Pn(n,void 0)}(Wc(function(){const t=Bt(Nt());return new On(!1,!1,Jc(24,t),t,0,void 0,!1,!0,!1,0,"")}(),na,sa,Fe)),"warren-devtool");
 
 ///|
*** Update File: <WORKDIR>/warren/main.mbt
@@
     )
   }
   vfs.mount("/index.html", FileContent(shell_html_template))
-  vfs.mount("/warren_devtool.js", FileContent(embbed_devtool_js))
+  vfs.mount("/warren_devtool.js", FileContent(embbed_devtool_js_renamed))
   vfs.mount("/warren_devtool.css", FileContent(embbed_devtool_css))
 
   @async.with_task_group <| group => {
*** End Patch

```

```mooncram
$ run_moon_ide moon ide rename 'embbed_devtool_css' 'embbed_devtool_css_renamed' --loc 'warren/embbed_devtool.mbt:8:5'
*** Begin Patch
*** Update File: <WORKDIR>/warren/embbed_devtool.mbt
@@
 
 ///|
 #warnings("-unused_value")
-let embbed_devtool_css : String =
+let embbed_devtool_css_renamed : String =
   #|body {
   #|  margin: 0;
   #|  font-family: system-ui, sans-serif;
*** Update File: <WORKDIR>/warren/main.mbt
@@
   }
   vfs.mount("/index.html", FileContent(shell_html_template))
   vfs.mount("/warren_devtool.js", FileContent(embbed_devtool_js))
-  vfs.mount("/warren_devtool.css", FileContent(embbed_devtool_css))
+  vfs.mount("/warren_devtool.css", FileContent(embbed_devtool_css_renamed))
 
   @async.with_task_group <| group => {
     let hub = Devhub(port, vfs)
*** End Patch

```

```mooncram
$ run_moon_ide moon ide rename '_embed_main_mbt' '_embed_main_mbt_renamed' --loc 'warren/templates_bundle.mbt:4:5'
*** Begin Patch
*** Update File: <WORKDIR>/warren/templates_bundle.mbt
@@
 // Generated by moonbit-community/embed from templates.
 
 ///|
-let _embed_main_mbt : String =
+let _embed_main_mbt_renamed : String =
   #|///|
   #|using @html {a, button, div, h1, h2, li, text, ul}
   #|
@@
 pub let templates : TemplatesFixture = {
   default: {
     main: {
-      main_mbt: _embed_main_mbt,
+      main_mbt: _embed_main_mbt_renamed,
       moon_pkg: _embed_moon_pkg,
     },
     public: {
*** End Patch

```

```mooncram
$ run_moon_ide moon ide rename '_embed_moon_pkg' '_embed_moon_pkg_renamed' --loc 'warren/templates_bundle.mbt:55:5'
*** Begin Patch
*** Update File: <WORKDIR>/warren/templates_bundle.mbt
@@
   #|
 
 ///|
-let _embed_moon_pkg : String =
+let _embed_moon_pkg_renamed : String =
   #|import {
   #|  "moonbit-community/rabbita",
   #|  "moonbit-community/rabbita/html",
@@
   default: {
     main: {
       main_mbt: _embed_main_mbt,
-      moon_pkg: _embed_moon_pkg,
+      moon_pkg: _embed_moon_pkg_renamed,
     },
     public: {
       index_html: _embed_index_html,
*** End Patch

```

```mooncram
$ run_moon_ide moon ide rename 'Cast' 'CastRenamed' --loc 'rabbita/js/cast.mbt:7:17'
Error: could not find references for symbol 'Cast' at rabbita/js/cast.mbt:7:17
[1]
```

```mooncram
$ run_moon_ide moon ide rename 'into' 'into_renamed' --loc 'rabbita/js/cast.mbt:8:6'
Error: could not find references for symbol 'into' at rabbita/js/cast.mbt:8:6
[1]
```
