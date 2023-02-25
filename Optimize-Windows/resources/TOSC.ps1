
<#PSScriptInfo

.VERSION 1.13

.GUID c5bed407-028e-4963-bfde-7fad2d640a1a

.AUTHOR Jonathan E. Brickman

.COMPANYNAME Ponderworthy Music

.COPYRIGHT (c) 2019 Jonathan E. Brickman

.TAGS

.LICENSEURI https://opensource.org/licenses/BSD-3-Clause

.PROJECTURI https://github.com/jebofponderworthy/windows-tools

.ICONURI

.EXTERNALMODULEDEPENDENCIES 

.REQUIREDSCRIPTS

.EXTERNALSCRIPTDEPENDENCIES

.RELEASENOTES
TOSC
By default in Windows since XP/2003, if a folder is shared to the network via SMB,
so-called caching is turned on. This actually means that the Offline Files service
on other machines accessing the share, are allowed to retrieve and store copies of
files and folders on the machine acting as server. Turning this off for all shares
gives a speed bump for the server machine, and also improves reliability overall,
dependence on Offline Files can lead to all sorts of issues including data loss
when the server is not available or suddenly becomes available et cetera. TOSC does
this turning off very well, for all file shares extant on the machine on which
it is run.

.PRIVATEDATA

#> 

















<#

.DESCRIPTION 
TOSC - Turn Off Share Caching

#>

Param()


################################
#    Turn Off Share Caching    #
################################

#
# by Jonathan E. Brickman
#
# By default in Windows since XP/2003, if a folder is shared to the network via SMB,
# so-called "caching" is turned on. This actually means that the Offline Files service
# on other machines accessing the share, are allowed to retrieve and store copies of
# files and folders on the machine acting as server. Turning this off for all shares
# gives a speed bump for the server machine, and also improves reliability overall,
# dependence on Offline Files can lead to all sorts of issues including data loss
# when the server is not available or suddenly becomes available et cetera. TOSC does
# this turning off very well, for all file shares extant on the machine on which
# it is run.
#
# Copyright 2018 Jonathan E. Brickman
# https://notes.ponderworthy.com/
# This script is licensed under the 3-Clause BSD License
# https://opensource.org/licenses/BSD-3-Clause
# and is reprised at the end of this file
#

''
''
'****************************'
'   Turn Off Share Caching   '
'****************************'
''
''

# Self-elevate if not already elevated.

if (([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
    {
    "Running elevated; good."
    ""
    }
else {
    "Not running as elevated.  Starting elevated shell."
    Start-Process powershell -WorkingDirectory $PSScriptRoot -Verb runAs -ArgumentList "-noprofile -noexit -file $PSCommandPath"
    return "Done. This one will now exit."
    ""
    }

# Get list of shares and set appropriately.
Get-CimInstance -class Win32_Share | ForEach-Object {
	if ( $_.Name -ne 'IPC$' ) {
		"Turning off share caching for " + $_.Name
		Set-SmbShare -Name $_.Name -CachingMode None -Force -ErrorAction SilentlyContinue
		}
	}
	
""


# The 3-Clause BSD License

# SPDX short identifier: BSD-3-Clause

# Note: This license has also been called
# the "New BSD License" or "Modified BSD License".
# See also the 2-clause BSD License.

# Copyright 2017 Jonathan E. Brickman

# Redistribution and use in source and binary
# forms, with or without modification, are
# permitted provided that the following conditions are met:

# 1. Redistributions of source code must retain the
# above copyright notice, this list of conditions and
# the following disclaimer.

# 2. Redistributions in binary form must reproduce the
# above copyright notice, this list of conditions and
# the following disclaimer in the documentation and/or
# other materials provided with the distribution.

# 3. Neither the name of the copyright holder nor the
# names of its contributors may be used to endorse or
# promote products derived from this software without
# specific prior written permission.

# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
# CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES,
# INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
# OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER
# OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
# INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
# (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE
# GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
# BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
# LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT
# OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.


