# argparser find-references

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
$ run_moon_ide moon ide find-references trie --loc 'arg.mbt:2:7'
Error: could not find references for symbol 'trie' at arg.mbt:2:7
[1]
```

```mooncram
$ run_moon_ide moon ide find-references Trie --loc 'arg.mbt:2:19'
Found 3 references for symbol 'Trie':
<WORKDIR>/arg.mbt:2:19-2:23:
  | ///| (escaped)
2 | using @trie {type Trie} (escaped)
  |                   ^^^^ (escaped)
  |  (escaped)
  | ///| (escaped)

<WORKDIR>/arg.mbt:92:23-92:27:
   |   usage_msg : String, (escaped)
   |   argv : Array[String], (escaped)
   | ) -> Unit raise { (escaped)
92 |   let aux = fn(acc : (Trie[Spec], String), it) { (escaped)
   |                       ^^^^ (escaped)
   |     let (trie, help_msg) = acc (escaped)
   |     let (a, b, spec, help) = it (escaped)

<WORKDIR>/arg.mbt:101:11-101:15:
    |   } (escaped)
    |   let (trie, help_msg) = speclist.fold( (escaped)
    |     aux, (escaped)
101 |     init=(Trie::empty(), usage_msg + "\\n options:\\n"), (escaped)
    |           ^^^^ (escaped)
    |   ) (escaped)
    |   let help_spec = Spec::Unit(() => raise ErrorMsg(help_msg)) (escaped)

```

```mooncram
$ run_moon_ide moon ide find-references verbose --loc 'arg_test.mbt:3:7'
Found 3 references for symbol 'verbose':
<WORKDIR>/arg_test.mbt:3:7-3:14:
  | ///| (escaped)
  | test { (escaped)
3 |   let verbose : Ref[Bool] = Ref(true) (escaped)
  |       ^^^^^^^ (escaped)
  |   let keyword : Ref[String] = Ref("") (escaped)
  |   let delete_files : Ref[Bool] = Ref(false) (escaped)

<WORKDIR>/arg_test.mbt:14:45-14:52:
   |     #| (escaped)
   |   let files = [] (escaped)
   |   let options = [ (escaped)
14 |     ("--no-verbose", "-n", @ArgParser.Clear(verbose), "disable verbose message"), (escaped)
   |                                             ^^^^^^^ (escaped)
   |     ("--search", "-s", Set_string(keyword), "search for files"), (escaped)
   |     ("--delete", "-d", Set(delete_files), "delete listed files"), (escaped)

<WORKDIR>/arg_test.mbt:20:13-20:20:
   |   ] (escaped)
   |   let argv = ["--search", ".mbt", "--delete", "file1", "file2", "-n"] (escaped)
   |   let _ = try? @ArgParser.parse(options, file => files.push(file), usage, argv) (escaped)
20 |   assert_eq(verbose.val, false) (escaped)
   |             ^^^^^^^ (escaped)
   |   assert_eq(keyword.val, ".mbt") (escaped)
   |   assert_eq(files.length(), 2) (escaped)

```

```mooncram
$ run_moon_ide moon ide find-references keyword --loc 'arg_test.mbt:4:7'
Found 3 references for symbol 'keyword':
<WORKDIR>/arg_test.mbt:4:7-4:14:
  | ///| (escaped)
  | test { (escaped)
  |   let verbose : Ref[Bool] = Ref(true) (escaped)
4 |   let keyword : Ref[String] = Ref("") (escaped)
  |       ^^^^^^^ (escaped)
  |   let delete_files : Ref[Bool] = Ref(false) (escaped)
  |   let usage = (escaped)

<WORKDIR>/arg_test.mbt:15:35-15:42:
   |   let files = [] (escaped)
   |   let options = [ (escaped)
   |     ("--no-verbose", "-n", @ArgParser.Clear(verbose), "disable verbose message"), (escaped)
15 |     ("--search", "-s", Set_string(keyword), "search for files"), (escaped)
   |                                   ^^^^^^^ (escaped)
   |     ("--delete", "-d", Set(delete_files), "delete listed files"), (escaped)
   |   ] (escaped)

<WORKDIR>/arg_test.mbt:21:13-21:20:
   |   let argv = ["--search", ".mbt", "--delete", "file1", "file2", "-n"] (escaped)
   |   let _ = try? @ArgParser.parse(options, file => files.push(file), usage, argv) (escaped)
   |   assert_eq(verbose.val, false) (escaped)
21 |   assert_eq(keyword.val, ".mbt") (escaped)
   |             ^^^^^^^ (escaped)
   |   assert_eq(files.length(), 2) (escaped)
   |   assert_eq(files[0], "file1") (escaped)

```

```mooncram
$ run_moon_ide moon ide find-references 'Trie'
2 symbols found matching 'Trie'
find-references only works with a single symbol, try to be more specific. (no-eol)
[1]
```

```mooncram
$ run_moon_ide moon ide find-references 'Spec'
`pub (all) enum Spec` in package Yoorkin/ArgParser at <WORKDIR>/arg.mbt:4-22
4 | ///| (escaped)
  | /// Matched option handler that used to interpret options. (escaped)
  | ///  (escaped)
  | ///  Unit - handle with callback   (escaped)
  | ///  (escaped)
  | ///  String - handle associated value with callback (escaped)
  | ///  (escaped)
  | ///  Set_string - set option to associated value  (escaped)
  | ///  (escaped)
  | ///  Set - set reference to true (escaped)
  | ///  (escaped)
  | ///  Clear - set reference to false (escaped)
  | pub(all) enum Spec { (escaped)
  |   Unit(() -> Unit raise) (escaped)
  |   String((String) -> Unit raise) (escaped)
  |   Set_string(Ref[String]) (escaped)
  |   Set(Ref[Bool]) (escaped)
  |   Clear(Ref[Bool]) (escaped)
  | } (escaped)

Found 5 references for symbol 'Spec':
<WORKDIR>/arg.mbt:16:15-16:19:
   | ///  Set - set reference to true (escaped)
   | ///  (escaped)
   | ///  Clear - set reference to false (escaped)
16 | pub(all) enum Spec { (escaped)
   |               ^^^^ (escaped)
   |   Unit(() -> Unit raise) (escaped)
   |   String((String) -> Unit raise) (escaped)

<WORKDIR>/arg.mbt:26:18-26:22:
   |  (escaped)
   | ///| (escaped)
   | fn interpret( (escaped)
26 |   trie : @trie.T[Spec], (escaped)
   |                  ^^^^ (escaped)
   |   xs : Array[String], (escaped)
   |   fallback : (String) -> Unit raise, (escaped)

<WORKDIR>/arg.mbt:87:37-87:41:
   | /// If the input arguments contains help option or invalid input, the `parse`  (escaped)
   | /// function will raise `ErrorMsg` error. (escaped)
   | pub fn parse( (escaped)
87 |   speclist : Array[(String, String, Spec, String)], (escaped)
   |                                     ^^^^ (escaped)
   |   rest : (String) -> Unit raise, (escaped)
   |   usage_msg : String, (escaped)

<WORKDIR>/arg.mbt:92:28-92:32:
   |   usage_msg : String, (escaped)
   |   argv : Array[String], (escaped)
   | ) -> Unit raise { (escaped)
92 |   let aux = fn(acc : (Trie[Spec], String), it) { (escaped)
   |                            ^^^^ (escaped)
   |     let (trie, help_msg) = acc (escaped)
   |     let (a, b, spec, help) = it (escaped)

<WORKDIR>/arg.mbt:103:19-103:23:
    |     aux, (escaped)
    |     init=(Trie::empty(), usage_msg + "\\n options:\\n"), (escaped)
    |   ) (escaped)
103 |   let help_spec = Spec::Unit(() => raise ErrorMsg(help_msg)) (escaped)
    |                   ^^^^ (escaped)
    |   let trie = trie.add("--help", help_spec).add("-h", help_spec) (escaped)
    |   interpret(trie, argv, rest) (escaped)

```

```mooncram
$ run_moon_ide moon ide find-references 'interpret'
`fn interpret` in package Yoorkin/ArgParser at <WORKDIR>/arg.mbt:24-67
24 | ///| (escaped)
   | fn interpret( (escaped)
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
   |             match (spec, rest) { (escaped)
   |               (String(f), [y, .. ys]) => { (escaped)
   |                 f(y) (escaped)
   |                 continue ys (escaped)
   |               } (escaped)
   |               (Set_string(r), [y, .. ys]) => { (escaped)
   |                 r.val = y (escaped)
   |                 continue ys (escaped)
   |               } (escaped)
   |               (String(_), []) | (Set_string(_), []) => (escaped)
   |                 raise ErrorMsg("missing argument for \\{x}") (escaped)
   |               (Set(r), _) => { (escaped)
   |                 r.val = true (escaped)
   |                 continue rest (escaped)
   |               } (escaped)
   |               (Clear(r), _) => { (escaped)
   |                 r.val = false (escaped)
   |                 continue rest (escaped)
   |               } (escaped)
   |               (Unit(f), _) => { (escaped)
   |                 f() (escaped)
   |                 continue rest (escaped)
   |               } (escaped)
   |             } (escaped)
   |         } (escaped)
   |     } (escaped)
   |   } (escaped)
   | } (escaped)

Found 2 references for symbol 'interpret':
<WORKDIR>/arg.mbt:25:4-25:13:
   | } (escaped)
   |  (escaped)
   | ///| (escaped)
25 | fn interpret( (escaped)
   |    ^^^^^^^^^ (escaped)
   |   trie : @trie.T[Spec], (escaped)
   |   xs : Array[String], (escaped)

<WORKDIR>/arg.mbt:105:3-105:12:
    |   ) (escaped)
    |   let help_spec = Spec::Unit(() => raise ErrorMsg(help_msg)) (escaped)
    |   let trie = trie.add("--help", help_spec).add("-h", help_spec) (escaped)
105 |   interpret(trie, argv, rest) (escaped)
    |   ^^^^^^^^^ (escaped)
    | } (escaped)
    |  (escaped)

```

```mooncram
$ run_moon_ide moon ide find-references 'parse'
5 symbols found matching 'parse'
find-references only works with a single symbol, try to be more specific. (no-eol)
[1]
```

```mooncram
$ run_moon_ide moon ide find-references 'ErrorMsg'
`pub error ErrorMsg` in package Yoorkin/ArgParser at <WORKDIR>/arg.mbt:108-111
108 | ///| (escaped)
    | pub suberror ErrorMsg { (escaped)
    |   ErrorMsg(String) (escaped)
    | } (escaped)

Found 1 references for symbol 'ErrorMsg':
<WORKDIR>/arg.mbt:109:14-109:22:
    | } (escaped)
    |  (escaped)
    | ///| (escaped)
109 | pub suberror ErrorMsg { (escaped)
    |              ^^^^^^^^ (escaped)
    |   ErrorMsg(String) (escaped)
    | } (escaped)

```
