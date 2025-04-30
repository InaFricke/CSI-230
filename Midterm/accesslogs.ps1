function OAL{

# Read the log file
$logsNotFormatted = Get-Content -Path C:\Users\champuser\SYS320-01\Midterm\access.log

# Initialize an empty array
$TableRec = @()

# Process each line of the log
foreach ($line in $logsNotFormatted) {
    # Split the line into words
    $words = $line -split "\s+"

    # Ensure we have enough elements before accessing indexes
    if ($words.Count -ge 11) {
        $TableRec += [PSCustomObject]@{
            "IP"        = $words[0]
            "Time"      = $words[3].TrimStart("[")  # Remove leading bracket
            "Method"    = $words[5].Trim('"')  # Remove quotes around method
            "Page"      = $words[6]
            "Protocol"  = $words[7] # Remove quotes around protocol
            "Response"  = $words[8]
            "Referrer"  = $words[10].Trim('"') # Remove quotes around referrer
        }
    }
}
return $
}
# Output the formatted table
$TableRec | Format-Table -AutoSize
