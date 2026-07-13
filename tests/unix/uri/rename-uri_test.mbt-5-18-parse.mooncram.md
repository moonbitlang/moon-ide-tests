# uri rename parse uri_test.mbt:5:18

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
$ run_moon_ide moon ide rename 'parse' 'parse_renamed' --loc 'uri_test.mbt:5:18'
*** Begin Patch
*** Update File: <WORKDIR>/README.mbt.md
@@
 ///|
 test "quick_start_example" {
   // Parse a URI
-  let uri = @uri.parse("https://example.com:8080/path?query=value#fragment")
+  let uri = @uri.parse_renamed("https://example.com:8080/path?query=value#fragment")
   debug_inspect(uri.scheme(), content="Some(\"https\")")
   debug_inspect(uri.host(), content="Some(\"example.com\")")
   debug_inspect(uri.port(), content="Some(8080)")
@@
 ```moonbit check
 ///|
 test "of_string_example" {
-  let uri = @uri.parse("https://example.com/path")
+  let uri = @uri.parse_renamed("https://example.com/path")
   debug_inspect(uri.host(), content="Some(\"example.com\")")
 }
 ```
@@
 ```moonbit check
 ///|
 test "to_string_example" {
-  let uri = @uri.parse("https://example.com/path")
+  let uri = @uri.parse_renamed("https://example.com/path")
   let uri_string = uri.to_string()
   inspect(uri_string, content="https://example.com/path")
 }
@@
 ```moonbit check
 ///|
 test "normalize_example" {
-  let uri = @uri.parse("https://example.com:443/path")
+  let uri = @uri.parse_renamed("https://example.com:443/path")
   let normalized = uri.normalize()
   // Default HTTPS port (443) should be removed
   debug_inspect(normalized.port(), content="None")
@@
 ```moonbit check
 ///|
 test "resolve_example" {
-  let base = @uri.parse("https://example.com/dir/")
+  let base = @uri.parse_renamed("https://example.com/dir/")
-  let relative = @uri.parse("../other/file.html")
+  let relative = @uri.parse_renamed("../other/file.html")
   let resolved = @uri.resolve(base, relative)
   inspect(resolved.to_string(), content="https://example.com/other/file.html")
 }
@@
 ```moonbit check
 ///|
 test "parse_http_uri" {
-  let uri = @uri.parse(
+  let uri = @uri.parse_renamed(
     "https://user:pass@example.com:8080/path?query=value#section",
   )
   debug_inspect(uri.scheme(), content="Some(\"https\")")
@@
 ```moonbit check
 ///|
 test "resolve_relative_uri" {
-  let base = @uri.parse("https://example.com/docs/guide/")
+  let base = @uri.parse_renamed("https://example.com/docs/guide/")
-  let relative = @uri.parse("../api/reference.html")
+  let relative = @uri.parse_renamed("../api/reference.html")
 
   let resolved = @uri.resolve(base, relative)
   inspect(
@@
 ```moonbit check
 ///|
 test "query_parameters" {
-  let uri = @uri.parse("https://search.example.com/?q=moonbit&lang=en&safe=on")
+  let uri = @uri.parse_renamed("https://search.example.com/?q=moonbit&lang=en&safe=on")
 
   match uri.query() {
     Some(query_str) => { (escaped)
@@
 ```moonbit check
 ///|
 test "ipv6_uri" {
-  let uri = @uri.parse("http://[2001:db8::1]:8080/path")
+  let uri = @uri.parse_renamed("http://[2001:db8::1]:8080/path")
   debug_inspect(uri.scheme(), content="Some(\"http\")")
   debug_inspect(uri.host(), content="Some(\"[2001:db8::1]\")")
   debug_inspect(uri.port(), content="Some(8080)")
@@
 ```moonbit check
 ///|
 test "uri_normalization" {
-  let uri = @uri.parse("https://example.com:443/./path/../other/./file.html")
+  let uri = @uri.parse_renamed("https://example.com:443/./path/../other/./file.html")
   let normalized = uri.normalize()
 
   // Default HTTPS port (443) should be removed
@@
 ///|
 test "error_handling_example" {
   // Test with a valid but unusual URI
-  let uri = @uri.parse("custom://example.com")
+  let uri = @uri.parse_renamed("custom://example.com")
   debug_inspect(uri.scheme(), content="Some(\"custom\")")
   debug_inspect(uri.host(), content="Some(\"example.com\")")
 }
*** Update File: <WORKDIR>/uri.mbt
@@
 /// - `UriError::InvalidScheme` if the scheme is malformed
 /// - `UriError::InvalidAuthority` if the authority is malformed
 /// - Other `UriError` variants for various parsing failures
-pub fn parse(uri_str : String) -> Uri raise UriError {
+pub fn parse_renamed(uri_str : String) -> Uri raise UriError {
   if uri_str.length() == 0 {
     raise EmptyUri
   }
*** Update File: <WORKDIR>/uri_test.mbt
@@
 /// Test basic URI parsing functionality
 test "basic_uri_parsing" {
   // Test simple HTTP URI
-  let uri = @uri.parse("https://example.com/path")
+  let uri = @uri.parse_renamed("https://example.com/path")
   json_inspect(uri, content={
     "scheme": "https",
     "authority": { "host": "example.com" },
@@
 /// Test path-only URI
 test "path_only_uri" {
   try {
-    let uri = @uri.parse("/path/to/resource")
+    let uri = @uri.parse_renamed("/path/to/resource")
     if uri.scheme() != None {
       fail("Expected no scheme")
     }
@@
 /// Test empty URI error
 test "empty_uri_error" {
   try {
-    let _ = @uri.parse("")
+    let _ = @uri.parse_renamed("")
     fail("Expected EmptyUri error")
   } catch {
     @uri.UriError::EmptyUri => () // Expected (escaped)
@@
 /// Test invalid scheme
 test "invalid_scheme" {
   try {
-    let _ = @uri.parse("123invalid://example.com")
+    let _ = @uri.parse_renamed("123invalid://example.com")
     fail("Expected InvalidScheme error")
   } catch {
     @uri.UriError::InvalidScheme(scheme) => (escaped)
@@
 /// Test invalid port
 test "invalid_port" {
   try {
-    let _ = @uri.parse("http://example.com:abc/path")
+    let _ = @uri.parse_renamed("http://example.com:abc/path")
     fail("Expected InvalidPort error")
   } catch {
     @uri.UriError::InvalidPort(port) => (escaped)
@@
 /// Test port out of range
 test "port_out_of_range" {
   try {
-    let _ = @uri.parse("http://example.com:99999/path")
+    let _ = @uri.parse_renamed("http://example.com:99999/path")
     fail("Expected error for port out of range")
   } catch {
     @uri.UriError::InvalidPort(_) => () // Expected (escaped)
@@
 /// Test invalid path with spaces
 test "invalid_path_spaces" {
   try {
-    let _ = @uri.parse("http://example.com/path with spaces")
+    let _ = @uri.parse_renamed("http://example.com/path with spaces")
     fail("Expected error for path with unescaped spaces")
   } catch {
     @uri.UriError::InvalidPath(_) => () // Expected (escaped)
@@
 /// Test invalid query with spaces
 test "invalid_query_spaces" {
   try {
-    let _ = @uri.parse("http://example.com/path?query with spaces")
+    let _ = @uri.parse_renamed("http://example.com/path?query with spaces")
     fail("Expected error for query with unescaped spaces")
   } catch {
     @uri.UriError::InvalidQuery(_) => () // Expected (escaped)
@@
 /// Test invalid fragment with spaces
 test "invalid_fragment_spaces" {
   try {
-    let _ = @uri.parse("http://example.com/path#fragment with spaces")
+    let _ = @uri.parse_renamed("http://example.com/path#fragment with spaces")
     fail("Expected error for fragment with unescaped spaces")
   } catch {
     @uri.UriError::InvalidFragment(_) => () // Expected (escaped)
@@
 /// Test URI normalization
 test "uri_normalization" {
   // Test default port removal
-  let uri1 = @uri.parse("https://example.com:443/path")
+  let uri1 = @uri.parse_renamed("https://example.com:443/path")
   let normalized1 = uri1.normalize()
   json_inspect(normalized1, content={
     "scheme": "https",
@@
   })
 
   // Test path normalization
-  let uri2 = @uri.parse("http://example.com/./path/../other/./file.html")
+  let uri2 = @uri.parse_renamed("http://example.com/./path/../other/./file.html")
   let normalized2 = uri2.normalize()
   json_inspect(normalized2.path(), content="/other/file.html")
 }
@@
 ///|
 /// Test URI resolution
 test "uri_resolution" {
-  let base = @uri.parse("https://example.com/docs/guide/")
+  let base = @uri.parse_renamed("https://example.com/docs/guide/")
-  let relative = @uri.parse("../api/reference.html")
+  let relative = @uri.parse_renamed("../api/reference.html")
 
   try {
     let resolved = @uri.resolve(base, relative)
@@
   }
 
   // Test absolute relative URI
-  let absolute_relative = @uri.parse("https://other.com/path")
+  let absolute_relative = @uri.parse_renamed("https://other.com/path")
   try {
     let resolved = @uri.resolve(base, absolute_relative)
     if resolved.to_string() != "https://other.com/path" {
@@
 ///|
 /// Test get query parameter
 test "get_query_parameter" {
-  let uri = @uri.parse("https://example.com/search?q=moonbit&lang=en&safe=on")
+  let uri = @uri.parse_renamed("https://example.com/search?q=moonbit&lang=en&safe=on")
 
   let param_q = uri.get_query_param("q")
   json_inspect(param_q, content=["moonbit"])
@@
 ///|
 /// Test with query parameter
 test "with_query_parameter" {
-  let uri = @uri.parse("https://example.com/search?q=test")
+  let uri = @uri.parse_renamed("https://example.com/search?q=test")
 
   // Update existing parameter
   let updated = uri.with_query_param("q", "moonbit")
@@
 ///|
 /// Test remove query parameter
 test "remove_query_parameter" {
-  let uri = @uri.parse("https://example.com/search?q=test&lang=en&safe=on")
+  let uri = @uri.parse_renamed("https://example.com/search?q=test&lang=en&safe=on")
 
   let without_lang = uri.remove_query_param("lang")
   match without_lang.get_query_param("lang") {
@@
 ///|
 /// Test complex URI with userinfo
 test "complex_uri_with_userinfo" {
-  let uri = @uri.parse(
+  let uri = @uri.parse_renamed(
     "https://user:pass@api.example.com:8080/v1/users?limit=10&offset=0#results",
   )
   json_inspect(uri, content={
@@
 /// Test effective port
 test "effective_port" {
   // Explicit port
-  let uri1 = @uri.parse("https://example.com:8080/path")
+  let uri1 = @uri.parse_renamed("https://example.com:8080/path")
   match uri1.effective_port() {
     Some(port_val) => (escaped)
       if port_val != 8080 {
@@
   }
 
   // Default port
-  let uri2 = @uri.parse("https://example.com/path")
+  let uri2 = @uri.parse_renamed("https://example.com/path")
   match uri2.effective_port() {
     Some(port_val) => (escaped)
       if port_val != 443 {
@@
   }
 
   // No authority
-  let uri3 = @uri.parse("/path")
+  let uri3 = @uri.parse_renamed("/path")
   match uri3.effective_port() {
     Some(_) => fail("Expected no port for URI without authority") (escaped)
     None => () // Expected (escaped)
@@
 ///|
 /// Test Show trait implementation
 test "show_trait_implementation" {
-  let uri = @uri.parse(
+  let uri = @uri.parse_renamed(
     "https://user:pass@example.com:8080/path?query=value#fragment",
   )
 
*** Update File: <WORKDIR>/uri_test_new_features.mbt
@@
 /// Test path segments functionality
 test "path_segments" {
   // Test basic path segments
-  let uri = parse("/path/to/resource")
+  let uri = parse_renamed("/path/to/resource")
   let segments = uri.path_segments()
   json_inspect(segments, content=["path", "to", "resource"])
 
@@
   json_inspect(empty_segments.length(), content=0)
 
   // Test path with encoded segments
-  let encoded_uri = parse("/path/with%20spaces/and%2Bplus")
+  let encoded_uri = parse_renamed("/path/with%20spaces/and%2Bplus")
   let encoded_segments = encoded_uri.path_segments()
   json_inspect(encoded_segments, content=["path", "with spaces", "and+plus"])
 
   // Test root path
-  let root_uri = parse("/")
+  let root_uri = parse_renamed("/")
   let root_segments = root_uri.path_segments()
   json_inspect(root_segments.length(), content=0)
 }
@@
 /// Test userinfo components parsing
 test "userinfo_components" {
   // Test username and password
-  let uri_with_pass = parse("https://user:pass@example.com")
+  let uri_with_pass = parse_renamed("https://user:pass@example.com")
   match uri_with_pass.userinfo_components() {
     Some((user, Some(pass))) => { (escaped)
       json_inspect(user, content="user")
@@
   }
 
   // Test username only
-  let uri_user_only = parse("https://user@example.com")
+  let uri_user_only = parse_renamed("https://user@example.com")
   match uri_user_only.userinfo_components() {
     Some((user, None)) => json_inspect(user, content="user") (escaped)
     _ => fail("Expected username only") (escaped)
@@
   }
 
   // Test no userinfo
-  let uri_no_user = parse("https://example.com")
+  let uri_no_user = parse_renamed("https://example.com")
   match uri_no_user.userinfo_components() {
     None => () // Expected (escaped)
     _ => fail("Expected no userinfo") (escaped)
@@
   }
 
   // Test encoded userinfo
-  let uri_encoded = parse("https://user%40domain:pass%20word@example.com")
+  let uri_encoded = parse_renamed("https://user%40domain:pass%20word@example.com")
   match uri_encoded.userinfo_components() {
     Some((user, Some(pass))) => { (escaped)
       json_inspect(user, content="user@domain")
@@
 /// Test edge cases and error conditions
 test "edge_cases" {
   // Test malformed percent encoding in existing functions
-  let malformed_uri = parse("https://example.com/path%ZZ")
+  let malformed_uri = parse_renamed("https://example.com/path%ZZ")
   // Should parse successfully but keep malformed encoding
   json_inspect(malformed_uri.path(), content="/path%ZZ")
 
@@
 /// Test RFC 3986 compliance scenarios
 test "rfc3986_compliance" {
   // Test reserved characters in different components
-  let uri = parse(
+  let uri = parse_renamed(
     "https://example.com/path?query=value%3Dwith%26special&other=normal#frag%23ment",
   )
 
@@
   ])
 
   // Test case sensitivity in scheme (should be case-insensitive in practice, but we store as-is)
-  let upper_scheme = parse("HTTPS://example.com")
+  let upper_scheme = parse_renamed("HTTPS://example.com")
   json_inspect(upper_scheme.scheme(), content=["HTTPS"])
 
   // Test IPv6 addresses (basic support)
-  let ipv6_uri = parse("http://[2001:db8::1]:8080/path")
+  let ipv6_uri = parse_renamed("http://[2001:db8::1]:8080/path")
   json_inspect(ipv6_uri.host(), content=["[2001:db8::1]"])
   json_inspect(ipv6_uri.port(), content=[8080])
 }
*** End Patch

```
