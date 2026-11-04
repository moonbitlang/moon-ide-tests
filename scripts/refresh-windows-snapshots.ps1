#requires -Version 7.4
param(
  [switch] $Existing
)

$ErrorActionPreference = "Stop"

$prefix = if ($Existing) { "windows-existing" } else { "windows" }
$baselinePaths = @(Get-Content ".daily-test/$prefix-baseline-paths.txt")
$updateLog = ".daily-test/$prefix-cram-update.log"
if ($baselinePaths.Count -eq 0) {
  [System.IO.File]::WriteAllText(
    (Join-Path (Get-Location).Path $updateLog), "No compatible Windows fixture baselines.`n",
    [System.Text.Encoding]::ASCII)
  exit 0
}

moonx moonbit-community/mooncram@0.1.0 update @baselinePaths *> $updateLog
$updateStatus = $LASTEXITCODE
if ($updateStatus -ne 0) {
  Get-Content -LiteralPath $updateLog -Encoding UTF8
  throw "mooncram update exited with status $updateStatus"
}
