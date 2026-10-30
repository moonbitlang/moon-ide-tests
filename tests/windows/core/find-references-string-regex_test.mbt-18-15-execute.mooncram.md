# core find-references execute string\regex_test.mbt:18:15

````mooncram
$ moonx '../../../scripts/run-moon-ide.mbtx' '../../../fixtures/repos/core' moon ide find-references 'execute' --loc 'string\regex_test.mbt:18:15'
Found 130 references for symbol 'execute':
<WORKDIR>/string\README.mbt.md:253:15-253:22:
    | test "string regex basics" {
    |   let regex = re"[[:digit:]]+"
    | 
253 |   guard regex.execute("id=42") is Some(m) else { fail("Expected match") }
    |               ^^^^^^^
    |   inspect(m.content(), content="42")
    | 

<WORKDIR>/string\README.mbt.md:311:12-311:19:
    | ///|
    | test "match result" {
    |   let re = re"([[:alpha:]]+)=([[:digit:]]+)"
311 |   guard re.execute("key=42") is Some(m) else { fail("no match") }
    |            ^^^^^^^
    |   inspect(m.content(), content="key=42")
    |   inspect(m.before(), content="")

<WORKDIR>/string\README.mbt.md:326:12-326:19:
    | ///|
    | test "named groups" {
    |   let re = re"(?<name>[[:alpha:]]+):(?<val>[[:digit:]]+)"
326 |   guard re.execute("age:30") is Some(m) else { fail("no match") }
    |            ^^^^^^^
    |   debug_inspect(m.named_group("name"), content="Some(<StringView: \"age\">)")
    |   debug_inspect(m.named_group("val"), content="Some(<StringView: \"30\">)")

<WORKDIR>/string\README.mbt.md:369:15-369:22:
    | test "regex combinators" {
    |   // match "abc" literally
    |   let abc = @string.Regex::string("abc")
369 |   inspect(abc.execute("xabcy") is Some(_), content="true")
    |               ^^^^^^^
    |   // repeat: match 2 to 4 digits
    |   let digits = re"[[:digit:]]".repeat(min=2, max=4)

<WORKDIR>/string\README.mbt.md:372:16-372:23:
    |   inspect(abc.execute("xabcy") is Some(_), content="true")
    |   // repeat: match 2 to 4 digits
    |   let digits = re"[[:digit:]]".repeat(min=2, max=4)
372 |   guard digits.execute("a12345") is Some(m) else { fail("no match") }
    |                ^^^^^^^
    |   inspect(m.content(), content="1234") // greedy: takes max
    |   // alternation with |

<WORKDIR>/string\README.mbt.md:376:18-376:25:
    |   inspect(m.content(), content="1234") // greedy: takes max
    |   // alternation with |
    |   let either = @string.Regex::string("cat") | @string.Regex::string("dog")
376 |   inspect(either.execute("I have a dog") is Some(_), content="true")
    |                  ^^^^^^^
    | }
    | ```

<WORKDIR>/string\regex.mbt:65:19-65:26:
   | /// ```mbt check
   | /// test {
   | ///   let regex = re"[[:digit:]]+"
65 | ///   guard regex.execute("a12b") is Some(m) else { fail("Expected match") }
   |                   ^^^^^^^
   | ///   inspect(m.content(), content="12")
   | /// }

<WORKDIR>/string\regex.mbt:186:19-186:26:
    | /// ```mbt check
    | /// test {
    | ///   let regex = @string.Regex::unsafe_from_string("[[:digit:]]+")
186 | ///   guard regex.execute("a12b") is Some(m) else { fail("Expected match") }
    |                   ^^^^^^^
    | ///   inspect(m.content(), content="12")
    | /// }

<WORKDIR>/string\regex.mbt:205:21-205:28:
    | /// ```mbt check
    | /// test {
    | ///   let regex = @string.Regex::string("a+b(c)")
205 | ///   inspect(regex.execute("a+b(c)") is Some(_), content="true")
    |                     ^^^^^^^
    | ///   inspect(regex.execute("abcc") is Some(_), content="false")
    | /// }

<WORKDIR>/string\regex.mbt:206:21-206:28:
    | /// test {
    | ///   let regex = @string.Regex::string("a+b(c)")
    | ///   inspect(regex.execute("a+b(c)") is Some(_), content="true")
206 | ///   inspect(regex.execute("abcc") is Some(_), content="false")
    |                     ^^^^^^^
    | /// }
    | /// ```

<WORKDIR>/string\regex.mbt:231:20-231:27:
    | /// ```mbt check
    | /// test {
    | ///   let greedy = re"[[:digit:]]".repeat(min=2, max=4)
231 | ///   guard greedy.execute("a12345") is Some(m1) else { fail("Expected match") }
    |                    ^^^^^^^
    | ///   inspect(m1.content(), content="1234")
    | ///

<WORKDIR>/string\regex.mbt:235:23-235:30:
    | ///   inspect(m1.content(), content="1234")
    | ///
    | ///   let nongreedy = re"[[:digit:]]".repeat(min=2, max=4, greedy=false)
235 | ///   guard nongreedy.execute("a12345") is Some(m2) else { fail("Expected match") }
    |                       ^^^^^^^
    | ///   inspect(m2.content(), content="12")
    | /// }

<WORKDIR>/string\regex.mbt:272:19-272:26:
    | /// ```mbt check
    | /// test {
    | ///   let regex = @string.Regex::string("ab") + @string.Regex::string("cd")
272 | ///   guard regex.execute("xabcd") is Some(m) else { fail("Expected match") }
    |                   ^^^^^^^
    | ///   inspect(m.content(), content="abcd")
    | /// }

<WORKDIR>/string\regex.mbt:289:21-289:28:
    | /// ```mbt check
    | /// test {
    | ///   let regex = @string.Regex::string("cat") | @string.Regex::string("dog")
289 | ///   inspect(regex.execute("dog") is Some(_), content="true")
    |                     ^^^^^^^
    | ///   inspect(regex.execute("cow") is Some(_), content="false")
    | /// }

<WORKDIR>/string\regex.mbt:290:21-290:28:
    | /// test {
    | ///   let regex = @string.Regex::string("cat") | @string.Regex::string("dog")
    | ///   inspect(regex.execute("dog") is Some(_), content="true")
290 | ///   inspect(regex.execute("cow") is Some(_), content="false")
    |                     ^^^^^^^
    | /// }
    | /// ```

<WORKDIR>/string\regex.mbt:336:19-336:26:
    | ///   let regex = re"[[:digit:]]+"
    | ///   let input = "a12b34"
    | ///
336 | ///   guard regex.execute(input) is Some(first) else {
    |                   ^^^^^^^
    | ///     fail("Expected first match")
    | ///   }

<WORKDIR>/string\regex.mbt:342:19-342:26:
    | ///   inspect(first.content(), content="12")
    | ///
    | ///   let next = first.before().length() + first.content().length()
342 | ///   guard regex.execute(input, last_index=next) is Some(second) else {
    |                   ^^^^^^^
    | ///     fail("Expected second match")
    | ///   }

<WORKDIR>/string\regex.mbt:352:24-352:31:
    | /// ```mbt check
    | /// test {
    | ///   let anchored = re"^ab$"
352 | ///   inspect(anchored.execute("ab", last_index=0) is Some(_), content="true")
    |                        ^^^^^^^
    | ///   inspect(anchored.execute("xaby", last_index=1) is Some(_), content="false")
    | /// }

<WORKDIR>/string\regex.mbt:353:24-353:31:
    | /// test {
    | ///   let anchored = re"^ab$"
    | ///   inspect(anchored.execute("ab", last_index=0) is Some(_), content="true")
353 | ///   inspect(anchored.execute("xaby", last_index=1) is Some(_), content="false")
    |                        ^^^^^^^
    | /// }
    | /// ```

<WORKDIR>/string\regex.mbt:380:19-380:26:
    | /// test {
    | ///   let digit = re"[[:digit:]]+".capture("number")
    | ///   let regex = @string.Regex::string("ID: ") + digit
380 | ///   guard regex.execute("ID: 12345") is Some(m) else { fail("Expected match") }
    |                   ^^^^^^^
    | ///   debug_inspect(
    | ///     m.named_group("number"),

<WORKDIR>/string\regex.mbt:400:19-400:26:
    | ///     domain +
    | ///     @string.Regex::string(".") +
    | ///     tld
400 | ///   guard email.execute("john@example.com") is Some(m) else {
    |                   ^^^^^^^
    | ///     fail("Expected match")
    | ///   }

<WORKDIR>/string\regex_bench_test.mbt:19:21-19:28:
   | test "bench regex /aa?b/ on 1MB string" (it : @bench.T) {
   |   let re = re"aa?b"
   |   let one_mb_string : String = "a".repeat(1024 * 1024 - 1) + "b"
19 |   it.bench(() => re.execute(one_mb_string) |> ignore)
   |                     ^^^^^^^
   | }
   | 

<WORKDIR>/string\regex_bench_test.mbt:37:10-37:17:
   |   ]
   |   it.bench(() => {
   |     for line in phone_lines {
37 |       re.execute(line) |> ignore
   |          ^^^^^^^
   |     }
   |   })

<WORKDIR>/string\regex_bench_test.mbt:87:10-87:17:
   |   let filenames = make_filenames()
   |   it.bench(() => {
   |     for filename in filenames {
87 |       re.execute(filename) |> ignore
   |          ^^^^^^^
   |     }
   |   })

<WORKDIR>/string\regex_bench_test.mbt:102:16-102:23:
    |     // A fresh regex measures state construction on every sample. A periodic
    |     // literal keeps one thread alive per period, producing large state keys.
    |     let re = @string.Regex::string(pattern)
102 |     it.keep(re.execute(no_match))
    |                ^^^^^^^
    |     it.keep(re.execute(with_match))
    |   })

