# Daily Test Review

Review the generated Daily Test pull request for MoonBit IDE baselines.

Use the repository checkout and local command-line tools to inspect the result. Do not edit files or make network calls. Start with these read-only checks:

```sh
git status --short
git diff --stat origin/main...HEAD -- fixtures/repos tests/baseline
git diff --submodule=log origin/main...HEAD -- fixtures/repos tests/baseline
cat .daily-test/status.txt
cat .daily-test/submodules.txt
cat .daily-test/cram-test-status.txt
cat .daily-test/cram-test.log
cat .daily-test/cram-update.log
```

Decide whether the daily refresh contains a failed test, wrong expected output, suspicious baseline promotion, or another issue that needs human attention.

Treat ordinary fixture submodule fast-forwards, generated baseline drift, and passing cram output as normal unless the diff or logs show a concrete test problem. If cram failed, inspect the log and explain the specific failing or suspicious tests.

Return JSON only:

```json
{
  "has_problem": false,
  "comment_body": ""
}
```

Set `has_problem` to `true` only when a PR comment should be posted. In that case, make `comment_body` a concise Markdown comment with the affected test paths, the observed failure or wrong output, and the evidence from the log or diff.
