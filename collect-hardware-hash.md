# Retrieve a Windows Autopilot Hardware Hash

Collect the device hardware hash during Windows OOBE and save it to a USB drive for import into Microsoft Intune.

## Prerequisites

- New or reset Windows computer
- Internet connection
- USB drive containing `Get-AutopilotHash.bat`
- Access to the Microsoft Intune admin center from an administrator computer

## Procedure

1. Turn on the computer and remain on the Windows OOBE screen.
2. Connect the computer to the Internet and insert the USB drive.
3. Press `Shift + F10`. On some laptops, press `Shift + Fn + F10`.
4. Identify the USB drive letter. You can enter `powershell`, run `Get-Volume`, then enter `exit` to return to Command Prompt.
5. Change to the USB drive, for example `E:`, then run `Get-AutopilotHash.bat`.
6. Confirm the collection by pressing `Y`.
7. Wait for the success message. The script saves `AutopilotHWID.csv` on the same USB drive.
8. Confirm that the CSV exists, then safely remove the USB drive.

Do not complete Windows setup or create a personal Microsoft account. Leave the device at OOBE until it has been imported and the intended Autopilot deployment profile applies.

## Troubleshooting

- If installation fails, confirm Internet access and run the batch file again.
- If the USB drive letter is unknown, use `Get-Volume` in PowerShell.
- If no CSV is created, review the PowerShell error displayed by the script.
- Do not edit the CSV column headers or hardware hash.
