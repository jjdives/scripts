$userName = $args[0]

$userID = oktaGetUserByID -userName $userName -oOrg prod | Select-Object -ExpandProperty id

ForEach($user in $userID){
    $factors = oktaGetFactorsbyUser -uid $user -oOrg prod | Where-Object {$_.Status -ieq 'ACTIVE'} | Select-Object -ExpandProperty factorType
    Write-Host "$userName"
    ForEach ($factor in $factors) {
        Write-Host "$factor"
    }

        Write-Host "`n"
 }