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
$ run_moon_ide moon ide peek-def trie --loc 'arg.mbt:2:7'
Error: could not find definition for symbol 'trie' at arg.mbt:2:7
[1]
```

```mooncram
$ run_moon_ide moon ide peek-def Trie --loc 'arg.mbt:2:19'
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
$ run_moon_ide moon ide peek-def verbose --loc 'arg_test.mbt:3:7'
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
$ run_moon_ide moon ide peek-def keyword --loc 'arg_test.mbt:4:7'
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
$ run_moon_ide moon ide peek-def 'Trie'
Found 2 symbols matching 'Trie':

`type Trie` in package Yoorkin/ArgParser at <WORKDIR>/arg.mbt:1-2
1 | ///| (escaped)
  | using @trie {type Trie} (escaped)

`struct Trie` in package Yoorkin/trie at <WORKDIR>/.mooncakes/Yoorkin/trie/trie.mbt:1-6
1 | ///| (escaped)
  | #alias(T) (escaped)
  | struct Trie[A] { (escaped)
  |   value : A? (escaped)
  |   forks : @immut/sorted_map.SortedMap[Char, Trie[A]] (escaped)
  | } (no-eol) (escaped)
```

```mooncram
$ run_moon_ide moon ide peek-def 'Spec'
Found 1 symbols matching 'Spec':

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
  | } (no-eol) (escaped)
```

```mooncram
$ run_moon_ide moon ide peek-def 'interpret'
Found 1 symbols matching 'interpret':

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
   | } (no-eol) (escaped)
```

```mooncram
$ run_moon_ide moon ide peek-def 'parse'
Found 5 symbols matching 'parse':

`pub fn parse` in package Yoorkin/ArgParser at <WORKDIR>/arg.mbt:69-106
69 | ///| (escaped)
   | /// Parse argument list for CLI tools (escaped)
   | ///  (escaped)
   | /// Match `OptionName` or `LongOptionName` then interpret with `Spec` and  (escaped)
   | /// use `Description` to generate `-h` or `--help` options message. (escaped)
   | ///  (escaped)
   | /// # Parameters (escaped)
   | ///  (escaped)
   | /// - speclist: (LongOptionName, OptionName, Spec, Description) of Array  (escaped)
   | /// - rest: rest arguments handler (escaped)
   | /// - usage_msg: synopsis usage   (escaped)
   | /// - argv: input argument list  (escaped)
   | ///  (escaped)
   | /// # Exception (escaped)
   | ///  (escaped)
   | /// If the input arguments contains help option or invalid input, the `parse`  (escaped)
   | /// function will raise `ErrorMsg` error. (escaped)
   | pub fn parse( (escaped)
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
   |     init=(Trie::empty(), usage_msg + "\\n options:\\n"), (escaped)
   |   ) (escaped)
   |   let help_spec = Spec::Unit(() => raise ErrorMsg(help_msg)) (escaped)
   |   let trie = trie.add("--help", help_spec).add("-h", help_spec) (escaped)
   |   interpret(trie, argv, rest) (escaped)
   | } (escaped)

`pub fn alias parse` in package moonbitlang/core/argparse at <MOON_HOME>/lib/core/argparse/command.mbt:135-164
135 | ///| (escaped)
    | /// Parse argv/environment according to this command spec. (escaped)
    | /// (escaped)
    | /// Behavior: (escaped)
    | /// - Help/version requests print output immediately and terminate with exit code (escaped)
    | ///   `0`. (escaped)
    | /// - Parse failures raise display-ready error text with full contextual help. (escaped)
    | /// - Command-definition validation failures raise display-ready validation (escaped)
    | ///   text (without appended help). (escaped)
    | /// (escaped)
    | /// Value precedence is `argv > env > default_values`. (escaped)
    | #as_free_fn (escaped)
    | pub fn Command::parse( (escaped)
    |   self : Command, (escaped)
    |   argv? : ArrayView[String] = default_argv(), (escaped)
    |   env? : Map[String, String] = Map([]), (escaped)
    | ) -> Matches raise { (escaped)
    |   try { (escaped)
    |     let raw = parse_command(self, argv, env, [], Map([]), Map([]), self.name) (escaped)
    |     build_matches(self, raw, []) (escaped)
    |   } catch { (escaped)
    |     DisplayHelp::Message(text) => print_and_exit_success(text) (escaped)
    |     DisplayVersion::Message(text) => print_and_exit_success(text) (escaped)
    |     ArgError::Message(_) as err => raise err (escaped)
    |     err => { (escaped)
    |       println(err.to_string()) (escaped)
    |       panic() (escaped)
    |     } (escaped)
    |   } (escaped)
    | } (escaped)

`pub fn parse` in package moonbitlang/core/json at <MOON_HOME>/lib/core/json/parse.mbt:26-41
26 | ///| (escaped)
   | /// Parse a JSON input string into a Json value, with an optional maximum nesting depth (default is 1024) (escaped)
   | #label_migration(max_nesting_depth, fill=false) (escaped)
   | pub fn parse( (escaped)
   |   input : StringView, (escaped)
   |   max_nesting_depth? : Int = 1024, (escaped)
   | ) -> Json raise ParseError { (escaped)
   |   let ctx = ParseContext::make(input, max_nesting_depth) (escaped)
   |   let val = ctx.parse_value() (escaped)
   |   ctx.lex_skip_whitespace() (escaped)
   |   if ctx.offset >= ctx.end_offset { (escaped)
   |     val (escaped)
   |   } else { (escaped)
   |     ctx.invalid_char() (escaped)
   |   } (escaped)
   | } (escaped)

`pub fn parse` in package moonbitlang/core/strconv at <MOON_HOME>/lib/core/strconv/deprecated.mbt:74-79
74 | ///| (escaped)
   | /// Parse input into this package's structured value. (escaped)
   | #deprecated("use `@string.from_str` instead", skip_current_package=true) (escaped)
   | pub fn[A : FromStr] parse(str : StringView) -> A raise StrConvError { (escaped)
   |   A::from_str(str) (escaped)
   | } (escaped)

`pub fn parse` in package moonbitlang/core/string/internal/regex_parser at <MOON_HOME>/lib/core/string/internal/regex_parser/parser.mbt:406-419
406 | ///| (escaped)
    | /// Parse input into this package's structured value. (escaped)
    | pub fn parse( (escaped)
    |   profile~ : Profile, (escaped)
    |   mode~ : Mode, (escaped)
    |   pattern : StringView, (escaped)
    | ) -> Pattern raise ParserError { (escaped)
    |   let ctx = ParserContext::new(profile~, base=pattern.start_offset(), mode~) (escaped)
    |   let (rest, pat) = Parser::disjunction(pattern, ctx~) (escaped)
    |   if !rest.is_empty() { (escaped)
    |     raise ctx.error_at(rest, HINT_UNEXPECTED_CHAR) (escaped)
    |   } (escaped)
    |   pat (escaped)
    | } (no-eol) (escaped)
```

```mooncram
$ run_moon_ide moon ide peek-def 'ErrorMsg'
Found 1 symbols matching 'ErrorMsg':

`pub error ErrorMsg` in package Yoorkin/ArgParser at <WORKDIR>/arg.mbt:108-111
108 | ///| (escaped)
    | pub suberror ErrorMsg { (escaped)
    |   ErrorMsg(String) (escaped)
    | } (no-eol) (escaped)
```
