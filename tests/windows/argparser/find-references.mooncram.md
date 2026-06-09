# argparser find-references

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\argparser' moon ide find-references 'Trie' --loc 'arg.mbt:2:19'
Found 3 references for symbol 'Trie':
<WORKDIR>/arg.mbt:2:19-2:23:
  | ///|
2 | using @trie {type Trie}
  |                   ^^^^
  | 
  | ///|

<WORKDIR>/arg.mbt:92:23-92:27:
   |   usage_msg : String,
   |   argv : Array[String],
   | ) -> Unit raise {
92 |   let aux = fn(acc : (Trie[Spec], String), it) {
   |                       ^^^^
   |     let (trie, help_msg) = acc
   |     let (a, b, spec, help) = it

<WORKDIR>/arg.mbt:101:11-101:15:
    |   }
    |   let (trie, help_msg) = speclist.fold(
    |     aux,
101 |     init=(Trie::empty(), usage_msg + "\n options:\n"),
    |           ^^^^
    |   )
    |   let help_spec = Spec::Unit(() => raise ErrorMsg(help_msg))

```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\argparser' moon ide find-references 'Spec' --loc 'arg.mbt:16:15'
Found 5 references for symbol 'Spec':
<WORKDIR>/arg.mbt:16:15-16:19:
   | ///  Set - set reference to true
   | /// 
   | ///  Clear - set reference to false
16 | pub(all) enum Spec {
   |               ^^^^
   |   Unit(() -> Unit raise)
   |   String((String) -> Unit raise)

<WORKDIR>/arg.mbt:26:18-26:22:
   | 
   | ///|
   | fn interpret(
26 |   trie : @trie.T[Spec],
   |                  ^^^^
   |   xs : Array[String],
   |   fallback : (String) -> Unit raise,

<WORKDIR>/arg.mbt:87:37-87:41:
   | /// If the input arguments contains help option or invalid input, the `parse` 
   | /// function will raise `ErrorMsg` error.
   | pub fn parse(
87 |   speclist : Array[(String, String, Spec, String)],
   |                                     ^^^^
   |   rest : (String) -> Unit raise,
   |   usage_msg : String,

<WORKDIR>/arg.mbt:92:28-92:32:
   |   usage_msg : String,
   |   argv : Array[String],
   | ) -> Unit raise {
92 |   let aux = fn(acc : (Trie[Spec], String), it) {
   |                            ^^^^
   |     let (trie, help_msg) = acc
   |     let (a, b, spec, help) = it

<WORKDIR>/arg.mbt:103:19-103:23:
    |     aux,
    |     init=(Trie::empty(), usage_msg + "\n options:\n"),
    |   )
103 |   let help_spec = Spec::Unit(() => raise ErrorMsg(help_msg))
    |                   ^^^^
    |   let trie = trie.add("--help", help_spec).add("-h", help_spec)
    |   interpret(trie, argv, rest)

```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\argparser' moon ide find-references 'verbose' --loc 'arg_test.mbt:3:7'
Found 3 references for symbol 'verbose':
<WORKDIR>/arg_test.mbt:3:7-3:14:
  | ///|
  | test {
3 |   let verbose : Ref[Bool] = Ref(true)
  |       ^^^^^^^
  |   let keyword : Ref[String] = Ref("")
  |   let delete_files : Ref[Bool] = Ref(false)

<WORKDIR>/arg_test.mbt:14:45-14:52:
   |     #|
   |   let files = []
   |   let options = [
14 |     ("--no-verbose", "-n", @ArgParser.Clear(verbose), "disable verbose message"),
   |                                             ^^^^^^^
   |     ("--search", "-s", Set_string(keyword), "search for files"),
   |     ("--delete", "-d", Set(delete_files), "delete listed files"),

<WORKDIR>/arg_test.mbt:20:13-20:20:
   |   ]
   |   let argv = ["--search", ".mbt", "--delete", "file1", "file2", "-n"]
   |   let _ = try? @ArgParser.parse(options, file => files.push(file), usage, argv)
20 |   assert_eq(verbose.val, false)
   |             ^^^^^^^
   |   assert_eq(keyword.val, ".mbt")
   |   assert_eq(files.length(), 2)

```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\argparser' moon ide find-references 'keyword' --loc 'arg_test.mbt:4:7'
Found 3 references for symbol 'keyword':
<WORKDIR>/arg_test.mbt:4:7-4:14:
  | ///|
  | test {
  |   let verbose : Ref[Bool] = Ref(true)
4 |   let keyword : Ref[String] = Ref("")
  |       ^^^^^^^
  |   let delete_files : Ref[Bool] = Ref(false)
  |   let usage =

<WORKDIR>/arg_test.mbt:15:35-15:42:
   |   let files = []
   |   let options = [
   |     ("--no-verbose", "-n", @ArgParser.Clear(verbose), "disable verbose message"),
15 |     ("--search", "-s", Set_string(keyword), "search for files"),
   |                                   ^^^^^^^
   |     ("--delete", "-d", Set(delete_files), "delete listed files"),
   |   ]

<WORKDIR>/arg_test.mbt:21:13-21:20:
   |   let argv = ["--search", ".mbt", "--delete", "file1", "file2", "-n"]
   |   let _ = try? @ArgParser.parse(options, file => files.push(file), usage, argv)
   |   assert_eq(verbose.val, false)
21 |   assert_eq(keyword.val, ".mbt")
   |             ^^^^^^^
   |   assert_eq(files.length(), 2)
   |   assert_eq(files[0], "file1")

```
