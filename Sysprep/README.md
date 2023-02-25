# Step 1
During the initial setup where you would connect to the internet and create a user account you need to hit Ctrl+Shift+F3. It will automatically skip setup and login with the built-in Administrator account. 

If you ever need to get back into audit mode with a reboot like doing updates run this command.

`%windir%\system32\sysprep\sysprep.exe /audit /reboot`

# Step 2
Install all your programs and implement all your customization.

# Step 3
Run this in powershell to export your taskbar configuration.

`Export-StartLayout -Path $ENV:LOCALAPPDATA\Microsoft\Windows\Shell\LayoutModification.xml`

# Step 4
Run this command (Win+R) and make sure to press Ctrl+Shift+Enter to run notepad as an admin so you can edit this.

`notepad C:\Users\Administrator\AppData\Local\Microsoft\Windows\Shell\LayoutModification.xml`

Replace the first line with the code stored in [Modification1.xml](Sysprep/Modification1.xml) and leave the file open.

# Step 5
Insert [Modification2.xml](Sysprep/Modification2.xml) between the last 2 to lines called DefaultLayoutOverride and LayoutModificationTemplate

This file pins File Explorer, Google Chrome, and Outlook to the taskbar in the order. If you want to change this you will need to follow the optional step 6 below. If this is what you want skip to step 7.

# Optional Step 6
In order to figure out the exact name and locaiton of the apps you want to pin we need to do a workaround. Pin all the apps you want to the start menu and unpin them from the taskbar. Yes you heard that right just switch what you want pinned so we can export it.

Run in Powershell: `Export-StartLayout -Path C:\Users\Administrator\Desktop\Temp.xml`

Open that file and you are copying either the AppUserModeID and DesktopApplicationLinkPath values. For reference a Microsoft Store App will look like this: 

`<taskbar:UWA AppUserModelID="Microsoft.MicrosoftStickyNotes_8wekyb3d8bbwe!App" />`

and a normal application will look like this:

`<taskbar:DesktopApp DesktopApplicationLinkPath="%APPDATA%\Microsoft\Windows\Start Menu\Programs\Windows PowerShell\Windows PowerShell.lnk" />`

Delete the Temp.xml file and always make sure the Recycle Bin is empty. Formatting is super important so make sure you are just replacing values between quotes.

# Step 7
Copy the contents of [unattend.xml](Sysprep/unattend.xml) into Notepad and make a modification if you need to change it from Windows 10 Pro. Save the file as unattend.xml in the root C drive.

# Step 8
Run in Powershell: `C:\Windows\System32\sysprep\sysprep.exe /oobe /generalize /shutdown /unattend:c:\unattend.xml`

# Step 9
WIP


