# mma-appx-etc

Lots of interesting things have been introduced as part of Windows 8/8.1/2012 and 10/2016/2019. There is something called MMAgent, lots of little applets called APPX's, the Edge browser, and something called Game Mode. Application launch prefetching, page combining, memory compression, and application prelaunching have all been rolled into MMAgent, and properly configured, this can improve overall OS performance quite nicely: disabling Superfetch can sometimes give a bit of performance, but configuring it nicely often gains a lot, especially with an SSD. There are many APPX items which eat resources and confuse end users; deleting these (e.g., the consumer-grade email app) can prevent many issues. The Edge browser is preloaded at boot by default, taking RAM in hidden fashion; disabling this can help a good bit, and has not been noticeable to users so far. And Game Mode is something hidden which, by default, runs all the time, sits in the background, tries to guess when any user is playing a game whose video is worth recording for sharing with other gamers, and does the recording whether its guess is correct or not...all of which takes resources, and is therefore well worth turning off! The above are all implemented in mma-appx-etc for your operating pleasure.
# TweakMemTCP

StorageCraft has published some rather marvelous OS tweaks for overall performance, memory management and TCP networking. These and others are implemented in TweakMemTCP. They have been working very well.
# RunDevNodeClean

DevNodeClean is a Microsoft-provided utility which clears certain registry items, ones which are created when USB flash drives are plugged in and removed, when machines are virtualized or devirtualized, and many other operations. These registry items pile up over time, we have seen some older Windows 7 desktops with hundreds of them, and they slow down Windows File Explorer and file management in general quite a bit. RunDevNodeClean downloads the utility from Microsoft, unpacks it, runs the appropriate (32-bit or 64-bit) binary, and then cleans up after itself.
# wt_removeGhosts: remove ghost devices from Windows

Over time, Windows accumulates 'ghost devices', devices which can show up in Device Manager as transparent because they aren't actually there, but things are set up if they are plugged in again. This applies to anything and everything, including motherboard device objects replaced during driver updates, VSS items, USB sticks inserted and removed, really anything at all. This contributes greatly to slowdown of an old OS install image. And removeGhosts removes them all. This is not Ponderworthy code, but it's great stuff. We run our own fork of it just in case.
# TweakNTFS: Tweak NTFS for Performance and Reliability

FSUTIL is a Windows command with amazing abilities. In TweakNTFS we have it used programmatically within PowerShell to produce a fairly well-balanced approach, performance increase with reliability increase too, for all NTFS volumes currently mounted.
# OWTAS: Optimize Service Work Items and Additional/Delayed Worker Threads

This tool sets a number of additional critical and delayed worker threads, plus service work items. The changes are autocalculated according to a combination of RAM and OS bit-width (32 vs. 64). Performance will increase, more so with more RAM.

Documentation on these settings has ranged from sparse to none over many years. The early Microsoft documents used in the calculations appear completely gone, there are some new ones. The settings produced by OWTAS have undergone continuous testing since 2006, on a wide variety of Wintelamd platforms, and appear to work well on all.

OWTAS is available as VBS and as PowerShell. Future development will be in PowerShell.

The tool is designed for Windows 10/2019 down through XP/2003. It is self-elevating if run non-administratively.
# TOSC: Turn Off Share Caching

This tool is no longer run automatically by any of the OPTIMIZE items. Newer Microsoft operating systems handle share caching much better. But it is still available in the Tools area.

By default in Windows since XP/2003, if a folder is shared to the network via SMB, so-called "caching" is turned on. This actually means that the Offline Files service on other machines accessing the share, are allowed to retrieve and store copies of files and folders on the machine acting as server. Turning this off for all shares gives a speed bump for the server machine, and also improves reliability overall, dependence on Offline Files can lead to all sorts of issues including data loss when the server is not available or suddenly becomes available et cetera. TOSC does this very well, for all file shares extant on the machine on which it is run.
# OVSS: Optimize VSS

By default, on Windows client OS systems, VSS is active on all VSS-aware volumes, but it is not optimized, which in this case means, there is an "association" or preallocation, of zero space. On Windows server OS systems, VSS is likewise active, but there is no association/preallocation, at all, on any VSS-aware volumes. Many different (e.g., StorageCraft, Carbonite, others) Windows tools make the same recommendation concerning this, stating that every volume to be backed up should have 20% of its space "associated" or preallocated for VSS. OVSS does this, and also, removes all orphan shadows. Orphan shadows are VSS snapshots existing uselessly because of old aborted backups, adding OS volume-related overhead. The manual steps of this script, with one additional optional step very useful in some server configurations, are documented here.
# CATE: (C)lean (A)ll system and user profile (T)emp folders, (E)tcetera

For quite a while I had been curious as to why a simple method to do this was not available. CCLEANER and others do not reach into every user profile, and on many machines this is crucial, e.g., terminal servers. CATE was originated as a .VBS by the excellent David Barrett ( http://www.cedit.biz ) and has been rewritten thoroughly by yours truly (JEB of Ponderworthy). The current VBS is here. But the most recent version is a PowerShell script, which adds removal of Ask Partner Network folders from user profiles, and a good bit of speed and clean running; future development will be in PowerShell.

One thing discovered along the way, is even in XP there was a user profile called the “System Profile” — XP had it in C:\WINDOWS\System32\config\systemprofile — and some malware dumps junk into it, and sometimes many gigs of unwanted files can be found in its temporary storage. CATE cleans all user profiles including those, as well as the Windows Error Reporting cache, and the system TEMP folders, and in recent versions, many Windows log files which are often found in many thousands of fragments.

The tool is designed for Windows 10/2019 down through XP/2003. It is self-elevating if run non-administratively.
# TweakHardware: turn off much USB power management, and optimize NICs for performance

By default, USB root hubs turn themselves off when idle, which has the effect of disabling many USB devices plugged in. TweakHardware disables as much of the automatic shutoff as it can (not all, yet). It also optimizes NICs for performance. It can cause NICs to pause briefly.
