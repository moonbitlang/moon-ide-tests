# core find-references execute string/regex_test.mbt:18:15

```mooncram
$ export MOON_HOME="${MOON_HOME:-$HOME/.moon}"
```

```mooncram
$ export TEST_REPO_ROOT="$(cd "$TESTDIR/../../../fixtures/repos/core" && pwd)"
```

```mooncram
$ normalize_moon_ide_output() { sed -e "s|$TEST_REPO_ROOT|<WORKDIR>|g" -e "s|$MOON_HOME|<MOON_HOME>|g"; }
```

```mooncram
$ run_moon_ide() { status_file="${TMPDIR:-/tmp}/moon-ide-status.$$"; ( cd "$TEST_REPO_ROOT" && "$@"; echo "$?" > "$status_file" ) 2>&1 | normalize_moon_ide_output; status=$(cat "$status_file"); rm -f "$status_file"; return "$status"; }
```

```mooncram
$ run_moon_ide moon ide find-references 'execute' --loc 'string/regex_test.mbt:18:15'
Found 74 references for symbol 'execute':
<WORKDIR>/string/README.mbt.md:204:15-204:22:
    | test "string regex basics" {
    |   let regex = re"[[:digit:]]+"
    | 
204 |   guard regex.execute("id=42") is Some(m) else { fail("Expected match") }
    |               ^^^^^^^
    |   inspect(m.content(), content="42")
    | 

<WORKDIR>/string/README.mbt.md:262:12-262:19:
    | ///|
    | test "match result" {
    |   let re = re"([[:alpha:]]+)=([[:digit:]]+)"
262 |   guard re.execute("key=42") is Some(m) else { fail("no match") }
    |            ^^^^^^^
    |   inspect(m.content(), content="key=42")
    |   inspect(m.before(), content="")

<WORKDIR>/string/README.mbt.md:277:12-277:19:
    | ///|
    | test "named groups" {
    |   let re = re"(?<name>[[:alpha:]]+):(?<val>[[:digit:]]+)"
277 |   guard re.execute("age:30") is Some(m) else { fail("no match") }
    |            ^^^^^^^
    |   debug_inspect(m.named_group("name"), content="Some(<StringView: \"age\">)")
    |   debug_inspect(m.named_group("val"), content="Some(<StringView: \"30\">)")

<WORKDIR>/string/README.mbt.md:310:15-310:22:
    | test "regex combinators" {
    |   // match "abc" literally
    |   let abc = @string.Regex::string("abc")
310 |   inspect(abc.execute("xabcy") is Some(_), content="true")
    |               ^^^^^^^
    |   // repeat: match 2 to 4 digits
    |   let digits = re"[[:digit:]]".repeat(min=2, max=4)

<WORKDIR>/string/README.mbt.md:313:16-313:23:
    |   inspect(abc.execute("xabcy") is Some(_), content="true")
    |   // repeat: match 2 to 4 digits
    |   let digits = re"[[:digit:]]".repeat(min=2, max=4)
313 |   guard digits.execute("a12345") is Some(m) else { fail("no match") }
    |                ^^^^^^^
    |   inspect(m.content(), content="1234") // greedy: takes max
    |   // alternation with |

<WORKDIR>/string/README.mbt.md:317:18-317:25:
    |   inspect(m.content(), content="1234") // greedy: takes max
    |   // alternation with |
    |   let either = @string.Regex::string("cat") | @string.Regex::string("dog")
317 |   inspect(either.execute("I have a dog") is Some(_), content="true")
    |                  ^^^^^^^
    | }
    | ```

<WORKDIR>/string/regex.mbt:63:19-63:26:
   | /// ```mbt check
   | /// test {
   | ///   let regex = re"[[:digit:]]+"
63 | ///   guard regex.execute("a12b") is Some(m) else { fail("Expected match") }
   |                   ^^^^^^^
   | ///   inspect(m.content(), content="12")
   | /// }

