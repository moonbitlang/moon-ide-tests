# core hover

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
$ run_moon_ide moon ide hover 'Reverse' --loc 'cmp/cmp.mbt:35:17'
/// }
/// ```
#warnings("-deprecated_syntax")
pub(all) struct Reverse[T](T) derive(Eq, Show, Hash, @debug.Debug)
                ^^^^^^^
                ```moonbit
                #warnings("-deprecated_syntax")
                struct Reverse[T](T) derive(Eq, Show, Hash, @debug.Debug)
                ```
                ---
                
                 A newtype wrapper that reverses the comparison order of the wrapped value.
                
                 `Reverse[T]` is useful when you need to reverse the natural ordering of a type.
                 For example, to create a min-heap from a max-heap data structure, or to sort
                 in descending order instead of ascending order.
                
                 # Examples
                
                 ```mbt check
                 test {
                   let a = @cmp.Reverse(1)
                   let b = @cmp.Reverse(2)
                   inspect(a.compare(b), content="1") // 1 > 2 in reversed order
                   inspect(b.compare(a), content="-1") // 2 < 1 in reversed order
                   inspect(a == a, content="true") // Equality works correctly
                   inspect(a.to_string(), content="Reverse(1)") // Shows wrapped value
                 }
                 ```

///|
```

```mooncram
$ run_moon_ide moon ide hover 'T' --loc 'cmp/cmp.mbt:35:28'
/// }
/// ```
#warnings("-deprecated_syntax")
pub(all) struct Reverse[T](T) derive(Eq, Show, Hash, @debug.Debug)
                           ^
                           type parameter T

///|
```

```mooncram
$ run_moon_ide moon ide hover 'args' --loc 'env/env.mbt:17:8'
///|
/// Get the command line arguments passed to the program.
pub fn args() -> Array[String] {
       ^^^^
       ```moonbit
       fn args() -> Array[String]
       ```
       ---
       
        Get the command line arguments passed to the program.
  get_cli_args_internal()
}
```

```mooncram
$ run_moon_ide moon ide hover 'get_cli_args_internal' --loc 'env/env.mbt:18:3'
///|
/// Get the command line arguments passed to the program.
pub fn args() -> Array[String] {
  get_cli_args_internal()
  ^^^^^^^^^^^^^^^^^^^^^
  ```moonbit
  fn get_cli_args_internal() -> Array[String]
  ```
}

```

```mooncram
$ run_moon_ide moon ide hover 'get_cli_args_internal' --loc 'env/env_js.mbt:16:16'
No hover information found for symbol 'get_cli_args_internal' at env/env_js.mbt:16:16
[1]
```

```mooncram
$ run_moon_ide moon ide hover 'now_internal' --loc 'env/env_js.mbt:26:16'
No hover information found for symbol 'now_internal' at env/env_js.mbt:26:16
[1]
```

```mooncram
$ run_moon_ide moon ide hover 'args' --loc 'env/env_test.mbt:17:7'
///|
test {
  let args = @env.args()
      ^^^^
      ```moonbit
      Array[String]
      ```
  assert_true(args.length() != 0)
}
```

```mooncram
$ run_moon_ide moon ide hover 'args' --loc 'env/env_test.mbt:17:19'
///|
test {
  let args = @env.args()
             ^^^^^^^^^
             ```moonbit
             fn @moonbitlang/core/env.args() -> Array[String]
             ```
             ---
             
              Get the command line arguments passed to the program.
  assert_true(args.length() != 0)
}
```

```mooncram
$ run_moon_ide moon ide hover 'begin_create_string' --loc 'env/env_wasm.mbt:28:4'
No hover information found for symbol 'begin_create_string' at env/env_wasm.mbt:28:4
[1]
```

```mooncram
$ run_moon_ide moon ide hover 'XStringCreateHandle' --loc 'env/env_wasm.mbt:28:29'
priv type XExternString

///|
fn begin_create_string() -> XStringCreateHandle = "__moonbit_fs_unstable" "begin_create_string"
                            ^^^^^^^^^^^^^^^^^^^
                            ```moonbit
                            type XStringCreateHandle
                            ```

///|
```
