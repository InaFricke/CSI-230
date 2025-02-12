function ApacheLogs1() {

$TableRec =  @() #emty array

    $logsNotFormatted = Get-Content -Path C:\xampp\apache\logs\access.log

  for( $i = 0; $i -lt $logsNotFormatted.count; $i++) {

  
  $words = $logsNotFormatted[$i].Split(" ");
   
  $TableRec += [pscustomobject]@{"IP" = $words[0]; `
                                 "Time" = $words[3].Trim('[') ; `
                                 "Method" = $words[5].Trim('"') ; `
                                 "Page" = $words[6] ; `
                                 "Protocol" = $words[7].Trim('"') ; `
                                 "Response" = $words[8].Trim('"') ; `
                                 "Referrer" = $words[10].Trim('"') ; } `
                               
                                
  }

  return $TableRec | Where-Object { $_.IP -like "10.*" }
  }

  clear
  $TR = ApacheLogs1 
  $TR
  $TR | Format-Table -AutoSize -Wrap
