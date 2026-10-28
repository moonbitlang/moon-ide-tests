///|
pub fn helper() -> Int32 {
  1
}

///|
pub const Origin : String = "https://example.com"

///|
pub(all) enum Failure {
  Unreachable
  Denied(String)
}

///|
pub fn Failure::label(self : Failure) -> String {
  match self {
    Unreachable => "unreachable"
    Denied(why) => why
  }
}

///|
pub(all) suberror RequestError {
  RequestError(String)
}
