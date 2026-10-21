#!/usr/bin/env bash
set -euo pipefail

ROOT="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"

command -v moon > /dev/null
mkdir -p "$ROOT/.daily-test"
baseline_paths="$ROOT/.daily-test/unix-baseline-paths.txt"
printf '%s\n' tests/unix/core-project tests/unix/core-standalone > "$baseline_paths"

while IFS=$'\t' read -r slug path max_files max_per_file; do
  repo_path="$ROOT/$path"
  unix_out_dir="$ROOT/tests/unix/$slug"

  if [[ ! -d "$repo_path" ]]; then
    echo "missing fixture repo for $slug at $path; run scripts/update-submodules.sh" >&2
    exit 1
  fi

  check_log="$ROOT/.daily-test/unix-check-$slug.log"
  if ! moon -C "$repo_path" check > "$check_log" 2>&1; then
    cat "$check_log"
    echo "::notice::Skipping $slug: moon check failed; keeping its Unix baselines unchanged."
    continue
  fi

  mkdir -p "$unix_out_dir"
  moon -C "$ROOT/testgen" run --target wasm cmd/main -- \
    --repo "$repo_path" \
    --output-dir "$unix_out_dir" \
    --repo-slug "$slug" \
    --test-repo "$path" \
    --platform unix \
    --max-files "$max_files" \
    --max-per-file "$max_per_file"
  printf 'tests/unix/%s\n' "$slug" >> "$baseline_paths"
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
