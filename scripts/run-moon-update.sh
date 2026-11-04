#!/usr/bin/env bash
set -euo pipefail

for attempt in 1 2 3; do
  if moon update; then
    break
  fi
  if [ "$attempt" -eq 3 ]; then
    exit 1
  fi
  sleep $((attempt * 10))
done
