Import-Module WebAdministration
$Prefix = "ajax"
$SecurityGroupName = "Performance Monitor Users"

try {
  $Group = Get-LocalGroup $SecurityGroupName

  If ($Group -eq $Null) {
    Write-Host "Group [$SecurityGroupName] doesn't exist." -ForegroundColor Red
    Return
  }

  $MemberNames = Get-LocalGroupMember -Group $SecurityGroupName | Select-Object -ExpandProperty Name

  Get-ChildItem -Path "IIS:\AppPools" | ForEach-Object {

    $AppPoolName = $_.Name
  
    If ($AppPoolName.StartsWith($Prefix)) {
      $MemberName = "IIS AppPool\$AppPoolName"
      If ($MemberNames -notcontains $MemberName) {
        Write-Host "Adding [$MemberName] to [$SecurityGroupName]" -ForegroundColor Magenta
        Add-LocalGroupMember -Group $SecurityGroupName -Member $MemberName
      } Else {
        Write-Host "[$SecurityGroupName] already has member: [$MemberName]" -ForegroundColor Yellow
      }
    }
  }
}
catch {
  Write-Host "If the error is something about an array, go to Computer Management -> 'Local Users and Groups' -> 'Groups'" -ForegroundColor Cyan
  Write-Host "Double click on 'Performance Monitor Users' and delete the old IIS users (with Question Marks icon)" -ForegroundColor Cyan
  Write-Host $_.Exception.Message -ForegroundColor Red
}