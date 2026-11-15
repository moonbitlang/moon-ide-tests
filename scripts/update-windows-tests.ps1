#requires -Version 7.4
param(
  [switch] $RefreshSnapshots
)

$ErrorActionPreference = "Stop"

$root = (& git rev-parse --show-toplevel 2>$null).Trim()
if (!$root) {
  $root = (Get-Location).Path
}

$repos = @(& "$PSScriptRoot/run-moon-check.ps1")
foreach ($repo in $repos) {
  & moon -C (Join-Path $root "testgen") run --target wasm cmd/main -- `
    --repo (Join-Path $root $repo.Path) `
    --output-dir (Join-Path $root "tests/windows/$($repo.Slug)") `
    --repo-slug $repo.Slug `
    --platform windows `
    --max-files $repo.MaxFiles `
    --max-per-file $repo.MaxPerFile
  if ($LASTEXITCODE -ne 0) {
    throw "moon exited with status $LASTEXITCODE"
  }
}

if ($RefreshSnapshots) {
  $dailyDir = Join-Path $root ".daily-test"
  $baselinePaths = @(Get-Content -LiteralPath (Join-Path $dailyDir "windows-baseline-paths.txt"))
  $updateLog = Join-Path $dailyDir "windows-cram-update.log"
  if ($baselinePaths.Count -eq 0) {
    [System.IO.File]::WriteAllText($updateLog, "No compatible Windows fixture baselines.`n", [System.Text.Encoding]::ASCII)
    exit 0
  }

  moonx moonbit-community/mooncram@latest update @baselinePaths *> $updateLog
  $updateStatus = $LASTEXITCODE
  if ($updateStatus -ne 0) {
    Get-Content -LiteralPath $updateLog -Encoding UTF8
    throw "mooncram update exited with status $updateStatus"
  }
}

exit 0
