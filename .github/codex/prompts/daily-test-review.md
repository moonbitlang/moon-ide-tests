# Daily Test Review

Review the generated Daily Test pull request for MoonBit IDE baselines.

Use the repository checkout and local command-line tools to inspect the result. Do not edit files or make network calls. Start with these read-only checks:

```sh
git status --short
git diff --stat origin/main...HEAD -- fixtures/repos tests/unix tests/windows
git diff --submodule=log origin/main...HEAD -- fixtures/repos tests/unix tests/windows
cat .daily-test/status.txt
cat .daily-test/unix-status.txt
cat .daily-test/windows-status.txt
cat .daily-test/submodules.txt
cat .daily-test/unix-cram-test-status.txt
cat .daily-test/windows-cram-test-status.txt
cat .daily-test/unix-cram-test.log
cat .daily-test/windows-cram-test.log
cat .daily-test/unix-cram-update.log
cat .daily-test/windows-cram-update.log
```

Decide whether the daily refresh contains a failed test, wrong expected output, suspicious baseline promotion, or another issue that needs human attention.

The per-platform `*-baseline-paths.txt` lists select the baselines whose fixtures
passed `moon check` on that platform, plus the handcrafted Unix suites. Failed
fixture checks are recorded in `*-check-*.log`; those fixtures keep their existing
tests unchanged and are excluded from snapshot refresh and cram tests. A skipped
fixture is not an IDE regression.

A `known-ide-limitation` annotation applies only to its identified command and
exact `No hover information found` output with exit
status 1. Those documented cases are intentional reproductions; other failed
commands and project-loading errors require attention. Do not infer a module's
health from an unrelated documentation test or assume files absent from the diff
exist. Logs are UTF-8; report a decoding problem as such, without treating the
decoder's error message as the original log content.

Treat ordinary fixture submodule fast-forwards, generated baseline drift, and passing cram output as normal unless the diff or logs show a concrete test problem. If cram failed, inspect the log and explain the specific failing or suspicious tests.

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
