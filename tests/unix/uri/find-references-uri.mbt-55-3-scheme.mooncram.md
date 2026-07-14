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
Found 15 references for symbol 'scheme':
<WORKDIR>/uri.mbt:55:3-55:9:
   | /// - query: additional parameters (escaped)
   | /// - fragment: reference to a secondary resource (escaped)
   | pub struct Uri { (escaped)
55 |   scheme : String? (escaped)
   |   ^^^^^^ (escaped)
   |   authority : Authority? (escaped)
   |   path : String (escaped)

<WORKDIR>/uri.mbt:98:5-98:11:
   | /// (escaped)
   | /// A new `Uri` with all components set to their default values. (escaped)
   | pub fn empty() -> Uri { (escaped)
98 |   { scheme: None, authority: None, path: "", query: None, fragment: None } (escaped)
   |     ^^^^^^ (escaped)
   | } (escaped)
   |  (escaped)

<WORKDIR>/uri.mbt:162:18-162:24:
    | /// Parse URI with known scheme (escaped)
    | fn parse_with_scheme(scheme : String, rest : String) -> Uri raise UriError { (escaped)
    |   let mut uri = empty() (escaped)
162 |   uri = { ..uri, scheme: Some(scheme) } (escaped)
    |                  ^^^^^^ (escaped)
    |  (escaped)
    |   // Split by fragment first (escaped)

<WORKDIR>/uri.mbt:235:14-235:20:
    |   let mut result = "" (escaped)
    |  (escaped)
    |   // Add scheme (escaped)
235 |   match self.scheme { (escaped)
    |              ^^^^^^ (escaped)
    |     Some(scheme) => { (escaped)
    |       result = result + scheme (escaped)

<WORKDIR>/uri.mbt:313:8-313:14:
    | /// (escaped)
    | /// The scheme as `Some(String)` if present, `None` for relative URIs. (escaped)
    | pub fn Uri::scheme(self : Uri) -> String? { (escaped)
313 |   self.scheme (escaped)
    |        ^^^^^^ (escaped)
    | } (escaped)
    |  (escaped)

<WORKDIR>/uri.mbt:700:13-700:19:
    | /// (escaped)
    | /// A new `Uri` with the specified scheme (escaped)
    | pub fn Uri::with_scheme(self : Uri, new_scheme : String?) -> Uri { (escaped)
700 |   { ..self, scheme: new_scheme } (escaped)
    |             ^^^^^^ (escaped)
    | } (escaped)
    |  (escaped)

<WORKDIR>/uri.mbt:793:14-793:20:
    | ///| (escaped)
    | /// Check if the URI is absolute (has a scheme) (escaped)
    | pub fn Uri::is_absolute(self : Uri) -> Bool { (escaped)
793 |   match self.scheme { (escaped)
    |              ^^^^^^ (escaped)
    |     Some(_) => true (escaped)
    |     None => false (escaped)

<WORKDIR>/uri.mbt:833:22-833:28:
    |       match auth.port { (escaped)
    |         Some(port) => Some(port) (escaped)
    |         None => (escaped)
833 |           match self.scheme { (escaped)
    |                      ^^^^^^ (escaped)
    |             Some(scheme) => default_port(scheme) (escaped)
    |             None => None (escaped)

<WORKDIR>/uri.mbt:850:19-850:25:
    |   // Remove default port if present (escaped)
    |   match self.authority { (escaped)
    |     Some(auth) => (escaped)
850 |       match (self.scheme, auth.port) { (escaped)
    |                   ^^^^^^ (escaped)
    |         (Some(scheme), Some(port)) => (escaped)
    |           match default_port(scheme) { (escaped)

<WORKDIR>/uri.mbt:972:9-972:15:
    |   match relative.authority { (escaped)
    |     Some(_) => (escaped)
    |       resolved = { (escaped)
972 |         scheme: base.scheme, (escaped)
    |         ^^^^^^ (escaped)
    |         authority: relative.authority, (escaped)
    |         path: relative.path, (escaped)

<WORKDIR>/uri.mbt:972:22-972:28:
    |   match relative.authority { (escaped)
    |     Some(_) => (escaped)
    |       resolved = { (escaped)
972 |         scheme: base.scheme, (escaped)
    |                      ^^^^^^ (escaped)
    |         authority: relative.authority, (escaped)
    |         path: relative.path, (escaped)

<WORKDIR>/uri.mbt:983:11-983:17:
    |       if relative.path == "" { (escaped)
    |         // Empty path, use base path (escaped)
    |         resolved = { (escaped)
983 |           scheme: base.scheme, (escaped)
    |           ^^^^^^ (escaped)
    |           authority: base.authority, (escaped)
    |           path: base.path, (escaped)

<WORKDIR>/uri.mbt:983:24-983:30:
    |       if relative.path == "" { (escaped)
    |         // Empty path, use base path (escaped)
    |         resolved = { (escaped)
983 |           scheme: base.scheme, (escaped)
    |                        ^^^^^^ (escaped)
    |           authority: base.authority, (escaped)
    |           path: base.path, (escaped)

<WORKDIR>/uri.mbt:1003:11-1003:17:
     |         } (escaped)
     |  (escaped)
     |         resolved = { (escaped)
1003 |           scheme: base.scheme, (escaped)
     |           ^^^^^^ (escaped)
     |           authority: base.authority, (escaped)
     |           path: resolved_path, (escaped)

<WORKDIR>/uri.mbt:1003:24-1003:30:
     |         } (escaped)
     |  (escaped)
     |         resolved = { (escaped)
1003 |           scheme: base.scheme, (escaped)
     |                        ^^^^^^ (escaped)
     |           authority: base.authority, (escaped)
     |           path: resolved_path, (escaped)

```
