$userName = $args[0]

$userID = oktaGetUserByID -userName $userName -oOrg prod | Select-Object -ExpandProperty id

$factorCount = oktaGetFactorsbyUser -uid $userID -oOrg prod | Where-Object {$_.Status -ieq 'ACTIVE'} | `
               Select-Object -ExpandProperty factorType | `
               Measure-Object | Select-Object -ExpandProperty Count
Write-Host "$userName`t$factorCount"
