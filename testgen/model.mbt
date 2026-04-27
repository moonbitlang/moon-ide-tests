///|
priv struct TestCase {
  file : String
  line : Int
  col : Int
  sym : String
} derive(Eq, Hash, Debug)

///|
priv struct ToplevelCase {
  file : String
  line : Int
  col : Int
  query : String
  rename_sym : String
} derive(Eq, Hash, Debug)

///|

///|
#warnings("-unused_value")
priv struct CollectResult {
  source_files : Array[String]
  hover_cases : Array[TestCase]
  toplevel_symbols : Array[ToplevelCase]
} derive(Debug)

///|
#warnings("-unused_value")
priv struct CramFile {
  name : String
  content : String
} derive(Debug)
