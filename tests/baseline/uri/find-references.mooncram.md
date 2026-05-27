# uri find-references

```mooncram
$ export MOON_HOME="${MOON_HOME:-$HOME/.moon}"
```

```mooncram
$ export TEST_REPO_ROOT="$PWD"
```

```mooncram
$ normalize_moon_ide_output() { sed -e "s|$TEST_REPO_ROOT|<WORKDIR>|g" -e "s|$MOON_HOME|<MOON_HOME>|g"; }
```

```mooncram
$ run_moon_ide() { status_file="${TMPDIR:-/tmp}/moon-ide-status.$$"; ( "$@"; echo "$?" > "$status_file" ) 2>&1 | normalize_moon_ide_output; status=$(cat "$status_file"); rm -f "$status_file"; return "$status"; }
```

```mooncram
$ run_moon_ide moon ide find-references Uri --loc 'uri.mbt:54:12'
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

```mooncram
$ run_moon_ide moon ide find-references scheme --loc 'uri.mbt:55:3'
Found 15 references for symbol 'scheme':
<WORKDIR>/uri.mbt:55:3-55:9:
   | /// - query: additional parameters (escaped)
   | /// - fragment: reference to a secondary resource (escaped)
   | pub struct Uri { (escaped)
55 |   scheme : String? (escaped)
   |   ^^^^^^ (escaped)
   |   authority : Authority? (escaped)
   |   path : String (escaped)

<WORKDIR>/uri.mbt:98:5-98:11:
   | /// (escaped)
   | /// A new `Uri` with all components set to their default values. (escaped)
   | pub fn empty() -> Uri { (escaped)
98 |   { scheme: None, authority: None, path: "", query: None, fragment: None } (escaped)
   |     ^^^^^^ (escaped)
   | } (escaped)
   |  (escaped)

<WORKDIR>/uri.mbt:162:18-162:24:
    | /// Parse URI with known scheme (escaped)
    | fn parse_with_scheme(scheme : String, rest : String) -> Uri raise UriError { (escaped)
    |   let mut uri = empty() (escaped)
162 |   uri = { ..uri, scheme: Some(scheme) } (escaped)
    |                  ^^^^^^ (escaped)
    |  (escaped)
    |   // Split by fragment first (escaped)

<WORKDIR>/uri.mbt:235:14-235:20:
    |   let mut result = "" (escaped)
    |  (escaped)
    |   // Add scheme (escaped)
235 |   match self.scheme { (escaped)
    |              ^^^^^^ (escaped)
    |     Some(scheme) => { (escaped)
    |       result = result + scheme (escaped)

<WORKDIR>/uri.mbt:313:8-313:14:
    | /// (escaped)
    | /// The scheme as `Some(String)` if present, `None` for relative URIs. (escaped)
    | pub fn Uri::scheme(self : Uri) -> String? { (escaped)
313 |   self.scheme (escaped)
    |        ^^^^^^ (escaped)
    | } (escaped)
    |  (escaped)

<WORKDIR>/uri.mbt:700:13-700:19:
    | /// (escaped)
    | /// A new `Uri` with the specified scheme (escaped)
    | pub fn Uri::with_scheme(self : Uri, new_scheme : String?) -> Uri { (escaped)
700 |   { ..self, scheme: new_scheme } (escaped)
    |             ^^^^^^ (escaped)
    | } (escaped)
    |  (escaped)

<WORKDIR>/uri.mbt:793:14-793:20:
    | ///| (escaped)
    | /// Check if the URI is absolute (has a scheme) (escaped)
    | pub fn Uri::is_absolute(self : Uri) -> Bool { (escaped)
793 |   match self.scheme { (escaped)
    |              ^^^^^^ (escaped)
    |     Some(_) => true (escaped)
    |     None => false (escaped)

<WORKDIR>/uri.mbt:833:22-833:28:
    |       match auth.port { (escaped)
    |         Some(port) => Some(port) (escaped)
    |         None => (escaped)
833 |           match self.scheme { (escaped)
    |                      ^^^^^^ (escaped)
    |             Some(scheme) => default_port(scheme) (escaped)
    |             None => None (escaped)

<WORKDIR>/uri.mbt:850:19-850:25:
    |   // Remove default port if present (escaped)
    |   match self.authority { (escaped)
    |     Some(auth) => (escaped)
850 |       match (self.scheme, auth.port) { (escaped)
    |                   ^^^^^^ (escaped)
    |         (Some(scheme), Some(port)) => (escaped)
    |           match default_port(scheme) { (escaped)

<WORKDIR>/uri.mbt:972:9-972:15:
    |   match relative.authority { (escaped)
    |     Some(_) => (escaped)
    |       resolved = { (escaped)
972 |         scheme: base.scheme, (escaped)
    |         ^^^^^^ (escaped)
    |         authority: relative.authority, (escaped)
    |         path: relative.path, (escaped)

<WORKDIR>/uri.mbt:972:22-972:28:
    |   match relative.authority { (escaped)
    |     Some(_) => (escaped)
    |       resolved = { (escaped)
972 |         scheme: base.scheme, (escaped)
    |                      ^^^^^^ (escaped)
    |         authority: relative.authority, (escaped)
    |         path: relative.path, (escaped)

<WORKDIR>/uri.mbt:983:11-983:17:
    |       if relative.path == "" { (escaped)
    |         // Empty path, use base path (escaped)
    |         resolved = { (escaped)
983 |           scheme: base.scheme, (escaped)
    |           ^^^^^^ (escaped)
    |           authority: base.authority, (escaped)
    |           path: base.path, (escaped)

<WORKDIR>/uri.mbt:983:24-983:30:
    |       if relative.path == "" { (escaped)
    |         // Empty path, use base path (escaped)
    |         resolved = { (escaped)
983 |           scheme: base.scheme, (escaped)
    |                        ^^^^^^ (escaped)
    |           authority: base.authority, (escaped)
    |           path: base.path, (escaped)

<WORKDIR>/uri.mbt:1003:11-1003:17:
     |         } (escaped)
     |  (escaped)
     |         resolved = { (escaped)
1003 |           scheme: base.scheme, (escaped)
     |           ^^^^^^ (escaped)
     |           authority: base.authority, (escaped)
     |           path: resolved_path, (escaped)

<WORKDIR>/uri.mbt:1003:24-1003:30:
     |         } (escaped)
     |  (escaped)
     |         resolved = { (escaped)
1003 |           scheme: base.scheme, (escaped)
     |                        ^^^^^^ (escaped)
     |           authority: base.authority, (escaped)
     |           path: resolved_path, (escaped)

```

```mooncram
$ run_moon_ide moon ide find-references uri --loc 'uri_test.mbt:5:7'
Found 2 references for symbol 'uri':
<WORKDIR>/uri_test.mbt:5:7-5:10:
  | /// Test basic URI parsing functionality (escaped)
  | test "basic_uri_parsing" { (escaped)
  |   // Test simple HTTP URI (escaped)
5 |   let uri = @uri.parse("https://example.com/path") (escaped)
  |       ^^^ (escaped)
  |   json_inspect(uri, content={ (escaped)
  |     "scheme": "https", (escaped)

<WORKDIR>/uri_test.mbt:6:16-6:19:
  | test "basic_uri_parsing" { (escaped)
  |   // Test simple HTTP URI (escaped)
  |   let uri = @uri.parse("https://example.com/path") (escaped)
6 |   json_inspect(uri, content={ (escaped)
  |                ^^^ (escaped)
  |     "scheme": "https", (escaped)
  |     "authority": { "host": "example.com" }, (escaped)

```

```mooncram
$ run_moon_ide moon ide find-references parse --loc 'uri_test.mbt:5:18'
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

```mooncram
$ run_moon_ide moon ide find-references encoded --loc 'uri_test_new_features.mbt:5:7'
Found 2 references for symbol 'encoded':
<WORKDIR>/uri_test_new_features.mbt:5:7-5:14:
  | /// Test URL encoding functionality (escaped)
  | test "url_encoding" { (escaped)
  |   // Test basic encoding (escaped)
5 |   let encoded = Uri::encode("hello world!") (escaped)
  |       ^^^^^^^ (escaped)
  |   json_inspect(encoded, content="hello%20world%21") (escaped)
  |  (escaped)

<WORKDIR>/uri_test_new_features.mbt:6:16-6:23:
  | test "url_encoding" { (escaped)
  |   // Test basic encoding (escaped)
  |   let encoded = Uri::encode("hello world!") (escaped)
6 |   json_inspect(encoded, content="hello%20world%21") (escaped)
  |                ^^^^^^^ (escaped)
  |  (escaped)
  |   // Test unreserved characters (should not be encoded) (escaped)

```

```mooncram
$ run_moon_ide moon ide find-references Uri --loc 'uri_test_new_features.mbt:5:17'
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

```mooncram
$ run_moon_ide moon ide find-references 'Uri'
`pub struct Uri` in package bobzhang/uri at <WORKDIR>/uri.mbt:1-60
1 | ///| (escaped)
  | /// # MoonBit URI Library (escaped)
  | /// (escaped)
  | /// A comprehensive RFC3986-compliant URI parsing and manipulation library for MoonBit. (escaped)
  | /// This library provides robust URI parsing, validation, and manipulation capabilities (escaped)
  | /// with full support for all URI components and operations. (escaped)
  | /// (escaped)
  | /// ## Features (escaped)
  | /// (escaped)
  | /// - **RFC3986 Compliant**: Full compliance with URI specification (escaped)
  | /// - **Immutable Operations**: All URI modifications return new instances (escaped)
  | /// - **Comprehensive Parsing**: Support for all URI components (escaped)
  | /// - **Percent Encoding**: Built-in encoding/decoding utilities (escaped)
  | /// - **Query Parameter Helpers**: Easy query string manipulation (escaped)
  | /// - **Path Segment Operations**: Convenient path manipulation (escaped)
  | /// - **URI Resolution**: Resolve relative URIs against base URIs (escaped)
  | /// - **Validation**: Robust error handling and validation (escaped)
  | /// (escaped)
  | /// ## Quick Start (escaped)
  | /// (escaped)
  | /// ```moonbit nocheck (escaped)
  | /// // Parse a URI (escaped)
  | /// let uri = @uri.parse("https://user:pass@example.com:8080/path?query=value#fragment") (escaped)
  | /// (escaped)
  | /// // Access components (escaped)
  | /// inspect(uri.scheme(), content="Some(\\"https\\")") (escaped)
  | /// inspect(uri.host(), content="Some(\\"example.com\\")") (escaped)
  | /// inspect(uri.port(), content="Some(8080)") (escaped)
  | /// inspect(uri.path(), content="/path") (escaped)
  | /// (escaped)
  | /// // Modify URI (immutable) (escaped)
  | /// let new_uri = uri.with_host(Some("newhost.com")).with_port(Some(9000)) (escaped)
  | /// inspect(new_uri.to_string(), content="https://user:pass@newhost.com:9000/path?query=value#fragment") (escaped)
  | /// (escaped)
  | /// // Query parameter helpers (escaped)
  | /// let search_uri = @uri.parse("https://example.com/search") (escaped)
  | /// let with_params = search_uri.with_query_param("q", "moonbit").with_query_param("lang", "en") (escaped)
  | /// inspect(with_params.to_string(), content="https://example.com/search?q=moonbit&lang=en") (escaped)
  | /// ``` (escaped)
  | /// (escaped)
  | /// ## URI Structure (escaped)
  | /// (escaped)
  | /// URI data structure representing a parsed URI according to RFC3986 (escaped)
  | ///  (escaped)
  | /// A URI has the general form: (escaped)
  | /// scheme://authority/path?query#fragment (escaped)
  | ///  (escaped)
  | /// Where: (escaped)
  | /// - scheme: identifies the protocol (e.g., "http", "https", "ftp") (escaped)
  | /// - authority: contains user info, host, and port (escaped)
  | /// - path: hierarchical path to resource (escaped)
  | /// - query: additional parameters (escaped)
  | /// - fragment: reference to a secondary resource (escaped)
  | pub struct Uri { (escaped)
  |   scheme : String? (escaped)
  |   authority : Authority? (escaped)
  |   path : String (escaped)
  |   query : String? (escaped)
  |   fragment : String? (escaped)
  | } derive(ToJson) (escaped)

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

```mooncram
$ run_moon_ide moon ide find-references 'Authority'
`pub struct Authority` in package bobzhang/uri at <WORKDIR>/uri.mbt:62-69
62 | ///| (escaped)
   | /// Authority component of a URI (escaped)
   | /// Contains optional user info, required host, and optional port (escaped)
   | pub struct Authority { (escaped)
   |   userinfo : String? (escaped)
   |   host : String (escaped)
   |   port : Int? (escaped)
   | } derive(ToJson) (escaped)

Found 3 references for symbol 'Authority':
<WORKDIR>/uri.mbt:56:15-56:24:
   | /// - fragment: reference to a secondary resource (escaped)
   | pub struct Uri { (escaped)
   |   scheme : String? (escaped)
56 |   authority : Authority? (escaped)
   |               ^^^^^^^^^ (escaped)
   |   path : String (escaped)
   |   query : String? (escaped)

<WORKDIR>/uri.mbt:65:12-65:21:
   | ///| (escaped)
   | /// Authority component of a URI (escaped)
   | /// Contains optional user info, required host, and optional port (escaped)
65 | pub struct Authority { (escaped)
   |            ^^^^^^^^^ (escaped)
   |   userinfo : String? (escaped)
   |   host : String (escaped)

<WORKDIR>/uri.mbt:543:42-543:51:
    |  (escaped)
    | ///| (escaped)
    | /// Parse authority component (escaped)
543 | fn parse_authority(auth_str : String) -> Authority raise UriError { (escaped)
    |                                          ^^^^^^^^^ (escaped)
    |   let mut userinfo : String? = None (escaped)
    |   let mut port : Int? = None (escaped)

```

```mooncram
$ run_moon_ide moon ide find-references 'UriError'
`pub error UriError` in package bobzhang/uri at <WORKDIR>/uri.mbt:71-81
71 | ///| (escaped)
   | /// Result type for URI parsing operations (escaped)
   | pub suberror UriError { (escaped)
   |   InvalidScheme(String) (escaped)
   |   InvalidAuthority(String) (escaped)
   |   InvalidPath(String) (escaped)
   |   InvalidQuery(String) (escaped)
   |   InvalidFragment(String) (escaped)
   |   InvalidPort(String) (escaped)
   |   EmptyUri (escaped)
   | } derive(ToJson) (escaped)

Found 12 references for symbol 'UriError':
<WORKDIR>/uri.mbt:73:14-73:22:
   |  (escaped)
   | ///| (escaped)
   | /// Result type for URI parsing operations (escaped)
73 | pub suberror UriError { (escaped)
   |              ^^^^^^^^ (escaped)
   |   InvalidScheme(String) (escaped)
   |   InvalidAuthority(String) (escaped)

<WORKDIR>/uri.mbt:127:45-127:53:
    | /// - `UriError::InvalidScheme` if the scheme is malformed (escaped)
    | /// - `UriError::InvalidAuthority` if the authority is malformed (escaped)
    | /// - Other `UriError` variants for various parsing failures (escaped)
127 | pub fn parse(uri_str : String) -> Uri raise UriError { (escaped)
    |                                             ^^^^^^^^ (escaped)
    |   if uri_str.length() == 0 { (escaped)
    |     raise EmptyUri (escaped)

<WORKDIR>/uri.mbt:160:67-160:75:
    |  (escaped)
    | ///| (escaped)
    | /// Parse URI with known scheme (escaped)
160 | fn parse_with_scheme(scheme : String, rest : String) -> Uri raise UriError { (escaped)
    |                                                                   ^^^^^^^^ (escaped)
    |   let mut uri = empty() (escaped)
    |   uri = { ..uri, scheme: Some(scheme) } (escaped)

<WORKDIR>/uri.mbt:543:58-543:66:
    |  (escaped)
    | ///| (escaped)
    | /// Parse authority component (escaped)
543 | fn parse_authority(auth_str : String) -> Authority raise UriError { (escaped)
    |                                                          ^^^^^^^^ (escaped)
    |   let mut userinfo : String? = None (escaped)
    |   let mut port : Int? = None (escaped)

<WORKDIR>/uri.mbt:955:57-955:65:
    | /// # See Also (escaped)
    | /// (escaped)
    | /// - RFC3986 Section 5.2 - Reference Resolution (escaped)
955 | pub fn resolve(base : Uri, relative : Uri) -> Uri raise UriError { (escaped)
    |                                                         ^^^^^^^^ (escaped)
    |   // If relative URI is absolute, return it as-is (escaped)
    |   if relative.is_absolute() { (escaped)

<WORKDIR>/uri_test.mbt:83:10-83:18:
   |     let _ = @uri.parse("") (escaped)
   |     fail("Expected EmptyUri error") (escaped)
   |   } catch { (escaped)
83 |     @uri.UriError::EmptyUri => () // Expected (escaped)
   |          ^^^^^^^^ (escaped)
   |     _ => fail("Expected EmptyUri error") (escaped)
   |   } (escaped)

<WORKDIR>/uri_test.mbt:115:10-115:18:
    |     let _ = @uri.parse("123invalid://example.com") (escaped)
    |     fail("Expected InvalidScheme error") (escaped)
    |   } catch { (escaped)
115 |     @uri.UriError::InvalidScheme(scheme) => (escaped)
    |          ^^^^^^^^ (escaped)
    |       if scheme != "123invalid" { (escaped)
    |         fail("Expected scheme '123invalid', got: " + scheme) (escaped)

<WORKDIR>/uri_test.mbt:130:10-130:18:
    |     let _ = @uri.parse("http://example.com:abc/path") (escaped)
    |     fail("Expected InvalidPort error") (escaped)
    |   } catch { (escaped)
130 |     @uri.UriError::InvalidPort(port) => (escaped)
    |          ^^^^^^^^ (escaped)
    |       if port != "abc" { (escaped)
    |         fail("Expected port 'abc', got: " + port) (escaped)

<WORKDIR>/uri_test.mbt:145:10-145:18:
    |     let _ = @uri.parse("http://example.com:99999/path") (escaped)
    |     fail("Expected error for port out of range") (escaped)
    |   } catch { (escaped)
145 |     @uri.UriError::InvalidPort(_) => () // Expected (escaped)
    |          ^^^^^^^^ (escaped)
    |     _ => fail("Expected InvalidPort error") (escaped)
    |   } (escaped)

<WORKDIR>/uri_test.mbt:157:10-157:18:
    |     let _ = @uri.parse("http://example.com/path with spaces") (escaped)
    |     fail("Expected error for path with unescaped spaces") (escaped)
    |   } catch { (escaped)
157 |     @uri.UriError::InvalidPath(_) => () // Expected (escaped)
    |          ^^^^^^^^ (escaped)
    |     _ => fail("Expected InvalidPath error") (escaped)
    |   } (escaped)

<WORKDIR>/uri_test.mbt:169:10-169:18:
    |     let _ = @uri.parse("http://example.com/path?query with spaces") (escaped)
    |     fail("Expected error for query with unescaped spaces") (escaped)
    |   } catch { (escaped)
169 |     @uri.UriError::InvalidQuery(_) => () // Expected (escaped)
    |          ^^^^^^^^ (escaped)
    |     _ => fail("Expected InvalidQuery error") (escaped)
    |   } (escaped)

<WORKDIR>/uri_test.mbt:181:10-181:18:
    |     let _ = @uri.parse("http://example.com/path#fragment with spaces") (escaped)
    |     fail("Expected error for fragment with unescaped spaces") (escaped)
    |   } catch { (escaped)
181 |     @uri.UriError::InvalidFragment(_) => () // Expected (escaped)
    |          ^^^^^^^^ (escaped)
    |     _ => fail("Expected InvalidFragment error") (escaped)
    |   } (escaped)

```

```mooncram
$ run_moon_ide moon ide find-references 'empty'
9 symbols found matching 'empty'
find-references only works with a single symbol, try to be more specific. (no-eol)
[1]
```

```mooncram
$ run_moon_ide moon ide find-references 'parse'
5 symbols found matching 'parse'
find-references only works with a single symbol, try to be more specific. (no-eol)
[1]
```

```mooncram
$ run_moon_ide moon ide find-references 'parse_with_scheme'
`fn parse_with_scheme` in package bobzhang/uri at <WORKDIR>/uri.mbt:158-227
158 | ///| (escaped)
    | /// Parse URI with known scheme (escaped)
    | fn parse_with_scheme(scheme : String, rest : String) -> Uri raise UriError { (escaped)
    |   let mut uri = empty() (escaped)
    |   uri = { ..uri, scheme: Some(scheme) } (escaped)
    |  (escaped)
    |   // Split by fragment first (escaped)
    |   let parts_fragment = rest.split("#").collect() (escaped)
    |   let main_part = parts_fragment[0].to_owned() (escaped)
    |   let fragment_part = if parts_fragment.length() > 1 { (escaped)
    |     let frag = parts_fragment[1].to_owned() (escaped)
    |     // Basic fragment validation - no spaces allowed (escaped)
    |     if frag.contains(" ") { (escaped)
    |       raise InvalidFragment(frag) (escaped)
    |     } (escaped)
    |     Some(frag) (escaped)
    |   } else { (escaped)
    |     None (escaped)
    |   } (escaped)
    |   uri = { ..uri, fragment: fragment_part } (escaped)
    |  (escaped)
    |   // Split by query (escaped)
    |   let parts_query = main_part.split("?").collect() (escaped)
    |   let path_authority_part = parts_query[0].to_owned() (escaped)
    |   let query_part = if parts_query.length() > 1 { (escaped)
    |     let q = parts_query[1].to_owned() (escaped)
    |     // Basic query validation - no unescaped spaces (escaped)
    |     if q.contains(" ") { (escaped)
    |       raise InvalidQuery(q) (escaped)
    |     } (escaped)
    |     Some(q) (escaped)
    |   } else { (escaped)
    |     None (escaped)
    |   } (escaped)
    |   uri = { ..uri, query: query_part } (escaped)
    |  (escaped)
    |   // Split authority and path (escaped)
    |   let parts_path = path_authority_part.split("/").collect() (escaped)
    |   if parts_path.length() > 0 { (escaped)
    |     let authority_part = parts_path[0].to_owned() (escaped)
    |     if authority_part.length() > 0 { (escaped)
    |       let auth = parse_authority(authority_part) (escaped)
    |       uri = { ..uri, authority: Some(auth) } (escaped)
    |     } (escaped)
    |  (escaped)
    |     // Reconstruct path from remaining parts (escaped)
    |     if parts_path.length() > 1 { (escaped)
    |       let path_parts : Array[String] = [] (escaped)
    |       for i = 1; i < parts_path.length(); i = i + 1 { (escaped)
    |         path_parts.push(parts_path[i].to_owned()) (escaped)
    |       } (escaped)
    |       let path = "/" + path_parts.join("/") (escaped)
    |       // Basic path validation - no unescaped spaces (escaped)
    |       if path.contains(" ") { (escaped)
    |         raise InvalidPath(path) (escaped)
    |       } (escaped)
    |       uri = { ..uri, path, } (escaped)
    |     } else { (escaped)
    |       uri = { ..uri, path: "" } (escaped)
    |     } (escaped)
    |   } else { (escaped)
    |     // No authority, remaining is path (escaped)
    |     if path_authority_part.contains(" ") { (escaped)
    |       raise InvalidPath(path_authority_part) (escaped)
    |     } (escaped)
    |     uri = { ..uri, path: path_authority_part } (escaped)
    |   } (escaped)
    |  (escaped)
    |   uri (escaped)
    | } (escaped)

Found 2 references for symbol 'parse_with_scheme':
<WORKDIR>/uri.mbt:147:16-147:33:
    |       if is_valid_scheme(scheme_part) { (escaped)
    |         let rest = parts[1].to_owned() (escaped)
    |         // Parse the rest (escaped)
147 |         return parse_with_scheme(scheme_part, rest) (escaped)
    |                ^^^^^^^^^^^^^^^^^ (escaped)
    |       } else { (escaped)
    |         raise InvalidScheme(scheme_part) (escaped)

<WORKDIR>/uri.mbt:160:4-160:21:
    |  (escaped)
    | ///| (escaped)
    | /// Parse URI with known scheme (escaped)
160 | fn parse_with_scheme(scheme : String, rest : String) -> Uri raise UriError { (escaped)
    |    ^^^^^^^^^^^^^^^^^ (escaped)
    |   let mut uri = empty() (escaped)
    |   uri = { ..uri, scheme: Some(scheme) } (escaped)

```
