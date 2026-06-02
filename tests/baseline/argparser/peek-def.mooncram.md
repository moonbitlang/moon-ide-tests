# argparser peek-def

```mooncram
$ export MOON_HOME="${MOON_HOME:-$HOME/.moon}"
```

```mooncram
$ export TEST_REPO_ROOT="$(cd "$TESTDIR/../../../fixtures/repos/argparser" && pwd)"
```

```mooncram
$ normalize_moon_ide_output() { sed -e "s|$TEST_REPO_ROOT|<WORKDIR>|g" -e "s|$MOON_HOME|<MOON_HOME>|g"; }
```

```mooncram
$ run_moon_ide() { status_file="${TMPDIR:-/tmp}/moon-ide-status.$$"; ( cd "$TEST_REPO_ROOT" && "$@"; echo "$?" > "$status_file" ) 2>&1 | normalize_moon_ide_output; status=$(cat "$status_file"); rm -f "$status_file"; return "$status"; }
```

```mooncram
$ run_moon_ide moon ide peek-def 'Trie' --loc 'arg.mbt:2:19'
Definition found at file <WORKDIR>/.mooncakes/Yoorkin/trie/trie.mbt
  | ///| (escaped)
  | #alias(T) (escaped)
3 | struct Trie[A] { (escaped)
  |        ^^^^ (escaped)
  |   value : A? (escaped)
  |   forks : @immut/sorted_map.SortedMap[Char, Trie[A]] (escaped)
  | } (escaped)
  |  (escaped)
  | ///| (escaped)
  | pub fn[A] Trie::lookup(self : Self[A], path : String) -> A? { (escaped)
  |   loop (path.view(), self) { (escaped)
  |     ([], trie) => trie.value (escaped)
  |     ([x, .. xs], trie) => (escaped)
  |       match trie.forks.get(x) { (escaped)
  |         None => None (escaped)
  |         Some(subtree) => continue (xs, subtree) (escaped)
  |       } (escaped)
  |   } (escaped)
```

```mooncram
$ run_moon_ide moon ide peek-def 'Spec' --loc 'arg.mbt:16:15'
Definition found at file <WORKDIR>/arg.mbt
   | ///  Set_string - set option to associated value  (escaped)
   | ///  (escaped)
   | ///  Set - set reference to true (escaped)
   | ///  (escaped)
   | ///  Clear - set reference to false (escaped)
16 | pub(all) enum Spec { (escaped)
   |               ^^^^ (escaped)
   |   Unit(() -> Unit raise) (escaped)
   |   String((String) -> Unit raise) (escaped)
   |   Set_string(Ref[String]) (escaped)
   |   Set(Ref[Bool]) (escaped)
   |   Clear(Ref[Bool]) (escaped)
   | } (escaped)
   |  (escaped)
   | ///| (escaped)
   | fn interpret( (escaped)
   |   trie : @trie.T[Spec], (escaped)
   |   xs : Array[String], (escaped)
   |   fallback : (String) -> Unit raise, (escaped)
   | ) -> Unit raise { (escaped)
   |   for remaining = xs[:] { (escaped)
```

```mooncram
$ run_moon_ide moon ide peek-def 'verbose' --loc 'arg_test.mbt:3:7'
Definition found at file <WORKDIR>/arg_test.mbt
  | ///| (escaped)
  | test { (escaped)
3 |   let verbose : Ref[Bool] = Ref(true) (escaped)
  |       ^^^^^^^ (escaped)
  |   let keyword : Ref[String] = Ref("") (escaped)
  |   let delete_files : Ref[Bool] = Ref(false) (escaped)
  |   let usage = (escaped)
  |     #| Awesome CLI tool! (escaped)
  |     #| usage:  (escaped)
  |     #|      mytool [options] <file1> [<file2>] ... -o <output> (escaped)
  |     #| (escaped)
  |     #| (escaped)
  |   let files = [] (escaped)
  |   let options = [ (escaped)
  |     ("--no-verbose", "-n", @ArgParser.Clear(verbose), "disable verbose message"), (escaped)
  |     ("--search", "-s", Set_string(keyword), "search for files"), (escaped)
  |     ("--delete", "-d", Set(delete_files), "delete listed files"), (escaped)
  |   ] (escaped)
```

```mooncram
$ run_moon_ide moon ide peek-def 'keyword' --loc 'arg_test.mbt:4:7'
Definition found at file <WORKDIR>/arg_test.mbt
  | ///| (escaped)
  | test { (escaped)
  |   let verbose : Ref[Bool] = Ref(true) (escaped)
4 |   let keyword : Ref[String] = Ref("") (escaped)
  |       ^^^^^^^ (escaped)
  |   let delete_files : Ref[Bool] = Ref(false) (escaped)
  |   let usage = (escaped)
  |     #| Awesome CLI tool! (escaped)
  |     #| usage:  (escaped)
  |     #|      mytool [options] <file1> [<file2>] ... -o <output> (escaped)
  |     #| (escaped)
  |     #| (escaped)
  |   let files = [] (escaped)
  |   let options = [ (escaped)
  |     ("--no-verbose", "-n", @ArgParser.Clear(verbose), "disable verbose message"), (escaped)
  |     ("--search", "-s", Set_string(keyword), "search for files"), (escaped)
  |     ("--delete", "-d", Set(delete_files), "delete listed files"), (escaped)
  |   ] (escaped)
  |   let argv = ["--search", ".mbt", "--delete", "file1", "file2", "-n"] (escaped)
```
