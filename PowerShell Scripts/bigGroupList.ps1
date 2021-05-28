$Group = $args[0]
function Big-GroupList {
    [cmdletbinding()]
    Param(
    [Parameter(Position=0,ValueFromPipeline,ValueFromPipelineByPropertyName)]
    [ValidateNotNullorEmpty()]
    [string]$Name)

    Begin {
        Write-Verbose "Starting $($MyInvocation.MyCommand)"
    } #begin

    Process {
        Write-Verbose "Retrieving members from $Name"
        $mygroup = Get-ADGroup -Identity $Name -Properties Members

        foreach ($member in $mygroup.members) {
          $object = $member | Get-ADObject -Properties name, samaccountname
          if ($object.ObjectClass -eq 'Group') {
            Write-Verbose "Found nested group $($object.distinguishedname)"
            #recursively run this command for the nested group
            & $MyInvocation.MyCommand -name $object.distinguishedname
          } 
          else {
           Select-Object -InputObject $object -ExpandProperty samaccountname
          }
        } #foreach
    } #process

    End {
            Write-Verbose "Ending $($MyInvocation.MyCommand)"
    } #end

}

Big-GroupList($Group)

