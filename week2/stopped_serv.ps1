$stoppedServices = Get-Service | Where-Object {$_.Status -eq "Stopped"} | Sort-Object -Property Name

# get all stopped services name them stopped services, sort services alphabetically  by name

#Export to CSV

$stoppedServices | Export-csv -Path "C:\Users\champuser\SYS320-01\week2\stopped_serv.csv" 