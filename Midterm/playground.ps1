function AL {

$logsnotformatted = Get-Content C:\Users\champuser\SYS320-01\Midterm\access.log

$TR = @()

for($i=0; $i -lt $logsnotformatted.Count; $i++){

$words = $logsnotformatted[$i].Split(" ");

$TR += [pscustomobject]@{ "IP" = $words[0]; `
                          "Time" = $words[3].Trim('[') ; `
                          "Method" = $words[5].Trim('"') ; `
                          "Page" = $words[6] ; `
                          "Protocol" = $words[7] ; `
                          "Response" = $words[8]; `
                          "Referrer" = $words[10]; `
                                    }
}
return $TR
}

function checkPages {

    $validPages = Get-Content -Path C:\Users\champuser\SYS320-01\Midterm\access.log | Select-String $page

    Write-Host $validPages

}




