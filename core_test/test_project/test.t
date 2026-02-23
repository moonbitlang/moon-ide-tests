Test peek-def for String::length:
  $ moon ide peek-def 'String::length' 2>&1 | grep -E "^Found"
  Found 1 symbols matching 'String::length':

Test peek-def for Array::push:
  $ moon ide peek-def 'Array::push' 2>&1 | grep -E "^Found"
  Found 1 symbols matching 'Array::push':

Test peek-def with --loc for local function:
  $ moon ide peek-def fib --loc test_project.mbt:2 2>&1 | head -2
  Definition found at file $TESTCASE_ROOT/test_project.mbt
    | ///|
FIXME this should work (zhiyuan)    
  $ moon ide peek-def fib --loc test_project.mbt 2>&1 | head -2
  Invalid location format: test_project.mbt. Expected file:line or file:line:column
Test peek-def for Heyx (type alias to named type):
  $ moon ide peek-def Heyx 2>&1 | head -4
  Found 1 symbols matching 'Heyx':
  
  `type alias Heyx` in package username/test_project at $TESTCASE_ROOT/tuple_type_bug.mbt:3-3
  3 | type Heyx = @list.List[Int]


TODO wrong output
Test peek-def --loc for Heyx at usage site (line 5):
  $ moon ide peek-def Heyx --loc tuple_type_bug.mbt:5 2>&1 | head -2
  Definition found at file $TESTCASE_ROOT/tuple_type_bug.mbt
    | type Hello = (Int, String)

TODO(peek-def-tuple-alias): peek-def --loc for Hello at usage site fails for tuple type alias
  $ moon ide peek-def Hello --loc tuple_type_bug.mbt:5 2>&1
  Error: could not find definition for symbol 'Hello' at tuple_type_bug.mbt:5
  [1]

TODO(peek-def-tuple-alias): peek-def for Hello matches a spurious symbol from core
  $ moon ide peek-def Hello 2>&1 | head -4
  Found 2 symbols matching 'Hello':
  
  `struct Hello` in package moonbitlang/core/json_blackbox_test at /Users/hongbozhang/.moon/lib/core/json/derive_json_test.mbt:15-20
  15 | ///|


Test find-references for String::length:
FIXME it is unclear this semantics is what we want
  $ moon ide find-references 'String::length' 2>&1 | head -6
  `pub fn String::length` in package moonbitlang/core/builtin at /Users/hongbozhang/.moon/lib/core/builtin/intrinsics.mbt:1729-1750
  1729 | ///|
       | /// Returns the number of UTF-16 code units in the string. Note that this is not
       | /// necessarily equal to the number of Unicode characters (code points) in the
       | /// string, as some characters may be represented by multiple UTF-16 code units.
       | ///
