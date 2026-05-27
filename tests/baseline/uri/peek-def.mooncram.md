# uri peek-def

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
$ run_moon_ide moon ide peek-def 'scheme' --loc 'uri.mbt:55:3'
Definition found at file <WORKDIR>/uri.mbt
   | /// - authority: contains user info, host, and port (escaped)
   | /// - path: hierarchical path to resource (escaped)
   | /// - query: additional parameters (escaped)
   | /// - fragment: reference to a secondary resource (escaped)
   | pub struct Uri { (escaped)
55 |   scheme : String? (escaped)
   |   ^^^^^^ (escaped)
   |   authority : Authority? (escaped)
   |   path : String (escaped)
   |   query : String? (escaped)
   |   fragment : String? (escaped)
   | } derive(ToJson) (escaped)
   |  (escaped)
   | ///| (escaped)
   | /// Authority component of a URI (escaped)
   | /// Contains optional user info, required host, and optional port (escaped)
   | pub struct Authority { (escaped)
   |   userinfo : String? (escaped)
   |   host : String (escaped)
   |   port : Int? (escaped)
   | } derive(ToJson) (escaped)
```

```mooncram
$ run_moon_ide moon ide peek-def 'authority' --loc 'uri.mbt:56:3'
Definition found at file <WORKDIR>/uri.mbt
   | /// - path: hierarchical path to resource (escaped)
   | /// - query: additional parameters (escaped)
   | /// - fragment: reference to a secondary resource (escaped)
   | pub struct Uri { (escaped)
   |   scheme : String? (escaped)
56 |   authority : Authority? (escaped)
   |   ^^^^^^^^^ (escaped)
   |   path : String (escaped)
   |   query : String? (escaped)
   |   fragment : String? (escaped)
   | } derive(ToJson) (escaped)
   |  (escaped)
   | ///| (escaped)
   | /// Authority component of a URI (escaped)
   | /// Contains optional user info, required host, and optional port (escaped)
   | pub struct Authority { (escaped)
   |   userinfo : String? (escaped)
   |   host : String (escaped)
   |   port : Int? (escaped)
   | } derive(ToJson) (escaped)
   |  (escaped)
```

```mooncram
$ run_moon_ide moon ide peek-def 'uri' --loc 'uri_test.mbt:5:7'
Definition found at file <WORKDIR>/uri_test.mbt
  | ///| (escaped)
  | /// Test basic URI parsing functionality (escaped)
  | test "basic_uri_parsing" { (escaped)
  |   // Test simple HTTP URI (escaped)
5 |   let uri = @uri.parse("https://example.com/path") (escaped)
  |       ^^^ (escaped)
  |   json_inspect(uri, content={ (escaped)
  |     "scheme": "https", (escaped)
  |     "authority": { "host": "example.com" }, (escaped)
  |     "path": "/path", (escaped)
  |   }) (escaped)
  | } (escaped)
  |  (escaped)
  | ///| (escaped)
  | /// Test empty URI (escaped)
  | test "empty_uri" { (escaped)
  |   let empty_uri = @uri.empty() (escaped)
  |   json_inspect(empty_uri, content={ "path": "" }) (escaped)
  | } (escaped)
  |  (escaped)
```

```mooncram
$ run_moon_ide moon ide peek-def 'parse' --loc 'uri_test.mbt:5:18'
Definition found at file <WORKDIR>/uri.mbt
    | /// (escaped)
    | /// - `UriError::EmptyUri` if the input string is empty (escaped)
    | /// - `UriError::InvalidScheme` if the scheme is malformed (escaped)
    | /// - `UriError::InvalidAuthority` if the authority is malformed (escaped)
    | /// - Other `UriError` variants for various parsing failures (escaped)
