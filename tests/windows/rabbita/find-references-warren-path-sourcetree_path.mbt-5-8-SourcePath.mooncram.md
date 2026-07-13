# rabbita find-references SourcePath warren\path\sourcetree_path.mbt:5:8

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\rabbita' moon ide find-references 'SourcePath' --loc 'warren\path\sourcetree_path.mbt:5:8'
Found 12 references for symbol 'SourcePath':
<WORKDIR>/warren\main.mbt:2:19-2:29:
  | ///|
2 | using @path {type SourcePath, type Path}
  |                   ^^^^^^^^^^
  | 
  | ///|

<WORKDIR>/warren\path\artifact_path.mbt:3:10-3:20:
  | ///|
  | struct ArtifactPath {
3 |   root : SourcePath
  |          ^^^^^^^^^^
  |   mod_path : String?
  |   relative : String

<WORKDIR>/warren\path\artifact_path.mbt:42:33-42:43:
   | }
   | 
   | ///|
42 | pub fn ArtifactPath::new(root : SourcePath) -> ArtifactPath {
   |                                 ^^^^^^^^^^
   |   { root, relative: "", mod_path: None }
   | }

<WORKDIR>/warren\path\artifact_path.mbt:57:6-57:16:
   |   target : Target,
   |   build : Build,
   |   mode : Mode,
57 | ) -> SourcePath {
   |      ^^^^^^^^^^
   |   let mut acc = self.root
   |   acc = acc.join(

<WORKDIR>/warren\path\sourcetree_path.mbt:5:8-5:18:
  | pub type Path = @p.Path
  | 
  | ///|
5 | struct SourcePath(String) derive(Eq, Compare, Hash)
  |        ^^^^^^^^^^
  | 
  | ///|

<WORKDIR>/warren\path\sourcetree_path.mbt:8:20-8:30:
  | struct SourcePath(String) derive(Eq, Compare, Hash)
  | 
  | ///|
8 | pub impl Debug for SourcePath with fn to_repr(self) {
  |                    ^^^^^^^^^^
  |   @debug.Repr::string(self.0)
  | }

<WORKDIR>/warren\path\sourcetree_path.mbt:13:8-13:18:
   | }
   | 
   | ///|
13 | pub fn SourcePath::new(s : String) -> Self {
   |        ^^^^^^^^^^
   |   Path::resolve(s).0
   | }

<WORKDIR>/warren\path\sourcetree_path.mbt:18:19-18:29:
   | }
   | 
   | ///|
18 | pub impl Show for SourcePath with fn output(self, buf) {
   |                   ^^^^^^^^^^
   |   buf.write_string(self.0)
   | }

<WORKDIR>/warren\path\sourcetree_path.mbt:23:8-23:18:
   | }
   | 
   | ///|
23 | pub fn SourcePath::join(a : Self, b : String) -> Self {
   |        ^^^^^^^^^^
   |   Path::join(a.0, b).normalize().0
   | }

<WORKDIR>/warren\path\sourcetree_path.mbt:28:8-28:18:
   | }
   | 
   | ///|
28 | pub fn SourcePath::relative(a : Self, base : SourcePath) -> String {
   |        ^^^^^^^^^^
   |   Path::relative(a.0, base=base.0).0
   | }

<WORKDIR>/warren\path\sourcetree_path.mbt:28:46-28:56:
   | }
   | 
   | ///|
28 | pub fn SourcePath::relative(a : Self, base : SourcePath) -> String {
   |                                              ^^^^^^^^^^
   |   Path::relative(a.0, base=base.0).0
   | }

<WORKDIR>/warren\vfs\vfs.mbt:2:19-2:29:
  | ///|
2 | using @path {type SourcePath}
  |                   ^^^^^^^^^^
  | 
  | ///|

```
