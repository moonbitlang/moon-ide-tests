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
fn append_fixed_header(sb : StringBuilder) -> Unit {
  append_mooncram_block(sb, "$ export MOON_HOME=\"${MOON_HOME:-$HOME/.moon}\"")
  append_mooncram_block(sb, "$ export TEST_REPO_ROOT=\"$PWD\"")
  append_mooncram_block(
    sb, "$ normalize_moon_ide_output() { sed -e \"s|$TEST_REPO_ROOT|<WORKDIR>|g\" -e \"s|$MOON_HOME|<MOON_HOME>|g\"; }",
  )
  append_mooncram_block(
    sb, "$ run_moon_ide() { status_file=\"${TMPDIR:-/tmp}/moon-ide-status.$$\"; ( \"$@\"; echo \"$?\" > \"$status_file\" ) 2>&1 | normalize_moon_ide_output; status=$(cat \"$status_file\"); rm -f \"$status_file\"; return \"$status\"; }",
  )
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
fn append_toplevel_commands(
  sb : StringBuilder,
  seen : @hashset.HashSet[String],
  cases : Array[ToplevelCase],
  to_command : (ToplevelCase) -> String,
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
fn render_outline_file(source_files : Array[String]) -> CramFile? {
  let sb = StringBuilder::new()
  append_markdown_header(sb, current_repo_slug.val, "outline")
  append_fixed_header(sb)
  let seen : @hashset.HashSet[String] = @hashset.HashSet::new()
  let mut has_command = false
  for file in source_files {
    if append_unique_command(
        sb,
        seen,
        "$ run_moon_ide moon ide outline \{shell_quote(file)}",
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
  hover_cases : Array[TestCase],
  toplevel_symbols : Array[ToplevelCase],
  hover_command : (TestCase) -> String,
  toplevel_command : (ToplevelCase) -> String,
) -> CramFile? {
  let sb = StringBuilder::new()
  append_markdown_header(sb, current_repo_slug.val, suite)
  append_fixed_header(sb)
  let seen : @hashset.HashSet[String] = @hashset.HashSet::new()
  let hover_has_command = append_case_commands(
    sb, seen, hover_cases, hover_command,
  )
  let toplevel_has_command = append_toplevel_commands(
    sb, seen, toplevel_symbols, toplevel_command,
  )
  if hover_has_command || toplevel_has_command {
    Some(CramFile::{ name, content: sb.to_string() })
  } else {
    None
  }
}

///|
fn render_hover_file(cases : Array[TestCase]) -> CramFile? {
  render_symbol_file(
    "hover.mooncram.md",
    "hover",
    cases,
    [],
    test_case => {
      "$ run_moon_ide moon ide hover \{test_case.sym} --loc \{quoted_location(test_case)}"
    },
    _ => "",
  )
}

///|
fn render_peek_file(
  hover_cases : Array[TestCase],
  toplevel_symbols : Array[ToplevelCase],
) -> CramFile? {
  render_symbol_file(
    "peek-def.mooncram.md",
    "peek-def",
    hover_cases,
    toplevel_symbols,
    test_case => {
      "$ run_moon_ide moon ide peek-def \{test_case.sym} --loc \{quoted_location(test_case)}"
    },
    test_case => {
      "$ run_moon_ide moon ide peek-def \{shell_quote(test_case.query)}"
    },
  )
}

///|
fn render_refs_file(
  hover_cases : Array[TestCase],
  toplevel_symbols : Array[ToplevelCase],
) -> CramFile? {
  render_symbol_file(
    "find-references.mooncram.md",
    "find-references",
    hover_cases,
    toplevel_symbols,
    test_case => {
      "$ run_moon_ide moon ide find-references \{test_case.sym} --loc \{quoted_location(test_case)}"
    },
    test_case => {
      "$ run_moon_ide moon ide find-references \{shell_quote(test_case.query)}"
    },
  )
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
fn render_rename_file(
  hover_cases : Array[TestCase],
  toplevel_symbols : Array[ToplevelCase],
) -> CramFile? {
  render_symbol_file(
    "rename.mooncram.md",
    "rename",
    hover_cases,
    toplevel_symbols,
    test_case => {
      "$ run_moon_ide moon ide rename \{test_case.sym} \{rename_target(test_case.sym)} --loc \{quoted_location(test_case)}"
    },
    test_case => {
      "$ run_moon_ide moon ide rename \{shell_quote(test_case.query)} \{rename_target(test_case.rename_sym)}"
    },
  )
}

///|
fn append_if_some(files : Array[CramFile], maybe_file : CramFile?) -> Unit {
  match maybe_file {
    Some(file) => files.push(file)
    None => ()
  }
}

///|
let current_repo_slug : Ref[String] = Ref::new("")

///|
fn render_cram_files(
  result : CollectResult,
  repo_slug : String,
) -> Array[CramFile] {
  current_repo_slug.val = repo_slug
  let files = Array::new()
  append_if_some(files, render_outline_file(result.source_files))
  append_if_some(files, render_hover_file(result.hover_cases))
  append_if_some(
    files,
    render_peek_file(result.hover_cases, result.toplevel_symbols),
  )
  append_if_some(
    files,
    render_refs_file(result.hover_cases, result.toplevel_symbols),
  )
  append_if_some(
    files,
    render_rename_file(result.hover_cases, result.toplevel_symbols),
  )
  files
}

///|
fn split_lines(text : String) -> Array[String] {
  let lines = Array::new()
  for line in text.split("\n") {
    lines.push(line.to_owned())
  }
  lines
}

///|
fn is_generated_command(line : String) -> Bool {
  line.has_prefix("$ run_moon_ide ")
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
            lines[i] != "```" {
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
