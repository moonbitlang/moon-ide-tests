#!/usr/bin/env bash
set -euo pipefail

ROOT="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
source "$ROOT/scripts/static-core-suites.sh"

while IFS=$'\t' read -r slug path _url _branch _max_files _max_per_file; do
  moon cram test --cram-compat \
    -w "$ROOT/$path" \
    "$ROOT/tests/baseline/$slug"
done < <("$ROOT/scripts/manifest.py")

while IFS=$'\t' read -r slug path; do
  moon cram test --cram-compat \
    -w "$ROOT/$path" \
    "$ROOT/tests/baseline/$slug"
done < <(static_core_suites)
