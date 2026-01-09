Test moon ide doc for core library functions (checking header only for stability):
  $ moon ide doc 'String::length' | head -5
  package "moonbitlang/core/string"
  
  pub fn String::length(String) -> Int
    Returns the number of UTF-16 code units in the string. Note that this is not
     necessarily equal to the number of Unicode characters (code points) in the

Test moon ide doc for Result type (header only):
  $ moon ide doc 'Result' | head -5
  package "moonbitlang/core/result"
  
  type Result[T, E]
  
    pub fn[T, E, U] Result::bind(Self[T, E], (T) -> Self[U, E]) -> Self[U, E]

Test moon ide doc for Option type (header only):
  $ moon ide doc 'Option' | head -5
  package "moonbitlang/core/option"
  
  type Option[T]
  
    pub fn[T, U] Option::bind(T?, (T) -> U? raise?) -> U? raise?

TODO(doc-unqualified): moon ide doc 'HashMap' doesn't work without package prefix:
  $ moon ide doc 'HashMap'
  symbol HashMap not found

Test moon ide doc for @hashmap.HashMap (with package prefix, header only):
  $ moon ide doc '@hashmap.HashMap' | head -5
  package "moonbitlang/core/hashmap"
  
  type HashMap[K, V]
    Mutable hash map, not thread safe.
    


TODO(peek-def-requires-project): moon ide peek-def requires running within a moonbit project:
  $ moon ide peek-def 'String::length'
  Error: could not find module root. Please run within a moonbit project.
  [1]

Combined test for peek-def and find-references within project:
TODO(peek-def-loc-crash): peek-def with -loc crashes with Key_not_found("moonbitlang/core/prelude")
TODO(find-references-crash): find-references crashes with Key_not_found("moonbitlang/core/prelude")
  $ cd test_project && moon ide peek-def 'String::length' 2>&1 | grep -E "^Found" && moon ide peek-def 'Array::push' 2>&1 | grep -E "^Found" && moon ide peek-def fib -loc test_project.mbt:2 2>&1 | head -2 && moon ide find-references 'String::length' 2>&1 | head -2
  Found 1 symbols matching 'String::length':
  Found 1 symbols matching 'Array::push':
  Fatal error: exception Dune__exe__Moonide.Basic_hash_string.Key_not_found("moonbitlang/core/prelude")
  Raised at Dune__exe__Moonide.Basic_hash_string.find_exn in file "moonide.ml", line 5127, characters 13-38
  Fatal error: exception Dune__exe__Moonide.Basic_hash_string.Key_not_found("moonbitlang/core/prelude")
  Raised at Dune__exe__Moonide.Basic_hash_string.find_exn in file "moonide.ml", line 5127, characters 13-38
