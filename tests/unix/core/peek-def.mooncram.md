# core peek-def

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
$ run_moon_ide moon ide peek-def 'Reverse' --loc 'cmp/cmp.mbt:35:17'
Definition found at file <WORKDIR>/cmp/cmp.mbt
   | ///   inspect(a == a, content="true") // Equality works correctly
   | ///   inspect(a.to_string(), content="Reverse(1)") // Shows wrapped value
   | /// }
   | /// ```
   | #warnings("-deprecated_syntax")
35 | pub(all) struct Reverse[T](T) derive(Eq, Show, Hash, @debug.Debug)
   |                 ^^^^^^^
   | 
   | ///|
   | pub impl[T : Compare] Compare for Reverse[T] with fn compare(a, b) {
   |   -a.0.compare(b.0)
   | }
   | 
   | ///|
   | /// Returns the element that gives the maximum value from the specified function.
   | ///
   | /// Returns the second argument if the comparison determines them to be equal.
   | ///
   | /// # Examples
   | ///
   | /// ```mbt check
```

```mooncram
$ run_moon_ide moon ide peek-def 'T' --loc 'cmp/cmp.mbt:35:28'
Definition found at file 
Error: : No such file or directory
[1]
```

```mooncram
$ run_moon_ide moon ide peek-def 'args' --loc 'env/env.mbt:17:8'
Definition found at file <WORKDIR>/env/env.mbt
   | // See the License for the specific language governing permissions and
   | // limitations under the License.
   | 
   | ///|
   | /// Get the command line arguments passed to the program.
17 | pub fn args() -> Array[String] {
   |        ^^^^
   |   get_cli_args_internal()
   | }
   | 
   | ///|
   | /// Get the current time in milliseconds since the Unix epoch.
   | pub fn now() -> UInt64 {
   |   now_internal()
   | }
   | 
   | ///|
   | /// Get the current working directory. On some platforms, this may return `None` if the current directory cannot be determined.
   | pub fn current_dir() -> String? {
   |   current_dir_internal()
   | }
```

```mooncram
$ run_moon_ide moon ide peek-def 'get_cli_args_internal' --loc 'env/env.mbt:18:3'
Definition found at file <WORKDIR>/env/env_wasm.mbt
    |   finish_read_string_array(handle)
    |   buf
    | }
    | 
    | ///|
108 | fn get_cli_args_internal() -> Array[String] {
    |    ^^^^^^^^^^^^^^^^^^^^^
    |   let args = get_cli_args_ffi()
    |   string_array_from_extern(args)
    | }
    | 
    | ///|
    | fn get_cli_args_ffi() -> XExternStringArray = "__moonbit_fs_unstable" "args_get"
    | 
    | ///|
    | fn now_internal() -> UInt64 = "__moonbit_time_unstable" "now"
    | 
    | ///|
    | fn current_dir_internal() -> String? {
    |   let dir = current_dir_ffi()
    |   let dir = string_from_extern(dir)
```

```mooncram
$ run_moon_ide moon ide peek-def 'get_cli_args_internal' --loc 'env/env_js.mbt:16:16'
Error: could not find definition for symbol 'get_cli_args_internal' at env/env_js.mbt:16:16
[1]
```

```mooncram
$ run_moon_ide moon ide peek-def 'now_internal' --loc 'env/env_js.mbt:26:16'
Error: could not find definition for symbol 'now_internal' at env/env_js.mbt:26:16
[1]
```

```mooncram
$ run_moon_ide moon ide peek-def 'args' --loc 'env/env_test.mbt:17:7'
Definition found at file <WORKDIR>/env/env_test.mbt
   | // See the License for the specific language governing permissions and
   | // limitations under the License.
   | 
   | ///|
   | test {
17 |   let args = @env.args()
   |       ^^^^
   |   assert_true(args.length() != 0)
   | }
   | 
   | ///|
   | test "now returns reasonable timestamp" {
   |   let timestamp = @env.now()
   |   assert_true(timestamp > 0) // 1970-01-01 00:00:00 UTC
   |   assert_true(timestamp < 96406502400000UL) // 5025-01-01 00:00:00 UTC
   | }
   | 
   | ///|
   | test "current_dir returns reasonable directory" {
   |   let dir = @env.current_dir()
   |   assert_false(dir is None)
```

```mooncram
$ run_moon_ide moon ide peek-def 'args' --loc 'env/env_test.mbt:17:19'
Definition found at file <WORKDIR>/env/env.mbt
   | // See the License for the specific language governing permissions and
   | // limitations under the License.
   | 
   | ///|
   | /// Get the command line arguments passed to the program.
17 | pub fn args() -> Array[String] {
   |        ^^^^
   |   get_cli_args_internal()
   | }
   | 
   | ///|
   | /// Get the current time in milliseconds since the Unix epoch.
   | pub fn now() -> UInt64 {
   |   now_internal()
   | }
   | 
   | ///|
   | /// Get the current working directory. On some platforms, this may return `None` if the current directory cannot be determined.
   | pub fn current_dir() -> String? {
   |   current_dir_internal()
   | }
```

```mooncram
$ run_moon_ide moon ide peek-def 'begin_create_string' --loc 'env/env_wasm.mbt:28:4'
Definition found at file <WORKDIR>/env/env_wasm.mbt
   | ///|
   | #external
   | priv type XExternString
   | 
   | ///|
28 | fn begin_create_string() -> XStringCreateHandle = "__moonbit_fs_unstable" "begin_create_string"
   |    ^^^^^^^^^^^^^^^^^^^
   | 
   | ///|
   | fn string_append_char(handle : XStringCreateHandle, ch : Char) = "__moonbit_fs_unstable" "string_append_char"
   | 
   | ///|
   | fn finish_create_string(handle : XStringCreateHandle) -> XExternString = "__moonbit_fs_unstable" "finish_create_string"
   | 
   | ///|
   | fn string_to_extern(s : String) -> XExternString {
   |   let handle = begin_create_string()
   |   for code_unit in s.code_units() {
   |     string_append_char(handle, code_unit.unsafe_to_char())
   |   }
   |   finish_create_string(handle)
```

```mooncram
$ run_moon_ide moon ide peek-def 'XStringCreateHandle' --loc 'env/env_wasm.mbt:28:29'
Definition found at file <WORKDIR>/env/env_wasm.mbt
   | #external
   | priv type XStringReadHandle
   | 
   | ///|
   | #external
21 | priv type XStringCreateHandle
   |           ^^^^^^^^^^^^^^^^^^^
   | 
   | ///|
   | #external
   | priv type XExternString
   | 
   | ///|
   | fn begin_create_string() -> XStringCreateHandle = "__moonbit_fs_unstable" "begin_create_string"
   | 
   | ///|
   | fn string_append_char(handle : XStringCreateHandle, ch : Char) = "__moonbit_fs_unstable" "string_append_char"
   | 
   | ///|
   | fn finish_create_string(handle : XStringCreateHandle) -> XExternString = "__moonbit_fs_unstable" "finish_create_string"
   | 
```
