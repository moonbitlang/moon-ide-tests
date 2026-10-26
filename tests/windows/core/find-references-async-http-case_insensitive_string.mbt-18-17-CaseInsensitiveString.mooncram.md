# core find-references CaseInsensitiveString async\http\case_insensitive_string.mbt:18:17

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\core' moon ide find-references 'CaseInsensitiveString' --loc 'async\http\case_insensitive_string.mbt:18:17'
Found 17 references for symbol 'CaseInsensitiveString':
<WORKDIR>/async\http\case_insensitive_string.mbt:21:17-21:38:
   | pub(all) struct CaseInsensitiveString(String) derive(@json.ToJson)
   | 
   | ///|
21 | pub impl Eq for CaseInsensitiveString with fn equal(x, y) {
   |                 ^^^^^^^^^^^^^^^^^^^^^
   |   Compare::compare(x, y) == 0
   | }

<WORKDIR>/async\http\case_insensitive_string.mbt:26:22-26:43:
   | }
   | 
   | ///|
26 | pub impl Compare for CaseInsensitiveString with fn compare(x, y) {
   |                      ^^^^^^^^^^^^^^^^^^^^^
   |   x.0.compare_ignore_ascii_case(y.0)
   | }

<WORKDIR>/async\http\case_insensitive_string.mbt:31:27-31:48:
   | }
   | 
   | ///|
31 | pub impl @debug.Debug for CaseInsensitiveString with fn to_repr(self) {
   |                           ^^^^^^^^^^^^^^^^^^^^^
   |   @debug.Debug::to_repr(self.0)
   | }

<WORKDIR>/async\http\case_insensitive_string.mbt:36:19-36:40:
   | }
   | 
   | ///|
36 | pub impl Show for CaseInsensitiveString with fn to_string(self) {
   |                   ^^^^^^^^^^^^^^^^^^^^^
   |   self.0
   | }

<WORKDIR>/async\http\case_insensitive_string.mbt:41:12-41:33:
   | }
   | 
   | ///|
41 | pub extend CaseInsensitiveString with Show::{to_string}
   |            ^^^^^^^^^^^^^^^^^^^^^
   | 
   | ///|

<WORKDIR>/async\http\case_insensitive_string.mbt:44:19-44:40:
   | pub extend CaseInsensitiveString with Show::{to_string}
   | 
   | ///|
44 | pub impl Hash for CaseInsensitiveString with fn hash_combine(self, hasher) {
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
   | #deprecated
   | #doc(hidden)
23 | pub extend CaseInsensitiveString with Eq::{not_equal, equal}
   |            ^^^^^^^^^^^^^^^^^^^^^
   | 
   | ///|

<WORKDIR>/async\http\deprecated_alltarget.mbt:28:12-28:33:
   | ///|
   | #deprecated
   | #doc(hidden)
28 | pub extend CaseInsensitiveString with Compare::{
   |            ^^^^^^^^^^^^^^^^^^^^^
   |   op_lt,
   |   op_le,

<WORKDIR>/async\http\deprecated_alltarget.mbt:39:12-39:33:
   | ///|
   | #deprecated
   | #doc(hidden)
39 | pub extend CaseInsensitiveString with @debug.Debug::{to_repr}
   |            ^^^^^^^^^^^^^^^^^^^^^
   | 
   | ///|

<WORKDIR>/async\http\deprecated_alltarget.mbt:44:12-44:33:
   | ///|
   | #deprecated
   | #doc(hidden)
44 | pub extend CaseInsensitiveString with Show::{output}
   |            ^^^^^^^^^^^^^^^^^^^^^
   | 
   | ///|

<WORKDIR>/async\http\deprecated_alltarget.mbt:49:12-49:33:
   | ///|
   | #deprecated
   | #doc(hidden)
49 | pub extend CaseInsensitiveString with Hash::{hash, hash_combine}
   |            ^^^^^^^^^^^^^^^^^^^^^

<WORKDIR>/async\http\parser.mbt:297:15-297:36:
    |       break
    |     }
    |     guard header_line.find(b":") is Some(colon_index) else { raise BadRequest }
297 |     let key = CaseInsensitiveString(@utf8.decode(header_line[:colon_index]))
    |               ^^^^^^^^^^^^^^^^^^^^^
    |     if !is_valid_http_header_field_name(key.0) {
    |       raise BadRequest

<WORKDIR>/async\http\parser.mbt:332:23-332:44:
    |   }
    |   let chunked = match headers.get("Transfer-Encoding") {
    |     None => false
332 |     Some(encoding) if CaseInsensitiveString(encoding) == "chunked" => true
    |                       ^^^^^^^^^^^^^^^^^^^^^
    |     Some(_) => raise NotImplemented
    |   }

<WORKDIR>/async\http\parser.mbt:338:25-338:46:
    |   let auto_gzip = if self.auto_decompress {
    |     match headers.get("Content-Encoding") {
    |       None => false
338 |       Some(encoding) if CaseInsensitiveString(encoding) == "gzip" => true
    |                         ^^^^^^^^^^^^^^^^^^^^^
    |       Some(_) => raise NotImplemented
    |     }

<WORKDIR>/async\http\send.mbt:38:34-38:55:
   | }
   | 
   | ///|
38 | let forbidden_headers : @set.Set[CaseInsensitiveString] = Set([
   |                                  ^^^^^^^^^^^^^^^^^^^^^
   |   "Content-Length", "Transfer-Encoding",
   | ])

<WORKDIR>/async\http\types.mbt:56:24-56:45:
   | ///
   | /// One important exception to the above rule is the `Set-Cookie` header,
   | /// which is handled specially via the `Cookie` type.
56 | pub type Headers = Map[CaseInsensitiveString, String]
   |                        ^^^^^^^^^^^^^^^^^^^^^
   | 
   | ///|

```
