///|
fn append_line(sb : StringBuilder, line : String) -> Unit {
  sb.write_string(line)
  sb.write_char('\n')
}

///|
fn append_markdown_header(
  sb : StringBuilder,
  repo_slug : String,
  suite : String,
) -> Unit {
  append_line(sb, "# \{repo_slug} \{suite}")
}

///|
fn append_mooncram_block(
  sb : StringBuilder,
  command : String,
  annotation~ : String? = None,
) -> Unit {
  append_line(sb, "")
  if annotation is Some(text) {
    append_line(sb, text)
  }
  append_line(sb, "````mooncram")
  append_line(sb, command)
  append_line(sb, "````")
}

///|
fn replace_all(text : String, old : String, new : String) -> String {
  let mut result = text
  while result.contains(old) {
    result = result.replace(old~, new~)
  }
  result
}

///|
fn windows_repo_path(repo_path : String) -> String {
  replace_all(repo_path, "/", "\\")
}

///|
fn platform_file_path(path : String) -> String {
  let normalized = normalize_separators(path)
  if current_performance.val {
    return normalized
  }
  match current_platform.val {
    TestPlatform::Unix => normalized
    TestPlatform::Windows => windows_repo_path(normalized)
  }
}

///|
fn location(test_case : TestCase) -> String {
  "\{platform_file_path(test_case.file)}:\{test_case.line}:\{test_case.col}"
}

///|
fn quoted_location(test_case : TestCase) -> String {
  command_quote(location(test_case))
}

///|
fn append_unique_command(
  sb : StringBuilder,
  seen : @hashset.HashSet[String],
  command : String,
  annotation~ : String? = None,
) -> Bool {
  if seen.contains(command) {
    false
  } else {
    seen.add(command)
    append_mooncram_block(sb, command, annotation~)
    true
  }
}

///|
fn append_case_commands(
  sb : StringBuilder,
  seen : @hashset.HashSet[String],
  cases : Array[TestCase],
  to_command : (TestCase) -> String,
  annotation~ : (TestCase) -> String? = _ => None,
) -> Bool {
  let mut has_command = false
  for test_case in cases {
    if append_unique_command(
        sb,
        seen,
        to_command(test_case),
        annotation=annotation(test_case),
      ) {
      has_command = true
    }
  }
  has_command
}

///|
fn command_quote(arg : String) -> String {
  if arg.contains("'") {
    Json(arg).stringify()
  } else {
    "'\{arg}'"
  }
}

///|
fn test_repo_root_arg() -> String {
  command_quote(
    "\{current_test_root.val}/\{normalize_separators(current_repo_path.val)}",
  )
}

///|
fn run_moon_ide_command(invocation : String) -> String {
  if current_performance.val {
    "$ moonx '\{current_test_root.val}/scripts/bench-moon-ide.mbtx' \{invocation} --no-check"
  } else {
    "$ moonx '\{current_test_root.val}/scripts/run-moon-ide.mbtx' \{test_repo_root_arg()} moon ide \{invocation}"
  }
}

///|
fn render_outline_file(source_files : Array[String]) -> CramFile? {
  let sb = StringBuilder()
  append_markdown_header(sb, current_repo_slug.val, "outline")
  let seen : @hashset.HashSet[String] = @hashset.HashSet([])
  let mut has_command = false
  for file in source_files {
    if append_unique_command(
        sb,
        seen,
        run_moon_ide_command(
          "outline \{command_quote(platform_file_path(file))}\{if current_performance.val { fixture_target_option(current_repo_slug.val, file) } else { "" }}",
        ),
      ) {
      has_command = true
    }
  }
  if has_command {
    Some(CramFile::{ name: "outline.mooncram.md", content: sb.to_string(), })
  } else {
    None
  }
}

///|
fn render_symbol_file(
  name : String,
  suite : String,
  loc_cases : Array[TestCase],
  to_command : (TestCase) -> String,
) -> CramFile? {
  let sb = StringBuilder()
  append_markdown_header(sb, current_repo_slug.val, suite)
  let seen : @hashset.HashSet[String] = @hashset.HashSet([])
  let has_command = append_case_commands(sb, seen, loc_cases, to_command, annotation=test_case => {
    if suite == "hover" {
      fixture_hover_annotation(current_repo_slug.val, test_case)
    } else {
      None
    }
  })
  if has_command {
    Some(CramFile::{ name, content: sb.to_string(), })
  } else {
    None
  }
}

///|
fn render_hover_file(cases : Array[TestCase]) -> CramFile? {
  let cases = if current_performance.val {
    cases.filter(test_case => {
      !(current_repo_slug.val == "openseek" &&
      normalize_separators(test_case.file) ==
      "editor/internal/viewer/contrib/hover/extends.mbt" &&
      test_case.sym == "to_repr" &&
      test_case.col == 40)
    })
  } else {
    cases
  }
  render_symbol_file("hover.mooncram.md", "hover", cases, test_case => {
    run_moon_ide_command(
      "hover \{command_quote(test_case.sym)} --loc \{quoted_location(test_case)}\{fixture_target_option(current_repo_slug.val, test_case.file)}",
    )
  })
}