<WORKDIR>/string/regex.mbt:180:19-180:26:
    | /// ```mbt check
    | /// test {
    | ///   let regex = @string.Regex::unsafe_from_string("[[:digit:]]+")
180 | ///   guard regex.execute("a12b") is Some(m) else { fail("Expected match") }
    |                   ^^^^^^^
    | ///   inspect(m.content(), content="12")
    | /// }

<WORKDIR>/string/regex.mbt:198:21-198:28:
    | /// ```mbt check
    | /// test {
    | ///   let regex = @string.Regex::string("a+b(c)")
198 | ///   inspect(regex.execute("a+b(c)") is Some(_), content="true")
    |                     ^^^^^^^
    | ///   inspect(regex.execute("abcc") is Some(_), content="false")
    | /// }

<WORKDIR>/string/regex.mbt:199:21-199:28:
    | /// test {
    | ///   let regex = @string.Regex::string("a+b(c)")
    | ///   inspect(regex.execute("a+b(c)") is Some(_), content="true")
199 | ///   inspect(regex.execute("abcc") is Some(_), content="false")
    |                     ^^^^^^^
    | /// }
    | /// ```

<WORKDIR>/string/regex.mbt:224:20-224:27:
    | /// ```mbt check
    | /// test {
    | ///   let greedy = re"[[:digit:]]".repeat(min=2, max=4)
224 | ///   guard greedy.execute("a12345") is Some(m1) else { fail("Expected match") }
    |                    ^^^^^^^
    | ///   inspect(m1.content(), content="1234")
    | ///

<WORKDIR>/string/regex.mbt:228:23-228:30:
    | ///   inspect(m1.content(), content="1234")
    | ///
    | ///   let nongreedy = re"[[:digit:]]".repeat(min=2, max=4, greedy=false)
228 | ///   guard nongreedy.execute("a12345") is Some(m2) else { fail("Expected match") }
    |                       ^^^^^^^
    | ///   inspect(m2.content(), content="12")
    | /// }

<WORKDIR>/string/regex.mbt:265:19-265:26:
    | /// ```mbt check
    | /// test {
    | ///   let regex = @string.Regex::string("ab") + @string.Regex::string("cd")
265 | ///   guard regex.execute("xabcd") is Some(m) else { fail("Expected match") }
    |                   ^^^^^^^
    | ///   inspect(m.content(), content="abcd")
    | /// }

<WORKDIR>/string/regex.mbt:282:21-282:28:
    | /// ```mbt check
    | /// test {
    | ///   let regex = @string.Regex::string("cat") | @string.Regex::string("dog")
282 | ///   inspect(regex.execute("dog") is Some(_), content="true")
    |                     ^^^^^^^
    | ///   inspect(regex.execute("cow") is Some(_), content="false")
    | /// }

<WORKDIR>/string/regex.mbt:283:21-283:28:
    | /// test {
    | ///   let regex = @string.Regex::string("cat") | @string.Regex::string("dog")
    | ///   inspect(regex.execute("dog") is Some(_), content="true")
283 | ///   inspect(regex.execute("cow") is Some(_), content="false")
    |                     ^^^^^^^
    | /// }
    | /// ```

<WORKDIR>/string/regex.mbt:328:19-328:26:
    | ///   let regex = re"[[:digit:]]+"
    | ///   let input = "a12b34"
    | ///
328 | ///   guard regex.execute(input) is Some(first) else {
    |                   ^^^^^^^
    | ///     fail("Expected first match")
    | ///   }

<WORKDIR>/string/regex.mbt:334:19-334:26:
    | ///   inspect(first.content(), content="12")
    | ///
    | ///   let next = first.before().length() + first.content().length()
334 | ///   guard regex.execute(input, last_index=next) is Some(second) else {
    |                   ^^^^^^^
    | ///     fail("Expected second match")
    | ///   }

