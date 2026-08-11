# core find-references ToStringView builtin/string_like.mbt:19:11

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
$ run_moon_ide moon ide find-references 'ToStringView' --loc 'builtin/string_like.mbt:19:11'
Found 11 references for symbol 'ToStringView':
<WORKDIR>/builtin/array.mbt:2182:12-2182:24:
     | ///   inspect(s.split(" ").to_array().join(":"), content="hello:world")
     | /// }
     | /// ```
2182 | pub fn[A : ToStringView] Array::join(
     |            ^^^^^^^^^^^^
     |   self : Array[A],
     |   separator : StringView,

<WORKDIR>/builtin/arrayview.mbt:1485:12-1485:24:
     | ///   inspect(array_view.join(","), content="1,2,3")
     | /// }
     | /// ```
1485 | pub fn[A : ToStringView] ArrayView::join(
     |            ^^^^^^^^^^^^
     |   self : ArrayView[A],
     |   separator : StringView,

<WORKDIR>/builtin/extends.mbt:508:24-508:36:
    | pub extend String with ToJson::{to_json}
    | 
    | ///|
508 | pub extend String with ToStringView::{to_string_view}
    |                        ^^^^^^^^^^^^
    | 
    | ///|

<WORKDIR>/builtin/extends.mbt:534:28-534:40:
    | pub extend StringView with ToJson::{to_json}
    | 
    | ///|
534 | pub extend StringView with ToStringView::{to_string_view}
    |                            ^^^^^^^^^^^^
    | 
    | ///|

<WORKDIR>/builtin/fixedarray.mbt:1476:12-1476:24:
     | ///   inspect(fixed_array.join(","), content="1,2,3")
     | /// }
     | /// ```
1476 | pub fn[A : ToStringView] FixedArray::join(
     |            ^^^^^^^^^^^^
     |   self : FixedArray[A],
     |   separator : StringView,

<WORKDIR>/builtin/iterator.mbt:473:12-473:24:
    | /// Collects the string-renderable elements of the iterator into a single
    | /// string, separated by `sep`.
    | /// The old iterator `self` must not be used again after calling `join`.
473 | pub fn[A : ToStringView] Iter::join(self : Iter[A], sep : StringView) -> String {
    |            ^^^^^^^^^^^^
    |   let result = StringBuilder()
    |   if self.next() is Some(x) {

<WORKDIR>/builtin/readonlyarray.mbt:925:12-925:24:
    | ///   inspect(arr.join(" "), content="hello world moon")
    | /// }
    | /// ```
925 | pub fn[A : ToStringView] ReadOnlyArray::join(
    |            ^^^^^^^^^^^^
    |   self : ReadOnlyArray[A],
    |   separator : StringView,

<WORKDIR>/builtin/string_like.mbt:19:11-19:23:
   | /// Trait for values that can be viewed as `StringView`.
   | ///
   | /// Types implementing this trait provide zero-copy access to string-like data.
19 | pub trait ToStringView {
   |           ^^^^^^^^^^^^
   |   fn to_string_view(Self) -> StringView
   | }

<WORKDIR>/builtin/string_like.mbt:24:10-24:22:
   | }
   | 
   | ///|
24 | pub impl ToStringView for String with fn to_string_view(self) -> StringView {
   |          ^^^^^^^^^^^^
   |   self
   | }

<WORKDIR>/builtin/string_like.mbt:29:10-29:22:
   | }
   | 
   | ///|
29 | pub impl ToStringView for StringView with fn to_string_view(self) -> StringView {
   |          ^^^^^^^^^^^^
   |   self
   | }

<WORKDIR>/string/view.mbt:16:27-16:39:
   | // limitations under the License.
   | 
   | ///|
16 | pub using @builtin {trait ToStringView}
   |                           ^^^^^^^^^^^^
   | 
   | ///|

```
