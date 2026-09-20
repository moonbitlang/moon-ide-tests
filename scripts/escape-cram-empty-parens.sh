#!/usr/bin/env bash
# moon cram's markdown parser rejects expected-output lines that end with
# " ()": the trailing parens parse as an output annotation with an empty
# rule name ("no rule maker for  registered"). moon cram update still
# writes such lines verbatim, so snapshots must be escaped both before an
# update (so moon cram can parse the existing files) and after it. Appending
# the "(escaped)" annotation round-trips and still matches the raw output.
set -euo pipefail

ROOT="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
TESTS_DIR="${1:-$ROOT/tests/unix}"

find "$TESTS_DIR" -name '*.mooncram.md' -print0 |
  xargs -0 perl -pi -e 's/ \(\)\r?$/ () (escaped)/ unless /^\$ /'
