///|
priv struct Args {
  repo_path : String
  output_dir : String
  repo_slug : String
  max_per_file : Int
  max_files : Int
  max_toplevel : Int
}

///|
fn fatal(message : String) -> Unit {
  println("Error: \{message}")
  @sys.exit(1)
}

///|
fn write_generated_file_or_exit(path : String, content : String) -> Unit {
  @fs.write_string_to_file(path, content) catch {
    err => fatal("failed to write \{path}: \{err}")
  }
  println("generated \{path}")
}

///|
fn ensure_dir(path : String) -> Unit {
  if @fs.path_exists(path) {
    let is_dir = @fs.is_dir(path) catch {
      err => {
        fatal("failed to check \{path}: \{err}")
        false
      }
    }
    if !is_dir {
      fatal("\{path} exists but is not a directory")
    }
  } else {
    @fs.create_dir(path) catch {
      err => fatal("failed to create \{path}: \{err}")
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
fn read_existing_file(path : String) -> String? {
  try @fs.read_file_to_string(path) catch {
    _ => None
  } noraise {
    text => Some(text)
  }
}

///|
fn write_cram_files(output_dir : String, files : Array[CramFile]) -> Unit {
  ensure_dir_tree(output_dir)
  for file in files {
    let path = @path.Path::join(output_dir, file.name).to_string()
    let content = match read_existing_file(path) {
      Some(existing) => preserve_expected_output(file.content, existing)
      None => file.content
    }
    write_generated_file_or_exit(path, content)
  }
}

///|
fn without_program_name(args : Array[String]) -> Array[String] {
  let start = if args.length() == 0 { 0 } else { 1 }
  args[start:].to_array()
}

///|
fn parse_args(args : Array[String]) -> Args {
  let repo_path_raw : Ref[String] = Ref::new("")
  let output_dir_raw : Ref[String] = Ref::new("")
  let repo_slug_raw : Ref[String] = Ref::new("")
  let max_per_file_raw : Ref[String] = Ref::new("50")
  let max_files_raw : Ref[String] = Ref::new("0")
  let max_toplevel_raw : Ref[String] = Ref::new("20")
  let spec = [
    (
      "--repo",
      "-r",
      @arg_parser.Spec::Set_string(repo_path_raw),
      "Path to the MoonBit repository to scan",
    ),
    (
      "--output-dir",
      "-o",
      @arg_parser.Spec::Set_string(output_dir_raw),
      "Directory where generated Moon Cram markdown files are written",
    ),
    (
      "--repo-slug",
      "-s",
      @arg_parser.Spec::Set_string(repo_slug_raw),
      "Stable repository slug used in generated markdown titles",
    ),
    (
      "--max-per-file",
      "-m",
      @arg_parser.Spec::Set_string(max_per_file_raw),
      "Cap collected AST locations with --loc per source file (default: 50)",
    ),
    (
      "--max-files",
      "-f",
      @arg_parser.Spec::Set_string(max_files_raw),
      "Cap scanned MoonBit source files per repository; 0 means no cap (default: 0)",
    ),
    (
      "--max-toplevel",
      "-t",
      @arg_parser.Spec::Set_string(max_toplevel_raw),
      "Cap generated top-level symbol query commands per repository; 0 means no cap (default: 20)",
    ),
  ]
  @arg_parser.parse(
    spec,
    arg => fatal("unexpected positional argument: \{arg}"),
    "Usage: testgen --repo <path> --output-dir <dir> --repo-slug <slug> [options]",
    args,
  ) catch {
    @arg_parser.ErrorMsg(message) => fatal(message)
    err => fatal("\{err}")
  }
  let max_per_file = @strconv.parse_int(max_per_file_raw.val) catch {
    _ => {
      fatal("invalid --max-per-file value: \{max_per_file_raw.val}")
      0
    }
  }
  let max_files = @strconv.parse_int(max_files_raw.val) catch {
    _ => {
      fatal("invalid --max-files value: \{max_files_raw.val}")
      0
    }
  }
  let max_toplevel = @strconv.parse_int(max_toplevel_raw.val) catch {
    _ => {
      fatal("invalid --max-toplevel value: \{max_toplevel_raw.val}")
      0
    }
  }
  if repo_path_raw.val == "" {
    fatal("--repo is required")
  }
  if output_dir_raw.val == "" {
    fatal("--output-dir is required")
  }
  if repo_slug_raw.val == "" {
    fatal("--repo-slug is required")
  }
  if max_per_file < 0 {
    fatal("--max-per-file must be non-negative")
  }
  if max_files < 0 {
    fatal("--max-files must be non-negative")
  }
  if max_toplevel < 0 {
    fatal("--max-toplevel must be non-negative")
  }
  Args::{
    repo_path: repo_path_raw.val,
    output_dir: output_dir_raw.val,
    repo_slug: repo_slug_raw.val,
    max_per_file,
    max_files,
    max_toplevel,
  }
}

///|
fn run(args : Array[String]) -> Unit {
  let config = parse_args(args)
  let result = collect_cases(
    config.repo_path,
    config.max_per_file,
    config.max_files,
    config.max_toplevel,
  )
  let files = render_cram_files(result, config.repo_slug)
  write_cram_files(config.output_dir, files)
}

///|
fn main {
  run(without_program_name(@env.args()))
}
