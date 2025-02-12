<#1 (Get IPv4 Add From Ethernet interface print out IP)

Get-NetIPAddress -InterfaceAlias 'Ethernet*' | Select-Object InterfaceAlias, IPAddress
#>

<# 2 (Get IPV4 Prefix Length)
(Get-NetIPAddress -InterfaceAlias 'Ethernet*').PrefixLength
#>

<# 3 and 4 (Win32 classes that start with net, alphabetically sorted)
Get-WmiObject -List | Where-Object { $_.Name -ilike "Win32_net*" } | Sort-Object
#>

<# 5 (DHCP server IP)
Get-CimInstance Win32_NetworkAdapterConfiguration -Filter "DHCPEnabled=$true" | Select DHCPServer
#>

<# 6 (DHCP server IP no heading)
(Get-CimInstance Win32_NetworkAdapterConfiguration -Filter "DHCPEnabled=$true").DHCPServer
#>

<# 7 (Get DNS server IP for ethernet interface. Display the first one)
Get-DnsClientServerAddress -InterfaceAlias 'Ethernet*' | Where-OBJECT { $_.InterfaceAlias -ilike "Ethernet0" }).ServerAddresses[0]
#>

<# 8 (list all ps1 files in the working directory)
Get-ChildItem -File -Filter *.ps1 
#>

<# 9 (create folder if it does not exist)
$folderpath="outfolder"
if (Test-Path -Path $folderpath) {
Write-Host "Folder already exists"
}
else {
New-Item -Path $folderpath -ItemType Directory
}
#>
<#10 (Create out.csv in outfolder directory)

$folderpath="outfolder/"
$filePath = Join-Path $folderpath "out.csv"

Get-ChildItem -File -Filter *.ps1 | Export-Csv -Path $FilePath 
# Get-Content outfolder/out.csv (to check) #>

#11 (find .csv files and change extension to .log, then diplay all files)

$files = Get-ChildItem -Filter *.csv -Recurse 
$files | Rename-Item -NewName { $_.Name -replace ".csv",".log" }

Get-ChildItem -Filter *.log -Recurse