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
Found 10 references for symbol 'ToStringView':
<WORKDIR>/builtin/array.mbt:2193:12-2193:24:
     | ///   inspect(s.split(" ").to_array().join(":"), content="hello:world")
     | /// }
     | /// ```
2193 | pub fn[A : ToStringView] Array::join(
     |            ^^^^^^^^^^^^
     |   self : Array[A],
     |   separator : StringView,

<WORKDIR>/builtin/arrayview.mbt:1655:12-1655:24:
     | ///   inspect(array_view.join(","), content="1,2,3")
     | /// }
     | /// ```
1655 | pub fn[A : ToStringView] ArrayView::join(
     |            ^^^^^^^^^^^^
     |   self : ArrayView[A],
     |   separator : StringView,

<WORKDIR>/builtin/extends.mbt:454:24-454:36:
    | pub extend String with Show::{to_string}
    | 
    | ///|
454 | pub extend String with ToStringView::{to_string_view}
    |                        ^^^^^^^^^^^^
    | 
    | ///|

<WORKDIR>/builtin/extends.mbt:477:28-477:40:
    | pub extend StringView with Hash::{hash}
    | 
    | ///|
477 | pub extend StringView with ToStringView::{to_string_view}
    |                            ^^^^^^^^^^^^
    | 
    | ///|

<WORKDIR>/builtin/fixedarray.mbt:1487:12-1487:24:
     | ///   inspect(fixed_array.join(","), content="1,2,3")
     | /// }
     | /// ```
1487 | pub fn[A : ToStringView] FixedArray::join(
     |            ^^^^^^^^^^^^
     |   self : FixedArray[A],
     |   separator : StringView,

<WORKDIR>/builtin/iterator.mbt:476:12-476:24:
    | /// Collects the string-renderable elements of the iterator into a single
    | /// string, separated by `sep`.
    | /// The old iterator `self` must not be used again after calling `join`.
476 | pub fn[A : ToStringView] Iter::join(self : Iter[A], sep : StringView) -> String {
    |            ^^^^^^^^^^^^
    |   let result = StringBuilder()
    |   if self.next() is Some(x) {

<WORKDIR>/builtin/readonlyarray.mbt:967:12-967:24:
    | ///   inspect(arr.join(" "), content="hello world moon")
    | /// }
    | /// ```
967 | pub fn[A : ToStringView] ReadOnlyArray::join(
    |            ^^^^^^^^^^^^
    |   self : ReadOnlyArray[A],
    |   separator : StringView,

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