<WORKDIR>/string/regex.mbt:344:24-344:31:
    | /// ```mbt check
    | /// test {
    | ///   let anchored = re"^ab$"
344 | ///   inspect(anchored.execute("ab", last_index=0) is Some(_), content="true")
    |                        ^^^^^^^
    | ///   inspect(anchored.execute("xaby", last_index=1) is Some(_), content="false")
    | /// }

<WORKDIR>/string/regex.mbt:345:24-345:31:
    | /// test {
    | ///   let anchored = re"^ab$"
    | ///   inspect(anchored.execute("ab", last_index=0) is Some(_), content="true")
345 | ///   inspect(anchored.execute("xaby", last_index=1) is Some(_), content="false")
    |                        ^^^^^^^
    | /// }
    | /// ```

<WORKDIR>/string/regex.mbt:348:15-348:22:
    | ///   inspect(anchored.execute("xaby", last_index=1) is Some(_), content="false")
    | /// }
    | /// ```
348 | pub fn Regex::execute(
    |               ^^^^^^^
    |   self : Regex,
    |   input : StringView,

<WORKDIR>/string/regex.mbt:372:19-372:26:
    | /// test {
    | ///   let digit = re"[[:digit:]]+".capture("number")
    | ///   let regex = @string.Regex::string("ID: ") + digit
372 | ///   guard regex.execute("ID: 12345") is Some(m) else { fail("Expected match") }
    |                   ^^^^^^^
    | ///   debug_inspect(
    | ///     m.named_group("number"),

<WORKDIR>/string/regex.mbt:392:19-392:26:
    | ///     domain +
    | ///     @string.Regex::string(".") +
    | ///     tld
392 | ///   guard email.execute("john@example.com") is Some(m) else {
    |                   ^^^^^^^
    | ///     fail("Expected match")
    | ///   }

<WORKDIR>/string/regex_bench_test.mbt:19:21-19:28:
   | test "bench regex /aa?b/ on 1MB string" (it : @bench.T) {
   |   let re = re"aa?b"
   |   let one_mb_string : String = "a".repeat(1024 * 1024 - 1) + "b"
19 |   it.bench(() => re.execute(one_mb_string) |> ignore)
   |                     ^^^^^^^
   | }
   | 

<WORKDIR>/string/regex_bench_test.mbt:37:10-37:17:
   |   ]
   |   it.bench(() => {
   |     for line in phone_lines {
37 |       re.execute(line) |> ignore
   |          ^^^^^^^
   |     }
   |   })

<WORKDIR>/string/regex_bench_test.mbt:87:10-87:17:
   |   let filenames = make_filenames()
   |   it.bench(() => {
   |     for filename in filenames {
87 |       re.execute(filename) |> ignore
   |          ^^^^^^^
   |     }
   |   })

