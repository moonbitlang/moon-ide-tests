# core rename execute string/regex_test.mbt:18:15

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
$ run_moon_ide moon ide rename 'execute' 'execute_renamed' --loc 'string/regex_test.mbt:18:15'
*** Begin Patch
*** Update File: <WORKDIR>/string/README.mbt.md
@@
 test "string regex basics" {
   let regex = re"[[:digit:]]+"
 
-  guard regex.execute("id=42") is Some(m) else { fail("Expected match") }
+  guard regex.execute_renamed("id=42") is Some(m) else { fail("Expected match") }
   inspect(m.content(), content="42")
 
   let replaced = regex.replace_by("a1b22", _m => "#")
@@
 ///|
 test "match result" {
   let re = re"([[:alpha:]]+)=([[:digit:]]+)"
-  guard re.execute("key=42") is Some(m) else { fail("no match") }
+  guard re.execute_renamed("key=42") is Some(m) else { fail("no match") }
   inspect(m.content(), content="key=42")
   inspect(m.before(), content="")
   inspect(m.after(), content="")
@@
 ///|
 test "named groups" {
   let re = re"(?<name>[[:alpha:]]+):(?<val>[[:digit:]]+)"
-  guard re.execute("age:30") is Some(m) else { fail("no match") }
+  guard re.execute_renamed("age:30") is Some(m) else { fail("no match") }
   debug_inspect(m.named_group("name"), content="Some(<StringView: \"age\">)")
   debug_inspect(m.named_group("val"), content="Some(<StringView: \"30\">)")
 }
@@
 test "regex combinators" {
   // match "abc" literally
   let abc = @string.Regex::string("abc")
-  inspect(abc.execute("xabcy") is Some(_), content="true")
+  inspect(abc.execute_renamed("xabcy") is Some(_), content="true")
   // repeat: match 2 to 4 digits
   let digits = re"[[:digit:]]".repeat(min=2, max=4)
-  guard digits.execute("a12345") is Some(m) else { fail("no match") }
+  guard digits.execute_renamed("a12345") is Some(m) else { fail("no match") }
   inspect(m.content(), content="1234") // greedy: takes max
   // alternation with |
   let either = @string.Regex::string("cat") | @string.Regex::string("dog")
-  inspect(either.execute("I have a dog") is Some(_), content="true")
+  inspect(either.execute_renamed("I have a dog") is Some(_), content="true")
 }
 ```
 
*** Update File: <WORKDIR>/string/regex.mbt
@@
 /// ```mbt check
 /// test {
 ///   let regex = re"[[:digit:]]+"
-///   guard regex.execute("a12b") is Some(m) else { fail("Expected match") }
+///   guard regex.execute_renamed("a12b") is Some(m) else { fail("Expected match") }
 ///   inspect(m.content(), content="12")
 /// }
 /// ```
@@
 /// ```mbt check
 /// test {
 ///   let regex = @string.Regex::unsafe_from_string("[[:digit:]]+")
-///   guard regex.execute("a12b") is Some(m) else { fail("Expected match") }
+///   guard regex.execute_renamed("a12b") is Some(m) else { fail("Expected match") }
 ///   inspect(m.content(), content="12")
 /// }
 /// ```
@@
 /// ```mbt check
 /// test {
 ///   let regex = @string.Regex::string("a+b(c)")
-///   inspect(regex.execute("a+b(c)") is Some(_), content="true")
+///   inspect(regex.execute_renamed("a+b(c)") is Some(_), content="true")
-///   inspect(regex.execute("abcc") is Some(_), content="false")
+///   inspect(regex.execute_renamed("abcc") is Some(_), content="false")
 /// }
 /// ```
 pub fn Regex::string(str : StringView) -> Regex {
@@
 /// ```mbt check
 /// test {
 ///   let greedy = re"[[:digit:]]".repeat(min=2, max=4)
-///   guard greedy.execute("a12345") is Some(m1) else { fail("Expected match") }
+///   guard greedy.execute_renamed("a12345") is Some(m1) else { fail("Expected match") }
 ///   inspect(m1.content(), content="1234")
 ///
 ///   let nongreedy = re"[[:digit:]]".repeat(min=2, max=4, greedy=false)
-///   guard nongreedy.execute("a12345") is Some(m2) else { fail("Expected match") }
+///   guard nongreedy.execute_renamed("a12345") is Some(m2) else { fail("Expected match") }
 ///   inspect(m2.content(), content="12")
 /// }
 /// ```
@@
 /// ```mbt check
 /// test {
 ///   let regex = @string.Regex::string("ab") + @string.Regex::string("cd")
-///   guard regex.execute("xabcd") is Some(m) else { fail("Expected match") }
+///   guard regex.execute_renamed("xabcd") is Some(m) else { fail("Expected match") }
 ///   inspect(m.content(), content="abcd")
 /// }
 /// ```
@@
 /// ```mbt check
 /// test {
 ///   let regex = @string.Regex::string("cat") | @string.Regex::string("dog")
-///   inspect(regex.execute("dog") is Some(_), content="true")
+///   inspect(regex.execute_renamed("dog") is Some(_), content="true")
-///   inspect(regex.execute("cow") is Some(_), content="false")
+///   inspect(regex.execute_renamed("cow") is Some(_), content="false")
 /// }
 /// ```
 #intrinsic("%regex.alt")
@@
 ///   let regex = re"[[:digit:]]+"
 ///   let input = "a12b34"
 ///
-///   guard regex.execute(input) is Some(first) else {
+///   guard regex.execute_renamed(input) is Some(first) else {
 ///     fail("Expected first match")
 ///   }
 ///   inspect(first.content(), content="12")
 ///
 ///   let next = first.before().length() + first.content().length()
-///   guard regex.execute(input, last_index=next) is Some(second) else {
+///   guard regex.execute_renamed(input, last_index=next) is Some(second) else {
 ///     fail("Expected second match")
 ///   }
 ///   inspect(second.content(), content="34")
@@
 /// ```mbt check
 /// test {
 ///   let anchored = re"^ab$"
-///   inspect(anchored.execute("ab", last_index=0) is Some(_), content="true")
+///   inspect(anchored.execute_renamed("ab", last_index=0) is Some(_), content="true")
-///   inspect(anchored.execute("xaby", last_index=1) is Some(_), content="false")
+///   inspect(anchored.execute_renamed("xaby", last_index=1) is Some(_), content="false")
 /// }
 /// ```
-pub fn Regex::execute(
+pub fn Regex::execute_renamed(
   self : Regex,
   input : StringView,
   last_index? : Int = 0,
@@
 /// test {
 ///   let digit = re"[[:digit:]]+".capture("number")
 ///   let regex = @string.Regex::string("ID: ") + digit
-///   guard regex.execute("ID: 12345") is Some(m) else { fail("Expected match") }
+///   guard regex.execute_renamed("ID: 12345") is Some(m) else { fail("Expected match") }
 ///   debug_inspect(
 ///     m.named_group("number"),
 ///     content=(
@@
 ///     domain +
 ///     @string.Regex::string(".") +
 ///     tld
-///   guard email.execute("john@example.com") is Some(m) else {
+///   guard email.execute_renamed("john@example.com") is Some(m) else {
 ///     fail("Expected match")
 ///   }
 ///   debug_inspect(
*** Update File: <WORKDIR>/string/regex_bench_test.mbt
@@
 test "bench regex /aa?b/ on 1MB string" (it : @bench.T) {
   let re = re"aa?b"
   let one_mb_string : String = "a".repeat(1024 * 1024 - 1) + "b"
-  it.bench(() => re.execute(one_mb_string) |> ignore)
+  it.bench(() => re.execute_renamed(one_mb_string) |> ignore)
 }
 
 ///|
@@
   ]
   it.bench(() => {
     for line in phone_lines {
-      re.execute(line) |> ignore
+      re.execute_renamed(line) |> ignore
     }
   })
 }
@@
   let filenames = make_filenames()
   it.bench(() => {
     for filename in filenames {
-      re.execute(filename) |> ignore
+      re.execute_renamed(filename) |> ignore
     }
   })
 }
*** Update File: <WORKDIR>/string/regex_literal_test.mbt
@@
 
 ///|
 test "regex_literal" {
-  guard re"\\".execute("\\") is Some(result) && result.group(0) is Some("\\") else {
+  guard re"\\".execute_renamed("\\") is Some(result) && result.group(0) is Some("\\") else {
     fail("Expected match")
   }
 }
*** Update File: <WORKDIR>/string/regex_methods.mbt
@@
     if limit is Some(limit) && replaced >= limit {
       break copy_index
     }
-    match regex.execute(str, last_index=search_index) {
+    match regex.execute_renamed(str, last_index=search_index) {
       None => break copy_index
       Some(m) => {
         guard m.result.group(0) is Some((start, end)) else { break copy_index }
@@
   let len = str.length()
   Iter::new(() => {
     guard search_index <= len else { None }
-    match regex.execute(str, last_index=search_index) {
+    match regex.execute_renamed(str, last_index=search_index) {
       None => None
       Some(m) => {
         guard m.result.group(0) is Some((start, end)) else { return None }
@@
   Iter::new(() => {
     guard !done else { None }
     while search_index <= len {
-      match regex.execute(str, last_index=search_index) {
+      match regex.execute_renamed(str, last_index=search_index) {
         None => {
           done = true
           return Some(str[copy_index:])
*** Update File: <WORKDIR>/string/regex_test.mbt
@@
 ///|
 test "execute/non_capture_group" {
   let regex = re"(?:ab)(c)(?:d)"
-  guard regex.execute("abcd") is Some(m) else { fail("Expected match") }
+  guard regex.execute_renamed("abcd") is Some(m) else { fail("Expected match") }
   debug_inspect(
     m,
     content=(
@@
 ///|
 test "execute/non_capture_with_named_group" {
   let regex = re"(?:a)(b)(?:c)(?<d>d)"
-  guard regex.execute("abcd") is Some(m) else { fail("Expected match") }
+  guard regex.execute_renamed("abcd") is Some(m) else { fail("Expected match") }
   debug_inspect(
     m,
     content=(
@@
 ///|
 test "execute/any_char_on_supplementary_plane" {
   let regex = re"."
-  guard regex.execute("😀") is Some(m) else {
+  guard regex.execute_renamed("😀") is Some(m) else {
     fail("Expected match for supplementary-plane Unicode escape")
   }
   debug_inspect(
@@
 ///|
 test "execute/range_crossing_surrogate_gap_has_no_half_match" {
   let regex = re"[\uD7FF-\uE000]"
-  guard regex.execute("😀") is None else {
+  guard regex.execute_renamed("😀") is None else {
     fail("Expected no surrogate-half match")
   }
 }
@@
 ///|
 test "compile/unicode_escape_supplementary_plane" {
   let regex = re"\u{1F600}"
-  guard regex.execute("a😀b") is Some(m) else {
+  guard regex.execute_renamed("a😀b") is Some(m) else {
     fail("Expected match for supplementary-plane Unicode escape")
   }
   debug_inspect(
@@
 ///|
 test "string/literal_metacharacters" {
   let regex = @string.Regex::string("a+b(c)")
-  guard regex.execute("xa+b(c)y") is Some(m) else {
+  guard regex.execute_renamed("xa+b(c)y") is Some(m) else {
     fail("Expected literal match")
   }
   debug_inspect(
@@
     ),
   )
   debug_inspect(
-    regex.execute("xabccy"),
+    regex.execute_renamed("xabccy"),
     content=(
       #|None
     ),
@@
   let base = re"[[:digit:]]"
   let greedy = base.repeat(min=2, max=4)
   let nongreedy = base.repeat(min=2, max=4, greedy=false)
-  guard greedy.execute("a12345") is Some(m1) else {
+  guard greedy.execute_renamed("a12345") is Some(m1) else {
     fail("Expected greedy match")
   }
-  guard nongreedy.execute("a12345") is Some(m2) else {
+  guard nongreedy.execute_renamed("a12345") is Some(m2) else {
     fail("Expected non-greedy match")
   }
   debug_inspect(
@@
 ///|
 test "add/sequence" {
   let regex = @string.Regex::string("ab") + @string.Regex::string("cd")
-  guard regex.execute("xxabcdyy") is Some(m) else {
+  guard regex.execute_renamed("xxabcdyy") is Some(m) else {
     fail("Expected concatenated match")
   }
   debug_inspect(
@@
 test "bitor/alternation" {
   let regex = @string.Regex::string("cat") | @string.Regex::string("dog")
   debug_inspect(
-    regex.execute("dog"),
+    regex.execute_renamed("dog"),
     content=(
       #|Some(
       #|  {
@@
     ),
   )
   debug_inspect(
-    regex.execute("cow"),
+    regex.execute_renamed("cow"),
     content=(
       #|None
     ),
@@
     domain_part +
     @string.Regex::string(".") +
     tld
-  guard email.execute("user@example.com") is Some(m) else {
+  guard email.execute_renamed("user@example.com") is Some(m) else {
     fail("Expected email match")
   }
   debug_inspect(
@@
       #|}
     ),
   )
-  guard email.execute("test.user+tag@my-domain.org") is Some(x) else {
+  guard email.execute_renamed("test.user+tag@my-domain.org") is Some(x) else {
     fail("Expected complex email match")
   }
   debug_inspect(
@@
   let ftp = @string.Regex::string("ftp")
   let protocol = http | https | ftp
   let url = protocol + @string.Regex::string("://") + re"[^/]+"
-  guard url.execute("https://example.com") is Some(m) else {
+  guard url.execute_renamed("https://example.com") is Some(m) else {
     fail("Expected URL match")
   }
   debug_inspect(
@@
       #|}
     ),
   )
-  guard url.execute("ftp://files.server.org") is Some(m2) else {
+  guard url.execute_renamed("ftp://files.server.org") is Some(m2) else {
     fail("Expected FTP URL match")
   }
   debug_inspect(
@@
     ),
   )
   debug_inspect(
-    url.execute("gopher://old.site"),
+    url.execute_renamed("gopher://old.site"),
     content=(
       #|None
     ),
@@
   let dot_sep = @string.Regex::string(".")
   let sep = dash_sep | slash_sep | dot_sep
   let date = year + sep + month + sep + day
-  guard date.execute("2026-02-26") is Some(m1) else {
+  guard date.execute_renamed("2026-02-26") is Some(m1) else {
     fail("Expected dash date match")
   }
   debug_inspect(
@@
       #|}
     ),
   )
-  guard date.execute("2026/02/26") is Some(m2) else {
+  guard date.execute_renamed("2026/02/26") is Some(m2) else {
     fail("Expected slash date match")
   }
   debug_inspect(
@@
       #|}
     ),
   )
-  guard date.execute("2026.02.26") is Some(m3) else {
+  guard date.execute_renamed("2026.02.26") is Some(m3) else {
     fail("Expected dot date match")
   }
   debug_inspect(
@@
   let identifier = start_char + id_char.repeat(min=0)
   let namespace_sep = @string.Regex::string("::")
   let namespaced_id = (identifier + namespace_sep).repeat(min=0) + identifier
-  guard namespaced_id.execute("std::string::length") is Some(m) else {
+  guard namespaced_id.execute_renamed("std::string::length") is Some(m) else {
     fail("Expected namespaced identifier match")
   }
   debug_inspect(
@@
       #|}
     ),
   )
-  guard namespaced_id.execute("_internal_var") is Some(m2) else {
+  guard namespaced_id.execute_renamed("_internal_var") is Some(m2) else {
     fail("Expected simple identifier match")
   }
   debug_inspect(
@@
     ),
   )
   // Test should fail to match if starting with digit - the match skips leading digits
-  guard namespaced_id.execute("123invalid") is Some(m3) else {
+  guard namespaced_id.execute_renamed("123invalid") is Some(m3) else {
     fail("Expected match somewhere in string")
   }
   debug_inspect(
@@
     re"[^\]]+" +
     @string.Regex::string("]")
   let log_line = timestamp + @string.Regex::string(" ") + level
-  guard log_line.execute("[2026-02-26 10:30:45] ERROR") is Some(m) else {
+  guard log_line.execute_renamed("[2026-02-26 10:30:45] ERROR") is Some(m) else {
     fail("Expected log line match")
   }
   debug_inspect(
@@
       #|}
     ),
   )
-  guard log_line.execute("[10:30] WARNING") is Some(m2) else {
+  guard log_line.execute_renamed("[10:30] WARNING") is Some(m2) else {
     fail("Expected warning match")
   }
   debug_inspect(
@@
     prefix +
     (space | dash).repeat(min=0, max=1) +
     line
-  guard phone.execute("+1 (555)123-4567") is Some(m) else {
+  guard phone.execute_renamed("+1 (555)123-4567") is Some(m) else {
     fail("Expected phone match")
   }
   debug_inspect(
@@
   let semver = major_minor_patch +
     pre_release.repeat(min=0, max=1) +
     build_meta.repeat(min=0, max=1)
-  guard semver.execute("1.2.3") is Some(m1) else {
+  guard semver.execute_renamed("1.2.3") is Some(m1) else {
     fail("Expected simple version match")
   }
   debug_inspect(
@@
       #|}
     ),
   )
-  guard semver.execute("2.0.0-beta.1+20260226") is Some(m2) else {
+  guard semver.execute_renamed("2.0.0-beta.1+20260226") is Some(m2) else {
     fail("Expected full version match")
   }
   debug_inspect(
@@
   let long_color = hash + hex + hex + hex + hex + hex + hex
   let short_color = hash + hex + hex + hex
   let color = alpha_color | long_color | short_color
-  guard color.execute("#FFF") is Some(m1) else {
+  guard color.execute_renamed("#FFF") is Some(m1) else {
     fail("Expected short hex match")
   }
   debug_inspect(
@@
       #|}
     ),
   )
-  guard color.execute("#FF5733") is Some(m2) else {
+  guard color.execute_renamed("#FF5733") is Some(m2) else {
     fail("Expected long hex match")
   }
   debug_inspect(
@@
       #|}
     ),
   )
-  guard color.execute("#FF5733AA") is Some(m3) else {
+  guard color.execute_renamed("#FF5733AA") is Some(m3) else {
     fail("Expected alpha hex match")
   }
   debug_inspect(
@@
     int +
     frac.repeat(min=0, max=1) +
     exp.repeat(min=0, max=1)
-  guard number.execute("-42") is Some(m1) else {
+  guard number.execute_renamed("-42") is Some(m1) else {
     fail("Expected integer match")
   }
   debug_inspect(
@@
       #|}
     ),
   )
-  guard number.execute("3.14159") is Some(m2) else {
+  guard number.execute_renamed("3.14159") is Some(m2) else {
     fail("Expected float match")
   }
   debug_inspect(
@@
       #|}
     ),
   )
-  guard number.execute("6.022e23") is Some(m3) else {
+  guard number.execute_renamed("6.022e23") is Some(m3) else {
     fail("Expected scientific match")
   }
   debug_inspect(
@@
 test "add/with_any_quantifier" {
   let re1 = re".*?\."
   let re2 = re1 + @string.Regex::string(" ")
-  guard re1.execute("abc.") is Some(_) else { fail("Expected match") }
+  guard re1.execute_renamed("abc.") is Some(_) else { fail("Expected match") }
-  guard re2.execute("abc. ") is Some(_) else { fail("Expected match") }
+  guard re2.execute_renamed("abc. ") is Some(_) else { fail("Expected match") }
 }
 
 ///|
@@
 test "add/with_any_quantifier_and_empty_wrappers" {
   let empty = @string.Regex::string("")
   let re = empty + re".*?\." + empty + @string.Regex::string(" ")
-  guard re.execute("abc. ") is Some(m) else { fail("Expected match") }
+  guard re.execute_renamed("abc. ") is Some(m) else { fail("Expected match") }
   inspect(m.content(), content="abc. ")
 }
 
@@
 ///|
 test "escaped_dash_in_char_class" {
   let regex = re"[a\-z]"
-  inspect(regex.execute("a-z") is Some(_), content="true")
+  inspect(regex.execute_renamed("a-z") is Some(_), content="true")
-  inspect(regex.execute("b") is Some(_), content="false")
+  inspect(regex.execute_renamed("b") is Some(_), content="false")
-  inspect(regex.execute("-") is Some(_), content="true")
+  inspect(regex.execute_renamed("-") is Some(_), content="true")
-  inspect(regex.execute("a") is Some(_), content="true")
+  inspect(regex.execute_renamed("a") is Some(_), content="true")
-  inspect(regex.execute("z") is Some(_), content="true")
+  inspect(regex.execute_renamed("z") is Some(_), content="true")
 }
 
 ///|
@@
 test "capture/simple_named_group" {
   let digit = re"[[:digit:]]+".capture("number")
   let regex = @string.Regex::string("ID: ") + digit
-  guard regex.execute("ID: 12345") is Some(m) else { fail("Expected match") }
+  guard regex.execute_renamed("ID: 12345") is Some(m) else { fail("Expected match") }
   inspect(m.content(), content="ID: 12345")
   debug_inspect(
     m.named_group("number"),
@@
     domain +
     @string.Regex::string(".") +
     tld
-  guard email.execute("john@example.com") is Some(m) else {
+  guard email.execute_renamed("john@example.com") is Some(m) else {
     fail("Expected match")
   }
   inspect(m.content(), content="john@example.com")
@@
   let first = word.capture("first")
   let second = word.capture("second")
   let regex = first + @string.Regex::string(" ") + second
-  guard regex.execute("hello world") is Some(m) else { fail("Expected match") }
+  guard regex.execute_renamed("hello world") is Some(m) else { fail("Expected match") }
   debug_inspect(
     m.named_group("first"),
     content=(
*** End Patch

```