///|
fn render_peek_file(cases : Array[TestCase]) -> CramFile? {
  render_symbol_file("peek-def.mooncram.md", "peek-def", cases, test_case => {
    run_moon_ide_command(
      "peek-def \{command_quote(test_case.sym)} --loc \{quoted_location(test_case)}\{fixture_target_option(current_repo_slug.val, test_case.file)}",
    )
  })
}

///|
/// find-references and rename output can list every reference in the
/// repository, so a monolithic suite file grows past what Moon Cram's
/// markdown parser handles (~190 KB overflows its stack on Windows).
/// These suites emit one .mooncram.md per test case instead.
fn split_case_file_name(
  prefix : String,
  test_case : TestCase,
  used : @hashset.HashSet[String],
) -> String {
  let sanitized = StringBuilder()
  for ch in location(test_case) {
    if ch == '/' || ch == '\\' || ch == ':' {
      sanitized.write_char('-')
    } else {
      sanitized.write_char(ch)
    }
  }
  let base = "\{prefix}-\{sanitized}-\{test_case.sym}"
  let mut name = "\{base}.mooncram.md"
  let mut suffix = 2
  while used.contains(name) {
    name = "\{base}-\{suffix}.mooncram.md"
    suffix += 1
  }
  used.add(name)
  name
}

///|
fn render_split_symbol_files(
  prefix : String,
  loc_cases : Array[TestCase],
  to_command : (TestCase) -> String,
) -> Array[CramFile] {
  let files = Array(capacity=0)
  let used : @hashset.HashSet[String] = @hashset.HashSet([])
  let seen : @hashset.HashSet[String] = @hashset.HashSet([])
  for test_case in loc_cases {
    let command = to_command(test_case)
    if seen.contains(command) {
      continue
    }
    seen.add(command)
    let sb = StringBuilder()
    append_markdown_header(
      sb,
      current_repo_slug.val,
      "\{prefix} \{test_case.sym} \{location(test_case)}",
    )
    append_mooncram_block(sb, command)
    files.push(CramFile::{
      name: split_case_file_name(prefix, test_case, used),
      content: sb.to_string(),
    })
  }
  files
}

///|
fn render_refs_files(cases : Array[TestCase]) -> Array[CramFile] {
  let cases = if current_performance.val && current_repo_slug.val == "openseek" {
    cases.filter(test_case => !should_skip_fixture_rename("openseek", test_case))
  } else {
    cases
  }
  render_split_symbol_files("find-references", cases, test_case => {
    run_moon_ide_command(
      "find-references \{command_quote(test_case.sym)} --loc \{quoted_location(test_case)}\{fixture_target_option(current_repo_slug.val, test_case.file)}",
    )
  })
}

///|
fn rename_target(symbol : String) -> String {
  if symbol.length() > 0 && symbol[0] >= 'A' && symbol[0] <= 'Z' {
    "\{symbol}Renamed"
  } else {
    "\{symbol}_renamed"
  }
}

///|
fn render_rename_files(cases : Array[TestCase]) -> Array[CramFile] {
  let cases = cases.filter(test_case => {
    !should_skip_fixture_rename(current_repo_slug.val, test_case)
  })
  render_split_symbol_files("rename", cases, test_case => {
    run_moon_ide_command(
      "rename \{command_quote(test_case.sym)} \{command_quote(rename_target(test_case.sym))} --loc \{quoted_location(test_case)}\{fixture_target_option(current_repo_slug.val, test_case.file)}",
    )
  })
}

///|
fn append_if_some(files : Array[CramFile], maybe_file : CramFile?) -> Unit {
  match maybe_file {
    Some(file) => files.push(file)
    None => ()
  }
}

///|
let current_repo_slug : Ref[String] = Ref("")

///|
let current_repo_path : Ref[String] = Ref("")

///|
let current_platform : Ref[TestPlatform] = Ref(TestPlatform::Unix)

///|
let current_performance : Ref[Bool] = Ref(false)

///|
let current_test_root : Ref[String] = Ref("../../..")

