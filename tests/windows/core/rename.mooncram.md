# core rename

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\core' moon ide rename 'Reverse' 'ReverseRenamed' --loc 'cmp\cmp.mbt:35:17'
*** Begin Patch
*** Update File: <WORKDIR>/cmp\README.mbt.md
@@
 ```mbt check
 ///|
 test "reverse comparison" {
-  let a = @cmp.Reverse(1)
+  let a = @cmp.ReverseRenamed(1)
-  let b = @cmp.Reverse(2)
+  let b = @cmp.ReverseRenamed(2)
 
   // Normal comparison: 1 < 2, but reversed: 1 > 2
   inspect(a.compare(b), content="1")
@@
 ///|
 test "reverse with arrays" {
   // Create an array with reversed integers for descending sort
-  let arr : ReadOnlyArray[@cmp.Reverse[Int]] = [
+  let arr : ReadOnlyArray[@cmp.ReverseRenamed[Int]] = [
-    Reverse(3),
+    ReverseRenamed(3),
-    Reverse(1),
+    ReverseRenamed(1),
-    Reverse(4),
+    ReverseRenamed(4),
-    Reverse(2),
+    ReverseRenamed(2),
   ]
   // When sorted, the array will be in descending order of the wrapped values
   inspect(arr[0], content="Reverse(3)") // Access first element
*** Update File: <WORKDIR>/cmp\cmp.mbt
@@
 ///
 /// ```mbt check
 /// test {
-///   let a = @cmp.Reverse(1)
+///   let a = @cmp.ReverseRenamed(1)
-///   let b = @cmp.Reverse(2)
+///   let b = @cmp.ReverseRenamed(2)
 ///   inspect(a.compare(b), content="1") // 1 > 2 in reversed order
 ///   inspect(b.compare(a), content="-1") // 2 < 1 in reversed order
 ///   inspect(a == a, content="true") // Equality works correctly
@@
 /// }
 /// ```
 #warnings("-deprecated_syntax")
-pub(all) struct Reverse[T](T) derive(Eq, Show, Hash, @debug.Debug)
+pub(all) struct ReverseRenamed[T](T) derive(Eq, Show, Hash, @debug.Debug)
 
 ///|
