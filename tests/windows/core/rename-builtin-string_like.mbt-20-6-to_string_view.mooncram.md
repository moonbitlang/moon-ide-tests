# core rename to_string_view builtin\string_like.mbt:20:6

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\core' moon ide rename 'to_string_view' 'to_string_view_renamed' --loc 'builtin\string_like.mbt:20:6'
*** Begin Patch
*** Update File: <WORKDIR>/builtin\arrayview.mbt
@@
   match self {
     [] => ""
     [hd, .. tl] => {
-      let hd = hd.to_string_view()
+      let hd = hd.to_string_view_renamed()
       let size_hint = for s in tl; size_hint = hd.length() {
-        continue size_hint + s.to_string_view().length() + separator.length()
+        continue size_hint + s.to_string_view_renamed().length() + separator.length()
       } nobreak {
         size_hint
       }
@@
       if separator is "" {
         for s in tl {
           // buf.write_string(s)
-          let s = s.to_string_view()
+          let s = s.to_string_view_renamed()
           buf.write_view(s)
         }
       } else {
         for s in tl {
-          let s = s.to_string_view()
+          let s = s.to_string_view_renamed()
           buf.write_view(separator)
           // buf.write_string(s)
           buf.write_view(s)
*** Update File: <WORKDIR>/builtin\fixedarray.mbt
@@
   if len == 0 {
     return ""
   }
-  let first = self[0].to_string_view()
+  let first = self[0].to_string_view_renamed()
   let size_hint = for i in 1..<len; size_hint = first.length() {
-    continue size_hint + separator.length() + self[i].to_string_view().length()
+    continue size_hint + separator.length() + self[i].to_string_view_renamed().length()
   } nobreak {
     size_hint
   }
@@
   if separator.is_empty() {
     string.write_view(first)
     for i in 1..<len {
-      string.write_view(self[i].to_string_view())
+      string.write_view(self[i].to_string_view_renamed())
     }
   } else {
     string.write_view(first)
@@
         separator.start_offset(),
         separator.length(),
       )
-      string.write_view(self[i].to_string_view())
+      string.write_view(self[i].to_string_view_renamed())
     }
   }
   string.to_string()
*** Update File: <WORKDIR>/builtin\iterator.mbt
@@
 pub fn[A : ToStringView] Iter::join(self : Iter[A], sep : StringView) -> String {
   let result = StringBuilder()
   if self.next() is Some(x) {
-    result.write_view(x.to_string_view())
+    result.write_view(x.to_string_view_renamed())
     while self.next() is Some(x) {
       result.write_view(sep)
-      result.write_view(x.to_string_view())
+      result.write_view(x.to_string_view_renamed())
     }
   }
   result.to_string()
*** Update File: <WORKDIR>/builtin\string_like.mbt
@@
 ///
 /// Types implementing this trait provide zero-copy access to string-like data.
 pub trait ToStringView {
-  fn to_string_view(Self) -> StringView
+  fn to_string_view_renamed(Self) -> StringView
 }
 
 ///|
-pub impl ToStringView for String with fn to_string_view(self) -> StringView {
+pub impl ToStringView for String with fn to_string_view_renamed(self) -> StringView {
   self
 }
 
 ///|
-pub impl ToStringView for StringView with fn to_string_view(self) -> StringView {
+pub impl ToStringView for StringView with fn to_string_view_renamed(self) -> StringView {
   self
 }
*** End Patch

```
