# rabbita find-references Path warren/path/sourcetree_path.mbt:2:15

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
$ run_moon_ide moon ide find-references 'Path' --loc 'warren/path/sourcetree_path.mbt:2:15'
Found 9 references for symbol 'Path':
<WORKDIR>/warren/devhub/devhub.mbt:214:42-214:46:
    |     path =>
    |       match self.vfs.read(path) {
    |         Some(content) => {
214 |           let content_type = match @path.Path::extname(path) {
    |                                          ^^^^
    |             ".png" => "image/png"
    |             ".jpg" | ".jpeg" => "image/jpeg"

<WORKDIR>/warren/main.mbt:2:36-2:40:
  | ///|
2 | using @path {type SourcePath, type Path}
  |                                    ^^^^
  | 
  | ///|

<WORKDIR>/warren/path/artifact_path.mbt:48:21-48:25:
   | 
   | ///|
   | pub fn ArtifactPath::join_relative(s1 : Self, s2 : String) -> ArtifactPath {
48 |   { ..s1, relative: Path::join(s1.relative, s2).0 }
   |                     ^^^^
   | }
   | 

<WORKDIR>/warren/path/mooncakeio_path.mbt:16:3-16:7:
   | 
   | ///|
   | pub fn MooncakesPath::join(a : Self, b : String) -> Self {
16 |   Path::join(a.0, b).0
   |   ^^^^
   | }
   | 

<WORKDIR>/warren/path/sourcetree_path.mbt:2:10-2:14:
  | ///|
2 | pub type Path = @p.Path
  |          ^^^^
  | 
  | ///|

<WORKDIR>/warren/path/sourcetree_path.mbt:14:3-14:7:
   | 
   | ///|
   | pub fn SourcePath::new(s : String) -> Self {
14 |   Path::resolve(s).0
   |   ^^^^
   | }
   | 

<WORKDIR>/warren/path/sourcetree_path.mbt:24:3-24:7:
   | 
   | ///|
   | pub fn SourcePath::join(a : Self, b : String) -> Self {
24 |   Path::join(a.0, b).normalize().0
   |   ^^^^
   | }
   | 

<WORKDIR>/warren/path/sourcetree_path.mbt:29:3-29:7:
   | 
   | ///|
   | pub fn SourcePath::relative(a : Self, base : SourcePath) -> String {
29 |   Path::relative(a.0, base=base.0).0
   |   ^^^^
   | }

<WORKDIR>/warren/utils.mbt:12:24-12:28:
   |       copy(src=src.join(entry), dst=dst.join(entry))
   |     }
   |   } else {
12 |     let parent = @path.Path::dirname(dst_str).to_string()
   |                        ^^^^
   |     if parent != "" && parent != "." && !@fs.exists(parent) {
   |       @fs.mkdir(parent, permission=0o755, recursive=true)

```
