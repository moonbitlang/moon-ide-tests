///|
fn should_keep_symbol(sym : String) -> Bool {
  if !(sym =~ re"[A-Za-z_][A-Za-z0-9_]*") {
    false
  } else {
    // Keep in sync with prelude/builtin symbols that should not become ide test targets.
    match sym {
      "main"
      | "Self"
      // Prelude values
      | "abort"
      | "assert_eq"
      | "assert_false"
      | "assert_not_eq"
      | "assert_true"
      | "debug"
      | "debug_inspect"
      | "dump"
      | "fail"
      | "ignore"
      | "inspect"
      | "json_inspect"
      | "not"
      | "null"
      | "panic"
      | "physical_equal"
      | "println"
      | "repr"
      | "tap"
      | "then"
      // Prelude types
      | "ArgsLoc"
      | "Array"
      | "ArrayView"
      | "BigInt"
      | "Failure"
      | "Hasher"
      | "InspectError"
      | "Iter"
      | "Iter2"
      | "IterResult"
      | "Iterator"
      | "Iterator2"
      | "Json"
      | "Map"
      | "MutArrayView"
      | "Repr"
      | "Set"
      | "SnapshotError"
      | "SourceLoc"
      | "StringBuilder"
      | "UninitializedArray"
      // Prelude traits
      | "Add"
      | "BitAnd"
      | "BitOr"
      | "BitXOr"
      | "Compare"
      | "Debug"
      | "Default"
      | "Div"
      | "Eq"
      | "FromJson"
      | "Hash"
      | "Logger"
      | "Mod"
      | "Mul"
      | "Neg"
      | "Shl"
      | "Show"
      | "Shr"
      | "Sub"
      | "ToJson"
      // Compiler builtins and constructors
      | "Unit"
      | "Bool"
      | "Char"
      | "Byte"
      | "Int16"
      | "UInt16"
      | "Int"
      | "Int64"
      | "UInt"
      | "UInt64"
      | "Float"
      | "Double"
      | "String"
      | "Bytes"
      | "Ref"
      | "FixedArray"
      | "ReadonlyArray"
      | "MaybeUninit"
      | "FuncRef"
      | "StringView"
      | "BytesView"
      | "Option"
      | "Result"
      | "Error"
      | "Some"
      | "None"
      | "Ok"
      | "Err" => false
      _ => true
    }
  }
}

///|
priv struct LocCollector {
  file : String
  max_per_file : Int
  out : Array[TestCase]
  seen : @hashset.HashSet[TestCase]
  count : Ref[Int]
}

///|
fn LocCollector::append_symbol(
  self : LocCollector,
  sym : String,
  line : Int,
  col : Int,
) -> Unit {
  if !should_keep_symbol(sym) {
    return
  }
  if self.count.val >= self.max_per_file {
    return
  }
  let normalized_col = if col <= 0 { 1 } else { col }
  let test_case = TestCase::{ file: self.file, line, col: normalized_col, sym }
  if self.seen.contains(test_case) {
    return
  }
  self.seen.add(test_case)
  self.out.push(test_case)
  self.count.val = self.count.val + 1
}

///|
fn LocCollector::append_from_loc(
  self : LocCollector,
  sym : String,
  loc : @basic.Location,
) -> Unit {
  let line = loc.start.lnum
  let col = loc.start.column()
  self.append_symbol(sym, line, col)
}

///|
fn LocCollector::append_from_long_ident(
  self : LocCollector,
  long_ident : @syntax.LongIdent,
  loc : @basic.Location,
) -> Unit {
  match long_ident {
    @syntax.LongIdent::Ident(name~) => self.append_from_loc(name, loc)
    @syntax.LongIdent::Dot(pkg~, id~) => {
      ignore(pkg)
      let line = loc.end.lnum
      let col = loc.end.column() - id.length()
      self.append_symbol(id, line, col)
    }
  }
}

///|
impl @syntax.IterVisitor for LocCollector

///|
impl @syntax.IterVisitor for LocCollector with fn visit_Binder(env, binder) {
  env.append_from_loc(binder.name, binder.loc)
}

///|
impl @syntax.IterVisitor for LocCollector with fn visit_FieldName(
  env,
  field_name,
) {
  env.append_from_loc(field_name.label, field_name.loc)
}

///|
impl @syntax.IterVisitor for LocCollector with fn visit_Label(env, label) {
  env.append_from_loc(label.name, label.loc)
}

///|
impl @syntax.IterVisitor for LocCollector with fn visit_TypeDeclBinder(
  env,
  type_decl_binder,
) {
  ignore(env)
  ignore(type_decl_binder)
}