-pub impl[T : Compare] Compare for Reverse[T] with fn compare(a, b) {
+pub impl[T : Compare] Compare for ReverseRenamed[T] with fn compare(a, b) {
   -a.0.compare(b.0)
 }
 
*** Update File: <WORKDIR>/priority_queue\README.mbt.md
@@
 test {
   // Create a min-heap by wrapping elements with @cmp.Reverse
   let min_heap = @priority_queue.from_array([
-    @cmp.Reverse(5),
+    @cmp.ReverseRenamed(5),
-    Reverse(2),
+    ReverseRenamed(2),
-    Reverse(8),
+    ReverseRenamed(8),
-    Reverse(1),
+    ReverseRenamed(1),
   ])
 
   // The smallest wrapped value (1) should be at the top
*** End Patch

```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\core' moon ide rename 'T' 'TRenamed' --loc 'cmp\cmp.mbt:35:28'
Error: cannot rename symbol 'T' in package '' outside of module 'moonbitlang/core'
[1]
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\core' moon ide rename 'args' 'args_renamed' --loc 'env\env.mbt:17:8'
*** Begin Patch
*** Update File: <WORKDIR>/argparse\parser.mbt
@@
 
 ///|
 fn default_argv() -> ArrayView[String] {
-  let args = @env.args()
+  let args = @env.args_renamed()
   if args.length() > 1 {
     args[1:]
   } else {
*** Update File: <WORKDIR>/env\README.mbt.md
@@
 ```mbt check
 ///|
 test "command line arguments" {
-  let arguments = @env.args()
+  let arguments = @env.args_renamed()
 
   // The arguments array contains program arguments
   // In a test environment, this will typically be empty or contain test runner args
*** Update File: <WORKDIR>/env\env.mbt
@@
 
 ///|
 /// Get the command line arguments passed to the program.
-pub fn args() -> Array[String] {
+pub fn args_renamed() -> Array[String] {
   get_cli_args_internal()
 }
 
*** Update File: <WORKDIR>/env\env_test.mbt
@@
 
 ///|
 test {
-  let args = @env.args()
+  let args = @env.args_renamed()
   assert_true(args.length() != 0)
 }
 
*** End Patch

```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\core' moon ide rename 'get_cli_args_internal' 'get_cli_args_internal_renamed' --loc 'env\env.mbt:18:3'
*** Begin Patch
*** Update File: <WORKDIR>/env\env.mbt
@@
 ///|
 /// Get the command line arguments passed to the program.
 pub fn args() -> Array[String] {
-  get_cli_args_internal()
+  get_cli_args_internal_renamed()
 }
 
 ///|
*** Update File: <WORKDIR>/env\env_wasm.mbt
@@
 }
 
 ///|
-fn get_cli_args_internal() -> Array[String] {
+fn get_cli_args_internal_renamed() -> Array[String] {
   let args = get_cli_args_ffi()
   string_array_from_extern(args)
 }
*** End Patch

```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\core' moon ide rename 'get_cli_args_internal' 'get_cli_args_internal_renamed' --loc 'env\env_js.mbt:16:16'
Error: could not find references for symbol 'get_cli_args_internal' at env\env_js.mbt:16:16
[1]
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\core' moon ide rename 'now_internal' 'now_internal_renamed' --loc 'env\env_js.mbt:26:16'
Error: could not find references for symbol 'now_internal' at env\env_js.mbt:26:16
[1]
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\core' moon ide rename 'args' 'args_renamed' --loc 'env\env_test.mbt:17:7'
*** Begin Patch
*** Update File: <WORKDIR>/env\env_test.mbt
@@
 
 ///|
 test {
-  let args = @env.args()
+  let args_renamed = @env.args()
-  assert_true(args.length() != 0)
+  assert_true(args_renamed.length() != 0)
 }
 
 ///|
*** End Patch

```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\core' moon ide rename 'args' 'args_renamed' --loc 'env\env_test.mbt:17:19'
*** Begin Patch
*** Update File: <WORKDIR>/argparse\parser.mbt
@@
 
 ///|
 fn default_argv() -> ArrayView[String] {
-  let args = @env.args()
+  let args = @env.args_renamed()
   if args.length() > 1 {
     args[1:]
   } else {
*** Update File: <WORKDIR>/env\README.mbt.md
@@
 ```mbt check
 ///|
 test "command line arguments" {
-  let arguments = @env.args()
+  let arguments = @env.args_renamed()
 
   // The arguments array contains program arguments
   // In a test environment, this will typically be empty or contain test runner args
*** Update File: <WORKDIR>/env\env.mbt
@@
 
 ///|
 /// Get the command line arguments passed to the program.
-pub fn args() -> Array[String] {
+pub fn args_renamed() -> Array[String] {
   get_cli_args_internal()
 }
 
*** Update File: <WORKDIR>/env\env_test.mbt
@@
 
 ///|
 test {
-  let args = @env.args()
+  let args = @env.args_renamed()
   assert_true(args.length() != 0)
 }
 
*** End Patch

```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\core' moon ide rename 'begin_create_string' 'begin_create_string_renamed' --loc 'env\env_wasm.mbt:28:4'
*** Begin Patch
*** Update File: <WORKDIR>/env\env_wasm.mbt
@@
 priv type XExternString
 
 ///|
-fn begin_create_string() -> XStringCreateHandle = "__moonbit_fs_unstable" "begin_create_string"
+fn begin_create_string_renamed() -> XStringCreateHandle = "__moonbit_fs_unstable" "begin_create_string"
 
 ///|
 fn string_append_char(handle : XStringCreateHandle, ch : Char) = "__moonbit_fs_unstable" "string_append_char"
@@
 
 ///|
 fn string_to_extern(s : String) -> XExternString {
-  let handle = begin_create_string()
+  let handle = begin_create_string_renamed()
   for code_unit in s.code_units() {
     string_append_char(handle, code_unit.unsafe_to_char())
   }
*** End Patch

```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\core' moon ide rename 'XStringCreateHandle' 'XStringCreateHandleRenamed' --loc 'env\env_wasm.mbt:28:29'
*** Begin Patch
*** Update File: <WORKDIR>/env\env_wasm.mbt
@@
 
 ///|
 #external
-priv type XStringCreateHandle
+priv type XStringCreateHandleRenamed
 
 ///|
 #external
@@
 priv type XExternString
 
 ///|
-fn begin_create_string() -> XStringCreateHandle = "__moonbit_fs_unstable" "begin_create_string"
+fn begin_create_string() -> XStringCreateHandleRenamed = "__moonbit_fs_unstable" "begin_create_string"
 
 ///|
-fn string_append_char(handle : XStringCreateHandle, ch : Char) = "__moonbit_fs_unstable" "string_append_char"
+fn string_append_char(handle : XStringCreateHandleRenamed, ch : Char) = "__moonbit_fs_unstable" "string_append_char"
 
 ///|
-fn finish_create_string(handle : XStringCreateHandle) -> XExternString = "__moonbit_fs_unstable" "finish_create_string"
+fn finish_create_string(handle : XStringCreateHandleRenamed) -> XExternString = "__moonbit_fs_unstable" "finish_create_string"
 
 ///|
 fn string_to_extern(s : String) -> XExternString {
*** End Patch

```
