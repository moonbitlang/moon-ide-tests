# uri hover

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
$ run_moon_ide moon ide hover 'Uri' --loc 'uri.mbt:54:12'
/// - path: hierarchical path to resource
/// - query: additional parameters
/// - fragment: reference to a secondary resource
pub struct Uri {
           ^^^
           ```moonbit
           struct Uri {
             scheme: String?
             authority: Authority?
             path: String
             query: String?
             fragment: String?
           } derive(ToJson)
           ```
           ---
           
            # MoonBit URI Library
           
            A comprehensive RFC3986-compliant URI parsing and manipulation library for MoonBit.
            This library provides robust URI parsing, validation, and manipulation capabilities
            with full support for all URI components and operations.
           
            ## Features
           
            - **RFC3986 Compliant**: Full compliance with URI specification
            - **Immutable Operations**: All URI modifications return new instances
            - **Comprehensive Parsing**: Support for all URI components
            - **Percent Encoding**: Built-in encoding/decoding utilities
            - **Query Parameter Helpers**: Easy query string manipulation
            - **Path Segment Operations**: Convenient path manipulation
            - **URI Resolution**: Resolve relative URIs against base URIs
            - **Validation**: Robust error handling and validation
           
            ## Quick Start
           
            ```moonbit nocheck
            // Parse a URI
            let uri = @uri.parse("https://user:pass@example.com:8080/path?query=value#fragment")
           
            // Access components
            inspect(uri.scheme(), content="Some(\"https\")")
            inspect(uri.host(), content="Some(\"example.com\")")
            inspect(uri.port(), content="Some(8080)")
            inspect(uri.path(), content="/path")
           
            // Modify URI (immutable)
            let new_uri = uri.with_host(Some("newhost.com")).with_port(Some(9000))
            inspect(new_uri.to_string(), content="https://user:pass@newhost.com:9000/path?query=value#fragment")
           
            // Query parameter helpers
            let search_uri = @uri.parse("https://example.com/search")
            let with_params = search_uri.with_query_param("q", "moonbit").with_query_param("lang", "en")
            inspect(with_params.to_string(), content="https://example.com/search?q=moonbit&lang=en")
            ```
           
            ## URI Structure
           
            URI data structure representing a parsed URI according to RFC3986
            
            A URI has the general form:
            scheme://authority/path?query#fragment
            
            Where:
            - scheme: identifies the protocol (e.g., "http", "https", "ftp")
            - authority: contains user info, host, and port
            - path: hierarchical path to resource
            - query: additional parameters
            - fragment: reference to a secondary resource
  scheme : String?
  authority : Authority?
````

````mooncram
$ run_moon_ide moon ide hover 'scheme' --loc 'uri.mbt:55:3'
/// - query: additional parameters
/// - fragment: reference to a secondary resource
pub struct Uri {
  scheme : String?
  ^^^^^^
  ```moonbit
  String?
  ```
  authority : Authority?
  path : String
````

````mooncram
$ run_moon_ide moon ide hover 'uri' --loc 'uri_test.mbt:5:7'
/// Test basic URI parsing functionality
test "basic_uri_parsing" {
  // Test simple HTTP URI
  let uri = @uri.parse("https://example.com/path")
      ^^^
      ```moonbit
      @uri.Uri
      ```
  json_inspect(uri, content={
    "scheme": "https",
````

````mooncram
$ run_moon_ide moon ide hover 'parse' --loc 'uri_test.mbt:5:18'
/// Test basic URI parsing functionality
test "basic_uri_parsing" {
  // Test simple HTTP URI
  let uri = @uri.parse("https://example.com/path")
            ^^^^^^^^^^
            ```moonbit
            fn @bobzhang/uri.parse(uri_str : String) -> @uri.Uri raise @uri.UriError
            ```
            ---
            
             Parse a URI string into a Uri structure according to RFC3986.
            
             # Example
            
             ```moonbit nocheck
             let uri = @uri.parse("https://user:pass@example.com:8080/path?query=value#fragment")
             inspect(uri.scheme(), content="Some(\"https\")")
             inspect(uri.host(), content="Some(\"example.com\")")
             inspect(uri.port(), content="Some(8080)")
             ```
            
             # Parameters
            
             - `uri_str`: The URI string to parse
            
             # Returns
            
             A parsed `Uri` structure
            
             # Raises
            
             - `UriError::EmptyUri` if the input string is empty
             - `UriError::InvalidScheme` if the scheme is malformed
             - `UriError::InvalidAuthority` if the authority is malformed
             - Other `UriError` variants for various parsing failures
  json_inspect(uri, content={
    "scheme": "https",
````

````mooncram
$ run_moon_ide moon ide hover 'encoded' --loc 'uri_test_new_features.mbt:5:7'
/// Test URL encoding functionality
test "url_encoding" {
  // Test basic encoding
  let encoded = Uri::encode("hello world!")
      ^^^^^^^
      ```moonbit
      String
      ```
  json_inspect(encoded, content="hello%20world%21")

````

````mooncram
$ run_moon_ide moon ide hover 'Uri' --loc 'uri_test_new_features.mbt:5:17'
/// Test URL encoding functionality
test "url_encoding" {
  // Test basic encoding
  let encoded = Uri::encode("hello world!")
                ^^^
                ```moonbit
                struct Uri {
                  scheme: String?
                  authority: Authority?
                  path: String
                  query: String?
                  fragment: String?
                } derive(ToJson)
                ```
                ---
                
                 # MoonBit URI Library
                
                 A comprehensive RFC3986-compliant URI parsing and manipulation library for MoonBit.
                 This library provides robust URI parsing, validation, and manipulation capabilities
                 with full support for all URI components and operations.
                
                 ## Features
                
                 - **RFC3986 Compliant**: Full compliance with URI specification
                 - **Immutable Operations**: All URI modifications return new instances
                 - **Comprehensive Parsing**: Support for all URI components
                 - **Percent Encoding**: Built-in encoding/decoding utilities
                 - **Query Parameter Helpers**: Easy query string manipulation
                 - **Path Segment Operations**: Convenient path manipulation
                 - **URI Resolution**: Resolve relative URIs against base URIs
                 - **Validation**: Robust error handling and validation
                
                 ## Quick Start
                
                 ```moonbit nocheck
                 // Parse a URI
                 let uri = @uri.parse("https://user:pass@example.com:8080/path?query=value#fragment")
                
                 // Access components
                 inspect(uri.scheme(), content="Some(\"https\")")
                 inspect(uri.host(), content="Some(\"example.com\")")
                 inspect(uri.port(), content="Some(8080)")
                 inspect(uri.path(), content="/path")
                
                 // Modify URI (immutable)
                 let new_uri = uri.with_host(Some("newhost.com")).with_port(Some(9000))
                 inspect(new_uri.to_string(), content="https://user:pass@newhost.com:9000/path?query=value#fragment")
                
                 // Query parameter helpers
                 let search_uri = @uri.parse("https://example.com/search")
                 let with_params = search_uri.with_query_param("q", "moonbit").with_query_param("lang", "en")
                 inspect(with_params.to_string(), content="https://example.com/search?q=moonbit&lang=en")
                 ```
                
                 ## URI Structure
                
                 URI data structure representing a parsed URI according to RFC3986
                 
                 A URI has the general form:
                 scheme://authority/path?query#fragment
                 
                 Where:
                 - scheme: identifies the protocol (e.g., "http", "https", "ftp")
                 - authority: contains user info, host, and port
                 - path: hierarchical path to resource
                 - query: additional parameters
                 - fragment: reference to a secondary resource
  json_inspect(encoded, content="hello%20world%21")

````
