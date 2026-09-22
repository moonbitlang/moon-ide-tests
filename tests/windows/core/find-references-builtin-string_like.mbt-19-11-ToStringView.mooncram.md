# core find-references ToStringView builtin\string_like.mbt:19:11

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\core' moon ide find-references 'ToStringView' --loc 'builtin\string_like.mbt:19:11'
Found 10 references for symbol 'ToStringView':
<WORKDIR>/builtin\array.mbt:2188:12-2188:24:
     | ///   inspect(s.split(" ").to_array().join(":"), content="hello:world")
     | /// }
     | /// ```
2188 | pub fn[A : ToStringView] Array::join(
     |            ^^^^^^^^^^^^
     |   self : Array[A],
     |   separator : StringView,

<WORKDIR>/builtin\arrayview.mbt:1653:12-1653:24:
     | ///   inspect(array_view.join(","), content="1,2,3")
     | /// }
     | /// ```
1653 | pub fn[A : ToStringView] ArrayView::join(
     |            ^^^^^^^^^^^^
     |   self : ArrayView[A],
     |   separator : StringView,

<WORKDIR>/builtin\extends.mbt:508:24-508:36:
    | pub extend String with ToJson::{to_json}
    | 
    | ///|
508 | pub extend String with ToStringView::{to_string_view}
    |                        ^^^^^^^^^^^^
    | 
    | ///|

<WORKDIR>/builtin\extends.mbt:534:28-534:40:
    | pub extend StringView with ToJson::{to_json}
    | 
    | ///|
534 | pub extend StringView with ToStringView::{to_string_view}
    |                            ^^^^^^^^^^^^
    | 
    | ///|

<WORKDIR>/builtin\fixedarray.mbt:1485:12-1485:24:
     | ///   inspect(fixed_array.join(","), content="1,2,3")
     | /// }
     | /// ```
1485 | pub fn[A : ToStringView] FixedArray::join(
     |            ^^^^^^^^^^^^
     |   self : FixedArray[A],
     |   separator : StringView,

<WORKDIR>/builtin\iterator.mbt:476:12-476:24:
    | /// Collects the string-renderable elements of the iterator into a single
    | /// string, separated by `sep`.
    | /// The old iterator `self` must not be used again after calling `join`.
476 | pub fn[A : ToStringView] Iter::join(self : Iter[A], sep : StringView) -> String {
    |            ^^^^^^^^^^^^
    |   let result = StringBuilder()
    |   if self.next() is Some(x) {

<WORKDIR>/builtin\readonlyarray.mbt:965:12-965:24:
    | ///   inspect(arr.join(" "), content="hello world moon")
    | /// }
    | /// ```
965 | pub fn[A : ToStringView] ReadOnlyArray::join(
    |            ^^^^^^^^^^^^
    |   self : ReadOnlyArray[A],
    |   separator : StringView,

<WORKDIR>/builtin\string_like.mbt:24:10-24:22:
   | }
   | 
   | ///|
24 | pub impl ToStringView for String with fn to_string_view(self) -> StringView {
   |          ^^^^^^^^^^^^
   |   self
   | }

<WORKDIR>/builtin\string_like.mbt:29:10-29:22:
   | }
   | 
   | ///|
29 | pub impl ToStringView for StringView with fn to_string_view(self) -> StringView {
   |          ^^^^^^^^^^^^
   |   self
   | }

<WORKDIR>/string\view.mbt:16:27-16:39:
   | // limitations under the License.
   | 
   | ///|
16 | pub using @builtin {trait ToStringView}
   |                           ^^^^^^^^^^^^
   | 
   | ///|

```
