function SendAlertEmail($Body){

$From = "ina.fricke@mymail.champlain.edu"
$To = "ina.fricke@mymail.champlain.edu"
$Subject = "Sus Activity" 

$Password = "pjow nzsb syae qqic" | ConvertTo-SecureString -AsPlainText -Force
$Credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $From, $Password

Send-MailMessage -From $From -To $To -Subject $Subject -Body $Body -SmtpServer "smtp.gmail.com" `
-port 587 -UseSsl -Credential $Credential

}

#SendAlertEmail "Body of Email"