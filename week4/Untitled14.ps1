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

$ips | Where-Object { $_.IP -ilike "10.*" } 

