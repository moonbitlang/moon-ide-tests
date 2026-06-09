$ErrorActionPreference = "Continue"
$lastStatus = 0
$sawDivider = $false
$cramStateFile = $null
$loadedCramState = $false
$skippingInternalFunction = $false

function Normalize-MoonIdeOutput {
  param(
    [string] $TestRepoRoot,
    [string] $MoonHome
  )

  process {
    $line = [string] $_
    $repoSlash = $TestRepoRoot.Replace('\', '/')
    $moonSlash = $MoonHome.Replace('\', '/')
    $line = $line -replace [regex]::Escape($TestRepoRoot), '<WORKDIR>'
    $line = $line -replace [regex]::Escape($repoSlash), '<WORKDIR>'
    $line = $line -replace [regex]::Escape($MoonHome), '<MOON_HOME>'
    $line = $line -replace [regex]::Escape($moonSlash), '<MOON_HOME>'
    $line -replace '<WORKDIR>\\', '<WORKDIR>/' -replace '<MOON_HOME>\\', '<MOON_HOME>/'
  }
}

function run_moon_ide {
  param(
    [string] $RepoRelativePath,
    [string] $Executable,
    [Parameter(ValueFromRemainingArguments = $true)]
    [string[]] $CommandArgs
  )

  $env:MOON_HOME = if ($env:MOON_HOME) {
    [System.IO.Path]::GetFullPath($env:MOON_HOME)
  } else {
    Join-Path $env:USERPROFILE ".moon"
  }

  $testDir = if ($env:TESTDIR) { $env:TESTDIR } else { $PWD.Path }
  $testRepoRoot = [System.IO.Path]::GetFullPath((Join-Path $testDir $RepoRelativePath))

  Push-Location $testRepoRoot
  try {
    $global:LASTEXITCODE = $null
    & $Executable @CommandArgs 2>&1 |
      Normalize-MoonIdeOutput -TestRepoRoot $testRepoRoot -MoonHome $env:MOON_HOME
    if ($null -ne $global:LASTEXITCODE) {
      $script:lastStatus = [int] $global:LASTEXITCODE
    } elseif ($?) {
      $script:lastStatus = 0
    } else {
      $script:lastStatus = 1
    }
  } finally {
    Pop-Location
  }

  $global:LASTEXITCODE = $script:lastStatus
}

function Write-LfLine {
  param([string] $Text)

  $bytes = [System.Text.Encoding]::UTF8.GetBytes("$Text`n")
  [Console]::OpenStandardOutput().Write($bytes, 0, $bytes.Length)
}

function Convert-CramExport {
  param([string] $Line)

  if ($Line -notmatch '^export ([A-Za-z_][A-Za-z0-9_]*)=(.*)$') {
    return $false
  }

  $name = $Matches[1]
  $value = $Matches[2]
  if (
    ($value.Length -ge 2) -and
    (($value[0] -eq "'" -and $value[$value.Length - 1] -eq "'") -or
     ($value[0] -eq '"' -and $value[$value.Length - 1] -eq '"'))
  ) {
    $value = $value.Substring(1, $value.Length - 2)
  }

  [Environment]::SetEnvironmentVariable($name, $value, "Process")
  return $true
}

function Convert-ShellValue {
  param([string] $Value)

  if (
    ($Value.Length -ge 2) -and
    (($Value[0] -eq "'" -and $Value[$Value.Length - 1] -eq "'") -or
     ($Value[0] -eq '"' -and $Value[$Value.Length - 1] -eq '"'))
  ) {
    return $Value.Substring(1, $Value.Length - 2)
  }
  return $Value
}

function Import-CramPowerShellState {
  if ($script:loadedCramState -or !$script:cramStateFile) {
    return
  }
  $script:loadedCramState = $true
  if (!(Test-Path -LiteralPath $script:cramStateFile)) {
    return
  }
  foreach ($stateLine in Get-Content -LiteralPath $script:cramStateFile) {
    if ($stateLine.Trim() -ne "") {
      Invoke-Expression $stateLine
    }
  }
}

function Set-CramStatePath {
  param([string] $Line)

  if ($Line -notmatch '^__MOON_CRAM_TEMP_STATE_PATH=(.*)$') {
    return $false
  }

  $stateDir = Convert-ShellValue $Matches[1]
  if ($stateDir) {
    $script:cramStateFile = Join-Path $stateDir "powershell-state.ps1"
    Import-CramPowerShellState
  }
  return $true
}

function Test-CramInternalLine {
  param([string] $Line)

  $trimmed = $Line.Trim()
  if ($trimmed -eq "") {
    return $true
  }
  if ($trimmed.StartsWith("#")) {
    return $true
  }
  if ($trimmed -eq "# vim:set ft=bash") {
    return $true
  }
  if ($trimmed.StartsWith("function __moon_cram_")) {
    $script:skippingInternalFunction = $true
    return $true
  }
  if ($script:skippingInternalFunction) {
    if ($trimmed -eq "}") {
      $script:skippingInternalFunction = $false
    }
    return $true
  }
  if ($trimmed.StartsWith("shopt ")) {
    return $true
  }
  if ($trimmed.StartsWith("[ -f ") -or $trimmed.StartsWith("[ 1 -eq ")) {
    return $true
  }
  return $false
}

function Test-PersistableCramLine {
  param([string] $Line)

  $trimmed = $Line.TrimStart()
  return (
    $trimmed.StartsWith('$env:') -or
    $trimmed.StartsWith('$script:') -or
    $trimmed.StartsWith('function ')
  )
}

function Save-CramPowerShellState {
  param([string] $Line)

  if (!$script:cramStateFile -or !(Test-PersistableCramLine $Line)) {
    return
  }

  $stateDir = Split-Path -Parent $script:cramStateFile
  if (!(Test-Path -LiteralPath $stateDir)) {
    New-Item -ItemType Directory -Force -Path $stateDir | Out-Null
  }

  $existing = @()
  if (Test-Path -LiteralPath $script:cramStateFile) {
    $existing = Get-Content -LiteralPath $script:cramStateFile
  }
  if (!($existing -contains $Line)) {
    Add-Content -LiteralPath $script:cramStateFile -Value $Line -Encoding utf8
  }
}

function Write-CramDivider {
  param([string] $Line)

  if (-not $Line.StartsWith("echo ")) {
    return $false
  }

  $divider = $Line.Substring(5)
  if (
    ($divider.Length -ge 2) -and
    ($divider[0] -eq '"') -and
    ($divider[$divider.Length - 1] -eq '"')
  ) {
    $divider = $divider.Substring(1, $divider.Length - 2)
  }

  if (
    $divider.StartsWith("~~~~~~~~EXECDIVIDER::") -and
    $divider.EndsWith("::`$?")
  ) {
    $prefix = $divider.Substring(0, $divider.Length - 4)
    $script:sawDivider = $true
    Write-LfLine "$prefix::$script:lastStatus"
    return $true
  }
  return $false
}

while (($line = [Console]::In.ReadLine()) -ne $null) {
  if (Set-CramStatePath $line) {
    $lastStatus = 0
    continue
  }

  if (Test-CramInternalLine $line) {
    continue
  }

  if (Convert-CramExport $line) {
    $lastStatus = 0
    continue
  }

  if (Write-CramDivider $line) {
    continue
  }

  $global:LASTEXITCODE = $null
  try {
    Invoke-Expression $line
    Save-CramPowerShellState $line
    if ($null -ne $global:LASTEXITCODE) {
      $lastStatus = [int] $global:LASTEXITCODE
    } elseif ($?) {
      $lastStatus = 0
    } else {
      $lastStatus = 1
    }
  } catch {
    Write-Error $_
    $lastStatus = 1
  }
}

if ($sawDivider) {
  exit 0
}
exit $lastStatus
