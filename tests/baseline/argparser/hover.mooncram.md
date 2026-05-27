# argparser hover

```mooncram
$ export MOON_HOME="${MOON_HOME:-$HOME/.moon}"
```

```mooncram
$ export TEST_REPO_ROOT="$PWD"
```

```mooncram
$ normalize_moon_ide_output() { sed -e "s|$TEST_REPO_ROOT|<WORKDIR>|g" -e "s|$MOON_HOME|<MOON_HOME>|g"; }
```

```mooncram
$ run_moon_ide() { status_file="${TMPDIR:-/tmp}/moon-ide-status.$$"; ( "$@"; echo "$?" > "$status_file" ) 2>&1 | normalize_moon_ide_output; status=$(cat "$status_file"); rm -f "$status_file"; return "$status"; }
```

```mooncram
$ run_moon_ide moon ide hover 'Trie' --loc 'arg.mbt:2:19'
///|
using @trie {type Trie}
                  ^^^^
                  ```moonbit
                  #alias(T)
                  type @trie.Trie[A]
                  ```

///|
```

```mooncram
$ run_moon_ide moon ide hover 'Set_string' --loc 'arg.mbt:19:3'
pub(all) enum Spec {
  Unit(() -> Unit raise)
  String((String) -> Unit raise)
  Set_string(Ref[String])
  ^^^^^^^^^^
  ```moonbit
  (@ref.Ref[String]) -> Spec
  ```
  Set(Ref[Bool])
  Clear(Ref[Bool])
```

```mooncram
$ run_moon_ide moon ide hover 'verbose' --loc 'arg_test.mbt:3:7'
///|
test {
  let verbose : Ref[Bool] = Ref(true)
      ^^^^^^^
      ```moonbit
      @ref.Ref[Bool]
      ```
  let keyword : Ref[String] = Ref("")
  let delete_files : Ref[Bool] = Ref(false)
```

```mooncram
$ run_moon_ide moon ide hover 'keyword' --loc 'arg_test.mbt:4:7'
///|
test {
  let verbose : Ref[Bool] = Ref(true)
  let keyword : Ref[String] = Ref("")
      ^^^^^^^
      ```moonbit
      @ref.Ref[String]
      ```
  let delete_files : Ref[Bool] = Ref(false)
  let usage =
```
