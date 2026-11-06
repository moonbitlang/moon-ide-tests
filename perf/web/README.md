# Performance dashboard

The dashboard is a static HTML/CSS/JavaScript site with no build dependencies.
It reads `data/index.json` and loads selected run records on demand. Source code
lives here; published data lives on the independent `perf-history` branch.

## Publishing

`daily-perf.yml` runs the two performance jobs, then `Collect-Perf`:

1. Download this workflow attempt's Unix and Windows artifacts.
2. Normalize reports with `perf/publish.py`. Missing artifacts, preparation
   errors and invalid reports become visible failure records.
3. Append immutable `runs/<workflow-run-id>/<attempt>/<platform>.json` records
   and update `index.json` on `perf-history`. A serialized writer prevents
   simultaneous runs from losing history. No force push is used.
4. Build a complete site with the historical data, and upload a preview artifact.

`Deploy-Perf` publishes to GitHub Pages for the default branch. A manual run on
another branch can opt in with the boolean `publish` input. History is grouped
by branch; the page defaults to the default branch when it has data.

Before the first deployment, set repository **Settings → Pages → Build and
deployment → Source** to **GitHub Actions**. If testing publication from a feature
branch, allow that branch in the `github-pages` environment's deployment rules.
The workflow's collection job needs `contents: write` and `actions: read`;
the deployment job needs `pages: write` and `id-token: write`. Test jobs keep
read-only repository permissions.

## Data and comparisons

- Query identity hashes the fixture slug and IDE argument vector, including the
  backend and location. Renaming a test file does not change its history.
- Suite identity includes command execution order and fixture preparation
  commands. Project commit, suite identity, platform, architecture, runner image
  family, branch and measurement profile must match for a baseline comparison. Nightly versions
  may differ: tracking those versions is the purpose of the dashboard.
- The runner records `prepared-cli-v1` and available runner image metadata.
  Earlier reports without core preparation use a separate `legacy-cli-v0`
  profile. Unknown/incomplete suites cannot supply comparable baselines.
  Runner image revision changes are marked in query history.
- Only passing runs supply baselines. Partial runs retain their observations,
  but do not extend the trend line or create percentage comparisons. Timeouts
  and missing samples are markers, never zero-duration points. Configuration
  changes break the line and are marked separately.
- The site displays single observations, not percentiles. Each query currently
  runs once. Full logs remain in the original workflow artifacts with their
  configured retention; normalized numeric history remains in Git.
- Rerunning the same archival input is idempotent. A different payload for an
  existing run identity is rejected; a new workflow attempt creates new records.
  Only this attempt's platform artifacts are ingested. Rerun all jobs to collect
  a new measurement set; platforms not rerun in a partial attempt are recorded
  as missing rather than reusing old observations.

## Local preview with real artifacts

Run these commands from the repository root, replacing `RUN_ID`:

```sh
gh run download RUN_ID --repo moonbitlang/moon-ide-tests \
  --pattern 'ide-perf-*' --dir perf/data/incoming
gh api repos/moonbitlang/moon-ide-tests/actions/runs/RUN_ID > perf/data/ci.json
python perf/publish.py --artifacts perf/data/incoming --ci perf/data/ci.json \
  --history perf/data/history --site perf/data/site
python -m http.server 8787 --bind 127.0.0.1 --directory perf/data/site
```

The publisher expects the artifact directory names produced by the workflow.
Pass `--unix-result failure` or `--windows-result failure` when reproducing a
failed job; CI passes both actual job results automatically. For a local-only
run without GitHub provenance, use a separate dataset rather than mixing it with
hosted results.

```sh
python -m unittest discover -s perf -p 'test_*.py'
node --test perf/web/model.test.mjs
```

Generated preview files belong under ignored `perf/data/`. No captured workflow
data or generated deployment files need to be committed to the source branch.
