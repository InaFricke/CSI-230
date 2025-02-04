function Get-StartShutdowntimes($days) {

$shutstart = Get-EventLog -LogName system -After (Get-Date).AddDays(-$days) | where-Object {($_.EventID -ilike "6006") -or
                                             ($_.EventID -ilike "6005")} 
 $inouttable = @() #emty array
for( $i = 0; $i -lt $shutstart.count; $i++){
#Event property value
$event = ""
if($shutstart[$i].EventID -eq '6006') {$event="shutdown"}
if($shutstart[$i].EventID -eq '6005') {$event="startup"}

$inouttable += [pscustomobject]@{"Time" = $shutstart[$i].TimeGenerated; `
                                 "ID" = $shutstart[$i].EventID; `
                                 "Event" = $event; `
                                 "User" = "system"; `
                                 }
                                 }
                                return $inouttable
}
$inouttable = Get-StartShutdowntimes 35
$inouttable
