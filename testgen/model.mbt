///|
priv struct TestCase {
  file : String
  line : Int
  col : Int
  sym : String
} derive(Eq, Hash, Debug)

///|
#warnings("-unused_value")
priv struct CollectResult {
  source_files : Array[String]
  loc_cases : Array[TestCase]
} derive(Debug)

///|
#warnings("-unused_value")
priv struct CramFile {
  name : String
  content : String
} derive(Debug)

///|
priv struct ExpectedBlock {
  command : String
  output : Array[String]
}