127 | pub fn parse(uri_str : String) -> Uri raise UriError { (escaped)
    |        ^^^^^ (escaped)
    |   if uri_str.length() == 0 { (escaped)
    |     raise EmptyUri (escaped)
    |   } (escaped)
    |  (escaped)
    |   // Start with an empty URI and parse components (escaped)
    |   let uri = empty() (escaped)
    |   let remaining = uri_str (escaped)
    |  (escaped)
    |   // Simple parsing for now - will enhance later (escaped)
    |   // For basic HTTP/HTTPS URIs: scheme://host:port/path?query#fragment (escaped)
    |  (escaped)
    |   // Check for scheme (escaped)
    |   if remaining.contains("://") { (escaped)
    |     let parts = remaining.split("://").collect() (escaped)
```

```mooncram
$ run_moon_ide moon ide peek-def 'encoded' --loc 'uri_test_new_features.mbt:5:7'
Definition found at file <WORKDIR>/uri_test_new_features.mbt
  | ///| (escaped)
  | /// Test URL encoding functionality (escaped)
  | test "url_encoding" { (escaped)
  |   // Test basic encoding (escaped)
5 |   let encoded = Uri::encode("hello world!") (escaped)
  |       ^^^^^^^ (escaped)
  |   json_inspect(encoded, content="hello%20world%21") (escaped)
  |  (escaped)
  |   // Test unreserved characters (should not be encoded) (escaped)
  |   let unreserved = "hello-world_123.test~" (escaped)
  |   let encoded_unreserved = Uri::encode(unreserved) (escaped)
  |   json_inspect(encoded_unreserved, content="hello-world_123.test~") (escaped)
  |  (escaped)
  |   // Test special characters (escaped)
  |   let special = "user@domain.com:password" (escaped)
  |   let encoded_special = Uri::encode(special) (escaped)
  |   json_inspect(encoded_special, content="user%40domain.com%3Apassword") (escaped)
  | } (escaped)
  |  (escaped)
  | ///| (escaped)
```

```mooncram
$ run_moon_ide moon ide peek-def 'Uri' --loc 'uri_test_new_features.mbt:5:17'
Definition found at file <WORKDIR>/uri.mbt
   | /// - scheme: identifies the protocol (e.g., "http", "https", "ftp") (escaped)
   | /// - authority: contains user info, host, and port (escaped)
   | /// - path: hierarchical path to resource (escaped)
   | /// - query: additional parameters (escaped)
   | /// - fragment: reference to a secondary resource (escaped)
54 | pub struct Uri { (escaped)
   |            ^^^ (escaped)
   |   scheme : String? (escaped)
   |   authority : Authority? (escaped)
   |   path : String (escaped)
   |   query : String? (escaped)
   |   fragment : String? (escaped)
   | } derive(ToJson) (escaped)
   |  (escaped)
   | ///| (escaped)
   | /// Authority component of a URI (escaped)
   | /// Contains optional user info, required host, and optional port (escaped)
   | pub struct Authority { (escaped)
   |   userinfo : String? (escaped)
   |   host : String (escaped)
   |   port : Int? (escaped)
```

```mooncram
$ run_moon_ide moon ide peek-def 'Uri' --loc 'uri.mbt:54:12'
Definition found at file <WORKDIR>/uri.mbt
   | /// - scheme: identifies the protocol (e.g., "http", "https", "ftp") (escaped)
   | /// - authority: contains user info, host, and port (escaped)
   | /// - path: hierarchical path to resource (escaped)
   | /// - query: additional parameters (escaped)
   | /// - fragment: reference to a secondary resource (escaped)
54 | pub struct Uri { (escaped)
   |            ^^^ (escaped)
   |   scheme : String? (escaped)
   |   authority : Authority? (escaped)
   |   path : String (escaped)
   |   query : String? (escaped)
   |   fragment : String? (escaped)
   | } derive(ToJson) (escaped)
   |  (escaped)
   | ///| (escaped)
   | /// Authority component of a URI (escaped)
   | /// Contains optional user info, required host, and optional port (escaped)
   | pub struct Authority { (escaped)
   |   userinfo : String? (escaped)
   |   host : String (escaped)
   |   port : Int? (escaped)
```

```mooncram
$ run_moon_ide moon ide peek-def 'Authority' --loc 'uri.mbt:65:12'
Definition found at file <WORKDIR>/uri.mbt
   | } derive(ToJson) (escaped)
   |  (escaped)
   | ///| (escaped)
   | /// Authority component of a URI (escaped)
   | /// Contains optional user info, required host, and optional port (escaped)
65 | pub struct Authority { (escaped)
   |            ^^^^^^^^^ (escaped)
   |   userinfo : String? (escaped)
   |   host : String (escaped)
   |   port : Int? (escaped)
   | } derive(ToJson) (escaped)
   |  (escaped)
   | ///| (escaped)
   | /// Result type for URI parsing operations (escaped)
   | pub suberror UriError { (escaped)
   |   InvalidScheme(String) (escaped)
   |   InvalidAuthority(String) (escaped)
   |   InvalidPath(String) (escaped)
   |   InvalidQuery(String) (escaped)
   |   InvalidFragment(String) (escaped)
   |   InvalidPort(String) (escaped)
```

```mooncram
$ run_moon_ide moon ide peek-def 'UriError' --loc 'uri.mbt:73:14'
Definition found at file <WORKDIR>/uri.mbt
   |   port : Int? (escaped)
   | } derive(ToJson) (escaped)
   |  (escaped)
   | ///| (escaped)
   | /// Result type for URI parsing operations (escaped)
73 | pub suberror UriError { (escaped)
   |              ^^^^^^^^ (escaped)
   |   InvalidScheme(String) (escaped)
   |   InvalidAuthority(String) (escaped)
   |   InvalidPath(String) (escaped)
   |   InvalidQuery(String) (escaped)
   |   InvalidFragment(String) (escaped)
   |   InvalidPort(String) (escaped)
   |   EmptyUri (escaped)
   | } derive(ToJson) (escaped)
   |  (escaped)
   | ///| (escaped)
   | /// Create an empty URI with default values. (escaped)
   | /// (escaped)
   | /// # Example (escaped)
   | /// (escaped)
```

```mooncram
$ run_moon_ide moon ide peek-def 'empty' --loc 'uri.mbt:97:8'
Definition found at file <WORKDIR>/uri.mbt
   | /// ``` (escaped)
   | /// (escaped)
   | /// # Returns (escaped)
   | /// (escaped)
   | /// A new `Uri` with all components set to their default values. (escaped)
97 | pub fn empty() -> Uri { (escaped)
   |        ^^^^^ (escaped)
   |   { scheme: None, authority: None, path: "", query: None, fragment: None } (escaped)
   | } (escaped)
   |  (escaped)
   | ///| (escaped)
   | /// Parse a URI string into a Uri structure according to RFC3986. (escaped)
   | /// (escaped)
   | /// # Example (escaped)
   | /// (escaped)
   | /// ```moonbit nocheck (escaped)
   | /// let uri = @uri.parse("https://user:pass@example.com:8080/path?query=value#fragment") (escaped)
   | /// inspect(uri.scheme(), content="Some(\\"https\\")") (escaped)
   | /// inspect(uri.host(), content="Some(\\"example.com\\")") (escaped)
   | /// inspect(uri.port(), content="Some(8080)") (escaped)
   | /// ``` (escaped)
```

```mooncram
$ run_moon_ide moon ide peek-def 'parse' --loc 'uri.mbt:127:8'
Definition found at file <WORKDIR>/uri.mbt
    | /// (escaped)
    | /// - `UriError::EmptyUri` if the input string is empty (escaped)
    | /// - `UriError::InvalidScheme` if the scheme is malformed (escaped)
    | /// - `UriError::InvalidAuthority` if the authority is malformed (escaped)
    | /// - Other `UriError` variants for various parsing failures (escaped)
127 | pub fn parse(uri_str : String) -> Uri raise UriError { (escaped)
    |        ^^^^^ (escaped)
    |   if uri_str.length() == 0 { (escaped)
    |     raise EmptyUri (escaped)
    |   } (escaped)
    |  (escaped)
    |   // Start with an empty URI and parse components (escaped)
    |   let uri = empty() (escaped)
    |   let remaining = uri_str (escaped)
    |  (escaped)
    |   // Simple parsing for now - will enhance later (escaped)
    |   // For basic HTTP/HTTPS URIs: scheme://host:port/path?query#fragment (escaped)
    |  (escaped)
    |   // Check for scheme (escaped)
    |   if remaining.contains("://") { (escaped)
    |     let parts = remaining.split("://").collect() (escaped)
```

```mooncram
$ run_moon_ide moon ide peek-def 'parse_with_scheme' --loc 'uri.mbt:160:4'
Definition found at file <WORKDIR>/uri.mbt
    |   { ..uri, path: remaining } (escaped)
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
    | /// Parse URI with known scheme (escaped)
160 | fn parse_with_scheme(scheme : String, rest : String) -> Uri raise UriError { (escaped)
    |    ^^^^^^^^^^^^^^^^^ (escaped)
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
```
