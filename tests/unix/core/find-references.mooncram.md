# core find-references

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
$ run_moon_ide moon ide find-references 'Reverse' --loc 'cmp/cmp.mbt:35:17'
Found 15 references for symbol 'Reverse':
<WORKDIR>/cmp/README.mbt.md:30:16-30:23:
   | ```mbt check
   | ///|
   | test "reverse comparison" {
30 |   let a = @cmp.Reverse(1)
   |                ^^^^^^^
   |   let b = @cmp.Reverse(2)
   | 

<WORKDIR>/cmp/README.mbt.md:31:16-31:23:
   | ///|
   | test "reverse comparison" {
   |   let a = @cmp.Reverse(1)
31 |   let b = @cmp.Reverse(2)
   |                ^^^^^^^
   | 
   |   // Normal comparison: 1 < 2, but reversed: 1 > 2

<WORKDIR>/cmp/README.mbt.md:51:32-51:39:
   | ///|
   | test "reverse with arrays" {
   |   // Create an array with reversed integers for descending sort
51 |   let arr : ReadOnlyArray[@cmp.Reverse[Int]] = [
   |                                ^^^^^^^
   |     Reverse(3),
   |     Reverse(1),

<WORKDIR>/cmp/README.mbt.md:52:5-52:12:
   | test "reverse with arrays" {
   |   // Create an array with reversed integers for descending sort
   |   let arr : ReadOnlyArray[@cmp.Reverse[Int]] = [
52 |     Reverse(3),
   |     ^^^^^^^
   |     Reverse(1),
   |     Reverse(4),

<WORKDIR>/cmp/README.mbt.md:53:5-53:12:
   |   // Create an array with reversed integers for descending sort
   |   let arr : ReadOnlyArray[@cmp.Reverse[Int]] = [
   |     Reverse(3),
53 |     Reverse(1),
   |     ^^^^^^^
   |     Reverse(4),
   |     Reverse(2),

<WORKDIR>/cmp/README.mbt.md:54:5-54:12:
   |   let arr : ReadOnlyArray[@cmp.Reverse[Int]] = [
   |     Reverse(3),
   |     Reverse(1),
54 |     Reverse(4),
   |     ^^^^^^^
   |     Reverse(2),
   |   ]

<WORKDIR>/cmp/README.mbt.md:55:5-55:12:
   |     Reverse(3),
   |     Reverse(1),
   |     Reverse(4),
55 |     Reverse(2),
   |     ^^^^^^^
   |   ]
   |   // When sorted, the array will be in descending order of the wrapped values

<WORKDIR>/cmp/cmp.mbt:26:20-26:27:
   | ///
   | /// ```mbt check
   | /// test {
26 | ///   let a = @cmp.Reverse(1)
   |                    ^^^^^^^
   | ///   let b = @cmp.Reverse(2)
   | ///   inspect(a.compare(b), content="1") // 1 > 2 in reversed order

<WORKDIR>/cmp/cmp.mbt:27:20-27:27:
   | /// ```mbt check
   | /// test {
   | ///   let a = @cmp.Reverse(1)
27 | ///   let b = @cmp.Reverse(2)
   |                    ^^^^^^^
   | ///   inspect(a.compare(b), content="1") // 1 > 2 in reversed order
   | ///   inspect(b.compare(a), content="-1") // 2 < 1 in reversed order

<WORKDIR>/cmp/cmp.mbt:35:17-35:24:
   | /// }
   | /// ```
   | #warnings("-deprecated_syntax")
35 | pub(all) struct Reverse[T](T) derive(Eq, Show, Hash, @debug.Debug)
   |                 ^^^^^^^
   | 
   | ///|

<WORKDIR>/cmp/cmp.mbt:38:35-38:42:
   | pub(all) struct Reverse[T](T) derive(Eq, Show, Hash, @debug.Debug)
   | 
   | ///|
38 | pub impl[T : Compare] Compare for Reverse[T] with fn compare(a, b) {
   |                                   ^^^^^^^
   |   -a.0.compare(b.0)
   | }

