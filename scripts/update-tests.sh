#!/usr/bin/env bash
set -euo pipefail

ROOT="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
"$ROOT/scripts/run-moon-check.sh"

while IFS=$'\t' read -r slug path max_files max_per_file; do
  moon -C "$ROOT/testgen" run --target wasm cmd/main -- \
    --repo "$ROOT/$path" \
    --output-dir "$ROOT/tests/unix/$slug" \
    --repo-slug "$slug" \
    --platform unix \
    --max-files "$max_files" \
    --max-per-file "$max_per_file"
done < "$ROOT/.daily-test/unix-compatible-fixtures.tsv"
