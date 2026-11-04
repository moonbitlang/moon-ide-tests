#requires -Version 7.4
param(
  [switch] $Existing
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

$repos = Get-FixtureRepos (Join-Path $root "fixtures/repos.yaml")
$dailyDir = Join-Path $root ".daily-test"
New-Item -ItemType Directory -Force -Path $dailyDir | Out-Null
$prefix = if ($Existing) { "windows-existing" } else { "windows" }
$baselinePathsFile = Join-Path $dailyDir "$prefix-baseline-paths.txt"
$baselinePaths = @()
$compatibleRepos = @()
$moon = (Get-Command moon -CommandType Application | Select-Object -First 1).Source

foreach ($repo in $repos) {
  if (!$repo.Path) {
    throw "missing fixture path for $($repo.Slug)"
  }

  $repoPath = Join-Path $root $repo.Path
  if (!(Test-Path -LiteralPath $repoPath -PathType Container)) {
    throw "missing fixture repo for $($repo.Slug) at $($repo.Path); run scripts/update-submodules.sh"
  }

  $checkLog = Join-Path $dailyDir "$prefix-check-$($repo.Slug).log"
  & $moon -C $repoPath check *> $checkLog
  if ($LASTEXITCODE -ne 0) {
    Get-Content -LiteralPath $checkLog -Encoding UTF8 | Write-Host
    Write-Host "::notice::Skipping $($repo.Slug): moon check failed; keeping its Windows baselines unchanged."
    continue
  }

  $baselinePath = "tests/windows/$($repo.Slug)"
  if ($Existing -and !(Test-Path -LiteralPath (Join-Path $root $baselinePath) -PathType Container)) {
    Write-Host "::notice::Skipping $($repo.Slug): no existing Windows baselines to refresh."
    continue
  }

  $baselinePaths += $baselinePath
  $compatibleRepos += $repo
}

# The Linux review job consumes this list too, so write LF on both platforms.
$pathsText = if ($baselinePaths.Count -gt 0) { ($baselinePaths -join "`n") + "`n" } else { "" }
[System.IO.File]::WriteAllText($baselinePathsFile, $pathsText, [System.Text.Encoding]::ASCII)
if (!$Existing) {
  $compatibleRepos
}
exit 0
