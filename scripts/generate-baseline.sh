#!/usr/bin/env bash
set -euo pipefail

ROOT="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"

while IFS=$'\t' read -r slug path _url _branch max_files max_per_file; do
  repo_path="$ROOT/$path"
  out_dir="$ROOT/tests/baseline/$slug"

  if [[ ! -d "$repo_path" ]]; then
    echo "missing fixture repo for $slug at $path; run git submodule update --init --recursive" >&2
    exit 1
  fi

  mkdir -p "$out_dir"
  moon -C "$ROOT/testgen" run cmd/main -- \
    --repo "$repo_path" \
    --output-dir "$out_dir" \
    --repo-slug "$slug" \
    --max-files "$max_files" \
    --max-per-file "$max_per_file"
done < <("$ROOT/scripts/manifest.py")
