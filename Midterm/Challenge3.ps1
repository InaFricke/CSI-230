$logsnotformatted = Get-Content C:\Users\champuser\SYS320-01\Midterm\access.log
$indicators = @("etc/passwd", "cmd=", "/bin/bash" , "/bin/sh", "1=1#" , "1=1--")  # Example indicators to filter by

$TR = @()

for ($i = 0; $i -lt $logsnotformatted.Count; $i++) {
    $words = $logsnotformatted[$i].Split(" ")

    # Ensure Page field exists and is not empty
    if ($words.Count -gt 6 -and -not [string]::IsNullOrWhiteSpace($words[6])) {
        $logEntry = [pscustomobject]@{
            "IP"        = $words[0]
            "Time"      = $words[3].Trim('[')
            "Method"    = $words[5].Trim('"')
            "Page"      = $words[6]
            "Protocol"  = $words[7]
            "Response"  = $words[8]
            "Referrer"  = $words[10]
        }

        # Check if the Page field contains any of the indicators
        if ($indicators | Where-Object { $logEntry.Page -match $_ }) {
            $TR += $logEntry
        }
    }
}

# Return filtered results in table
return $TR | Format-Table -AutoSize -Wrap
