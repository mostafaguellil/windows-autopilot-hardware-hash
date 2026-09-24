@echo off
setlocal EnableExtensions

title Windows Autopilot Hardware Hash
set "USB_DRIVE=%~d0"
set "OUTPUT_FILE=%USB_DRIVE%\AutopilotHWID.csv"

echo ============================================================
echo  Windows Autopilot Hardware Hash
echo ============================================================
echo.
echo The CSV file will be saved to:
echo   %OUTPUT_FILE%
echo.
echo Requirements:
echo   - Run this file from the USB drive during Windows OOBE
echo   - Internet connection
echo   - Command Prompt opened with Shift + F10
echo.

choice /C YN /N /M "Collect the Autopilot hardware hash now? [Y/N]: "
if errorlevel 2 goto :cancelled

echo.
echo Installing the Microsoft collection script and exporting the CSV...
PowerShell.exe -NoLogo -NoProfile -ExecutionPolicy Bypass -Command ^
  "$ErrorActionPreference='Stop';" ^
  "[Net.ServicePointManager]::SecurityProtocol=[Net.SecurityProtocolType]::Tls12;" ^
  "if (-not (Get-PackageProvider -Name NuGet -ListAvailable -ErrorAction SilentlyContinue)) { Install-PackageProvider -Name NuGet -Force -Scope CurrentUser | Out-Null };" ^
  "Set-PSRepository -Name PSGallery -InstallationPolicy Trusted;" ^
  "if (-not (Get-Command Get-WindowsAutopilotInfo -ErrorAction SilentlyContinue)) { Install-Script -Name Get-WindowsAutopilotInfo -Force -Scope CurrentUser };" ^
  "Get-WindowsAutopilotInfo -OutputFile '%OUTPUT_FILE%';" ^
  "if (-not (Test-Path -LiteralPath '%OUTPUT_FILE%')) { throw 'The CSV file was not created.' }"

if errorlevel 1 goto :failed

echo.
echo SUCCESS: The hardware hash was saved to:
echo   %OUTPUT_FILE%
echo.
echo Import this file into Microsoft Intune, then verify the device
echo and its Autopilot deployment profile assignment.
pause
exit /b 0

:failed
echo.
echo ERROR: The hardware hash could not be collected.
echo Check the Internet connection and review the PowerShell error above.
pause
exit /b 1

:cancelled
echo.
echo Operation cancelled. No CSV file was created.
exit /b 2

