function Apache-Logs.ps1($page, $http, $Browser){

$result1 = Get-Content -Path C:\xampp\apache\logs\access.log | Select-String $page
$result2 =  $result1 | Select-String $http
$result3 = $result2 | Select-String $Browser

return $result3
}

Apache-Logs.ps1 "index.html" 200 "Chrome"