﻿#Records last 14 days
$loginout = Get-EventLog -LogName system -source Microsoft-Windows-Winlogon -After (Get-Date).AddDays(-15)

$inouttable = @() #emty array

for( $i = 0; $i -lt $loginout.count; $i++){

#Event property value
$event = ""
if($loginout[$i].EventID -eq '7001') {$event="logon"}
if($loginout[$i].EventID -eq '7002') {$event="logoff"}

#User property value 

$user = $loginout[$i].ReplacementStrings[1]

$name = New-Object System.Security.Principal.SecurityIdentifier $user

$username = $name.Translate([System.Security.Principal.NTAccount])


#Add each new line to the empty array

$inouttable += [pscustomobject]@{"Time" = $loginout[$i].TimeGenerated; `
                                 "ID" = $loginout[$i].EventID; `
                                 "Event" = $event; `
                                 "User" = $username; `
                                 }
}

$inouttable 