///|
priv struct Args {
  project_root : String
  max_per_file : Int
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
fn write_cram_files(project_root : String, files : Array[CramFile]) -> Unit {
  for file in files {
    let path = @path.Path::join(project_root, file.name).to_string()
    write_generated_file_or_exit(path, file.content)
  }
}

///|
fn without_program_name(args : Array[String]) -> Array[String] {
  let start = if args.length() == 0 { 0 } else { 1 }
  args[start:].to_array()
}

///|
fn parse_args(args : Array[String]) -> Args {
  let project_root = match @env.current_dir() {
    Some(dir) => dir
    None => "."
  }
  let max_per_file_raw : Ref[String] = Ref::new("50")
  let project_arg : Ref[String?] = Ref::new(None)
  let spec = [
    (
      "--max-per-file",
      "-m",
      @arg_parser.Spec::Set_string(max_per_file_raw),
      "Cap collected AST locations with --loc per source file (default: 50)",
    ),
  ]
  @arg_parser.parse(
    spec,
    arg => {
      if arg.has_prefix("-") {
        fatal("unknown flag: \{arg}")
      }
      match project_arg.val {
        None => project_arg.val = Some(arg)
        Some(_) => fatal("unexpected positional argument: \{arg}")
      }
    },
    "Usage: testgen [options] [project]",
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
  Args::{
    project_root: match project_arg.val {
      Some(root) => root
      None => project_root
    },
    max_per_file,
  }
}

///|
fn ensure_dune_file(project_root : String) -> Unit {
  let dune_path = @path.Path::join(project_root, "dune").to_string()
  if @fs.path_exists(dune_path) {
    let is_file = @fs.is_file(dune_path) catch {
      err => {
        fatal("failed to check \{dune_path}: \{err}")
        false
      }
    }
    if not(is_file) {
      fatal("\{dune_path} exists but is not a file")
    }
  } else {
    let dune_content =
      #|(cram
      #| (deps
      #|  (source_tree .)))
      #|
    write_generated_file_or_exit(dune_path, dune_content)
  }
}

///|
fn run(args : Array[String]) -> Unit {
  let config = parse_args(args)
  ensure_dune_file(config.project_root)
  let result = collect_cases(config.project_root, config.max_per_file)
  let files = render_cram_files(result)
  write_cram_files(config.project_root, files)
}

///|
fn main {
  run(without_program_name(@env.args()))
}
