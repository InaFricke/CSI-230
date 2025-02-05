<# #Dev 3
Get-Content -Path C:\xampp\apache\logs\access.log #>

<#Dev 4
Get-Content -Path C:\xampp\apache\logs\access.log -TotalCount 5 #>

<#Dev 5
Get-Content -Path C:\xampp\apache\logs\access.log | Select-String ' 404 ',' 400 ' #>

<#Dev 6
Get-Content -Path C:\xampp\apache\logs\access.log | Select-String ' 200 ' , ' OK ' -NotMatch #>

<#Dev 7

$A = Get-ChildItem -Path C:\xampp\apache\logs\*.log | Select-String "error" 

$A[-4 .. -1] #>

#Dev 8
#get 404 logs

$404 = Get-Content -Path C:\xampp\apache\logs\access.log | Select-String ' 404 '

#define regex for IP addresses

$regex = [regex] "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}"

# Match records for IP fits

$iplist = $regex.Matches($404)
 

#Get ips as pscustomobject
$ips = @()

for($i=0; $i -lt $iplist.count; $i++){

$ips += [pscustomobject]@{ "IP" = $iplist[$i].Value; }
}


$iprep = $ips | Where-Object { $_.IP -ilike "10.*" } 
$counts = $iprep | Group-Object -Property IP
$counts  | Select-Object Count, Name






