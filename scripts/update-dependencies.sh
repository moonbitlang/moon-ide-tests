#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")/../testgen"

moon add --upgrade moonbitlang/lexer
moon add --upgrade moonbitlang/parser
moon add --upgrade moonbitlang/x
