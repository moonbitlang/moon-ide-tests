#!/usr/bin/env bash
set -euo pipefail

if (( $# != 0 )); then
  echo "Usage: $0" >&2
  exit 2
fi

ROOT="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"

command -v moon > /dev/null
mkdir -p "$ROOT/.daily-test"
baseline_paths="$ROOT/.daily-test/unix-baseline-paths.txt"
compatible_fixtures="$ROOT/.daily-test/unix-compatible-fixtures.tsv"
printf '%s\n' tests/unix/core-project tests/unix/core-standalone > "$baseline_paths"
: > "$compatible_fixtures"

for suite in core-project core-standalone; do
  if [[ ! -d "$ROOT/tests/unix/$suite" ]]; then
    echo "missing Unix baseline directory for $suite at tests/unix/$suite" >&2
    exit 1
  fi
done

while IFS=$'\t' read -r slug path max_files max_per_file; do
  repo_path="$ROOT/$path"
  if [[ ! -d "$repo_path" ]]; then
    echo "missing fixture repo for $slug at $path; run scripts/update-submodules.sh" >&2
    exit 1
  fi
  if [[ ! -d "$ROOT/tests/unix/$slug" ]]; then
    echo "missing Unix baseline directory for $slug at tests/unix/$slug" >&2
    exit 1
  fi

  check_log="$ROOT/.daily-test/unix-check-$slug.log"
  if ! moon -C "$repo_path" check > "$check_log" 2>&1; then
    cat "$check_log"
    echo "::notice::Skipping $slug: moon check failed; keeping its Unix baselines unchanged."
    continue
  fi

  printf '%s\t%s\t%s\t%s\n' "$slug" "$path" "$max_files" "$max_per_file" >> "$compatible_fixtures"
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
