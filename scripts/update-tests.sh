#!/usr/bin/env bash
set -euo pipefail

ROOT="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"

while IFS=$'\t' read -r slug path max_files max_per_file; do
  repo_path="$ROOT/$path"
  out_dir="$ROOT/tests/baseline/$slug"

  if [[ ! -d "$repo_path" ]]; then
    echo "missing fixture repo for $slug at $path; run scripts/update-submodules.sh" >&2
    exit 1
  fi

  mkdir -p "$out_dir"
  moon -C "$ROOT/testgen" run cmd/main -- \
    --repo "$repo_path" \
    --output-dir "$out_dir" \
    --repo-slug "$slug" \
    --test-repo "$path" \
    --max-files "$max_files" \
    --max-per-file "$max_per_file"
done < <(
  awk '
    function flush() {
      if (slug != "") {
        if (max_files == "") max_files = "0"
        if (max_per_file == "") max_per_file = "50"
        print slug "\t" path "\t" max_files "\t" max_per_file
      }
      slug = path = max_files = max_per_file = ""
    }
    /^[[:space:]]*-[[:space:]]+slug:/ { flush(); slug = $3; next }
    /^[[:space:]]*-[[:space:]]/ { flush(); next }
    /^[[:space:]]+path:/ { path = $2 }
    /^[[:space:]]+max_files:/ { max_files = $2 }
    /^[[:space:]]+max_per_file:/ { max_per_file = $2 }
    END { flush() }
  ' "$ROOT/fixtures/repos.yaml"
)
