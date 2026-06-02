#!/usr/bin/env bash
set -euo pipefail

ROOT="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"

git -C "$ROOT" submodule update --init --recursive

while IFS=$'\t' read -r slug path branch; do
  repo_path="$ROOT/$path"
  echo "updating $slug ($branch)"
  git -C "$repo_path" fetch origin "$branch"
  git -C "$repo_path" checkout "$branch"
  git -C "$repo_path" pull --ff-only origin "$branch"
done < <(
  awk '
    function flush() {
      if (slug != "") print slug "\t" path "\t" branch
      slug = path = branch = ""
    }
    /^[[:space:]]*-[[:space:]]+slug:/ { flush(); slug = $3; next }
    /^[[:space:]]*-[[:space:]]/ { flush(); next }
    /^[[:space:]]+path:/ { path = $2 }
    /^[[:space:]]+branch:/ { branch = $2 }
    END { flush() }
  ' "$ROOT/fixtures/repos.yaml"
)
