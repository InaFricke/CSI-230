$folderpath="outfolder"
if (Test-Path -Path $folderpath) {
Write-Host "Folder already exists"
}
else {
New-Item -Path $folderpath -ItemType Directory
}