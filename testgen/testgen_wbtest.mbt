///|
test "parse_args accepts required generation arguments" {
  let config = parse_args([
    "--repo", "fixtures/repos/argparser", "--output-dir", "tests/baseline/argparser",
    "--repo-slug", "argparser", "--max-per-file", "7", "--max-files", "3",
  ])
  inspect(config.repo_path, content="fixtures/repos/argparser")
  inspect(config.output_dir, content="tests/baseline/argparser")
  inspect(config.repo_slug, content="argparser")
  inspect(config.test_repo_path, content="fixtures/repos/argparser")
  inspect(config.max_per_file, content="7")
  inspect(config.max_files, content="3")
}

///|
test "parse_args defaults limits" {
  let config = parse_args([
    "--repo", "repo", "--output-dir", "out", "--repo-slug", "slug",
  ])
  inspect(config.test_repo_path, content="repo")
  inspect(config.max_per_file, content="50")
  inspect(config.max_files, content="0")
}

///|
test "should_skip_dir covers dependency and vcs dirs" {
  debug_inspect(
    [
      should_skip_dir("_build"),
      should_skip_dir("target"),
      should_skip_dir("node_modules"),
      should_skip_dir(".mooncakes"),
      should_skip_dir(".moonagent"),
      should_skip_dir(".repo"),
      should_skip_dir(".git"),
      should_skip_dir("src"),
    ],
    content="[true, true, true, true, true, true, true, false]",
  )
}

///|
test "collect_cases_for_text uses ast nodes" {
  let text =
    #|fn f() {
    #|  let x = 1
    #|  x.dotcall()
    #|  Other::method
    #|  @pkg.dotvalue
    #|  @pkg.PkgType
    #|}
  let result = collect_cases_for_text("a.mbt", text, 50)
  debug_inspect(
    result,
    content=(
      #|{
      #|  source_files: ["a.mbt"],
      #|  loc_cases: [
      #|    { file: "a.mbt", line: 1, col: 4, sym: "f" },
      #|    { file: "a.mbt", line: 2, col: 7, sym: "x" },
      #|    { file: "a.mbt", line: 3, col: 5, sym: "dotcall" },
      #|    { file: "a.mbt", line: 3, col: 3, sym: "x" },
      #|    { file: "a.mbt", line: 4, col: 3, sym: "Other" },
      #|    { file: "a.mbt", line: 4, col: 10, sym: "method" },
      #|    { file: "a.mbt", line: 5, col: 8, sym: "dotvalue" },
      #|    { file: "a.mbt", line: 6, col: 8, sym: "PkgType" },
      #|  ],
      #|}
    ),
  )
}

///|
test "collect_cases_for_text enforces max_per_file for loc nodes" {
  let text =
    #|fn f() {
    #|  let x = 1
    #|  x.dotcall()
    #|  Other::method
    #|}
  let result = collect_cases_for_text("a.mbt", text, 2)
  debug_inspect(
    result,
    content=(
      #|{
      #|  source_files: ["a.mbt"],
      #|  loc_cases: [
      #|    { file: "a.mbt", line: 1, col: 4, sym: "f" },
      #|    { file: "a.mbt", line: 2, col: 7, sym: "x" },
      #|  ],
      #|}
    ),
  )
}

///|
test "collect_cases_for_text uses shared loc cases" {
  let text =
    #|struct T {
    #|  value : Int
    #|}
    #|fn f() { () }
    #|let x = 1
    #|trait Tr {
    #|  g(Self) -> Unit = _
    #|}
    #|impl Tr for Int with g(self) { () }
    #|using @pkg {func as func2}
    #|
  let result = collect_cases_for_text("a.mbt", text, 50)
  debug_inspect(
    result,
    content=(
      #|{
      #|  source_files: ["a.mbt"],
      #|  loc_cases: [
      #|    { file: "a.mbt", line: 1, col: 8, sym: "T" },
      #|    { file: "a.mbt", line: 2, col: 3, sym: "value" },
      #|    { file: "a.mbt", line: 4, col: 4, sym: "f" },
      #|    { file: "a.mbt", line: 5, col: 5, sym: "x" },
      #|    { file: "a.mbt", line: 6, col: 7, sym: "Tr" },
      #|    { file: "a.mbt", line: 7, col: 3, sym: "g" },
      #|    { file: "a.mbt", line: 9, col: 6, sym: "Tr" },
      #|    { file: "a.mbt", line: 9, col: 22, sym: "g" },
      #|    { file: "a.mbt", line: 9, col: 24, sym: "self" },
      #|    { file: "a.mbt", line: 10, col: 21, sym: "func2" },
      #|  ],
      #|}
    ),
  )
}

///|
test "collect_cases_for_text collects generic impl method by loc token" {
  let text =
    #|trait Tr {
    #|  g(Self) -> Unit = _
    #|}
    #|impl Tr for Array[Int] with g(self) { () }
    #|
  let result = collect_cases_for_text("a.mbt", text, 50)
  debug_inspect(
    result.loc_cases,
    content=(
      #|[
      #|  { file: "a.mbt", line: 1, col: 7, sym: "Tr" },
      #|  { file: "a.mbt", line: 2, col: 3, sym: "g" },
      #|  { file: "a.mbt", line: 4, col: 6, sym: "Tr" },
      #|  { file: "a.mbt", line: 4, col: 29, sym: "g" },
      #|  { file: "a.mbt", line: 4, col: 31, sym: "self" },
      #|]
    ),
  )
}