<WORKDIR>/string/regex_literal_test.mbt:17:16-17:23:
   | 
   | ///|
   | test "regex_literal" {
17 |   guard re"\\".execute("\\") is Some(result) && result.group(0) is Some("\\") else {
   |                ^^^^^^^
   |     fail("Expected match")
   |   }

<WORKDIR>/string/regex_methods.mbt:61:17-61:24:
   |     if limit is Some(limit) && replaced >= limit {
   |       break copy_index
   |     }
61 |     match regex.execute(str, last_index=search_index) {
   |                 ^^^^^^^
   |       None => break copy_index
   |       Some(m) => {

<WORKDIR>/string/regex_methods.mbt:119:17-119:24:
    |   let len = str.length()
    |   Iter::new(() => {
    |     guard search_index <= len else { None }
119 |     match regex.execute(str, last_index=search_index) {
    |                 ^^^^^^^
    |       None => None
    |       Some(m) => {

<WORKDIR>/string/regex_methods.mbt:160:19-160:26:
    |   Iter::new(() => {
    |     guard !done else { None }
    |     while search_index <= len {
160 |       match regex.execute(str, last_index=search_index) {
    |                   ^^^^^^^
    |         None => {
    |           done = true

<WORKDIR>/string/regex_test.mbt:18:15-18:22:
   | ///|
   | test "execute/non_capture_group" {
   |   let regex = re"(?:ab)(c)(?:d)"
18 |   guard regex.execute("abcd") is Some(m) else { fail("Expected match") }
   |               ^^^^^^^
   |   debug_inspect(
   |     m,

<WORKDIR>/string/regex_test.mbt:34:15-34:22:
   | ///|
   | test "execute/non_capture_with_named_group" {
   |   let regex = re"(?:a)(b)(?:c)(?<d>d)"
34 |   guard regex.execute("abcd") is Some(m) else { fail("Expected match") }
   |               ^^^^^^^
   |   debug_inspect(
   |     m,

<WORKDIR>/string/regex_test.mbt:50:15-50:22:
   | ///|
   | test "execute/any_char_on_supplementary_plane" {
   |   let regex = re"."
50 |   guard regex.execute("😀") is Some(m) else {
   |               ^^^^^^^
   |     fail("Expected match for supplementary-plane Unicode escape")
   |   }

<WORKDIR>/string/regex_test.mbt:68:15-68:22:
   | ///|
   | test "execute/range_crossing_surrogate_gap_has_no_half_match" {
   |   let regex = re"[\uD7FF-\uE000]"
68 |   guard regex.execute("😀") is None else {
   |               ^^^^^^^
   |     fail("Expected no surrogate-half match")
   |   }

<WORKDIR>/string/regex_test.mbt:94:15-94:22:
   | ///|
   | test "compile/unicode_escape_supplementary_plane" {
   |   let regex = re"\u{1F600}"
94 |   guard regex.execute("a😀b") is Some(m) else {
   |               ^^^^^^^
   |     fail("Expected match for supplementary-plane Unicode escape")
   |   }

<WORKDIR>/string/regex_test.mbt:112:15-112:22:
    | ///|
    | test "string/literal_metacharacters" {
    |   let regex = @string.Regex::string("a+b(c)")
112 |   guard regex.execute("xa+b(c)y") is Some(m) else {
    |               ^^^^^^^
    |     fail("Expected literal match")
    |   }

<WORKDIR>/string/regex_test.mbt:126:11-126:18:
    |     ),
    |   )
    |   debug_inspect(
126 |     regex.execute("xabccy"),
    |           ^^^^^^^
    |     content=(
    |       #|None

<WORKDIR>/string/regex_test.mbt:138:16-138:23:
    |   let base = re"[[:digit:]]"
    |   let greedy = base.repeat(min=2, max=4)
    |   let nongreedy = base.repeat(min=2, max=4, greedy=false)
138 |   guard greedy.execute("a12345") is Some(m1) else {
    |                ^^^^^^^
    |     fail("Expected greedy match")
    |   }

<WORKDIR>/string/regex_test.mbt:141:19-141:26:
    |   guard greedy.execute("a12345") is Some(m1) else {
    |     fail("Expected greedy match")
    |   }
141 |   guard nongreedy.execute("a12345") is Some(m2) else {
    |                   ^^^^^^^
    |     fail("Expected non-greedy match")
    |   }

<WORKDIR>/string/regex_test.mbt:193:15-193:22:
    | ///|
    | test "add/sequence" {
    |   let regex = @string.Regex::string("ab") + @string.Regex::string("cd")
193 |   guard regex.execute("xxabcdyy") is Some(m) else {
    |               ^^^^^^^
    |     fail("Expected concatenated match")
    |   }

<WORKDIR>/string/regex_test.mbt:212:11-212:18:
    | test "bitor/alternation" {
    |   let regex = @string.Regex::string("cat") | @string.Regex::string("dog")
    |   debug_inspect(
212 |     regex.execute("dog"),
    |           ^^^^^^^
    |     content=(
    |       #|Some(

<WORKDIR>/string/regex_test.mbt:224:11-224:18:
    |     ),
    |   )
    |   debug_inspect(
224 |     regex.execute("cow"),
    |           ^^^^^^^
    |     content=(
    |       #|None

<WORKDIR>/string/regex_test.mbt:244:15-244:22:
    |     domain_part +
    |     @string.Regex::string(".") +
    |     tld
244 |   guard email.execute("user@example.com") is Some(m) else {
    |               ^^^^^^^
    |     fail("Expected email match")
    |   }

<WORKDIR>/string/regex_test.mbt:257:15-257:22:
    |       #|}
    |     ),
    |   )
257 |   guard email.execute("test.user+tag@my-domain.org") is Some(x) else {
    |               ^^^^^^^
    |     fail("Expected complex email match")
    |   }

<WORKDIR>/string/regex_test.mbt:280:13-280:20:
    |   let ftp = @string.Regex::string("ftp")
    |   let protocol = http | https | ftp
    |   let url = protocol + @string.Regex::string("://") + re"[^/]+"
280 |   guard url.execute("https://example.com") is Some(m) else {
    |             ^^^^^^^
    |     fail("Expected URL match")
    |   }

<WORKDIR>/string/regex_test.mbt:293:13-293:20:
    |       #|}
    |     ),
    |   )
293 |   guard url.execute("ftp://files.server.org") is Some(m2) else {
    |             ^^^^^^^
    |     fail("Expected FTP URL match")
    |   }

<WORKDIR>/string/regex_test.mbt:307:9-307:16:
    |     ),
    |   )
    |   debug_inspect(
307 |     url.execute("gopher://old.site"),
    |         ^^^^^^^
    |     content=(
    |       #|None

<WORKDIR>/string/regex_test.mbt:325:14-325:21:
    |   let dot_sep = @string.Regex::string(".")
    |   let sep = dash_sep | slash_sep | dot_sep
    |   let date = year + sep + month + sep + day
325 |   guard date.execute("2026-02-26") is Some(m1) else {
    |              ^^^^^^^
    |     fail("Expected dash date match")
    |   }

<WORKDIR>/string/regex_test.mbt:338:14-338:21:
    |       #|}
    |     ),
    |   )
338 |   guard date.execute("2026/02/26") is Some(m2) else {
    |              ^^^^^^^
    |     fail("Expected slash date match")
    |   }

<WORKDIR>/string/regex_test.mbt:351:14-351:21:
    |       #|}
    |     ),
    |   )
351 |   guard date.execute("2026.02.26") is Some(m3) else {
    |              ^^^^^^^
    |     fail("Expected dot date match")
    |   }

<WORKDIR>/string/regex_test.mbt:374:23-374:30:
    |   let identifier = start_char + id_char.repeat(min=0)
    |   let namespace_sep = @string.Regex::string("::")
    |   let namespaced_id = (identifier + namespace_sep).repeat(min=0) + identifier
374 |   guard namespaced_id.execute("std::string::length") is Some(m) else {
    |                       ^^^^^^^
    |     fail("Expected namespaced identifier match")
    |   }

<WORKDIR>/string/regex_test.mbt:387:23-387:30:
    |       #|}
    |     ),
    |   )
387 |   guard namespaced_id.execute("_internal_var") is Some(m2) else {
    |                       ^^^^^^^
    |     fail("Expected simple identifier match")
    |   }

<WORKDIR>/string/regex_test.mbt:401:23-401:30:
    |     ),
    |   )
    |   // Test should fail to match if starting with digit - the match skips leading digits
401 |   guard namespaced_id.execute("123invalid") is Some(m3) else {
    |                       ^^^^^^^
    |     fail("Expected match somewhere in string")
    |   }

<WORKDIR>/string/regex_test.mbt:432:18-432:25:
    |     re"[^\]]+" +
    |     @string.Regex::string("]")
    |   let log_line = timestamp + @string.Regex::string(" ") + level
432 |   guard log_line.execute("[2026-02-26 10:30:45] ERROR") is Some(m) else {
    |                  ^^^^^^^
    |     fail("Expected log line match")
    |   }

<WORKDIR>/string/regex_test.mbt:445:18-445:25:
    |       #|}
    |     ),
    |   )
445 |   guard log_line.execute("[10:30] WARNING") is Some(m2) else {
    |                  ^^^^^^^
    |     fail("Expected warning match")
    |   }

<WORKDIR>/string/regex_test.mbt:479:15-479:22:
    |     prefix +
    |     (space | dash).repeat(min=0, max=1) +
    |     line
479 |   guard phone.execute("+1 (555)123-4567") is Some(m) else {
    |               ^^^^^^^
    |     fail("Expected phone match")
    |   }

<WORKDIR>/string/regex_test.mbt:510:16-510:23:
    |   let semver = major_minor_patch +
    |     pre_release.repeat(min=0, max=1) +
    |     build_meta.repeat(min=0, max=1)
510 |   guard semver.execute("1.2.3") is Some(m1) else {
    |                ^^^^^^^
    |     fail("Expected simple version match")
    |   }

<WORKDIR>/string/regex_test.mbt:523:16-523:23:
    |       #|}
    |     ),
    |   )
523 |   guard semver.execute("2.0.0-beta.1+20260226") is Some(m2) else {
    |                ^^^^^^^
    |     fail("Expected full version match")
    |   }

<WORKDIR>/string/regex_test.mbt:548:15-548:22:
    |   let long_color = hash + hex + hex + hex + hex + hex + hex
    |   let short_color = hash + hex + hex + hex
    |   let color = alpha_color | long_color | short_color
548 |   guard color.execute("#FFF") is Some(m1) else {
    |               ^^^^^^^
    |     fail("Expected short hex match")
    |   }

<WORKDIR>/string/regex_test.mbt:561:15-561:22:
    |       #|}
    |     ),
    |   )
561 |   guard color.execute("#FF5733") is Some(m2) else {
    |               ^^^^^^^
    |     fail("Expected long hex match")
    |   }

<WORKDIR>/string/regex_test.mbt:574:15-574:22:
    |       #|}
    |     ),
    |   )
574 |   guard color.execute("#FF5733AA") is Some(m3) else {
    |               ^^^^^^^
    |     fail("Expected alpha hex match")
    |   }

<WORKDIR>/string/regex_test.mbt:606:16-606:23:
    |     int +
    |     frac.repeat(min=0, max=1) +
    |     exp.repeat(min=0, max=1)
606 |   guard number.execute("-42") is Some(m1) else {
    |                ^^^^^^^
    |     fail("Expected integer match")
    |   }

<WORKDIR>/string/regex_test.mbt:619:16-619:23:
    |       #|}
    |     ),
    |   )
619 |   guard number.execute("3.14159") is Some(m2) else {
    |                ^^^^^^^
    |     fail("Expected float match")
    |   }

<WORKDIR>/string/regex_test.mbt:632:16-632:23:
    |       #|}
    |     ),
    |   )
