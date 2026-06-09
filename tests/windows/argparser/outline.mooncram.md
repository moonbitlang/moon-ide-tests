# argparser outline

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\argparser' moon ide outline 'arg.mbt'
 L002 | using @trie {type Trie}
        ...
 L016 | pub(all) enum Spec {
        ...
 L025 | fn interpret(
 L026 |   trie : @trie.T[Spec],
 L027 |   xs : Array[String],
 L028 |   fallback : (String) -> Unit raise,
 L029 | ) -> Unit raise {
        ...
 L086 | pub fn parse(
 L087 |   speclist : Array[(String, String, Spec, String)],
 L088 |   rest : (String) -> Unit raise,
 L089 |   usage_msg : String,
 L090 |   argv : Array[String],
 L091 | ) -> Unit raise {
        ...
 L109 | pub suberror ErrorMsg {
        ...

```

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\argparser' moon ide outline 'arg_test.mbt'
 L2 | test {
      ...

```
