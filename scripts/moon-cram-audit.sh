#!/usr/bin/env bash
# Keep Moon Cram's matching semantics while recording every IDE invocation.
p0_capture() {
  local p0_id="$1"
  shift
  local p0_file="$P0_CAPTURE_DIR/$p0_id"
  "$@" > "$p0_file.out" 2>&1
  local p0_status=$?
  printf '%s' "$p0_status" > "$p0_file.status"
  cat "$p0_file.out"
  return "$p0_status"
}
p0_unsupported() { return 0; }
export -f p0_capture p0_unsupported
exec bash "$@"