///|
impl @syntax.IterVisitor for LocCollector with fn visit_TypeDecl(env, type_decl) {
  if should_collect_type_decl(type_decl.components) {
    env.append_from_loc(type_decl.tycon, type_decl.tycon_loc)
  }
  ignore(type_decl.params)
  env.visit_TypeDesc(type_decl.components)
  type_decl.deriving.each(x => env.visit_DerivingDirective(x))
  env.visit_Visibility(type_decl.type_vis)
}

///|
fn should_collect_type_decl(type_desc : @syntax.TypeDesc) -> Bool {
  match type_desc {
    @syntax.TypeDesc::Alias(_) | @syntax.TypeDesc::Abstract => false
    _ => true
  }
}

///|
impl @syntax.IterVisitor for LocCollector with fn visit_Impl_TopUsing(
  env,
  pkg~,
  names~,
  vis~,
  attrs~,
  loc~,
  doc~,
) {
  ignore(pkg)
  ignore(vis)
  ignore(attrs)
  ignore(loc)
  ignore(doc)
  for pair in names {
    env.visit_AliasTarget(pair.0)
    env.visit_UsingKind(pair.1)
  }
}

///|
impl @syntax.IterVisitor for LocCollector with fn visit_Var(env, var_) {
  env.append_from_long_ident(var_.name, var_.loc)
}

///|
impl @syntax.IterVisitor for LocCollector with fn visit_TypeName(env, type_name) {
  env.append_from_long_ident(type_name.name, type_name.loc)
}

///|
impl @syntax.IterVisitor for LocCollector with fn visit_ConstrId(env, constr_id) {
  env.append_from_long_ident(constr_id.id, constr_id.loc)
}

///|
impl @syntax.IterVisitor for LocCollector with fn visit_ConstrDecl(
  env,
  constr_decl,
) {
  env.append_from_loc(constr_decl.name.name, constr_decl.name.loc)
  match constr_decl.args {
    Some(args) => args.each(arg => env.visit_ConstrParam(arg))
    None => ()
  }
}

///|
impl @syntax.IterVisitor for LocCollector with fn visit_Constructor(
  env,
  constructor_,
) {
  env.append_from_loc(constructor_.name.name, constructor_.name.loc)
  env.visit_ConstructorExtraInfo(constructor_.extra_info)
}

///|
impl @syntax.IterVisitor for LocCollector with fn visit_Accessor_Label(
  env,
  label,
) {
  env.append_from_loc(label.name, label.loc)
}

///|
impl @syntax.IterVisitor for LocCollector with fn visit_Expr_DotApply(
  env,
  self~,
  method_name~,
  args~,
  return_self~,
  loc~,
) {
  ignore(return_self)
  ignore(loc)
  env.append_from_loc(method_name.name, method_name.loc)
  env.visit_Expr(self)
  args.each(arg => env.visit_Argument(arg))
}

///|
fn collect_loc_cases(
  file : String,
  impls : @syntax.Impls,
  max_per_file : Int,
) -> Array[TestCase] {
  let cases = Array::new()
  let seen : @hashset.HashSet[TestCase] = @hashset.HashSet([])
  let collector = LocCollector::{
    file,
    max_per_file,
    out: cases,
    seen,
    count: Ref(0),
  }
  for impl_ in impls {
    collector.visit_Impl(impl_)
  }
  cases
}

///|
fn parser_report_lines(
  file : String,
  reports : Array[@basic.Report],
) -> Array[String] {
  let lines = Array::new()
  if reports.length() == 0 {
    return lines
  }
  let plural = if reports.length() == 1 { "report" } else { "reports" }
  lines.push(
    "testgen: parser emitted \{reports.length()} \{plural} for \{file}",
  )
  for report in reports {
    lines.push("testgen:   \{report.to_string()}")
  }
  lines
}

///|
fn emit_parser_reports(file : String, reports : Array[@basic.Report]) -> Unit {
  for line in parser_report_lines(file, reports) {
    println(line)
  }
}

///|
fn collect_cases_for_text(
  file : String,
  text : String,
  max_per_file : Int,
) -> CollectResult {
  let (impls, reports) = @parser.parse_string(text, name=file)
  emit_parser_reports(file, reports)
  let loc_cases = collect_loc_cases(file, impls, max_per_file)
  CollectResult::{ source_files: [file], loc_cases }
}

///|
fn should_skip_dir(name : String) -> Bool {
  match name {
    "_build"
    | "target"
    | "node_modules"
    | ".mooncakes"
    | ".moonagent"
    | ".repo"
    | ".git" => true
    _ => false
  }
}

