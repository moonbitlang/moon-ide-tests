# argparser rename

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
$ run_moon_ide moon ide rename 'Trie' 'TrieRenamed' --loc 'arg.mbt:2:19'
*** Begin Patch
*** Update File: <WORKDIR>/arg.mbt
@@
 ///|
-using @trie {type Trie}
+using @trie {type TrieRenamed}
 
 ///|
 /// Matched option handler that used to interpret options.
@@
   usage_msg : String,
   argv : Array[String],
 ) -> Unit raise {
-  let aux = fn(acc : (Trie[Spec], String), it) {
+  let aux = fn(acc : (TrieRenamed[Spec], String), it) {
     let (trie, help_msg) = acc
     let (a, b, spec, help) = it
     let trie = trie.add(a, spec).add(b, spec)
@@
   }
   let (trie, help_msg) = speclist.fold(
     aux,
-    init=(Trie::empty(), usage_msg + "\n options:\n"),
+    init=(TrieRenamed::empty(), usage_msg + "\n options:\n"),
   )
   let help_spec = Spec::Unit(() => raise ErrorMsg(help_msg)) (escaped)
   let trie = trie.add("--help", help_spec).add("-h", help_spec)
*** End Patch

```

```mooncram
$ run_moon_ide moon ide rename 'Set_string' 'Set_stringRenamed' --loc 'arg.mbt:19:3'
*** Begin Patch
*** Update File: <WORKDIR>/arg.mbt
@@
 pub(all) enum Spec {
   Unit(() -> Unit raise)
   String((String) -> Unit raise)
-  Set_string(Ref[String])
+  Set_stringRenamed(Ref[String])
   Set(Ref[Bool])
   Clear(Ref[Bool])
 }
@@
                 f(y)
                 continue ys
               }
-              (Set_string(r), [y, .. ys]) => { (escaped)
+              (Set_stringRenamed(r), [y, .. ys]) => { (escaped)
                 r.val = y
                 continue ys
               }
-              (String(_), []) | (Set_string(_), []) => (escaped)
+              (String(_), []) | (Set_stringRenamed(_), []) => (escaped)
                 raise ErrorMsg("missing argument for \{x}")
               (Set(r), _) => { (escaped)
                 r.val = true
*** Update File: <WORKDIR>/arg_test.mbt
@@
   let files = []
   let options = [
     ("--no-verbose", "-n", @ArgParser.Clear(verbose), "disable verbose message"),
-    ("--search", "-s", Set_string(keyword), "search for files"),
+    ("--search", "-s", Set_stringRenamed(keyword), "search for files"),
     ("--delete", "-d", Set(delete_files), "delete listed files"),
   ]
   let argv = ["--search", ".mbt", "--delete", "file1", "file2", "-n"]
*** End Patch

```

```mooncram
$ run_moon_ide moon ide rename 'verbose' 'verbose_renamed' --loc 'arg_test.mbt:3:7'
*** Begin Patch
*** Update File: <WORKDIR>/arg_test.mbt
@@
 ///|
 test {
-  let verbose : Ref[Bool] = Ref(true)
+  let verbose_renamed : Ref[Bool] = Ref(true)
   let keyword : Ref[String] = Ref("")
   let delete_files : Ref[Bool] = Ref(false)
   let usage =
@@
     #|
   let files = []
   let options = [
-    ("--no-verbose", "-n", @ArgParser.Clear(verbose), "disable verbose message"),
+    ("--no-verbose", "-n", @ArgParser.Clear(verbose_renamed), "disable verbose message"),
     ("--search", "-s", Set_string(keyword), "search for files"),
     ("--delete", "-d", Set(delete_files), "delete listed files"),
   ]
   let argv = ["--search", ".mbt", "--delete", "file1", "file2", "-n"]
   let _ = try? @ArgParser.parse(options, file => files.push(file), usage, argv) (escaped)
-  assert_eq(verbose.val, false)
+  assert_eq(verbose_renamed.val, false)
   assert_eq(keyword.val, ".mbt")
   assert_eq(files.length(), 2)
   assert_eq(files[0], "file1")
*** End Patch

```

```mooncram
$ run_moon_ide moon ide rename 'keyword' 'keyword_renamed' --loc 'arg_test.mbt:4:7'
*** Begin Patch
*** Update File: <WORKDIR>/arg_test.mbt
@@
 ///|
 test {
   let verbose : Ref[Bool] = Ref(true)
-  let keyword : Ref[String] = Ref("")
+  let keyword_renamed : Ref[String] = Ref("")
   let delete_files : Ref[Bool] = Ref(false)
   let usage =
     #| Awesome CLI tool!
@@
   let files = []
   let options = [
     ("--no-verbose", "-n", @ArgParser.Clear(verbose), "disable verbose message"),
-    ("--search", "-s", Set_string(keyword), "search for files"),
+    ("--search", "-s", Set_string(keyword_renamed), "search for files"),
     ("--delete", "-d", Set(delete_files), "delete listed files"),
   ]
   let argv = ["--search", ".mbt", "--delete", "file1", "file2", "-n"]
   let _ = try? @ArgParser.parse(options, file => files.push(file), usage, argv) (escaped)
   assert_eq(verbose.val, false)
-  assert_eq(keyword.val, ".mbt")
+  assert_eq(keyword_renamed.val, ".mbt")
   assert_eq(files.length(), 2)
   assert_eq(files[0], "file1")
   assert_eq(files[1], "file2")
*** End Patch

```

```mooncram
$ run_moon_ide moon ide rename 'Spec' 'SpecRenamed' --loc 'arg.mbt:16:15'
*** Begin Patch
*** Update File: <WORKDIR>/arg.mbt
@@
 ///  Set - set reference to true
 /// 
 ///  Clear - set reference to false
-pub(all) enum Spec {
+pub(all) enum SpecRenamed {
   Unit(() -> Unit raise)
   String((String) -> Unit raise)
   Set_string(Ref[String])
@@
 
 ///|
 fn interpret(
-  trie : @trie.T[Spec],
+  trie : @trie.T[SpecRenamed],
   xs : Array[String],
   fallback : (String) -> Unit raise,
 ) -> Unit raise {
@@
 /// If the input arguments contains help option or invalid input, the `parse` 
 /// function will raise `ErrorMsg` error.
 pub fn parse(
-  speclist : Array[(String, String, Spec, String)],
+  speclist : Array[(String, String, SpecRenamed, String)],
   rest : (String) -> Unit raise,
   usage_msg : String,
   argv : Array[String],
 ) -> Unit raise {
-  let aux = fn(acc : (Trie[Spec], String), it) {
+  let aux = fn(acc : (Trie[SpecRenamed], String), it) {
     let (trie, help_msg) = acc
     let (a, b, spec, help) = it
     let trie = trie.add(a, spec).add(b, spec)
@@
     aux,
     init=(Trie::empty(), usage_msg + "\n options:\n"),
   )
-  let help_spec = Spec::Unit(() => raise ErrorMsg(help_msg)) (escaped)
+  let help_spec = SpecRenamed::Unit(() => raise ErrorMsg(help_msg)) (escaped)
   let trie = trie.add("--help", help_spec).add("-h", help_spec)
   interpret(trie, argv, rest)
 }
*** End Patch

```

```mooncram
$ run_moon_ide moon ide rename 'interpret' 'interpret_renamed' --loc 'arg.mbt:25:4'
*** Begin Patch
*** Update File: <WORKDIR>/arg.mbt
@@
 }
 
 ///|
-fn interpret(
+fn interpret_renamed(
   trie : @trie.T[Spec],
   xs : Array[String],
   fallback : (String) -> Unit raise,
@@
   )
   let help_spec = Spec::Unit(() => raise ErrorMsg(help_msg)) (escaped)
   let trie = trie.add("--help", help_spec).add("-h", help_spec)
-  interpret(trie, argv, rest)
+  interpret_renamed(trie, argv, rest)
 }
 
 ///|
*** End Patch

```

```mooncram
$ run_moon_ide moon ide rename 'parse' 'parse_renamed' --loc 'arg.mbt:86:8'
*** Begin Patch
*** Update File: <WORKDIR>/arg.mbt
@@
 /// 
 /// If the input arguments contains help option or invalid input, the `parse` 
 /// function will raise `ErrorMsg` error.
-pub fn parse(
+pub fn parse_renamed(
   speclist : Array[(String, String, Spec, String)],
   rest : (String) -> Unit raise,
   usage_msg : String,
*** Update File: <WORKDIR>/arg_test.mbt
@@
     ("--delete", "-d", Set(delete_files), "delete listed files"),
   ]
   let argv = ["--search", ".mbt", "--delete", "file1", "file2", "-n"]
-  let _ = try? @ArgParser.parse(options, file => files.push(file), usage, argv) (escaped)
+  let _ = try? @ArgParser.parse_renamed(options, file => files.push(file), usage, argv) (escaped)
   assert_eq(verbose.val, false)
   assert_eq(keyword.val, ".mbt")
   assert_eq(files.length(), 2)
*** End Patch

```

```mooncram
$ run_moon_ide moon ide rename 'ErrorMsg' 'ErrorMsgRenamed' --loc 'arg.mbt:109:14'
*** Begin Patch
*** Update File: <WORKDIR>/arg.mbt
@@
 }
 
 ///|
-pub suberror ErrorMsg {
+pub suberror ErrorMsgRenamed {
   ErrorMsg(String)
 }
*** End Patch

```
