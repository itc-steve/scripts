## A Public Repo for InfoTrust Scripts
- Please do not include sensitive information.
- Scroll down and find your script and click on the link. You should see a download button on the right for the script.

## Optimize Windows
- Run [Optimize.cmd](Optimize-Windows/Optimize.cmd) | [read more about what this does](Optimize-Windows/README.md)
- Run as admin, program will auto close when finished, no reboot forced or required.

## Update Windows
- Run [GetUpdates.cmd](Optimize-Windows/GetUpdates.cmd)
- Run as admin, reboot is forced once script completes.

## Get Redists
- Run [GetRedists.cmd](Optimize-Windows/GetRedists.cmd)
- Installs/Updates all Microsoft VC++, run as admin, no reboot forced or required.

## Take Ownership as Context Menu
- Run [Take-Ownership.reg](Take-Ownership/Take-Ownership.reg)
- Alternate: Only show when Shift + Right Click [Take-Ownership-ShiftRightClick.reg](Take-Ownership/Take-Ownership-ShiftRightClick.reg)
- [Remove-Take-Ownership.reg](Take-Ownership/Remove-Take-Ownership.reg)

## Get Hash as Context Menu
- Run [Get-Hash.reg](Get-Hash/Get-Hash.reg)
- [Remove-Hash.reg](Get-Hash/Remove-Hash.reg)

# Convert to Retail Office
- Run [Convert-Retail-Office.cmd](Convert-Retail-Office/Covert-Retail-Office.cmd)
- Converts any office installation to the correct retail version. Run as admin.

# Bypass Run being Blocked
- Create a shortcut with: 
`C:\Windows\explorer.exe shell:::{2559a1f3-21d7-11d4-bdaf-00c04f60b9f0}`

# Fix Windows Updates
- Run [Fix-Windows-Updates.bat](Fix-Windows-Updates/Fix-Windows-Updates.bat)
- Run as admin and does not force or require reboot.

# Feature: Left Click Taskbar Icon to Cycle Windows
- Run [LeftClick-Taskbar-Cycle.reg](LeftClick-Taskbar-Cycle/LeftClick-Taskbar-Cycle.reg)

# Sysprep
- View [Instructions](Sysprep/README.md)

# ScreenSaver SCR Malware Impersonation Fix
- Run [Disable-SCR-Files.reg](ScreenSaver-Virus-Disable/Disable-SCR-Files.reg)
- [Enable-SCR-Files.reg](ScreenSaver-Virus-Disable/Enable-SCR-Files.reg)