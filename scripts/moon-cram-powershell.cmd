@echo off
REM Moon Cram currently injects bash state-management snippets and expects a
REM numeric $? divider even when --shell points at powershell. This wrapper
REM runs the PowerShell adapter that translates that Moon Cram protocol; the
REM generated Windows test commands themselves still execute as PowerShell.
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0moon-cram-powershell.ps1"
exit /b %ERRORLEVEL%
