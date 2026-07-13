# core find-references regex string\regex_test.mbt:17:7

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\core' moon ide find-references 'regex' --loc 'string\regex_test.mbt:17:7'
Found 2 references for symbol 'regex':
<WORKDIR>/string\regex_test.mbt:17:7-17:12:
   | 
   | ///|
   | test "execute/non_capture_group" {
17 |   let regex = re"(?:ab)(c)(?:d)"
   |       ^^^^^
   |   guard regex.execute("abcd") is Some(m) else { fail("Expected match") }
   |   debug_inspect(

<WORKDIR>/string\regex_test.mbt:18:9-18:14:
   | ///|
   | test "execute/non_capture_group" {
   |   let regex = re"(?:ab)(c)(?:d)"
18 |   guard regex.execute("abcd") is Some(m) else { fail("Expected match") }
   |         ^^^^^
   |   debug_inspect(
   |     m,

```
