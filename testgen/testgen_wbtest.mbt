///|
test "parse_args accepts required generation arguments" {
  let config = parse_args([
    "--repo", "fixtures/repos/argparser", "--output-dir", "tests/baseline/argparser",
    "--repo-slug", "argparser", "--max-per-file", "7", "--max-files", "3", "--max-toplevel",
    "4",
  ])
  inspect(config.repo_path, content="fixtures/repos/argparser")
  inspect(config.output_dir, content="tests/baseline/argparser")
  inspect(config.repo_slug, content="argparser")
  inspect(config.max_per_file, content="7")
  inspect(config.max_files, content="3")
  inspect(config.max_toplevel, content="4")
}

///|
test "parse_args defaults limits" {
  let config = parse_args([
    "--repo", "repo", "--output-dir", "out", "--repo-slug", "slug",
  ])
  inspect(config.max_per_file, content="50")
  inspect(config.max_files, content="0")
  inspect(config.max_toplevel, content="20")
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
      #|  hover_cases: [
      #|    { file: "a.mbt", line: 1, col: 4, sym: "f" },
      #|    { file: "a.mbt", line: 2, col: 7, sym: "x" },
      #|    { file: "a.mbt", line: 3, col: 5, sym: "dotcall" },
      #|    { file: "a.mbt", line: 3, col: 3, sym: "x" },
      #|    { file: "a.mbt", line: 4, col: 3, sym: "Other" },
      #|    { file: "a.mbt", line: 4, col: 10, sym: "method" },
      #|    { file: "a.mbt", line: 5, col: 8, sym: "dotvalue" },
      #|    { file: "a.mbt", line: 6, col: 8, sym: "PkgType" },
      #|  ],
      #|  toplevel_symbols: [{ file: "a.mbt", line: 1, col: 4, query: "f", rename_sym: "f" }],
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
      #|  hover_cases: [
      #|    { file: "a.mbt", line: 1, col: 4, sym: "f" },
      #|    { file: "a.mbt", line: 2, col: 7, sym: "x" },
      #|  ],
      #|  toplevel_symbols: [{ file: "a.mbt", line: 1, col: 4, query: "f", rename_sym: "f" }],
      #|}
    ),
  )
}

///|
test "collect_cases_for_text includes toplevel symbols" {
  let text =
    #|type T = Int
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
      #|  hover_cases: [
      #|    { file: "a.mbt", line: 1, col: 6, sym: "T" },
      #|    { file: "a.mbt", line: 2, col: 4, sym: "f" },
      #|    { file: "a.mbt", line: 3, col: 5, sym: "x" },
      #|    { file: "a.mbt", line: 4, col: 7, sym: "Tr" },
      #|    { file: "a.mbt", line: 5, col: 3, sym: "g" },
      #|    { file: "a.mbt", line: 7, col: 6, sym: "Tr" },
      #|    { file: "a.mbt", line: 7, col: 22, sym: "g" },
      #|    { file: "a.mbt", line: 7, col: 24, sym: "self" },
      #|    { file: "a.mbt", line: 8, col: 7, sym: "pkg" },
      #|    { file: "a.mbt", line: 8, col: 21, sym: "func2" },
      #|  ],
      #|  toplevel_symbols: [
      #|    { file: "a.mbt", line: 1, col: 6, query: "T", rename_sym: "T" },
      #|    { file: "a.mbt", line: 2, col: 4, query: "f", rename_sym: "f" },
      #|    { file: "a.mbt", line: 3, col: 5, query: "x", rename_sym: "x" },
      #|    { file: "a.mbt", line: 4, col: 7, query: "Tr", rename_sym: "Tr" },
      #|    {
      #|      file: "a.mbt",
      #|      line: 7,
      #|      col: 22,
      #|      query: "Tr::g for Int",
      #|      rename_sym: "g",
      #|    },
      #|    {
      #|      file: "a.mbt",
      #|      line: 8,
      #|      col: 21,
      #|      query: "func2",
      #|      rename_sym: "func2",
      #|    },
      #|  ],
      #|}
    ),
  )
}

///|
test "collect_cases_for_text renders generic impl self type in query" {
  let text =
    #|trait Tr {
    #|  g(Self) -> Unit = _
    #|}
    #|impl Tr for Array[Int] with g(self) { () }
    #|
  let result = collect_cases_for_text("a.mbt", text, 50)
  debug_inspect(
    result.toplevel_symbols,
    content=(
      #|[
      #|  { file: "a.mbt", line: 1, col: 7, query: "Tr", rename_sym: "Tr" },
      #|  {
      #|    file: "a.mbt",
      #|    line: 4,
      #|    col: 29,
      #|    query: "Tr::g for Array[Int]",
      #|    rename_sym: "g",
      #|  },
      #|]
    ),
  )
}

///|
test "collect_cases_for_text renders type function query" {
  let text =
    #|fn Int::local_abs(self : Int) -> Int { self }
    #|
  let result = collect_cases_for_text("a.mbt", text, 50)
  debug_inspect(
    result.toplevel_symbols,
    content=(
      #|[
      #|  {
      #|    file: "a.mbt",
      #|    line: 1,
      #|    col: 9,
      #|    query: "Int::local_abs",
      #|    rename_sym: "local_abs",
      #|  },
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
      #|  hover_cases: [
      #|    { file: "a.mbt", line: 1, col: 7, sym: "Tr" },
      #|    { file: "a.mbt", line: 2, col: 3, sym: "g" },
      #|  ],
      #|  toplevel_symbols: [{ file: "a.mbt", line: 1, col: 7, query: "Tr", rename_sym: "Tr" }],
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
      #|  hover_cases: [
      #|    { file: "a.mbt", line: 1, col: 4, sym: "f" },
      #|    { file: "a.mbt", line: 1, col: 6, sym: "x" },
      #|    { file: "a.mbt", line: 2, col: 7, sym: "n" },
      #|    { file: "a.mbt", line: 2, col: 16, sym: "abs" },
      #|    { file: "a.mbt", line: 2, col: 21, sym: "x" },
      #|    { file: "a.mbt", line: 3, col: 3, sym: "n" },
      #|  ],
      #|  toplevel_symbols: [{ file: "a.mbt", line: 1, col: 4, query: "f", rename_sym: "f" }],
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
      #|  hover_cases: [{ file: "a.mbt", line: 2, col: 4, sym: "f" }],
      #|  toplevel_symbols: [{ file: "a.mbt", line: 2, col: 4, query: "f", rename_sym: "f" }],
      #|}
    ),
  )
}

///|
test "render_cram_files emits mooncram markdown commands" {
  let result = CollectResult::{
    source_files: ["a.mbt"],
    hover_cases: [TestCase::{ file: "a.mbt", line: 1, col: 4, sym: "f" }],
    toplevel_symbols: [
      ToplevelCase::{
        file: "a.mbt",
        line: 1,
        col: 4,
        query: "f",
        rename_sym: "f",
      },
    ],
  }
  let files = render_cram_files(result, "example")
  inspect(files.length(), content="5")
  inspect(files[0].name, content="outline.mooncram.md")
  assert_true(files[0].content.contains("```mooncram"))
  assert_true(
    files[0].content.contains("$ run_moon_ide moon ide outline 'a.mbt'"),
  )
  assert_true(files[1].content.contains("<MOON_HOME>"))
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
