///|
fn append_line(sb : StringBuilder, line : String) -> Unit {
  sb.write_string(line)
  sb.write_char('\n')
}

///|
fn append_fixed_header(sb : StringBuilder) -> Unit {
  append_line(sb, "  $ export MOON_HOME=\"${MOON_HOME:-$HOME/.moon}\"")
  append_line(
    sb, "  $ export BUILD_PATH_PREFIX_MAP=\"\\$MOON_HOME=$MOON_HOME:$BUILD_PATH_PREFIX_MAP\"",
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
    append_line(sb, command)
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
  append_fixed_header(sb)
  let seen : @hashset.HashSet[String] = @hashset.HashSet::new()
  let mut has_command = false
  for file in source_files {
    if append_unique_command(
        sb,
        seen,
        "  $ moon ide outline \{shell_quote(file)}",
      ) {
      has_command = true
    }
  }
  if has_command {
    Some(CramFile::{ name: "generated_outline.t", content: sb.to_string() })
  } else {
    None
  }
}

///|
fn render_symbol_file(
  name : String,
  hover_cases : Array[TestCase],
  toplevel_symbols : Array[ToplevelCase],
  hover_command : (TestCase) -> String,
  toplevel_command : (ToplevelCase) -> String,
) -> CramFile? {
  let sb = StringBuilder::new()
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
    "generated_hover.t",
    cases,
    [],
    test_case => {
      "  $ moon ide hover \{test_case.sym} --loc \{quoted_location(test_case)}"
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
    "generated_peek_def.t",
    hover_cases,
    toplevel_symbols,
    test_case => {
      "  $ moon ide peek-def \{test_case.sym} --loc \{quoted_location(test_case)}"
    },
    test_case => "  $ moon ide peek-def \{shell_quote(test_case.query)}",
  )
}

///|
fn render_refs_file(
  hover_cases : Array[TestCase],
  toplevel_symbols : Array[ToplevelCase],
) -> CramFile? {
  render_symbol_file(
    "generated_find_references.t",
    hover_cases,
    toplevel_symbols,
    test_case => {
      "  $ moon ide find-references \{test_case.sym} --loc \{quoted_location(test_case)}"
    },
    test_case => "  $ moon ide find-references \{shell_quote(test_case.query)}",
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
    "generated_rename.t",
    hover_cases,
    toplevel_symbols,
    test_case => {
      "  $ moon ide rename \{test_case.sym} \{rename_target(test_case.sym)} --loc \{quoted_location(test_case)}"
    },
    test_case => {
      "  $ moon ide rename \{shell_quote(test_case.query)} \{rename_target(test_case.rename_sym)}"
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
fn render_cram_files(result : CollectResult) -> Array[CramFile] {
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
