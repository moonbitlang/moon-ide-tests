# core find-references CaseInsensitiveString async\http\case_insensitive_string.mbt:22:17

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' find-references 'CaseInsensitiveString' --loc 'async\http\case_insensitive_string.mbt:22:17'
Found 31 references for symbol 'CaseInsensitiveString':
<WORKDIR>/async\http\case_insensitive_string.mbt:22:17-22:38:
   | pub(all) struct CaseInsensitiveString(String)
   | 
   | ///|
22 | pub impl Eq for CaseInsensitiveString with fn equal(x, y) {
   |                 ^^^^^^^^^^^^^^^^^^^^^
   |   Compare::compare(x, y) == 0
   | }

<WORKDIR>/async\http\case_insensitive_string.mbt:27:22-27:43:
   | }
   | 
   | ///|
27 | pub impl Compare for CaseInsensitiveString with fn compare(x, y) {
   |                      ^^^^^^^^^^^^^^^^^^^^^
   |   x.0.compare_ignore_ascii_case(y.0)
   | }

<WORKDIR>/async\http\case_insensitive_string.mbt:32:27-32:48:
   | }
   | 
   | ///|
32 | pub impl @debug.Debug for CaseInsensitiveString with fn to_repr(self) {
   |                           ^^^^^^^^^^^^^^^^^^^^^
   |   @debug.Debug::to_repr(self.0)
   | }

<WORKDIR>/async\http\case_insensitive_string.mbt:37:19-37:40:
   | }
   | 
   | ///|
37 | pub impl Show for CaseInsensitiveString with fn to_string(self) {
   |                   ^^^^^^^^^^^^^^^^^^^^^
   |   self.0
   | }

<WORKDIR>/async\http\case_insensitive_string.mbt:42:12-42:33:
   | }
   | 
   | ///|
42 | pub extend CaseInsensitiveString with Show::{to_string}
   |            ^^^^^^^^^^^^^^^^^^^^^
   | 
   | ///|

<WORKDIR>/async\http\case_insensitive_string.mbt:45:19-45:40:
   | pub extend CaseInsensitiveString with Show::{to_string}
   | 
   | ///|
