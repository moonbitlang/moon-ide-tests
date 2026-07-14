# core rename regex string\regex_test.mbt:17:7

```mooncram
$ run_moon_ide '..\..\..\fixtures\repos\core' moon ide rename 'regex' 'regex_renamed' --loc 'string\regex_test.mbt:17:7'
*** Begin Patch
*** Update File: <WORKDIR>/string\regex_test.mbt
@@
 
 ///|
 test "execute/non_capture_group" {
-  let regex = re"(?:ab)(c)(?:d)"
+  let regex_renamed = re"(?:ab)(c)(?:d)"
-  guard regex.execute("abcd") is Some(m) else { fail("Expected match") }
+  guard regex_renamed.execute("abcd") is Some(m) else { fail("Expected match") }
   debug_inspect(
     m,
     content=(
*** End Patch

```
