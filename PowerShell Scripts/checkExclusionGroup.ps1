#ToDo Fix this to use the Big Group List instead to make it more stable. 
$RAGroup = Get-ADGroupMember -Identity 'WFH-VDI' | Select name
$RAGroup += Get-ADGroupMember -Identity 'WFH-Workspaces' | Select name
$RAGroup += Get-ADGroupMember -Identity 'WFH-Luminate' | Select name

$ExclusionGroup = Get-ADGroupMember -Identity 'WFH-PCI' | Select name

ForEach ($u in $RAGroup){
    if($ExclusionGroup -contains $u) {
        Write-Host $user
    }
}


