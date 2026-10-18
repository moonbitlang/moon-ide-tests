@echo off
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0moon-cram-audit-powershell.ps1"
exit /b %ERRORLEVEL%
