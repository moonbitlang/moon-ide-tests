# core rename ToStringView builtin\string_like.mbt:19:11

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\core' moon ide rename 'ToStringView' 'ToStringViewRenamed' --loc 'builtin\string_like.mbt:19:11'
*** Begin Patch
*** Update File: <WORKDIR>/builtin\array.mbt
@@
 ///   inspect(s.split(" ").to_array().join(":"), content="hello:world")
 /// }
 /// ```
-pub fn[A : ToStringView] Array::join(
+pub fn[A : ToStringViewRenamed] Array::join(
   self : Array[A],
   separator : StringView,
 ) -> String {
*** Update File: <WORKDIR>/builtin\arrayview.mbt
@@
 ///   inspect(array_view.join(","), content="1,2,3")
 /// }
 /// ```
-pub fn[A : ToStringView] ArrayView::join(
+pub fn[A : ToStringViewRenamed] ArrayView::join(
   self : ArrayView[A],
   separator : StringView,
 ) -> String {
*** Update File: <WORKDIR>/builtin\fixedarray.mbt
@@
 ///   inspect(fixed_array.join(","), content="1,2,3")
 /// }
 /// ```
-pub fn[A : ToStringView] FixedArray::join(
+pub fn[A : ToStringViewRenamed] FixedArray::join(
   self : FixedArray[A],
   separator : StringView,
 ) -> String {
*** Update File: <WORKDIR>/builtin\iterator.mbt
@@
 /// Collects the string-renderable elements of the iterator into a single
 /// string, separated by `sep`.
 /// The old iterator `self` must not be used again after calling `join`.
-pub fn[A : ToStringView] Iter::join(self : Iter[A], sep : StringView) -> String {
+pub fn[A : ToStringViewRenamed] Iter::join(self : Iter[A], sep : StringView) -> String {
   let result = StringBuilder()
   if self.next() is Some(x) {
     result.write_view(x.to_string_view())
*** Update File: <WORKDIR>/builtin\readonlyarray.mbt
@@
 ///   inspect(arr.join(" "), content="hello world moon")
 /// }
 /// ```
-pub fn[A : ToStringView] ReadOnlyArray::join(
+pub fn[A : ToStringViewRenamed] ReadOnlyArray::join(
   self : ReadOnlyArray[A],
   separator : StringView,
 ) -> String {
*** Update File: <WORKDIR>/builtin\string_like.mbt
@@
 /// Trait for values that can be viewed as `StringView`.
 ///
 /// Types implementing this trait provide zero-copy access to string-like data.
-pub trait ToStringView {
+pub trait ToStringViewRenamed {
   fn to_string_view(Self) -> StringView
 }
 
 ///|
-pub impl ToStringView for String with fn to_string_view(self) -> StringView {
+pub impl ToStringViewRenamed for String with fn to_string_view(self) -> StringView {
   self
 }
 
 ///|
-pub impl ToStringView for StringView with fn to_string_view(self) -> StringView {
+pub impl ToStringViewRenamed for StringView with fn to_string_view(self) -> StringView {
   self
 }
*** Update File: <WORKDIR>/string\view.mbt
@@
 // limitations under the License.
 
 ///|
-pub using @builtin {trait ToStringView}
+pub using @builtin {trait ToStringViewRenamed}
 
 ///|
 /// Type `View` used by this package APIs.
*** End Patch

```
