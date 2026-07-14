# uri find-references scheme uri.mbt:55:3

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\uri' moon ide find-references 'scheme' --loc 'uri.mbt:55:3'
Found 15 references for symbol 'scheme':
<WORKDIR>/uri.mbt:55:3-55:9:
   | /// - query: additional parameters
   | /// - fragment: reference to a secondary resource
   | pub struct Uri {
55 |   scheme : String?
   |   ^^^^^^
   |   authority : Authority?
   |   path : String

<WORKDIR>/uri.mbt:98:5-98:11:
   | ///
   | /// A new `Uri` with all components set to their default values.
   | pub fn empty() -> Uri {
98 |   { scheme: None, authority: None, path: "", query: None, fragment: None }
   |     ^^^^^^
   | }
   | 

<WORKDIR>/uri.mbt:162:18-162:24:
    | /// Parse URI with known scheme
    | fn parse_with_scheme(scheme : String, rest : String) -> Uri raise UriError {
    |   let mut uri = empty()
162 |   uri = { ..uri, scheme: Some(scheme) }
    |                  ^^^^^^
    | 
    |   // Split by fragment first

<WORKDIR>/uri.mbt:235:14-235:20:
    |   let mut result = ""
    | 
    |   // Add scheme
235 |   match self.scheme {
    |              ^^^^^^
    |     Some(scheme) => {
    |       result = result + scheme

<WORKDIR>/uri.mbt:313:8-313:14:
    | ///
    | /// The scheme as `Some(String)` if present, `None` for relative URIs.
    | pub fn Uri::scheme(self : Uri) -> String? {
313 |   self.scheme
    |        ^^^^^^
    | }
    | 

<WORKDIR>/uri.mbt:700:13-700:19:
    | ///
    | /// A new `Uri` with the specified scheme
    | pub fn Uri::with_scheme(self : Uri, new_scheme : String?) -> Uri {
700 |   { ..self, scheme: new_scheme }
    |             ^^^^^^
    | }
    | 

<WORKDIR>/uri.mbt:793:14-793:20:
    | ///|
    | /// Check if the URI is absolute (has a scheme) (escaped)
    | pub fn Uri::is_absolute(self : Uri) -> Bool {
793 |   match self.scheme {
    |              ^^^^^^
    |     Some(_) => true
    |     None => false

<WORKDIR>/uri.mbt:833:22-833:28:
    |       match auth.port {
    |         Some(port) => Some(port)
    |         None =>
833 |           match self.scheme {
    |                      ^^^^^^
    |             Some(scheme) => default_port(scheme)
    |             None => None

<WORKDIR>/uri.mbt:850:19-850:25:
    |   // Remove default port if present
    |   match self.authority {
    |     Some(auth) =>
850 |       match (self.scheme, auth.port) {
    |                   ^^^^^^
    |         (Some(scheme), Some(port)) =>
    |           match default_port(scheme) {

<WORKDIR>/uri.mbt:972:9-972:15:
    |   match relative.authority {
    |     Some(_) =>
    |       resolved = {
972 |         scheme: base.scheme,
    |         ^^^^^^
    |         authority: relative.authority,
    |         path: relative.path,

<WORKDIR>/uri.mbt:972:22-972:28:
    |   match relative.authority {
    |     Some(_) =>
    |       resolved = {
972 |         scheme: base.scheme,
    |                      ^^^^^^
    |         authority: relative.authority,
    |         path: relative.path,

<WORKDIR>/uri.mbt:983:11-983:17:
    |       if relative.path == "" {
    |         // Empty path, use base path
    |         resolved = {
983 |           scheme: base.scheme,
    |           ^^^^^^
    |           authority: base.authority,
    |           path: base.path,

<WORKDIR>/uri.mbt:983:24-983:30:
    |       if relative.path == "" {
    |         // Empty path, use base path
    |         resolved = {
983 |           scheme: base.scheme,
    |                        ^^^^^^
    |           authority: base.authority,
    |           path: base.path,

<WORKDIR>/uri.mbt:1003:11-1003:17:
     |         }
     | 
     |         resolved = {
1003 |           scheme: base.scheme,
     |           ^^^^^^
     |           authority: base.authority,
     |           path: resolved_path,

<WORKDIR>/uri.mbt:1003:24-1003:30:
     |         }
     | 
     |         resolved = {
1003 |           scheme: base.scheme,
     |                        ^^^^^^
     |           authority: base.authority,
     |           path: resolved_path,

```
