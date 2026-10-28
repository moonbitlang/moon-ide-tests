///|
fn main {
  println(@mid.helper())
  println(@mid.Origin)
  println(@mid.Failure::Unreachable.label())
  let failed : Result[Unit, Error] = Err(@mid.RequestError::RequestError("x"))
  ignore(failed)
}
