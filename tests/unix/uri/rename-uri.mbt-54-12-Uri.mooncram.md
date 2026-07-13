# uri rename Uri uri.mbt:54:12

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
$ run_moon_ide moon ide rename 'Uri' 'UriRenamed' --loc 'uri.mbt:54:12'
*** Begin Patch
*** Update File: <WORKDIR>/uri.mbt
@@
 /// - path: hierarchical path to resource
 /// - query: additional parameters
 /// - fragment: reference to a secondary resource
-pub struct Uri {
+pub struct UriRenamed {
   scheme : String?
   authority : Authority?
   path : String
@@
 /// # Returns
 ///
 /// A new `Uri` with all components set to their default values.
-pub fn empty() -> Uri {
+pub fn empty() -> UriRenamed {
   { scheme: None, authority: None, path: "", query: None, fragment: None }
 }
 
@@
 /// - `UriError::InvalidScheme` if the scheme is malformed
 /// - `UriError::InvalidAuthority` if the authority is malformed
 /// - Other `UriError` variants for various parsing failures
-pub fn parse(uri_str : String) -> Uri raise UriError {
+pub fn parse(uri_str : String) -> UriRenamed raise UriError {
   if uri_str.length() == 0 {
     raise EmptyUri
   }
@@
 
 ///|
 /// Parse URI with known scheme
-fn parse_with_scheme(scheme : String, rest : String) -> Uri raise UriError {
+fn parse_with_scheme(scheme : String, rest : String) -> UriRenamed raise UriError {
   let mut uri = empty()
   uri = { ..uri, scheme: Some(scheme) }
 
@@
 
 ///|
 /// Convert a Uri structure back to a string representation
-pub fn Uri::to_string(self : Uri) -> String {
+pub fn UriRenamed::to_string(self : UriRenamed) -> String {
   let mut result = ""
 
   // Add scheme
@@
 
 ///|
 /// Implement Show trait for Uri to provide standard string representation
-pub impl Show for Uri with output(self, logger) {
+pub impl Show for UriRenamed with output(self, logger) {
   // Use our existing to_string method for the Show implementation
   logger.write_string(self.to_string())
 }
@@
 /// # Returns
 ///
 /// The scheme as `Some(String)` if present, `None` for relative URIs.
-pub fn Uri::scheme(self : Uri) -> String? {
+pub fn UriRenamed::scheme(self : UriRenamed) -> String? {
   self.scheme
 }
 
@@
 /// # Returns
 ///
 /// The host as `Some(String)` if present, `None` for relative URIs or URIs without authority.
-pub fn Uri::host(self : Uri) -> String? {
+pub fn UriRenamed::host(self : UriRenamed) -> String? {
   match self.authority {
     Some(auth) => Some(auth.host) (escaped)
     None => None (escaped)
@@
 /// # See Also
 ///
 /// - `effective_port()` - Get the effective port including scheme defaults
-pub fn Uri::port(self : Uri) -> Int? {
+pub fn UriRenamed::port(self : UriRenamed) -> Int? {
   match self.authority {
     Some(auth) => auth.port (escaped)
     None => None (escaped)
@@
 ///
 /// - `path_segments()` - Get path as array of segments
 /// - `with_path()` - Create new URI with different path
-pub fn Uri::path(self : Uri) -> String {
+pub fn UriRenamed::path(self : UriRenamed) -> String {
   self.path
 }
 
@@
 ///
 /// - `get_query_param()` - Get specific query parameter value
 /// - `parse_query()` - Parse query string into key-value pairs
-pub fn Uri::query(self : Uri) -> String? {
+pub fn UriRenamed::query(self : UriRenamed) -> String? {
   self.query
 }
 
@@
 /// # See Also
 ///
 /// - `with_fragment()` - Create new URI with different fragment
-pub fn Uri::fragment(self : Uri) -> String? {
+pub fn UriRenamed::fragment(self : UriRenamed) -> String? {
   self.fragment
 }
 
@@
 /// # Returns
 ///
 /// A new `Uri` with the specified scheme
-pub fn Uri::with_scheme(self : Uri, new_scheme : String?) -> Uri {
+pub fn UriRenamed::with_scheme(self : UriRenamed, new_scheme : String?) -> UriRenamed {
   { ..self, scheme: new_scheme }
 }
 
@@
 /// # Returns
 ///
 /// A new `Uri` with the specified host
-pub fn Uri::with_host(self : Uri, new_host : String?) -> Uri {
+pub fn UriRenamed::with_host(self : UriRenamed, new_host : String?) -> UriRenamed {
   match new_host {
     Some(host) => { (escaped)
       let new_authority = match self.authority {
@@
 
 ///|
 /// Create a new URI with the specified port
-pub fn Uri::with_port(self : Uri, new_port : Int?) -> Uri {
+pub fn UriRenamed::with_port(self : UriRenamed, new_port : Int?) -> UriRenamed {
   match self.authority {
     Some(auth) => { (escaped)
       let new_authority = Some({ ..auth, port: new_port })
@@
 
 ///|
 /// Create a new URI with the specified path
-pub fn Uri::with_path(self : Uri, new_path : String) -> Uri {
+pub fn UriRenamed::with_path(self : UriRenamed, new_path : String) -> UriRenamed {
   { ..self, path: new_path }
 }
 
 ///|
 /// Create a new URI with the specified query
-pub fn Uri::with_query(self : Uri, new_query : String?) -> Uri {
+pub fn UriRenamed::with_query(self : UriRenamed, new_query : String?) -> UriRenamed {
   { ..self, query: new_query }
 }
 
 ///|
 /// Create a new URI with the specified fragment
-pub fn Uri::with_fragment(self : Uri, new_fragment : String?) -> Uri {
+pub fn UriRenamed::with_fragment(self : UriRenamed, new_fragment : String?) -> UriRenamed {
   { ..self, fragment: new_fragment }
 }
 
 ///|
 /// Check if the URI is absolute (has a scheme)
-pub fn Uri::is_absolute(self : Uri) -> Bool {
+pub fn UriRenamed::is_absolute(self : UriRenamed) -> Bool {
   match self.scheme {
     Some(_) => true (escaped)
     None => false (escaped)
@@
 
 ///|
 /// Check if the URI is relative (no scheme)
-pub fn Uri::is_relative(self : Uri) -> Bool {
+pub fn UriRenamed::is_relative(self : UriRenamed) -> Bool {
   !self.is_absolute()
 }
 
@@
 
 ///|
 /// Get the effective port (explicit port or default port for scheme)
-pub fn Uri::effective_port(self : Uri) -> Int? {
+pub fn UriRenamed::effective_port(self : UriRenamed) -> Int? {
   match self.authority {
     Some(auth) => (escaped)
       match auth.port {
@@
 
 ///|
 /// Normalize a URI (remove default ports, normalize path, etc.)
-pub fn Uri::normalize(self : Uri) -> Uri {
+pub fn UriRenamed::normalize(self : UriRenamed) -> UriRenamed {
   let mut normalized = self
 
   // Remove default port if present
@@
 /// # See Also
 ///
 /// - RFC3986 Section 5.2 - Reference Resolution
-pub fn resolve(base : Uri, relative : Uri) -> Uri raise UriError {
+pub fn resolve(base : UriRenamed, relative : UriRenamed) -> UriRenamed raise UriError {
   // If relative URI is absolute, return it as-is
   if relative.is_absolute() {
     return relative
@@
 
 ///|
 /// Get a specific query parameter value
-pub fn Uri::get_query_param(self : Uri, param_name : String) -> String? {
+pub fn UriRenamed::get_query_param(self : UriRenamed, param_name : String) -> String? {
   match self.query {
     Some(query_str) => { (escaped)
       let params = parse_query(query_str)
@@
 
 ///|
 /// Add or update a query parameter
-pub fn Uri::with_query_param(
+pub fn UriRenamed::with_query_param(
-  self : Uri,
+  self : UriRenamed,
   param_name : String,
   param_value : String,
-) -> Uri {
+) -> UriRenamed {
   let current_params = match self.query {
     Some(query_str) => parse_query(query_str) (escaped)
     None => [] (escaped)
@@
 
 ///|
 /// Remove a query parameter
-pub fn Uri::remove_query_param(self : Uri, param_name : String) -> Uri {
+pub fn UriRenamed::remove_query_param(self : UriRenamed, param_name : String) -> UriRenamed {
   match self.query {
     Some(query_str) => { (escaped)
       let current_params = parse_query(query_str)
@@
 /// # See Also
 ///
 /// - `decode()` - Decode percent-encoded strings
-pub fn Uri::encode(input : String) -> String {
+pub fn UriRenamed::encode(input : String) -> String {
   let mut result = ""
 
   for i = 0; i < input.length(); i = i + 1 {
@@
 /// # See Also
 ///
 /// - `encode()` - Encode strings for safe URI usage
-pub fn Uri::decode(input : String) -> String {
+pub fn UriRenamed::decode(input : String) -> String {
   let mut result = ""
   let mut i = 0
 
@@
 /// # Returns
 ///
 /// Array of key-value pairs
-pub fn Uri::parse_query(query_string : String) -> Array[(String, String)] {
+pub fn UriRenamed::parse_query(query_string : String) -> Array[(String, String)] {
   if query_string.length() == 0 {
     return []
   }
@@
     if pair_str.contains("=") {
       let parts = pair_str.split("=").collect()
       if parts.length() >= 2 {
-        let key = Uri::decode(parts[0].to_owned())
+        let key = UriRenamed::decode(parts[0].to_owned())
-        let value = Uri::decode(parts[1].to_owned())
+        let value = UriRenamed::decode(parts[1].to_owned())
         result.push((key, value))
       } else {
         // No equals sign, treat as key with empty value
-        result.push((Uri::decode(pair_str), ""))
+        result.push((UriRenamed::decode(pair_str), ""))
       }
     } else {
       // No equals sign, treat as key with empty value
-      result.push((Uri::decode(pair_str), ""))
+      result.push((UriRenamed::decode(pair_str), ""))
     }
   }
 
@@
 /// # Returns
 ///
 /// Encoded query string
-pub fn Uri::build_query(pairs : Array[(String, String)]) -> String {
+pub fn UriRenamed::build_query(pairs : Array[(String, String)]) -> String {
   let parts : Array[String] = []
 
   for i = 0; i < pairs.length(); i = i + 1 {
     let (key, value) = pairs[i]
-    let encoded_key = Uri::encode(key)
+    let encoded_key = UriRenamed::encode(key)
     if value.length() == 0 {
       parts.push(encoded_key)
     } else {
-      let encoded_value = Uri::encode(value)
+      let encoded_value = UriRenamed::encode(value)
       parts.push(encoded_key + "=" + encoded_value)
     }
   }
@@
 /// # Returns
 ///
 /// Array of path segments (excluding empty segments from leading/trailing slashes)
-pub fn Uri::path_segments(self : Uri) -> Array[String] {
+pub fn UriRenamed::path_segments(self : UriRenamed) -> Array[String] {
   if self.path.length() == 0 {
     return []
   }
@@
   for segment in segments {
     let seg_str = segment.to_owned()
     if seg_str.length() > 0 {
-      result.push(Uri::decode(seg_str))
+      result.push(UriRenamed::decode(seg_str))
     }
   }
 
@@
 /// # Returns
 ///
 /// New URI with the specified path segments
-pub fn Uri::with_path_segments(self : Uri, segments : Array[String]) -> Uri {
+pub fn UriRenamed::with_path_segments(self : UriRenamed, segments : Array[String]) -> UriRenamed {
   if segments.length() == 0 {
     return { ..self, path: "" }
   }
@@
 
   let encoded_segments : Array[String] = []
   for segment in segments {
-    encoded_segments.push(Uri::encode(segment.to_string()))
+    encoded_segments.push(UriRenamed::encode(segment.to_string()))
   }
 
   let path = "/" + encoded_segments.join("/")
@@
 /// # Returns
 ///
 /// Optional tuple of (username, optional password)
-pub fn Uri::userinfo_components(self : Uri) -> (String, String?)? {
+pub fn UriRenamed::userinfo_components(self : UriRenamed) -> (String, String?)? {
   match self.authority {
     Some(auth) => (escaped)
       match auth.userinfo {
@@
           if userinfo.contains(":") {
             let parts = userinfo.split(":").collect()
             if parts.length() >= 2 {
-              let username = Uri::decode(parts[0].to_owned())
+              let username = UriRenamed::decode(parts[0].to_owned())
-              let password = Uri::decode(parts[1].to_owned())
+              let password = UriRenamed::decode(parts[1].to_owned())
               Some((username, Some(password)))
             } else {
-              let username = Uri::decode(userinfo)
+              let username = UriRenamed::decode(userinfo)
               Some((username, None))
             }
           } else {
-            let username = Uri::decode(userinfo)
+            let username = UriRenamed::decode(userinfo)
             Some((username, None))
           }
         None => None (escaped)
@@
 /// # Returns
 ///
 /// New URI with the specified userinfo
-pub fn Uri::with_userinfo(
+pub fn UriRenamed::with_userinfo(
-  self : Uri,
+  self : UriRenamed,
   username : String?,
   password : String?,
-) -> Uri {
+) -> UriRenamed {
   match username {
     Some(user) => { (escaped)
       let userinfo = match password {
-        Some(pass) => Uri::encode(user) + ":" + Uri::encode(pass) (escaped)
+        Some(pass) => UriRenamed::encode(user) + ":" + UriRenamed::encode(pass) (escaped)
-        None => Uri::encode(user) (escaped)
+        None => UriRenamed::encode(user) (escaped)
       }
 
       let new_authority = match self.authority {
*** Update File: <WORKDIR>/uri_test_new_features.mbt
@@
 /// Test URL encoding functionality
 test "url_encoding" {
   // Test basic encoding
-  let encoded = Uri::encode("hello world!")
+  let encoded = UriRenamed::encode("hello world!")
   json_inspect(encoded, content="hello%20world%21")
 
   // Test unreserved characters (should not be encoded)
   let unreserved = "hello-world_123.test~"
-  let encoded_unreserved = Uri::encode(unreserved)
+  let encoded_unreserved = UriRenamed::encode(unreserved)
   json_inspect(encoded_unreserved, content="hello-world_123.test~")
 
   // Test special characters
   let special = "user@domain.com:password"
-  let encoded_special = Uri::encode(special)
+  let encoded_special = UriRenamed::encode(special)
   json_inspect(encoded_special, content="user%40domain.com%3Apassword")
 }
 
@@
 /// Test URL decoding functionality
 test "url_decoding" {
   // Test basic decoding
-  let decoded = Uri::decode("hello%20world%21")
+  let decoded = UriRenamed::decode("hello%20world%21")
   json_inspect(decoded, content="hello world!")
 
   // Test invalid hex sequences (should be left as-is)
-  let invalid_hex = Uri::decode("hello%ZZ")
+  let invalid_hex = UriRenamed::decode("hello%ZZ")
   json_inspect(invalid_hex, content="hello%ZZ")
 
   // Test incomplete percent encoding
-  let incomplete = Uri::decode("hello%2")
+  let incomplete = UriRenamed::decode("hello%2")
   json_inspect(incomplete, content="hello%2")
 
   // Test mixed content
-  let mixed = Uri::decode("user%40domain.com%3Apass%20word")
+  let mixed = UriRenamed::decode("user%40domain.com%3Apass%20word")
   json_inspect(mixed, content="user@domain.com:pass word")
 }
 
@@
 /// Test URL encoding/decoding round trip
 test "url_encoding_round_trip" {
   let original = "Hello World! @#$%^&*()"
-  let encoded = Uri::encode(original)
+  let encoded = UriRenamed::encode(original)
-  let decoded = Uri::decode(encoded)
+  let decoded = UriRenamed::decode(encoded)
   json_inspect(decoded, content="Hello World! @#$%^&*()")
 
   // Test with Unicode-like content
   let unicode_like = "café naïve résumé"
-  let encoded_unicode = Uri::encode(unicode_like)
+  let encoded_unicode = UriRenamed::encode(unicode_like)
-  let decoded_unicode = Uri::decode(encoded_unicode)
+  let decoded_unicode = UriRenamed::decode(encoded_unicode)
   json_inspect(decoded_unicode, content="café naïve résumé")
 }
 
@@
 test "query_string_parsing" {
   // Test basic query parsing
   let query = "name=John&age=30&city=New%20York"
-  let params = Uri::parse_query(query)
+  let params = UriRenamed::parse_query(query)
   json_inspect(params, content=[
     ["name", "John"],
     ["age", "30"],
@@
   ])
 
   // Test empty query
-  let empty_params = Uri::parse_query("")
+  let empty_params = UriRenamed::parse_query("")
   json_inspect(empty_params.length(), content=0)
 
   // Test query with empty values
   let empty_value_query = "key1=&key2=value2&key3"
-  let empty_value_params = Uri::parse_query(empty_value_query)
+  let empty_value_params = UriRenamed::parse_query(empty_value_query)
   json_inspect(empty_value_params, content=[
     ["key1", ""],
     ["key2", "value2"],
@@
 test "query_string_building" {
   // Test basic query building
   let params = [("name", "John Doe"), ("age", "30"), ("active", "")]
-  let query = Uri::build_query(params)
+  let query = UriRenamed::build_query(params)
   json_inspect(query, content="name=John%20Doe&age=30&active")
 
   // Test empty params
-  let empty_query = Uri::build_query([])
+  let empty_query = UriRenamed::build_query([])
   json_inspect(empty_query, content="")
 
   // Test special characters in keys and values
@@
     ("user@email", "test+value"),
     ("key with spaces", "value&more"),
   ]
-  let special_query = Uri::build_query(special_params)
+  let special_query = UriRenamed::build_query(special_params)
   json_inspect(
     special_query,
     content="user%40email=test%2Bvalue&key%20with%20spaces=value%26more",
@@
   )
 
   // Query should be parsed correctly
-  let query_params = Uri::parse_query(uri.query().unwrap_or(""))
+  let query_params = UriRenamed::parse_query(uri.query().unwrap_or(""))
   json_inspect(query_params, content=[
     ["query", "value=with&special"],
     ["other", "normal"],
*** End Patch

```
