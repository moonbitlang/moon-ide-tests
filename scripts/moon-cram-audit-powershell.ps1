function p0_capture {
  param(
    [string] $CaseId,
    [string] $Executable,
    [Parameter(ValueFromRemainingArguments = $true)]
    [string[]] $CommandArgs
  )
  $capturedLines = @(& $Executable @CommandArgs)
  $capturedStatus = $global:LASTEXITCODE
  if ($null -eq $capturedStatus) { $capturedStatus = if ($?) { 0 } else { 1 } }
  $capturePath = Join-Path $env:P0_CAPTURE_DIR $CaseId
  $capturedText = [string]::Join("`n", [string[]] $capturedLines)
  if ($capturedLines.Count -gt 0) { $capturedText += "`n" }
  [System.IO.File]::WriteAllText("$capturePath.out", $capturedText, [System.Text.UTF8Encoding]::new($false))
  [System.IO.File]::WriteAllText("$capturePath.status", [string] $capturedStatus, [System.Text.Encoding]::ASCII)
  $capturedLines | ForEach-Object { $_ }
  $global:LASTEXITCODE = [int] $capturedStatus
}

function p0_unsupported { $global:LASTEXITCODE = 0 }

. (Join-Path $PSScriptRoot "moon-cram-powershell.ps1")
