""
"******************************************"
"* Install Windows Updates Without Reboot *"
"******************************************"
""

# First prepare Powershell environment.

"Preparing Powershell environment..."
""

Set-ExecutionPolicy -Scope Process -ExecutionPolicy Unrestricted -Force > $null

Function PrepareModule {
	param( [string]$ModuleName )
	
	"Preparing Powershell environment: Getting online " + $ModuleName + " info..."
	$OnlineModuleInfo = Find-Module $ModuleName -Repository PSGallery
	"Preparing Powershell environment: Getting local " + $ModuleName + " info (if exists)..."
	$LocalModuleInfo = Get-InstalledModule $ModuleName -ErrorAction SilentlyContinue > $null
	
	If ($OnlineModuleInfo.Version -ne $LocalModuleInfo.Version) {
		"Preparing Powershell environment: Removing old " + $ModuleName + " (if exists)..."
		Uninstall-Module -Name $ModuleName -ErrorAction SilentlyContinue > $null
		"Preparing Powershell environment: Installing new " + $ModuleName + "..."
		Install-Module -Name $ModuleName -Repository PSGallery
		"Preparing Powershell environment: Importing new " + $ModuleName + "..."
		Import-Module -Name $ModuleName
		}
}


"Setting up to use Powershell Gallery..."
Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
Set-PSRepository -InstallationPolicy Trusted -Name PSGallery

PrepareModule("NuGet")	
PrepareModule("PSWindowsUpdate")

"Setting up WUServiceManager..."
Add-WUServiceManager -MicrosoftUpdate -Confirm:$false > $null

# Now revise registry entries which may prevent Windows Updates from working.

""
"Revising registry entries which may prevent Windows Updates from working..."

If (-not (Test-Path "HKLM:\System\Internet Communication Management\Internet Communication")) {
	New-Item -Path "HKLM:\System\Internet Communication Management\Internet Communication" > $null
	}
New-ItemProperty -Path "HKLM:\System\Internet Communication Management\Internet Communication" -Name "DisableWindowsUpdateAccess" -Value 0 -Force > $null
If (-not (Test-Path "HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate")) { 
	New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate" > $null
	}
If (-not (Test-Path "HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate\AU")) { 
	New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" > $null
	}
New-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate" -Name "DisableWindowsUpdateAccess" -Value 0 -Force > $null
New-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" -Name "AUOptions" -Value 2 -Force > $null
New-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" -Name "NoAutoUpdate" -Value 0 -Force > $null
New-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" -Name "UseWUServer" -Value 0 -Force > $null
If (-not (Test-Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer")) {
	New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" > $null
	}
New-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Name "NoWindowsUpdate" -Value 0 -Force > $null
If (-not (Test-Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\WindowsUpdate")) { 
	New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\WindowsUpdate" > $null
	}
New-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\WindowsUpdate" -Name "DisableWindowsUpdateAccess" -Value 0 -Force > $null
New-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\WindowsUpdate" -Name "DisableWindowsUpdateAccessMode" -Value 0 -Force > $null
New-PSDrive HKU Registry HKEY_USERS > $null
If (-not (Test-Path "HKU:\S-1-5-18\Software\Microsoft\Windows\CurrentVersion\Policies\WindowsUpdate")) { 
	New-Item -Path "HKU:\S-1-5-18\Software\Microsoft\Windows\CurrentVersion\Policies\WindowsUpdate" > $null
	}
New-ItemProperty -Path "HKU:\S-1-5-18\Software\Microsoft\Windows\CurrentVersion\Policies\WindowsUpdate" -Name "DisableWindowsUpdateAccess" -Value 0 -Force > $null

""

# Get list of updates

"Get current list of updates..."
""

Get-WUList | Format-Table

""

# Install without automatic reboot

"Install updates without automatic reboot..."
""

$OmitCategory = "Drivers"	# This is really an array, i.e., it could be "Drivers","Office 2010" et cetera, these are *standard Microsoft categories*.
$OmitTitle = "Preview"		# This is an array, and it may be of entire titles, am trying it as substrings
Install-WindowsUpdate -MicrosoftUpdate -NotCategory $OmitCategory -NotTitle $OmitTitle -AcceptAll -AutoReboot:$false
