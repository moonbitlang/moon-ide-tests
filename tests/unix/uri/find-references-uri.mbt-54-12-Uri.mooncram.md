# uri find-references Uri uri.mbt:54:12

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
$ run_moon_ide moon ide find-references 'Uri' --loc 'uri.mbt:54:12'
Found 104 references for symbol 'Uri':
<WORKDIR>/uri.mbt:54:12-54:15:
   | /// - path: hierarchical path to resource (escaped)
   | /// - query: additional parameters (escaped)
   | /// - fragment: reference to a secondary resource (escaped)
54 | pub struct Uri { (escaped)
   |            ^^^ (escaped)
   |   scheme : String? (escaped)
   |   authority : Authority? (escaped)

<WORKDIR>/uri.mbt:97:19-97:22:
   | /// # Returns (escaped)
   | /// (escaped)
   | /// A new `Uri` with all components set to their default values. (escaped)
97 | pub fn empty() -> Uri { (escaped)
   |                   ^^^ (escaped)
   |   { scheme: None, authority: None, path: "", query: None, fragment: None } (escaped)
   | } (escaped)

<WORKDIR>/uri.mbt:127:35-127:38:
    | /// - `UriError::InvalidScheme` if the scheme is malformed (escaped)
    | /// - `UriError::InvalidAuthority` if the authority is malformed (escaped)
    | /// - Other `UriError` variants for various parsing failures (escaped)
127 | pub fn parse(uri_str : String) -> Uri raise UriError { (escaped)
    |                                   ^^^ (escaped)
    |   if uri_str.length() == 0 { (escaped)
    |     raise EmptyUri (escaped)

<WORKDIR>/uri.mbt:160:57-160:60:
    |  (escaped)
    | ///| (escaped)
    | /// Parse URI with known scheme (escaped)
160 | fn parse_with_scheme(scheme : String, rest : String) -> Uri raise UriError { (escaped)
    |                                                         ^^^ (escaped)
    |   let mut uri = empty() (escaped)
    |   uri = { ..uri, scheme: Some(scheme) } (escaped)

<WORKDIR>/uri.mbt:231:8-231:11:
    |  (escaped)
    | ///| (escaped)
    | /// Convert a Uri structure back to a string representation (escaped)
231 | pub fn Uri::to_string(self : Uri) -> String { (escaped)
    |        ^^^ (escaped)
    |   let mut result = "" (escaped)
    |  (escaped)

<WORKDIR>/uri.mbt:231:30-231:33:
    |  (escaped)
    | ///| (escaped)
    | /// Convert a Uri structure back to a string representation (escaped)
231 | pub fn Uri::to_string(self : Uri) -> String { (escaped)
    |                              ^^^ (escaped)
    |   let mut result = "" (escaped)
    |  (escaped)

<WORKDIR>/uri.mbt:282:19-282:22:
    |  (escaped)
    | ///| (escaped)
    | /// Implement Show trait for Uri to provide standard string representation (escaped)
282 | pub impl Show for Uri with output(self, logger) { (escaped)
    |                   ^^^ (escaped)
    |   // Use our existing to_string method for the Show implementation (escaped)
    |   logger.write_string(self.to_string()) (escaped)

<WORKDIR>/uri.mbt:312:8-312:11:
    | /// # Returns (escaped)
    | /// (escaped)
    | /// The scheme as `Some(String)` if present, `None` for relative URIs. (escaped)
312 | pub fn Uri::scheme(self : Uri) -> String? { (escaped)
    |        ^^^ (escaped)
    |   self.scheme (escaped)
    | } (escaped)

<WORKDIR>/uri.mbt:312:27-312:30:
    | /// # Returns (escaped)
    | /// (escaped)
    | /// The scheme as `Some(String)` if present, `None` for relative URIs. (escaped)
312 | pub fn Uri::scheme(self : Uri) -> String? { (escaped)
    |                           ^^^ (escaped)
    |   self.scheme (escaped)
    | } (escaped)

<WORKDIR>/uri.mbt:345:8-345:11:
    | /// # Returns (escaped)
    | /// (escaped)
    | /// The host as `Some(String)` if present, `None` for relative URIs or URIs without authority. (escaped)
345 | pub fn Uri::host(self : Uri) -> String? { (escaped)
    |        ^^^ (escaped)
    |   match self.authority { (escaped)
    |     Some(auth) => Some(auth.host) (escaped)

<WORKDIR>/uri.mbt:345:25-345:28:
    | /// # Returns (escaped)
    | /// (escaped)
    | /// The host as `Some(String)` if present, `None` for relative URIs or URIs without authority. (escaped)
345 | pub fn Uri::host(self : Uri) -> String? { (escaped)
    |                         ^^^ (escaped)
    |   match self.authority { (escaped)
    |     Some(auth) => Some(auth.host) (escaped)

<WORKDIR>/uri.mbt:385:8-385:11:
    | /// # See Also (escaped)
    | /// (escaped)
    | /// - `effective_port()` - Get the effective port including scheme defaults (escaped)
385 | pub fn Uri::port(self : Uri) -> Int? { (escaped)
    |        ^^^ (escaped)
    |   match self.authority { (escaped)
    |     Some(auth) => auth.port (escaped)

<WORKDIR>/uri.mbt:385:25-385:28:
    | /// # See Also (escaped)
    | /// (escaped)
    | /// - `effective_port()` - Get the effective port including scheme defaults (escaped)
385 | pub fn Uri::port(self : Uri) -> Int? { (escaped)
    |                         ^^^ (escaped)
    |   match self.authority { (escaped)
    |     Some(auth) => auth.port (escaped)

<WORKDIR>/uri.mbt:430:8-430:11:
    | /// (escaped)
    | /// - `path_segments()` - Get path as array of segments (escaped)
    | /// - `with_path()` - Create new URI with different path (escaped)
430 | pub fn Uri::path(self : Uri) -> String { (escaped)
    |        ^^^ (escaped)
    |   self.path (escaped)
    | } (escaped)

<WORKDIR>/uri.mbt:430:25-430:28:
    | /// (escaped)
    | /// - `path_segments()` - Get path as array of segments (escaped)
    | /// - `with_path()` - Create new URI with different path (escaped)
430 | pub fn Uri::path(self : Uri) -> String { (escaped)
    |                         ^^^ (escaped)
    |   self.path (escaped)
    | } (escaped)

<WORKDIR>/uri.mbt:472:8-472:11:
    | /// (escaped)
    | /// - `get_query_param()` - Get specific query parameter value (escaped)
    | /// - `parse_query()` - Parse query string into key-value pairs (escaped)
472 | pub fn Uri::query(self : Uri) -> String? { (escaped)
    |        ^^^ (escaped)
    |   self.query (escaped)
    | } (escaped)

<WORKDIR>/uri.mbt:472:26-472:29:
    | /// (escaped)
    | /// - `get_query_param()` - Get specific query parameter value (escaped)
    | /// - `parse_query()` - Parse query string into key-value pairs (escaped)
472 | pub fn Uri::query(self : Uri) -> String? { (escaped)
    |                          ^^^ (escaped)
    |   self.query (escaped)
    | } (escaped)

<WORKDIR>/uri.mbt:509:8-509:11:
    | /// # See Also (escaped)
    | /// (escaped)
    | /// - `with_fragment()` - Create new URI with different fragment (escaped)
509 | pub fn Uri::fragment(self : Uri) -> String? { (escaped)
    |        ^^^ (escaped)
    |   self.fragment (escaped)
    | } (escaped)

<WORKDIR>/uri.mbt:509:29-509:32:
    | /// # See Also (escaped)
    | /// (escaped)
    | /// - `with_fragment()` - Create new URI with different fragment (escaped)
509 | pub fn Uri::fragment(self : Uri) -> String? { (escaped)
    |                             ^^^ (escaped)
    |   self.fragment (escaped)
    | } (escaped)

<WORKDIR>/uri.mbt:699:8-699:11:
    | /// # Returns (escaped)
    | /// (escaped)
    | /// A new `Uri` with the specified scheme (escaped)
699 | pub fn Uri::with_scheme(self : Uri, new_scheme : String?) -> Uri { (escaped)
    |        ^^^ (escaped)
    |   { ..self, scheme: new_scheme } (escaped)
    | } (escaped)

<WORKDIR>/uri.mbt:699:32-699:35:
    | /// # Returns (escaped)
    | /// (escaped)
    | /// A new `Uri` with the specified scheme (escaped)
699 | pub fn Uri::with_scheme(self : Uri, new_scheme : String?) -> Uri { (escaped)
    |                                ^^^ (escaped)
    |   { ..self, scheme: new_scheme } (escaped)
    | } (escaped)

<WORKDIR>/uri.mbt:699:62-699:65:
    | /// # Returns (escaped)
    | /// (escaped)
    | /// A new `Uri` with the specified scheme (escaped)
699 | pub fn Uri::with_scheme(self : Uri, new_scheme : String?) -> Uri { (escaped)
    |                                                              ^^^ (escaped)
    |   { ..self, scheme: new_scheme } (escaped)
    | } (escaped)

<WORKDIR>/uri.mbt:736:8-736:11:
    | /// # Returns (escaped)
    | /// (escaped)
    | /// A new `Uri` with the specified host (escaped)
736 | pub fn Uri::with_host(self : Uri, new_host : String?) -> Uri { (escaped)
    |        ^^^ (escaped)
    |   match new_host { (escaped)
    |     Some(host) => { (escaped)

<WORKDIR>/uri.mbt:736:30-736:33:
    | /// # Returns (escaped)
    | /// (escaped)
    | /// A new `Uri` with the specified host (escaped)
736 | pub fn Uri::with_host(self : Uri, new_host : String?) -> Uri { (escaped)
    |                              ^^^ (escaped)
    |   match new_host { (escaped)
    |     Some(host) => { (escaped)

<WORKDIR>/uri.mbt:736:58-736:61:
    | /// # Returns (escaped)
    | /// (escaped)
    | /// A new `Uri` with the specified host (escaped)
736 | pub fn Uri::with_host(self : Uri, new_host : String?) -> Uri { (escaped)
    |                                                          ^^^ (escaped)
    |   match new_host { (escaped)
    |     Some(host) => { (escaped)

<WORKDIR>/uri.mbt:751:8-751:11:
    |  (escaped)
    | ///| (escaped)
    | /// Create a new URI with the specified port (escaped)
751 | pub fn Uri::with_port(self : Uri, new_port : Int?) -> Uri { (escaped)
    |        ^^^ (escaped)
    |   match self.authority { (escaped)
    |     Some(auth) => { (escaped)

<WORKDIR>/uri.mbt:751:30-751:33:
    |  (escaped)
    | ///| (escaped)
    | /// Create a new URI with the specified port (escaped)
751 | pub fn Uri::with_port(self : Uri, new_port : Int?) -> Uri { (escaped)
    |                              ^^^ (escaped)
    |   match self.authority { (escaped)
    |     Some(auth) => { (escaped)

<WORKDIR>/uri.mbt:751:55-751:58:
    |  (escaped)
    | ///| (escaped)
    | /// Create a new URI with the specified port (escaped)
751 | pub fn Uri::with_port(self : Uri, new_port : Int?) -> Uri { (escaped)
    |                                                       ^^^ (escaped)
    |   match self.authority { (escaped)
    |     Some(auth) => { (escaped)

<WORKDIR>/uri.mbt:774:8-774:11:
    |  (escaped)
    | ///| (escaped)
    | /// Create a new URI with the specified path (escaped)
774 | pub fn Uri::with_path(self : Uri, new_path : String) -> Uri { (escaped)
    |        ^^^ (escaped)
    |   { ..self, path: new_path } (escaped)
    | } (escaped)

<WORKDIR>/uri.mbt:774:30-774:33:
    |  (escaped)
    | ///| (escaped)
    | /// Create a new URI with the specified path (escaped)
774 | pub fn Uri::with_path(self : Uri, new_path : String) -> Uri { (escaped)
    |                              ^^^ (escaped)
    |   { ..self, path: new_path } (escaped)
    | } (escaped)

<WORKDIR>/uri.mbt:774:57-774:60:
    |  (escaped)
    | ///| (escaped)
    | /// Create a new URI with the specified path (escaped)
774 | pub fn Uri::with_path(self : Uri, new_path : String) -> Uri { (escaped)
    |                                                         ^^^ (escaped)
    |   { ..self, path: new_path } (escaped)
    | } (escaped)

<WORKDIR>/uri.mbt:780:8-780:11:
    |  (escaped)
    | ///| (escaped)
    | /// Create a new URI with the specified query (escaped)
780 | pub fn Uri::with_query(self : Uri, new_query : String?) -> Uri { (escaped)
    |        ^^^ (escaped)
    |   { ..self, query: new_query } (escaped)
    | } (escaped)

<WORKDIR>/uri.mbt:780:31-780:34:
    |  (escaped)
    | ///| (escaped)
    | /// Create a new URI with the specified query (escaped)
780 | pub fn Uri::with_query(self : Uri, new_query : String?) -> Uri { (escaped)
    |                               ^^^ (escaped)
    |   { ..self, query: new_query } (escaped)
    | } (escaped)

<WORKDIR>/uri.mbt:780:60-780:63:
    |  (escaped)
    | ///| (escaped)
    | /// Create a new URI with the specified query (escaped)
780 | pub fn Uri::with_query(self : Uri, new_query : String?) -> Uri { (escaped)
    |                                                            ^^^ (escaped)
    |   { ..self, query: new_query } (escaped)
    | } (escaped)

<WORKDIR>/uri.mbt:786:8-786:11:
    |  (escaped)
    | ///| (escaped)
    | /// Create a new URI with the specified fragment (escaped)
786 | pub fn Uri::with_fragment(self : Uri, new_fragment : String?) -> Uri { (escaped)
    |        ^^^ (escaped)
    |   { ..self, fragment: new_fragment } (escaped)
    | } (escaped)

<WORKDIR>/uri.mbt:786:34-786:37:
    |  (escaped)
    | ///| (escaped)
    | /// Create a new URI with the specified fragment (escaped)
786 | pub fn Uri::with_fragment(self : Uri, new_fragment : String?) -> Uri { (escaped)
    |                                  ^^^ (escaped)
    |   { ..self, fragment: new_fragment } (escaped)
    | } (escaped)

<WORKDIR>/uri.mbt:786:66-786:69:
    |  (escaped)
    | ///| (escaped)
    | /// Create a new URI with the specified fragment (escaped)
786 | pub fn Uri::with_fragment(self : Uri, new_fragment : String?) -> Uri { (escaped)
    |                                                                  ^^^ (escaped)
    |   { ..self, fragment: new_fragment } (escaped)
    | } (escaped)

<WORKDIR>/uri.mbt:792:8-792:11:
    |  (escaped)
    | ///| (escaped)
    | /// Check if the URI is absolute (has a scheme) (escaped)
792 | pub fn Uri::is_absolute(self : Uri) -> Bool { (escaped)
    |        ^^^ (escaped)
    |   match self.scheme { (escaped)
    |     Some(_) => true (escaped)

<WORKDIR>/uri.mbt:792:32-792:35:
    |  (escaped)
    | ///| (escaped)
    | /// Check if the URI is absolute (has a scheme) (escaped)
792 | pub fn Uri::is_absolute(self : Uri) -> Bool { (escaped)
    |                                ^^^ (escaped)
    |   match self.scheme { (escaped)
    |     Some(_) => true (escaped)

<WORKDIR>/uri.mbt:801:8-801:11:
    |  (escaped)
    | ///| (escaped)
    | /// Check if the URI is relative (no scheme) (escaped)
801 | pub fn Uri::is_relative(self : Uri) -> Bool { (escaped)
    |        ^^^ (escaped)
    |   !self.is_absolute() (escaped)
    | } (escaped)

<WORKDIR>/uri.mbt:801:32-801:35:
    |  (escaped)
    | ///| (escaped)
    | /// Check if the URI is relative (no scheme) (escaped)
801 | pub fn Uri::is_relative(self : Uri) -> Bool { (escaped)
    |                                ^^^ (escaped)
    |   !self.is_absolute() (escaped)
    | } (escaped)

<WORKDIR>/uri.mbt:827:8-827:11:
    |  (escaped)
    | ///| (escaped)
    | /// Get the effective port (explicit port or default port for scheme) (escaped)
827 | pub fn Uri::effective_port(self : Uri) -> Int? { (escaped)
    |        ^^^ (escaped)
    |   match self.authority { (escaped)
    |     Some(auth) => (escaped)

<WORKDIR>/uri.mbt:827:35-827:38:
    |  (escaped)
    | ///| (escaped)
    | /// Get the effective port (explicit port or default port for scheme) (escaped)
827 | pub fn Uri::effective_port(self : Uri) -> Int? { (escaped)
    |                                   ^^^ (escaped)
    |   match self.authority { (escaped)
    |     Some(auth) => (escaped)

<WORKDIR>/uri.mbt:844:8-844:11:
    |  (escaped)
    | ///| (escaped)
    | /// Normalize a URI (remove default ports, normalize path, etc.) (escaped)
844 | pub fn Uri::normalize(self : Uri) -> Uri { (escaped)
    |        ^^^ (escaped)
    |   let mut normalized = self (escaped)
    |  (escaped)

<WORKDIR>/uri.mbt:844:30-844:33:
    |  (escaped)
    | ///| (escaped)
    | /// Normalize a URI (remove default ports, normalize path, etc.) (escaped)
844 | pub fn Uri::normalize(self : Uri) -> Uri { (escaped)
    |                              ^^^ (escaped)
    |   let mut normalized = self (escaped)
    |  (escaped)

<WORKDIR>/uri.mbt:844:38-844:41:
    |  (escaped)
    | ///| (escaped)
    | /// Normalize a URI (remove default ports, normalize path, etc.) (escaped)
844 | pub fn Uri::normalize(self : Uri) -> Uri { (escaped)
    |                                      ^^^ (escaped)
    |   let mut normalized = self (escaped)
    |  (escaped)

<WORKDIR>/uri.mbt:955:23-955:26:
    | /// # See Also (escaped)
    | /// (escaped)
    | /// - RFC3986 Section 5.2 - Reference Resolution (escaped)
955 | pub fn resolve(base : Uri, relative : Uri) -> Uri raise UriError { (escaped)
    |                       ^^^ (escaped)
    |   // If relative URI is absolute, return it as-is (escaped)
    |   if relative.is_absolute() { (escaped)

<WORKDIR>/uri.mbt:955:39-955:42:
    | /// # See Also (escaped)
    | /// (escaped)
    | /// - RFC3986 Section 5.2 - Reference Resolution (escaped)
955 | pub fn resolve(base : Uri, relative : Uri) -> Uri raise UriError { (escaped)
    |                                       ^^^ (escaped)
    |   // If relative URI is absolute, return it as-is (escaped)
    |   if relative.is_absolute() { (escaped)

<WORKDIR>/uri.mbt:955:47-955:50:
    | /// # See Also (escaped)
    | /// (escaped)
    | /// - RFC3986 Section 5.2 - Reference Resolution (escaped)
955 | pub fn resolve(base : Uri, relative : Uri) -> Uri raise UriError { (escaped)
    |                                               ^^^ (escaped)
    |   // If relative URI is absolute, return it as-is (escaped)
    |   if relative.is_absolute() { (escaped)

<WORKDIR>/uri.mbt:1087:8-1087:11:
     |  (escaped)
     | ///| (escaped)
     | /// Get a specific query parameter value (escaped)
1087 | pub fn Uri::get_query_param(self : Uri, param_name : String) -> String? { (escaped)
     |        ^^^ (escaped)
     |   match self.query { (escaped)
     |     Some(query_str) => { (escaped)

<WORKDIR>/uri.mbt:1087:36-1087:39:
     |  (escaped)
     | ///| (escaped)
     | /// Get a specific query parameter value (escaped)
1087 | pub fn Uri::get_query_param(self : Uri, param_name : String) -> String? { (escaped)
     |                                    ^^^ (escaped)
     |   match self.query { (escaped)
     |     Some(query_str) => { (escaped)

<WORKDIR>/uri.mbt:1105:8-1105:11:
     |  (escaped)
     | ///| (escaped)
     | /// Add or update a query parameter (escaped)
1105 | pub fn Uri::with_query_param( (escaped)
     |        ^^^ (escaped)
     |   self : Uri, (escaped)
     |   param_name : String, (escaped)

<WORKDIR>/uri.mbt:1106:10-1106:13:
     | ///| (escaped)
     | /// Add or update a query parameter (escaped)
     | pub fn Uri::with_query_param( (escaped)
1106 |   self : Uri, (escaped)
     |          ^^^ (escaped)
     |   param_name : String, (escaped)
     |   param_value : String, (escaped)

<WORKDIR>/uri.mbt:1109:6-1109:9:
     |   self : Uri, (escaped)
     |   param_name : String, (escaped)
     |   param_value : String, (escaped)
1109 | ) -> Uri { (escaped)
     |      ^^^ (escaped)
     |   let current_params = match self.query { (escaped)
     |     Some(query_str) => parse_query(query_str) (escaped)

<WORKDIR>/uri.mbt:1145:8-1145:11:
     |  (escaped)
     | ///| (escaped)
     | /// Remove a query parameter (escaped)
1145 | pub fn Uri::remove_query_param(self : Uri, param_name : String) -> Uri { (escaped)
     |        ^^^ (escaped)
     |   match self.query { (escaped)
     |     Some(query_str) => { (escaped)

<WORKDIR>/uri.mbt:1145:39-1145:42:
     |  (escaped)
     | ///| (escaped)
     | /// Remove a query parameter (escaped)
1145 | pub fn Uri::remove_query_param(self : Uri, param_name : String) -> Uri { (escaped)
     |                                       ^^^ (escaped)
     |   match self.query { (escaped)
     |     Some(query_str) => { (escaped)

<WORKDIR>/uri.mbt:1145:68-1145:71:
     |  (escaped)
     | ///| (escaped)
     | /// Remove a query parameter (escaped)
1145 | pub fn Uri::remove_query_param(self : Uri, param_name : String) -> Uri { (escaped)
     |                                                                    ^^^ (escaped)
     |   match self.query { (escaped)
     |     Some(query_str) => { (escaped)

<WORKDIR>/uri.mbt:1209:8-1209:11:
     | /// # See Also (escaped)
     | /// (escaped)
     | /// - `decode()` - Decode percent-encoded strings (escaped)
1209 | pub fn Uri::encode(input : String) -> String { (escaped)
     |        ^^^ (escaped)
     |   let mut result = "" (escaped)
     |  (escaped)

<WORKDIR>/uri.mbt:1269:8-1269:11:
     | /// # See Also (escaped)
     | /// (escaped)
     | /// - `encode()` - Encode strings for safe URI usage (escaped)
1269 | pub fn Uri::decode(input : String) -> String { (escaped)
     |        ^^^ (escaped)
     |   let mut result = "" (escaped)
     |   let mut i = 0 (escaped)

<WORKDIR>/uri.mbt:1324:8-1324:11:
     | /// # Returns (escaped)
     | /// (escaped)
     | /// Array of key-value pairs (escaped)
1324 | pub fn Uri::parse_query(query_string : String) -> Array[(String, String)] { (escaped)
     |        ^^^ (escaped)
     |   if query_string.length() == 0 { (escaped)
     |     return [] (escaped)

<WORKDIR>/uri.mbt:1337:19-1337:22:
     |     if pair_str.contains("=") { (escaped)
     |       let parts = pair_str.split("=").collect() (escaped)
     |       if parts.length() >= 2 { (escaped)
1337 |         let key = Uri::decode(parts[0].to_owned()) (escaped)
     |                   ^^^ (escaped)
     |         let value = Uri::decode(parts[1].to_owned()) (escaped)
     |         result.push((key, value)) (escaped)

<WORKDIR>/uri.mbt:1338:21-1338:24:
     |       let parts = pair_str.split("=").collect() (escaped)
     |       if parts.length() >= 2 { (escaped)
     |         let key = Uri::decode(parts[0].to_owned()) (escaped)
1338 |         let value = Uri::decode(parts[1].to_owned()) (escaped)
     |                     ^^^ (escaped)
     |         result.push((key, value)) (escaped)
     |       } else { (escaped)

<WORKDIR>/uri.mbt:1342:22-1342:25:
     |         result.push((key, value)) (escaped)
     |       } else { (escaped)
     |         // No equals sign, treat as key with empty value (escaped)
1342 |         result.push((Uri::decode(pair_str), "")) (escaped)
     |                      ^^^ (escaped)
     |       } (escaped)
     |     } else { (escaped)

<WORKDIR>/uri.mbt:1346:20-1346:23:
     |       } (escaped)
     |     } else { (escaped)
     |       // No equals sign, treat as key with empty value (escaped)
1346 |       result.push((Uri::decode(pair_str), "")) (escaped)
     |                    ^^^ (escaped)
     |     } (escaped)
     |   } (escaped)

<WORKDIR>/uri.mbt:1370:8-1370:11:
     | /// # Returns (escaped)
     | /// (escaped)
     | /// Encoded query string (escaped)
1370 | pub fn Uri::build_query(pairs : Array[(String, String)]) -> String { (escaped)
     |        ^^^ (escaped)
     |   let parts : Array[String] = [] (escaped)
     |  (escaped)

<WORKDIR>/uri.mbt:1375:23-1375:26:
     |  (escaped)
     |   for i = 0; i < pairs.length(); i = i + 1 { (escaped)
     |     let (key, value) = pairs[i] (escaped)
1375 |     let encoded_key = Uri::encode(key) (escaped)
     |                       ^^^ (escaped)
     |     if value.length() == 0 { (escaped)
     |       parts.push(encoded_key) (escaped)

<WORKDIR>/uri.mbt:1379:27-1379:30:
     |     if value.length() == 0 { (escaped)
     |       parts.push(encoded_key) (escaped)
     |     } else { (escaped)
1379 |       let encoded_value = Uri::encode(value) (escaped)
     |                           ^^^ (escaped)
     |       parts.push(encoded_key + "=" + encoded_value) (escaped)
     |     } (escaped)

<WORKDIR>/uri.mbt:1402:8-1402:11:
     | /// # Returns (escaped)
     | /// (escaped)
     | /// Array of path segments (excluding empty segments from leading/trailing slashes) (escaped)
1402 | pub fn Uri::path_segments(self : Uri) -> Array[String] { (escaped)
     |        ^^^ (escaped)
     |   if self.path.length() == 0 { (escaped)
     |     return [] (escaped)

<WORKDIR>/uri.mbt:1402:34-1402:37:
     | /// # Returns (escaped)
     | /// (escaped)
     | /// Array of path segments (excluding empty segments from leading/trailing slashes) (escaped)
1402 | pub fn Uri::path_segments(self : Uri) -> Array[String] { (escaped)
     |                                  ^^^ (escaped)
     |   if self.path.length() == 0 { (escaped)
     |     return [] (escaped)

<WORKDIR>/uri.mbt:1413:19-1413:22:
     |   for segment in segments { (escaped)
     |     let seg_str = segment.to_owned() (escaped)
     |     if seg_str.length() > 0 { (escaped)
1413 |       result.push(Uri::decode(seg_str)) (escaped)
     |                   ^^^ (escaped)
     |     } (escaped)
     |   } (escaped)

<WORKDIR>/uri.mbt:1437:8-1437:11:
     | /// # Returns (escaped)
     | /// (escaped)
     | /// New URI with the specified path segments (escaped)
1437 | pub fn Uri::with_path_segments(self : Uri, segments : Array[String]) -> Uri { (escaped)
     |        ^^^ (escaped)
     |   if segments.length() == 0 { (escaped)
     |     return { ..self, path: "" } (escaped)

<WORKDIR>/uri.mbt:1437:39-1437:42:
     | /// # Returns (escaped)
     | /// (escaped)
     | /// New URI with the specified path segments (escaped)
1437 | pub fn Uri::with_path_segments(self : Uri, segments : Array[String]) -> Uri { (escaped)
     |                                       ^^^ (escaped)
     |   if segments.length() == 0 { (escaped)
     |     return { ..self, path: "" } (escaped)

<WORKDIR>/uri.mbt:1437:73-1437:76:
     | /// # Returns (escaped)
     | /// (escaped)
     | /// New URI with the specified path segments (escaped)
1437 | pub fn Uri::with_path_segments(self : Uri, segments : Array[String]) -> Uri { (escaped)
     |                                                                         ^^^ (escaped)
     |   if segments.length() == 0 { (escaped)
     |     return { ..self, path: "" } (escaped)

<WORKDIR>/uri.mbt:1444:27-1444:30:
     |  (escaped)
     |   let encoded_segments : Array[String] = [] (escaped)
     |   for segment in segments { (escaped)
1444 |     encoded_segments.push(Uri::encode(segment.to_string())) (escaped)
     |                           ^^^ (escaped)
     |   } (escaped)
     |  (escaped)

<WORKDIR>/uri.mbt:1470:8-1470:11:
     | /// # Returns (escaped)
     | /// (escaped)
     | /// Optional tuple of (username, optional password) (escaped)
1470 | pub fn Uri::userinfo_components(self : Uri) -> (String, String?)? { (escaped)
     |        ^^^ (escaped)
     |   match self.authority { (escaped)
     |     Some(auth) => (escaped)

<WORKDIR>/uri.mbt:1470:40-1470:43:
     | /// # Returns (escaped)
     | /// (escaped)
     | /// Optional tuple of (username, optional password) (escaped)
1470 | pub fn Uri::userinfo_components(self : Uri) -> (String, String?)? { (escaped)
     |                                        ^^^ (escaped)
     |   match self.authority { (escaped)
     |     Some(auth) => (escaped)

<WORKDIR>/uri.mbt:1478:30-1478:33:
     |           if userinfo.contains(":") { (escaped)
     |             let parts = userinfo.split(":").collect() (escaped)
     |             if parts.length() >= 2 { (escaped)
1478 |               let username = Uri::decode(parts[0].to_owned()) (escaped)
     |                              ^^^ (escaped)
     |               let password = Uri::decode(parts[1].to_owned()) (escaped)
     |               Some((username, Some(password))) (escaped)

<WORKDIR>/uri.mbt:1479:30-1479:33:
     |             let parts = userinfo.split(":").collect() (escaped)
     |             if parts.length() >= 2 { (escaped)
     |               let username = Uri::decode(parts[0].to_owned()) (escaped)
1479 |               let password = Uri::decode(parts[1].to_owned()) (escaped)
     |                              ^^^ (escaped)
     |               Some((username, Some(password))) (escaped)
     |             } else { (escaped)

<WORKDIR>/uri.mbt:1482:30-1482:33:
     |               let password = Uri::decode(parts[1].to_owned()) (escaped)
     |               Some((username, Some(password))) (escaped)
     |             } else { (escaped)
1482 |               let username = Uri::decode(userinfo) (escaped)
     |                              ^^^ (escaped)
     |               Some((username, None)) (escaped)
     |             } (escaped)

<WORKDIR>/uri.mbt:1486:28-1486:31:
     |               Some((username, None)) (escaped)
     |             } (escaped)
     |           } else { (escaped)
1486 |             let username = Uri::decode(userinfo) (escaped)
     |                            ^^^ (escaped)
     |             Some((username, None)) (escaped)
     |           } (escaped)

<WORKDIR>/uri.mbt:1515:8-1515:11:
     | /// # Returns (escaped)
     | /// (escaped)
     | /// New URI with the specified userinfo (escaped)
1515 | pub fn Uri::with_userinfo( (escaped)
     |        ^^^ (escaped)
     |   self : Uri, (escaped)
     |   username : String?, (escaped)

<WORKDIR>/uri.mbt:1516:10-1516:13:
     | /// (escaped)
     | /// New URI with the specified userinfo (escaped)
     | pub fn Uri::with_userinfo( (escaped)
1516 |   self : Uri, (escaped)
     |          ^^^ (escaped)
     |   username : String?, (escaped)
     |   password : String?, (escaped)

<WORKDIR>/uri.mbt:1519:6-1519:9:
     |   self : Uri, (escaped)
     |   username : String?, (escaped)
     |   password : String?, (escaped)
1519 | ) -> Uri { (escaped)
     |      ^^^ (escaped)
     |   match username { (escaped)
     |     Some(user) => { (escaped)

<WORKDIR>/uri.mbt:1523:23-1523:26:
     |   match username { (escaped)
     |     Some(user) => { (escaped)
     |       let userinfo = match password { (escaped)
1523 |         Some(pass) => Uri::encode(user) + ":" + Uri::encode(pass) (escaped)
     |                       ^^^ (escaped)
     |         None => Uri::encode(user) (escaped)
     |       } (escaped)

<WORKDIR>/uri.mbt:1523:49-1523:52:
     |   match username { (escaped)
     |     Some(user) => { (escaped)
     |       let userinfo = match password { (escaped)
1523 |         Some(pass) => Uri::encode(user) + ":" + Uri::encode(pass) (escaped)
     |                                                 ^^^ (escaped)
     |         None => Uri::encode(user) (escaped)
     |       } (escaped)

<WORKDIR>/uri.mbt:1524:17-1524:20:
     |     Some(user) => { (escaped)
     |       let userinfo = match password { (escaped)
     |         Some(pass) => Uri::encode(user) + ":" + Uri::encode(pass) (escaped)
1524 |         None => Uri::encode(user) (escaped)
     |                 ^^^ (escaped)
     |       } (escaped)
     |  (escaped)

<WORKDIR>/uri_test_new_features.mbt:5:17-5:20:
  | /// Test URL encoding functionality (escaped)
  | test "url_encoding" { (escaped)
  |   // Test basic encoding (escaped)
5 |   let encoded = Uri::encode("hello world!") (escaped)
  |                 ^^^ (escaped)
  |   json_inspect(encoded, content="hello%20world%21") (escaped)
  |  (escaped)

<WORKDIR>/uri_test_new_features.mbt:10:28-10:31:
   |  (escaped)
   |   // Test unreserved characters (should not be encoded) (escaped)
   |   let unreserved = "hello-world_123.test~" (escaped)
10 |   let encoded_unreserved = Uri::encode(unreserved) (escaped)
   |                            ^^^ (escaped)
   |   json_inspect(encoded_unreserved, content="hello-world_123.test~") (escaped)
   |  (escaped)

<WORKDIR>/uri_test_new_features.mbt:15:25-15:28:
   |  (escaped)
   |   // Test special characters (escaped)
   |   let special = "user@domain.com:password" (escaped)
15 |   let encoded_special = Uri::encode(special) (escaped)
   |                         ^^^ (escaped)
   |   json_inspect(encoded_special, content="user%40domain.com%3Apassword") (escaped)
   | } (escaped)

<WORKDIR>/uri_test_new_features.mbt:23:17-23:20:
   | /// Test URL decoding functionality (escaped)
   | test "url_decoding" { (escaped)
   |   // Test basic decoding (escaped)
23 |   let decoded = Uri::decode("hello%20world%21") (escaped)
   |                 ^^^ (escaped)
   |   json_inspect(decoded, content="hello world!") (escaped)
   |  (escaped)

<WORKDIR>/uri_test_new_features.mbt:27:21-27:24:
   |   json_inspect(decoded, content="hello world!") (escaped)
   |  (escaped)
   |   // Test invalid hex sequences (should be left as-is) (escaped)
27 |   let invalid_hex = Uri::decode("hello%ZZ") (escaped)
   |                     ^^^ (escaped)
   |   json_inspect(invalid_hex, content="hello%ZZ") (escaped)
   |  (escaped)

<WORKDIR>/uri_test_new_features.mbt:31:20-31:23:
   |   json_inspect(invalid_hex, content="hello%ZZ") (escaped)
   |  (escaped)
   |   // Test incomplete percent encoding (escaped)
31 |   let incomplete = Uri::decode("hello%2") (escaped)
   |                    ^^^ (escaped)
   |   json_inspect(incomplete, content="hello%2") (escaped)
   |  (escaped)

<WORKDIR>/uri_test_new_features.mbt:35:15-35:18:
   |   json_inspect(incomplete, content="hello%2") (escaped)
   |  (escaped)
   |   // Test mixed content (escaped)
35 |   let mixed = Uri::decode("user%40domain.com%3Apass%20word") (escaped)
   |               ^^^ (escaped)
   |   json_inspect(mixed, content="user@domain.com:pass word") (escaped)
   | } (escaped)

<WORKDIR>/uri_test_new_features.mbt:43:17-43:20:
   | /// Test URL encoding/decoding round trip (escaped)
   | test "url_encoding_round_trip" { (escaped)
   |   let original = "Hello World! @#$%^&*()" (escaped)
43 |   let encoded = Uri::encode(original) (escaped)
   |                 ^^^ (escaped)
   |   let decoded = Uri::decode(encoded) (escaped)
   |   json_inspect(decoded, content="Hello World! @#$%^&*()") (escaped)

<WORKDIR>/uri_test_new_features.mbt:44:17-44:20:
   | test "url_encoding_round_trip" { (escaped)
   |   let original = "Hello World! @#$%^&*()" (escaped)
   |   let encoded = Uri::encode(original) (escaped)
44 |   let decoded = Uri::decode(encoded) (escaped)
   |                 ^^^ (escaped)
   |   json_inspect(decoded, content="Hello World! @#$%^&*()") (escaped)
   |  (escaped)

<WORKDIR>/uri_test_new_features.mbt:49:25-49:28:
   |  (escaped)
   |   // Test with Unicode-like content (escaped)
   |   let unicode_like = "café naïve résumé" (escaped)
49 |   let encoded_unicode = Uri::encode(unicode_like) (escaped)
   |                         ^^^ (escaped)
   |   let decoded_unicode = Uri::decode(encoded_unicode) (escaped)
   |   json_inspect(decoded_unicode, content="café naïve résumé") (escaped)

<WORKDIR>/uri_test_new_features.mbt:50:25-50:28:
   |   // Test with Unicode-like content (escaped)
   |   let unicode_like = "café naïve résumé" (escaped)
   |   let encoded_unicode = Uri::encode(unicode_like) (escaped)
50 |   let decoded_unicode = Uri::decode(encoded_unicode) (escaped)
   |                         ^^^ (escaped)
   |   json_inspect(decoded_unicode, content="café naïve résumé") (escaped)
   | } (escaped)

<WORKDIR>/uri_test_new_features.mbt:59:16-59:19:
   | test "query_string_parsing" { (escaped)
   |   // Test basic query parsing (escaped)
   |   let query = "name=John&age=30&city=New%20York" (escaped)
59 |   let params = Uri::parse_query(query) (escaped)
   |                ^^^ (escaped)
   |   json_inspect(params, content=[ (escaped)
   |     ["name", "John"], (escaped)

<WORKDIR>/uri_test_new_features.mbt:67:22-67:25:
   |   ]) (escaped)
   |  (escaped)
   |   // Test empty query (escaped)
67 |   let empty_params = Uri::parse_query("") (escaped)
   |                      ^^^ (escaped)
   |   json_inspect(empty_params.length(), content=0) (escaped)
   |  (escaped)

<WORKDIR>/uri_test_new_features.mbt:72:28-72:31:
   |  (escaped)
   |   // Test query with empty values (escaped)
   |   let empty_value_query = "key1=&key2=value2&key3" (escaped)
72 |   let empty_value_params = Uri::parse_query(empty_value_query) (escaped)
   |                            ^^^ (escaped)
   |   json_inspect(empty_value_params, content=[ (escaped)
   |     ["key1", ""], (escaped)

<WORKDIR>/uri_test_new_features.mbt:85:15-85:18:
   | test "query_string_building" { (escaped)
   |   // Test basic query building (escaped)
   |   let params = [("name", "John Doe"), ("age", "30"), ("active", "")] (escaped)
85 |   let query = Uri::build_query(params) (escaped)
   |               ^^^ (escaped)
   |   json_inspect(query, content="name=John%20Doe&age=30&active") (escaped)
   |  (escaped)

<WORKDIR>/uri_test_new_features.mbt:89:21-89:24:
   |   json_inspect(query, content="name=John%20Doe&age=30&active") (escaped)
   |  (escaped)
   |   // Test empty params (escaped)
89 |   let empty_query = Uri::build_query([]) (escaped)
   |                     ^^^ (escaped)
   |   json_inspect(empty_query, content="") (escaped)
   |  (escaped)

<WORKDIR>/uri_test_new_features.mbt:97:23-97:26:
   |     ("user@email", "test+value"), (escaped)
   |     ("key with spaces", "value&more"), (escaped)
   |   ] (escaped)
97 |   let special_query = Uri::build_query(special_params) (escaped)
   |                       ^^^ (escaped)
   |   json_inspect( (escaped)
   |     special_query, (escaped)

<WORKDIR>/uri_test_new_features.mbt:298:22-298:25:
    |   ) (escaped)
    |  (escaped)
    |   // Query should be parsed correctly (escaped)
298 |   let query_params = Uri::parse_query(uri.query().unwrap_or("")) (escaped)
    |                      ^^^ (escaped)
    |   json_inspect(query_params, content=[ (escaped)
    |     ["query", "value=with&special"], (escaped)

```
