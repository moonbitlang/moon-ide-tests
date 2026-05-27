#!/usr/bin/env bash
set -euo pipefail

ROOT="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"

"$ROOT/scripts/generate-baseline.sh"

while IFS=$'\t' read -r slug path _url _branch _max_files _max_per_file _max_toplevel; do
  moon cram update --replace --assume-yes --cram-compat \
    -w "$ROOT/$path" \
    "$ROOT/tests/baseline/$slug"
  "$ROOT/scripts/escape-mooncram-output.py" "$ROOT/tests/baseline/$slug"
done < <("$ROOT/scripts/manifest.py")
