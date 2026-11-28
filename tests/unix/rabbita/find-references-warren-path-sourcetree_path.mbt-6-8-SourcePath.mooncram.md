# rabbita find-references SourcePath warren/path/sourcetree_path.mbt:6:8

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' find-references 'SourcePath' --loc 'warren/path/sourcetree_path.mbt:6:8'
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

<WORKDIR>/warren/path/artifact_path.mbt:75:33-75:43:
   | }
   | 
   | ///|
75 | pub fn ArtifactPath::new(root : SourcePath) -> ArtifactPath {
   |                                 ^^^^^^^^^^
   |   { root, relative: "", mod_path: None, }
   | }

<WORKDIR>/warren/path/artifact_path.mbt:90:6-90:16:
   |   target : Target,
   |   build : Build,
   |   mode : Mode,
90 | ) -> SourcePath {
   |      ^^^^^^^^^^
   |   let mut acc = self.root
   |   acc = acc.join(

<WORKDIR>/warren/path/sourcetree_path.mbt:9:12-9:22:
  | struct SourcePath(String)
  | 
  | ///|
9 | pub extend SourcePath with Eq::{equal, not_equal}
  |            ^^^^^^^^^^
  | 
  | ///|

<WORKDIR>/warren/path/sourcetree_path.mbt:12:12-12:22:
   | pub extend SourcePath with Eq::{equal, not_equal}
   | 
   | ///|
12 | pub extend SourcePath with Compare::{compare, op_ge, op_gt, op_le, op_lt}
   |            ^^^^^^^^^^
   | 
   | ///|

<WORKDIR>/warren/path/sourcetree_path.mbt:15:12-15:22:
   | pub extend SourcePath with Compare::{compare, op_ge, op_gt, op_le, op_lt}
   | 
   | ///|
15 | pub extend SourcePath with Hash::{hash, hash_combine}
   |            ^^^^^^^^^^
   | 
   | ///|

<WORKDIR>/warren/path/sourcetree_path.mbt:18:20-18:30:
   | pub extend SourcePath with Hash::{hash, hash_combine}
   | 
   | ///|
18 | pub impl Debug for SourcePath with fn to_repr(self) {
   |                    ^^^^^^^^^^
   |   @debug.Repr::string(self.0)
   | }

<WORKDIR>/warren/path/sourcetree_path.mbt:23:12-23:22:
   | }
   | 
   | ///|
23 | pub extend SourcePath with Debug::{to_repr}
   |            ^^^^^^^^^^
   | 
   | ///|

<WORKDIR>/warren/path/sourcetree_path.mbt:26:8-26:18:
   | pub extend SourcePath with Debug::{to_repr}
   | 
   | ///|
26 | pub fn SourcePath::new(s : String) -> Self {
   |        ^^^^^^^^^^
   |   Path::resolve(s).0
   | }

<WORKDIR>/warren/path/sourcetree_path.mbt:31:19-31:29:
   | }
   | 
   | ///|
31 | pub impl Show for SourcePath with fn output(self, buf) {
   |                   ^^^^^^^^^^
   |   buf.write_string(self.0)
   | }

<WORKDIR>/warren/path/sourcetree_path.mbt:36:12-36:22:
   | }
   | 
   | ///|
36 | pub extend SourcePath with Show::{output, to_string}
   |            ^^^^^^^^^^
   | 
   | ///|

<WORKDIR>/warren/path/sourcetree_path.mbt:39:8-39:18:
   | pub extend SourcePath with Show::{output, to_string}
   | 
   | ///|
39 | pub fn SourcePath::join(a : Self, b : String) -> Self {
   |        ^^^^^^^^^^
   |   Path::join(a.0, b).normalize().0
   | }

<WORKDIR>/warren/path/sourcetree_path.mbt:44:8-44:18:
   | }
   | 
   | ///|
44 | pub fn SourcePath::relative(a : Self, base : SourcePath) -> String {
   |        ^^^^^^^^^^
   |   Path::relative(a.0, base=base.0).0
   | }

<WORKDIR>/warren/path/sourcetree_path.mbt:44:46-44:56:
   | }
   | 
   | ///|
44 | pub fn SourcePath::relative(a : Self, base : SourcePath) -> String {
   |                                              ^^^^^^^^^^
   |   Path::relative(a.0, base=base.0).0
   | }

<WORKDIR>/warren/vfs/vfs.mbt:2:19-2:29:
  | ///|
2 | using @path {type SourcePath}
  |                   ^^^^^^^^^^
  | 
  | ///|
"" (escaped)
```
