
function readconfig(){

$var = (Get-Content -Path C:\Users\champuser\SYS320-01\week7\configuration.txt).Split("`n")

$table = [pscustomobject]@{ "Days" = $var[0]
                            "ExecutionTime" = $var[1] }

return $table
}


function runmenu(){
$Prompt = "Please choose your operation:`n"
$Prompt += "1 - Show Configuration`n"
$Prompt += "2 - Change Configuration`n"
$Prompt += "3 - Exit`n"

$operation = $true # Starting with true to enter the loop

while($operation){

    Write-Host $Prompt | Out-String
    $choice = Read-Host

    if($choice -eq 3){ # Good idea to start with exit condition
Write-Host "Exiting" | Out-String

exit # Either

$operation = $false # Or


}
elseif($choice -eq 1) { 
$tablereturn = readconfig

 $tablereturn | Out-String

}
else {

$Days = Read-Host "Enter the number of days for which the logs will be obtained"
$ExecutionTime = Read-Host "Enter the daily execution time of the script"

$Days | Out-File configuration.txt
$ExecutionTime | Out-File configuration.txt -Append  

Write-Host "Configuration updated successfully." | Out-String
}
}
}