///|
fn walk_dir(abs_dir : String, rel_dir : String, out : Array[String]) -> Unit {
  let entries = try @fs.read_dir(abs_dir) catch {
    _ => []
  } noraise {
    values => values
  }
  entries.sort()
  for name in entries {
    let abs_path = @path.Path::join(abs_dir, name).to_string()
    let rel_path = if rel_dir is "" {
      name
    } else {
      @path.Path::join(rel_dir, name).to_string()
    }
    let is_dir = try @fs.is_dir(abs_path) catch {
      _ => false
    } noraise {
      value => value
    }
    if is_dir {
      if !should_skip_dir(name) {
        walk_dir(abs_path, rel_path, out)
      }
      continue
    }
    let is_file = try @fs.is_file(abs_path) catch {
      _ => false
    } noraise {
      value => value
    }
    if is_file && name.has_suffix(".mbt") {
      out.push(rel_path)
    }
  }
}

///|
/// String::replace only rewrites the first occurrence, so replace each
/// separator character individually: Windows relative paths contain one
/// backslash per directory level.
fn normalize_separators(path : String) -> String {
  let sb = StringBuilder::new()
  for ch in path {
    if ch == '\\' {
      sb.write_char('/')
    } else {
      sb.write_char(ch)
    }
  }
  sb.to_string()
}

///|
/// FNV-1a hash of the slug-seeded, separator-normalized relative path.
/// Selection must be identical across platforms and independent of
/// directory read order, so it may depend only on the file set itself.
fn selection_key(seed : String, rel_path : String) -> UInt {
  let mut hash : UInt = 2166136261
  fn mix(text : String) -> Unit {
    for ch in text {
      hash = (hash ^ ch.to_int().reinterpret_as_uint()) * 16777619
    }
  }

  mix(seed)
  mix("|")
  mix(normalize_separators(rel_path))
  hash
}

///|
/// Character-wise path comparison. The default String order compares
/// length first, which scatters files from one directory across the
/// generated suites; this keeps them grouped.
fn compare_paths(left : String, right : String) -> Int {
  let a = normalize_separators(left)
  let b = normalize_separators(right)
  let shorter = if a.length() < b.length() { a.length() } else { b.length() }
  for i in 0..<shorter {
    let diff = a[i].to_int() - b[i].to_int()
    if diff != 0 {
      return diff
    }
  }
  a.length() - b.length()
}

///|
fn select_files(
  files : Array[String],
  seed : String,
  max_files : Int,
  skip? : (String) -> Bool = _ => false,
) -> Array[String] {
  files.sort_by_key(rel_path => {
    (selection_key(seed, rel_path), normalize_separators(rel_path))
  })
  let selected = Array::new()
  for rel_path in files {
    if max_files > 0 && selected.length() >= max_files {
      break
    }
    if !skip(rel_path) {
      selected.push(rel_path)
    }
  }
  selected.sort_by(compare_paths)
  selected
}

///|
/// CRLF-insensitive character count, so Windows checkouts measure the
/// same size as Unix ones and both platforms skip the same files.
fn normalized_char_count(text : String) -> Int {
  let mut count = 0
  for ch in text {
    if ch != '\r' {
      count += 1
    }
  }
  count
}

///|
fn collect_files(
  project_root : String,
  seed : String,
  max_files : Int,
  max_file_size : Int,
) -> Array[String] {
  let files = Array::new()
  walk_dir(project_root, "", files)
  select_files(files, seed, max_files, skip=rel_path => {
    if max_file_size <= 0 {
      return false
    }
    let abs_path = @path.Path::join(project_root, rel_path).to_string()
    let text = try @fs.read_file_to_string(abs_path) catch {
      _ => return false
    } noraise {
      text => text
    }
    let size = normalized_char_count(text)
    if size > max_file_size {
      println(
        "testgen: skipped \{rel_path} (\{size} chars exceeds --max-file-size \{max_file_size})",
      )
      true
    } else {
      false
    }
  })
}

///|
fn collect_cases(
  project_root : String,
  seed : String,
  max_per_file : Int,
  max_files : Int,
  max_file_size : Int,
) -> CollectResult {
  let source_files = collect_files(project_root, seed, max_files, max_file_size)
  let loc_cases = Array::new()
  for rel_path in source_files {
    let abs_path = @path.Path::join(project_root, rel_path).to_string()
    let maybe_text = try @fs.read_file_to_string(abs_path) catch {
      _ => None
    } noraise {
      text => Some(text)
    }
    match maybe_text {
      Some(text) => {
        let result = collect_cases_for_text(rel_path, text, max_per_file)
        for test_case in result.loc_cases {
          loc_cases.push(test_case)
        }
      }
      None => ()
    }
  }
  CollectResult::{ source_files, loc_cases }
}
