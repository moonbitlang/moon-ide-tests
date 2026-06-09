# argparser peek-def

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\argparser' moon ide peek-def 'Trie' --loc 'arg.mbt:2:19'
Definition found at file <WORKDIR>/.mooncakes\Yoorkin\trie\trie.mbt
  | ///|
  | #alias(T)
3 | struct Trie[A] {
  |        ^^^^
  |   value : A?
  |   forks : @immut/sorted_map.SortedMap[Char, Trie[A]]
  | }
  | 
  | ///|
  | pub fn[A] Trie::lookup(self : Self[A], path : String) -> A? {
  |   loop (path.view(), self) {
  |     ([], trie) => trie.value
  |     ([x, .. xs], trie) =>
  |       match trie.forks.get(x) {
  |         None => None
  |         Some(subtree) => continue (xs, subtree) (escaped)
  |       }
  |   }
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\argparser' moon ide peek-def 'Spec' --loc 'arg.mbt:16:15'
Definition found at file <WORKDIR>/arg.mbt
   | ///  Set_string - set option to associated value 
   | /// 
   | ///  Set - set reference to true
   | /// 
   | ///  Clear - set reference to false
16 | pub(all) enum Spec {
   |               ^^^^
   |   Unit(() -> Unit raise)
   |   String((String) -> Unit raise)
   |   Set_string(Ref[String])
   |   Set(Ref[Bool])
   |   Clear(Ref[Bool])
   | }
   | 
   | ///|
   | fn interpret(
   |   trie : @trie.T[Spec],
   |   xs : Array[String],
   |   fallback : (String) -> Unit raise,
   | ) -> Unit raise {
   |   for remaining = xs[:] {
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\argparser' moon ide peek-def 'verbose' --loc 'arg_test.mbt:3:7'
Definition found at file <WORKDIR>/arg_test.mbt
  | ///|
  | test {
3 |   let verbose : Ref[Bool] = Ref(true)
  |       ^^^^^^^
  |   let keyword : Ref[String] = Ref("")
  |   let delete_files : Ref[Bool] = Ref(false)
  |   let usage =
  |     #| Awesome CLI tool!
  |     #| usage: 
  |     #|      mytool [options] <file1> [<file2>] ... -o <output>
  |     #|
  |     #|
  |   let files = []
  |   let options = [
  |     ("--no-verbose", "-n", @ArgParser.Clear(verbose), "disable verbose message"),
  |     ("--search", "-s", Set_string(keyword), "search for files"),
  |     ("--delete", "-d", Set(delete_files), "delete listed files"),
  |   ]
```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\argparser' moon ide peek-def 'keyword' --loc 'arg_test.mbt:4:7'
Definition found at file <WORKDIR>/arg_test.mbt
  | ///|
  | test {
  |   let verbose : Ref[Bool] = Ref(true)
4 |   let keyword : Ref[String] = Ref("")
  |       ^^^^^^^
  |   let delete_files : Ref[Bool] = Ref(false)
  |   let usage =
  |     #| Awesome CLI tool!
  |     #| usage: 
  |     #|      mytool [options] <file1> [<file2>] ... -o <output>
  |     #|
  |     #|
  |   let files = []
  |   let options = [
  |     ("--no-verbose", "-n", @ArgParser.Clear(verbose), "disable verbose message"),
  |     ("--search", "-s", Set_string(keyword), "search for files"),
  |     ("--delete", "-d", Set(delete_files), "delete listed files"),
  |   ]
  |   let argv = ["--search", ".mbt", "--delete", "file1", "file2", "-n"]
```