<WORKDIR>/string\regex_bench_test.mbt:103:16-103:23:
    |     // literal keeps one thread alive per period, producing large state keys.
    |     let re = @string.Regex::string(pattern)
    |     it.keep(re.execute(no_match))
103 |     it.keep(re.execute(with_match))
    |                ^^^^^^^
    |   })
    | }

<WORKDIR>/string\regex_lexmatch_spec_test.mbt:1600:29-1600:36:
     |     let expected = results.split(" ").collect()
     |     assert_eq(expected.length(), lexmatch_inputs.length())
     |     for i, input in lexmatch_inputs {
1600 |       let actual = match re.execute(input) {
     |                             ^^^^^^^
     |         None => "-"
     |         Some(m) => "\{m.before().length()},\{m.content().length()}"

<WORKDIR>/string\regex_literal_test.mbt:17:16-17:23:
   | 
   | ///|
   | test "regex_literal" {
17 |   guard re"\\".execute("\\") is Some(result) && result.group(0) is Some("\\") else {
   |                ^^^^^^^
   |     fail("Expected match")
   |   }

<WORKDIR>/string\regex_methods.mbt:61:17-61:24:
   |     if limit is Some(limit) && replaced >= limit {
   |       break copy_index
   |     }
61 |     match regex.execute(str, last_index=search_index) {
   |                 ^^^^^^^
   |       None => break copy_index
   |       Some(m) => {

<WORKDIR>/string\regex_methods.mbt:119:17-119:24:
    |   let len = str.length()
    |   Iter::new(() => {
    |     guard search_index <= len else { None }
119 |     match regex.execute(str, last_index=search_index) {
    |                 ^^^^^^^
    |       None => None
    |       Some(m) => {

<WORKDIR>/string\regex_methods.mbt:160:19-160:26:
    |   Iter::new(() => {
    |     guard !done else { None }
    |     while search_index <= len {
160 |       match regex.execute(str, last_index=search_index) {
    |                   ^^^^^^^
    |         None => {
    |           done = true

<WORKDIR>/string\regex_methods_test.mbt:393:15-393:22:
    | ///|
    | test "capture group indices cannot wrap around" {
    |   let regex = re"(a)"
393 |   guard regex.execute("a") is Some(matched) else { fail("expected match") }
    |               ^^^^^^^
    |   for index in [-2147483648, -1073741824, -1, 2, 1073741824, 2147483647] {
    |     assert_eq(matched.group(index) is None, true)

<WORKDIR>/string\regex_semantics_test.mbt:17:52-17:59:
   | 
   | ///|
   | fn matched(pattern : String, input : String) -> String {
17 |   match @string.Regex::unsafe_from_string(pattern).execute(input) {
   |                                                    ^^^^^^^
   |     None => "no match"
   |     Some(m) => "[\{m.before()}](\{m.content()})[\{m.after()}]"

<WORKDIR>/string\regex_semantics_test.mbt:42:12-42:19:
   | ///|
   | test "captures inside repetitions keep the last iteration" {
   |   let re = @string.Regex::unsafe_from_string("(?:(a)|(b))+")
42 |   guard re.execute("aab") is Some(m) else { fail("expected a match") }
   |            ^^^^^^^
   |   debug_inspect(
   |     (m.group(0), m.group(1), m.group(2)),

<WORKDIR>/string\regex_semantics_test.mbt:54:12-54:19:
   |     ),
   |   )
   |   let re = @string.Regex::unsafe_from_string("([ab]*)*")
54 |   guard re.execute("ab") is Some(m) else { fail("expected a match") }
   |            ^^^^^^^
   |   // The repetition stops instead of adding an empty iteration.
   |   debug_inspect(

<WORKDIR>/string\regex_semantics_test.mbt:74:14-74:21:
   |     let input = c.to_string()
   |     inspect(matched("^..$", input), content="no match")
   |     let re = @string.Regex::unsafe_from_string("^(?<prefix>.*)(?<last>.$)")
74 |     guard re.execute(input) is Some(m) else { fail("expected a match") }
   |              ^^^^^^^
   |     assert_true(m.named_group("prefix") is Some(""))
   |     assert_true(m.named_group("last") is Some(last) && last == input)

<WORKDIR>/string\regex_semantics_test.mbt:80:20-80:27:
   |     let padded = "!" + input + "?"
   |     let view = padded[1:1 + input.length()]
   |     let re = @string.Regex::unsafe_from_string("^.$")
80 |     assert_true(re.execute(view) is Some(m) && m.content() == input)
   |                    ^^^^^^^
   |     let re = @string.Regex::unsafe_from_string("^.")
   |     assert_true(re.execute(input) is Some(m) && m.after().length() == 0)

<WORKDIR>/string\regex_semantics_test.mbt:82:20-82:27:
   |     let re = @string.Regex::unsafe_from_string("^.$")
   |     assert_true(re.execute(view) is Some(m) && m.content() == input)
   |     let re = @string.Regex::unsafe_from_string("^.")
82 |     assert_true(re.execute(input) is Some(m) && m.after().length() == 0)
   |                    ^^^^^^^
   |   }
   |   inspect(matched("^.", ""), content="no match")

<WORKDIR>/string\regex_semantics_test.mbt:96:18-96:25:
   | ///|
   | test "last_index keeps anchors and word boundaries relative to the input" {
   |   let re = @string.Regex::unsafe_from_string("^ab")
96 |   assert_true(re.execute("abab", last_index=0) is Some(_))
   |                  ^^^^^^^
   |   assert_true(re.execute("abab", last_index=2) is None)
   |   let re = @string.Regex::unsafe_from_string("\\bab")

<WORKDIR>/string\regex_semantics_test.mbt:97:18-97:25:
   | test "last_index keeps anchors and word boundaries relative to the input" {
   |   let re = @string.Regex::unsafe_from_string("^ab")
   |   assert_true(re.execute("abab", last_index=0) is Some(_))
97 |   assert_true(re.execute("abab", last_index=2) is None)
   |                  ^^^^^^^
   |   let re = @string.Regex::unsafe_from_string("\\bab")
   |   assert_true(

<WORKDIR>/string\regex_semantics_test.mbt:100:8-100:15:
    |   assert_true(re.execute("abab", last_index=2) is None)
    |   let re = @string.Regex::unsafe_from_string("\\bab")
    |   assert_true(
100 |     re.execute("xab ab", last_index=1) is Some(m) && m.before() == "xab ",
    |        ^^^^^^^
    |   )
    |   let re = @string.Regex::unsafe_from_string("b$")

<WORKDIR>/string\regex_semantics_test.mbt:103:18-103:25:
    |     re.execute("xab ab", last_index=1) is Some(m) && m.before() == "xab ",
    |   )
    |   let re = @string.Regex::unsafe_from_string("b$")
103 |   assert_true(re.execute("ab", last_index=2) is None)
    |                  ^^^^^^^
    |   let re = @string.Regex::unsafe_from_string("$")
    |   assert_true(re.execute("ab", last_index=2) is Some(m) && m.before() == "ab")

<WORKDIR>/string\regex_semantics_test.mbt:105:18-105:25:
    |   let re = @string.Regex::unsafe_from_string("b$")
    |   assert_true(re.execute("ab", last_index=2) is None)
    |   let re = @string.Regex::unsafe_from_string("$")
105 |   assert_true(re.execute("ab", last_index=2) is Some(m) && m.before() == "ab")
    |                  ^^^^^^^
    | }
    | 

<WORKDIR>/string\regex_semantics_test.mbt:115:21-115:28:
    |   for i in 1..<400 {
    |     words = words | @string.Regex::string("w\{i};")
    |   }
115 |   assert_true(words.execute("...w399;...") is Some(m) && m.content() == "w399;")
    |                     ^^^^^^^
    |   assert_true(words.execute("...w400;...") is None)
    | }

<WORKDIR>/string\regex_semantics_test.mbt:116:21-116:28:
    |     words = words | @string.Regex::string("w\{i};")
    |   }
    |   assert_true(words.execute("...w399;...") is Some(m) && m.content() == "w399;")
116 |   assert_true(words.execute("...w400;...") is None)
    |                     ^^^^^^^
    | }
    | 

<WORKDIR>/string\regex_semantics_test.mbt:126:18-126:25:
    | test "periodic literals keep the correct match after a failed search" {
    |   let literal = "ab".repeat(30)
    |   let re = @string.Regex::string(literal + "c")
126 |   assert_true(re.execute(literal + literal) is None)
    |                  ^^^^^^^
    |   guard re.execute("ab" + literal + "c") is Some(m) else {
    |     fail("expected a match")

<WORKDIR>/string\regex_semantics_test.mbt:127:12-127:19:
    |   let literal = "ab".repeat(30)
    |   let re = @string.Regex::string(literal + "c")
    |   assert_true(re.execute(literal + literal) is None)
127 |   guard re.execute("ab" + literal + "c") is Some(m) else {
    |            ^^^^^^^
    |     fail("expected a match")
    |   }

<WORKDIR>/string\regex_semantics_test.mbt:142:14-142:21:
    |   let seen = []
    |   for m in outer {
    |     // Run another search on the same regex while iterating.
142 |     guard re.execute("zz=9") is Some(inner) else { fail("expected a match") }
    |              ^^^^^^^
    |     seen.push(
    |       "\{m.group(1).unwrap()}:\{m.group(2).unwrap()}/\{inner.content()}",

<WORKDIR>/string\regex_semantics_test.mbt:156:22-156:29:
    | /// match all of them, because folding the complement put them back.
    | test "a negated class in a case-insensitive group" {
    |   let folded = @string.Regex("^(?i:[^a-c])$")
156 |   assert_true(folded.execute("a") is None)
    |                      ^^^^^^^
    |   assert_true(folded.execute("B") is None)
    |   assert_true(folded.execute("d") is Some(_))

<WORKDIR>/string\regex_semantics_test.mbt:157:22-157:29:
    | test "a negated class in a case-insensitive group" {
    |   let folded = @string.Regex("^(?i:[^a-c])$")
    |   assert_true(folded.execute("a") is None)
157 |   assert_true(folded.execute("B") is None)
    |                      ^^^^^^^
    |   assert_true(folded.execute("d") is Some(_))
    |   assert_true(folded.execute("D") is Some(_))

<WORKDIR>/string\regex_semantics_test.mbt:158:22-158:29:
    |   let folded = @string.Regex("^(?i:[^a-c])$")
    |   assert_true(folded.execute("a") is None)
    |   assert_true(folded.execute("B") is None)
158 |   assert_true(folded.execute("d") is Some(_))
    |                      ^^^^^^^
    |   assert_true(folded.execute("D") is Some(_))
    |   // Outside the group nothing is folded.

<WORKDIR>/string\regex_semantics_test.mbt:159:22-159:29:
    |   assert_true(folded.execute("a") is None)
    |   assert_true(folded.execute("B") is None)
    |   assert_true(folded.execute("d") is Some(_))
159 |   assert_true(folded.execute("D") is Some(_))
    |                      ^^^^^^^
    |   // Outside the group nothing is folded.
    |   let plain = @string.Regex("^[^a-c]$")

<WORKDIR>/string\regex_semantics_test.mbt:162:21-162:28:
    |   assert_true(folded.execute("D") is Some(_))
    |   // Outside the group nothing is folded.
    |   let plain = @string.Regex("^[^a-c]$")
162 |   assert_true(plain.execute("a") is None)
    |                     ^^^^^^^
    |   assert_true(plain.execute("A") is Some(_))
    |   // A class that is not negated is unchanged.

<WORKDIR>/string\regex_semantics_test.mbt:163:21-163:28:
    |   // Outside the group nothing is folded.
    |   let plain = @string.Regex("^[^a-c]$")
    |   assert_true(plain.execute("a") is None)
163 |   assert_true(plain.execute("A") is Some(_))
    |                     ^^^^^^^
    |   // A class that is not negated is unchanged.
    |   let positive = @string.Regex("^(?i:[a-c])$")

<WORKDIR>/string\regex_semantics_test.mbt:166:24-166:31:
    |   assert_true(plain.execute("A") is Some(_))
    |   // A class that is not negated is unchanged.
    |   let positive = @string.Regex("^(?i:[a-c])$")
166 |   assert_true(positive.execute("B") is Some(_))
    |                        ^^^^^^^
    |   assert_true(positive.execute("d") is None)
    | }

<WORKDIR>/string\regex_semantics_test.mbt:167:24-167:31:
    |   // A class that is not negated is unchanged.
    |   let positive = @string.Regex("^(?i:[a-c])$")
    |   assert_true(positive.execute("B") is Some(_))
167 |   assert_true(positive.execute("d") is None)
    |                        ^^^^^^^
    | }

<WORKDIR>/string\regex_test.mbt:18:15-18:22:
   | ///|
   | test "execute/non_capture_group" {
   |   let regex = re"(?:ab)(c)(?:d)"
18 |   guard regex.execute("abcd") is Some(m) else { fail("Expected match") }
   |               ^^^^^^^
   |   debug_inspect(
   |     m,

<WORKDIR>/string\regex_test.mbt:34:15-34:22:
   | ///|
   | test "execute/non_capture_with_named_group" {
   |   let regex = re"(?:a)(b)(?:c)(?<d>d)"
34 |   guard regex.execute("abcd") is Some(m) else { fail("Expected match") }
   |               ^^^^^^^
   |   debug_inspect(
   |     m,

<WORKDIR>/string\regex_test.mbt:50:15-50:22:
   | ///|
   | test "execute/any_char_on_supplementary_plane" {
   |   let regex = re"."
50 |   guard regex.execute("😀") is Some(m) else {
   |               ^^^^^^^
   |     fail("Expected match for supplementary-plane Unicode escape")
   |   }

<WORKDIR>/string\regex_test.mbt:68:15-68:22:
   | ///|
   | test "execute/range_crossing_surrogate_gap_has_no_half_match" {
   |   let regex = re"[\uD7FF-\uE000]"
68 |   guard regex.execute("😀") is None else {
   |               ^^^^^^^
   |     fail("Expected no surrogate-half match")
   |   }

<WORKDIR>/string\regex_test.mbt:77:17-77:24:
   | test "execute/colon_range" {
   |   let regex = @string.Regex("^[:-@]$")
   |   for ch in [":", ";", "<", "=", ">", "?", "@"] {
77 |     guard regex.execute(ch) is Some(_) else {
   |                 ^^^^^^^
   |       fail("Expected colon range endpoint to match")
   |     }

<WORKDIR>/string\regex_test.mbt:82:17-82:24:
   |     }
   |   }
   |   for ch in ["!", "A", "["] {
82 |     guard regex.execute(ch) is None else {
   |                 ^^^^^^^
   |       fail("Expected character outside colon range not to match")
   |     }

<WORKDIR>/string\regex_test.mbt:87:17-87:24:
   |     }
   |   }
   |   let inverse = @string.Regex("^[^:-@]$")
87 |   guard inverse.execute("A") is Some(_) else {
   |                 ^^^^^^^
   |     fail("Expected inverse colon range to match")
   |   }

<WORKDIR>/string\regex_test.mbt:90:17-90:24:
   |   guard inverse.execute("A") is Some(_) else {
   |     fail("Expected inverse colon range to match")
   |   }
90 |   guard inverse.execute(":") is None else {
   |                 ^^^^^^^
   |     fail("Expected inverse colon range to exclude colon")
   |   }

<WORKDIR>/string\regex_test.mbt:95:17-95:24:
   |   }
   |   for pattern in ["^[:]$", "^[::]$", "^[:-:]$"] {
   |     let regex = @string.Regex(pattern)
95 |     guard regex.execute(":") is Some(_) else {
   |                 ^^^^^^^
   |       fail("Expected literal colon to match")
   |     }

<WORKDIR>/string\regex_test.mbt:98:17-98:24:
   |     guard regex.execute(":") is Some(_) else {
   |       fail("Expected literal colon to match")
   |     }
98 |     guard regex.execute("-") is None else {
   |                 ^^^^^^^
   |       fail("Expected range syntax to exclude literal hyphen")
   |     }

<WORKDIR>/string\regex_test.mbt:104:20-104:27:
    |   }
    |   let literals = @string.Regex("^[:\\-@]$")
    |   for ch in [":", "-", "@"] {
104 |     guard literals.execute(ch) is Some(_) else {
    |                    ^^^^^^^
    |       fail("Expected escaped hyphen class to match its literal atoms")
    |     }

<WORKDIR>/string\regex_test.mbt:108:18-108:25:
    |       fail("Expected escaped hyphen class to match its literal atoms")
    |     }
    |   }
108 |   guard literals.execute(";") is None else {
    |                  ^^^^^^^
    |     fail("Expected escaped hyphen not to introduce a range")
    |   }

<WORKDIR>/string\regex_test.mbt:134:15-134:22:
    | ///|
    | test "compile/unicode_escape_supplementary_plane" {
    |   let regex = re"\u{1F600}"
134 |   guard regex.execute("a😀b") is Some(m) else {
    |               ^^^^^^^
    |     fail("Expected match for supplementary-plane Unicode escape")
    |   }

<WORKDIR>/string\regex_test.mbt:152:15-152:22:
    | ///|
    | test "string/literal_metacharacters" {
    |   let regex = @string.Regex::string("a+b(c)")
152 |   guard regex.execute("xa+b(c)y") is Some(m) else {
    |               ^^^^^^^
    |     fail("Expected literal match")
    |   }

<WORKDIR>/string\regex_test.mbt:166:11-166:18:
    |     ),
    |   )
    |   debug_inspect(
166 |     regex.execute("xabccy"),
    |           ^^^^^^^
    |     content=(
    |       #|None

<WORKDIR>/string\regex_test.mbt:178:16-178:23:
    |   let base = re"[[:digit:]]"
    |   let greedy = base.repeat(min=2, max=4)
    |   let nongreedy = base.repeat(min=2, max=4, greedy=false)
178 |   guard greedy.execute("a12345") is Some(m1) else {
    |                ^^^^^^^
    |     fail("Expected greedy match")
    |   }

<WORKDIR>/string\regex_test.mbt:181:19-181:26:
    |   guard greedy.execute("a12345") is Some(m1) else {
    |     fail("Expected greedy match")
    |   }
181 |   guard nongreedy.execute("a12345") is Some(m2) else {
    |                   ^^^^^^^
    |     fail("Expected non-greedy match")
    |   }

<WORKDIR>/string\regex_test.mbt:233:15-233:22:
    | ///|
    | test "add/sequence" {
    |   let regex = @string.Regex::string("ab") + @string.Regex::string("cd")
233 |   guard regex.execute("xxabcdyy") is Some(m) else {
    |               ^^^^^^^
    |     fail("Expected concatenated match")
    |   }

<WORKDIR>/string\regex_test.mbt:252:11-252:18:
    | test "bitor/alternation" {
    |   let regex = @string.Regex::string("cat") | @string.Regex::string("dog")
    |   debug_inspect(
252 |     regex.execute("dog"),
    |           ^^^^^^^
    |     content=(
    |       #|Some(

<WORKDIR>/string\regex_test.mbt:264:11-264:18:
    |     ),
    |   )
    |   debug_inspect(
264 |     regex.execute("cow"),
    |           ^^^^^^^
    |     content=(
    |       #|None

<WORKDIR>/string\regex_test.mbt:284:15-284:22:
    |     domain_part +
    |     @string.Regex::string(".") +
    |     tld
284 |   guard email.execute("user@example.com") is Some(m) else {
    |               ^^^^^^^
    |     fail("Expected email match")
    |   }

<WORKDIR>/string\regex_test.mbt:297:15-297:22:
    |       #|}
    |     ),
    |   )
297 |   guard email.execute("test.user+tag@my-domain.org") is Some(x) else {
    |               ^^^^^^^
    |     fail("Expected complex email match")
    |   }

<WORKDIR>/string\regex_test.mbt:320:13-320:20:
    |   let ftp = @string.Regex::string("ftp")
    |   let protocol = http | https | ftp
    |   let url = protocol + @string.Regex::string("://") + re"[^/]+"
320 |   guard url.execute("https://example.com") is Some(m) else {
    |             ^^^^^^^
    |     fail("Expected URL match")
    |   }

<WORKDIR>/string\regex_test.mbt:333:13-333:20:
    |       #|}
    |     ),
    |   )
333 |   guard url.execute("ftp://files.server.org") is Some(m2) else {
    |             ^^^^^^^
    |     fail("Expected FTP URL match")
    |   }

<WORKDIR>/string\regex_test.mbt:347:9-347:16:
    |     ),
    |   )
    |   debug_inspect(
347 |     url.execute("gopher://old.site"),
    |         ^^^^^^^
    |     content=(
    |       #|None

<WORKDIR>/string\regex_test.mbt:365:14-365:21:
    |   let dot_sep = @string.Regex::string(".")
    |   let sep = dash_sep | slash_sep | dot_sep
    |   let date = year + sep + month + sep + day
365 |   guard date.execute("2026-02-26") is Some(m1) else {
    |              ^^^^^^^
    |     fail("Expected dash date match")
    |   }

<WORKDIR>/string\regex_test.mbt:378:14-378:21:
    |       #|}
    |     ),
    |   )
378 |   guard date.execute("2026/02/26") is Some(m2) else {
    |              ^^^^^^^
    |     fail("Expected slash date match")
    |   }

<WORKDIR>/string\regex_test.mbt:391:14-391:21:
    |       #|}
    |     ),
    |   )
391 |   guard date.execute("2026.02.26") is Some(m3) else {
    |              ^^^^^^^
    |     fail("Expected dot date match")
    |   }

<WORKDIR>/string\regex_test.mbt:414:23-414:30:
    |   let identifier = start_char + id_char.repeat(min=0)
    |   let namespace_sep = @string.Regex::string("::")
    |   let namespaced_id = (identifier + namespace_sep).repeat(min=0) + identifier
414 |   guard namespaced_id.execute("std::string::length") is Some(m) else {
    |                       ^^^^^^^
    |     fail("Expected namespaced identifier match")
    |   }

<WORKDIR>/string\regex_test.mbt:427:23-427:30:
    |       #|}
    |     ),
    |   )
427 |   guard namespaced_id.execute("_internal_var") is Some(m2) else {
    |                       ^^^^^^^
    |     fail("Expected simple identifier match")
    |   }

<WORKDIR>/string\regex_test.mbt:441:23-441:30:
    |     ),
    |   )
    |   // Test should fail to match if starting with digit - the match skips leading digits
441 |   guard namespaced_id.execute("123invalid") is Some(m3) else {
    |                       ^^^^^^^
    |     fail("Expected match somewhere in string")
    |   }

<WORKDIR>/string\regex_test.mbt:472:18-472:25:
    |     re"[^\]]+" +
    |     @string.Regex::string("]")
    |   let log_line = timestamp + @string.Regex::string(" ") + level
472 |   guard log_line.execute("[2026-02-26 10:30:45] ERROR") is Some(m) else {
    |                  ^^^^^^^
    |     fail("Expected log line match")
    |   }

<WORKDIR>/string\regex_test.mbt:485:18-485:25:
    |       #|}
    |     ),
    |   )
485 |   guard log_line.execute("[10:30] WARNING") is Some(m2) else {
    |                  ^^^^^^^
    |     fail("Expected warning match")
    |   }

<WORKDIR>/string\regex_test.mbt:519:15-519:22:
    |     prefix +
    |     (space | dash).repeat(min=0, max=1) +
    |     line
519 |   guard phone.execute("+1 (555)123-4567") is Some(m) else {
    |               ^^^^^^^
    |     fail("Expected phone match")
    |   }

<WORKDIR>/string\regex_test.mbt:550:16-550:23:
    |   let semver = major_minor_patch +
    |     pre_release.repeat(min=0, max=1) +
    |     build_meta.repeat(min=0, max=1)
550 |   guard semver.execute("1.2.3") is Some(m1) else {
    |                ^^^^^^^
    |     fail("Expected simple version match")
    |   }

<WORKDIR>/string\regex_test.mbt:563:16-563:23:
    |       #|}
    |     ),
    |   )
563 |   guard semver.execute("2.0.0-beta.1+20260226") is Some(m2) else {
    |                ^^^^^^^
    |     fail("Expected full version match")
    |   }

<WORKDIR>/string\regex_test.mbt:588:15-588:22:
    |   let long_color = hash + hex + hex + hex + hex + hex + hex
    |   let short_color = hash + hex + hex + hex
    |   let color = alpha_color | long_color | short_color
588 |   guard color.execute("#FFF") is Some(m1) else {
    |               ^^^^^^^
    |     fail("Expected short hex match")
    |   }

<WORKDIR>/string\regex_test.mbt:601:15-601:22:
    |       #|}
    |     ),
    |   )
601 |   guard color.execute("#FF5733") is Some(m2) else {
    |               ^^^^^^^
    |     fail("Expected long hex match")
    |   }

<WORKDIR>/string\regex_test.mbt:614:15-614:22:
    |       #|}
    |     ),
    |   )
614 |   guard color.execute("#FF5733AA") is Some(m3) else {
    |               ^^^^^^^
    |     fail("Expected alpha hex match")
    |   }

<WORKDIR>/string\regex_test.mbt:646:16-646:23:
    |     int +
    |     frac.repeat(min=0, max=1) +
    |     exp.repeat(min=0, max=1)
646 |   guard number.execute("-42") is Some(m1) else {
    |                ^^^^^^^
    |     fail("Expected integer match")
    |   }

<WORKDIR>/string\regex_test.mbt:659:16-659:23:
    |       #|}
    |     ),
    |   )
659 |   guard number.execute("3.14159") is Some(m2) else {
    |                ^^^^^^^
    |     fail("Expected float match")
    |   }

<WORKDIR>/string\regex_test.mbt:672:16-672:23:
    |       #|}
    |     ),
    |   )
672 |   guard number.execute("6.022e23") is Some(m3) else {
    |                ^^^^^^^
    |     fail("Expected scientific match")
    |   }

<WORKDIR>/string\regex_test.mbt:691:13-691:20:
    | test "add/with_any_quantifier" {
    |   let re1 = re".*?\."
    |   let re2 = re1 + @string.Regex::string(" ")
691 |   guard re1.execute("abc.") is Some(_) else { fail("Expected match") }
    |             ^^^^^^^
    |   guard re2.execute("abc. ") is Some(_) else { fail("Expected match") }
    | }

<WORKDIR>/string\regex_test.mbt:692:13-692:20:
    |   let re1 = re".*?\."
    |   let re2 = re1 + @string.Regex::string(" ")
    |   guard re1.execute("abc.") is Some(_) else { fail("Expected match") }
692 |   guard re2.execute("abc. ") is Some(_) else { fail("Expected match") }
    |             ^^^^^^^
    | }
    | 

<WORKDIR>/string\regex_test.mbt:699:12-699:19:
    | test "add/with_any_quantifier_and_empty_wrappers" {
    |   let empty = @string.Regex::string("")
    |   let re = empty + re".*?\." + empty + @string.Regex::string(" ")
699 |   guard re.execute("abc. ") is Some(m) else { fail("Expected match") }
    |            ^^^^^^^
    |   inspect(m.content(), content="abc. ")
    | }

<WORKDIR>/string\regex_test.mbt:717:17-717:24:
    | ///|
    | test "escaped_dash_in_char_class" {
    |   let regex = re"[a\-z]"
717 |   inspect(regex.execute("a-z") is Some(_), content="true")
    |                 ^^^^^^^
    |   inspect(regex.execute("b") is Some(_), content="false")
    |   inspect(regex.execute("-") is Some(_), content="true")

<WORKDIR>/string\regex_test.mbt:718:17-718:24:
    | test "escaped_dash_in_char_class" {
    |   let regex = re"[a\-z]"
    |   inspect(regex.execute("a-z") is Some(_), content="true")
718 |   inspect(regex.execute("b") is Some(_), content="false")
    |                 ^^^^^^^
    |   inspect(regex.execute("-") is Some(_), content="true")
    |   inspect(regex.execute("a") is Some(_), content="true")

<WORKDIR>/string\regex_test.mbt:719:17-719:24:
    |   let regex = re"[a\-z]"
    |   inspect(regex.execute("a-z") is Some(_), content="true")
    |   inspect(regex.execute("b") is Some(_), content="false")
719 |   inspect(regex.execute("-") is Some(_), content="true")
    |                 ^^^^^^^
    |   inspect(regex.execute("a") is Some(_), content="true")
    |   inspect(regex.execute("z") is Some(_), content="true")

<WORKDIR>/string\regex_test.mbt:720:17-720:24:
    |   inspect(regex.execute("a-z") is Some(_), content="true")
    |   inspect(regex.execute("b") is Some(_), content="false")
    |   inspect(regex.execute("-") is Some(_), content="true")
720 |   inspect(regex.execute("a") is Some(_), content="true")
    |                 ^^^^^^^
    |   inspect(regex.execute("z") is Some(_), content="true")
    | }

<WORKDIR>/string\regex_test.mbt:721:17-721:24:
    |   inspect(regex.execute("b") is Some(_), content="false")
    |   inspect(regex.execute("-") is Some(_), content="true")
    |   inspect(regex.execute("a") is Some(_), content="true")
721 |   inspect(regex.execute("z") is Some(_), content="true")
    |                 ^^^^^^^
    | }
    | 

<WORKDIR>/string\regex_test.mbt:728:15-728:22:
    | test "capture/simple_named_group" {
    |   let digit = re"[[:digit:]]+".capture("number")
    |   let regex = @string.Regex::string("ID: ") + digit
728 |   guard regex.execute("ID: 12345") is Some(m) else { fail("Expected match") }
    |               ^^^^^^^
    |   inspect(m.content(), content="ID: 12345")
    |   debug_inspect(

<WORKDIR>/string\regex_test.mbt:748:15-748:22:
    |     domain +
    |     @string.Regex::string(".") +
    |     tld
748 |   guard email.execute("john@example.com") is Some(m) else {
    |               ^^^^^^^
    |     fail("Expected match")
    |   }

<WORKDIR>/string\regex_test.mbt:781:35-781:42:
    | ///|
    | test "execute/alternation with an overlapping branch" {
    |   // The two branches are the same expression, so both accept 'a'.
781 |   guard @string.Regex("(?:a|a)c").execute("ac") is Some(m) else {
    |                                   ^^^^^^^
    |     fail("expected a match")
    |   }

<WORKDIR>/string\regex_test.mbt:786:35-786:42:
    |   }
    |   inspect(m.content(), content="ac")
    |   // The continuation must be consumed once, not twice.
786 |   guard @string.Regex("(?:a|a)c").execute("acc") is Some(m) else {
    |                                   ^^^^^^^
    |     fail("expected a match")
    |   }

<WORKDIR>/string\regex_test.mbt:791:36-791:43:
    |   }
    |   inspect(m.content(), content="ac")
    |   // ...however long it is.
791 |   guard @string.Regex("(?:a|a)bc").execute("abcbc") is Some(m) else {
    |                                    ^^^^^^^
    |     fail("expected a match")
    |   }

<WORKDIR>/string\regex_test.mbt:802:15-802:22:
    |   let regex = @string.Regex("(?:[ab]|[bc])x")
    |   // 'a' comes only from the left branch, 'c' only from the right, and 'b'
    |   // from both — it is the shared one that used to fail.
802 |   guard regex.execute("ax") is Some(m) else { fail("expected a match") }
    |               ^^^^^^^
    |   inspect(m.content(), content="ax")
    |   guard regex.execute("bx") is Some(m) else { fail("expected a match") }

<WORKDIR>/string\regex_test.mbt:804:15-804:22:
    |   // from both — it is the shared one that used to fail.
    |   guard regex.execute("ax") is Some(m) else { fail("expected a match") }
    |   inspect(m.content(), content="ax")
804 |   guard regex.execute("bx") is Some(m) else { fail("expected a match") }
    |               ^^^^^^^
    |   inspect(m.content(), content="bx")
    |   guard regex.execute("cx") is Some(m) else { fail("expected a match") }

<WORKDIR>/string\regex_test.mbt:806:15-806:22:
    |   inspect(m.content(), content="ax")
    |   guard regex.execute("bx") is Some(m) else { fail("expected a match") }
    |   inspect(m.content(), content="bx")
806 |   guard regex.execute("cx") is Some(m) else { fail("expected a match") }
    |               ^^^^^^^
    |   inspect(m.content(), content="cx")
    |   // The same alternation reached through the combinator API.

<WORKDIR>/string\regex_test.mbt:810:18-810:25:
    |   inspect(m.content(), content="cx")
    |   // The same alternation reached through the combinator API.
    |   let combined = (re"[ab]" | re"[bc]") + re"x"
810 |   guard combined.execute("bx") is Some(m) else { fail("expected a match") }
    |                  ^^^^^^^
    |   inspect(m.content(), content="bx")
    | }

<WORKDIR>/string\regex_test.mbt:817:36-817:43:
    | ///|
    | test "execute/alternation branches of different lengths" {
    |   // Both branches start with 'a', and they finish at different points.
817 |   guard @string.Regex("(?:a|ab)c").execute("ac") is Some(m) else {
    |                                    ^^^^^^^
    |     fail("expected a match")
    |   }

<WORKDIR>/string\regex_test.mbt:821:36-821:43:
    |     fail("expected a match")
    |   }
    |   inspect(m.content(), content="ac")
821 |   guard @string.Regex("(?:ab|a)c").execute("abc") is Some(m) else {
    |                                    ^^^^^^^
    |     fail("expected a match")
    |   }

<WORKDIR>/string\regex_test.mbt:827:41-827:48:
    |   inspect(m.content(), content="abc")
    |   // A span that is not in the language must not be reported: from 0 only
    |   // `a` applies, so the match can end at 1 or 2 but never at 3.
827 |   guard @string.Regex("(?:.a|a)(?:b|)").execute("abb") is Some(m) else {
    |                                         ^^^^^^^
    |     fail("expected a match")
    |   }

<WORKDIR>/string\regex_test.mbt:837:38-837:45:
    | test "execute/overlapping alternation under a counted repetition" {
    |   // Each iteration can only take one character here, so the bounds are what
    |   // decide the length.
837 |   guard @string.Regex("(?:.|ab){2}").execute("aaaaa") is Some(m) else {
    |                                      ^^^^^^^
    |     fail("expected a match")
    |   }

<WORKDIR>/string\regex_test.mbt:841:40-841:47:
    |     fail("expected a match")
    |   }
    |   inspect(m.content(), content="aa")
841 |   guard @string.Regex("(?:.|ab){2,4}").execute("aaaaa") is Some(m) else {
    |                                        ^^^^^^^
    |     fail("expected a match")
    |   }

<WORKDIR>/string\regex_test.mbt:850:37-850:44:
    | ///|
    | test "execute/overlapping alternation keeps anchors and preference" {
    |   // Anchored: the whole subject has to be consumed exactly once.
850 |   guard @string.Regex("^(?:a|a)c$").execute("ac") is Some(m) else {
    |                                     ^^^^^^^
    |     fail("expected a match")
    |   }

<WORKDIR>/string\regex_test.mbt:854:39-854:46:
    |     fail("expected a match")
    |   }
    |   inspect(m.content(), content="ac")
854 |   inspect(@string.Regex("^(?:a|a)c$").execute("acc") is None, content="true")
    |                                       ^^^^^^^
    |   // Preference survives the overlap: the greedy branch wins the character
    |   // and the lazy one yields it, and the capture reports which.

<WORKDIR>/string\regex_test.mbt:857:41-857:48:
    |   inspect(@string.Regex("^(?:a|a)c$").execute("acc") is None, content="true")
    |   // Preference survives the overlap: the greedy branch wins the character
    |   // and the lazy one yields it, and the capture reports which.
857 |   guard @string.Regex("(?:(a+)|a)(a*)").execute("aaa") is Some(m) else {
    |                                         ^^^^^^^
    |     fail("expected a match")
    |   }

<WORKDIR>/string\regex_test.mbt:867:42-867:49:
    |       #|Some(<StringView: "aaa">)
    |     ),
    |   )
867 |   guard @string.Regex("(?:(a+?)|a)(a*)").execute("aaa") is Some(m) else {
    |                                          ^^^^^^^
    |     fail("expected a match")
    |   }

<WORKDIR>/string\regex_test.mbt:878:39-878:46:
    |     ),
    |   )
    |   // The left branch is preferred where both accept the character.
