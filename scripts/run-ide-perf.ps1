#requires -Version 7.4
param(
  [ValidateSet("Generate", "Test")]
  [string] $Action = "Test",
  [string[]] $CaseFile,
  [switch] $Candidates,
  [ValidateSet("unix", "windows")]
  [string] $Platform
)

$ErrorActionPreference = "Stop"
$arguments = @("scripts/run-ide-perf.mbtx", "--action", $Action.ToLowerInvariant())
foreach ($name in $CaseFile) { $arguments += @("--case-file", $name) }
if ($Candidates) { $arguments += "--candidates" }
if ($Platform) { $arguments += @("--platform", $Platform) }
Push-Location (Split-Path -Parent $PSScriptRoot)
try {
  & moonx @arguments
  $status = $LASTEXITCODE
} finally {
  Pop-Location
}
exit $status
