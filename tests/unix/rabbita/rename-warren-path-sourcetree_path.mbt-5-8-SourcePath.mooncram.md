# rabbita rename SourcePath warren/path/sourcetree_path.mbt:5:8

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
$ run_moon_ide moon ide rename 'SourcePath' 'SourcePathRenamed' --loc 'warren/path/sourcetree_path.mbt:5:8'
*** Begin Patch
*** Update File: <WORKDIR>/warren/build.mbt
@@
 ///|
-using @path {type SourcePath, type Path}
+using @path {type SourcePathRenamed, type Path}
 
 ///|
 let build_entry_script =
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
   { root, relative: "", mod_path: None, }
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
-pub extend SourcePath with Eq::{equal, not_equal}
+pub extend SourcePathRenamed with Eq::{equal, not_equal}
 
 ///|
-pub extend SourcePath with Compare::{compare, op_ge, op_gt, op_le, op_lt}
+pub extend SourcePathRenamed with Compare::{compare, op_ge, op_gt, op_le, op_lt}
 
 ///|
-pub extend SourcePath with Hash::{hash, hash_combine}
+pub extend SourcePathRenamed with Hash::{hash, hash_combine}
 
 ///|
-pub impl Debug for SourcePath with fn to_repr(self) {
+pub impl Debug for SourcePathRenamed with fn to_repr(self) {
   @debug.Repr::string(self.0)
 }
 
 ///|
-pub extend SourcePath with Debug::{to_repr}
+pub extend SourcePathRenamed with Debug::{to_repr}
 
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
-pub extend SourcePath with Show::{output, to_string}
+pub extend SourcePathRenamed with Show::{output, to_string}
 
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
