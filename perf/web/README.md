# Performance dashboard

The dashboard is a static HTML/CSS/JavaScript site with no build dependencies.
It reads `data/index.json` and the raw records for the selected branch/platform.
Source code lives here; published data lives on the independent `perf-history`
branch. The page shows one chart, with tabs for the five command types. Each
selected fixed query is a separate line; the horizontal axis contains MoonBit
versions, not workflow runs or dates.

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
  family, branch and measurement profile define a measurement group. The latest
  group is selected initially; other groups are available under Measurement
  conditions. Different groups never share a mean or a comparison.
- The runner records `prepared-cli-v1` and available runner image metadata.
  Earlier reports without core preparation use a separate `legacy-cli-v0`
  profile. Unknown/incomplete suites remain in raw records but cannot contribute
  to a measurement group. Runner patch revisions are retained in raw details;
  different revisions within the same image family share a measurement group.
- Exact toolchain identity includes all reported CLI, compiler and runtime
  versions/revisions and feature flags. Executable installation paths and line
  endings do not affect identity. A generic `nightly` label is never a version
  key. SDKs with the same compiler and a different CLI retain separate points.
- For each query and exact toolchain within the selected group, the point is the
  arithmetic mean of **all successful observations**. A successful query in a
  partial run contributes normally; errors in unrelated queries do not discard
  it. Timeouts, errors and missing samples are counted separately, never treated
  as zero. A version with no successful sample is a gap in that query's line.
- Versions are equally spaced and ordered by the compiler's reported date,
  falling back to first observation when no date is reported. Ties use first
  observation. Hash labels identify versions rather than imply hash ordering.
  Version channels and the latest N versions can be filtered. Limiting versions
  never limits repetitions: all runs of each displayed version enter its mean.
- Hover or focus a point to see its mean, counts and change against the
  immediately preceding displayed version. Missing/zero baselines have no
  percentage comparison. Clicking opens all contributing and failed raw samples
  with workflow links. The expandable version table also exposes missing points.
  Query selection, command tabs, platform, branch and measurement group are
  shareable through the URL. A CSV export contains selected query means/counts.
- Raw normalized observations stay immutable; means are derived in the browser,
  not written back over measurements. There are no percentiles or inferred
  significance thresholds. Full logs remain in the original workflow artifacts
  with their configured retention; normalized numeric history remains in Git.
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
# python -m http.server 8787 --bind 127.0.0.1 --directory perf/data/web-checks/site
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
