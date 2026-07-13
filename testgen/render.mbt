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
fn append_mooncram_block(sb : StringBuilder, command : String) -> Unit {
  append_line(sb, "")
  append_line(sb, "```mooncram")
  append_line(sb, command)
  append_line(sb, "```")
}

///|
fn append_unix_header(sb : StringBuilder) -> Unit {
  append_mooncram_block(sb, "$ export MOON_HOME=\"${MOON_HOME:-$HOME/.moon}\"")
  append_mooncram_block(
    sb,
    "$ export TEST_REPO_ROOT=\"$(cd \"$TESTDIR/../../../\{current_repo_path.val}\" && pwd)\"",
  )
  append_mooncram_block(
    sb, "$ normalize_moon_ide_output() { sed -e \"s|$TEST_REPO_ROOT|<WORKDIR>|g\" -e \"s|$MOON_HOME|<MOON_HOME>|g\"; }",
  )
  append_mooncram_block(
    sb, "$ run_moon_ide() { status_file=\"${TMPDIR:-/tmp}/moon-ide-status.$$\"; ( cd \"$TEST_REPO_ROOT\" && \"$@\"; echo \"$?\" > \"$status_file\" ) 2>&1 | normalize_moon_ide_output; status=$(cat \"$status_file\"); rm -f \"$status_file\"; return \"$status\"; }",
  )
}

