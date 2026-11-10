# core rename CaseInsensitiveString async\http\case_insensitive_string.mbt:21:17

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\core' moon ide rename 'CaseInsensitiveString' 'CaseInsensitiveStringRenamed' --loc 'async\http\case_insensitive_string.mbt:21:17'
*** Begin Patch
*** Update File: <WORKDIR>/async\http\case_insensitive_string.mbt
@@
 ///|
 /// String type with case insensitive comparison (in the ASCII sense).
 /// This type is implicitly convertible from `String` & string literal.
-pub(all) struct CaseInsensitiveString(String) derive(@json.ToJson)
+pub(all) struct CaseInsensitiveStringRenamed(String) derive(@json.ToJson)
 
 ///|
-pub impl Eq for CaseInsensitiveString with fn equal(x, y) {
+pub impl Eq for CaseInsensitiveStringRenamed with fn equal(x, y) {
   Compare::compare(x, y) == 0
 }
 
 ///|
-pub impl Compare for CaseInsensitiveString with fn compare(x, y) {
+pub impl Compare for CaseInsensitiveStringRenamed with fn compare(x, y) {
   x.0.compare_ignore_ascii_case(y.0)
 }
 
 ///|
-pub impl @debug.Debug for CaseInsensitiveString with fn to_repr(self) {
+pub impl @debug.Debug for CaseInsensitiveStringRenamed with fn to_repr(self) {
   @debug.Debug::to_repr(self.0)
 }
 
 ///|
-pub impl Show for CaseInsensitiveString with fn to_string(self) {
+pub impl Show for CaseInsensitiveStringRenamed with fn to_string(self) {
   self.0
 }
 
 ///|
-pub extend CaseInsensitiveString with Show::{to_string}
+pub extend CaseInsensitiveStringRenamed with Show::{to_string}
 
 ///|
-pub impl Hash for CaseInsensitiveString with fn hash_combine(self, hasher) {
+pub impl Hash for CaseInsensitiveStringRenamed with fn hash_combine(self, hasher) {
   for code in self.0.code_units() {
     let code = match code {
       'A'..<='Z' => code + ('a' - 'A')
*** Update File: <WORKDIR>/async\http\deprecated_alltarget.mbt
@@
 ///|
 #deprecated
 #doc(hidden)
-pub extend CaseInsensitiveString with @json.ToJson::{to_json}
+pub extend CaseInsensitiveStringRenamed with @json.ToJson::{to_json}
 
 ///|
 #deprecated
 #doc(hidden)
-pub extend CaseInsensitiveString with Eq::{not_equal, equal}
+pub extend CaseInsensitiveStringRenamed with Eq::{not_equal, equal}
 
 ///|
 #deprecated
 #doc(hidden)
-pub extend CaseInsensitiveString with Compare::{
+pub extend CaseInsensitiveStringRenamed with Compare::{
   op_lt,
   op_le,
   op_ge,
@@
 ///|
 #deprecated
 #doc(hidden)
-pub extend CaseInsensitiveString with @debug.Debug::{to_repr}
+pub extend CaseInsensitiveStringRenamed with @debug.Debug::{to_repr}
 
 ///|
 #deprecated
 #doc(hidden)
-pub extend CaseInsensitiveString with Show::{output}
+pub extend CaseInsensitiveStringRenamed with Show::{output}
 
 ///|
 #deprecated
 #doc(hidden)
-pub extend CaseInsensitiveString with Hash::{hash, hash_combine}
+pub extend CaseInsensitiveStringRenamed with Hash::{hash, hash_combine}
*** Update File: <WORKDIR>/async\http\parser.mbt
@@
       break
     }
     guard header_line.find(b":") is Some(colon_index) else { raise BadRequest }
-    let key = CaseInsensitiveString(@utf8.decode(header_line[:colon_index]))
+    let key = CaseInsensitiveStringRenamed(@utf8.decode(header_line[:colon_index]))
     if !is_valid_http_header_field_name(key.0) {
       raise BadRequest
     }
@@
   }
   let chunked = match headers.get("Transfer-Encoding") {
     None => false
-    Some(encoding) if CaseInsensitiveString(encoding) == "chunked" => true
+    Some(encoding) if CaseInsensitiveStringRenamed(encoding) == "chunked" => true
     Some(_) => raise NotImplemented
   }
   let auto_gzip = if self.auto_decompress {
     match headers.get("Content-Encoding") {
       None => false
-      Some(encoding) if CaseInsensitiveString(encoding) == "gzip" => true
+      Some(encoding) if CaseInsensitiveStringRenamed(encoding) == "gzip" => true
       Some(_) => raise NotImplemented
     }
   } else {
*** Update File: <WORKDIR>/async\http\send.mbt
@@
 }
 
 ///|
-let forbidden_headers : @set.Set[CaseInsensitiveString] = Set([
+let forbidden_headers : @set.Set[CaseInsensitiveStringRenamed] = Set([
   "Content-Length", "Transfer-Encoding",
 ])
 
*** Update File: <WORKDIR>/async\http\types.mbt
@@
 ///
 /// One important exception to the above rule is the `Set-Cookie` header,
 /// which is handled specially via the `Cookie` type.
-pub type Headers = Map[CaseInsensitiveString, String]
+pub type Headers = Map[CaseInsensitiveStringRenamed, String]
 
 ///|
 /// HTTP request header
*** End Patch

```
