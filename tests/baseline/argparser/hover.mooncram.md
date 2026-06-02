# argparser hover

````mooncram
$ export MOON_HOME="${MOON_HOME:-$HOME/.moon}"
````

````mooncram
$ export TEST_REPO_ROOT="$(cd "$TESTDIR/../../../fixtures/repos/argparser" && pwd)"
````

````mooncram
$ normalize_moon_ide_output() { sed -e "s|$TEST_REPO_ROOT|<WORKDIR>|g" -e "s|$MOON_HOME|<MOON_HOME>|g"; }
````

````mooncram
$ run_moon_ide() { status_file="${TMPDIR:-/tmp}/moon-ide-status.$$"; ( cd "$TEST_REPO_ROOT" && "$@"; echo "$?" > "$status_file" ) 2>&1 | normalize_moon_ide_output; status=$(cat "$status_file"); rm -f "$status_file"; return "$status"; }
````

````mooncram
$ run_moon_ide moon ide hover 'Trie' --loc 'arg.mbt:2:19'
///|
using @trie {type Trie}
                  ^^^^
                  ```moonbit
                  #alias(T)
                  type @trie.Trie[A]
                  ```

///|
````

````mooncram
$ run_moon_ide moon ide hover 'Spec' --loc 'arg.mbt:16:15'
///  Set - set reference to true
/// 
///  Clear - set reference to false
pub(all) enum Spec {
              ^^^^
              ```moonbit
              enum Spec {
                Unit(() -> Unit raise)
                String((String) -> Unit raise)
                Set_string(@ref.Ref[String])
                Set(@ref.Ref[Bool])
                Clear(@ref.Ref[Bool])
              }
              ```
              ---
              
               Matched option handler that used to interpret options.
               
                Unit - handle with callback  
               
                String - handle associated value with callback
               
                Set_string - set option to associated value 
               
                Set - set reference to true
               
                Clear - set reference to false
  Unit(() -> Unit raise)
  String((String) -> Unit raise)
````

````mooncram
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
````

````mooncram
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
````
