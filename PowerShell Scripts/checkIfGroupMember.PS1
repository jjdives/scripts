$user = $args[0]

$groups = 'WFH-VDI', 'WFH-TOTP', 'WFH-PCI', 'WFH-Workspaces', 'WFH-Luminate', 'VDI-WFH-TOTP'

foreach ($group in $groups) {
    $members = Get-ADGroupMember -Identity $group -recursive | Select -ExpandProperty SamAccountName

    If ($members -contains $user) {
        Write-Host "$user is a member of $group"
    } Else {
        Write-Host "$user is not a member of $group"
    }
}