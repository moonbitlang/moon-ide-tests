# core find-references to_string_view builtin/string_like.mbt:20:6

```mooncram
$ export MOON_HOME="${MOON_HOME:-$HOME/.moon}"
```

```mooncram
$ export TEST_REPO_ROOT="$(cd "$TESTDIR/../../../fixtures/repos/core" && pwd)"
```

```mooncram
$ normalize_moon_ide_output() { sed -e "s|$TEST_REPO_ROOT|<WORKDIR>|g" -e "s|$MOON_HOME|<MOON_HOME>|g"; }
```

```mooncram
$ run_moon_ide() { status_file="${TMPDIR:-/tmp}/moon-ide-status.$$"; ( cd "$TEST_REPO_ROOT" && "$@"; echo "$?" > "$status_file" ) 2>&1 | normalize_moon_ide_output; status=$(cat "$status_file"); rm -f "$status_file"; return "$status"; }
```

```mooncram
$ run_moon_ide moon ide find-references 'to_string_view' --loc 'builtin/string_like.mbt:20:6'
Found 13 references for symbol 'to_string_view':
<WORKDIR>/builtin/arrayview.mbt:1498:19-1498:33:
     |   match self {
     |     [] => ""
     |     [hd, .. tl] => {
1498 |       let hd = hd.to_string_view()
     |                   ^^^^^^^^^^^^^^
     |       let size_hint = for s in tl; size_hint = hd.length() {
     |         continue size_hint + s.to_string_view().length() + separator.length()

<WORKDIR>/builtin/arrayview.mbt:1500:32-1500:46:
     |     [hd, .. tl] => {
     |       let hd = hd.to_string_view()
     |       let size_hint = for s in tl; size_hint = hd.length() {
1500 |         continue size_hint + s.to_string_view().length() + separator.length()
     |                                ^^^^^^^^^^^^^^
     |       } nobreak {
     |         size_hint

<WORKDIR>/builtin/arrayview.mbt:1511:21-1511:35:
     |       if separator is "" {
     |         for s in tl {
     |           // buf.write_string(s)
1511 |           let s = s.to_string_view()
     |                     ^^^^^^^^^^^^^^
     |           buf.write_view(s)
     |         }

<WORKDIR>/builtin/arrayview.mbt:1516:21-1516:35:
     |         }
     |       } else {
     |         for s in tl {
1516 |           let s = s.to_string_view()
     |                     ^^^^^^^^^^^^^^
     |           buf.write_view(separator)
     |           // buf.write_string(s)

<WORKDIR>/builtin/fixedarray.mbt:1482:23-1482:37:
     |   if len == 0 {
     |     return ""
     |   }
1482 |   let first = self[0].to_string_view()
     |                       ^^^^^^^^^^^^^^
     |   let size_hint = for i in 1..<len; size_hint = first.length() {
     |     continue size_hint + separator.length() + self[i].to_string_view().length()

<WORKDIR>/builtin/fixedarray.mbt:1484:55-1484:69:
     |   }
     |   let first = self[0].to_string_view()
     |   let size_hint = for i in 1..<len; size_hint = first.length() {
1484 |     continue size_hint + separator.length() + self[i].to_string_view().length()
     |                                                       ^^^^^^^^^^^^^^
     |   } nobreak {
     |     size_hint

<WORKDIR>/builtin/fixedarray.mbt:1492:33-1492:47:
     |   if separator.is_empty() {
     |     string.write_view(first)
     |     for i in 1..<len {
1492 |       string.write_view(self[i].to_string_view())
     |                                 ^^^^^^^^^^^^^^
     |     }
     |   } else {

<WORKDIR>/builtin/fixedarray.mbt:1502:33-1502:47:
     |         separator.start_offset(),
     |         separator.length(),
     |       )
1502 |       string.write_view(self[i].to_string_view())
     |                                 ^^^^^^^^^^^^^^
     |     }
     |   }

<WORKDIR>/builtin/iterator.mbt:477:25-477:39:
    | pub fn[A : ToStringView] Iter::join(self : Iter[A], sep : StringView) -> String {
    |   let result = StringBuilder()
    |   if self.next() is Some(x) {
477 |     result.write_view(x.to_string_view())
    |                         ^^^^^^^^^^^^^^
    |     while self.next() is Some(x) {
    |       result.write_view(sep)

<WORKDIR>/builtin/iterator.mbt:480:27-480:41:
    |     result.write_view(x.to_string_view())
    |     while self.next() is Some(x) {
    |       result.write_view(sep)
480 |       result.write_view(x.to_string_view())
    |                           ^^^^^^^^^^^^^^
    |     }
    |   }

<WORKDIR>/builtin/string_like.mbt:20:6-20:20:
   | ///
   | /// Types implementing this trait provide zero-copy access to string-like data.
   | pub trait ToStringView {
20 |   fn to_string_view(Self) -> StringView
   |      ^^^^^^^^^^^^^^
   | }
   | 

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

```
