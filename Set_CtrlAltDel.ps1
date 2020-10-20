function Set_CtrlAltDel
{
    Param(
        [switch]$DisableLockWorkstation,
        [switch]$EnableLockWorkstation,
        [switch]$DisableTaskMgr,
        [switch]$EnableTaskMgr,		
        [switch]$DisableLogOff,
        [switch]$EnableLogOff,
        [switch]$DisableChangePWD,
        [switch]$EnableChangePWD,	
        [switch]$DisableSwitchUser,
        [switch]$EnableSwitchUser			
    )

    $Path_System = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\System'
    $Path_Explorer = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer'

    If ($DisableLockWorkstation -and $EnableLockWorkstation)
    {
        Write-Warning 'Specify DisableLockWorkstation OR EnableLockWorkstation'
        return
    }

    If ($DisableTaskMgr -and $EnableTaskMgr)
    {
        Write-Warning 'Specify DisableTaskMgr OR EnableTaskMgr'
        return
    }
	
    If ($DisableLogOff -and $EnableLogOff)
    {
        Write-Warning 'Specify DisableLogOff OR EnableLogOff'
        return
    }	
	
    If ($DisableChangePWD -and $EnableChangePWD)
    {
        Write-Warning 'Specify DisableLogOff OR EnableLogOff'
        return
    }	
		
    If ($DisableSwitchUser -and $EnableSwitchUser)
    {
        Write-Warning 'Specify DisableSwitchUser OR EnableSwitchUser'
        return
    }		

    If ($DisableLockWorkstation)
    {
        If (!(Test-Path -Path $Path_System))
        {
            New-Item -Path $Path_System | Out-Null
        }
        New-ItemProperty -Path $Path_System -Name DisableLockWorkstation -Value 1 -Force -ErrorAction SilentlyContinue | Out-Null
    }

    If ($EnableLockWorkstation)
    {
		Set-ItemProperty -path $Path_System -name DisableLockWorkstation -value 0 -Force -ErrorAction SilentlyContinue | Out-Null		
    }

    If ($DisableTaskMgr)
    {
        If (!(Test-Path -Path $Path_System))
        {
            New-Item -Path $Path_System | Out-Null
        }
        New-ItemProperty -Path $Path_System -Name DisableTaskMgr -Value 1 -Force -ErrorAction SilentlyContinue | Out-Null
    }

    If ($EnableTaskMgr)
    {
		Set-ItemProperty -path $Path_System -name DisableTaskMgr -value 0 -Force -ErrorAction SilentlyContinue | Out-Null				
    }
	
    If ($DisableLogOff)
    {
        If (!(Test-Path -Path $Path_Explorer))
        {
            New-Item -Path $Path_Explorer | Out-Null
        }
        New-ItemProperty -Path $Path_Explorer -Name NoLogoff -Value 1 -Force -ErrorAction SilentlyContinue | Out-Null
    }	
	
    If ($EnableLogOff)
    {
		Set-ItemProperty -path $Path_Explorer -name NoLogoff -value 0 -Force -ErrorAction SilentlyContinue | Out-Null						
    }	

    If ($DisableChangePWD)
    {
        If (!(Test-Path -Path $Path_System))
        {
            New-Item -Path $Path_System | Out-Null
        }
        New-ItemProperty -Path $Path_System -Name DisableChangePassword -Value 1 -Force -ErrorAction SilentlyContinue | Out-Null
    }	
	
    If ($EnableChangePWD)
    {
		Set-ItemProperty -path $Path_System -name DisableChangePassword -value 0 -Force -ErrorAction SilentlyContinue | Out-Null								
    }	
	
    If ($DisableSwitchUser)
    {
        If (!(Test-Path -Path $Path_System))
        {
            New-Item -Path $Path_System | Out-Null
        }
        New-ItemProperty -Path $Path_System -Name HideFastUserSwitching -Value 1 -Force -ErrorAction SilentlyContinue | Out-Null
    }	
	
    If ($EnableSwitchUser)
    {
		Set-ItemProperty -path $Path_System -name HideFastUserSwitching -value 0 -Force -ErrorAction SilentlyContinue | Out-Null								
    }	
}




# Set_CtrlAltDel -DisableLogOff -DisableChangePWD
# Set_CtrlAltDel -EnableLogOff -EnableChangePWD
# Set_CtrlAltDel -DisableLockWorkstation -DisableTaskMgr -DisableLogOff -DisableChangePWD
# Set_CtrlAltDel -EnableLockWorkstation -EnableTaskMgr -EnableLogOff -EnableChangePWD
