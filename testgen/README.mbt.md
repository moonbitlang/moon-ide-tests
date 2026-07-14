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
- `outline` is generated per `.mbt` file and does not depend on parser output.
- Every generated file normalizes `MOON_HOME` and the test repository root in `moon ide` output.
- Generated Unix tests are self-contained and locate their fixture repository relative to `$TESTDIR`, so they can be run with plain `moon cram test --cram-compat tests/unix`.
- Generated Windows tests use PowerShell syntax and should be run with `moon cram test --cram-compat --no-keep-output-crlf --shell scripts/moon-cram-powershell.cmd tests/windows`.
