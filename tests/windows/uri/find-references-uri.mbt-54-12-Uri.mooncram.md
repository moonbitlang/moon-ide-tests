# uri find-references Uri uri.mbt:54:12

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
