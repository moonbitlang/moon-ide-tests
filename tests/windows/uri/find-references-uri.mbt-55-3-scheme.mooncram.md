# uri find-references scheme uri.mbt:55:3

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\uri' moon ide find-references 'scheme' --loc 'uri.mbt:55:3'
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
    | 
    |   // Add scheme
248 |   match self.scheme {
    |              ^^^^^^
    |     Some(scheme) => {
    |       result = result + scheme

<WORKDIR>/uri.mbt:330:8-330:14:
    | ///
    | /// The scheme as `Some(String)` if present, `None` for relative URIs.
    | pub fn Uri::scheme(self : Uri) -> String? {
330 |   self.scheme
    |        ^^^^^^
    | }
    | 

<WORKDIR>/uri.mbt:717:13-717:19:
    | ///
    | /// A new `Uri` with the specified scheme
    | pub fn Uri::with_scheme(self : Uri, new_scheme : String?) -> Uri {
717 |   { ..self, scheme: new_scheme, }
    |             ^^^^^^
    | }
    | 

<WORKDIR>/uri.mbt:810:14-810:20:
    | ///|
    | /// Check if the URI is absolute (has a scheme) (escaped)
    | pub fn Uri::is_absolute(self : Uri) -> Bool {
810 |   match self.scheme {
    |              ^^^^^^
    |     Some(_) => true
    |     None => false

<WORKDIR>/uri.mbt:850:22-850:28:
    |       match auth.port {
    |         Some(port) => Some(port)
    |         None =>
850 |           match self.scheme {
    |                      ^^^^^^
    |             Some(scheme) => default_port(scheme)
    |             None => None

<WORKDIR>/uri.mbt:867:19-867:25:
    |   // Remove default port if present
    |   match self.authority {
    |     Some(auth) =>
867 |       match (self.scheme, auth.port) {
    |                   ^^^^^^
    |         (Some(scheme), Some(port)) =>
    |           match default_port(scheme) {

<WORKDIR>/uri.mbt:989:9-989:15:
    |   match relative.authority {
    |     Some(_) =>
    |       resolved = {
989 |         scheme: base.scheme,
    |         ^^^^^^
    |         authority: relative.authority,
    |         path: relative.path,

<WORKDIR>/uri.mbt:989:22-989:28:
    |   match relative.authority {
    |     Some(_) =>
    |       resolved = {
989 |         scheme: base.scheme,
    |                      ^^^^^^
    |         authority: relative.authority,
    |         path: relative.path,

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
     |         }
     | 
     |         resolved = {
1020 |           scheme: base.scheme,
     |           ^^^^^^
     |           authority: base.authority,
     |           path: resolved_path,

<WORKDIR>/uri.mbt:1020:24-1020:30:
     |         }
     | 
     |         resolved = {
1020 |           scheme: base.scheme,
     |                        ^^^^^^
     |           authority: base.authority,
     |           path: resolved_path,

```
