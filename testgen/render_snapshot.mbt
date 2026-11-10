///|
fn snapshot_file_path(platform : TestPlatform, path : String) -> String {
  let normalized = normalize_separators(path)
  match platform {
    TestPlatform::Unix => normalized
    TestPlatform::Windows => windows_repo_path(normalized)
  }
}

///|
fn snapshot_location(platform : TestPlatform, test_case : TestCase) -> String {
  "\{snapshot_file_path(platform, test_case.file)}:\{test_case.line}:\{test_case.col}"
}

///|
fn snapshot_quoted_location(
  platform : TestPlatform,
  test_case : TestCase,
) -> String {
  command_quote(snapshot_location(platform, test_case))
}

///|
fn snapshot_command(test_root : String, invocation : String) -> String {
  "$ moonx '\{test_root}/scripts/run-moon-ide.mbtx' \{invocation}"
}

///|
fn append_snapshot_block(
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
fn append_snapshot_command(
  sb : StringBuilder,
  seen : @hashset.HashSet[String],
  command : String,
  annotation~ : String? = None,
) -> Bool {
  if seen.contains(command) {
    false
  } else {
    seen.add(command)
    append_snapshot_block(sb, command, annotation~)
    true
  }
}

///|
fn append_snapshot_cases(
  sb : StringBuilder,
  seen : @hashset.HashSet[String],
  cases : Array[TestCase],
  to_command : (TestCase) -> String,
  annotation~ : (TestCase) -> String? = _ => None,
) -> Bool {
  let mut has_command = false
  for test_case in cases {
    if append_snapshot_command(
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
fn render_snapshot_outline(
  repo_slug : String,
  platform : TestPlatform,
  test_root : String,
  source_files : Array[String],
) -> CramFile? {
  let sb = StringBuilder()
  append_markdown_header(sb, repo_slug, "outline")
  let seen : @hashset.HashSet[String] = @hashset.HashSet([])
  let mut has_command = false
  for file in source_files {
    if append_snapshot_command(
        sb,
        seen,
        snapshot_command(
          test_root,
          "outline \{command_quote(snapshot_file_path(platform, file))}",
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
fn render_snapshot_symbol_file(
  repo_slug : String,
  name : String,
  suite : String,
  loc_cases : Array[TestCase],
  to_command : (TestCase) -> String,
) -> CramFile? {
  let sb = StringBuilder()
  append_markdown_header(sb, repo_slug, suite)
  let seen : @hashset.HashSet[String] = @hashset.HashSet([])
  let has_command = append_snapshot_cases(sb, seen, loc_cases, to_command, annotation=test_case => {
    if suite == "hover" {
      fixture_hover_annotation(repo_slug, test_case)
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
/// find-references and rename output can list every reference in the
/// repository, so a monolithic suite file grows past what Moon Cram's
/// markdown parser handles (~190 KB overflows its stack on Windows).
/// These suites emit one .mooncram.md per test case instead.
fn render_snapshot_symbol_files(
  repo_slug : String,
  platform : TestPlatform,
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
    let case_location = snapshot_location(platform, test_case)
    let sb = StringBuilder()
    append_markdown_header(
      sb,
      repo_slug,
      "\{prefix} \{test_case.sym} \{case_location}",
    )
    append_snapshot_block(sb, command)
    files.push(CramFile::{
      name: split_case_file_name(prefix, case_location, test_case.sym, used),
      content: sb.to_string(),
    })
  }
  files
}

///|
fn render_snapshot_cram_files(
  result : CollectResult,
  repo_slug : String,
  platform : TestPlatform,
  test_root : String,
) -> Array[CramFile] {
  let files = Array(capacity=0)
  append_if_some(
    files,
    render_snapshot_outline(repo_slug, platform, test_root, result.source_files),
  )
  append_if_some(
    files,
    render_snapshot_symbol_file(repo_slug, "hover.mooncram.md", "hover", result.loc_cases, test_case => {
      snapshot_command(
        test_root,
        "hover \{command_quote(test_case.sym)} --loc \{snapshot_quoted_location(platform, test_case)}\{fixture_target_option(repo_slug, test_case.file)}",
      )
    }),
  )
  append_if_some(
    files,
    render_snapshot_symbol_file(repo_slug, "peek-def.mooncram.md", "peek-def", result.loc_cases, test_case => {
      snapshot_command(
        test_root,
        "peek-def \{command_quote(test_case.sym)} --loc \{snapshot_quoted_location(platform, test_case)}\{fixture_target_option(repo_slug, test_case.file)}",
      )
    }),
  )
  for file in render_snapshot_symbol_files(repo_slug, platform, "find-references", result.loc_cases, test_case => {
    snapshot_command(
      test_root,
      "find-references \{command_quote(test_case.sym)} --loc \{snapshot_quoted_location(platform, test_case)}\{fixture_target_option(repo_slug, test_case.file)}",
    )
  }) {
    files.push(file)
  }
  let rename_cases = result.loc_cases.filter(test_case => {
    !should_skip_fixture_rename(repo_slug, test_case)
  })
  for file in render_snapshot_symbol_files(repo_slug, platform, "rename", rename_cases, test_case => {
    snapshot_command(
      test_root,
      "rename \{command_quote(test_case.sym)} \{command_quote(rename_target(test_case.sym))} --loc \{snapshot_quoted_location(platform, test_case)}\{fixture_target_option(repo_slug, test_case.file)}",
    )
  }) {
    files.push(file)
  }
  files
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
