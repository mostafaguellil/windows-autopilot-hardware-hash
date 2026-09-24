# Import an Autopilot Hardware Hash into Microsoft Intune

Upload `AutopilotHWID.csv`, confirm that Intune accepts it, and verify that the device is ready for profile assignment.

## Prerequisites

- `AutopilotHWID.csv` collected from the Windows device
- Account with permission to manage Windows enrollment in Intune
- Device serial number
- Autopilot deployment profile or group assignment prepared for the device

## Procedure

1. Sign in to the Microsoft Intune admin center.
2. Go to **Devices > Windows > Windows enrollment > Windows Autopilot devices**.
3. Select **Import**.<img width="490" height="186" alt="image" src="https://github.com/user-attachments/assets/e58727b7-f85c-4c44-b170-71ab276c7ee5" />

4. In **Add Autopilot devices**, browse to `AutopilotHWID.csv` and select it.
5. Wait for validation. Confirm that **Rows formatted correctly** matches the expected number of devices and that no formatting error appears.
6. Select **Import** and keep the page open until Intune confirms that the import has started or completed.
7. Return to **Windows Autopilot devices**, select **Refresh**, and search for the exact serial number. Synchronization can take several minutes.
8. Verify the serial number, manufacturer, model, group tag if used, Microsoft Entra group membership, and Autopilot deployment profile status.
9. Leave the device at, or return it to, Windows OOBE for the end user.

## If the device does not appear

- Wait a few minutes, select **Sync**, then **Refresh**.
- Search using the exact serial number stored in the CSV.
- Review the import notification for an error or duplicate-device message.
- Confirm that the CSV contains one header row and the expected device row.
- If required, verify that the device is not already registered in another tenant.