///|
fn powershell_single_quote(arg : String) -> String {
  let escaped = arg.replace(old="'", new="''")
  "'\{escaped}'"
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
fn append_windows_header(sb : StringBuilder) -> Unit {
  ignore(sb)
}

///|
fn append_fixed_header(sb : StringBuilder) -> Unit {
  match current_platform.val {
    TestPlatform::Unix => append_unix_header(sb)
    TestPlatform::Windows => append_windows_header(sb)
  }
}

///|
fn location(test_case : TestCase) -> String {
  "\{test_case.file}:\{test_case.line}:\{test_case.col}"
}

///|
fn quoted_location(test_case : TestCase) -> String {
  shell_quote(location(test_case))
}

///|
fn append_unique_command(
  sb : StringBuilder,
  seen : @hashset.HashSet[String],
  command : String,
) -> Bool {
  if seen.contains(command) {
    false
  } else {
    seen.add(command)
    append_mooncram_block(sb, command)
    true
  }
}

///|
fn append_case_commands(
  sb : StringBuilder,
  seen : @hashset.HashSet[String],
  cases : Array[TestCase],
  to_command : (TestCase) -> String,
) -> Bool {
  let mut has_command = false
  for test_case in cases {
    if append_unique_command(sb, seen, to_command(test_case)) {
      has_command = true
    }
  }
  has_command
}

///|
fn shell_quote(arg : String) -> String {
  let escaped = arg.replace(old="'", new="'\\''")
  "'\{escaped}'"
}

///|
fn test_repo_root_arg() -> String {
  powershell_single_quote(
    "..\\..\\..\\\{windows_repo_path(current_repo_path.val)}",
  )
}

///|
fn run_moon_ide_command(invocation : String) -> String {
  match current_platform.val {
    TestPlatform::Unix => "$ run_moon_ide \{invocation}"
    TestPlatform::Windows =>
      "$ run_moon_ide \{test_repo_root_arg()} \{invocation}"
  }
}

///|
fn render_outline_file(source_files : Array[String]) -> CramFile? {
  let sb = StringBuilder::new()
  append_markdown_header(sb, current_repo_slug.val, "outline")
  append_fixed_header(sb)
  let seen : @hashset.HashSet[String] = @hashset.HashSet([])
  let mut has_command = false
  for file in source_files {
    if append_unique_command(
        sb,
        seen,
        run_moon_ide_command("moon ide outline \{shell_quote(file)}"),
      ) {
      has_command = true
    }
  }
  if has_command {
    Some(CramFile::{ name: "outline.mooncram.md", content: sb.to_string() })
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
  let sb = StringBuilder::new()
  append_markdown_header(sb, current_repo_slug.val, suite)
  append_fixed_header(sb)
  let seen : @hashset.HashSet[String] = @hashset.HashSet([])
  let has_command = append_case_commands(sb, seen, loc_cases, to_command)
  if has_command {
    Some(CramFile::{ name, content: sb.to_string() })
  } else {
    None
  }
}

///|
fn render_hover_file(cases : Array[TestCase]) -> CramFile? {
  render_symbol_file("hover.mooncram.md", "hover", cases, test_case => {
    run_moon_ide_command(
      "moon ide hover \{shell_quote(test_case.sym)} --loc \{quoted_location(test_case)}",
    )
  })
}

///|
fn render_peek_file(cases : Array[TestCase]) -> CramFile? {
  render_symbol_file("peek-def.mooncram.md", "peek-def", cases, test_case => {
    run_moon_ide_command(
      "moon ide peek-def \{shell_quote(test_case.sym)} --loc \{quoted_location(test_case)}",
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
  let sanitized = StringBuilder::new()
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
  let files = Array::new()
  let used : @hashset.HashSet[String] = @hashset.HashSet([])
  let seen : @hashset.HashSet[String] = @hashset.HashSet([])
  for test_case in loc_cases {
    let command = to_command(test_case)
    if seen.contains(command) {
      continue
    }
    seen.add(command)
    let sb = StringBuilder::new()
    append_markdown_header(
      sb,
      current_repo_slug.val,
      "\{prefix} \{test_case.sym} \{location(test_case)}",
    )
    append_fixed_header(sb)
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
  render_split_symbol_files("find-references", cases, test_case => {
    run_moon_ide_command(
      "moon ide find-references \{shell_quote(test_case.sym)} --loc \{quoted_location(test_case)}",
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
  render_split_symbol_files("rename", cases, test_case => {
    run_moon_ide_command(
      "moon ide rename \{shell_quote(test_case.sym)} \{shell_quote(rename_target(test_case.sym))} --loc \{quoted_location(test_case)}",
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
fn render_cram_files(
  result : CollectResult,
  repo_slug : String,
  repo_path : String,
  platform : TestPlatform,
) -> Array[CramFile] {
  current_repo_slug.val = repo_slug
  current_repo_path.val = repo_path
  current_platform.val = platform
  let files = Array::new()
  append_if_some(files, render_outline_file(result.source_files))
  append_if_some(files, render_hover_file(result.loc_cases))
  append_if_some(files, render_peek_file(result.loc_cases))
  for file in render_refs_files(result.loc_cases) {
    files.push(file)
  }
  for file in render_rename_files(result.loc_cases) {
    files.push(file)
  }
  files
}

///|
fn split_lines(text : String) -> Array[String] {
  let lines = Array::new()
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
  line.has_prefix("$ run_moon_ide ")
}

///|
fn is_mooncram_fence_close(line : String) -> Bool {
  line == "```" || line == "````"
}

///|
fn parse_expected_blocks(existing : String) -> Array[ExpectedBlock] {
  let lines = split_lines(existing)
  let blocks = Array::new()
  let mut i = 0
  while i < lines.length() {
    let line = lines[i]
    if is_generated_command(line) {
      let command = line
      let output = Array::new()
      i = i + 1
      while i < lines.length() &&
            !lines[i].has_prefix("$ ") &&
            !is_mooncram_fence_close(lines[i]) {
        output.push(lines[i])
        i = i + 1
      }
      if output.length() > 0 {
        blocks.push(ExpectedBlock::{ command, output })
      }
    } else {
      i = i + 1
    }
  }
  blocks
}

///|
fn append_preserved_output(
  sb : StringBuilder,
  blocks : Array[ExpectedBlock],
  command : String,
) -> Unit {
  for block in blocks {
    if block.command == command {
      for line in block.output {
        append_line(sb, line)
      }
      return
    }
  }
}

///|
fn preserve_expected_output(generated : String, existing : String) -> String {
  let blocks = parse_expected_blocks(existing)
  let sb = StringBuilder::new()
  let lines = split_lines(generated)
  let mut i = 0
  while i < lines.length() {
    let line = lines[i]
    if i == lines.length() - 1 && line == "" {
      break
    }
    append_line(sb, line)
    if is_generated_command(line) {
      append_preserved_output(sb, blocks, line)
    }
    i = i + 1
  }
  sb.to_string()
}