632 |   guard number.execute("6.022e23") is Some(m3) else {
    |                ^^^^^^^
    |     fail("Expected scientific match")
    |   }

<WORKDIR>/string/regex_test.mbt:651:13-651:20:
    | test "add/with_any_quantifier" {
    |   let re1 = re".*?\."
    |   let re2 = re1 + @string.Regex::string(" ")
651 |   guard re1.execute("abc.") is Some(_) else { fail("Expected match") }
    |             ^^^^^^^
    |   guard re2.execute("abc. ") is Some(_) else { fail("Expected match") }
    | }

<WORKDIR>/string/regex_test.mbt:652:13-652:20:
    |   let re1 = re".*?\."
    |   let re2 = re1 + @string.Regex::string(" ")
    |   guard re1.execute("abc.") is Some(_) else { fail("Expected match") }
652 |   guard re2.execute("abc. ") is Some(_) else { fail("Expected match") }
    |             ^^^^^^^
    | }
    | 

<WORKDIR>/string/regex_test.mbt:659:12-659:19:
    | test "add/with_any_quantifier_and_empty_wrappers" {
    |   let empty = @string.Regex::string("")
    |   let re = empty + re".*?\." + empty + @string.Regex::string(" ")
659 |   guard re.execute("abc. ") is Some(m) else { fail("Expected match") }
    |            ^^^^^^^
    |   inspect(m.content(), content="abc. ")
    | }

