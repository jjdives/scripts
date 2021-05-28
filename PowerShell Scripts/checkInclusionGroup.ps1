$RAGroup = Get-ADGroupMember -Identity 'WFH-VDI' | Select -ExpandProperty SamAccountName
$RAGroup += Get-ADGroupMember -Identity 'WFH-Workspaces' | Select -ExpandProperty SamAccountName
$RAGroup += Get-ADGroupMember -Identity 'WFH-Luminate' | Select -ExpandProperty SamAccountName

$TOTPGroup = Get-ADGroupMember -Identity 'WFH-TOTP' | Select -ExpandProperty SamAccountName
$TOTPGroup += Get-ADGroupMember -Identity 'VDI-WFH-TOTP' | Select -ExpandProperty SamAccountName

ForEach ($user in $RAGroup){
    if($TOTPGroup -notcontains $user) {
        Write-Host $user
    }
}