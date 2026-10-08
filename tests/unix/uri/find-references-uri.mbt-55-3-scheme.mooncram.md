# uri find-references scheme uri.mbt:55:3

```mooncram
$ export MOON_HOME="${MOON_HOME:-$HOME/.moon}"
```

```mooncram
$ export TEST_REPO_ROOT="$(cd "$TESTDIR/../../../fixtures/repos/uri" && pwd)"
```

```mooncram
$ normalize_moon_ide_output() { sed -e "s|$TEST_REPO_ROOT|<WORKDIR>|g" -e "s|$MOON_HOME|<MOON_HOME>|g"; }
```

```mooncram
$ run_moon_ide() { status_file="${TMPDIR:-/tmp}/moon-ide-status.$$"; ( cd "$TEST_REPO_ROOT" && "$@"; echo "$?" > "$status_file" ) 2>&1 | normalize_moon_ide_output; status=$(cat "$status_file"); rm -f "$status_file"; return "$status"; }
```

```mooncram
$ run_moon_ide moon ide find-references 'scheme' --loc 'uri.mbt:55:3'
Found 14 references for symbol 'scheme':
<WORKDIR>/uri.mbt:111:5-111:11:
    | ///
    | /// A new `Uri` with all components set to their default values.
    | pub fn empty() -> Uri {
111 |   { scheme: None, authority: None, path: "", query: None, fragment: None, }
    |     ^^^^^^
    | }
    | 

<WORKDIR>/uri.mbt:175:18-175:24:
    | /// Parse URI with known scheme
    | fn parse_with_scheme(scheme : String, rest : String) -> Uri raise UriError {
    |   let mut uri = empty()
175 |   uri = { ..uri, scheme: Some(scheme), }
    |                  ^^^^^^
    | 
    |   // Split by fragment first

<WORKDIR>/uri.mbt:248:14-248:20:
    |   let mut result = ""
    |  (escaped)
    |   // Add scheme (escaped)
248 |   match self.scheme {
    |              ^^^^^^ (escaped)
    |     Some(scheme) => { (escaped)
    |       result = result + scheme (escaped)

<WORKDIR>/uri.mbt:330:8-330:14:
    | /// (escaped)
    | /// The scheme as `Some(String)` if present, `None` for relative URIs. (escaped)
    | pub fn Uri::scheme(self : Uri) -> String? { (escaped)
330 |   self.scheme
    |        ^^^^^^ (escaped)
    | } (escaped)
    |  (escaped)

<WORKDIR>/uri.mbt:717:13-717:19:
    | /// (escaped)
    | /// A new `Uri` with the specified scheme (escaped)
    | pub fn Uri::with_scheme(self : Uri, new_scheme : String?) -> Uri { (escaped)
717 |   { ..self, scheme: new_scheme, }
    |             ^^^^^^ (escaped)
    | } (escaped)
    |  (escaped)

<WORKDIR>/uri.mbt:810:14-810:20:
    | ///| (escaped)
    | /// Check if the URI is absolute (has a scheme) (escaped)
    | pub fn Uri::is_absolute(self : Uri) -> Bool { (escaped)
810 |   match self.scheme {
    |              ^^^^^^ (escaped)
    |     Some(_) => true (escaped)
    |     None => false (escaped)

<WORKDIR>/uri.mbt:850:22-850:28:
    |       match auth.port { (escaped)
    |         Some(port) => Some(port) (escaped)
    |         None => (escaped)
850 |           match self.scheme {
    |                      ^^^^^^ (escaped)
    |             Some(scheme) => default_port(scheme) (escaped)
    |             None => None (escaped)

<WORKDIR>/uri.mbt:867:19-867:25:
    |   // Remove default port if present (escaped)
    |   match self.authority { (escaped)
    |     Some(auth) => (escaped)
867 |       match (self.scheme, auth.port) {
    |                   ^^^^^^ (escaped)
    |         (Some(scheme), Some(port)) => (escaped)
    |           match default_port(scheme) { (escaped)

<WORKDIR>/uri.mbt:989:9-989:15:
    |   match relative.authority { (escaped)
    |     Some(_) => (escaped)
    |       resolved = { (escaped)
989 |         scheme: base.scheme,
    |         ^^^^^^ (escaped)
    |         authority: relative.authority, (escaped)
    |         path: relative.path, (escaped)

<WORKDIR>/uri.mbt:989:22-989:28:
    |   match relative.authority { (escaped)
    |     Some(_) => (escaped)
    |       resolved = { (escaped)
989 |         scheme: base.scheme,
    |                      ^^^^^^ (escaped)
    |         authority: relative.authority, (escaped)
    |         path: relative.path, (escaped)

<WORKDIR>/uri.mbt:1000:11-1000:17:
     |       if relative.path == "" {
     |         // Empty path, use base path
     |         resolved = {
1000 |           scheme: base.scheme,
     |           ^^^^^^
     |           authority: base.authority,
     |           path: base.path,

<WORKDIR>/uri.mbt:1000:24-1000:30:
     |       if relative.path == "" {
     |         // Empty path, use base path
     |         resolved = {
1000 |           scheme: base.scheme,
     |                        ^^^^^^
     |           authority: base.authority,
     |           path: base.path,

<WORKDIR>/uri.mbt:1020:11-1020:17:
     |         } (escaped)
     |  (escaped)
     |         resolved = { (escaped)
1020 |           scheme: base.scheme,
     |           ^^^^^^ (escaped)
     |           authority: base.authority, (escaped)
     |           path: resolved_path, (escaped)

<WORKDIR>/uri.mbt:1020:24-1020:30:
     |         } (escaped)
     |  (escaped)
     |         resolved = { (escaped)
1020 |           scheme: base.scheme,
     |                        ^^^^^^ (escaped)
     |           authority: base.authority, (escaped)
     |           path: resolved_path, (escaped)

```
