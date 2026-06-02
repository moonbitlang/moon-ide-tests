# uri peek-def

````mooncram
$ export MOON_HOME="${MOON_HOME:-$HOME/.moon}"
````

````mooncram
$ export TEST_REPO_ROOT="$(cd "$TESTDIR/../../../fixtures/repos/uri" && pwd)"
````

````mooncram
$ normalize_moon_ide_output() { sed -e "s|$TEST_REPO_ROOT|<WORKDIR>|g" -e "s|$MOON_HOME|<MOON_HOME>|g"; }
````

````mooncram
$ run_moon_ide() { status_file="${TMPDIR:-/tmp}/moon-ide-status.$$"; ( cd "$TEST_REPO_ROOT" && "$@"; echo "$?" > "$status_file" ) 2>&1 | normalize_moon_ide_output; status=$(cat "$status_file"); rm -f "$status_file"; return "$status"; }
````

````mooncram
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
````

````mooncram
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
````

````mooncram
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
````

````mooncram
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
````

````mooncram
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
````

````mooncram
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
````
