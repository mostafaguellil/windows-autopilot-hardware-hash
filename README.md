# Windows Autopilot Hardware Hash

An operational project for retrieving the Windows Autopilot hardware hash from a new or reset computer during OOBE, saving the CSV file to a USB drive, and importing it into Microsoft Intune.

## Project contents

- `Get-AutopilotHash.bat`: the only file that needs to be placed on the USB drive.
- `collect-hardware-hash.md`: the hardware hash collection procedure for Windows OOBE.
- `import-into-intune.md`: the Microsoft Intune import and verification procedure.

## Quick start

1. Copy `Get-AutopilotHash.bat` to the root of a USB drive.
2. Start the computer and remain on the Windows OOBE screen.
3. Connect the computer to the Internet and insert the USB drive.
4. Press `Shift + F10` or, on some laptops, `Shift + Fn + F10`.
5. In Command Prompt, open the USB drive—for example, enter `E:`—and run `Get-AutopilotHash.bat`.
6. Confirm the collection when prompted.
7. Verify that `AutopilotHWID.csv` has been saved to the USB drive.
8. Import the CSV into Microsoft Intune by following the [Intune import procedure](import-into-intune.md).

> Do not complete Windows setup or create a personal Microsoft account before collecting the hardware hash.

## How the script works

The script automatically uses the drive from which the `.bat` file is running. It installs Microsoft's `Get-WindowsAutopilotInfo` script from PowerShell Gallery, collects the hardware hash, and saves `AutopilotHWID.csv` to the same USB drive.

An Internet connection is required. PowerShell may need to install the NuGet provider and trust PowerShell Gallery.

## Zero-touch limitation

This method simplifies the technician's work, but it still requires technical intervention on the device before it is assigned to the end user. For a genuinely zero-touch deployment, the hardware vendor or partner must register the device with Windows Autopilot before delivery.

## Security and validation

- Run the script only on devices owned by your organization or on devices for which you are authorized to collect hardware information.
- Do not change the CSV column headers or values before importing it.
- After import, verify the serial number, Microsoft Entra group membership, and Autopilot deployment profile assignment.
