﻿ Get-NetFirewallRule | Where {$_.Enabled -eq 'True' -and $_.Direction -eq 'Inbound'} |

>> Format-Table -Property Name,
>> DisplayName,
>> DisplayGroup,
>> @{Name='Protocol';Expression={($PSItem | Get-NetFirewallPortFilter).Protocol}},
>> @{Name='LocalPort';Expression={($PSItem | Get-NetFirewallPortFilter).LocalPort}},
>> @{Name='RemotePort';Expression={($PSItem | Get-NetFirewallPortFilter).RemotePort}},
>> @{Name='RemoteAddress';Expression={($PSItem | Get-NetFirewallAddressFilter).RemoteAddress}},
>> Enabled,
>> Profile,
>> Direction,
>> Action