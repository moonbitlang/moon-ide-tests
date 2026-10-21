#requires -Version 7.4
param(
  [switch] $RefreshSnapshots
)

$ErrorActionPreference = "Stop"

$root = (& git rev-parse --show-toplevel 2>$null).Trim()
if (!$root) {
  $root = (Get-Location).Path
}

function Get-FixtureRepos {
  param([string] $ReposYaml)

  $repos = @()
  $current = $null

  foreach ($line in Get-Content -LiteralPath $ReposYaml) {
    if ($line -match '^\s*-\s+slug:\s+(.+?)\s*$') {
      if ($null -ne $current) {
        $repos += [pscustomobject] $current
      }
      $current = @{
        Slug = $Matches[1].Trim()
        Path = $null
        MaxFiles = "0"
        MaxPerFile = "50"
      }
      continue
    }

    if ($null -eq $current) {
      continue
    }

    if ($line -match '^\s+path:\s+(.+?)\s*$') {
      $current.Path = $Matches[1].Trim()
    } elseif ($line -match '^\s+max_files:\s+(.+?)\s*$') {
      $current.MaxFiles = $Matches[1].Trim()
    } elseif ($line -match '^\s+max_per_file:\s+(.+?)\s*$') {
      $current.MaxPerFile = $Matches[1].Trim()
    }
  }

  if ($null -ne $current) {
    $repos += [pscustomobject] $current
  }

  $repos
}

function Invoke-Checked {
  param(
    [string] $FilePath,
    [string[]] $Arguments
  )

  & $FilePath @Arguments
  if ($LASTEXITCODE -ne 0) {
    throw "$FilePath exited with status $LASTEXITCODE"
  }
}

$repos = Get-FixtureRepos (Join-Path $root "fixtures\repos.yaml")
$dailyDir = Join-Path $root ".daily-test"
New-Item -ItemType Directory -Force -Path $dailyDir | Out-Null
$baselinePaths = @()
$baselinePathsFile = Join-Path $dailyDir "windows-baseline-paths.txt"
[System.IO.File]::WriteAllText($baselinePathsFile, "", [System.Text.Encoding]::ASCII)
$moon = (Get-Command moon -CommandType Application | Select-Object -First 1).Source

foreach ($repo in $repos) {
  if (!$repo.Path) {
    throw "missing fixture path for $($repo.Slug)"
  }

  $repoPath = Join-Path $root $repo.Path
  $windowsOutDir = Join-Path $root "tests\windows\$($repo.Slug)"

  if (!(Test-Path -LiteralPath $repoPath -PathType Container)) {
    throw "missing fixture repo for $($repo.Slug) at $($repo.Path); run scripts\update-submodules.sh"
  }

  $checkLog = Join-Path $dailyDir "windows-check-$($repo.Slug).log"
  & $moon -C $repoPath check *> $checkLog
  if ($LASTEXITCODE -ne 0) {
    Get-Content -LiteralPath $checkLog -Encoding UTF8
    Write-Host "::notice::Skipping $($repo.Slug): moon check failed; keeping its Windows baselines unchanged."
    continue
  }

  New-Item -ItemType Directory -Force -Path $windowsOutDir | Out-Null
  Invoke-Checked "moon" @(
    "-C", (Join-Path $root "testgen"),
    "run", "--target", "wasm", "cmd/main", "--",
    "--repo", $repoPath,
    "--output-dir", $windowsOutDir,
    "--repo-slug", $repo.Slug,
    "--test-repo", $repo.Path,
    "--platform", "windows",
    "--max-files", $repo.MaxFiles,
    "--max-per-file", $repo.MaxPerFile
  )
  $baselinePaths += "tests/windows/$($repo.Slug)"
}

# The Linux review job consumes this list too, so write LF on both platforms.
$pathsText = if ($baselinePaths.Count -gt 0) { ($baselinePaths -join "`n") + "`n" } else { "" }
[System.IO.File]::WriteAllText($baselinePathsFile, $pathsText, [System.Text.Encoding]::ASCII)

if ($RefreshSnapshots) {
  $updateLog = Join-Path $dailyDir "windows-cram-update.log"
  if ($baselinePaths.Count -eq 0) {
    [System.IO.File]::WriteAllText($updateLog, "No compatible Windows fixture baselines.`n", [System.Text.Encoding]::ASCII)
    exit 0
  }

  & $moon `
    cram update --replace --assume-yes --cram-compat --no-keep-output-crlf `
    --shell (Join-Path $root "scripts\moon-cram-powershell.cmd") @baselinePaths *> $updateLog
  $updateStatus = $LASTEXITCODE

  if ($updateStatus -ne 0) {
    Get-Content -LiteralPath $updateLog -Encoding UTF8
    throw "moon cram update exited with status $updateStatus"
  }
}

exit 0
