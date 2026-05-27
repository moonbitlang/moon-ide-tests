# argparser peek-def

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
$ run_moon_ide moon ide peek-def 'Set_string' --loc 'arg.mbt:19:3'
Definition found at file <WORKDIR>/arg.mbt
   | ///  (escaped)
   | ///  Clear - set reference to false (escaped)
   | pub(all) enum Spec { (escaped)
   |   Unit(() -> Unit raise) (escaped)
   |   String((String) -> Unit raise) (escaped)
19 |   Set_string(Ref[String]) (escaped)
   |   ^^^^^^^^^^ (escaped)
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
   |     match remaining { (escaped)
   |       [] => break () (escaped)
   |       [x, .. rest] => (escaped)
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
$ run_moon_ide moon ide peek-def 'interpret' --loc 'arg.mbt:25:4'
Definition found at file <WORKDIR>/arg.mbt
   |   Set(Ref[Bool]) (escaped)
   |   Clear(Ref[Bool]) (escaped)
   | } (escaped)
   |  (escaped)
   | ///| (escaped)
25 | fn interpret( (escaped)
   |    ^^^^^^^^^ (escaped)
   |   trie : @trie.T[Spec], (escaped)
   |   xs : Array[String], (escaped)
   |   fallback : (String) -> Unit raise, (escaped)
   | ) -> Unit raise { (escaped)
   |   for remaining = xs[:] { (escaped)
   |     match remaining { (escaped)
   |       [] => break () (escaped)
   |       [x, .. rest] => (escaped)
   |         match trie.lookup(x) { (escaped)
   |           None => { (escaped)
   |             fallback(x) (escaped)
   |             continue rest (escaped)
   |           } (escaped)
   |           Some(spec) => (escaped)
```

```mooncram
$ run_moon_ide moon ide peek-def 'parse' --loc 'arg.mbt:86:8'
Definition found at file <WORKDIR>/arg.mbt
   | ///  (escaped)
   | /// # Exception (escaped)
   | ///  (escaped)
   | /// If the input arguments contains help option or invalid input, the `parse`  (escaped)
   | /// function will raise `ErrorMsg` error. (escaped)
86 | pub fn parse( (escaped)
   |        ^^^^^ (escaped)
   |   speclist : Array[(String, String, Spec, String)], (escaped)
   |   rest : (String) -> Unit raise, (escaped)
   |   usage_msg : String, (escaped)
   |   argv : Array[String], (escaped)
   | ) -> Unit raise { (escaped)
   |   let aux = fn(acc : (Trie[Spec], String), it) { (escaped)
   |     let (trie, help_msg) = acc (escaped)
   |     let (a, b, spec, help) = it (escaped)
   |     let trie = trie.add(a, spec).add(b, spec) (escaped)
   |     let help_msg = help_msg + "  \\{a}\\t\\{b}\\t" + help + "\\n" (escaped)
   |     (trie, help_msg) (escaped)
   |   } (escaped)
   |   let (trie, help_msg) = speclist.fold( (escaped)
   |     aux, (escaped)
```

```mooncram
$ run_moon_ide moon ide peek-def 'ErrorMsg' --loc 'arg.mbt:109:14'
Definition found at file <WORKDIR>/arg.mbt
    |   let trie = trie.add("--help", help_spec).add("-h", help_spec) (escaped)
    |   interpret(trie, argv, rest) (escaped)
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
109 | pub suberror ErrorMsg { (escaped)
    |              ^^^^^^^^ (escaped)
    |   ErrorMsg(String) (escaped)
    | } (escaped)
```
