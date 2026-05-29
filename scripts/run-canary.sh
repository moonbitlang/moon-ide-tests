#!/usr/bin/env bash
set -u -o pipefail

ROOT="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
source "$ROOT/scripts/static-core-suites.sh"
ARTIFACT_DIR="${1:-$ROOT/artifacts/canary}"
TESTS_DIR="$ARTIFACT_DIR/tests"
LOGS_DIR="$ARTIFACT_DIR/logs"
DIFFS_DIR="$ARTIFACT_DIR/diffs"
SUMMARY="$ARTIFACT_DIR/summary.txt"
status=0

rm -rf "$ARTIFACT_DIR"
mkdir -p "$TESTS_DIR" "$LOGS_DIR" "$DIFFS_DIR"
: >"$SUMMARY"

git -C "$ROOT" submodule update --init --recursive

while IFS=$'\t' read -r slug path _url branch max_files max_per_file; do
  repo_path="$ROOT/$path"
  out_dir="$TESTS_DIR/$slug"
  log_prefix="$LOGS_DIR/$slug"

  {
    echo "repo: $slug"
    echo "path: $path"
    echo "branch: $branch"
    echo "pinned: $(git -C "$repo_path" rev-parse HEAD 2>/dev/null || echo missing)"
  } >>"$SUMMARY"

  if ! git -C "$repo_path" fetch origin "$branch" >"$log_prefix.fetch.log" 2>&1; then
    echo "fetch failed: $slug" >>"$SUMMARY"
    status=1
    continue
  fi
  if ! git -C "$repo_path" checkout --detach "origin/$branch" >"$log_prefix.checkout.log" 2>&1; then
    echo "checkout failed: $slug" >>"$SUMMARY"
    status=1
    continue
  fi

  echo "canary: $(git -C "$repo_path" rev-parse HEAD)" >>"$SUMMARY"
  mkdir -p "$out_dir"

  if ! moon -C "$ROOT/testgen" run cmd/main -- \
    --repo "$repo_path" \
    --output-dir "$out_dir" \
    --repo-slug "$slug" \
    --max-files "$max_files" \
    --max-per-file "$max_per_file" >"$log_prefix.generate.log" 2>&1; then
    echo "generate failed: $slug" >>"$SUMMARY"
    status=1
    continue
  fi

  if ! moon cram update --replace --assume-yes --cram-compat \
    -w "$repo_path" \
    "$out_dir" >"$log_prefix.update.log" 2>&1; then
    echo "update failed: $slug" >>"$SUMMARY"
    status=1
  fi
  "$ROOT/scripts/escape-mooncram-output.py" "$out_dir"

  if ! moon cram test --cram-compat \
    -w "$repo_path" \
    "$out_dir" >"$log_prefix.test.log" 2>&1; then
    echo "test failed: $slug" >>"$SUMMARY"
    status=1
  fi

  diff -ru "$ROOT/tests/baseline/$slug" "$out_dir" >"$DIFFS_DIR/$slug.diff" 2>&1 || true
  echo >>"$SUMMARY"
done < <("$ROOT/scripts/manifest.py")

while IFS=$'\t' read -r slug path; do
  repo_path="$ROOT/$path"
  out_dir="$TESTS_DIR/$slug"
  log_prefix="$LOGS_DIR/$slug"

  {
    echo "repo: $slug"
    echo "path: $path"
    echo "mode: static-core"
  } >>"$SUMMARY"

  rm -rf "$out_dir"
  mkdir -p "$out_dir"
  if ! cp -R "$ROOT/tests/baseline/$slug/." "$out_dir/" >"$log_prefix.copy.log" 2>&1; then
    echo "copy failed: $slug" >>"$SUMMARY"
    status=1
    continue
  fi

  if ! moon cram update --replace --assume-yes --cram-compat \
    -w "$repo_path" \
    "$out_dir" >"$log_prefix.update.log" 2>&1; then
    echo "update failed: $slug" >>"$SUMMARY"
    status=1
  fi
  "$ROOT/scripts/escape-mooncram-output.py" "$out_dir"

  if ! moon cram test --cram-compat \
    -w "$repo_path" \
    "$out_dir" >"$log_prefix.test.log" 2>&1; then
    echo "test failed: $slug" >>"$SUMMARY"
    status=1
  fi

  diff -ru "$ROOT/tests/baseline/$slug" "$out_dir" >"$DIFFS_DIR/$slug.diff" 2>&1 || true
  echo >>"$SUMMARY"
done < <(static_core_suites)

exit "$status"
