Param(
    $downloadFolder = "$PSScriptRoot",
    $redisVersion = "3.0.504"
)

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

## Verify elevated
## https://superuser.com/questions/749243/detect-if-powershell-is-running-as-administrator
$elevated = [bool](([System.Security.Principal.WindowsIdentity]::GetCurrent()).groups -match "S-1-5-32-544")
if ($elevated -eq $false)
{
    throw "In order to install services, please run this script elevated."
}

function downloadAndUnzipIfRequired
{
    Param(
        [string]$toolName,
        [string]$toolZip,
        [string]$toolSourceFile
    )

    if(!(Test-Path -Path $toolZip))
    {
        Write-Host "Downloading $toolName...$toolSourceFile"
        <#
        Start-BitsTransfer -Source $toolSourceFile -Destination $toolZip
        # github releases has issues with BitsTransfer
        # Invoke-WebRequest is very slow in PowerShell 5.1 when showing progress bar
        #>
        $previousProgressPreference = $ProgressPreference
        $ProgressPreference = 'SilentlyContinue'
        Invoke-WebRequest -Uri $toolSourceFile -OutFile $toolZip 
        $ProgressPreference = $previousProgressPreference
    }

    if(!(Test-Path -Path $toolZip))
    {
        Write-Error "Unable to find $toolZip or download $toolSourceFile" -ErrorAction Stop
    }
}

## Install Redis

$redisFileName = "Redis-x64-$redisVersion.msi"
$redisPackage = "https://github.com/microsoftarchive/redis/releases/download/win-$redisVersion/$redisFileName"

# download & extract the nvm archive to the right folder
downloadAndUnzipIfRequired "Redis" $redisFileName $redisPackage $downloadFolder -ErrorAction Stop

# run installation silently
Write-Host "Installing Redis"
Start-Process msiexec.exe -ArgumentList "/I $PSScriptRoot\$redisFileName /q" -Wait
Write-Host "Done"
Remove-Item -Path $PSScriptRoot\$redisFileName