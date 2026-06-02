# argparser find-references

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
$ run_moon_ide moon ide find-references 'Trie' --loc 'arg.mbt:2:19'
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

````

````mooncram
$ run_moon_ide moon ide find-references 'Spec' --loc 'arg.mbt:16:15'
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

````

````mooncram
$ run_moon_ide moon ide find-references 'verbose' --loc 'arg_test.mbt:3:7'
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

````

````mooncram
$ run_moon_ide moon ide find-references 'keyword' --loc 'arg_test.mbt:4:7'
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

````