878 |   guard @string.Regex("(?:(a)|(a))b").execute("ab") is Some(m) else {
    |                                       ^^^^^^^
    |     fail("expected a match")
    |   }

<WORKDIR>/string\regex_test.mbt:907:17-907:24:
    |       Regex("^(?:.a?){2,}$"),
    |       Regex("^(?:.a?){2,}?$"),
    |     ] {
907 |     guard regex.execute(subject) is Some(m) else { fail("expected a match") }
    |                 ^^^^^^^
    |     assert_eq(m.content().length(), subject.length())
    |   }

<WORKDIR>/string\regex_test.mbt:918:15-918:22:
    |   let first = word.capture("first")
    |   let second = word.capture("second")
    |   let regex = first + @string.Regex::string(" ") + second
918 |   guard regex.execute("hello world") is Some(m) else { fail("Expected match") }
    |               ^^^^^^^
    |   debug_inspect(
    |     m.named_group("first"),

<WORKDIR>/string\regex_test.mbt:947:12-947:19:
    |   }
    |   let literal = sb.to_string()
    |   let re = @string.Regex::string(literal)
947 |   guard re.execute("x" + literal + "x") is Some(m) else {
    |            ^^^^^^^
    |     fail("Expected match")
    |   }

<WORKDIR>/string\regex_test.mbt:952:15-952:22:
    |   }
    |   inspect(m.content().length(), content="100000")
    |   let twice = re.repeat(min=2, max=2)
952 |   guard twice.execute(literal + literal) is Some(m2) else {
    |               ^^^^^^^
    |     fail("Expected match")
    |   }

<WORKDIR>/string\regex_test.mbt:965:12-965:19:
    |   // group-0 start mark, so this pattern needed slot 2048 and the match was
    |   // silently lost (release) or `debug_assert` fired (debug).
    |   let re = @string.Regex::unsafe_from_string("(a)(?:a{256}){9}")
965 |   guard re.execute("a".repeat(2400)) is Some(m) else { fail("Expected match") }
    |            ^^^^^^^
    |   inspect(m.before().length(), content="0")
    |   inspect(m.content().length(), content="2305")
"" (escaped)
````