<WORKDIR>/string/regex_test.mbt:677:17-677:24:
    | ///|
    | test "escaped_dash_in_char_class" {
    |   let regex = re"[a\-z]"
677 |   inspect(regex.execute("a-z") is Some(_), content="true")
    |                 ^^^^^^^
    |   inspect(regex.execute("b") is Some(_), content="false")
    |   inspect(regex.execute("-") is Some(_), content="true")

<WORKDIR>/string/regex_test.mbt:678:17-678:24:
    | test "escaped_dash_in_char_class" {
    |   let regex = re"[a\-z]"
    |   inspect(regex.execute("a-z") is Some(_), content="true")
678 |   inspect(regex.execute("b") is Some(_), content="false")
    |                 ^^^^^^^
    |   inspect(regex.execute("-") is Some(_), content="true")
    |   inspect(regex.execute("a") is Some(_), content="true")

<WORKDIR>/string/regex_test.mbt:679:17-679:24:
    |   let regex = re"[a\-z]"
    |   inspect(regex.execute("a-z") is Some(_), content="true")
    |   inspect(regex.execute("b") is Some(_), content="false")
679 |   inspect(regex.execute("-") is Some(_), content="true")
    |                 ^^^^^^^
    |   inspect(regex.execute("a") is Some(_), content="true")
    |   inspect(regex.execute("z") is Some(_), content="true")

<WORKDIR>/string/regex_test.mbt:680:17-680:24:
    |   inspect(regex.execute("a-z") is Some(_), content="true")
    |   inspect(regex.execute("b") is Some(_), content="false")
    |   inspect(regex.execute("-") is Some(_), content="true")
680 |   inspect(regex.execute("a") is Some(_), content="true")
    |                 ^^^^^^^
    |   inspect(regex.execute("z") is Some(_), content="true")
    | }

<WORKDIR>/string/regex_test.mbt:681:17-681:24:
    |   inspect(regex.execute("b") is Some(_), content="false")
    |   inspect(regex.execute("-") is Some(_), content="true")
    |   inspect(regex.execute("a") is Some(_), content="true")
681 |   inspect(regex.execute("z") is Some(_), content="true")
    |                 ^^^^^^^
    | }
    | 

<WORKDIR>/string/regex_test.mbt:688:15-688:22:
    | test "capture/simple_named_group" {
    |   let digit = re"[[:digit:]]+".capture("number")
    |   let regex = @string.Regex::string("ID: ") + digit
688 |   guard regex.execute("ID: 12345") is Some(m) else { fail("Expected match") }
    |               ^^^^^^^
    |   inspect(m.content(), content="ID: 12345")
    |   debug_inspect(

<WORKDIR>/string/regex_test.mbt:708:15-708:22:
    |     domain +
    |     @string.Regex::string(".") +
    |     tld
708 |   guard email.execute("john@example.com") is Some(m) else {
    |               ^^^^^^^
    |     fail("Expected match")
    |   }

<WORKDIR>/string/regex_test.mbt:733:15-733:22:
    |   let first = word.capture("first")
    |   let second = word.capture("second")
    |   let regex = first + @string.Regex::string(" ") + second
733 |   guard regex.execute("hello world") is Some(m) else { fail("Expected match") }
    |               ^^^^^^^
    |   debug_inspect(
    |     m.named_group("first"),

```
