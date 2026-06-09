# uri find-references

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\uri' moon ide find-references 'Uri' --loc 'uri.mbt:54:12'
Found 104 references for symbol 'Uri':
<WORKDIR>/uri.mbt:54:12-54:15:
   | /// - path: hierarchical path to resource
   | /// - query: additional parameters
   | /// - fragment: reference to a secondary resource
54 | pub struct Uri {
   |            ^^^
   |   scheme : String?
   |   authority : Authority?

<WORKDIR>/uri.mbt:97:19-97:22:
   | /// # Returns
   | ///
   | /// A new `Uri` with all components set to their default values.
97 | pub fn empty() -> Uri {
   |                   ^^^
   |   { scheme: None, authority: None, path: "", query: None, fragment: None }
   | }

<WORKDIR>/uri.mbt:127:35-127:38:
    | /// - `UriError::InvalidScheme` if the scheme is malformed
    | /// - `UriError::InvalidAuthority` if the authority is malformed
    | /// - Other `UriError` variants for various parsing failures
127 | pub fn parse(uri_str : String) -> Uri raise UriError {
    |                                   ^^^
    |   if uri_str.length() == 0 {
    |     raise EmptyUri

<WORKDIR>/uri.mbt:160:57-160:60:
    | 
    | ///|
    | /// Parse URI with known scheme
160 | fn parse_with_scheme(scheme : String, rest : String) -> Uri raise UriError {
    |                                                         ^^^
    |   let mut uri = empty()
    |   uri = { ..uri, scheme: Some(scheme) }

<WORKDIR>/uri.mbt:231:8-231:11:
    | 
    | ///|
    | /// Convert a Uri structure back to a string representation
231 | pub fn Uri::to_string(self : Uri) -> String {
    |        ^^^
    |   let mut result = ""
    | 

<WORKDIR>/uri.mbt:231:30-231:33:
    | 
    | ///|
    | /// Convert a Uri structure back to a string representation
231 | pub fn Uri::to_string(self : Uri) -> String {
    |                              ^^^
    |   let mut result = ""
    | 

<WORKDIR>/uri.mbt:282:19-282:22:
    | 
    | ///|
    | /// Implement Show trait for Uri to provide standard string representation
282 | pub impl Show for Uri with output(self, logger) {
    |                   ^^^
    |   // Use our existing to_string method for the Show implementation
    |   logger.write_string(self.to_string())

<WORKDIR>/uri.mbt:312:8-312:11:
    | /// # Returns
    | ///
    | /// The scheme as `Some(String)` if present, `None` for relative URIs.
312 | pub fn Uri::scheme(self : Uri) -> String? {
    |        ^^^
    |   self.scheme
    | }

<WORKDIR>/uri.mbt:312:27-312:30:
    | /// # Returns
    | ///
    | /// The scheme as `Some(String)` if present, `None` for relative URIs.
312 | pub fn Uri::scheme(self : Uri) -> String? {
    |                           ^^^
    |   self.scheme
    | }

<WORKDIR>/uri.mbt:345:8-345:11:
    | /// # Returns
    | ///
    | /// The host as `Some(String)` if present, `None` for relative URIs or URIs without authority.
345 | pub fn Uri::host(self : Uri) -> String? {
    |        ^^^
    |   match self.authority {
    |     Some(auth) => Some(auth.host)

<WORKDIR>/uri.mbt:345:25-345:28:
    | /// # Returns
    | ///
    | /// The host as `Some(String)` if present, `None` for relative URIs or URIs without authority.
345 | pub fn Uri::host(self : Uri) -> String? {
    |                         ^^^
    |   match self.authority {
    |     Some(auth) => Some(auth.host)

<WORKDIR>/uri.mbt:385:8-385:11:
    | /// # See Also
    | ///
    | /// - `effective_port()` - Get the effective port including scheme defaults
385 | pub fn Uri::port(self : Uri) -> Int? {
    |        ^^^
    |   match self.authority {
    |     Some(auth) => auth.port

<WORKDIR>/uri.mbt:385:25-385:28:
    | /// # See Also
    | ///
    | /// - `effective_port()` - Get the effective port including scheme defaults
385 | pub fn Uri::port(self : Uri) -> Int? {
    |                         ^^^
    |   match self.authority {
    |     Some(auth) => auth.port

<WORKDIR>/uri.mbt:430:8-430:11:
    | ///
    | /// - `path_segments()` - Get path as array of segments
    | /// - `with_path()` - Create new URI with different path
430 | pub fn Uri::path(self : Uri) -> String {
    |        ^^^
    |   self.path
    | }

<WORKDIR>/uri.mbt:430:25-430:28:
    | ///
    | /// - `path_segments()` - Get path as array of segments
    | /// - `with_path()` - Create new URI with different path
430 | pub fn Uri::path(self : Uri) -> String {
    |                         ^^^
    |   self.path
    | }

<WORKDIR>/uri.mbt:472:8-472:11:
    | ///
    | /// - `get_query_param()` - Get specific query parameter value
    | /// - `parse_query()` - Parse query string into key-value pairs
472 | pub fn Uri::query(self : Uri) -> String? {
    |        ^^^
    |   self.query
    | }

<WORKDIR>/uri.mbt:472:26-472:29:
    | ///
    | /// - `get_query_param()` - Get specific query parameter value
    | /// - `parse_query()` - Parse query string into key-value pairs
472 | pub fn Uri::query(self : Uri) -> String? {
    |                          ^^^
    |   self.query
    | }

<WORKDIR>/uri.mbt:509:8-509:11:
    | /// # See Also
    | ///
    | /// - `with_fragment()` - Create new URI with different fragment
509 | pub fn Uri::fragment(self : Uri) -> String? {
    |        ^^^
    |   self.fragment
    | }

<WORKDIR>/uri.mbt:509:29-509:32:
    | /// # See Also
    | ///
    | /// - `with_fragment()` - Create new URI with different fragment
509 | pub fn Uri::fragment(self : Uri) -> String? {
    |                             ^^^
    |   self.fragment
    | }

<WORKDIR>/uri.mbt:699:8-699:11:
    | /// # Returns
    | ///
    | /// A new `Uri` with the specified scheme
699 | pub fn Uri::with_scheme(self : Uri, new_scheme : String?) -> Uri {
    |        ^^^
    |   { ..self, scheme: new_scheme }
    | }

<WORKDIR>/uri.mbt:699:32-699:35:
    | /// # Returns
    | ///
    | /// A new `Uri` with the specified scheme
699 | pub fn Uri::with_scheme(self : Uri, new_scheme : String?) -> Uri {
    |                                ^^^
    |   { ..self, scheme: new_scheme }
    | }

<WORKDIR>/uri.mbt:699:62-699:65:
    | /// # Returns
    | ///
    | /// A new `Uri` with the specified scheme
699 | pub fn Uri::with_scheme(self : Uri, new_scheme : String?) -> Uri {
    |                                                              ^^^
    |   { ..self, scheme: new_scheme }
    | }

<WORKDIR>/uri.mbt:736:8-736:11:
    | /// # Returns
    | ///
    | /// A new `Uri` with the specified host
736 | pub fn Uri::with_host(self : Uri, new_host : String?) -> Uri {
    |        ^^^
    |   match new_host {
    |     Some(host) => {

<WORKDIR>/uri.mbt:736:30-736:33:
    | /// # Returns
    | ///
    | /// A new `Uri` with the specified host
736 | pub fn Uri::with_host(self : Uri, new_host : String?) -> Uri {
    |                              ^^^
    |   match new_host {
    |     Some(host) => {

<WORKDIR>/uri.mbt:736:58-736:61:
    | /// # Returns
    | ///
    | /// A new `Uri` with the specified host
736 | pub fn Uri::with_host(self : Uri, new_host : String?) -> Uri {
    |                                                          ^^^
    |   match new_host {
    |     Some(host) => {

<WORKDIR>/uri.mbt:751:8-751:11:
    | 
    | ///|
    | /// Create a new URI with the specified port
751 | pub fn Uri::with_port(self : Uri, new_port : Int?) -> Uri {
    |        ^^^
    |   match self.authority {
    |     Some(auth) => {

<WORKDIR>/uri.mbt:751:30-751:33:
    | 
    | ///|
    | /// Create a new URI with the specified port
751 | pub fn Uri::with_port(self : Uri, new_port : Int?) -> Uri {
    |                              ^^^
    |   match self.authority {
    |     Some(auth) => {

<WORKDIR>/uri.mbt:751:55-751:58:
    | 
    | ///|
    | /// Create a new URI with the specified port
751 | pub fn Uri::with_port(self : Uri, new_port : Int?) -> Uri {
    |                                                       ^^^
    |   match self.authority {
    |     Some(auth) => {

<WORKDIR>/uri.mbt:774:8-774:11:
    | 
    | ///|
    | /// Create a new URI with the specified path
774 | pub fn Uri::with_path(self : Uri, new_path : String) -> Uri {
    |        ^^^
    |   { ..self, path: new_path }
    | }

<WORKDIR>/uri.mbt:774:30-774:33:
    | 
    | ///|
    | /// Create a new URI with the specified path
774 | pub fn Uri::with_path(self : Uri, new_path : String) -> Uri {
    |                              ^^^
    |   { ..self, path: new_path }
    | }

<WORKDIR>/uri.mbt:774:57-774:60:
    | 
    | ///|
    | /// Create a new URI with the specified path
774 | pub fn Uri::with_path(self : Uri, new_path : String) -> Uri {
    |                                                         ^^^
    |   { ..self, path: new_path }
    | }

<WORKDIR>/uri.mbt:780:8-780:11:
    | 
    | ///|
    | /// Create a new URI with the specified query
780 | pub fn Uri::with_query(self : Uri, new_query : String?) -> Uri {
    |        ^^^
    |   { ..self, query: new_query }
    | }

<WORKDIR>/uri.mbt:780:31-780:34:
    | 
    | ///|
    | /// Create a new URI with the specified query
780 | pub fn Uri::with_query(self : Uri, new_query : String?) -> Uri {
    |                               ^^^
    |   { ..self, query: new_query }
    | }

<WORKDIR>/uri.mbt:780:60-780:63:
    | 
    | ///|
    | /// Create a new URI with the specified query
780 | pub fn Uri::with_query(self : Uri, new_query : String?) -> Uri {
    |                                                            ^^^
    |   { ..self, query: new_query }
    | }

<WORKDIR>/uri.mbt:786:8-786:11:
    | 
    | ///|
    | /// Create a new URI with the specified fragment
786 | pub fn Uri::with_fragment(self : Uri, new_fragment : String?) -> Uri {
    |        ^^^
    |   { ..self, fragment: new_fragment }
    | }

<WORKDIR>/uri.mbt:786:34-786:37:
    | 
    | ///|
    | /// Create a new URI with the specified fragment
786 | pub fn Uri::with_fragment(self : Uri, new_fragment : String?) -> Uri {
    |                                  ^^^
    |   { ..self, fragment: new_fragment }
    | }

<WORKDIR>/uri.mbt:786:66-786:69:
    | 
    | ///|
    | /// Create a new URI with the specified fragment
786 | pub fn Uri::with_fragment(self : Uri, new_fragment : String?) -> Uri {
    |                                                                  ^^^
    |   { ..self, fragment: new_fragment }
    | }

<WORKDIR>/uri.mbt:792:8-792:11:
    | 
    | ///|
    | /// Check if the URI is absolute (has a scheme) (escaped)
792 | pub fn Uri::is_absolute(self : Uri) -> Bool {
    |        ^^^
    |   match self.scheme {
    |     Some(_) => true

<WORKDIR>/uri.mbt:792:32-792:35:
    | 
    | ///|
    | /// Check if the URI is absolute (has a scheme) (escaped)
792 | pub fn Uri::is_absolute(self : Uri) -> Bool {
    |                                ^^^
    |   match self.scheme {
    |     Some(_) => true

<WORKDIR>/uri.mbt:801:8-801:11:
    | 
    | ///|
    | /// Check if the URI is relative (no scheme) (escaped)
801 | pub fn Uri::is_relative(self : Uri) -> Bool {
    |        ^^^
    |   !self.is_absolute()
    | }

<WORKDIR>/uri.mbt:801:32-801:35:
    | 
    | ///|
    | /// Check if the URI is relative (no scheme) (escaped)
801 | pub fn Uri::is_relative(self : Uri) -> Bool {
    |                                ^^^
    |   !self.is_absolute()
    | }

<WORKDIR>/uri.mbt:827:8-827:11:
    | 
    | ///|
    | /// Get the effective port (explicit port or default port for scheme) (escaped)
827 | pub fn Uri::effective_port(self : Uri) -> Int? {
    |        ^^^
    |   match self.authority {
    |     Some(auth) =>

<WORKDIR>/uri.mbt:827:35-827:38:
    | 
    | ///|
    | /// Get the effective port (explicit port or default port for scheme) (escaped)
827 | pub fn Uri::effective_port(self : Uri) -> Int? {
    |                                   ^^^
    |   match self.authority {
    |     Some(auth) =>

<WORKDIR>/uri.mbt:844:8-844:11:
    | 
    | ///|
    | /// Normalize a URI (remove default ports, normalize path, etc.) (escaped)
844 | pub fn Uri::normalize(self : Uri) -> Uri {
    |        ^^^
    |   let mut normalized = self
    | 

<WORKDIR>/uri.mbt:844:30-844:33:
    | 
    | ///|
    | /// Normalize a URI (remove default ports, normalize path, etc.) (escaped)
844 | pub fn Uri::normalize(self : Uri) -> Uri {
    |                              ^^^
    |   let mut normalized = self
    | 

<WORKDIR>/uri.mbt:844:38-844:41:
    | 
    | ///|
    | /// Normalize a URI (remove default ports, normalize path, etc.) (escaped)
844 | pub fn Uri::normalize(self : Uri) -> Uri {
    |                                      ^^^
    |   let mut normalized = self
    | 

<WORKDIR>/uri.mbt:955:23-955:26:
    | /// # See Also
    | ///
    | /// - RFC3986 Section 5.2 - Reference Resolution
955 | pub fn resolve(base : Uri, relative : Uri) -> Uri raise UriError {
    |                       ^^^
    |   // If relative URI is absolute, return it as-is
    |   if relative.is_absolute() {

<WORKDIR>/uri.mbt:955:39-955:42:
    | /// # See Also
    | ///
    | /// - RFC3986 Section 5.2 - Reference Resolution
955 | pub fn resolve(base : Uri, relative : Uri) -> Uri raise UriError {
    |                                       ^^^
    |   // If relative URI is absolute, return it as-is
    |   if relative.is_absolute() {

<WORKDIR>/uri.mbt:955:47-955:50:
    | /// # See Also
    | ///
    | /// - RFC3986 Section 5.2 - Reference Resolution
955 | pub fn resolve(base : Uri, relative : Uri) -> Uri raise UriError {
    |                                               ^^^
    |   // If relative URI is absolute, return it as-is
    |   if relative.is_absolute() {

<WORKDIR>/uri.mbt:1087:8-1087:11:
     | 
     | ///|
     | /// Get a specific query parameter value
1087 | pub fn Uri::get_query_param(self : Uri, param_name : String) -> String? {
     |        ^^^
     |   match self.query {
     |     Some(query_str) => {

<WORKDIR>/uri.mbt:1087:36-1087:39:
     | 
     | ///|
     | /// Get a specific query parameter value
1087 | pub fn Uri::get_query_param(self : Uri, param_name : String) -> String? {
     |                                    ^^^
     |   match self.query {
     |     Some(query_str) => {

<WORKDIR>/uri.mbt:1105:8-1105:11:
     | 
     | ///|
     | /// Add or update a query parameter
1105 | pub fn Uri::with_query_param(
     |        ^^^
     |   self : Uri,
     |   param_name : String,

<WORKDIR>/uri.mbt:1106:10-1106:13:
     | ///|
     | /// Add or update a query parameter
     | pub fn Uri::with_query_param(
1106 |   self : Uri,
     |          ^^^
     |   param_name : String,
     |   param_value : String,

<WORKDIR>/uri.mbt:1109:6-1109:9:
     |   self : Uri,
     |   param_name : String,
     |   param_value : String,
1109 | ) -> Uri {
     |      ^^^
     |   let current_params = match self.query {
     |     Some(query_str) => parse_query(query_str)

<WORKDIR>/uri.mbt:1145:8-1145:11:
     | 
     | ///|
     | /// Remove a query parameter
1145 | pub fn Uri::remove_query_param(self : Uri, param_name : String) -> Uri {
     |        ^^^
     |   match self.query {
     |     Some(query_str) => {

<WORKDIR>/uri.mbt:1145:39-1145:42:
     | 
     | ///|
     | /// Remove a query parameter
1145 | pub fn Uri::remove_query_param(self : Uri, param_name : String) -> Uri {
     |                                       ^^^
     |   match self.query {
     |     Some(query_str) => {

<WORKDIR>/uri.mbt:1145:68-1145:71:
     | 
     | ///|
     | /// Remove a query parameter
1145 | pub fn Uri::remove_query_param(self : Uri, param_name : String) -> Uri {
     |                                                                    ^^^
     |   match self.query {
     |     Some(query_str) => {

<WORKDIR>/uri.mbt:1209:8-1209:11:
     | /// # See Also
     | ///
     | /// - `decode()` - Decode percent-encoded strings
1209 | pub fn Uri::encode(input : String) -> String {
     |        ^^^
     |   let mut result = ""
     | 

<WORKDIR>/uri.mbt:1269:8-1269:11:
     | /// # See Also
     | ///
     | /// - `encode()` - Encode strings for safe URI usage
1269 | pub fn Uri::decode(input : String) -> String {
     |        ^^^
     |   let mut result = ""
     |   let mut i = 0

<WORKDIR>/uri.mbt:1324:8-1324:11:
     | /// # Returns
     | ///
     | /// Array of key-value pairs
1324 | pub fn Uri::parse_query(query_string : String) -> Array[(String, String)] {
     |        ^^^
     |   if query_string.length() == 0 {
     |     return []

<WORKDIR>/uri.mbt:1337:19-1337:22:
     |     if pair_str.contains("=") {
     |       let parts = pair_str.split("=").collect()
     |       if parts.length() >= 2 {
1337 |         let key = Uri::decode(parts[0].to_owned())
     |                   ^^^
     |         let value = Uri::decode(parts[1].to_owned())
     |         result.push((key, value))

<WORKDIR>/uri.mbt:1338:21-1338:24:
     |       let parts = pair_str.split("=").collect()
     |       if parts.length() >= 2 {
     |         let key = Uri::decode(parts[0].to_owned())
1338 |         let value = Uri::decode(parts[1].to_owned())
     |                     ^^^
     |         result.push((key, value))
     |       } else {

<WORKDIR>/uri.mbt:1342:22-1342:25:
     |         result.push((key, value))
     |       } else {
     |         // No equals sign, treat as key with empty value
1342 |         result.push((Uri::decode(pair_str), ""))
     |                      ^^^
     |       }
     |     } else {

<WORKDIR>/uri.mbt:1346:20-1346:23:
     |       }
     |     } else {
     |       // No equals sign, treat as key with empty value
1346 |       result.push((Uri::decode(pair_str), ""))
     |                    ^^^
     |     }
     |   }

<WORKDIR>/uri.mbt:1370:8-1370:11:
     | /// # Returns
     | ///
     | /// Encoded query string
1370 | pub fn Uri::build_query(pairs : Array[(String, String)]) -> String {
     |        ^^^
     |   let parts : Array[String] = []
     | 

<WORKDIR>/uri.mbt:1375:23-1375:26:
     | 
     |   for i = 0; i < pairs.length(); i = i + 1 {
     |     let (key, value) = pairs[i]
1375 |     let encoded_key = Uri::encode(key)
     |                       ^^^
     |     if value.length() == 0 {
     |       parts.push(encoded_key)

<WORKDIR>/uri.mbt:1379:27-1379:30:
     |     if value.length() == 0 {
     |       parts.push(encoded_key)
     |     } else {
1379 |       let encoded_value = Uri::encode(value)
     |                           ^^^
     |       parts.push(encoded_key + "=" + encoded_value)
     |     }

<WORKDIR>/uri.mbt:1402:8-1402:11:
     | /// # Returns
     | ///
     | /// Array of path segments (excluding empty segments from leading/trailing slashes) (escaped)
1402 | pub fn Uri::path_segments(self : Uri) -> Array[String] {
     |        ^^^
     |   if self.path.length() == 0 {
     |     return []

<WORKDIR>/uri.mbt:1402:34-1402:37:
     | /// # Returns
     | ///
     | /// Array of path segments (excluding empty segments from leading/trailing slashes) (escaped)
1402 | pub fn Uri::path_segments(self : Uri) -> Array[String] {
     |                                  ^^^
     |   if self.path.length() == 0 {
     |     return []

<WORKDIR>/uri.mbt:1413:19-1413:22:
     |   for segment in segments {
     |     let seg_str = segment.to_owned()
     |     if seg_str.length() > 0 {
1413 |       result.push(Uri::decode(seg_str))
     |                   ^^^
     |     }
     |   }

<WORKDIR>/uri.mbt:1437:8-1437:11:
     | /// # Returns
     | ///
     | /// New URI with the specified path segments
1437 | pub fn Uri::with_path_segments(self : Uri, segments : Array[String]) -> Uri {
     |        ^^^
     |   if segments.length() == 0 {
     |     return { ..self, path: "" }

<WORKDIR>/uri.mbt:1437:39-1437:42:
     | /// # Returns
     | ///
     | /// New URI with the specified path segments
1437 | pub fn Uri::with_path_segments(self : Uri, segments : Array[String]) -> Uri {
     |                                       ^^^
     |   if segments.length() == 0 {
     |     return { ..self, path: "" }

<WORKDIR>/uri.mbt:1437:73-1437:76:
     | /// # Returns
     | ///
     | /// New URI with the specified path segments
1437 | pub fn Uri::with_path_segments(self : Uri, segments : Array[String]) -> Uri {
     |                                                                         ^^^
     |   if segments.length() == 0 {
     |     return { ..self, path: "" }

<WORKDIR>/uri.mbt:1444:27-1444:30:
     | 
     |   let encoded_segments : Array[String] = []
     |   for segment in segments {
1444 |     encoded_segments.push(Uri::encode(segment.to_string()))
     |                           ^^^
     |   }
     | 

<WORKDIR>/uri.mbt:1470:8-1470:11:
     | /// # Returns
     | ///
     | /// Optional tuple of (username, optional password) (escaped)
1470 | pub fn Uri::userinfo_components(self : Uri) -> (String, String?)? {
     |        ^^^
     |   match self.authority {
     |     Some(auth) =>

<WORKDIR>/uri.mbt:1470:40-1470:43:
     | /// # Returns
     | ///
     | /// Optional tuple of (username, optional password) (escaped)
1470 | pub fn Uri::userinfo_components(self : Uri) -> (String, String?)? {
     |                                        ^^^
     |   match self.authority {
     |     Some(auth) =>

<WORKDIR>/uri.mbt:1478:30-1478:33:
     |           if userinfo.contains(":") {
     |             let parts = userinfo.split(":").collect()
     |             if parts.length() >= 2 {
1478 |               let username = Uri::decode(parts[0].to_owned())
     |                              ^^^
     |               let password = Uri::decode(parts[1].to_owned())
     |               Some((username, Some(password)))

<WORKDIR>/uri.mbt:1479:30-1479:33:
     |             let parts = userinfo.split(":").collect()
     |             if parts.length() >= 2 {
     |               let username = Uri::decode(parts[0].to_owned())
1479 |               let password = Uri::decode(parts[1].to_owned())
     |                              ^^^
     |               Some((username, Some(password)))
     |             } else {

<WORKDIR>/uri.mbt:1482:30-1482:33:
     |               let password = Uri::decode(parts[1].to_owned())
     |               Some((username, Some(password)))
     |             } else {
1482 |               let username = Uri::decode(userinfo)
     |                              ^^^
     |               Some((username, None))
     |             }

<WORKDIR>/uri.mbt:1486:28-1486:31:
     |               Some((username, None))
     |             }
     |           } else {
1486 |             let username = Uri::decode(userinfo)
     |                            ^^^
     |             Some((username, None))
     |           }

<WORKDIR>/uri.mbt:1515:8-1515:11:
     | /// # Returns
     | ///
     | /// New URI with the specified userinfo
1515 | pub fn Uri::with_userinfo(
     |        ^^^
     |   self : Uri,
     |   username : String?,

<WORKDIR>/uri.mbt:1516:10-1516:13:
     | ///
     | /// New URI with the specified userinfo
     | pub fn Uri::with_userinfo(
1516 |   self : Uri,
     |          ^^^
     |   username : String?,
     |   password : String?,

<WORKDIR>/uri.mbt:1519:6-1519:9:
     |   self : Uri,
     |   username : String?,
     |   password : String?,
1519 | ) -> Uri {
     |      ^^^
     |   match username {
     |     Some(user) => {

<WORKDIR>/uri.mbt:1523:23-1523:26:
     |   match username {
     |     Some(user) => {
     |       let userinfo = match password {
1523 |         Some(pass) => Uri::encode(user) + ":" + Uri::encode(pass)
     |                       ^^^
     |         None => Uri::encode(user)
     |       }

<WORKDIR>/uri.mbt:1523:49-1523:52:
     |   match username {
     |     Some(user) => {
     |       let userinfo = match password {
1523 |         Some(pass) => Uri::encode(user) + ":" + Uri::encode(pass)
     |                                                 ^^^
     |         None => Uri::encode(user)
     |       }

<WORKDIR>/uri.mbt:1524:17-1524:20:
     |     Some(user) => {
     |       let userinfo = match password {
     |         Some(pass) => Uri::encode(user) + ":" + Uri::encode(pass)
1524 |         None => Uri::encode(user)
     |                 ^^^
     |       }
     | 

<WORKDIR>/uri_test_new_features.mbt:5:17-5:20:
  | /// Test URL encoding functionality
  | test "url_encoding" {
  |   // Test basic encoding
5 |   let encoded = Uri::encode("hello world!")
  |                 ^^^
  |   json_inspect(encoded, content="hello%20world%21")
  | 

<WORKDIR>/uri_test_new_features.mbt:10:28-10:31:
   | 
   |   // Test unreserved characters (should not be encoded) (escaped)
   |   let unreserved = "hello-world_123.test~"
10 |   let encoded_unreserved = Uri::encode(unreserved)
   |                            ^^^
   |   json_inspect(encoded_unreserved, content="hello-world_123.test~")
   | 

<WORKDIR>/uri_test_new_features.mbt:15:25-15:28:
   | 
   |   // Test special characters
   |   let special = "user@domain.com:password"
15 |   let encoded_special = Uri::encode(special)
   |                         ^^^
   |   json_inspect(encoded_special, content="user%40domain.com%3Apassword")
   | }

<WORKDIR>/uri_test_new_features.mbt:23:17-23:20:
   | /// Test URL decoding functionality
   | test "url_decoding" {
   |   // Test basic decoding
23 |   let decoded = Uri::decode("hello%20world%21")
   |                 ^^^
   |   json_inspect(decoded, content="hello world!")
   | 

<WORKDIR>/uri_test_new_features.mbt:27:21-27:24:
   |   json_inspect(decoded, content="hello world!")
   | 
   |   // Test invalid hex sequences (should be left as-is) (escaped)
27 |   let invalid_hex = Uri::decode("hello%ZZ")
   |                     ^^^
   |   json_inspect(invalid_hex, content="hello%ZZ")
   | 

<WORKDIR>/uri_test_new_features.mbt:31:20-31:23:
   |   json_inspect(invalid_hex, content="hello%ZZ")
   | 
   |   // Test incomplete percent encoding
31 |   let incomplete = Uri::decode("hello%2")
   |                    ^^^
   |   json_inspect(incomplete, content="hello%2")
   | 

<WORKDIR>/uri_test_new_features.mbt:35:15-35:18:
   |   json_inspect(incomplete, content="hello%2")
   | 
   |   // Test mixed content
35 |   let mixed = Uri::decode("user%40domain.com%3Apass%20word")
   |               ^^^
   |   json_inspect(mixed, content="user@domain.com:pass word")
   | }

<WORKDIR>/uri_test_new_features.mbt:43:17-43:20:
   | /// Test URL encoding/decoding round trip
   | test "url_encoding_round_trip" {
   |   let original = "Hello World! @#$%^&*()"
43 |   let encoded = Uri::encode(original)
   |                 ^^^
   |   let decoded = Uri::decode(encoded)
   |   json_inspect(decoded, content="Hello World! @#$%^&*()")

<WORKDIR>/uri_test_new_features.mbt:44:17-44:20:
   | test "url_encoding_round_trip" {
   |   let original = "Hello World! @#$%^&*()"
   |   let encoded = Uri::encode(original)
44 |   let decoded = Uri::decode(encoded)
   |                 ^^^
   |   json_inspect(decoded, content="Hello World! @#$%^&*()")
   | 

<WORKDIR>/uri_test_new_features.mbt:49:25-49:28:
   | 
   |   // Test with Unicode-like content
   |   let unicode_like = "café naïve résumé"
49 |   let encoded_unicode = Uri::encode(unicode_like)
   |                         ^^^
   |   let decoded_unicode = Uri::decode(encoded_unicode)
   |   json_inspect(decoded_unicode, content="café naïve résumé")

<WORKDIR>/uri_test_new_features.mbt:50:25-50:28:
   |   // Test with Unicode-like content
   |   let unicode_like = "café naïve résumé"
   |   let encoded_unicode = Uri::encode(unicode_like)
50 |   let decoded_unicode = Uri::decode(encoded_unicode)
   |                         ^^^
   |   json_inspect(decoded_unicode, content="café naïve résumé")
   | }

<WORKDIR>/uri_test_new_features.mbt:59:16-59:19:
   | test "query_string_parsing" {
   |   // Test basic query parsing
   |   let query = "name=John&age=30&city=New%20York"
59 |   let params = Uri::parse_query(query)
   |                ^^^
   |   json_inspect(params, content=[
   |     ["name", "John"],

<WORKDIR>/uri_test_new_features.mbt:67:22-67:25:
   |   ])
   | 
   |   // Test empty query
67 |   let empty_params = Uri::parse_query("")
   |                      ^^^
   |   json_inspect(empty_params.length(), content=0)
   | 

<WORKDIR>/uri_test_new_features.mbt:72:28-72:31:
   | 
   |   // Test query with empty values
   |   let empty_value_query = "key1=&key2=value2&key3"
72 |   let empty_value_params = Uri::parse_query(empty_value_query)
   |                            ^^^
   |   json_inspect(empty_value_params, content=[
   |     ["key1", ""],

<WORKDIR>/uri_test_new_features.mbt:85:15-85:18:
   | test "query_string_building" {
   |   // Test basic query building
   |   let params = [("name", "John Doe"), ("age", "30"), ("active", "")]
85 |   let query = Uri::build_query(params)
   |               ^^^
   |   json_inspect(query, content="name=John%20Doe&age=30&active")
   | 

<WORKDIR>/uri_test_new_features.mbt:89:21-89:24:
   |   json_inspect(query, content="name=John%20Doe&age=30&active")
   | 
   |   // Test empty params
89 |   let empty_query = Uri::build_query([])
   |                     ^^^
   |   json_inspect(empty_query, content="")
   | 

<WORKDIR>/uri_test_new_features.mbt:97:23-97:26:
   |     ("user@email", "test+value"),
   |     ("key with spaces", "value&more"),
   |   ]
97 |   let special_query = Uri::build_query(special_params)
   |                       ^^^
   |   json_inspect(
   |     special_query,

<WORKDIR>/uri_test_new_features.mbt:298:22-298:25:
    |   )
    | 
    |   // Query should be parsed correctly
298 |   let query_params = Uri::parse_query(uri.query().unwrap_or(""))
    |                      ^^^
    |   json_inspect(query_params, content=[
    |     ["query", "value=with&special"],

```

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

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\uri' moon ide find-references 'uri' --loc 'uri_test.mbt:5:7'
Found 2 references for symbol 'uri':
<WORKDIR>/uri_test.mbt:5:7-5:10:
  | /// Test basic URI parsing functionality
  | test "basic_uri_parsing" {
  |   // Test simple HTTP URI
5 |   let uri = @uri.parse("https://example.com/path")
  |       ^^^
  |   json_inspect(uri, content={
  |     "scheme": "https",

<WORKDIR>/uri_test.mbt:6:16-6:19:
  | test "basic_uri_parsing" {
  |   // Test simple HTTP URI
  |   let uri = @uri.parse("https://example.com/path")
6 |   json_inspect(uri, content={
  |                ^^^
  |     "scheme": "https",
  |     "authority": { "host": "example.com" },

```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\uri' moon ide find-references 'parse' --loc 'uri_test.mbt:5:18'
Found 47 references for symbol 'parse':
<WORKDIR>/README.mbt.md:36:18-36:23:
   | ///|
   | test "quick_start_example" {
   |   // Parse a URI
36 |   let uri = @uri.parse("https://example.com:8080/path?query=value#fragment")
   |                  ^^^^^
   |   debug_inspect(uri.scheme(), content="Some(\"https\")")
   |   debug_inspect(uri.host(), content="Some(\"example.com\")")

<WORKDIR>/README.mbt.md:93:18-93:23:
   | ```moonbit check
   | ///|
   | test "of_string_example" {
93 |   let uri = @uri.parse("https://example.com/path")
   |                  ^^^^^
   |   debug_inspect(uri.host(), content="Some(\"example.com\")")
   | }

<WORKDIR>/README.mbt.md:104:18-104:23:
    | ```moonbit check
    | ///|
    | test "to_string_example" {
104 |   let uri = @uri.parse("https://example.com/path")
    |                  ^^^^^
    |   let uri_string = uri.to_string()
    |   inspect(uri_string, content="https://example.com/path")

<WORKDIR>/README.mbt.md:172:18-172:23:
    | ```moonbit check
    | ///|
    | test "normalize_example" {
172 |   let uri = @uri.parse("https://example.com:443/path")
    |                  ^^^^^
    |   let normalized = uri.normalize()
    |   // Default HTTPS port (443) should be removed

<WORKDIR>/README.mbt.md:186:19-186:24:
    | ```moonbit check
    | ///|
    | test "resolve_example" {
186 |   let base = @uri.parse("https://example.com/dir/")
    |                   ^^^^^
    |   let relative = @uri.parse("../other/file.html")
    |   let resolved = @uri.resolve(base, relative)

<WORKDIR>/README.mbt.md:187:23-187:28:
    | ///|
    | test "resolve_example" {
    |   let base = @uri.parse("https://example.com/dir/")
187 |   let relative = @uri.parse("../other/file.html")
    |                       ^^^^^
    |   let resolved = @uri.resolve(base, relative)
    |   inspect(resolved.to_string(), content="https://example.com/other/file.html")

<WORKDIR>/README.mbt.md:202:18-202:23:
    | ```moonbit check
    | ///|
    | test "parse_http_uri" {
202 |   let uri = @uri.parse(
    |                  ^^^^^
    |     "https://user:pass@example.com:8080/path?query=value#section",
    |   )

<WORKDIR>/README.mbt.md:237:19-237:24:
    | ```moonbit check
    | ///|
    | test "resolve_relative_uri" {
237 |   let base = @uri.parse("https://example.com/docs/guide/")
    |                   ^^^^^
    |   let relative = @uri.parse("../api/reference.html")
    | 

<WORKDIR>/README.mbt.md:238:23-238:28:
    | ///|
    | test "resolve_relative_uri" {
    |   let base = @uri.parse("https://example.com/docs/guide/")
238 |   let relative = @uri.parse("../api/reference.html")
    |                       ^^^^^
    | 
    |   let resolved = @uri.resolve(base, relative)

<WORKDIR>/README.mbt.md:253:18-253:23:
    | ```moonbit check
    | ///|
    | test "query_parameters" {
253 |   let uri = @uri.parse("https://search.example.com/?q=moonbit&lang=en&safe=on")
    |                  ^^^^^
    | 
    |   match uri.query() {

<WORKDIR>/README.mbt.md:276:18-276:23:
    | ```moonbit check
    | ///|
    | test "ipv6_uri" {
276 |   let uri = @uri.parse("http://[2001:db8::1]:8080/path")
    |                  ^^^^^
    |   debug_inspect(uri.scheme(), content="Some(\"http\")")
    |   debug_inspect(uri.host(), content="Some(\"[2001:db8::1]\")")

<WORKDIR>/README.mbt.md:289:18-289:23:
    | ```moonbit check
    | ///|
    | test "uri_normalization" {
289 |   let uri = @uri.parse("https://example.com:443/./path/../other/./file.html")
    |                  ^^^^^
    |   let normalized = uri.normalize()
    | 

<WORKDIR>/README.mbt.md:326:18-326:23:
    | ///|
    | test "error_handling_example" {
    |   // Test with a valid but unusual URI
326 |   let uri = @uri.parse("custom://example.com")
    |                  ^^^^^
    |   debug_inspect(uri.scheme(), content="Some(\"custom\")")
    |   debug_inspect(uri.host(), content="Some(\"example.com\")")

<WORKDIR>/uri.mbt:127:8-127:13:
    | /// - `UriError::InvalidScheme` if the scheme is malformed
    | /// - `UriError::InvalidAuthority` if the authority is malformed
    | /// - Other `UriError` variants for various parsing failures
127 | pub fn parse(uri_str : String) -> Uri raise UriError {
    |        ^^^^^
    |   if uri_str.length() == 0 {
    |     raise EmptyUri

<WORKDIR>/uri_test.mbt:5:18-5:23:
  | /// Test basic URI parsing functionality
  | test "basic_uri_parsing" {
  |   // Test simple HTTP URI
5 |   let uri = @uri.parse("https://example.com/path")
  |                  ^^^^^
  |   json_inspect(uri, content={
  |     "scheme": "https",

<WORKDIR>/uri_test.mbt:61:20-61:25:
   | /// Test path-only URI
   | test "path_only_uri" {
   |   try {
61 |     let uri = @uri.parse("/path/to/resource")
   |                    ^^^^^
   |     if uri.scheme() != None {
   |       fail("Expected no scheme")

<WORKDIR>/uri_test.mbt:80:18-80:23:
   | /// Test empty URI error
   | test "empty_uri_error" {
   |   try {
80 |     let _ = @uri.parse("")
   |                  ^^^^^
   |     fail("Expected EmptyUri error")
   |   } catch {

<WORKDIR>/uri_test.mbt:112:18-112:23:
    | /// Test invalid scheme
    | test "invalid_scheme" {
    |   try {
112 |     let _ = @uri.parse("123invalid://example.com")
    |                  ^^^^^
    |     fail("Expected InvalidScheme error")
    |   } catch {

<WORKDIR>/uri_test.mbt:127:18-127:23:
    | /// Test invalid port
    | test "invalid_port" {
    |   try {
127 |     let _ = @uri.parse("http://example.com:abc/path")
    |                  ^^^^^
    |     fail("Expected InvalidPort error")
    |   } catch {

<WORKDIR>/uri_test.mbt:142:18-142:23:
    | /// Test port out of range
    | test "port_out_of_range" {
    |   try {
142 |     let _ = @uri.parse("http://example.com:99999/path")
    |                  ^^^^^
    |     fail("Expected error for port out of range")
    |   } catch {

<WORKDIR>/uri_test.mbt:154:18-154:23:
    | /// Test invalid path with spaces
    | test "invalid_path_spaces" {
    |   try {
154 |     let _ = @uri.parse("http://example.com/path with spaces")
    |                  ^^^^^
    |     fail("Expected error for path with unescaped spaces")
    |   } catch {

<WORKDIR>/uri_test.mbt:166:18-166:23:
    | /// Test invalid query with spaces
    | test "invalid_query_spaces" {
    |   try {
166 |     let _ = @uri.parse("http://example.com/path?query with spaces")
    |                  ^^^^^
    |     fail("Expected error for query with unescaped spaces")
    |   } catch {

<WORKDIR>/uri_test.mbt:178:18-178:23:
    | /// Test invalid fragment with spaces
    | test "invalid_fragment_spaces" {
    |   try {
178 |     let _ = @uri.parse("http://example.com/path#fragment with spaces")
    |                  ^^^^^
    |     fail("Expected error for fragment with unescaped spaces")
    |   } catch {

<WORKDIR>/uri_test.mbt:190:19-190:24:
    | /// Test URI normalization
    | test "uri_normalization" {
    |   // Test default port removal
190 |   let uri1 = @uri.parse("https://example.com:443/path")
    |                   ^^^^^
    |   let normalized1 = uri1.normalize()
    |   json_inspect(normalized1, content={

<WORKDIR>/uri_test.mbt:199:19-199:24:
    |   })
    | 
    |   // Test path normalization
199 |   let uri2 = @uri.parse("http://example.com/./path/../other/./file.html")
    |                   ^^^^^
    |   let normalized2 = uri2.normalize()
    |   json_inspect(normalized2.path(), content="/other/file.html")

<WORKDIR>/uri_test.mbt:207:19-207:24:
    | ///|
    | /// Test URI resolution
    | test "uri_resolution" {
207 |   let base = @uri.parse("https://example.com/docs/guide/")
    |                   ^^^^^
    |   let relative = @uri.parse("../api/reference.html")
    | 

<WORKDIR>/uri_test.mbt:208:23-208:28:
    | /// Test URI resolution
    | test "uri_resolution" {
    |   let base = @uri.parse("https://example.com/docs/guide/")
208 |   let relative = @uri.parse("../api/reference.html")
    |                       ^^^^^
    | 
    |   try {

<WORKDIR>/uri_test.mbt:222:32-222:37:
    |   }
    | 
    |   // Test absolute relative URI
222 |   let absolute_relative = @uri.parse("https://other.com/path")
    |                                ^^^^^
    |   try {
    |     let resolved = @uri.resolve(base, absolute_relative)

<WORKDIR>/uri_test.mbt:236:18-236:23:
    | ///|
    | /// Test get query parameter
    | test "get_query_parameter" {
236 |   let uri = @uri.parse("https://example.com/search?q=moonbit&lang=en&safe=on")
    |                  ^^^^^
    | 
    |   let param_q = uri.get_query_param("q")

<WORKDIR>/uri_test.mbt:249:18-249:23:
    | ///|
    | /// Test with query parameter
    | test "with_query_parameter" {
249 |   let uri = @uri.parse("https://example.com/search?q=test")
    |                  ^^^^^
    | 
    |   // Update existing parameter

<WORKDIR>/uri_test.mbt:265:18-265:23:
    | ///|
    | /// Test remove query parameter
    | test "remove_query_parameter" {
265 |   let uri = @uri.parse("https://example.com/search?q=test&lang=en&safe=on")
    |                  ^^^^^
    | 
    |   let without_lang = uri.remove_query_param("lang")

<WORKDIR>/uri_test.mbt:286:18-286:23:
    | ///|
    | /// Test complex URI with userinfo
    | test "complex_uri_with_userinfo" {
286 |   let uri = @uri.parse(
    |                  ^^^^^
    |     "https://user:pass@api.example.com:8080/v1/users?limit=10&offset=0#results",
    |   )

<WORKDIR>/uri_test.mbt:306:19-306:24:
    | /// Test effective port
    | test "effective_port" {
    |   // Explicit port
306 |   let uri1 = @uri.parse("https://example.com:8080/path")
    |                   ^^^^^
    |   match uri1.effective_port() {
    |     Some(port_val) =>

<WORKDIR>/uri_test.mbt:316:19-316:24:
    |   }
    | 
    |   // Default port
316 |   let uri2 = @uri.parse("https://example.com/path")
    |                   ^^^^^
    |   match uri2.effective_port() {
    |     Some(port_val) =>

<WORKDIR>/uri_test.mbt:326:19-326:24:
    |   }
    | 
    |   // No authority
326 |   let uri3 = @uri.parse("/path")
    |                   ^^^^^
    |   match uri3.effective_port() {
    |     Some(_) => fail("Expected no port for URI without authority")

<WORKDIR>/uri_test.mbt:336:18-336:23:
    | ///|
    | /// Test Show trait implementation
    | test "show_trait_implementation" {
336 |   let uri = @uri.parse(
    |                  ^^^^^
    |     "https://user:pass@example.com:8080/path?query=value#fragment",
    |   )

<WORKDIR>/uri_test_new_features.mbt:108:13-108:18:
    | /// Test path segments functionality
    | test "path_segments" {
    |   // Test basic path segments
108 |   let uri = parse("/path/to/resource")
    |             ^^^^^
    |   let segments = uri.path_segments()
    |   json_inspect(segments, content=["path", "to", "resource"])

<WORKDIR>/uri_test_new_features.mbt:118:21-118:26:
    |   json_inspect(empty_segments.length(), content=0)
    | 
    |   // Test path with encoded segments
118 |   let encoded_uri = parse("/path/with%20spaces/and%2Bplus")
    |                     ^^^^^
    |   let encoded_segments = encoded_uri.path_segments()
    |   json_inspect(encoded_segments, content=["path", "with spaces", "and+plus"])

<WORKDIR>/uri_test_new_features.mbt:123:18-123:23:
    |   json_inspect(encoded_segments, content=["path", "with spaces", "and+plus"])
    | 
    |   // Test root path
123 |   let root_uri = parse("/")
    |                  ^^^^^
    |   let root_segments = root_uri.path_segments()
    |   json_inspect(root_segments.length(), content=0)

<WORKDIR>/uri_test_new_features.mbt:157:23-157:28:
    | /// Test userinfo components parsing
    | test "userinfo_components" {
    |   // Test username and password
157 |   let uri_with_pass = parse("https://user:pass@example.com")
    |                       ^^^^^
    |   match uri_with_pass.userinfo_components() {
    |     Some((user, Some(pass))) => {

<WORKDIR>/uri_test_new_features.mbt:167:23-167:28:
    |   }
    | 
    |   // Test username only
167 |   let uri_user_only = parse("https://user@example.com")
    |                       ^^^^^
    |   match uri_user_only.userinfo_components() {
    |     Some((user, None)) => json_inspect(user, content="user")

<WORKDIR>/uri_test_new_features.mbt:174:21-174:26:
    |   }
    | 
    |   // Test no userinfo
174 |   let uri_no_user = parse("https://example.com")
    |                     ^^^^^
    |   match uri_no_user.userinfo_components() {
    |     None => () // Expected

<WORKDIR>/uri_test_new_features.mbt:181:21-181:26:
    |   }
    | 
    |   // Test encoded userinfo
181 |   let uri_encoded = parse("https://user%40domain:pass%20word@example.com")
    |                     ^^^^^
    |   match uri_encoded.userinfo_components() {
    |     Some((user, Some(pass))) => {

<WORKDIR>/uri_test_new_features.mbt:268:23-268:28:
    | /// Test edge cases and error conditions
    | test "edge_cases" {
    |   // Test malformed percent encoding in existing functions
268 |   let malformed_uri = parse("https://example.com/path%ZZ")
    |                       ^^^^^
    |   // Should parse successfully but keep malformed encoding
    |   json_inspect(malformed_uri.path(), content="/path%ZZ")

<WORKDIR>/uri_test_new_features.mbt:293:13-293:18:
    | /// Test RFC 3986 compliance scenarios
    | test "rfc3986_compliance" {
    |   // Test reserved characters in different components
293 |   let uri = parse(
    |             ^^^^^
    |     "https://example.com/path?query=value%3Dwith%26special&other=normal#frag%23ment",
    |   )

<WORKDIR>/uri_test_new_features.mbt:305:22-305:27:
    |   ])
    | 
    |   // Test case sensitivity in scheme (should be case-insensitive in practice, but we store as-is) (escaped)
305 |   let upper_scheme = parse("HTTPS://example.com")
    |                      ^^^^^
    |   json_inspect(upper_scheme.scheme(), content=["HTTPS"])
    | 

<WORKDIR>/uri_test_new_features.mbt:309:18-309:23:
    |   json_inspect(upper_scheme.scheme(), content=["HTTPS"])
    | 
    |   // Test IPv6 addresses (basic support) (escaped)
309 |   let ipv6_uri = parse("http://[2001:db8::1]:8080/path")
    |                  ^^^^^
    |   json_inspect(ipv6_uri.host(), content=["[2001:db8::1]"])
    |   json_inspect(ipv6_uri.port(), content=[8080])

```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\uri' moon ide find-references 'encoded' --loc 'uri_test_new_features.mbt:5:7'
Found 2 references for symbol 'encoded':
<WORKDIR>/uri_test_new_features.mbt:5:7-5:14:
  | /// Test URL encoding functionality
  | test "url_encoding" {
  |   // Test basic encoding
5 |   let encoded = Uri::encode("hello world!")
  |       ^^^^^^^
  |   json_inspect(encoded, content="hello%20world%21")
  | 

<WORKDIR>/uri_test_new_features.mbt:6:16-6:23:
  | test "url_encoding" {
  |   // Test basic encoding
  |   let encoded = Uri::encode("hello world!")
6 |   json_inspect(encoded, content="hello%20world%21")
  |                ^^^^^^^
  | 
  |   // Test unreserved characters (should not be encoded) (escaped)

```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\uri' moon ide find-references 'Uri' --loc 'uri_test_new_features.mbt:5:17'
Found 104 references for symbol 'Uri':
<WORKDIR>/uri.mbt:54:12-54:15:
   | /// - path: hierarchical path to resource
   | /// - query: additional parameters
   | /// - fragment: reference to a secondary resource
54 | pub struct Uri {
   |            ^^^
   |   scheme : String?
   |   authority : Authority?

<WORKDIR>/uri.mbt:97:19-97:22:
   | /// # Returns
   | ///
   | /// A new `Uri` with all components set to their default values.
97 | pub fn empty() -> Uri {
   |                   ^^^
   |   { scheme: None, authority: None, path: "", query: None, fragment: None }
   | }

<WORKDIR>/uri.mbt:127:35-127:38:
    | /// - `UriError::InvalidScheme` if the scheme is malformed
    | /// - `UriError::InvalidAuthority` if the authority is malformed
    | /// - Other `UriError` variants for various parsing failures
127 | pub fn parse(uri_str : String) -> Uri raise UriError {
    |                                   ^^^
    |   if uri_str.length() == 0 {
    |     raise EmptyUri

<WORKDIR>/uri.mbt:160:57-160:60:
    | 
    | ///|
    | /// Parse URI with known scheme
160 | fn parse_with_scheme(scheme : String, rest : String) -> Uri raise UriError {
    |                                                         ^^^
    |   let mut uri = empty()
    |   uri = { ..uri, scheme: Some(scheme) }

<WORKDIR>/uri.mbt:231:8-231:11:
    | 
    | ///|
    | /// Convert a Uri structure back to a string representation
231 | pub fn Uri::to_string(self : Uri) -> String {
    |        ^^^
    |   let mut result = ""
    | 

<WORKDIR>/uri.mbt:231:30-231:33:
    | 
    | ///|
    | /// Convert a Uri structure back to a string representation
231 | pub fn Uri::to_string(self : Uri) -> String {
    |                              ^^^
    |   let mut result = ""
    | 

<WORKDIR>/uri.mbt:282:19-282:22:
    | 
    | ///|
    | /// Implement Show trait for Uri to provide standard string representation
282 | pub impl Show for Uri with output(self, logger) {
    |                   ^^^
    |   // Use our existing to_string method for the Show implementation
    |   logger.write_string(self.to_string())

<WORKDIR>/uri.mbt:312:8-312:11:
    | /// # Returns
    | ///
    | /// The scheme as `Some(String)` if present, `None` for relative URIs.
312 | pub fn Uri::scheme(self : Uri) -> String? {
    |        ^^^
    |   self.scheme
    | }

<WORKDIR>/uri.mbt:312:27-312:30:
    | /// # Returns
    | ///
    | /// The scheme as `Some(String)` if present, `None` for relative URIs.
312 | pub fn Uri::scheme(self : Uri) -> String? {
    |                           ^^^
    |   self.scheme
    | }

<WORKDIR>/uri.mbt:345:8-345:11:
    | /// # Returns
    | ///
    | /// The host as `Some(String)` if present, `None` for relative URIs or URIs without authority.
345 | pub fn Uri::host(self : Uri) -> String? {
    |        ^^^
    |   match self.authority {
    |     Some(auth) => Some(auth.host)

<WORKDIR>/uri.mbt:345:25-345:28:
    | /// # Returns
    | ///
    | /// The host as `Some(String)` if present, `None` for relative URIs or URIs without authority.
345 | pub fn Uri::host(self : Uri) -> String? {
    |                         ^^^
    |   match self.authority {
    |     Some(auth) => Some(auth.host)

<WORKDIR>/uri.mbt:385:8-385:11:
    | /// # See Also
    | ///
    | /// - `effective_port()` - Get the effective port including scheme defaults
385 | pub fn Uri::port(self : Uri) -> Int? {
    |        ^^^
    |   match self.authority {
    |     Some(auth) => auth.port

<WORKDIR>/uri.mbt:385:25-385:28:
    | /// # See Also
    | ///
    | /// - `effective_port()` - Get the effective port including scheme defaults
385 | pub fn Uri::port(self : Uri) -> Int? {
    |                         ^^^
    |   match self.authority {
    |     Some(auth) => auth.port

<WORKDIR>/uri.mbt:430:8-430:11:
    | ///
    | /// - `path_segments()` - Get path as array of segments
    | /// - `with_path()` - Create new URI with different path
430 | pub fn Uri::path(self : Uri) -> String {
    |        ^^^
    |   self.path
    | }

<WORKDIR>/uri.mbt:430:25-430:28:
    | ///
    | /// - `path_segments()` - Get path as array of segments
    | /// - `with_path()` - Create new URI with different path
430 | pub fn Uri::path(self : Uri) -> String {
    |                         ^^^
    |   self.path
    | }

<WORKDIR>/uri.mbt:472:8-472:11:
    | ///
    | /// - `get_query_param()` - Get specific query parameter value
    | /// - `parse_query()` - Parse query string into key-value pairs
472 | pub fn Uri::query(self : Uri) -> String? {
    |        ^^^
    |   self.query
    | }

<WORKDIR>/uri.mbt:472:26-472:29:
    | ///
    | /// - `get_query_param()` - Get specific query parameter value
    | /// - `parse_query()` - Parse query string into key-value pairs
472 | pub fn Uri::query(self : Uri) -> String? {
    |                          ^^^
    |   self.query
    | }

<WORKDIR>/uri.mbt:509:8-509:11:
    | /// # See Also
    | ///
    | /// - `with_fragment()` - Create new URI with different fragment
509 | pub fn Uri::fragment(self : Uri) -> String? {
    |        ^^^
    |   self.fragment
    | }

<WORKDIR>/uri.mbt:509:29-509:32:
    | /// # See Also
    | ///
    | /// - `with_fragment()` - Create new URI with different fragment
509 | pub fn Uri::fragment(self : Uri) -> String? {
    |                             ^^^
    |   self.fragment
    | }

<WORKDIR>/uri.mbt:699:8-699:11:
    | /// # Returns
    | ///
    | /// A new `Uri` with the specified scheme
699 | pub fn Uri::with_scheme(self : Uri, new_scheme : String?) -> Uri {
    |        ^^^
    |   { ..self, scheme: new_scheme }
    | }

<WORKDIR>/uri.mbt:699:32-699:35:
    | /// # Returns
    | ///
    | /// A new `Uri` with the specified scheme
699 | pub fn Uri::with_scheme(self : Uri, new_scheme : String?) -> Uri {
    |                                ^^^
    |   { ..self, scheme: new_scheme }
    | }

<WORKDIR>/uri.mbt:699:62-699:65:
    | /// # Returns
    | ///
    | /// A new `Uri` with the specified scheme
699 | pub fn Uri::with_scheme(self : Uri, new_scheme : String?) -> Uri {
    |                                                              ^^^
    |   { ..self, scheme: new_scheme }
    | }

<WORKDIR>/uri.mbt:736:8-736:11:
    | /// # Returns
    | ///
    | /// A new `Uri` with the specified host
736 | pub fn Uri::with_host(self : Uri, new_host : String?) -> Uri {
    |        ^^^
    |   match new_host {
    |     Some(host) => {

<WORKDIR>/uri.mbt:736:30-736:33:
    | /// # Returns
    | ///
    | /// A new `Uri` with the specified host
736 | pub fn Uri::with_host(self : Uri, new_host : String?) -> Uri {
    |                              ^^^
    |   match new_host {
    |     Some(host) => {

<WORKDIR>/uri.mbt:736:58-736:61:
    | /// # Returns
    | ///
    | /// A new `Uri` with the specified host
736 | pub fn Uri::with_host(self : Uri, new_host : String?) -> Uri {
    |                                                          ^^^
    |   match new_host {
    |     Some(host) => {

<WORKDIR>/uri.mbt:751:8-751:11:
    | 
    | ///|
    | /// Create a new URI with the specified port
751 | pub fn Uri::with_port(self : Uri, new_port : Int?) -> Uri {
    |        ^^^
    |   match self.authority {
    |     Some(auth) => {

<WORKDIR>/uri.mbt:751:30-751:33:
    | 
    | ///|
    | /// Create a new URI with the specified port
751 | pub fn Uri::with_port(self : Uri, new_port : Int?) -> Uri {
    |                              ^^^
    |   match self.authority {
    |     Some(auth) => {

<WORKDIR>/uri.mbt:751:55-751:58:
    | 
    | ///|
    | /// Create a new URI with the specified port
751 | pub fn Uri::with_port(self : Uri, new_port : Int?) -> Uri {
    |                                                       ^^^
    |   match self.authority {
    |     Some(auth) => {

<WORKDIR>/uri.mbt:774:8-774:11:
    | 
    | ///|
    | /// Create a new URI with the specified path
774 | pub fn Uri::with_path(self : Uri, new_path : String) -> Uri {
    |        ^^^
    |   { ..self, path: new_path }
    | }

<WORKDIR>/uri.mbt:774:30-774:33:
    | 
    | ///|
    | /// Create a new URI with the specified path
774 | pub fn Uri::with_path(self : Uri, new_path : String) -> Uri {
    |                              ^^^
    |   { ..self, path: new_path }
    | }

<WORKDIR>/uri.mbt:774:57-774:60:
    | 
    | ///|
    | /// Create a new URI with the specified path
774 | pub fn Uri::with_path(self : Uri, new_path : String) -> Uri {
    |                                                         ^^^
    |   { ..self, path: new_path }
    | }

<WORKDIR>/uri.mbt:780:8-780:11:
    | 
    | ///|
    | /// Create a new URI with the specified query
780 | pub fn Uri::with_query(self : Uri, new_query : String?) -> Uri {
    |        ^^^
    |   { ..self, query: new_query }
    | }

<WORKDIR>/uri.mbt:780:31-780:34:
    | 
    | ///|
    | /// Create a new URI with the specified query
780 | pub fn Uri::with_query(self : Uri, new_query : String?) -> Uri {
    |                               ^^^
    |   { ..self, query: new_query }
    | }

<WORKDIR>/uri.mbt:780:60-780:63:
    | 
    | ///|
    | /// Create a new URI with the specified query
780 | pub fn Uri::with_query(self : Uri, new_query : String?) -> Uri {
    |                                                            ^^^
    |   { ..self, query: new_query }
    | }

<WORKDIR>/uri.mbt:786:8-786:11:
    | 
    | ///|
    | /// Create a new URI with the specified fragment
786 | pub fn Uri::with_fragment(self : Uri, new_fragment : String?) -> Uri {
    |        ^^^
    |   { ..self, fragment: new_fragment }
    | }

<WORKDIR>/uri.mbt:786:34-786:37:
    | 
    | ///|
    | /// Create a new URI with the specified fragment
786 | pub fn Uri::with_fragment(self : Uri, new_fragment : String?) -> Uri {
    |                                  ^^^
    |   { ..self, fragment: new_fragment }
    | }

<WORKDIR>/uri.mbt:786:66-786:69:
    | 
    | ///|
    | /// Create a new URI with the specified fragment
786 | pub fn Uri::with_fragment(self : Uri, new_fragment : String?) -> Uri {
    |                                                                  ^^^
    |   { ..self, fragment: new_fragment }
    | }

<WORKDIR>/uri.mbt:792:8-792:11:
    | 
    | ///|
    | /// Check if the URI is absolute (has a scheme) (escaped)
792 | pub fn Uri::is_absolute(self : Uri) -> Bool {
    |        ^^^
    |   match self.scheme {
    |     Some(_) => true

<WORKDIR>/uri.mbt:792:32-792:35:
    | 
    | ///|
    | /// Check if the URI is absolute (has a scheme) (escaped)
792 | pub fn Uri::is_absolute(self : Uri) -> Bool {
    |                                ^^^
    |   match self.scheme {
    |     Some(_) => true

<WORKDIR>/uri.mbt:801:8-801:11:
    | 
    | ///|
    | /// Check if the URI is relative (no scheme) (escaped)
801 | pub fn Uri::is_relative(self : Uri) -> Bool {
    |        ^^^
    |   !self.is_absolute()
    | }

<WORKDIR>/uri.mbt:801:32-801:35:
    | 
    | ///|
    | /// Check if the URI is relative (no scheme) (escaped)
801 | pub fn Uri::is_relative(self : Uri) -> Bool {
    |                                ^^^
    |   !self.is_absolute()
    | }

<WORKDIR>/uri.mbt:827:8-827:11:
    | 
    | ///|
    | /// Get the effective port (explicit port or default port for scheme) (escaped)
827 | pub fn Uri::effective_port(self : Uri) -> Int? {
    |        ^^^
    |   match self.authority {
    |     Some(auth) =>

<WORKDIR>/uri.mbt:827:35-827:38:
    | 
    | ///|
    | /// Get the effective port (explicit port or default port for scheme) (escaped)
827 | pub fn Uri::effective_port(self : Uri) -> Int? {
    |                                   ^^^
    |   match self.authority {
    |     Some(auth) =>

<WORKDIR>/uri.mbt:844:8-844:11:
    | 
    | ///|
    | /// Normalize a URI (remove default ports, normalize path, etc.) (escaped)
844 | pub fn Uri::normalize(self : Uri) -> Uri {
    |        ^^^
    |   let mut normalized = self
    | 

<WORKDIR>/uri.mbt:844:30-844:33:
    | 
    | ///|
    | /// Normalize a URI (remove default ports, normalize path, etc.) (escaped)
844 | pub fn Uri::normalize(self : Uri) -> Uri {
    |                              ^^^
    |   let mut normalized = self
    | 

<WORKDIR>/uri.mbt:844:38-844:41:
    | 
    | ///|
    | /// Normalize a URI (remove default ports, normalize path, etc.) (escaped)
844 | pub fn Uri::normalize(self : Uri) -> Uri {
    |                                      ^^^
    |   let mut normalized = self
    | 

<WORKDIR>/uri.mbt:955:23-955:26:
    | /// # See Also
    | ///
    | /// - RFC3986 Section 5.2 - Reference Resolution
955 | pub fn resolve(base : Uri, relative : Uri) -> Uri raise UriError {
    |                       ^^^
    |   // If relative URI is absolute, return it as-is
    |   if relative.is_absolute() {

<WORKDIR>/uri.mbt:955:39-955:42:
    | /// # See Also
    | ///
    | /// - RFC3986 Section 5.2 - Reference Resolution
955 | pub fn resolve(base : Uri, relative : Uri) -> Uri raise UriError {
    |                                       ^^^
    |   // If relative URI is absolute, return it as-is
    |   if relative.is_absolute() {

<WORKDIR>/uri.mbt:955:47-955:50:
    | /// # See Also
    | ///
    | /// - RFC3986 Section 5.2 - Reference Resolution
955 | pub fn resolve(base : Uri, relative : Uri) -> Uri raise UriError {
    |                                               ^^^
    |   // If relative URI is absolute, return it as-is
    |   if relative.is_absolute() {

<WORKDIR>/uri.mbt:1087:8-1087:11:
     | 
     | ///|
     | /// Get a specific query parameter value
1087 | pub fn Uri::get_query_param(self : Uri, param_name : String) -> String? {
     |        ^^^
     |   match self.query {
     |     Some(query_str) => {

<WORKDIR>/uri.mbt:1087:36-1087:39:
     | 
     | ///|
     | /// Get a specific query parameter value
1087 | pub fn Uri::get_query_param(self : Uri, param_name : String) -> String? {
     |                                    ^^^
     |   match self.query {
     |     Some(query_str) => {

<WORKDIR>/uri.mbt:1105:8-1105:11:
     | 
     | ///|
     | /// Add or update a query parameter
1105 | pub fn Uri::with_query_param(
     |        ^^^
     |   self : Uri,
     |   param_name : String,

<WORKDIR>/uri.mbt:1106:10-1106:13:
     | ///|
     | /// Add or update a query parameter
     | pub fn Uri::with_query_param(
1106 |   self : Uri,
     |          ^^^
     |   param_name : String,
     |   param_value : String,

<WORKDIR>/uri.mbt:1109:6-1109:9:
     |   self : Uri,
     |   param_name : String,
     |   param_value : String,
1109 | ) -> Uri {
     |      ^^^
     |   let current_params = match self.query {
     |     Some(query_str) => parse_query(query_str)

<WORKDIR>/uri.mbt:1145:8-1145:11:
     | 
     | ///|
     | /// Remove a query parameter
1145 | pub fn Uri::remove_query_param(self : Uri, param_name : String) -> Uri {
     |        ^^^
     |   match self.query {
     |     Some(query_str) => {

<WORKDIR>/uri.mbt:1145:39-1145:42:
     | 
     | ///|
     | /// Remove a query parameter
1145 | pub fn Uri::remove_query_param(self : Uri, param_name : String) -> Uri {
     |                                       ^^^
     |   match self.query {
     |     Some(query_str) => {

<WORKDIR>/uri.mbt:1145:68-1145:71:
     | 
     | ///|
     | /// Remove a query parameter
1145 | pub fn Uri::remove_query_param(self : Uri, param_name : String) -> Uri {
     |                                                                    ^^^
     |   match self.query {
     |     Some(query_str) => {

<WORKDIR>/uri.mbt:1209:8-1209:11:
     | /// # See Also
     | ///
     | /// - `decode()` - Decode percent-encoded strings
1209 | pub fn Uri::encode(input : String) -> String {
     |        ^^^
     |   let mut result = ""
     | 

<WORKDIR>/uri.mbt:1269:8-1269:11:
     | /// # See Also
     | ///
     | /// - `encode()` - Encode strings for safe URI usage
1269 | pub fn Uri::decode(input : String) -> String {
     |        ^^^
     |   let mut result = ""
     |   let mut i = 0

<WORKDIR>/uri.mbt:1324:8-1324:11:
     | /// # Returns
     | ///
     | /// Array of key-value pairs
1324 | pub fn Uri::parse_query(query_string : String) -> Array[(String, String)] {
     |        ^^^
     |   if query_string.length() == 0 {
     |     return []

<WORKDIR>/uri.mbt:1337:19-1337:22:
     |     if pair_str.contains("=") {
     |       let parts = pair_str.split("=").collect()
     |       if parts.length() >= 2 {
1337 |         let key = Uri::decode(parts[0].to_owned())
     |                   ^^^
     |         let value = Uri::decode(parts[1].to_owned())
     |         result.push((key, value))

<WORKDIR>/uri.mbt:1338:21-1338:24:
     |       let parts = pair_str.split("=").collect()
     |       if parts.length() >= 2 {
     |         let key = Uri::decode(parts[0].to_owned())
1338 |         let value = Uri::decode(parts[1].to_owned())
     |                     ^^^
     |         result.push((key, value))
     |       } else {

<WORKDIR>/uri.mbt:1342:22-1342:25:
     |         result.push((key, value))
     |       } else {
     |         // No equals sign, treat as key with empty value
1342 |         result.push((Uri::decode(pair_str), ""))
     |                      ^^^
     |       }
     |     } else {

<WORKDIR>/uri.mbt:1346:20-1346:23:
     |       }
     |     } else {
     |       // No equals sign, treat as key with empty value
1346 |       result.push((Uri::decode(pair_str), ""))
     |                    ^^^
     |     }
     |   }

<WORKDIR>/uri.mbt:1370:8-1370:11:
     | /// # Returns
     | ///
     | /// Encoded query string
1370 | pub fn Uri::build_query(pairs : Array[(String, String)]) -> String {
     |        ^^^
     |   let parts : Array[String] = []
     | 

<WORKDIR>/uri.mbt:1375:23-1375:26:
     | 
     |   for i = 0; i < pairs.length(); i = i + 1 {
     |     let (key, value) = pairs[i]
1375 |     let encoded_key = Uri::encode(key)
     |                       ^^^
     |     if value.length() == 0 {
     |       parts.push(encoded_key)

<WORKDIR>/uri.mbt:1379:27-1379:30:
     |     if value.length() == 0 {
     |       parts.push(encoded_key)
     |     } else {
1379 |       let encoded_value = Uri::encode(value)
     |                           ^^^
     |       parts.push(encoded_key + "=" + encoded_value)
     |     }

<WORKDIR>/uri.mbt:1402:8-1402:11:
     | /// # Returns
     | ///
     | /// Array of path segments (excluding empty segments from leading/trailing slashes) (escaped)
1402 | pub fn Uri::path_segments(self : Uri) -> Array[String] {
     |        ^^^
     |   if self.path.length() == 0 {
     |     return []

<WORKDIR>/uri.mbt:1402:34-1402:37:
     | /// # Returns
     | ///
     | /// Array of path segments (excluding empty segments from leading/trailing slashes) (escaped)
1402 | pub fn Uri::path_segments(self : Uri) -> Array[String] {
     |                                  ^^^
     |   if self.path.length() == 0 {
     |     return []

<WORKDIR>/uri.mbt:1413:19-1413:22:
     |   for segment in segments {
     |     let seg_str = segment.to_owned()
     |     if seg_str.length() > 0 {
1413 |       result.push(Uri::decode(seg_str))
     |                   ^^^
     |     }
     |   }

<WORKDIR>/uri.mbt:1437:8-1437:11:
     | /// # Returns
     | ///
     | /// New URI with the specified path segments
1437 | pub fn Uri::with_path_segments(self : Uri, segments : Array[String]) -> Uri {
     |        ^^^
     |   if segments.length() == 0 {
     |     return { ..self, path: "" }

<WORKDIR>/uri.mbt:1437:39-1437:42:
     | /// # Returns
     | ///
     | /// New URI with the specified path segments
1437 | pub fn Uri::with_path_segments(self : Uri, segments : Array[String]) -> Uri {
     |                                       ^^^
     |   if segments.length() == 0 {
     |     return { ..self, path: "" }

<WORKDIR>/uri.mbt:1437:73-1437:76:
     | /// # Returns
     | ///
     | /// New URI with the specified path segments
1437 | pub fn Uri::with_path_segments(self : Uri, segments : Array[String]) -> Uri {
     |                                                                         ^^^
     |   if segments.length() == 0 {
     |     return { ..self, path: "" }

<WORKDIR>/uri.mbt:1444:27-1444:30:
     | 
     |   let encoded_segments : Array[String] = []
     |   for segment in segments {
1444 |     encoded_segments.push(Uri::encode(segment.to_string()))
     |                           ^^^
     |   }
     | 

<WORKDIR>/uri.mbt:1470:8-1470:11:
     | /// # Returns
     | ///
     | /// Optional tuple of (username, optional password) (escaped)
1470 | pub fn Uri::userinfo_components(self : Uri) -> (String, String?)? {
     |        ^^^
     |   match self.authority {
     |     Some(auth) =>

<WORKDIR>/uri.mbt:1470:40-1470:43:
     | /// # Returns
     | ///
     | /// Optional tuple of (username, optional password) (escaped)
1470 | pub fn Uri::userinfo_components(self : Uri) -> (String, String?)? {
     |                                        ^^^
     |   match self.authority {
     |     Some(auth) =>

<WORKDIR>/uri.mbt:1478:30-1478:33:
     |           if userinfo.contains(":") {
     |             let parts = userinfo.split(":").collect()
     |             if parts.length() >= 2 {
1478 |               let username = Uri::decode(parts[0].to_owned())
     |                              ^^^
     |               let password = Uri::decode(parts[1].to_owned())
     |               Some((username, Some(password)))

<WORKDIR>/uri.mbt:1479:30-1479:33:
     |             let parts = userinfo.split(":").collect()
     |             if parts.length() >= 2 {
     |               let username = Uri::decode(parts[0].to_owned())
1479 |               let password = Uri::decode(parts[1].to_owned())
     |                              ^^^
     |               Some((username, Some(password)))
     |             } else {

<WORKDIR>/uri.mbt:1482:30-1482:33:
     |               let password = Uri::decode(parts[1].to_owned())
     |               Some((username, Some(password)))
     |             } else {
1482 |               let username = Uri::decode(userinfo)
     |                              ^^^
     |               Some((username, None))
     |             }

<WORKDIR>/uri.mbt:1486:28-1486:31:
     |               Some((username, None))
     |             }
     |           } else {
1486 |             let username = Uri::decode(userinfo)
     |                            ^^^
     |             Some((username, None))
     |           }

<WORKDIR>/uri.mbt:1515:8-1515:11:
     | /// # Returns
     | ///
     | /// New URI with the specified userinfo
1515 | pub fn Uri::with_userinfo(
     |        ^^^
     |   self : Uri,
     |   username : String?,

<WORKDIR>/uri.mbt:1516:10-1516:13:
     | ///
     | /// New URI with the specified userinfo
     | pub fn Uri::with_userinfo(
1516 |   self : Uri,
     |          ^^^
     |   username : String?,
     |   password : String?,

<WORKDIR>/uri.mbt:1519:6-1519:9:
     |   self : Uri,
     |   username : String?,
     |   password : String?,
1519 | ) -> Uri {
     |      ^^^
     |   match username {
     |     Some(user) => {

<WORKDIR>/uri.mbt:1523:23-1523:26:
     |   match username {
     |     Some(user) => {
     |       let userinfo = match password {
1523 |         Some(pass) => Uri::encode(user) + ":" + Uri::encode(pass)
     |                       ^^^
     |         None => Uri::encode(user)
     |       }

<WORKDIR>/uri.mbt:1523:49-1523:52:
     |   match username {
     |     Some(user) => {
     |       let userinfo = match password {
1523 |         Some(pass) => Uri::encode(user) + ":" + Uri::encode(pass)
     |                                                 ^^^
     |         None => Uri::encode(user)
     |       }

<WORKDIR>/uri.mbt:1524:17-1524:20:
     |     Some(user) => {
     |       let userinfo = match password {
     |         Some(pass) => Uri::encode(user) + ":" + Uri::encode(pass)
1524 |         None => Uri::encode(user)
     |                 ^^^
     |       }
     | 

<WORKDIR>/uri_test_new_features.mbt:5:17-5:20:
  | /// Test URL encoding functionality
  | test "url_encoding" {
  |   // Test basic encoding
5 |   let encoded = Uri::encode("hello world!")
  |                 ^^^
  |   json_inspect(encoded, content="hello%20world%21")
  | 

<WORKDIR>/uri_test_new_features.mbt:10:28-10:31:
   | 
   |   // Test unreserved characters (should not be encoded) (escaped)
   |   let unreserved = "hello-world_123.test~"
10 |   let encoded_unreserved = Uri::encode(unreserved)
   |                            ^^^
   |   json_inspect(encoded_unreserved, content="hello-world_123.test~")
   | 

<WORKDIR>/uri_test_new_features.mbt:15:25-15:28:
   | 
   |   // Test special characters
   |   let special = "user@domain.com:password"
15 |   let encoded_special = Uri::encode(special)
   |                         ^^^
   |   json_inspect(encoded_special, content="user%40domain.com%3Apassword")
   | }

<WORKDIR>/uri_test_new_features.mbt:23:17-23:20:
   | /// Test URL decoding functionality
   | test "url_decoding" {
   |   // Test basic decoding
23 |   let decoded = Uri::decode("hello%20world%21")
   |                 ^^^
   |   json_inspect(decoded, content="hello world!")
   | 

<WORKDIR>/uri_test_new_features.mbt:27:21-27:24:
   |   json_inspect(decoded, content="hello world!")
   | 
   |   // Test invalid hex sequences (should be left as-is) (escaped)
27 |   let invalid_hex = Uri::decode("hello%ZZ")
   |                     ^^^
   |   json_inspect(invalid_hex, content="hello%ZZ")
   | 

<WORKDIR>/uri_test_new_features.mbt:31:20-31:23:
   |   json_inspect(invalid_hex, content="hello%ZZ")
   | 
   |   // Test incomplete percent encoding
31 |   let incomplete = Uri::decode("hello%2")
   |                    ^^^
   |   json_inspect(incomplete, content="hello%2")
   | 

<WORKDIR>/uri_test_new_features.mbt:35:15-35:18:
   |   json_inspect(incomplete, content="hello%2")
   | 
   |   // Test mixed content
35 |   let mixed = Uri::decode("user%40domain.com%3Apass%20word")
   |               ^^^
   |   json_inspect(mixed, content="user@domain.com:pass word")
   | }

<WORKDIR>/uri_test_new_features.mbt:43:17-43:20:
   | /// Test URL encoding/decoding round trip
   | test "url_encoding_round_trip" {
   |   let original = "Hello World! @#$%^&*()"
43 |   let encoded = Uri::encode(original)
   |                 ^^^
   |   let decoded = Uri::decode(encoded)
   |   json_inspect(decoded, content="Hello World! @#$%^&*()")

<WORKDIR>/uri_test_new_features.mbt:44:17-44:20:
   | test "url_encoding_round_trip" {
   |   let original = "Hello World! @#$%^&*()"
   |   let encoded = Uri::encode(original)
44 |   let decoded = Uri::decode(encoded)
   |                 ^^^
   |   json_inspect(decoded, content="Hello World! @#$%^&*()")
   | 

<WORKDIR>/uri_test_new_features.mbt:49:25-49:28:
   | 
   |   // Test with Unicode-like content
   |   let unicode_like = "café naïve résumé"
49 |   let encoded_unicode = Uri::encode(unicode_like)
   |                         ^^^
   |   let decoded_unicode = Uri::decode(encoded_unicode)
   |   json_inspect(decoded_unicode, content="café naïve résumé")

<WORKDIR>/uri_test_new_features.mbt:50:25-50:28:
   |   // Test with Unicode-like content
   |   let unicode_like = "café naïve résumé"
   |   let encoded_unicode = Uri::encode(unicode_like)
50 |   let decoded_unicode = Uri::decode(encoded_unicode)
   |                         ^^^
   |   json_inspect(decoded_unicode, content="café naïve résumé")
   | }

<WORKDIR>/uri_test_new_features.mbt:59:16-59:19:
   | test "query_string_parsing" {
   |   // Test basic query parsing
   |   let query = "name=John&age=30&city=New%20York"
59 |   let params = Uri::parse_query(query)
   |                ^^^
   |   json_inspect(params, content=[
   |     ["name", "John"],

<WORKDIR>/uri_test_new_features.mbt:67:22-67:25:
   |   ])
   | 
   |   // Test empty query
67 |   let empty_params = Uri::parse_query("")
   |                      ^^^
   |   json_inspect(empty_params.length(), content=0)
   | 

<WORKDIR>/uri_test_new_features.mbt:72:28-72:31:
   | 
   |   // Test query with empty values
   |   let empty_value_query = "key1=&key2=value2&key3"
72 |   let empty_value_params = Uri::parse_query(empty_value_query)
   |                            ^^^
   |   json_inspect(empty_value_params, content=[
   |     ["key1", ""],

<WORKDIR>/uri_test_new_features.mbt:85:15-85:18:
   | test "query_string_building" {
   |   // Test basic query building
   |   let params = [("name", "John Doe"), ("age", "30"), ("active", "")]
85 |   let query = Uri::build_query(params)
   |               ^^^
   |   json_inspect(query, content="name=John%20Doe&age=30&active")
   | 

<WORKDIR>/uri_test_new_features.mbt:89:21-89:24:
   |   json_inspect(query, content="name=John%20Doe&age=30&active")
   | 
   |   // Test empty params
89 |   let empty_query = Uri::build_query([])
   |                     ^^^
   |   json_inspect(empty_query, content="")
   | 

<WORKDIR>/uri_test_new_features.mbt:97:23-97:26:
   |     ("user@email", "test+value"),
   |     ("key with spaces", "value&more"),
   |   ]
97 |   let special_query = Uri::build_query(special_params)
   |                       ^^^
   |   json_inspect(
   |     special_query,

<WORKDIR>/uri_test_new_features.mbt:298:22-298:25:
    |   )
    | 
    |   // Query should be parsed correctly
298 |   let query_params = Uri::parse_query(uri.query().unwrap_or(""))
    |                      ^^^
    |   json_inspect(query_params, content=[
    |     ["query", "value=with&special"],

```
