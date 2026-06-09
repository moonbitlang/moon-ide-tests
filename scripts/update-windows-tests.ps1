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

function Normalize-MoonCramFiles {
  param([string] $TestsRoot)

  foreach ($file in Get-ChildItem -LiteralPath $TestsRoot -Filter "*.mooncram.md" -Recurse) {
    $text = [System.IO.File]::ReadAllText($file.FullName, [System.Text.Encoding]::UTF8)
    if ($text.Contains("`r")) {
      $normalized = $text.Replace("`r`n", "`n").Replace("`r", "`n")
      [System.IO.File]::WriteAllText($file.FullName, $normalized, [System.Text.UTF8Encoding]::new($false))
    }
  }
}

$repos = Get-FixtureRepos (Join-Path $root "fixtures\repos.yaml")

foreach ($repo in $repos) {
  if (!$repo.Path) {
    throw "missing fixture path for $($repo.Slug)"
  }

  $repoPath = Join-Path $root $repo.Path
  $windowsOutDir = Join-Path $root "tests\windows\$($repo.Slug)"

  if (!(Test-Path -LiteralPath $repoPath -PathType Container)) {
    throw "missing fixture repo for $($repo.Slug) at $($repo.Path); run scripts\update-submodules.sh"
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

  if ($repo.Slug -eq "sqlparser") {
    # These two generated Windows snapshots overflow Moon Cram's Windows
    # markdown parser. The Unix suite keeps the full sqlparser coverage.
    Remove-Item -LiteralPath @(
      (Join-Path $windowsOutDir "find-references.mooncram.md"),
      (Join-Path $windowsOutDir "rename.mooncram.md")
    ) -Force -ErrorAction SilentlyContinue
  }
}

if ($RefreshSnapshots) {
  $dailyDir = Join-Path $root ".daily-test"
  New-Item -ItemType Directory -Force -Path $dailyDir | Out-Null
  $updateLog = Join-Path $dailyDir "windows-cram-update.log"

  $previousErrorActionPreference = $ErrorActionPreference
  $ErrorActionPreference = "Continue"
  & moon cram update --replace --assume-yes --cram-compat --no-keep-output-crlf `
    --shell (Join-Path $root "scripts\moon-cram-powershell.cmd") `
    (Join-Path $root "tests\windows") *> $updateLog
  $updateStatus = $LASTEXITCODE
  $ErrorActionPreference = $previousErrorActionPreference

  if ($updateStatus -ne 0) {
    Get-Content -LiteralPath $updateLog
    throw "moon cram update exited with status $updateStatus"
  }

  Normalize-MoonCramFiles (Join-Path $root "tests\windows")
}
