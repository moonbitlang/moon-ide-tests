# uri peek-def

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\uri' moon ide peek-def 'Uri' --loc 'uri.mbt:54:12'
Definition found at file <WORKDIR>/uri.mbt
   | /// - scheme: identifies the protocol (e.g., "http", "https", "ftp") (escaped)
   | /// - authority: contains user info, host, and port
   | /// - path: hierarchical path to resource
   | /// - query: additional parameters
   | /// - fragment: reference to a secondary resource
54 | pub struct Uri {
   |            ^^^
   |   scheme : String?
   |   authority : Authority?
   |   path : String
   |   query : String?
   |   fragment : String?
   | } derive(ToJson)
   | 
   | ///|
   | /// Authority component of a URI
   | /// Contains optional user info, required host, and optional port
   | pub struct Authority {
   |   userinfo : String?
   |   host : String
   |   port : Int?
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\uri' moon ide peek-def 'scheme' --loc 'uri.mbt:55:3'
Definition found at file <WORKDIR>/uri.mbt
   | /// - authority: contains user info, host, and port
   | /// - path: hierarchical path to resource
   | /// - query: additional parameters
   | /// - fragment: reference to a secondary resource
   | pub struct Uri {
55 |   scheme : String?
   |   ^^^^^^
   |   authority : Authority?
   |   path : String
   |   query : String?
   |   fragment : String?
   | } derive(ToJson)
   | 
   | ///|
   | /// Authority component of a URI
   | /// Contains optional user info, required host, and optional port
   | pub struct Authority {
   |   userinfo : String?
   |   host : String
   |   port : Int?
   | } derive(ToJson)
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\uri' moon ide peek-def 'uri' --loc 'uri_test.mbt:5:7'
Definition found at file <WORKDIR>/uri_test.mbt
  | ///|
  | /// Test basic URI parsing functionality
  | test "basic_uri_parsing" {
  |   // Test simple HTTP URI
5 |   let uri = @uri.parse("https://example.com/path")
  |       ^^^
  |   json_inspect(uri, content={
  |     "scheme": "https",
  |     "authority": { "host": "example.com" },
  |     "path": "/path",
  |   })
  | }
  | 
  | ///|
  | /// Test empty URI
  | test "empty_uri" {
  |   let empty_uri = @uri.empty()
  |   json_inspect(empty_uri, content={ "path": "" })
  | }
  | 
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\uri' moon ide peek-def 'parse' --loc 'uri_test.mbt:5:18'
Definition found at file <WORKDIR>/uri.mbt
    | ///
    | /// - `UriError::EmptyUri` if the input string is empty
    | /// - `UriError::InvalidScheme` if the scheme is malformed
    | /// - `UriError::InvalidAuthority` if the authority is malformed
    | /// - Other `UriError` variants for various parsing failures
127 | pub fn parse(uri_str : String) -> Uri raise UriError {
    |        ^^^^^
    |   if uri_str.length() == 0 {
    |     raise EmptyUri
    |   }
    | 
    |   // Start with an empty URI and parse components
    |   let uri = empty()
    |   let remaining = uri_str
    | 
    |   // Simple parsing for now - will enhance later
    |   // For basic HTTP/HTTPS URIs: scheme://host:port/path?query#fragment
    | 
    |   // Check for scheme
    |   if remaining.contains("://") {
    |     let parts = remaining.split("://").collect()
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\uri' moon ide peek-def 'encoded' --loc 'uri_test_new_features.mbt:5:7'
Definition found at file <WORKDIR>/uri_test_new_features.mbt
  | ///|
  | /// Test URL encoding functionality
  | test "url_encoding" {
  |   // Test basic encoding
5 |   let encoded = Uri::encode("hello world!")
  |       ^^^^^^^
  |   json_inspect(encoded, content="hello%20world%21")
  | 
  |   // Test unreserved characters (should not be encoded) (escaped)
  |   let unreserved = "hello-world_123.test~"
  |   let encoded_unreserved = Uri::encode(unreserved)
  |   json_inspect(encoded_unreserved, content="hello-world_123.test~")
  | 
  |   // Test special characters
  |   let special = "user@domain.com:password"
  |   let encoded_special = Uri::encode(special)
  |   json_inspect(encoded_special, content="user%40domain.com%3Apassword")
  | }
  | 
  | ///|
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\uri' moon ide peek-def 'Uri' --loc 'uri_test_new_features.mbt:5:17'
Definition found at file <WORKDIR>/uri.mbt
   | /// - scheme: identifies the protocol (e.g., "http", "https", "ftp") (escaped)
   | /// - authority: contains user info, host, and port
   | /// - path: hierarchical path to resource
   | /// - query: additional parameters
   | /// - fragment: reference to a secondary resource
54 | pub struct Uri {
   |            ^^^
   |   scheme : String?
   |   authority : Authority?
   |   path : String
   |   query : String?
   |   fragment : String?
   | } derive(ToJson)
   | 
   | ///|
   | /// Authority component of a URI
   | /// Contains optional user info, required host, and optional port
   | pub struct Authority {
   |   userinfo : String?
   |   host : String
   |   port : Int?
```
