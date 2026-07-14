# rabbita rename Path warren/path/sourcetree_path.mbt:2:15

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
