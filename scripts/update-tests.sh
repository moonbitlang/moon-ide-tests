#!/usr/bin/env bash
set -euo pipefail

if (( $# != 0 )); then
  echo "Usage: $0" >&2
  exit 2
fi

ROOT="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
"$ROOT/scripts/run-moon-check.sh"

while IFS=$'\t' read -r slug path max_files max_per_file; do
  unix_out_dir="$ROOT/tests/unix/$slug"
  mkdir -p "$unix_out_dir"
  moon -C "$ROOT/testgen" run --target wasm cmd/main -- \
    --repo "$ROOT/$path" \
    --output-dir "$unix_out_dir" \
    --repo-slug "$slug" \
    --test-repo "$path" \
    --platform unix \
    --max-files "$max_files" \
    --max-per-file "$max_per_file"
done < "$ROOT/.daily-test/unix-compatible-fixtures.tsv"
