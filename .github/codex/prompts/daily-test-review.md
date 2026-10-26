# Daily Test Review

Review this Daily Test run's updates under `tests/unix/` and `tests/windows/`,
using the fixture submodule changes and execution logs as context.

Your working directory contains a scoped review bundle. `tests.diff` compares
the exact commit that started this run with the refreshed tests. Work already
present on the starting branch is outside your scope, even when that branch
belongs to another pull request. Do not review generator code, workflow changes,
testgen dependency updates, or the parent pull request.

`submodules.diff` records fixture revision changes and their commit summaries;
`submodules.txt` records the checked-out fixture revisions. Use them to interpret
baseline changes and fixture check failures.

Use only the provided diff and execution logs. Do not edit files, leave this
directory, or make network calls. Start with these read-only checks:

```sh
cat tests-stat.txt
cat tests-status.txt
cat tests.diff
cat submodules.diff
cat submodules.txt
cat unix-cram-test-status.txt
cat windows-cram-test-status.txt
cat unix-cram-test.log
cat windows-cram-test.log
cat unix-cram-update.log
cat windows-cram-update.log
```

Decide whether these test updates contain a failed test, wrong expected output,
or suspicious baseline promotion that needs human attention. Project-loading
errors must not be accepted as healthy IDE output merely because the refreshed
snapshot now passes.

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