///|
test "collect_cases_for_text collects type function loc token" {
  let text =
    #|fn Int::local_abs(self : Int) -> Int { self }
    #|
  let result = collect_cases_for_text("a.mbt", text, 50)
  debug_inspect(
    result.loc_cases,
    content=(
      #|[
      #|  { file: "a.mbt", line: 1, col: 9, sym: "local_abs" },
      #|  { file: "a.mbt", line: 1, col: 19, sym: "self" },
      #|  { file: "a.mbt", line: 1, col: 40, sym: "self" },
      #|]
    ),
  )
}

///|
test "collect_cases_for_text excludes Self type symbol" {
  let text =
    #|trait Tr {
    #|  g(Self) -> Unit = _
    #|}
  let result = collect_cases_for_text("a.mbt", text, 50)
  debug_inspect(
    result,
    content=(
      #|{
      #|  source_files: ["a.mbt"],
      #|  loc_cases: [
      #|    { file: "a.mbt", line: 1, col: 7, sym: "Tr" },
      #|    { file: "a.mbt", line: 2, col: 3, sym: "g" },
      #|  ],
      #|}
    ),
  )
}

///|
test "collect_cases_for_text excludes operator symbols" {
  let text =
    #|fn f(x : Int) -> Int {
    #|  let n = Int::abs(-x)
    #|  n + 1
    #|}
  let result = collect_cases_for_text("a.mbt", text, 50)
  debug_inspect(
    result,
    content=(
      #|{
      #|  source_files: ["a.mbt"],
      #|  loc_cases: [
      #|    { file: "a.mbt", line: 1, col: 4, sym: "f" },
      #|    { file: "a.mbt", line: 1, col: 6, sym: "x" },
      #|    { file: "a.mbt", line: 2, col: 7, sym: "n" },
      #|    { file: "a.mbt", line: 2, col: 16, sym: "abs" },
      #|    { file: "a.mbt", line: 2, col: 21, sym: "x" },
      #|    { file: "a.mbt", line: 3, col: 3, sym: "n" },
      #|  ],
      #|}
    ),
  )
}

///|
test "collect_cases_for_text excludes main function" {
  let text =
    #|fn main() { () }
    #|fn f() { main() }
  let result = collect_cases_for_text("a.mbt", text, 50)
  debug_inspect(
    result,
    content=(
      #|{
      #|  source_files: ["a.mbt"],
      #|  loc_cases: [{ file: "a.mbt", line: 2, col: 4, sym: "f" }],
      #|}
    ),
  )
}

///|
test "parser_report_lines formats parser diagnostics" {
  let (_, reports) = @parser.parse_string("fn f( {", name="bad.mbt")
  assert_true(reports.length() > 0)
  let lines = parser_report_lines("bad.mbt", reports)
  assert_true(lines.length() > 1)
  assert_true(lines[0].contains("testgen: parser emitted"))
  assert_true(lines[0].contains("bad.mbt"))
  assert_true(lines[1].has_prefix("testgen:   "))
}

///|
test "render_cram_files emits mooncram markdown commands" {
  let result = CollectResult::{
    source_files: ["a.mbt"],
    loc_cases: [TestCase::{ file: "a.mbt", line: 1, col: 4, sym: "f" }],
  }
  let files = render_cram_files(result, "example", "fixtures/repos/example")
  inspect(files.length(), content="5")
  inspect(files[0].name, content="outline.mooncram.md")
  assert_true(files[0].content.contains("```mooncram"))
  assert_true(
    files[0].content.contains(
      "$ export TEST_REPO_ROOT=\"$(cd \"$TESTDIR/../../../fixtures/repos/example\" && pwd)\"",
    ),
  )
  assert_true(
    files[0].content.contains("$ run_moon_ide moon ide outline 'a.mbt'"),
  )
  assert_true(files[1].content.contains("<MOON_HOME>"))
  assert_true(
    files[1].content.contains(
      "$ run_moon_ide moon ide hover 'f' --loc 'a.mbt:1:4'",
    ),
  )
  assert_true(
    files[2].content.contains(
      "$ run_moon_ide moon ide peek-def 'f' --loc 'a.mbt:1:4'",
    ),
  )
  assert_true(
    files[3].content.contains(
      "$ run_moon_ide moon ide find-references 'f' --loc 'a.mbt:1:4'",
    ),
  )
  assert_true(
    files[4].content.contains(
      "$ run_moon_ide moon ide rename 'f' 'f_renamed' --loc 'a.mbt:1:4'",
    ),
  )
}

///|
test "preserve_expected_output keeps matching command output" {
  let generated =
    #|# example hover
    #|
    #|```mooncram
    #|$ run_moon_ide moon ide hover f --loc 'a.mbt:1:4'
    #|```
    #|
    #|```mooncram
    #|$ run_moon_ide moon ide hover g --loc 'a.mbt:2:4'
    #|```
    #|
  let existing =
    #|# example hover
    #|
    #|```mooncram
    #|$ run_moon_ide moon ide hover f --loc 'a.mbt:1:4'
    #|hover output
    #|  detail
    #|```
    #|
    #|```mooncram
    #|$ run_moon_ide moon ide hover old --loc 'a.mbt:3:4'
    #|stale output
    #|```
    #|
  inspect(
    preserve_expected_output(generated, existing),
    content=(
      #|# example hover
      #|
      #|```mooncram
      #|$ run_moon_ide moon ide hover f --loc 'a.mbt:1:4'
      #|hover output
      #|  detail
      #|```
      #|
      #|```mooncram
      #|$ run_moon_ide moon ide hover g --loc 'a.mbt:2:4'
      #|```
      #|
    ),
  )
}
