///|
priv struct Args {
  repo_path : String
  output_dir : String
  repo_slug : String
  test_repo_path : String
  platform : TestPlatform
  max_per_file : Int32
  max_files : Int32
  max_file_size : Int32
}

///|
priv suberror ArgsError {
  ArgsError(String)
}

///|
fn fatal(message : String) -> Unit {
  println("Error: \{message}")
  @sys.exit(1)
}

///|
fn[T : @debug.Debug] debug_text(value : T) -> String {
  @debug.render(Repr(value))
}

///|
fn write_generated_file_or_exit(path : String, content : String) -> Unit {
  @fs.write_string_to_file(path, content) catch {
    err => fatal("failed to write \{path}: \{debug_text(err)}")
  }
  println("generated \{path}")
}

///|
fn ensure_dir(path : String) -> Unit {
  if @fs.path_exists(path) {
    let is_dir = @fs.is_dir(path) catch {
      err => {
        fatal("failed to check \{path}: \{debug_text(err)}")
        false
      }
    }
    if !is_dir {
      fatal("\{path} exists but is not a directory")
    }
  } else {
    @fs.create_dir(path) catch {
      err => fatal("failed to create \{path}: \{debug_text(err)}")
    }
  }
}

///|
fn ensure_dir_tree(path : String) -> Unit {
  if path == "" || path == "." {
    return
  }
  if @fs.path_exists(path) {
    ensure_dir(path)
    return
  }
  let parent = @path.Path(path).dirname().to_string()
  if parent != path && parent != "" && parent != "." {
    ensure_dir_tree(parent)
  }
  ensure_dir(path)
}

///|
fn ensure_repo_dir(path : String) -> Unit {
  if !@fs.path_exists(path) {
    fatal("repo path does not exist: \{path}")
  }
  let is_dir = @fs.is_dir(path) catch {
    err => {
      fatal("failed to check repo path \{path}: \{debug_text(err)}")
      false
    }
  }
  if !is_dir {
    fatal("repo path is not a directory: \{path}")
  }
}

///|
fn read_existing_file(path : String) -> String? {
  try @fs.read_file_to_string(path) catch {
    _ => None
  } noraise {
    text => Some(text)
  }
}

///|
/// Suites emitted as one file per test case; see render_split_symbol_files.
let split_suite_prefixes : Array[String] = ["find-references", "rename"]

///|
fn legacy_suite_file_name(prefix : String) -> String {
  "\{prefix}.mooncram.md"
}

///|
fn split_suite_prefix_of(name : String) -> String? {
  if !name.has_suffix(".mooncram.md") {
    return None
  }
  for prefix in split_suite_prefixes {
    if name.has_prefix("\{prefix}-") {
      return Some(prefix)
    }
  }
  None
}

///|
fn is_split_suite_output(name : String) -> Bool {
  if split_suite_prefix_of(name) is Some(_) {
    return true
  }
  for prefix in split_suite_prefixes {
    if name == legacy_suite_file_name(prefix) {
      return true
    }
  }
  false
}

///|
/// Split-suite cases that disappear leave their per-case files behind, and
/// the pre-split monolithic suite files would keep running stale commands,
/// so drop every split-suite output we did not just generate.
fn remove_stale_split_files(
  output_dir : String,
  files : Array[CramFile],
) -> Unit {
  let generated : @hashset.HashSet[String] = @hashset.HashSet([])
  for file in files {
    generated.add(file.name)
  }
  let entries = try @fs.read_dir(output_dir) catch {
    _ => return
  } noraise {
    values => values.to_owned()
  }
  entries.sort()
  for name in entries {
    if generated.contains(name) || !is_split_suite_output(name) {
      continue
    }
    let path = @path.Path::join(output_dir, name).to_string()
    @fs.remove_file(path) catch {
      err => fatal("failed to remove \{path}: \{debug_text(err)}")
    }
    println("removed \{path}")
  }
}

///|
fn existing_output_source(output_dir : String, name : String) -> String? {
  let path = @path.Path::join(output_dir, name).to_string()
  match read_existing_file(path) {
    Some(existing) => Some(existing)
    // First generation after a split-suite case moves (or the split itself
    // lands): carry snapshots over from the monolithic suite file.
    None =>
      match split_suite_prefix_of(name) {
        Some(prefix) =>
          read_existing_file(
            @path.Path::join(output_dir, legacy_suite_file_name(prefix)).to_string(),
          )
        None => None
      }
  }
}

///|
fn write_cram_files(output_dir : String, files : Array[CramFile]) -> Unit {
  ensure_dir_tree(output_dir)
  for file in files {
    let path = @path.Path::join(output_dir, file.name).to_string()
    let content = match existing_output_source(output_dir, file.name) {
      Some(existing) => preserve_expected_output(file.content, existing)
      None => file.content
    }
    write_generated_file_or_exit(path, content)
  }
  remove_stale_split_files(output_dir, files)
}

