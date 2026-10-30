# testgen

`testgen` generates Moon Cram markdown snapshots for `moon ide` from a MoonBit project.

Generated suites:
- `outline.mooncram.md`
- `hover.mooncram.md`
- `peek-def.mooncram.md`
- `find-references-<file>-<line>-<col>-<sym>.mooncram.md` (one file per test case)
- `rename-<file>-<line>-<col>-<sym>.mooncram.md` (one file per test case)

Generated files are written to the configured output directory.

`find-references` and `rename` output can list every reference in the
repository, so a monolithic suite file grows past what Moon Cram's markdown
parser handles (~190 KB overflows its stack on Windows). These two suites are
emitted as one `.mooncram.md` per test case; path separators and `:` in the
case location are replaced with `-` in the file name. On regeneration, stale
per-case files (and the pre-split monolithic `find-references.mooncram.md` /
`rename.mooncram.md`, after migrating their snapshots) are removed from the
output directory.

## Usage

Run from this repository root:

```sh
moon -C testgen run --target wasm cmd/main -- \
  --repo "$PWD/fixtures/repos/argparser" \
  --output-dir "$PWD/tests/unix/argparser" \
  --repo-slug argparser \
  --test-repo fixtures/repos/argparser \
  --platform unix
```

## Options

- `--repo <path>`: project root to scan
- `--output-dir <path>`: directory for generated Moon Cram files
- `--repo-slug <slug>`: stable name used in generated markdown titles
- `--test-repo <path>`: repository path embedded in generated Moon Cram files; defaults to `--repo`
- `--platform <unix|windows>`: generated test shell platform (default: `unix`)
- `--max-per-file <n>`: max collected AST locations with `--loc` per source file (default: `50`)
- `--max-files <n>`: max sampled `.mbt` files; `0` means no cap (default: `0`)
- `--max-file-size <n>`: skip source files larger than `n` characters; `0`
  means no limit (default: `102400`)

## Notes

- The tool scans `.mbt` files recursively under project root.
- When `--max-files` caps the scan, files are sampled pseudo-randomly but
  deterministically: candidates are ranked by an FNV-1a hash of the repo slug
  and the separator-normalized relative path, the first `n` are kept, and the
  selection is emitted in path order. The same repository state and slug always
  select the same files on every platform, independent of directory read order.
- Files over `--max-file-size` are skipped with a log line and their slot goes
  to the next-ranked candidate. This keeps huge generated sources (for example
  json's `json_testsuite_manifest.mbt`) from blowing the parser visitor stack.
  The size is a CRLF-insensitive character count, so Unix and Windows
  checkouts of the same commit skip the same files.
- `_build`, `target`, and `node_modules` are skipped.
- Symbol collection is AST-based (`moonbitlang/parser/syntax` visitor), not string scanning.
- Parser diagnostics are printed to the generation log and do not change generated files.
- `hover`, `peek-def`, `find-references`, and `rename` share one location-based case collection (`--loc`).
- `main` function symbols are excluded from collection.
- Prelude/compiler builtin symbols, including `Int32` and `UInt32`, are excluded
  before applying the per-file location limit.
- `policy.mbt` records explicit fixture exceptions by `--repo-slug` and normalized
  relative path. Rabbita's uninstantiated `warren/templates/` projects are excluded
  before sampling; their placeholder dependency versions are not runnable
  workspace packages. Similar-looking paths in other fixtures remain eligible.
- On Windows, async's `src/fs/named_pipe_test.mbt` and
  `src/internal/event_loop/io_unix.mbt` are also excluded before sampling: their
  first collected locations are POSIX-only `mkfifo` / `IoHandle::wait_read`
  declarations disabled by `#cfg(not(platform="windows"))`. The next eligible
  candidates fill their sample slots; Unix retains both files.
- Location queries use native for Rabbita's non-JS `host_ssr_wbtest.mbt`, JS for
  core's `encoding/utf8/decode_js.mbt`, and JS for async's pipe/socket
  `unimplemented.mbt` and `unimplemented_test.mbt` plus
  `src/tls/unimplemented_test.mbt` and
  `src/internal/event_loop/unimplemented_test.mbt`. Other files retain their
  project default backend. These policies intentionally do not reimplement
  moonbuild's workspace/target resolution; review them against fixture manifests
  when updating fixtures.
- Precise hover cases remain as IDE reproductions: core's extension
  declaration `test/extends.mbt` (`to_repr`), its intrinsic parameter
  `builtin/int64.mbt` (`self`), and Rabbita's imported trait in
  `rabbita/internal/vdom/vdom.mbt` (`Scheduler`) plus JSON's public imported trait
  in `src/top.mbt` (`Decode`). Each gets a descriptive note and
  `<!-- known-ide-limitation: ... -->` immediately before its command fence.
  Other locations and other IDE operations are unmarked. Their failed output is
  still captured so a future IDE fix is visible in the snapshots.
- The same annotation mechanism preserves extern declaration/parameter hover
  failures in core's `encoding/utf8/decode_js.mbt` and async's
  `src/fs/named_pipe_test.mbt` (Unix) and `src/internal/event_loop/stdio.mbt`.
  These functions and parameters still receive every navigation/rename query.
- Two sampled async names resolve into core dependencies (`parse_int` in
  `src/socket/unimplemented.mbt` and `encode` in `src/tls/unimplemented_test.mbt`).
  Their hover, definition, and reference queries remain; their rename commands
  are omitted because the IDE cannot rename symbols outside the workspace.
- `outline` is generated per `.mbt` file and does not depend on parser output.
- Every generated file normalizes `MOON_HOME` and the test repository root in `moon ide` output.
- Both platforms emit `moonx ../../../scripts/run-moon-ide.mbtx <fixture-dir> moon ide ...` in four-backtick Mooncram fences. Paths are relative to the Markdown document, with no shell state or expansion. The script launches the IDE directly, merges its output streams, normalizes repository/toolchain paths, and preserves the exit code.
- Run selected Unix or Windows paths with `moonx moonbit-community/mooncram@0.1.0 test <paths...>`. Use `check` to validate without executing, and `update` to refresh expectations. Generation preserves existing output, including JSON-escaped lines, nonzero exit codes, and the updater's fence lengths, when the command is unchanged.
