#!/usr/bin/env bash
set -euo pipefail

case "$#:${1-}" in
  0:) log_prefix=unix ;;
  1:--existing) log_prefix=unix-existing ;;
  *)
    echo "Usage: $0 [--existing]" >&2
    exit 2
    ;;
esac

ROOT="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"

command -v moon > /dev/null
mkdir -p "$ROOT/.daily-test"
baseline_paths="$ROOT/.daily-test/$log_prefix-baseline-paths.txt"
printf '%s\n' tests/unix/core-project tests/unix/core-standalone > "$baseline_paths"

if [[ "$log_prefix" == unix ]]; then
  compatible_fixtures="$ROOT/.daily-test/unix-compatible-fixtures.tsv"
  : > "$compatible_fixtures"
fi

while IFS=$'\t' read -r slug path max_files max_per_file; do
  repo_path="$ROOT/$path"
  if [[ ! -d "$repo_path" ]]; then
    echo "missing fixture repo for $slug at $path; run scripts/update-submodules.sh" >&2
    exit 1
  fi

  check_log="$ROOT/.daily-test/$log_prefix-check-$slug.log"
  if ! moon -C "$repo_path" check > "$check_log" 2>&1; then
    cat "$check_log"
    echo "::notice::Skipping $slug: moon check failed; keeping its Unix baselines unchanged."
    continue
  fi

  if [[ "$log_prefix" == unix ]]; then
    printf '%s\t%s\t%s\t%s\n' "$slug" "$path" "$max_files" "$max_per_file" >> "$compatible_fixtures"
  elif [[ ! -d "$ROOT/tests/unix/$slug" ]]; then
    echo "::notice::Skipping $slug: no existing Unix baselines to refresh."
    continue
  fi
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
