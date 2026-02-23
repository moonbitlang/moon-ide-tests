Test moon ide doc for core library functions (checking header only for stability):
  $ moon ide doc 'String::length' | head -5
  package "moonbitlang/core/string"
  #alias(charcode_length, deprecated)
  pub fn String::length(String) -> Int
    Returns the number of UTF-16 code units in the string. Note that this is not
     necessarily equal to the number of Unicode characters (code points) in the

Test moon ide doc for Result type (header only):
  $ moon ide doc 'Result' | head -5
  package "moonbitlang/core/result"
  type Result[T, E]
  
    pub fn[T, E, U] Result::bind(Self[T, E], (T) -> Self[U, E]) -> Self[U, E]
    pub fn[T : Compare, E : Compare] Result::compare(Self[T, E], Self[T, E]) -> Int

Test moon ide doc for Option type (header only):
  $ moon ide doc 'Option' | head -5
  package "moonbitlang/core/option"
  type Option[T]
  
    pub fn[T, U] Option::bind(T?, (T) -> U? raise?) -> U? raise?
    pub fn[X : Compare] Option::compare(X?, X?) -> Int

TODO(doc-unqualified): moon ide doc 'HashMap' doesn't work without package prefix:
  $ moon ide doc 'HashMap'
  No results found for query: 'HashMap'

Test moon ide doc for @hashmap.HashMap (with package prefix, header only):
  $ moon ide doc '@hashmap.HashMap' | head -5
  package "moonbitlang/core/hashmap"
  type HashMap[K, V]
    Mutable hash map, not thread safe.
     # Example
     ```mbt check


TODO(peek-def-requires-project): moon ide peek-def requires running within a moonbit project:
  $ moon ide peek-def 'String::length'
  Error: could not find module root. Please run within a moonbit project.
  [1]
