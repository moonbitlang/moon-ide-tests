# rabbita find-references SourcePath warren/path/sourcetree_path.mbt:5:8

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
$ run_moon_ide moon ide find-references 'SourcePath' --loc 'warren/path/sourcetree_path.mbt:5:8'
Found 16 references for symbol 'SourcePath':
<WORKDIR>/warren/build.mbt:2:19-2:29:
  | ///|
2 | using @path {type SourcePath, type Path}
  |                   ^^^^^^^^^^
  | 
  | ///|

<WORKDIR>/warren/path/artifact_path.mbt:3:10-3:20:
  | ///|
  | struct ArtifactPath {
3 |   root : SourcePath
  |          ^^^^^^^^^^
  |   mod_path : String?
  |   relative : String

<WORKDIR>/warren/path/artifact_path.mbt:72:33-72:43:
   | }
   | 
   | ///|
72 | pub fn ArtifactPath::new(root : SourcePath) -> ArtifactPath {
   |                                 ^^^^^^^^^^
   |   { root, relative: "", mod_path: None, }
   | }

<WORKDIR>/warren/path/artifact_path.mbt:87:6-87:16:
   |   target : Target,
   |   build : Build,
   |   mode : Mode,
87 | ) -> SourcePath {
   |      ^^^^^^^^^^
   |   let mut acc = self.root
   |   acc = acc.join(

<WORKDIR>/warren/path/sourcetree_path.mbt:8:12-8:22:
  | struct SourcePath(String) derive(Eq, Compare, Hash)
  | 
  | ///|
8 | pub extend SourcePath with Eq::{equal, not_equal}
  |            ^^^^^^^^^^
  | 
  | ///|

<WORKDIR>/warren/path/sourcetree_path.mbt:11:12-11:22:
   | pub extend SourcePath with Eq::{equal, not_equal}
   | 
   | ///|
11 | pub extend SourcePath with Compare::{compare, op_ge, op_gt, op_le, op_lt}
   |            ^^^^^^^^^^
   | 
   | ///|

<WORKDIR>/warren/path/sourcetree_path.mbt:14:12-14:22:
   | pub extend SourcePath with Compare::{compare, op_ge, op_gt, op_le, op_lt}
   | 
   | ///|
14 | pub extend SourcePath with Hash::{hash, hash_combine}
   |            ^^^^^^^^^^
   | 
   | ///|

<WORKDIR>/warren/path/sourcetree_path.mbt:17:20-17:30:
   | pub extend SourcePath with Hash::{hash, hash_combine}
   | 
   | ///|
17 | pub impl Debug for SourcePath with fn to_repr(self) {
   |                    ^^^^^^^^^^
   |   @debug.Repr::string(self.0)
   | }

<WORKDIR>/warren/path/sourcetree_path.mbt:22:12-22:22:
   | }
   | 
   | ///|
22 | pub extend SourcePath with Debug::{to_repr}
   |            ^^^^^^^^^^
   | 
   | ///|

<WORKDIR>/warren/path/sourcetree_path.mbt:25:8-25:18:
   | pub extend SourcePath with Debug::{to_repr}
   | 
   | ///|
25 | pub fn SourcePath::new(s : String) -> Self {
   |        ^^^^^^^^^^
   |   Path::resolve(s).0
   | }

<WORKDIR>/warren/path/sourcetree_path.mbt:30:19-30:29:
   | }
   | 
   | ///|
30 | pub impl Show for SourcePath with fn output(self, buf) {
   |                   ^^^^^^^^^^
   |   buf.write_string(self.0)
   | }

<WORKDIR>/warren/path/sourcetree_path.mbt:35:12-35:22:
   | }
   | 
   | ///|
35 | pub extend SourcePath with Show::{output, to_string}
   |            ^^^^^^^^^^
   | 
   | ///|

<WORKDIR>/warren/path/sourcetree_path.mbt:38:8-38:18:
   | pub extend SourcePath with Show::{output, to_string}
   | 
   | ///|
38 | pub fn SourcePath::join(a : Self, b : String) -> Self {
   |        ^^^^^^^^^^
   |   Path::join(a.0, b).normalize().0
   | }

<WORKDIR>/warren/path/sourcetree_path.mbt:43:8-43:18:
   | }
   | 
   | ///|
43 | pub fn SourcePath::relative(a : Self, base : SourcePath) -> String {
   |        ^^^^^^^^^^
   |   Path::relative(a.0, base=base.0).0
   | }

<WORKDIR>/warren/path/sourcetree_path.mbt:43:46-43:56:
   | }
   | 
   | ///|
43 | pub fn SourcePath::relative(a : Self, base : SourcePath) -> String {
   |                                              ^^^^^^^^^^
   |   Path::relative(a.0, base=base.0).0
   | }

<WORKDIR>/warren/vfs/vfs.mbt:2:19-2:29:
  | ///|
2 | using @path {type SourcePath}
  |                   ^^^^^^^^^^
  | 
  | ///|

```
