# testgen

`testgen` generates Moon Cram markdown snapshots for `moon ide` from a MoonBit project.

Generated suites:
- `outline.mooncram.md`
- `hover.mooncram.md`
- `peek-def.mooncram.md`
- `find-references.mooncram.md`
- `rename.mooncram.md`

Generated files are written to the configured output directory.

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
- `--max-files <n>`: max scanned `.mbt` files; `0` means no cap (default: `0`)

## Notes

- The tool scans `.mbt` files recursively under project root.
- `_build`, `target`, and `node_modules` are skipped.
- Symbol collection is AST-based (`moonbitlang/parser/syntax` visitor), not string scanning.
- Parser diagnostics are printed to the generation log and do not change generated files.
- `hover`, `peek-def`, `find-references`, and `rename` share one location-based case collection (`--loc`).
- `main` function symbols are excluded from collection.
- `outline` is generated per `.mbt` file and does not depend on parser output.
- Every generated file normalizes `MOON_HOME` and the test repository root in `moon ide` output.
- Generated Unix tests are self-contained and locate their fixture repository relative to `$TESTDIR`, so they can be run with plain `moon cram test --cram-compat tests/unix`.
- Generated Windows tests use PowerShell syntax and should be run with `moon cram test --cram-compat --no-keep-output-crlf --shell scripts/moon-cram-powershell.cmd tests/windows`.
