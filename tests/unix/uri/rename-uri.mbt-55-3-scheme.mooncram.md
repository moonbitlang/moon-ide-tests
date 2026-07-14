# uri rename scheme uri.mbt:55:3

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
$ run_moon_ide moon ide rename 'scheme' 'scheme_renamed' --loc 'uri.mbt:55:3'
*** Begin Patch
*** Update File: <WORKDIR>/uri.mbt
@@
 /// - query: additional parameters
 /// - fragment: reference to a secondary resource
 pub struct Uri {
-  scheme : String?
+  scheme_renamed : String?
   authority : Authority?
   path : String
   query : String?
@@
 ///
 /// A new `Uri` with all components set to their default values.
 pub fn empty() -> Uri {
-  { scheme: None, authority: None, path: "", query: None, fragment: None }
+  { scheme_renamed: None, authority: None, path: "", query: None, fragment: None }
 }
 
 ///|
@@
 /// Parse URI with known scheme
 fn parse_with_scheme(scheme : String, rest : String) -> Uri raise UriError {
   let mut uri = empty()
-  uri = { ..uri, scheme: Some(scheme) }
+  uri = { ..uri, scheme_renamed: Some(scheme) }
 
   // Split by fragment first
   let parts_fragment = rest.split("#").collect()
@@
   let mut result = ""
 
   // Add scheme
-  match self.scheme {
+  match self.scheme_renamed {
     Some(scheme) => { (escaped)
       result = result + scheme
       match self.authority {
@@
 ///
 /// The scheme as `Some(String)` if present, `None` for relative URIs.
 pub fn Uri::scheme(self : Uri) -> String? {
-  self.scheme
+  self.scheme_renamed
 }
 
 ///|
@@
 ///
 /// A new `Uri` with the specified scheme
 pub fn Uri::with_scheme(self : Uri, new_scheme : String?) -> Uri {
-  { ..self, scheme: new_scheme }
+  { ..self, scheme_renamed: new_scheme }
 }
 
 ///|
@@
 ///|
 /// Check if the URI is absolute (has a scheme)
 pub fn Uri::is_absolute(self : Uri) -> Bool {
-  match self.scheme {
+  match self.scheme_renamed {
     Some(_) => true (escaped)
     None => false (escaped)
   }
@@
       match auth.port {
         Some(port) => Some(port) (escaped)
         None => (escaped)
-          match self.scheme {
+          match self.scheme_renamed {
             Some(scheme) => default_port(scheme) (escaped)
             None => None (escaped)
           }
@@
   // Remove default port if present
   match self.authority {
     Some(auth) => (escaped)
-      match (self.scheme, auth.port) {
+      match (self.scheme_renamed, auth.port) {
         (Some(scheme), Some(port)) => (escaped)
           match default_port(scheme) {
             Some(default) => (escaped)
@@
   match relative.authority {
     Some(_) => (escaped)
       resolved = {
-        scheme: base.scheme,
+        scheme_renamed: base.scheme_renamed,
         authority: relative.authority,
         path: relative.path,
         query: relative.query,
@@
       if relative.path == "" {
         // Empty path, use base path
         resolved = {
-          scheme: base.scheme,
+          scheme_renamed: base.scheme_renamed,
           authority: base.authority,
           path: base.path,
           query: match relative.query {
@@
         }
 
         resolved = {
-          scheme: base.scheme,
+          scheme_renamed: base.scheme_renamed,
           authority: base.authority,
           path: resolved_path,
           query: relative.query,
*** End Patch

```
