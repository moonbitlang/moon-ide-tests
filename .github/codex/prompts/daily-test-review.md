# Daily Test Review

Review only this Daily Test run's updates under `tests/unix/` and `tests/windows/`.

Your working directory is a scoped review bundle, not the repository checkout.
`tests.diff` compares the exact commit that started this run with the refreshed
tests. Work already present on the starting branch is outside your scope, even
when that branch belongs to another pull request. Do not review generator code,
workflow changes, fixture repository source, or the parent pull request.

Use only the provided test diff and execution logs. Do not edit files, leave this
directory, or make network calls. Start with these read-only checks:

```sh
cat tests-stat.txt
cat tests-status.txt
cat tests.diff
cat unix-cram-test-status.txt
cat windows-cram-test-status.txt
cat unix-cram-test.log
cat windows-cram-test.log
cat unix-cram-update.log
cat windows-cram-update.log
cat baseline-health-status.txt
cat baseline-health.log
```

Decide whether these test updates contain a failed test, wrong expected output,
or suspicious baseline promotion that needs human attention. In particular,
project-loading errors must not be accepted as healthy IDE output merely because
the refreshed snapshot now passes.

The deterministic health report checks all snapshots and reports specific known
IDE hover limitations separately. A `known-ide-limitation` annotation applies only
to its identified command and exact `No hover information found` output with exit
status 1. Those documented cases are intentional reproductions; other failed
commands and project-loading errors require attention. Do not infer a module's
health from an unrelated documentation test or assume files absent from the diff
exist. Logs are UTF-8; report a decoding problem as such, without treating the
decoder's error message as the original log content.

Treat ordinary generated baseline drift and passing cram output as normal unless
the test diff or logs show a concrete problem. If cram failed, inspect the log and
explain the specific failing or suspicious tests. Mention fixture or toolchain
errors only to explain their effect on the tests being reviewed.

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