<WORKDIR>/priority_queue/README.mbt.md:32:10-32:17:
   | test {
   |   // Create a min-heap by wrapping elements with @cmp.Reverse
   |   let min_heap = @priority_queue.from_array([
32 |     @cmp.Reverse(5),
   |          ^^^^^^^
   |     Reverse(2),
   |     Reverse(8),

<WORKDIR>/priority_queue/README.mbt.md:33:5-33:12:
   |   // Create a min-heap by wrapping elements with @cmp.Reverse
   |   let min_heap = @priority_queue.from_array([
   |     @cmp.Reverse(5),
33 |     Reverse(2),
   |     ^^^^^^^
   |     Reverse(8),
   |     Reverse(1),

<WORKDIR>/priority_queue/README.mbt.md:34:5-34:12:
   |   let min_heap = @priority_queue.from_array([
   |     @cmp.Reverse(5),
   |     Reverse(2),
34 |     Reverse(8),
   |     ^^^^^^^
   |     Reverse(1),
   |   ])

<WORKDIR>/priority_queue/README.mbt.md:35:5-35:12:
   |     @cmp.Reverse(5),
   |     Reverse(2),
   |     Reverse(8),
35 |     Reverse(1),
   |     ^^^^^^^
   |   ])
   | 

```

```mooncram
$ run_moon_ide moon ide find-references 'T' --loc 'cmp/cmp.mbt:35:28'
Found 0 references for symbol 'T':
```

```mooncram
$ run_moon_ide moon ide find-references 'args' --loc 'env/env.mbt:17:8'
Found 4 references for symbol 'args':
<WORKDIR>/argparse/parser.mbt:81:19-81:23:
   | 
   | ///|
   | fn default_argv() -> ArrayView[String] {
81 |   let args = @env.args()
   |                   ^^^^
   |   if args.length() > 1 {
   |     args[1:]

<WORKDIR>/env/README.mbt.md:12:24-12:28:
   | ```mbt check
   | ///|
   | test "command line arguments" {
12 |   let arguments = @env.args()
   |                        ^^^^
   | 
   |   // The arguments array contains program arguments

<WORKDIR>/env/env.mbt:17:8-17:12:
   | 
   | ///|
   | /// Get the command line arguments passed to the program.
17 | pub fn args() -> Array[String] {
   |        ^^^^
   |   get_cli_args_internal()
   | }

<WORKDIR>/env/env_test.mbt:17:19-17:23:
   | 
   | ///|
   | test {
17 |   let args = @env.args()
   |                   ^^^^
   |   assert_true(args.length() != 0)
   | }

```

```mooncram
$ run_moon_ide moon ide find-references 'get_cli_args_internal' --loc 'env/env.mbt:18:3'
Found 2 references for symbol 'get_cli_args_internal':
<WORKDIR>/env/env.mbt:18:3-18:24:
   | ///|
   | /// Get the command line arguments passed to the program.
   | pub fn args() -> Array[String] {
18 |   get_cli_args_internal()
   |   ^^^^^^^^^^^^^^^^^^^^^
   | }
   | 

<WORKDIR>/env/env_wasm.mbt:108:4-108:25:
    | }
    | 
    | ///|
108 | fn get_cli_args_internal() -> Array[String] {
    |    ^^^^^^^^^^^^^^^^^^^^^
    |   let args = get_cli_args_ffi()
    |   string_array_from_extern(args)

```

```mooncram
$ run_moon_ide moon ide find-references 'get_cli_args_internal' --loc 'env/env_js.mbt:16:16'
Error: could not find references for symbol 'get_cli_args_internal' at env/env_js.mbt:16:16
[1]
```

```mooncram
$ run_moon_ide moon ide find-references 'now_internal' --loc 'env/env_js.mbt:26:16'
Error: could not find references for symbol 'now_internal' at env/env_js.mbt:26:16
[1]
```

```mooncram
$ run_moon_ide moon ide find-references 'args' --loc 'env/env_test.mbt:17:7'
Found 2 references for symbol 'args':
<WORKDIR>/env/env_test.mbt:17:7-17:11:
   | 
   | ///|
   | test {
17 |   let args = @env.args()
   |       ^^^^
   |   assert_true(args.length() != 0)
   | }

<WORKDIR>/env/env_test.mbt:18:15-18:19:
   | ///|
   | test {
   |   let args = @env.args()
18 |   assert_true(args.length() != 0)
   |               ^^^^
   | }
   | 

```

```mooncram
$ run_moon_ide moon ide find-references 'args' --loc 'env/env_test.mbt:17:19'
Found 4 references for symbol 'args':
<WORKDIR>/argparse/parser.mbt:81:19-81:23:
   | 
   | ///|
   | fn default_argv() -> ArrayView[String] {
81 |   let args = @env.args()
   |                   ^^^^
   |   if args.length() > 1 {
   |     args[1:]

<WORKDIR>/env/README.mbt.md:12:24-12:28:
   | ```mbt check
   | ///|
   | test "command line arguments" {
12 |   let arguments = @env.args()
   |                        ^^^^
   | 
   |   // The arguments array contains program arguments

<WORKDIR>/env/env.mbt:17:8-17:12:
   | 
   | ///|
   | /// Get the command line arguments passed to the program.
17 | pub fn args() -> Array[String] {
   |        ^^^^
   |   get_cli_args_internal()
   | }

<WORKDIR>/env/env_test.mbt:17:19-17:23:
   | 
   | ///|
   | test {
17 |   let args = @env.args()
   |                   ^^^^
   |   assert_true(args.length() != 0)
   | }

```

```mooncram
$ run_moon_ide moon ide find-references 'begin_create_string' --loc 'env/env_wasm.mbt:28:4'
Found 2 references for symbol 'begin_create_string':
<WORKDIR>/env/env_wasm.mbt:28:4-28:23:
   | priv type XExternString
   | 
   | ///|
28 | fn begin_create_string() -> XStringCreateHandle = "__moonbit_fs_unstable" "begin_create_string"
   |    ^^^^^^^^^^^^^^^^^^^
   | 
   | ///|

<WORKDIR>/env/env_wasm.mbt:38:16-38:35:
   | 
   | ///|
   | fn string_to_extern(s : String) -> XExternString {
38 |   let handle = begin_create_string()
   |                ^^^^^^^^^^^^^^^^^^^
   |   for code_unit in s.code_units() {
   |     string_append_char(handle, code_unit.unsafe_to_char())

```

```mooncram
$ run_moon_ide moon ide find-references 'XStringCreateHandle' --loc 'env/env_wasm.mbt:28:29'
Found 4 references for symbol 'XStringCreateHandle':
<WORKDIR>/env/env_wasm.mbt:21:11-21:30:
   | 
   | ///|
   | #external
21 | priv type XStringCreateHandle
   |           ^^^^^^^^^^^^^^^^^^^
   | 
   | ///|

<WORKDIR>/env/env_wasm.mbt:28:29-28:48:
   | priv type XExternString
   | 
   | ///|
28 | fn begin_create_string() -> XStringCreateHandle = "__moonbit_fs_unstable" "begin_create_string"
   |                             ^^^^^^^^^^^^^^^^^^^
   | 
   | ///|

<WORKDIR>/env/env_wasm.mbt:31:32-31:51:
   | fn begin_create_string() -> XStringCreateHandle = "__moonbit_fs_unstable" "begin_create_string"
   | 
   | ///|
31 | fn string_append_char(handle : XStringCreateHandle, ch : Char) = "__moonbit_fs_unstable" "string_append_char"
   |                                ^^^^^^^^^^^^^^^^^^^
   | 
   | ///|

<WORKDIR>/env/env_wasm.mbt:34:34-34:53:
   | fn string_append_char(handle : XStringCreateHandle, ch : Char) = "__moonbit_fs_unstable" "string_append_char"
   | 
   | ///|
34 | fn finish_create_string(handle : XStringCreateHandle) -> XExternString = "__moonbit_fs_unstable" "finish_create_string"
   |                                  ^^^^^^^^^^^^^^^^^^^
   | 
   | ///|

```
