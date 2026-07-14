# uri find-references parse uri_test.mbt:5:18

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
$ run_moon_ide moon ide find-references 'parse' --loc 'uri_test.mbt:5:18'
Found 47 references for symbol 'parse':
<WORKDIR>/README.mbt.md:36:18-36:23:
   | ///| (escaped)
   | test "quick_start_example" { (escaped)
   |   // Parse a URI (escaped)
36 |   let uri = @uri.parse("https://example.com:8080/path?query=value#fragment") (escaped)
   |                  ^^^^^ (escaped)
   |   debug_inspect(uri.scheme(), content="Some(\\"https\\")") (escaped)
   |   debug_inspect(uri.host(), content="Some(\\"example.com\\")") (escaped)

<WORKDIR>/README.mbt.md:93:18-93:23:
   | ```moonbit check (escaped)
   | ///| (escaped)
   | test "of_string_example" { (escaped)
93 |   let uri = @uri.parse("https://example.com/path") (escaped)
   |                  ^^^^^ (escaped)
   |   debug_inspect(uri.host(), content="Some(\\"example.com\\")") (escaped)
   | } (escaped)

<WORKDIR>/README.mbt.md:104:18-104:23:
    | ```moonbit check (escaped)
    | ///| (escaped)
    | test "to_string_example" { (escaped)
104 |   let uri = @uri.parse("https://example.com/path") (escaped)
    |                  ^^^^^ (escaped)
    |   let uri_string = uri.to_string() (escaped)
    |   inspect(uri_string, content="https://example.com/path") (escaped)

<WORKDIR>/README.mbt.md:172:18-172:23:
    | ```moonbit check (escaped)
    | ///| (escaped)
    | test "normalize_example" { (escaped)
172 |   let uri = @uri.parse("https://example.com:443/path") (escaped)
    |                  ^^^^^ (escaped)
    |   let normalized = uri.normalize() (escaped)
    |   // Default HTTPS port (443) should be removed (escaped)

<WORKDIR>/README.mbt.md:186:19-186:24:
    | ```moonbit check (escaped)
    | ///| (escaped)
    | test "resolve_example" { (escaped)
186 |   let base = @uri.parse("https://example.com/dir/") (escaped)
    |                   ^^^^^ (escaped)
    |   let relative = @uri.parse("../other/file.html") (escaped)
    |   let resolved = @uri.resolve(base, relative) (escaped)

<WORKDIR>/README.mbt.md:187:23-187:28:
    | ///| (escaped)
    | test "resolve_example" { (escaped)
    |   let base = @uri.parse("https://example.com/dir/") (escaped)
187 |   let relative = @uri.parse("../other/file.html") (escaped)
    |                       ^^^^^ (escaped)
    |   let resolved = @uri.resolve(base, relative) (escaped)
    |   inspect(resolved.to_string(), content="https://example.com/other/file.html") (escaped)

<WORKDIR>/README.mbt.md:202:18-202:23:
    | ```moonbit check (escaped)
    | ///| (escaped)
    | test "parse_http_uri" { (escaped)
202 |   let uri = @uri.parse( (escaped)
    |                  ^^^^^ (escaped)
    |     "https://user:pass@example.com:8080/path?query=value#section", (escaped)
    |   ) (escaped)

<WORKDIR>/README.mbt.md:237:19-237:24:
    | ```moonbit check (escaped)
    | ///| (escaped)
    | test "resolve_relative_uri" { (escaped)
237 |   let base = @uri.parse("https://example.com/docs/guide/") (escaped)
    |                   ^^^^^ (escaped)
    |   let relative = @uri.parse("../api/reference.html") (escaped)
    |  (escaped)

<WORKDIR>/README.mbt.md:238:23-238:28:
    | ///| (escaped)
    | test "resolve_relative_uri" { (escaped)
    |   let base = @uri.parse("https://example.com/docs/guide/") (escaped)
238 |   let relative = @uri.parse("../api/reference.html") (escaped)
    |                       ^^^^^ (escaped)
    |  (escaped)
    |   let resolved = @uri.resolve(base, relative) (escaped)

<WORKDIR>/README.mbt.md:253:18-253:23:
    | ```moonbit check (escaped)
    | ///| (escaped)
    | test "query_parameters" { (escaped)
253 |   let uri = @uri.parse("https://search.example.com/?q=moonbit&lang=en&safe=on") (escaped)
    |                  ^^^^^ (escaped)
    |  (escaped)
    |   match uri.query() { (escaped)

<WORKDIR>/README.mbt.md:276:18-276:23:
    | ```moonbit check (escaped)
    | ///| (escaped)
    | test "ipv6_uri" { (escaped)
276 |   let uri = @uri.parse("http://[2001:db8::1]:8080/path") (escaped)
    |                  ^^^^^ (escaped)
    |   debug_inspect(uri.scheme(), content="Some(\\"http\\")") (escaped)
    |   debug_inspect(uri.host(), content="Some(\\"[2001:db8::1]\\")") (escaped)

<WORKDIR>/README.mbt.md:289:18-289:23:
    | ```moonbit check (escaped)
    | ///| (escaped)
    | test "uri_normalization" { (escaped)
289 |   let uri = @uri.parse("https://example.com:443/./path/../other/./file.html") (escaped)
    |                  ^^^^^ (escaped)
    |   let normalized = uri.normalize() (escaped)
    |  (escaped)

<WORKDIR>/README.mbt.md:326:18-326:23:
    | ///| (escaped)
    | test "error_handling_example" { (escaped)
    |   // Test with a valid but unusual URI (escaped)
326 |   let uri = @uri.parse("custom://example.com") (escaped)
    |                  ^^^^^ (escaped)
    |   debug_inspect(uri.scheme(), content="Some(\\"custom\\")") (escaped)
    |   debug_inspect(uri.host(), content="Some(\\"example.com\\")") (escaped)

<WORKDIR>/uri.mbt:127:8-127:13:
    | /// - `UriError::InvalidScheme` if the scheme is malformed (escaped)
    | /// - `UriError::InvalidAuthority` if the authority is malformed (escaped)
    | /// - Other `UriError` variants for various parsing failures (escaped)
127 | pub fn parse(uri_str : String) -> Uri raise UriError { (escaped)
    |        ^^^^^ (escaped)
    |   if uri_str.length() == 0 { (escaped)
    |     raise EmptyUri (escaped)

<WORKDIR>/uri_test.mbt:5:18-5:23:
  | /// Test basic URI parsing functionality (escaped)
  | test "basic_uri_parsing" { (escaped)
  |   // Test simple HTTP URI (escaped)
5 |   let uri = @uri.parse("https://example.com/path") (escaped)
  |                  ^^^^^ (escaped)
  |   json_inspect(uri, content={ (escaped)
  |     "scheme": "https", (escaped)

<WORKDIR>/uri_test.mbt:61:20-61:25:
   | /// Test path-only URI (escaped)
   | test "path_only_uri" { (escaped)
   |   try { (escaped)
61 |     let uri = @uri.parse("/path/to/resource") (escaped)
   |                    ^^^^^ (escaped)
   |     if uri.scheme() != None { (escaped)
   |       fail("Expected no scheme") (escaped)

<WORKDIR>/uri_test.mbt:80:18-80:23:
   | /// Test empty URI error (escaped)
   | test "empty_uri_error" { (escaped)
   |   try { (escaped)
80 |     let _ = @uri.parse("") (escaped)
   |                  ^^^^^ (escaped)
   |     fail("Expected EmptyUri error") (escaped)
   |   } catch { (escaped)

<WORKDIR>/uri_test.mbt:112:18-112:23:
    | /// Test invalid scheme (escaped)
    | test "invalid_scheme" { (escaped)
    |   try { (escaped)
112 |     let _ = @uri.parse("123invalid://example.com") (escaped)
    |                  ^^^^^ (escaped)
    |     fail("Expected InvalidScheme error") (escaped)
    |   } catch { (escaped)

<WORKDIR>/uri_test.mbt:127:18-127:23:
    | /// Test invalid port (escaped)
    | test "invalid_port" { (escaped)
    |   try { (escaped)
127 |     let _ = @uri.parse("http://example.com:abc/path") (escaped)
    |                  ^^^^^ (escaped)
    |     fail("Expected InvalidPort error") (escaped)
    |   } catch { (escaped)

<WORKDIR>/uri_test.mbt:142:18-142:23:
    | /// Test port out of range (escaped)
    | test "port_out_of_range" { (escaped)
    |   try { (escaped)
142 |     let _ = @uri.parse("http://example.com:99999/path") (escaped)
    |                  ^^^^^ (escaped)
    |     fail("Expected error for port out of range") (escaped)
    |   } catch { (escaped)

<WORKDIR>/uri_test.mbt:154:18-154:23:
    | /// Test invalid path with spaces (escaped)
    | test "invalid_path_spaces" { (escaped)
    |   try { (escaped)
154 |     let _ = @uri.parse("http://example.com/path with spaces") (escaped)
    |                  ^^^^^ (escaped)
    |     fail("Expected error for path with unescaped spaces") (escaped)
    |   } catch { (escaped)

<WORKDIR>/uri_test.mbt:166:18-166:23:
    | /// Test invalid query with spaces (escaped)
    | test "invalid_query_spaces" { (escaped)
    |   try { (escaped)
166 |     let _ = @uri.parse("http://example.com/path?query with spaces") (escaped)
    |                  ^^^^^ (escaped)
    |     fail("Expected error for query with unescaped spaces") (escaped)
    |   } catch { (escaped)

<WORKDIR>/uri_test.mbt:178:18-178:23:
    | /// Test invalid fragment with spaces (escaped)
    | test "invalid_fragment_spaces" { (escaped)
    |   try { (escaped)
178 |     let _ = @uri.parse("http://example.com/path#fragment with spaces") (escaped)
    |                  ^^^^^ (escaped)
    |     fail("Expected error for fragment with unescaped spaces") (escaped)
    |   } catch { (escaped)

<WORKDIR>/uri_test.mbt:190:19-190:24:
    | /// Test URI normalization (escaped)
    | test "uri_normalization" { (escaped)
    |   // Test default port removal (escaped)
190 |   let uri1 = @uri.parse("https://example.com:443/path") (escaped)
    |                   ^^^^^ (escaped)
    |   let normalized1 = uri1.normalize() (escaped)
    |   json_inspect(normalized1, content={ (escaped)

<WORKDIR>/uri_test.mbt:199:19-199:24:
    |   }) (escaped)
    |  (escaped)
    |   // Test path normalization (escaped)
199 |   let uri2 = @uri.parse("http://example.com/./path/../other/./file.html") (escaped)
    |                   ^^^^^ (escaped)
    |   let normalized2 = uri2.normalize() (escaped)
    |   json_inspect(normalized2.path(), content="/other/file.html") (escaped)

<WORKDIR>/uri_test.mbt:207:19-207:24:
    | ///| (escaped)
    | /// Test URI resolution (escaped)
    | test "uri_resolution" { (escaped)
207 |   let base = @uri.parse("https://example.com/docs/guide/") (escaped)
    |                   ^^^^^ (escaped)
    |   let relative = @uri.parse("../api/reference.html") (escaped)
    |  (escaped)

<WORKDIR>/uri_test.mbt:208:23-208:28:
    | /// Test URI resolution (escaped)
    | test "uri_resolution" { (escaped)
    |   let base = @uri.parse("https://example.com/docs/guide/") (escaped)
208 |   let relative = @uri.parse("../api/reference.html") (escaped)
    |                       ^^^^^ (escaped)
    |  (escaped)
    |   try { (escaped)

<WORKDIR>/uri_test.mbt:222:32-222:37:
    |   } (escaped)
    |  (escaped)
    |   // Test absolute relative URI (escaped)
222 |   let absolute_relative = @uri.parse("https://other.com/path") (escaped)
    |                                ^^^^^ (escaped)
    |   try { (escaped)
    |     let resolved = @uri.resolve(base, absolute_relative) (escaped)

<WORKDIR>/uri_test.mbt:236:18-236:23:
    | ///| (escaped)
    | /// Test get query parameter (escaped)
    | test "get_query_parameter" { (escaped)
236 |   let uri = @uri.parse("https://example.com/search?q=moonbit&lang=en&safe=on") (escaped)
    |                  ^^^^^ (escaped)
    |  (escaped)
    |   let param_q = uri.get_query_param("q") (escaped)

<WORKDIR>/uri_test.mbt:249:18-249:23:
    | ///| (escaped)
    | /// Test with query parameter (escaped)
    | test "with_query_parameter" { (escaped)
249 |   let uri = @uri.parse("https://example.com/search?q=test") (escaped)
    |                  ^^^^^ (escaped)
    |  (escaped)
    |   // Update existing parameter (escaped)

<WORKDIR>/uri_test.mbt:265:18-265:23:
    | ///| (escaped)
    | /// Test remove query parameter (escaped)
    | test "remove_query_parameter" { (escaped)
265 |   let uri = @uri.parse("https://example.com/search?q=test&lang=en&safe=on") (escaped)
    |                  ^^^^^ (escaped)
    |  (escaped)
    |   let without_lang = uri.remove_query_param("lang") (escaped)

<WORKDIR>/uri_test.mbt:286:18-286:23:
    | ///| (escaped)
    | /// Test complex URI with userinfo (escaped)
    | test "complex_uri_with_userinfo" { (escaped)
286 |   let uri = @uri.parse( (escaped)
    |                  ^^^^^ (escaped)
    |     "https://user:pass@api.example.com:8080/v1/users?limit=10&offset=0#results", (escaped)
    |   ) (escaped)

<WORKDIR>/uri_test.mbt:306:19-306:24:
    | /// Test effective port (escaped)
    | test "effective_port" { (escaped)
    |   // Explicit port (escaped)
306 |   let uri1 = @uri.parse("https://example.com:8080/path") (escaped)
    |                   ^^^^^ (escaped)
    |   match uri1.effective_port() { (escaped)
    |     Some(port_val) => (escaped)

<WORKDIR>/uri_test.mbt:316:19-316:24:
    |   } (escaped)
    |  (escaped)
    |   // Default port (escaped)
316 |   let uri2 = @uri.parse("https://example.com/path") (escaped)
    |                   ^^^^^ (escaped)
    |   match uri2.effective_port() { (escaped)
    |     Some(port_val) => (escaped)

<WORKDIR>/uri_test.mbt:326:19-326:24:
    |   } (escaped)
    |  (escaped)
    |   // No authority (escaped)
326 |   let uri3 = @uri.parse("/path") (escaped)
    |                   ^^^^^ (escaped)
    |   match uri3.effective_port() { (escaped)
    |     Some(_) => fail("Expected no port for URI without authority") (escaped)

<WORKDIR>/uri_test.mbt:336:18-336:23:
    | ///| (escaped)
    | /// Test Show trait implementation (escaped)
    | test "show_trait_implementation" { (escaped)
336 |   let uri = @uri.parse( (escaped)
    |                  ^^^^^ (escaped)
    |     "https://user:pass@example.com:8080/path?query=value#fragment", (escaped)
    |   ) (escaped)

<WORKDIR>/uri_test_new_features.mbt:108:13-108:18:
    | /// Test path segments functionality (escaped)
    | test "path_segments" { (escaped)
    |   // Test basic path segments (escaped)
108 |   let uri = parse("/path/to/resource") (escaped)
    |             ^^^^^ (escaped)
    |   let segments = uri.path_segments() (escaped)
    |   json_inspect(segments, content=["path", "to", "resource"]) (escaped)

<WORKDIR>/uri_test_new_features.mbt:118:21-118:26:
    |   json_inspect(empty_segments.length(), content=0) (escaped)
    |  (escaped)
    |   // Test path with encoded segments (escaped)
118 |   let encoded_uri = parse("/path/with%20spaces/and%2Bplus") (escaped)
    |                     ^^^^^ (escaped)
    |   let encoded_segments = encoded_uri.path_segments() (escaped)
    |   json_inspect(encoded_segments, content=["path", "with spaces", "and+plus"]) (escaped)

<WORKDIR>/uri_test_new_features.mbt:123:18-123:23:
    |   json_inspect(encoded_segments, content=["path", "with spaces", "and+plus"]) (escaped)
    |  (escaped)
    |   // Test root path (escaped)
123 |   let root_uri = parse("/") (escaped)
    |                  ^^^^^ (escaped)
    |   let root_segments = root_uri.path_segments() (escaped)
    |   json_inspect(root_segments.length(), content=0) (escaped)

<WORKDIR>/uri_test_new_features.mbt:157:23-157:28:
    | /// Test userinfo components parsing (escaped)
    | test "userinfo_components" { (escaped)
    |   // Test username and password (escaped)
157 |   let uri_with_pass = parse("https://user:pass@example.com") (escaped)
    |                       ^^^^^ (escaped)
    |   match uri_with_pass.userinfo_components() { (escaped)
    |     Some((user, Some(pass))) => { (escaped)

<WORKDIR>/uri_test_new_features.mbt:167:23-167:28:
    |   } (escaped)
    |  (escaped)
    |   // Test username only (escaped)
167 |   let uri_user_only = parse("https://user@example.com") (escaped)
    |                       ^^^^^ (escaped)
    |   match uri_user_only.userinfo_components() { (escaped)
    |     Some((user, None)) => json_inspect(user, content="user") (escaped)

<WORKDIR>/uri_test_new_features.mbt:174:21-174:26:
    |   } (escaped)
    |  (escaped)
    |   // Test no userinfo (escaped)
174 |   let uri_no_user = parse("https://example.com") (escaped)
    |                     ^^^^^ (escaped)
    |   match uri_no_user.userinfo_components() { (escaped)
    |     None => () // Expected (escaped)

<WORKDIR>/uri_test_new_features.mbt:181:21-181:26:
    |   } (escaped)
    |  (escaped)
    |   // Test encoded userinfo (escaped)
181 |   let uri_encoded = parse("https://user%40domain:pass%20word@example.com") (escaped)
    |                     ^^^^^ (escaped)
    |   match uri_encoded.userinfo_components() { (escaped)
    |     Some((user, Some(pass))) => { (escaped)

<WORKDIR>/uri_test_new_features.mbt:268:23-268:28:
    | /// Test edge cases and error conditions (escaped)
    | test "edge_cases" { (escaped)
    |   // Test malformed percent encoding in existing functions (escaped)
268 |   let malformed_uri = parse("https://example.com/path%ZZ") (escaped)
    |                       ^^^^^ (escaped)
    |   // Should parse successfully but keep malformed encoding (escaped)
    |   json_inspect(malformed_uri.path(), content="/path%ZZ") (escaped)

<WORKDIR>/uri_test_new_features.mbt:293:13-293:18:
    | /// Test RFC 3986 compliance scenarios (escaped)
    | test "rfc3986_compliance" { (escaped)
    |   // Test reserved characters in different components (escaped)
293 |   let uri = parse( (escaped)
    |             ^^^^^ (escaped)
    |     "https://example.com/path?query=value%3Dwith%26special&other=normal#frag%23ment", (escaped)
    |   ) (escaped)

<WORKDIR>/uri_test_new_features.mbt:305:22-305:27:
    |   ]) (escaped)
    |  (escaped)
    |   // Test case sensitivity in scheme (should be case-insensitive in practice, but we store as-is) (escaped)
305 |   let upper_scheme = parse("HTTPS://example.com") (escaped)
    |                      ^^^^^ (escaped)
    |   json_inspect(upper_scheme.scheme(), content=["HTTPS"]) (escaped)
    |  (escaped)

<WORKDIR>/uri_test_new_features.mbt:309:18-309:23:
    |   json_inspect(upper_scheme.scheme(), content=["HTTPS"]) (escaped)
    |  (escaped)
    |   // Test IPv6 addresses (basic support) (escaped)
309 |   let ipv6_uri = parse("http://[2001:db8::1]:8080/path") (escaped)
    |                  ^^^^^ (escaped)
    |   json_inspect(ipv6_uri.host(), content=["[2001:db8::1]"]) (escaped)
    |   json_inspect(ipv6_uri.port(), content=[8080]) (escaped)

```
