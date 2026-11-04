#requires -Version 7.4
[CmdletBinding()]
param()

$ErrorActionPreference = "Stop"

$root = (& git rev-parse --show-toplevel 2>$null).Trim()
if (!$root) {
  $root = (Get-Location).Path
}

$repos = & "$PSScriptRoot/run-moon-check.ps1"
foreach ($repo in $repos) {
  $windowsOutDir = Join-Path $root "tests/windows/$($repo.Slug)"
  New-Item -ItemType Directory -Force -Path $windowsOutDir | Out-Null
  moon -C (Join-Path $root "testgen") run --target wasm cmd/main -- `
    --repo (Join-Path $root $repo.Path) `
    --output-dir $windowsOutDir `
    --repo-slug $repo.Slug `
    --test-repo $repo.Path `
    --platform windows `
    --max-files $repo.MaxFiles `
    --max-per-file $repo.MaxPerFile
  if ($LASTEXITCODE -ne 0) {
    throw "testgen exited with status $LASTEXITCODE"
  }
  }
}

exit 0
