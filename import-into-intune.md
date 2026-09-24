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
3. Select **Import**.

<p align="center">
  <img width="800" alt="Windows Autopilot devices page with the Import button highlighted" src="https://github.com/user-attachments/assets/e58727b7-f85c-4c44-b170-71ab276c7ee5">
  <br>
  <sub><strong>Figure 1.</strong> Open Windows Autopilot devices and select <strong>Import</strong>.</sub>
</p>

4. In **Add Autopilot devices**, browse to `AutopilotHWID.csv` and select it.
5. Wait for validation. Confirm that **Rows formatted correctly** matches the expected number of devices and that no formatting error appears.
6. Select **Import** and keep the page open until Intune confirms that the import has started or completed.

<p align="center">
  <img width="800" alt="Add Autopilot devices pane showing a correctly formatted CSV file and the Import button" src="https://github.com/user-attachments/assets/e3a2dfeb-2825-4fb9-8782-ff8461c95049">
  <br>
  <sub><strong>Figure 2.</strong> Confirm that the CSV is formatted correctly, then select <strong>Import</strong>.</sub>
</p>

7. Return to **Windows Autopilot devices**, select **Refresh**, and search for the exact serial number. Synchronization can take several minutes.
8. Verify the serial number, manufacturer, model, group tag if used, Microsoft Entra group membership, and Autopilot deployment profile status.
9. Leave the device at, or return it to, Windows OOBE for the end user.

## If the device does not appear

- Wait a few minutes, select **Sync**, then **Refresh**.
- Search using the exact serial number stored in the CSV.
- Review the import notification for an error or duplicate-device message.
- Confirm that the CSV contains one header row and the expected device row.
- If required, verify that the device is not already registered in another tenant.
