///|
priv struct PerformanceInvocation {
  command : String
  argv : Array[String]
  annotation : String?
}

///|
priv struct PerformanceCase {
  case_file : String
  argv : Array[String]
}

///|
fn performance_command(test_root : String, invocation : String) -> String {
  "$ moonx '\{test_root}/scripts/bench-moon-ide.mbtx' \{invocation} --no-check"
}

///|
fn performance_target(repo_slug : String, file : String) -> Array[String] {
  let option = fixture_target_option(repo_slug, file)
  if option.has_prefix(" --target ") {
    ["--target", option[10:].to_owned()]
  } else {
    []
  }
}

///|
fn performance_outline_invocation(
  repo_slug : String,
  test_root : String,
  file : String,
) -> PerformanceInvocation {
  let path = normalize_separators(file)
  let invocation = "outline \{command_quote(path)}\{fixture_target_option(repo_slug, file)}"
  let argv = ["ide", "outline", path]
  argv.append(performance_target(repo_slug, file))
  argv.push("--no-check")
  PerformanceInvocation::{
    command: performance_command(test_root, invocation),
    argv,
    annotation: None,
  }
}

///|
fn performance_symbol_invocation(
  repo_slug : String,
  test_root : String,
  operation : String,
  test_case : TestCase,
  annotation~ : String? = None,
) -> PerformanceInvocation {
  let case_location = "\{normalize_separators(test_case.file)}:\{test_case.line}:\{test_case.col}"
  let mut invocation = "\{operation} \{command_quote(test_case.sym)}"
  let argv = ["ide", operation, test_case.sym]
  if operation == "rename" {
    let target = rename_target(test_case.sym)
    invocation = invocation + " " + command_quote(target)
    argv.push(target)
  }
  invocation = invocation + " --loc " + command_quote(case_location)
  invocation = invocation + fixture_target_option(repo_slug, test_case.file)
  argv.push("--loc")
  argv.push(case_location)
  argv.append(performance_target(repo_slug, test_case.file))
  argv.push("--no-check")
  PerformanceInvocation::{
    command: performance_command(test_root, invocation),
    argv,
    annotation,
  }
}

///|
fn render_performance_file(
  repo_slug : String,
  name : String,
  suite : String,
  invocations : Array[PerformanceInvocation],
  cases : Array[PerformanceCase],
) -> CramFile? {
  let sb = StringBuilder()
  append_markdown_header(sb, repo_slug, suite)
  let seen : @hashset.HashSet[String] = @hashset.HashSet([])
  let mut has_command = false
  for invocation in invocations {
    if seen.contains(invocation.command) {
      continue
    }
    seen.add(invocation.command)
    append_line(sb, "")
    if invocation.annotation is Some(text) {
      append_line(sb, text)
    }
    append_line(sb, "````mooncram")
    append_line(sb, invocation.command)
    append_line(sb, "@STDOUT (ignore)")
    append_line(sb, "@STDERR (ignore)")
    append_line(sb, "````")
    cases.push({ case_file: name, argv: invocation.argv })
    has_command = true
  }
  if has_command {
    Some(CramFile::{ name, content: sb.to_string(), })
  } else {
    None
  }
}

///|
fn performance_prepare_commands(
  repo_slug : String,
  source_files : Array[String],
) -> Array[Array[String]] {
  let targets : Map[String, Bool] = Map([])
  for source in source_files {
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
  commands
}

///|
fn performance_workload_json(
  documents : Map[String, Json],
  cases : Array[PerformanceCase],
  repo_commit : String,
) -> String {
  let case_json : Array[Json] = []
  for case in cases {
    case_json.push({ "case_file": Json(case.case_file), "argv": Json(case.argv) })
  }
  Json({
    "repo_commit": Json(repo_commit),
    "documents": Json(documents),
    "cases": Json(case_json),
  }).stringify(indent=2) + "\n"
}

///|
fn render_performance_cram_files(
  result : CollectResult,
  repo_slug : String,
  test_root : String,
  repo_commit~ : String,
) -> Array[CramFile] {
  let files = Array(capacity=0)
  let cases : Array[PerformanceCase] = []
  let outline : Array[PerformanceInvocation] = []
  for file in result.source_files {
    outline.push(performance_outline_invocation(repo_slug, test_root, file))
  }
  append_if_some(
    files,
    render_performance_file(repo_slug, "outline.mooncram.md", "outline", outline, cases),
  )
  let hover : Array[PerformanceInvocation] = []
  for test_case in result.loc_cases {
    if !should_skip_performance_hover(repo_slug, test_case) {
      hover.push(performance_symbol_invocation(repo_slug, test_root, "hover", test_case, annotation=fixture_hover_annotation(repo_slug, test_case)))
    }
  }
  append_if_some(
    files,
    render_performance_file(repo_slug, "hover.mooncram.md", "hover", hover, cases),
  )
  let peek : Array[PerformanceInvocation] = []
  for test_case in result.loc_cases {
    peek.push(performance_symbol_invocation(repo_slug, test_root, "peek-def", test_case))
  }
  append_if_some(
    files,
    render_performance_file(repo_slug, "peek-def.mooncram.md", "peek-def", peek, cases),
  )
  let refs : Array[PerformanceInvocation] = []
  for test_case in result.loc_cases {
    if !should_skip_performance_refs(repo_slug, test_case) {
      refs.push(performance_symbol_invocation(repo_slug, test_root, "find-references", test_case))
    }
  }
  append_if_some(
    files,
    render_performance_file(repo_slug, "find-references.mooncram.md", "find-references", refs, cases),
  )
  let rename : Array[PerformanceInvocation] = []
  for test_case in result.loc_cases {
    if !should_skip_fixture_rename(repo_slug, test_case) {
      rename.push(performance_symbol_invocation(repo_slug, test_root, "rename", test_case))
    }
  }
  append_if_some(
    files,
    render_performance_file(repo_slug, "rename.mooncram.md", "rename", rename, cases),
  )
  let documents : Map[String, Json] = Map([])
  for file in files {
    documents[file.name] = Json(file.content)
  }
  files.push(CramFile::{
    name: "workload.json",
    content: performance_workload_json(documents, cases, repo_commit),
  })
  files.push(CramFile::{
    name: "prepare.json",
    content: Json({ "commands": Json(performance_prepare_commands(repo_slug, result.source_files)) }).stringify(
      indent=2,
    ) + "\n",
  })
  files
}

///|
fn is_performance_output(name : String) -> Bool {
  name.has_suffix(".mooncram.md") &&
  ["outline", "hover", "peek-def", "find-references", "rename"].any(prefix =>
    name == "\{prefix}.mooncram.md" || name.has_prefix("\{prefix}-"))
}
