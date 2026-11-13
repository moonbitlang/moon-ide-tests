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
fn command_quote(arg : String) -> String {
  if arg.contains("'") {
    Json(arg).stringify()
  } else {
    "'\{arg}'"
  }
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
fn append_if_some(files : Array[CramFile], maybe_file : CramFile?) -> Unit {
  match maybe_file {
    Some(file) => files.push(file)
    None => ()
  }
}

///|
fn split_case_file_name(
  prefix : String,
  case_location : String,
  sym : String,
  used : @hashset.HashSet[String],
) -> String {
  let sanitized = StringBuilder()
  for ch in case_location {
    if ch == '/' || ch == '\\' || ch == ':' {
      sanitized.write_char('-')
    } else {
      sanitized.write_char(ch)
    }
  }
  let base = "\{prefix}-\{sanitized}-\{sym}"
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
fn is_generated_command(line : String) -> Bool {
  line.has_prefix("$ moonx '") &&
  (
    line.contains("/scripts/run-moon-ide.mbtx' ") ||
    line.contains("/scripts/bench-moon-ide.mbtx' ")
  )
}
