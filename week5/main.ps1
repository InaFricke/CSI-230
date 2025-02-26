. (Join-Path $PSScriptRoot GatherClasses.ps1)

. (Join-Path $PSScriptRoot DaysTranslator.ps1)


$FullTable = gatherClasses

$FullTable = daysTranslator $FullTable

#i List all the classes of the instructor Furkan Paligu
#$FullTable | Select-Object "Class Code" , Instructor, Location, Days, "Start Time", "End Time" | Where-Object {$_.Instructor -ilike "*Paligu"}

#ii List all the classes of JOYC 310 on Mondays, only display Class Code and Times. Sort by Start Time

#$FullTable | Where-Object { ($_.Location -ilike "JOYC 310") -and ($_.Days -ilike "Monday") } | Select-Object "Start Time", "End Time", "Class Code"

#iii

#Make a list of all the instructors that teach at least 1 course in one of the courses: SYS, NET, SEC, FOR, CSI, DAT

$ITSInstructors = $FullTable | Where-Object { ($_."Class Code" -ilike "SYS*") -or`
                            ($_."Class Code" -ilike "NET*") -or`
                            ($_."Class Code" -ilike "SEC*") -or`
                            ($_."Class Code" -ilike "FOR*") -or`
                            ($_."Class Code" -ilike "CSI*") -or`
                            ($_."Class Code" -ilike "DAT*") } `
#| Select-Object Instructor | Sort-Object Instructor -Unique

#$ITSInstructors


#iv Group all the instructors by the number of classes they are teaching, sort by the number of classes they are teaching


$FullTable | Where {$_.Instructor -in $ITSInstructors.Instructor }| Group-Object -Property "Instructor" | Select-Object Count, Name | Sort-Object Count -Descending

