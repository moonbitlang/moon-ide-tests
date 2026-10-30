# core find-references to_string_view builtin/string_like.mbt:20:6

````mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../fixtures/repos/core' moon ide find-references 'to_string_view' --loc 'builtin/string_like.mbt:20:6'
Found 12 references for symbol 'to_string_view':
<WORKDIR>/builtin/arrayview.mbt:1692:19-1692:33:
     |   match self {
     |     [] => ""
     |     [hd, .. tl] => {
1692 |       let hd = hd.to_string_view()
     |                   ^^^^^^^^^^^^^^
     |       let size_hint = for s in tl; size_hint = hd.length() {
     |         continue size_hint + s.to_string_view().length() + separator.length()

<WORKDIR>/builtin/arrayview.mbt:1694:32-1694:46:
     |     [hd, .. tl] => {
     |       let hd = hd.to_string_view()
     |       let size_hint = for s in tl; size_hint = hd.length() {
1694 |         continue size_hint + s.to_string_view().length() + separator.length()
     |                                ^^^^^^^^^^^^^^
     |       } nobreak {
     |         size_hint

<WORKDIR>/builtin/arrayview.mbt:1705:21-1705:35:
     |       if separator is "" {
     |         for s in tl {
     |           // buf.write_string(s)
1705 |           let s = s.to_string_view()
     |                     ^^^^^^^^^^^^^^
     |           buf.write_view(s)
     |         }

<WORKDIR>/builtin/arrayview.mbt:1710:21-1710:35:
     |         }
     |       } else {
     |         for s in tl {
1710 |           let s = s.to_string_view()
     |                     ^^^^^^^^^^^^^^
     |           buf.write_view(separator)
     |           // buf.write_string(s)

<WORKDIR>/builtin/fixedarray.mbt:1531:23-1531:37:
     |   if len == 0 {
     |     return ""
     |   }
1531 |   let first = self[0].to_string_view()
     |                       ^^^^^^^^^^^^^^
     |   let size_hint = for i in 1..<len; size_hint = first.length() {
     |     continue size_hint + separator.length() + self[i].to_string_view().length()

<WORKDIR>/builtin/fixedarray.mbt:1533:55-1533:69:
     |   }
     |   let first = self[0].to_string_view()
     |   let size_hint = for i in 1..<len; size_hint = first.length() {
1533 |     continue size_hint + separator.length() + self[i].to_string_view().length()
     |                                                       ^^^^^^^^^^^^^^
     |   } nobreak {
     |     size_hint

<WORKDIR>/builtin/fixedarray.mbt:1541:33-1541:47:
     |   if separator.is_empty() {
     |     string.write_view(first)
     |     for i in 1..<len {
1541 |       string.write_view(self[i].to_string_view())
     |                                 ^^^^^^^^^^^^^^
     |     }
     |   } else {

<WORKDIR>/builtin/fixedarray.mbt:1551:33-1551:47:
     |         separator.start_offset(),
     |         separator.length(),
     |       )
1551 |       string.write_view(self[i].to_string_view())
     |                                 ^^^^^^^^^^^^^^
     |     }
     |   }

<WORKDIR>/builtin/iterator.mbt:482:25-482:39:
    | pub fn[A : ToStringView] Iter::join(self : Iter[A], sep : StringView) -> String {
    |   let result = StringBuilder()
    |   if self.next() is Some(x) {
482 |     result.write_view(x.to_string_view())
    |                         ^^^^^^^^^^^^^^
    |     while self.next() is Some(x) {
    |       result.write_view(sep)

<WORKDIR>/builtin/iterator.mbt:485:27-485:41:
    |     result.write_view(x.to_string_view())
    |     while self.next() is Some(x) {
    |       result.write_view(sep)
485 |       result.write_view(x.to_string_view())
    |                           ^^^^^^^^^^^^^^
    |     }
    |   }

<WORKDIR>/builtin/string_like.mbt:24:42-24:56:
   | }
   | 
   | ///|
24 | pub impl ToStringView for String with fn to_string_view(self) -> StringView {
   |                                          ^^^^^^^^^^^^^^
   |   self
   | }

<WORKDIR>/builtin/string_like.mbt:29:46-29:60:
   | }
   | 
   | ///|
29 | pub impl ToStringView for StringView with fn to_string_view(self) -> StringView {
   |                                              ^^^^^^^^^^^^^^
   |   self
   | }
"" (escaped)
````
