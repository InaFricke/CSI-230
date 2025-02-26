#."c:\Users\champuser\SYS320-O1\week6\Event-Logs.ps1"
."C:\Users\champuser\SYS320-01\week7\Scheduler.ps1"
."C:\Users\champuser\SYS320-01\week7\configuration.ps1"
."C:\Users\champuser\SYS320-01\week7\Email.ps1"

# Obtaining configuration
$configuration = readconfig 
#$configuration.ExecutionTime | Out-String
# Obtaining at risk users
$Failed = "Will be filled later"
# Sending at risk users as email
SendAlertEmail ($Failed | Out-String)

# Setting the script to be run daily 
ChooseTimeToRun ($configuration.ExecutionTime | Out-String)