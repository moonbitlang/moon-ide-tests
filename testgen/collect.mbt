///|
fn should_keep_symbol(sym : String) -> Bool {
  if not(sym lexmatch? "[A-Za-z_][A-Za-z0-9_]*") {
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
priv struct HoverCollector {
  file : String
  max_per_file : Int
  out : Array[TestCase]
  seen : @hashset.HashSet[TestCase]
  count : Ref[Int]
}

///|
fn HoverCollector::append_symbol(
  self : HoverCollector,
  sym : String,
  line : Int,
  col : Int,
) -> Unit {
  if not(should_keep_symbol(sym)) {
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
fn HoverCollector::append_from_loc(
  self : HoverCollector,
  sym : String,
  loc : @basic.Location,
) -> Unit {
  let line = loc.start.lnum
  let col = loc.start.column()
  self.append_symbol(sym, line, col)
}

///|
fn HoverCollector::append_from_long_ident(
  self : HoverCollector,
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
impl @syntax.IterVisitor for HoverCollector

///|
impl @syntax.IterVisitor for HoverCollector with visit_Binder(env, binder) {
  env.append_from_loc(binder.name, binder.loc)
}

///|
impl @syntax.IterVisitor for HoverCollector with visit_FieldName(
  env,
  field_name,
) {
  env.append_from_loc(field_name.label, field_name.loc)
}

///|
impl @syntax.IterVisitor for HoverCollector with visit_Label(env, label) {
  env.append_from_loc(label.name, label.loc)
}

///|
impl @syntax.IterVisitor for HoverCollector with visit_TypeDeclBinder(
  env,
  type_decl_binder,
) {
  if type_decl_binder.name is Some(name) {
    env.append_from_loc(name, type_decl_binder.loc)
  }
}

///|
impl @syntax.IterVisitor for HoverCollector with visit_TypeDecl(env, type_decl) {
  env.append_from_loc(type_decl.tycon, type_decl.tycon_loc)
  type_decl.params.each(x => env.visit_TypeDeclBinder(x))
  env.visit_TypeDesc(type_decl.components)
  type_decl.deriving.each(x => env.visit_DerivingDirective(x))
  env.visit_Visibility(type_decl.type_vis)
}

///|
impl @syntax.IterVisitor for HoverCollector with visit_Var(env, var_) {
  env.append_from_long_ident(var_.name, var_.loc)
}

///|
impl @syntax.IterVisitor for HoverCollector with visit_TypeName(env, type_name) {
  env.append_from_long_ident(type_name.name, type_name.loc)
}

///|
impl @syntax.IterVisitor for HoverCollector with visit_ConstrId(env, constr_id) {
  env.append_from_long_ident(constr_id.id, constr_id.loc)
}

///|
impl @syntax.IterVisitor for HoverCollector with visit_ConstrDecl(
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
impl @syntax.IterVisitor for HoverCollector with visit_Constructor(
  env,
  constructor_,
) {
  env.append_from_loc(constructor_.name.name, constructor_.name.loc)
  env.visit_ConstructorExtraInfo(constructor_.extra_info)
}

///|
impl @syntax.IterVisitor for HoverCollector with visit_Accessor_Label(
  env,
  label,
) {
  env.append_from_loc(label.name, label.loc)
}

///|
impl @syntax.IterVisitor for HoverCollector with visit_Expr_DotApply(
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
fn long_ident_tail(long_ident : @syntax.LongIdent) -> String {
  match long_ident {
    @syntax.LongIdent::Ident(name~) => name
    @syntax.LongIdent::Dot(pkg~, id~) => {
      ignore(pkg)
      id
    }
  }
}

///|
fn type_to_query(ty : @syntax.Type) -> String? {
  match ty {
    @syntax.Type::Any(..) | @syntax.Type::Arrow(..) => None
    @syntax.Type::Tuple(tys~, ..) => {
      let parts = Array::new()
      for item in tys {
        match type_to_query(item) {
          Some(part) => parts.push(part)
          None => return None
        }
      }
      let joined = parts.join(", ")
      Some("(\{joined})")
    }
    @syntax.Type::Name(constr_id~, tys~, ..) => {
      let base = long_ident_tail(constr_id.id)
      if tys.is_empty() {
        Some(base)
      } else {
        let args = Array::new()
        for item in tys {
          match type_to_query(item) {
            Some(part) => args.push(part)
            None => return None
          }
        }
        let joined = args.join(", ")
        Some("\{base}[\{joined}]")
      }
    }
    @syntax.Type::Option(ty~, ..) =>
      match type_to_query(ty) {
        Some(name) => Some("\{name}?")
        None => None
      }
    @syntax.Type::Object(constr_id) => Some(long_ident_tail(constr_id.id))
  }
}

///|
fn make_toplevel_case(
  file : String,
  query : String,
  rename_sym : String,
  loc : @basic.Location,
) -> ToplevelCase {
  let col = loc.start.column()
  let normalized_col = if col <= 0 { 1 } else { col }
  ToplevelCase::{
    file,
    line: loc.start.lnum,
    col: normalized_col,
    query,
    rename_sym,
  }
}

///|
fn render_toplevel_cases(
  file : String,
  impl_ : @syntax.Impl,
) -> Array[ToplevelCase] {
  let queries = Array::new()
  match impl_ {
    @syntax.Impl::TopTypeDef(type_decl) =>
      queries.push(
        make_toplevel_case(
          file,
          type_decl.tycon,
          type_decl.tycon,
          type_decl.tycon_loc,
        ),
      )
    @syntax.Impl::TopFuncDef(fun_decl~, ..) => {
      let func_name = fun_decl.name.name
      match fun_decl.type_name {
        Some(type_name) =>
          queries.push(
            make_toplevel_case(
              file,
              "\{long_ident_tail(type_name.name)}::\{func_name}",
              func_name,
              fun_decl.name.loc,
            ),
          )
        None =>
          queries.push(
            make_toplevel_case(file, func_name, func_name, fun_decl.name.loc),
          )
      }
    }
    @syntax.Impl::TopLetDef(binder~, ..) =>
      queries.push(
        make_toplevel_case(file, binder.name, binder.name, binder.loc),
      )
    @syntax.Impl::TopTrait(trait_decl) =>
      queries.push(
        make_toplevel_case(
          file,
          trait_decl.name.name,
          trait_decl.name.name,
          trait_decl.name.loc,
        ),
      )
    @syntax.Impl::TopImpl(self_ty~, trait_~, method_name~, ..) => {
      let trait_name = long_ident_tail(trait_.name)
      let meth = method_name.name
      match self_ty {
        None =>
          queries.push(
            make_toplevel_case(
              file,
              "\{trait_name}::\{meth}",
              meth,
              method_name.loc,
            ),
          )
        Some(ty) =>
          match type_to_query(ty) {
            Some(type_name) =>
              queries.push(
                make_toplevel_case(
                  file,
                  "\{trait_name}::\{meth} for \{type_name}",
                  meth,
                  method_name.loc,
                ),
              )
            None => ()
          }
      }
    }
    @syntax.Impl::TopView(view_type_name~, view_type_loc~, view_func_name~, ..) => {
      queries.push(
        make_toplevel_case(file, view_type_name, view_type_name, view_type_loc),
      )
      queries.push(
        make_toplevel_case(
          file,
          view_func_name.name,
          view_func_name.name,
          view_func_name.loc,
        ),
      )
    }
    @syntax.Impl::TopUsing(names~, ..) =>
      for pair in names {
        let binder = pair.0.binder
        queries.push(
          make_toplevel_case(file, binder.name, binder.name, binder.loc),
        )
      }
    _ => ()
  }
  queries
}

///|
fn collect_toplevel_symbols(
  file : String,
  impls : @syntax.Impls,
) -> Array[ToplevelCase] {
  let symbols = Array::new()
  let seen : @hashset.HashSet[ToplevelCase] = @hashset.HashSet::new()
  for impl_ in impls {
    for test_case in render_toplevel_cases(file, impl_) {
      if test_case.query is "" {
        continue
      }
      if not(should_keep_symbol(test_case.rename_sym)) {
        continue
      }
      if seen.contains(test_case) {
        continue
      }
      seen.add(test_case)
      symbols.push(test_case)
    }
  }
  symbols
}

///|
fn collect_hover_cases(
  file : String,
  impls : @syntax.Impls,
  max_per_file : Int,
) -> Array[TestCase] {
  let cases = Array::new()
  let seen : @hashset.HashSet[TestCase] = @hashset.HashSet::new()
  let collector = HoverCollector::{
    file,
    max_per_file,
    out: cases,
    seen,
    count: Ref::new(0),
  }
  for impl_ in impls {
    collector.visit_Impl(impl_)
  }
  cases
}

///|
fn collect_cases_for_text(
  file : String,
  text : String,
  max_per_file : Int,
) -> CollectResult {
  let (impls, reports) = @parser.parse_string(text, name=file)
  ignore(reports)
  let hover_cases = collect_hover_cases(file, impls, max_per_file)
  let toplevel_symbols = collect_toplevel_symbols(file, impls)
  CollectResult::{ source_files: [file], hover_cases, toplevel_symbols }
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
fn walk_dir(
  abs_dir : String,
  rel_dir : String,
  out : Array[String],
  max_files : Int,
) -> Unit {
  if max_files > 0 && out.length() >= max_files {
    return
  }
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
      if not(should_skip_dir(name)) {
        walk_dir(abs_path, rel_path, out, max_files)
      }
      continue
    }
    if max_files > 0 && out.length() >= max_files {
      return
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
fn collect_files(project_root : String, max_files : Int) -> Array[String] {
  let files = Array::new()
  walk_dir(project_root, "", files, max_files)
  files
}

///|
fn collect_cases(
  project_root : String,
  max_per_file : Int,
  max_files : Int,
  max_toplevel : Int,
) -> CollectResult {
  let source_files = collect_files(project_root, max_files)
  let hover_cases = Array::new()
  let toplevel_symbols = Array::new()
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
        for test_case in result.hover_cases {
          hover_cases.push(test_case)
        }
        for test_case in result.toplevel_symbols {
          if max_toplevel > 0 && toplevel_symbols.length() >= max_toplevel {
            break
          }
          toplevel_symbols.push(test_case)
        }
      }
      None => ()
    }
  }
  CollectResult::{ source_files, hover_cases, toplevel_symbols }
}