45 | pub impl Hash for CaseInsensitiveString with fn hash_combine(self, hasher) {
   |                   ^^^^^^^^^^^^^^^^^^^^^
   |   for code in self.0.code_units() {
   |     let code = match code {

<WORKDIR>/async\http\deprecated_alltarget.mbt:18:12-18:33:
   | ///|
   | #deprecated
   | #doc(hidden)
18 | pub extend CaseInsensitiveString with @json.ToJson::{to_json}
   |            ^^^^^^^^^^^^^^^^^^^^^
   | 
   | ///|

<WORKDIR>/async\http\deprecated_alltarget.mbt:23:12-23:33:
   | ///|
   | #deprecated("Use `!=` instead", skip_current_package=true)
   | #doc(hidden)
23 | pub extend CaseInsensitiveString with Eq::{not_equal}
   |            ^^^^^^^^^^^^^^^^^^^^^
   | 
   | ///|

<WORKDIR>/async\http\deprecated_alltarget.mbt:28:12-28:33:
   | ///|
   | #deprecated("Use the comparison operators (`<`, `<=`, `>=`, `>`) instead", skip_current_package=true)
   | #doc(hidden)
28 | pub extend CaseInsensitiveString with Compare::{op_lt, op_le, op_ge, op_gt}
   |            ^^^^^^^^^^^^^^^^^^^^^
   | 
   | ///|

<WORKDIR>/async\http\deprecated_alltarget.mbt:33:12-33:33:
   | ///|
   | #deprecated
   | #doc(hidden)
33 | pub extend CaseInsensitiveString with @debug.Debug::{to_repr}
   |            ^^^^^^^^^^^^^^^^^^^^^
   | 
   | ///|

<WORKDIR>/async\http\deprecated_alltarget.mbt:38:12-38:33:
   | ///|
   | #deprecated
   | #doc(hidden)
38 | pub extend CaseInsensitiveString with Show::{output}
   |            ^^^^^^^^^^^^^^^^^^^^^
   | 
   | ///|

<WORKDIR>/async\http\deprecated_alltarget.mbt:43:12-43:33:
   | ///|
   | #deprecated("Use `Hash::hash_combine` instead", skip_current_package=true)
   | #doc(hidden)
43 | pub extend CaseInsensitiveString with Hash::{hash_combine}
   |            ^^^^^^^^^^^^^^^^^^^^^

<WORKDIR>/async\http\extends.mbt:16:12-16:33:
   | // limitations under the License.
   | 
   | ///|
16 | pub extend CaseInsensitiveString with Eq::{equal}
   |            ^^^^^^^^^^^^^^^^^^^^^
   | 
   | ///|

<WORKDIR>/async\http\extends.mbt:19:12-19:33:
   | pub extend CaseInsensitiveString with Eq::{equal}
   | 
   | ///|
19 | pub extend CaseInsensitiveString with Compare::{compare}
   |            ^^^^^^^^^^^^^^^^^^^^^
   | 
   | ///|

<WORKDIR>/async\http\extends.mbt:22:12-22:33:
   | pub extend CaseInsensitiveString with Compare::{compare}
   | 
   | ///|
22 | pub extend CaseInsensitiveString with Hash::{hash}
   |            ^^^^^^^^^^^^^^^^^^^^^
   | 
   | ///|

<WORKDIR>/async\http\parser.mbt:298:15-298:36:
    |       break
    |     }
    |     guard header_line.find(b":") is Some(colon_index) else { raise BadRequest }
298 |     let key = CaseInsensitiveString(@utf8.decode(header_line[:colon_index]))
    |               ^^^^^^^^^^^^^^^^^^^^^
    |     if !is_valid_http_header_field_name(key.0) {
    |       raise BadRequest

<WORKDIR>/async\http\parser.mbt:335:23-335:44:
    |   }
    |   let chunked = match headers.get("Transfer-Encoding") {
    |     None => false
335 |     Some(encoding) if CaseInsensitiveString(encoding) == "chunked" => true
    |                       ^^^^^^^^^^^^^^^^^^^^^
    |     Some(_) => raise NotImplemented
    |   }

<WORKDIR>/async\http\parser.mbt:341:25-341:46:
    |   let auto_gzip = if self.auto_decompress {
    |     match headers.get("Content-Encoding") {
    |       None => false
341 |       Some(encoding) if CaseInsensitiveString(encoding) == "gzip" => true
    |                         ^^^^^^^^^^^^^^^^^^^^^
    |       Some(_) => raise NotImplemented
    |     }

<WORKDIR>/async\http\request_test.mbt:145:17-145:38:
    | 
    | ///|
    | test "CaseInsensitiveString promotes equal, compare and hash" {
145 |   let a = @http.CaseInsensitiveString("Content-Type")
    |                 ^^^^^^^^^^^^^^^^^^^^^
    |   let b = @http.CaseInsensitiveString("content-type")
    |   let c = @http.CaseInsensitiveString("Content-Length")

<WORKDIR>/async\http\request_test.mbt:146:17-146:38:
    | ///|
    | test "CaseInsensitiveString promotes equal, compare and hash" {
    |   let a = @http.CaseInsensitiveString("Content-Type")
146 |   let b = @http.CaseInsensitiveString("content-type")
    |                 ^^^^^^^^^^^^^^^^^^^^^
    |   let c = @http.CaseInsensitiveString("Content-Length")
    |   let eq : (@http.CaseInsensitiveString, @http.CaseInsensitiveString) -> Bool = @http.CaseInsensitiveString::equal

<WORKDIR>/async\http\request_test.mbt:147:17-147:38:
    | test "CaseInsensitiveString promotes equal, compare and hash" {
    |   let a = @http.CaseInsensitiveString("Content-Type")
    |   let b = @http.CaseInsensitiveString("content-type")
147 |   let c = @http.CaseInsensitiveString("Content-Length")
    |                 ^^^^^^^^^^^^^^^^^^^^^
    |   let eq : (@http.CaseInsensitiveString, @http.CaseInsensitiveString) -> Bool = @http.CaseInsensitiveString::equal
    |   let cmp : (@http.CaseInsensitiveString, @http.CaseInsensitiveString) -> Int32 = @http.CaseInsensitiveString::compare

<WORKDIR>/async\http\request_test.mbt:148:19-148:40:
    |   let a = @http.CaseInsensitiveString("Content-Type")
    |   let b = @http.CaseInsensitiveString("content-type")
    |   let c = @http.CaseInsensitiveString("Content-Length")
148 |   let eq : (@http.CaseInsensitiveString, @http.CaseInsensitiveString) -> Bool = @http.CaseInsensitiveString::equal
    |                   ^^^^^^^^^^^^^^^^^^^^^
    |   let cmp : (@http.CaseInsensitiveString, @http.CaseInsensitiveString) -> Int32 = @http.CaseInsensitiveString::compare
    |   let hash : (@http.CaseInsensitiveString) -> Int32 = @http.CaseInsensitiveString::hash

<WORKDIR>/async\http\request_test.mbt:148:48-148:69:
    |   let a = @http.CaseInsensitiveString("Content-Type")
    |   let b = @http.CaseInsensitiveString("content-type")
    |   let c = @http.CaseInsensitiveString("Content-Length")
148 |   let eq : (@http.CaseInsensitiveString, @http.CaseInsensitiveString) -> Bool = @http.CaseInsensitiveString::equal
    |                                                ^^^^^^^^^^^^^^^^^^^^^
    |   let cmp : (@http.CaseInsensitiveString, @http.CaseInsensitiveString) -> Int32 = @http.CaseInsensitiveString::compare
    |   let hash : (@http.CaseInsensitiveString) -> Int32 = @http.CaseInsensitiveString::hash

<WORKDIR>/async\http\request_test.mbt:148:87-148:108:
    |   let a = @http.CaseInsensitiveString("Content-Type")
    |   let b = @http.CaseInsensitiveString("content-type")
    |   let c = @http.CaseInsensitiveString("Content-Length")
148 |   let eq : (@http.CaseInsensitiveString, @http.CaseInsensitiveString) -> Bool = @http.CaseInsensitiveString::equal
    |                                                                                       ^^^^^^^^^^^^^^^^^^^^^
    |   let cmp : (@http.CaseInsensitiveString, @http.CaseInsensitiveString) -> Int32 = @http.CaseInsensitiveString::compare
    |   let hash : (@http.CaseInsensitiveString) -> Int32 = @http.CaseInsensitiveString::hash

<WORKDIR>/async\http\request_test.mbt:149:20-149:41:
    |   let b = @http.CaseInsensitiveString("content-type")
    |   let c = @http.CaseInsensitiveString("Content-Length")
    |   let eq : (@http.CaseInsensitiveString, @http.CaseInsensitiveString) -> Bool = @http.CaseInsensitiveString::equal
149 |   let cmp : (@http.CaseInsensitiveString, @http.CaseInsensitiveString) -> Int32 = @http.CaseInsensitiveString::compare
    |                    ^^^^^^^^^^^^^^^^^^^^^
    |   let hash : (@http.CaseInsensitiveString) -> Int32 = @http.CaseInsensitiveString::hash
    |   inspect(eq(a, b), content="true")

<WORKDIR>/async\http\request_test.mbt:149:49-149:70:
    |   let b = @http.CaseInsensitiveString("content-type")
    |   let c = @http.CaseInsensitiveString("Content-Length")
    |   let eq : (@http.CaseInsensitiveString, @http.CaseInsensitiveString) -> Bool = @http.CaseInsensitiveString::equal
149 |   let cmp : (@http.CaseInsensitiveString, @http.CaseInsensitiveString) -> Int32 = @http.CaseInsensitiveString::compare
    |                                                 ^^^^^^^^^^^^^^^^^^^^^
    |   let hash : (@http.CaseInsensitiveString) -> Int32 = @http.CaseInsensitiveString::hash
    |   inspect(eq(a, b), content="true")

<WORKDIR>/async\http\request_test.mbt:149:89-149:110:
    |   let b = @http.CaseInsensitiveString("content-type")
    |   let c = @http.CaseInsensitiveString("Content-Length")
    |   let eq : (@http.CaseInsensitiveString, @http.CaseInsensitiveString) -> Bool = @http.CaseInsensitiveString::equal
149 |   let cmp : (@http.CaseInsensitiveString, @http.CaseInsensitiveString) -> Int32 = @http.CaseInsensitiveString::compare
    |                                                                                         ^^^^^^^^^^^^^^^^^^^^^
    |   let hash : (@http.CaseInsensitiveString) -> Int32 = @http.CaseInsensitiveString::hash
    |   inspect(eq(a, b), content="true")

<WORKDIR>/async\http\request_test.mbt:150:21-150:42:
    |   let c = @http.CaseInsensitiveString("Content-Length")
    |   let eq : (@http.CaseInsensitiveString, @http.CaseInsensitiveString) -> Bool = @http.CaseInsensitiveString::equal
    |   let cmp : (@http.CaseInsensitiveString, @http.CaseInsensitiveString) -> Int32 = @http.CaseInsensitiveString::compare
150 |   let hash : (@http.CaseInsensitiveString) -> Int32 = @http.CaseInsensitiveString::hash
    |                     ^^^^^^^^^^^^^^^^^^^^^
    |   inspect(eq(a, b), content="true")
    |   inspect(a.equal(c), content="false")

<WORKDIR>/async\http\request_test.mbt:150:61-150:82:
    |   let c = @http.CaseInsensitiveString("Content-Length")
    |   let eq : (@http.CaseInsensitiveString, @http.CaseInsensitiveString) -> Bool = @http.CaseInsensitiveString::equal
    |   let cmp : (@http.CaseInsensitiveString, @http.CaseInsensitiveString) -> Int32 = @http.CaseInsensitiveString::compare
150 |   let hash : (@http.CaseInsensitiveString) -> Int32 = @http.CaseInsensitiveString::hash
    |                                                             ^^^^^^^^^^^^^^^^^^^^^
    |   inspect(eq(a, b), content="true")
    |   inspect(a.equal(c), content="false")

<WORKDIR>/async\http\send.mbt:38:34-38:55:
   | }
   | 
   | ///|
38 | let forbidden_headers : @set.Set[CaseInsensitiveString] = Set([
   |                                  ^^^^^^^^^^^^^^^^^^^^^
   |   "Content-Length", "Transfer-Encoding",
   | ])

<WORKDIR>/async\http\types.mbt:67:24-67:45:
   | ///
   | /// One important exception to the above rule is the `Set-Cookie` header,
   | /// which is handled specially via the `Cookie` type.
67 | pub type Headers = Map[CaseInsensitiveString, String]
   |                        ^^^^^^^^^^^^^^^^^^^^^
   | 
   | ///|
"" (escaped)
```
