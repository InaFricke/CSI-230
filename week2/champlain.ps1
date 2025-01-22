#check if chrome is running assign it
$chromePro = Get-Process -Name "chrome"
if ($chromePro -eq $null) {
Start-Process "chrome.exe" "https://www.champlain.edu/"
} else {
Stop-Process -Name "chrome" -Force
}