# argparser outline

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\argparser' moon ide outline 'arg.mbt'
  2 |using @trie {type Trie}
    |...
 16 |pub(all) enum Spec {
    |...
 25 |fn interpret(
 26 |  trie : @trie.T[Spec],
 27 |  xs : Array[String],
 28 |  fallback : (String) -> Unit raise,
 29 |) -> Unit raise {
    |...
 86 |pub fn parse(
 87 |  speclist : Array[(String, String, Spec, String)],
 88 |  rest : (String) -> Unit raise,
 89 |  usage_msg : String,
 90 |  argv : Array[String],
 91 |) -> Unit raise {
    |...
109 |pub suberror ErrorMsg {
    |...

```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\argparser' moon ide outline 'arg_test.mbt'
2 |test {
  |...

```
