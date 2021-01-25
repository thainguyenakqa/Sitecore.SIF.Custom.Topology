Push-Location $PSScriptRoot\sxp

# Install Prerequisites.
$prerequisitesParams = @{
    Path = "Prerequisites.json"
}

Install-SitecoreConfiguration @prerequisitesParams *>&1 | Tee-Object prerequisites.log

Pop-Location

Write-Host '###############################################################' -ForegroundColor Yellow
Write-Host 'Restart your computer to make sure .NET 4.8 has been installed.' -ForegroundColor Yellow
Write-Host '###############################################################' -ForegroundColor Yellow