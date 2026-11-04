#requires -Version 7.4

foreach ($attempt in 1, 2, 3) {
  moon update
  if ($LASTEXITCODE -eq 0) {
    exit 0
  }
  if ($attempt -eq 3) {
    exit 1
  }
  Start-Sleep -Seconds ($attempt * 10)
}
