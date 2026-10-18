# Daily Test Review

Review the generated Daily Test pull request for MoonBit IDE baselines.

Use the repository checkout and local command-line tools to inspect the result. Do not edit files or make network calls. Start with these read-only checks:

```sh
git status --short
git diff --stat origin/main...HEAD -- fixtures/repos tests/unix tests/windows baselines
git diff --submodule=log origin/main...HEAD -- fixtures/repos tests/unix tests/windows baselines
cat .daily-test/status.txt
cat .daily-test/unix-status.txt
cat .daily-test/windows-status.txt
cat .daily-test/submodules.txt
cat .daily-test/p0-unix/report.md
cat .daily-test/p0-windows/report.md
cat .daily-test/p0-unix/report.json
cat .daily-test/p0-windows/report.json
```

Decide whether the daily refresh contains a failed test, wrong expected output, suspicious baseline promotion, or another issue that needs human attention.

Preserve A findings (old fixtures/commands/snapshots with the current toolchain),
B findings (new fixtures with old commands/snapshots), and C findings (independently
generated candidate commands, then cold/warm execution) separately. A passing C
never clears an A failure. Matching nonzero legacy output is not an approved
negative test. Missing reports, missing required effective coverage, unstable
generation/execution, retired cases and ambiguous identities need attention.
Read the corresponding A/B/C-cold/C-warm captures when investigating a case.
Candidates and coverage changes require human review; do not approve output
merely because C matches newly recorded snapshots.

Return JSON only:

```json
{
  "has_problem": false,
  "comment_body": ""
}
```

Set `has_problem` to `true` only when a PR comment should be posted. In that case, make `comment_body` a concise Markdown comment with the affected test paths, the observed failure or wrong output, and the evidence from the log or diff.

## Mandatory output contract

Your final answer is passed directly to a strict JSON parser. Return exactly one
JSON object and nothing else: no explanation, no Markdown, no code fence, and
no text before or after the object.

The object must conform exactly to this schema:

```json
{
  "type": "object",
  "additionalProperties": false,
  "properties": {
    "has_problem": { "type": "boolean" },
    "comment_body": { "type": "string" }
  },
  "required": ["has_problem", "comment_body"]
}
```
