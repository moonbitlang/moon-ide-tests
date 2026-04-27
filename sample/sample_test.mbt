// Blackbox tests run against the package's public API. Use `@sample` to import.
// Prefer high-level behaviors over implementation details.
// Run `moon test` to execute and `moon test --update` to refresh snapshots.

///|
test "demo_call" {
  inspect(demo_call(2), content="6")
}
