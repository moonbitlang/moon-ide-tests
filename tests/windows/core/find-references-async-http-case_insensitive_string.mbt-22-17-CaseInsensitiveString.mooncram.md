# core find-references CaseInsensitiveString async\http\case_insensitive_string.mbt:22:17

```mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' find-references 'CaseInsensitiveString' --loc 'async\http\case_insensitive_string.mbt:22:17'
Found 25 references for symbol 'CaseInsensitiveString':
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

<WORKDIR>/async\http\parser.mbt:313:15-313:36:
    |       break
    |     }
    |     guard header_line.find(b":") is Some(colon_index) else { raise BadMessage }
313 |     let key = CaseInsensitiveString(@utf8.decode(header_line[:colon_index]))
    |               ^^^^^^^^^^^^^^^^^^^^^
    |     if !is_valid_http_header_field_name(key.0) {
    |       raise BadMessage

<WORKDIR>/async\http\parser.mbt:357:23-357:44:
    |   }
    |   let chunked = match headers.get("Transfer-Encoding") {
    |     None => false
357 |     Some(encoding) if CaseInsensitiveString(encoding) == "chunked" => true
    |                       ^^^^^^^^^^^^^^^^^^^^^
    |     Some(_) => raise NotImplemented
    |   }

<WORKDIR>/async\http\parser.mbt:363:25-363:46:
    |   let auto_gzip = if self.auto_decompress {
    |     match headers.get("Content-Encoding") {
    |       None => false
363 |       Some(encoding) if CaseInsensitiveString(encoding) == "gzip" => true
    |                         ^^^^^^^^^^^^^^^^^^^^^
    |       Some(_) => raise NotImplemented
    |     }

<WORKDIR>/async\http\request_test.mbt:161:17-161:38:
    | 
    | ///|
    | test "CaseInsensitiveString promotes equal, compare and hash" {
161 |   let a = @http.CaseInsensitiveString("Content-Type")
    |                 ^^^^^^^^^^^^^^^^^^^^^
    |   let b = @http.CaseInsensitiveString("content-type")
    |   let c = @http.CaseInsensitiveString("Content-Length")

<WORKDIR>/async\http\request_test.mbt:162:17-162:38:
    | ///|
    | test "CaseInsensitiveString promotes equal, compare and hash" {
    |   let a = @http.CaseInsensitiveString("Content-Type")
162 |   let b = @http.CaseInsensitiveString("content-type")
    |                 ^^^^^^^^^^^^^^^^^^^^^
    |   let c = @http.CaseInsensitiveString("Content-Length")
    |   let eq : (@http.CaseInsensitiveString, @http.CaseInsensitiveString) -> Bool = @http.CaseInsensitiveString::equal

<WORKDIR>/async\http\request_test.mbt:163:17-163:38:
    | test "CaseInsensitiveString promotes equal, compare and hash" {
    |   let a = @http.CaseInsensitiveString("Content-Type")
    |   let b = @http.CaseInsensitiveString("content-type")
163 |   let c = @http.CaseInsensitiveString("Content-Length")
    |                 ^^^^^^^^^^^^^^^^^^^^^
    |   let eq : (@http.CaseInsensitiveString, @http.CaseInsensitiveString) -> Bool = @http.CaseInsensitiveString::equal
    |   let cmp : (@http.CaseInsensitiveString, @http.CaseInsensitiveString) -> Int32 = @http.CaseInsensitiveString::compare

<WORKDIR>/async\http\request_test.mbt:164:19-164:40:
    |   let a = @http.CaseInsensitiveString("Content-Type")
    |   let b = @http.CaseInsensitiveString("content-type")
    |   let c = @http.CaseInsensitiveString("Content-Length")
164 |   let eq : (@http.CaseInsensitiveString, @http.CaseInsensitiveString) -> Bool = @http.CaseInsensitiveString::equal
    |                   ^^^^^^^^^^^^^^^^^^^^^
    |   let cmp : (@http.CaseInsensitiveString, @http.CaseInsensitiveString) -> Int32 = @http.CaseInsensitiveString::compare
    |   let hash : (@http.CaseInsensitiveString) -> Int32 = @http.CaseInsensitiveString::hash

<WORKDIR>/async\http\request_test.mbt:164:48-164:69:
    |   let a = @http.CaseInsensitiveString("Content-Type")
    |   let b = @http.CaseInsensitiveString("content-type")
    |   let c = @http.CaseInsensitiveString("Content-Length")
164 |   let eq : (@http.CaseInsensitiveString, @http.CaseInsensitiveString) -> Bool = @http.CaseInsensitiveString::equal
    |                                                ^^^^^^^^^^^^^^^^^^^^^
    |   let cmp : (@http.CaseInsensitiveString, @http.CaseInsensitiveString) -> Int32 = @http.CaseInsensitiveString::compare
    |   let hash : (@http.CaseInsensitiveString) -> Int32 = @http.CaseInsensitiveString::hash

<WORKDIR>/async\http\request_test.mbt:164:87-164:108:
    |   let a = @http.CaseInsensitiveString("Content-Type")
    |   let b = @http.CaseInsensitiveString("content-type")
    |   let c = @http.CaseInsensitiveString("Content-Length")
164 |   let eq : (@http.CaseInsensitiveString, @http.CaseInsensitiveString) -> Bool = @http.CaseInsensitiveString::equal
    |                                                                                       ^^^^^^^^^^^^^^^^^^^^^
    |   let cmp : (@http.CaseInsensitiveString, @http.CaseInsensitiveString) -> Int32 = @http.CaseInsensitiveString::compare
    |   let hash : (@http.CaseInsensitiveString) -> Int32 = @http.CaseInsensitiveString::hash

<WORKDIR>/async\http\request_test.mbt:165:20-165:41:
    |   let b = @http.CaseInsensitiveString("content-type")
    |   let c = @http.CaseInsensitiveString("Content-Length")
    |   let eq : (@http.CaseInsensitiveString, @http.CaseInsensitiveString) -> Bool = @http.CaseInsensitiveString::equal
165 |   let cmp : (@http.CaseInsensitiveString, @http.CaseInsensitiveString) -> Int32 = @http.CaseInsensitiveString::compare
    |                    ^^^^^^^^^^^^^^^^^^^^^
    |   let hash : (@http.CaseInsensitiveString) -> Int32 = @http.CaseInsensitiveString::hash
    |   inspect(eq(a, b), content="true")

<WORKDIR>/async\http\request_test.mbt:165:49-165:70:
    |   let b = @http.CaseInsensitiveString("content-type")
    |   let c = @http.CaseInsensitiveString("Content-Length")
    |   let eq : (@http.CaseInsensitiveString, @http.CaseInsensitiveString) -> Bool = @http.CaseInsensitiveString::equal
165 |   let cmp : (@http.CaseInsensitiveString, @http.CaseInsensitiveString) -> Int32 = @http.CaseInsensitiveString::compare
    |                                                 ^^^^^^^^^^^^^^^^^^^^^
    |   let hash : (@http.CaseInsensitiveString) -> Int32 = @http.CaseInsensitiveString::hash
    |   inspect(eq(a, b), content="true")

<WORKDIR>/async\http\request_test.mbt:165:89-165:110:
    |   let b = @http.CaseInsensitiveString("content-type")
    |   let c = @http.CaseInsensitiveString("Content-Length")
    |   let eq : (@http.CaseInsensitiveString, @http.CaseInsensitiveString) -> Bool = @http.CaseInsensitiveString::equal
165 |   let cmp : (@http.CaseInsensitiveString, @http.CaseInsensitiveString) -> Int32 = @http.CaseInsensitiveString::compare
    |                                                                                         ^^^^^^^^^^^^^^^^^^^^^
    |   let hash : (@http.CaseInsensitiveString) -> Int32 = @http.CaseInsensitiveString::hash
    |   inspect(eq(a, b), content="true")

<WORKDIR>/async\http\request_test.mbt:166:21-166:42:
    |   let c = @http.CaseInsensitiveString("Content-Length")
    |   let eq : (@http.CaseInsensitiveString, @http.CaseInsensitiveString) -> Bool = @http.CaseInsensitiveString::equal
    |   let cmp : (@http.CaseInsensitiveString, @http.CaseInsensitiveString) -> Int32 = @http.CaseInsensitiveString::compare
166 |   let hash : (@http.CaseInsensitiveString) -> Int32 = @http.CaseInsensitiveString::hash
    |                     ^^^^^^^^^^^^^^^^^^^^^
    |   inspect(eq(a, b), content="true")
    |   inspect(a.equal(c), content="false")

<WORKDIR>/async\http\request_test.mbt:166:61-166:82:
    |   let c = @http.CaseInsensitiveString("Content-Length")
    |   let eq : (@http.CaseInsensitiveString, @http.CaseInsensitiveString) -> Bool = @http.CaseInsensitiveString::equal
    |   let cmp : (@http.CaseInsensitiveString, @http.CaseInsensitiveString) -> Int32 = @http.CaseInsensitiveString::compare
166 |   let hash : (@http.CaseInsensitiveString) -> Int32 = @http.CaseInsensitiveString::hash
    |                                                             ^^^^^^^^^^^^^^^^^^^^^
    |   inspect(eq(a, b), content="true")
    |   inspect(a.equal(c), content="false")

<WORKDIR>/async\http\send.mbt:39:34-39:55:
   | }
   | 
   | ///|
39 | let forbidden_headers : @set.Set[CaseInsensitiveString] = Set([
   |                                  ^^^^^^^^^^^^^^^^^^^^^
   |   "Host", "User-Agent", "Accept-Encoding", "Content-Length", "Transfer-Encoding",
   | ])

<WORKDIR>/async\http\types.mbt:59:24-59:45:
   | ///
   | /// One important exception to the above rule is the `Set-Cookie` header,
   | /// which is handled specially via the `Cookie` type.
59 | pub type Headers = Map[CaseInsensitiveString, String]
   |                        ^^^^^^^^^^^^^^^^^^^^^
   | 
   | ///|
"" (escaped)
```
