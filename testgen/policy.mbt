///|
/// Fixture exceptions are explicit and scoped by --repo-slug. This is not a
/// replacement for moonbuild's workspace, target or #cfg resolution. When a
/// fixture changes, check these paths against its manifests and source before
/// changing the policy; unaffected files retain their project defaults.
fn should_skip_fixture_file(
  repo_slug : String,
  file : String,
  platform : TestPlatform,
) -> Bool {
  // Warren copies these uninstantiated templates into new projects. They are
  // outside Rabbita's moon.work members and contain placeholder dependency
  // versions, so they cannot be queried as checked-out workspace packages.
  let file = normalize_separators(file)
  (repo_slug == "rabbita" && file.has_prefix("warren/templates/")) ||
  // The first sampled declarations in these files are POSIX-only mkfifo and
  // IoHandle::wait_read, both #cfg(not(platform="windows")). Pick the next
  // eligible files on Windows rather than emit inactive location queries.
  (
    repo_slug == "async" &&
    platform == TestPlatform::Windows &&
    (
      file == "src/fs/named_pipe_test.mbt" ||
      file == "src/internal/event_loop/io_unix.mbt"
    )
  )
}

///|
fn fixture_target_option(repo_slug : String, file : String) -> String {
  match (repo_slug, normalize_separators(file)) {
    // This SSR test is #cfg(not(target="js")); Rabbita defaults to JS.
    ("rabbita", "rabbita/internal/runtime/host_ssr_wbtest.mbt") =>
      " --target native"
    // core excludes this file from its default wasm-gc backend.
    ("core", "encoding/utf8/decode_js.mbt") => " --target js"
    // async defaults to native, but these compatibility stubs/tests are
    // selected only for JS/wasm-gc (pipe) or non-native/wasm (socket/TLS/event loop).
    ("async", "src/pipe/unimplemented.mbt")
    | ("async", "src/pipe/unimplemented_test.mbt")
    | ("async", "src/socket/unimplemented.mbt")
    | ("async", "src/socket/unimplemented_test.mbt")
    | ("async", "src/tls/unimplemented_test.mbt")
    | ("async", "src/internal/event_loop/unimplemented_test.mbt") =>
      " --target js"
    _ => ""
  }
}

///|
/// Preserve these failing IDE queries as reproductions, with the marker outside
/// the command block. Matching includes the column to avoid marking successful
/// call sites or ordinary parameters with the same spelling. Lines may move.
fn fixture_hover_annotation(
  repo_slug : String,
  test_case : TestCase,
) -> String? {
  let limitation = match
    (
      repo_slug,
      normalize_separators(test_case.file),
      test_case.sym,
      test_case.col,
    ) {
    ("core", "test/extends.mbt", "to_repr", 37) =>
      Some(
        (
          "extension-declaration-hover", "Known IDE limitation: extension declaration hover reports no information; call-site hover and declaration rename work, including without the deprecated/hidden attributes.",
        ),
      )
    ("core", "builtin/int64.mbt", "self", 21) =>
      Some(
        (
          "intrinsic-parameter-hover", "Known IDE limitation: hover on the intrinsic declaration parameter reports no information; ordinary function parameters have hover information.",
        ),
      )
    ("rabbita", "rabbita/internal/vdom/vdom.mbt", "Scheduler", 19) =>
      Some(
        (
          "using-trait-hover", "Known IDE limitation: hover on the trait imported by using reports no information; its declaration hover and imported-name peek-def work.",
        ),
      )
    ("core", "encoding/utf8/decode_js.mbt", "decode_utf8_js", 16)
    | ("async", "src/fs/named_pipe_test.mbt", "mkfifo", 15)
    | ("async", "src/internal/event_loop/stdio.mbt", "fstatx_sync", 15) =>
      Some(
        (
          "extern-function-hover", "Known IDE limitation: extern function declaration hover reports no information; declaration navigation and rename work.",
        ),
      )
    ("core", "encoding/utf8/decode_js.mbt", "bytes", 3)
    | ("async", "src/fs/named_pipe_test.mbt", "path", 22)
    | ("async", "src/internal/event_loop/stdio.mbt", "fd", 3) =>
      Some(
        (
          "extern-parameter-hover", "Known IDE limitation: extern function parameter hover reports no information; declaration navigation and rename work.",
        ),
      )
    _ => None
  }
  limitation.map(pair => {
    let (name, explanation) = pair
    "\{explanation}\n\n<!-- known-ide-limitation: \{name} -->"
  })
}