///|
fn without_program_name(args : Array[String]) -> Array[String] {
  let start = if args.length() == 0 { 0 } else { 1 }
  args[start:].to_owned()
}

///|
fn parse_args(args : Array[String]) -> Args raise {
  let repo_path_raw : Ref[String] = Ref("")
  let output_dir_raw : Ref[String] = Ref("")
  let repo_slug_raw : Ref[String] = Ref("")
  let test_repo_path_raw : Ref[String] = Ref("")
  let platform_raw : Ref[String] = Ref("unix")
  let max_per_file_raw : Ref[String] = Ref("50")
  let max_files_raw : Ref[String] = Ref("0")
  let max_file_size_raw : Ref[String] = Ref("102400")
  let spec = [
    ("repo", 'r', repo_path_raw, "Path to the MoonBit repository to scan"),
    (
      "output-dir", 'o', output_dir_raw, "Directory where generated Moon Cram markdown files are written",
    ),
    (
      "repo-slug", 's', repo_slug_raw, "Stable repository slug used in generated markdown titles",
    ),
    (
      "test-repo", 't', test_repo_path_raw, "Repository path embedded in generated tests; defaults to --repo",
    ),
    (
      "platform", 'p', platform_raw, "Generated test platform: unix or windows (default: unix)",
    ),
    (
      "max-per-file", 'm', max_per_file_raw, "Cap collected AST locations with --loc per source file (default: 50)",
    ),
    (
      "max-files", 'f', max_files_raw, "Cap sampled MoonBit source files per repository; 0 means no cap (default: 0)",
    ),
    (
      "max-file-size", 'z', max_file_size_raw, "Skip source files larger than this many characters; 0 means no limit (default: 102400)",
    ),
  ]
  let command = @argparse.Command(
    "testgen",
    options=spec.map(option => {
      let (name, short, _, about) = option
      @argparse.OptionArg(
        name,
        short~,
        long=name,
        about~,
        action=Append,
        allow_hyphen_values=true,
      )
    }),
  )
  let matches = command.parse(argv=args[:])
  for (name, _, destination, _) in spec {
    if matches.values.get(name) is Some([.., value]) {
      destination.val = value
    }
  }
  let max_per_file = @string.parse_int(max_per_file_raw.val) catch {
    _ =>
      raise ArgsError("invalid --max-per-file value: \{max_per_file_raw.val}")
  }
  let max_files = @string.parse_int(max_files_raw.val) catch {
    _ => raise ArgsError("invalid --max-files value: \{max_files_raw.val}")
  }
  let max_file_size = @string.parse_int(max_file_size_raw.val) catch {
    _ =>
      raise ArgsError("invalid --max-file-size value: \{max_file_size_raw.val}")
  }
  if repo_path_raw.val == "" {
    raise ArgsError("--repo is required")
  }
  if output_dir_raw.val == "" {
    raise ArgsError("--output-dir is required")
  }
  if repo_slug_raw.val == "" {
    raise ArgsError("--repo-slug is required")
  }
  if max_per_file < 0 {
    raise ArgsError("--max-per-file must be non-negative")
  }
  if max_files < 0 {
    raise ArgsError("--max-files must be non-negative")
  }
  if max_file_size < 0 {
    raise ArgsError("--max-file-size must be non-negative")
  }
  let platform = match platform_raw.val {
    "unix" => TestPlatform::Unix
    "windows" => TestPlatform::Windows
    other =>
      raise ArgsError(
        "invalid --platform value: \{other}; expected unix or windows",
      )
  }
  let test_repo_path = if test_repo_path_raw.val == "" {
    repo_path_raw.val
  } else {
    test_repo_path_raw.val
  }
  Args::{
    repo_path: repo_path_raw.val,
    output_dir: output_dir_raw.val,
    repo_slug: repo_slug_raw.val,
    test_repo_path,
    platform,
    max_per_file,
    max_files,
    max_file_size,
  }
}

///|
fn run(args : Array[String]) -> Unit {
  let config = parse_args(args) catch {
    ArgsError(message) => {
      fatal(message)
      return
    }
    err => {
      fatal(err.to_string())
      return
    }
  }
  ensure_repo_dir(config.repo_path)
  let result = collect_cases(
    config.repo_path,
    config.repo_slug,
    config.max_per_file,
    config.max_files,
    config.max_file_size,
    platform=config.platform,
  )
  let files = render_cram_files(
    result,
    config.repo_slug,
    config.test_repo_path,
    config.platform,
  )
  write_cram_files(config.output_dir, files)
}

///|
pub fn run_cli(args : Array[String]) -> Unit {
  run(without_program_name(args))
}
