for ( $i = 0; $i -lt $args.count; $i++ ) {
    $group = $args[$i]

    write-host "Checking membership of $group"
    Get-ADGroupMember -Identity $group | select -ExpandProperty SamAccountName | Measure-Object | select -ExpandProperty Count

}