///|
fn render_cram_files(
  result : CollectResult,
  repo_slug : String,
  repo_path : String,
  platform : TestPlatform,
  performance~ : Bool = false,
  test_root~ : String = "../../..",
) -> Array[CramFile] {
  current_repo_slug.val = repo_slug
  current_repo_path.val = repo_path
  current_platform.val = platform
  current_performance.val = performance
  current_test_root.val = normalize_separators(test_root)
  let files = Array(capacity=0)
  append_if_some(files, render_outline_file(result.source_files))
  append_if_some(files, render_hover_file(result.loc_cases))
  append_if_some(files, render_peek_file(result.loc_cases))
  for file in render_refs_files(result.loc_cases) {
    files.push(file)
  }
  for file in render_rename_files(result.loc_cases) {
    files.push(file)
  }
  if performance {
    let targets : Map[String, Bool] = Map([])
    for source in result.source_files {
      let source = normalize_separators(source)
      let option = fixture_target_option(repo_slug, source)
      let target = if option.has_prefix(" --target ") {
        option[10:].to_owned()
      } else {
        "wasm-gc"
      }
      // The editor has its own nested workspace and IDE metadata directory.
      let scope = if repo_slug == "openseek" && source.has_prefix("editor/") {
        "editor"
      } else {
        "."
      }
      targets[scope + ":" + target] = true
    }
    let commands : Array[Array[String]] = []
    if repo_slug == "openseek" {
      // Compile its nested build tool once before parallel code-generation rules.
      commands.push(["run", "scripts/md_to_mbt_string", "--", "--help"])
    }
    for scope in [".", "editor"] {
      let backends = ["native", "js", "wasm", "wasm-gc", "llvm"].filter(target =>
        targets.contains(scope + ":" + target))
      if !backends.is_empty() {
        let prefix = if scope == "." { [] } else { ["-C", scope] }
        // One full check publishes metadata for every requested backend.
        commands.push([..prefix, "check", "--no-mbti", "--target", backends.join(",")])
      }
    }
    files.push(CramFile::{
      name: "prepare.json",
      content: Json({ "commands": Json(commands) }).stringify(indent=2) + "\n",
    })
  }
  if performance {
    let split_files : Array[CramFile] = []
    for file in files {
      if ["outline.mooncram.md", "hover.mooncram.md", "peek-def.mooncram.md"].contains(
          file.name,
        ) {
        let prefix = file.name[:file.name.length() - 12].to_owned()
        for index, block in parse_expected_blocks(file.content) {
          let sb = StringBuilder()
          append_markdown_header(sb, repo_slug, prefix)
          append_mooncram_block(sb, block.command)
          split_files.push(CramFile::{
            name: "\{prefix}-\{index + 1}.mooncram.md",
            content: sb.to_string(),
          })
        }
      } else {
        split_files.push(file)
      }
    }
    split_files
  } else {
    files
  }
}

///|
fn split_lines(text : String) -> Array[String] {
  let lines = Array(capacity=0)
  for line in text.split("\n") {
    if line.length() > 0 && line[line.length() - 1] == '\r' {
      lines.push(line[:line.length() - 1].to_owned())
    } else {
      lines.push(line.to_owned())
    }
  }
  lines
}

///|
fn is_generated_command(line : String) -> Bool {
  line.has_prefix("$ moonx '") &&
  (
    line.contains("/scripts/run-moon-ide.mbtx' ") ||
    line.contains("/scripts/bench-moon-ide.mbtx' ")
  )
}

///|
fn mooncram_fence(line : String) -> String? {
  if !line.has_suffix("mooncram") {
    return None
  }
  let fence = line[:line.length() - 8]
  if fence.length() < 3 || !fence.iter().all(ch => ch == '`') {
    return None
  }
  Some(fence.to_owned())
}

///|
fn parse_expected_blocks(existing : String) -> Array[ExpectedBlock] {
  let lines = split_lines(existing)
  let blocks = Array(capacity=0)
  let mut i = 0
  let mut fence = ""
  while i < lines.length() {
    let line = lines[i]
    if mooncram_fence(line) is Some(opening) && fence == "" {
      fence = opening
      i = i + 1
    } else if line == fence {
      fence = ""
      i = i + 1
    } else if fence != "" && is_generated_command(line) {
      let command = line
      let output = Array(capacity=0)
      i = i + 1
      while i < lines.length() &&
            !lines[i].has_prefix("$ ") &&
            lines[i] != fence {
        output.push(lines[i])
        i = i + 1
      }
      blocks.push(ExpectedBlock::{ command, output, fence, })
    } else {
      i = i + 1
    }
  }
  blocks
}

///|
fn preserve_expected_output(generated : String, existing : String) -> String {
  let blocks = parse_expected_blocks(existing)
  let sb = StringBuilder()
  let lines = split_lines(generated)
  let mut i = 0
  while i < lines.length() {
    let line = lines[i]
    if i == lines.length() - 1 && line == "" {
      break
    }
    if mooncram_fence(line) is Some(fence) &&
      i + 1 < lines.length() &&
      is_generated_command(lines[i + 1]) {
      let command = lines[i + 1]
      let mut end = i + 2
      while end < lines.length() && lines[end] != fence {
        end = end + 1
      }
      match blocks.iter().find_first(block => block.command == command) {
        Some(block) => {
          append_line(sb, "\{block.fence}mooncram")
          append_line(sb, command)
          for output in block.output {
            append_line(sb, output)
          }
          append_line(sb, block.fence)
        }
        None =>
          for j in i..<=end.min(lines.length() - 1) {
            append_line(sb, lines[j])
          }
      }
      i = end + 1
    } else {
      append_line(sb, line)
      i = i + 1
    }
  }
  sb.to_string()
}
