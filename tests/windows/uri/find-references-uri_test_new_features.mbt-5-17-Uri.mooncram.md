# uri find-references Uri uri_test_new_features.mbt:5:17

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\uri' moon ide find-references 'Uri' --loc 'uri_test_new_features.mbt:5:17'
Found 105 references for symbol 'Uri':
<WORKDIR>/uri.mbt:65:12-65:15:
   | ///|
   | /// Keep `uri.to_json()` available in dot form for existing users of this
   | /// published package (the implicit promotion of `impl ToJson` is deprecated).
65 | pub extend Uri with ToJson::{to_json}
   |            ^^^
   | 
   | ///|

<WORKDIR>/uri.mbt:110:19-110:22:
    | /// # Returns
    | ///
    | /// A new `Uri` with all components set to their default values.
110 | pub fn empty() -> Uri {
    |                   ^^^
    |   { scheme: None, authority: None, path: "", query: None, fragment: None, }
    | }

<WORKDIR>/uri.mbt:140:35-140:38:
    | /// - `UriError::InvalidScheme` if the scheme is malformed
    | /// - `UriError::InvalidAuthority` if the authority is malformed
    | /// - Other `UriError` variants for various parsing failures
140 | pub fn parse(uri_str : String) -> Uri raise UriError {
    |                                   ^^^
    |   if uri_str.length() == 0 {
    |     raise EmptyUri

<WORKDIR>/uri.mbt:173:57-173:60:
    | 
    | ///|
    | /// Parse URI with known scheme
173 | fn parse_with_scheme(scheme : String, rest : String) -> Uri raise UriError {
    |                                                         ^^^
    |   let mut uri = empty()
    |   uri = { ..uri, scheme: Some(scheme), }

<WORKDIR>/uri.mbt:244:8-244:11:
    | 
    | ///|
    | /// Convert a Uri structure back to a string representation
244 | pub fn Uri::to_string(self : Uri) -> String {
    |        ^^^
    |   let mut result = ""
    | 

<WORKDIR>/uri.mbt:244:30-244:33:
    | 
    | ///|
    | /// Convert a Uri structure back to a string representation
244 | pub fn Uri::to_string(self : Uri) -> String {
    |                              ^^^
    |   let mut result = ""
    | 

<WORKDIR>/uri.mbt:295:19-295:22:
    | 
    | ///|
    | /// Implement Show trait for Uri to provide standard string representation
295 | pub impl Show for Uri with fn output(self, logger) {
    |                   ^^^
    |   // Use our existing to_string method for the Show implementation
    |   logger.write_string(self.to_string())

<WORKDIR>/uri.mbt:302:12-302:15:
    | 
    | ///|
    | /// Keep `uri.output(logger)` available in dot form for existing users.
302 | pub extend Uri with Show::{output}
    |            ^^^
    | 
    | ///|

<WORKDIR>/uri.mbt:329:8-329:11:
    | /// # Returns
    | ///
    | /// The scheme as `Some(String)` if present, `None` for relative URIs.
329 | pub fn Uri::scheme(self : Uri) -> String? {
    |        ^^^
    |   self.scheme
    | }

<WORKDIR>/uri.mbt:329:27-329:30:
    | /// # Returns
    | ///
    | /// The scheme as `Some(String)` if present, `None` for relative URIs.
329 | pub fn Uri::scheme(self : Uri) -> String? {
    |                           ^^^
    |   self.scheme
    | }

<WORKDIR>/uri.mbt:362:8-362:11:
    | /// # Returns
    | ///
    | /// The host as `Some(String)` if present, `None` for relative URIs or URIs without authority.
362 | pub fn Uri::host(self : Uri) -> String? {
    |        ^^^
    |   match self.authority {
    |     Some(auth) => Some(auth.host)

<WORKDIR>/uri.mbt:362:25-362:28:
    | /// # Returns
    | ///
    | /// The host as `Some(String)` if present, `None` for relative URIs or URIs without authority.
362 | pub fn Uri::host(self : Uri) -> String? {
    |                         ^^^
    |   match self.authority {
    |     Some(auth) => Some(auth.host)

<WORKDIR>/uri.mbt:402:8-402:11:
    | /// # See Also
    | ///
    | /// - `effective_port()` - Get the effective port including scheme defaults
402 | pub fn Uri::port(self : Uri) -> Int? {
    |        ^^^
    |   match self.authority {
    |     Some(auth) => auth.port

<WORKDIR>/uri.mbt:402:25-402:28:
    | /// # See Also
    | ///
    | /// - `effective_port()` - Get the effective port including scheme defaults
402 | pub fn Uri::port(self : Uri) -> Int? {
    |                         ^^^
    |   match self.authority {
    |     Some(auth) => auth.port

<WORKDIR>/uri.mbt:447:8-447:11:
    | ///
    | /// - `path_segments()` - Get path as array of segments
    | /// - `with_path()` - Create new URI with different path
447 | pub fn Uri::path(self : Uri) -> String {
    |        ^^^
    |   self.path
    | }

<WORKDIR>/uri.mbt:447:25-447:28:
    | ///
    | /// - `path_segments()` - Get path as array of segments
    | /// - `with_path()` - Create new URI with different path
447 | pub fn Uri::path(self : Uri) -> String {
    |                         ^^^
    |   self.path
    | }

<WORKDIR>/uri.mbt:489:8-489:11:
    | ///
    | /// - `get_query_param()` - Get specific query parameter value
    | /// - `parse_query()` - Parse query string into key-value pairs
489 | pub fn Uri::query(self : Uri) -> String? {
    |        ^^^
    |   self.query
    | }

<WORKDIR>/uri.mbt:489:26-489:29:
    | ///
    | /// - `get_query_param()` - Get specific query parameter value
    | /// - `parse_query()` - Parse query string into key-value pairs
489 | pub fn Uri::query(self : Uri) -> String? {
    |                          ^^^
    |   self.query
    | }

<WORKDIR>/uri.mbt:526:8-526:11:
    | /// # See Also
    | ///
    | /// - `with_fragment()` - Create new URI with different fragment
526 | pub fn Uri::fragment(self : Uri) -> String? {
    |        ^^^
    |   self.fragment
    | }

<WORKDIR>/uri.mbt:526:29-526:32:
    | /// # See Also
    | ///
    | /// - `with_fragment()` - Create new URI with different fragment
526 | pub fn Uri::fragment(self : Uri) -> String? {
    |                             ^^^
    |   self.fragment
    | }

<WORKDIR>/uri.mbt:716:8-716:11:
    | /// # Returns
    | ///
    | /// A new `Uri` with the specified scheme
716 | pub fn Uri::with_scheme(self : Uri, new_scheme : String?) -> Uri {
    |        ^^^
    |   { ..self, scheme: new_scheme, }
    | }

<WORKDIR>/uri.mbt:716:32-716:35:
    | /// # Returns
    | ///
    | /// A new `Uri` with the specified scheme
716 | pub fn Uri::with_scheme(self : Uri, new_scheme : String?) -> Uri {
    |                                ^^^
    |   { ..self, scheme: new_scheme, }
    | }

<WORKDIR>/uri.mbt:716:62-716:65:
    | /// # Returns
    | ///
    | /// A new `Uri` with the specified scheme
716 | pub fn Uri::with_scheme(self : Uri, new_scheme : String?) -> Uri {
    |                                                              ^^^
    |   { ..self, scheme: new_scheme, }
    | }

<WORKDIR>/uri.mbt:753:8-753:11:
    | /// # Returns
    | ///
    | /// A new `Uri` with the specified host
753 | pub fn Uri::with_host(self : Uri, new_host : String?) -> Uri {
    |        ^^^
    |   match new_host {
    |     Some(host) => {

<WORKDIR>/uri.mbt:753:30-753:33:
    | /// # Returns
    | ///
    | /// A new `Uri` with the specified host
753 | pub fn Uri::with_host(self : Uri, new_host : String?) -> Uri {
    |                              ^^^
    |   match new_host {
    |     Some(host) => {

<WORKDIR>/uri.mbt:753:58-753:61:
    | /// # Returns
    | ///
    | /// A new `Uri` with the specified host
753 | pub fn Uri::with_host(self : Uri, new_host : String?) -> Uri {
    |                                                          ^^^
    |   match new_host {
    |     Some(host) => {

<WORKDIR>/uri.mbt:768:8-768:11:
    | 
    | ///|
    | /// Create a new URI with the specified port
768 | pub fn Uri::with_port(self : Uri, new_port : Int?) -> Uri {
    |        ^^^
    |   match self.authority {
    |     Some(auth) => {

<WORKDIR>/uri.mbt:768:30-768:33:
    | 
    | ///|
    | /// Create a new URI with the specified port
768 | pub fn Uri::with_port(self : Uri, new_port : Int?) -> Uri {
    |                              ^^^
    |   match self.authority {
    |     Some(auth) => {

<WORKDIR>/uri.mbt:768:55-768:58:
    | 
    | ///|
    | /// Create a new URI with the specified port
768 | pub fn Uri::with_port(self : Uri, new_port : Int?) -> Uri {
    |                                                       ^^^
    |   match self.authority {
    |     Some(auth) => {

<WORKDIR>/uri.mbt:791:8-791:11:
    | 
    | ///|
    | /// Create a new URI with the specified path
791 | pub fn Uri::with_path(self : Uri, new_path : String) -> Uri {
    |        ^^^
    |   { ..self, path: new_path, }
    | }

<WORKDIR>/uri.mbt:791:30-791:33:
    | 
    | ///|
    | /// Create a new URI with the specified path
791 | pub fn Uri::with_path(self : Uri, new_path : String) -> Uri {
    |                              ^^^
    |   { ..self, path: new_path, }
    | }

<WORKDIR>/uri.mbt:791:57-791:60:
    | 
    | ///|
    | /// Create a new URI with the specified path
791 | pub fn Uri::with_path(self : Uri, new_path : String) -> Uri {
    |                                                         ^^^
    |   { ..self, path: new_path, }
    | }

<WORKDIR>/uri.mbt:797:8-797:11:
    | 
    | ///|
    | /// Create a new URI with the specified query
797 | pub fn Uri::with_query(self : Uri, new_query : String?) -> Uri {
    |        ^^^
    |   { ..self, query: new_query, }
    | }

<WORKDIR>/uri.mbt:797:31-797:34:
    | 
    | ///|
    | /// Create a new URI with the specified query
797 | pub fn Uri::with_query(self : Uri, new_query : String?) -> Uri {
    |                               ^^^
    |   { ..self, query: new_query, }
    | }

<WORKDIR>/uri.mbt:797:60-797:63:
    | 
    | ///|
    | /// Create a new URI with the specified query
797 | pub fn Uri::with_query(self : Uri, new_query : String?) -> Uri {
    |                                                            ^^^
    |   { ..self, query: new_query, }
    | }

<WORKDIR>/uri.mbt:803:8-803:11:
    | 
    | ///|
    | /// Create a new URI with the specified fragment
803 | pub fn Uri::with_fragment(self : Uri, new_fragment : String?) -> Uri {
    |        ^^^
    |   { ..self, fragment: new_fragment, }
    | }

<WORKDIR>/uri.mbt:803:34-803:37:
    | 
    | ///|
    | /// Create a new URI with the specified fragment
803 | pub fn Uri::with_fragment(self : Uri, new_fragment : String?) -> Uri {
    |                                  ^^^
    |   { ..self, fragment: new_fragment, }
    | }

<WORKDIR>/uri.mbt:803:66-803:69:
    | 
    | ///|
    | /// Create a new URI with the specified fragment
803 | pub fn Uri::with_fragment(self : Uri, new_fragment : String?) -> Uri {
    |                                                                  ^^^
    |   { ..self, fragment: new_fragment, }
    | }

<WORKDIR>/uri.mbt:809:8-809:11:
    | 
    | ///|
    | /// Check if the URI is absolute (has a scheme)
809 | pub fn Uri::is_absolute(self : Uri) -> Bool {
    |        ^^^
    |   match self.scheme {
    |     Some(_) => true

<WORKDIR>/uri.mbt:809:32-809:35:
    | 
    | ///|
    | /// Check if the URI is absolute (has a scheme)
809 | pub fn Uri::is_absolute(self : Uri) -> Bool {
    |                                ^^^
    |   match self.scheme {
    |     Some(_) => true

<WORKDIR>/uri.mbt:818:8-818:11:
    | 
    | ///|
    | /// Check if the URI is relative (no scheme)
818 | pub fn Uri::is_relative(self : Uri) -> Bool {
    |        ^^^
    |   !self.is_absolute()
    | }

<WORKDIR>/uri.mbt:818:32-818:35:
    | 
    | ///|
    | /// Check if the URI is relative (no scheme)
818 | pub fn Uri::is_relative(self : Uri) -> Bool {
    |                                ^^^
    |   !self.is_absolute()
    | }

<WORKDIR>/uri.mbt:844:8-844:11:
    | 
    | ///|
    | /// Get the effective port (explicit port or default port for scheme)
844 | pub fn Uri::effective_port(self : Uri) -> Int? {
    |        ^^^
    |   match self.authority {
    |     Some(auth) =>

<WORKDIR>/uri.mbt:844:35-844:38:
    | 
    | ///|
    | /// Get the effective port (explicit port or default port for scheme)
844 | pub fn Uri::effective_port(self : Uri) -> Int? {
    |                                   ^^^
    |   match self.authority {
    |     Some(auth) =>

<WORKDIR>/uri.mbt:861:8-861:11:
    | 
    | ///|
    | /// Normalize a URI (remove default ports, normalize path, etc.)
861 | pub fn Uri::normalize(self : Uri) -> Uri {
    |        ^^^
    |   let mut normalized = self
    | 

<WORKDIR>/uri.mbt:861:30-861:33:
    | 
    | ///|
    | /// Normalize a URI (remove default ports, normalize path, etc.)
861 | pub fn Uri::normalize(self : Uri) -> Uri {
    |                              ^^^
    |   let mut normalized = self
    | 

<WORKDIR>/uri.mbt:861:38-861:41:
    | 
    | ///|
    | /// Normalize a URI (remove default ports, normalize path, etc.)
861 | pub fn Uri::normalize(self : Uri) -> Uri {
    |                                      ^^^
    |   let mut normalized = self
    | 

<WORKDIR>/uri.mbt:972:23-972:26:
    | /// # See Also
    | ///
    | /// - RFC3986 Section 5.2 - Reference Resolution
972 | pub fn resolve(base : Uri, relative : Uri) -> Uri raise UriError {
    |                       ^^^
    |   // If relative URI is absolute, return it as-is
    |   if relative.is_absolute() {

<WORKDIR>/uri.mbt:972:39-972:42:
    | /// # See Also
    | ///
    | /// - RFC3986 Section 5.2 - Reference Resolution
972 | pub fn resolve(base : Uri, relative : Uri) -> Uri raise UriError {
    |                                       ^^^
    |   // If relative URI is absolute, return it as-is
    |   if relative.is_absolute() {

<WORKDIR>/uri.mbt:972:47-972:50:
    | /// # See Also
    | ///
    | /// - RFC3986 Section 5.2 - Reference Resolution
972 | pub fn resolve(base : Uri, relative : Uri) -> Uri raise UriError {
    |                                               ^^^
    |   // If relative URI is absolute, return it as-is
    |   if relative.is_absolute() {

<WORKDIR>/uri.mbt:1104:8-1104:11:
     | 
     | ///|
     | /// Get a specific query parameter value
1104 | pub fn Uri::get_query_param(self : Uri, param_name : String) -> String? {
     |        ^^^
     |   match self.query {
     |     Some(query_str) => {

<WORKDIR>/uri.mbt:1104:36-1104:39:
     | 
     | ///|
     | /// Get a specific query parameter value
1104 | pub fn Uri::get_query_param(self : Uri, param_name : String) -> String? {
     |                                    ^^^
     |   match self.query {
     |     Some(query_str) => {

<WORKDIR>/uri.mbt:1122:8-1122:11:
     | 
     | ///|
     | /// Add or update a query parameter
1122 | pub fn Uri::with_query_param(
     |        ^^^
     |   self : Uri,
     |   param_name : String,

<WORKDIR>/uri.mbt:1123:10-1123:13:
     | ///|
     | /// Add or update a query parameter
     | pub fn Uri::with_query_param(
1123 |   self : Uri,
     |          ^^^
     |   param_name : String,
     |   param_value : String,

<WORKDIR>/uri.mbt:1126:6-1126:9:
     |   self : Uri,
     |   param_name : String,
     |   param_value : String,
1126 | ) -> Uri {
     |      ^^^
     |   let current_params = match self.query {
     |     Some(query_str) => parse_query(query_str)

<WORKDIR>/uri.mbt:1162:8-1162:11:
     | 
     | ///|
     | /// Remove a query parameter
1162 | pub fn Uri::remove_query_param(self : Uri, param_name : String) -> Uri {
     |        ^^^
     |   match self.query {
     |     Some(query_str) => {

<WORKDIR>/uri.mbt:1162:39-1162:42:
     | 
     | ///|
     | /// Remove a query parameter
1162 | pub fn Uri::remove_query_param(self : Uri, param_name : String) -> Uri {
     |                                       ^^^
     |   match self.query {
     |     Some(query_str) => {

<WORKDIR>/uri.mbt:1162:68-1162:71:
     | 
     | ///|
     | /// Remove a query parameter
1162 | pub fn Uri::remove_query_param(self : Uri, param_name : String) -> Uri {
     |                                                                    ^^^
     |   match self.query {
     |     Some(query_str) => {

<WORKDIR>/uri.mbt:1226:8-1226:11:
     | /// # See Also
     | ///
     | /// - `decode()` - Decode percent-encoded strings
1226 | pub fn Uri::encode(input : String) -> String {
     |        ^^^
     |   let mut result = ""
     | 

<WORKDIR>/uri.mbt:1286:8-1286:11:
     | /// # See Also
     | ///
     | /// - `encode()` - Encode strings for safe URI usage
1286 | pub fn Uri::decode(input : String) -> String {
     |        ^^^
     |   let mut result = ""
     |   let mut i = 0

<WORKDIR>/uri.mbt:1341:8-1341:11:
     | /// # Returns
     | ///
     | /// Array of key-value pairs
1341 | pub fn Uri::parse_query(query_string : String) -> Array[(String, String)] {
     |        ^^^
     |   if query_string.length() == 0 {
     |     return []

<WORKDIR>/uri.mbt:1354:19-1354:22:
     |     if pair_str.contains("=") {
     |       let parts = pair_str.split("=").collect()
     |       if parts.length() >= 2 {
1354 |         let key = Uri::decode(parts[0].to_owned())
     |                   ^^^
     |         let value = Uri::decode(parts[1].to_owned())
     |         result.push((key, value))

<WORKDIR>/uri.mbt:1355:21-1355:24:
     |       let parts = pair_str.split("=").collect()
     |       if parts.length() >= 2 {
     |         let key = Uri::decode(parts[0].to_owned())
1355 |         let value = Uri::decode(parts[1].to_owned())
     |                     ^^^
     |         result.push((key, value))
     |       } else {

<WORKDIR>/uri.mbt:1359:22-1359:25:
     |         result.push((key, value))
     |       } else {
     |         // No equals sign, treat as key with empty value
1359 |         result.push((Uri::decode(pair_str), ""))
     |                      ^^^
     |       }
     |     } else {

<WORKDIR>/uri.mbt:1363:20-1363:23:
     |       }
     |     } else {
     |       // No equals sign, treat as key with empty value
1363 |       result.push((Uri::decode(pair_str), ""))
     |                    ^^^
     |     }
     |   }

<WORKDIR>/uri.mbt:1387:8-1387:11:
     | /// # Returns
     | ///
     | /// Encoded query string
1387 | pub fn Uri::build_query(pairs : Array[(String, String)]) -> String {
     |        ^^^
     |   let parts : Array[String] = []
     | 

<WORKDIR>/uri.mbt:1392:23-1392:26:
     | 
     |   for i = 0; i < pairs.length(); i = i + 1 {
     |     let (key, value) = pairs[i]
1392 |     let encoded_key = Uri::encode(key)
     |                       ^^^
     |     if value.length() == 0 {
     |       parts.push(encoded_key)

<WORKDIR>/uri.mbt:1396:27-1396:30:
     |     if value.length() == 0 {
     |       parts.push(encoded_key)
     |     } else {
1396 |       let encoded_value = Uri::encode(value)
     |                           ^^^
     |       parts.push(encoded_key + "=" + encoded_value)
     |     }

<WORKDIR>/uri.mbt:1419:8-1419:11:
     | /// # Returns
     | ///
     | /// Array of path segments (excluding empty segments from leading/trailing slashes)
1419 | pub fn Uri::path_segments(self : Uri) -> Array[String] {
     |        ^^^
     |   if self.path.length() == 0 {
     |     return []

<WORKDIR>/uri.mbt:1419:34-1419:37:
     | /// # Returns
     | ///
     | /// Array of path segments (excluding empty segments from leading/trailing slashes)
1419 | pub fn Uri::path_segments(self : Uri) -> Array[String] {
     |                                  ^^^
     |   if self.path.length() == 0 {
     |     return []

<WORKDIR>/uri.mbt:1430:19-1430:22:
     |   for segment in segments {
     |     let seg_str = segment.to_owned()
     |     if seg_str.length() > 0 {
1430 |       result.push(Uri::decode(seg_str))
     |                   ^^^
     |     }
     |   }

<WORKDIR>/uri.mbt:1454:8-1454:11:
     | /// # Returns
     | ///
     | /// New URI with the specified path segments
1454 | pub fn Uri::with_path_segments(self : Uri, segments : Array[String]) -> Uri {
     |        ^^^
     |   if segments.length() == 0 {
     |     return { ..self, path: "", }

<WORKDIR>/uri.mbt:1454:39-1454:42:
     | /// # Returns
     | ///
     | /// New URI with the specified path segments
1454 | pub fn Uri::with_path_segments(self : Uri, segments : Array[String]) -> Uri {
     |                                       ^^^
     |   if segments.length() == 0 {
     |     return { ..self, path: "", }

<WORKDIR>/uri.mbt:1454:73-1454:76:
     | /// # Returns
     | ///
     | /// New URI with the specified path segments
1454 | pub fn Uri::with_path_segments(self : Uri, segments : Array[String]) -> Uri {
     |                                                                         ^^^
     |   if segments.length() == 0 {
     |     return { ..self, path: "", }

<WORKDIR>/uri.mbt:1461:27-1461:30:
     | 
     |   let encoded_segments : Array[String] = []
     |   for segment in segments {
1461 |     encoded_segments.push(Uri::encode(segment.to_string()))
     |                           ^^^
     |   }
     | 

<WORKDIR>/uri.mbt:1487:8-1487:11:
     | /// # Returns
     | ///
     | /// Optional tuple of (username, optional password)
1487 | pub fn Uri::userinfo_components(self : Uri) -> (String, String?)? {
     |        ^^^
     |   match self.authority {
     |     Some(auth) =>

<WORKDIR>/uri.mbt:1487:40-1487:43:
     | /// # Returns
     | ///
     | /// Optional tuple of (username, optional password)
1487 | pub fn Uri::userinfo_components(self : Uri) -> (String, String?)? {
     |                                        ^^^
     |   match self.authority {
     |     Some(auth) =>

<WORKDIR>/uri.mbt:1495:30-1495:33:
     |           if userinfo.contains(":") {
     |             let parts = userinfo.split(":").collect()
     |             if parts.length() >= 2 {
1495 |               let username = Uri::decode(parts[0].to_owned())
     |                              ^^^
     |               let password = Uri::decode(parts[1].to_owned())
     |               Some((username, Some(password)))

<WORKDIR>/uri.mbt:1496:30-1496:33:
     |             let parts = userinfo.split(":").collect()
     |             if parts.length() >= 2 {
     |               let username = Uri::decode(parts[0].to_owned())
1496 |               let password = Uri::decode(parts[1].to_owned())
     |                              ^^^
     |               Some((username, Some(password)))
     |             } else {

<WORKDIR>/uri.mbt:1499:30-1499:33:
     |               let password = Uri::decode(parts[1].to_owned())
     |               Some((username, Some(password)))
     |             } else {
1499 |               let username = Uri::decode(userinfo)
     |                              ^^^
     |               Some((username, None))
     |             }

<WORKDIR>/uri.mbt:1503:28-1503:31:
     |               Some((username, None))
     |             }
     |           } else {
1503 |             let username = Uri::decode(userinfo)
     |                            ^^^
     |             Some((username, None))
     |           }

<WORKDIR>/uri.mbt:1532:8-1532:11:
     | /// # Returns
     | ///
     | /// New URI with the specified userinfo
1532 | pub fn Uri::with_userinfo(
     |        ^^^
     |   self : Uri,
     |   username : String?,

<WORKDIR>/uri.mbt:1533:10-1533:13:
     | ///
     | /// New URI with the specified userinfo
     | pub fn Uri::with_userinfo(
1533 |   self : Uri,
     |          ^^^
     |   username : String?,
     |   password : String?,

<WORKDIR>/uri.mbt:1536:6-1536:9:
     |   self : Uri,
     |   username : String?,
     |   password : String?,
1536 | ) -> Uri {
     |      ^^^
     |   match username {
     |     Some(user) => {

<WORKDIR>/uri.mbt:1540:23-1540:26:
     |   match username {
     |     Some(user) => {
     |       let userinfo = match password {
1540 |         Some(pass) => Uri::encode(user) + ":" + Uri::encode(pass)
     |                       ^^^
     |         None => Uri::encode(user)
     |       }

<WORKDIR>/uri.mbt:1540:49-1540:52:
     |   match username {
     |     Some(user) => {
     |       let userinfo = match password {
1540 |         Some(pass) => Uri::encode(user) + ":" + Uri::encode(pass)
     |                                                 ^^^
     |         None => Uri::encode(user)
     |       }

<WORKDIR>/uri.mbt:1541:17-1541:20:
     |     Some(user) => {
     |       let userinfo = match password {
     |         Some(pass) => Uri::encode(user) + ":" + Uri::encode(pass)
1541 |         None => Uri::encode(user)
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
