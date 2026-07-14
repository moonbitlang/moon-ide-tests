# uri find-references parse uri_test.mbt:5:18

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
