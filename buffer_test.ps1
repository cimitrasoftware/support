# Write random text to a file, or to the console
# Author: Tay Kratzer tay@cimitra.com


Param(
[string] $Iterations,
[switch] $Redirect,
[switch] $Sleep
)

$ATextFile = "$PSScriptRoot\test.txt"
$TheLogFile = "$PSScriptRoot\log_buffer_test.txt"

$SleepCounter = 0

$TheDate = Get-Date -Format s


if($Redirect){
    Write-Output ""
    Write-Output "START | $TheDate | $Iterations Iterations | Writing: $TheFile | To: $ATextFile"
    Write-Output "START | $TheDate | $Iterations Iterations | Writing: $TheFile | To: $ATextFile" | Out-File -Append $TheLogFile
    Write-Output ""
}else{
    Write-Output ""
    Write-Output "START | $TheDate | $Iterations Iterations | To: To Console Buffer" | Out-File -Append $TheLogFile
    Write-Output "START | $TheDate | $Iterations Iterations | To: To Console Buffer"
    Write-Output ""

}


Remove-Item $ATextFile -ErrorAction SilentlyContinue


while ($IterationCounter -lt $Iterations){

$IterationCounter++

if($Redirect){

    -join ((65..90) + (97..122) | Get-Random -Count 100 | % {[char]$_}) | Out-File -Append $ATextFile
}else{

     Write-Host -NoNewline "Iteration ($IterationCounter): "
    -join ((65..90) + (97..122) | Get-Random -Count 100 | % {[char]$_})
    #Write-Output "Iteration ($IterationCounter)"
}

if($Sleep){
    Start-Sleep -s 1
}

}


$TheDate = Get-Date -Format s

if($Redirect){
    Write-Output ""
    Write-Output "DONE  | $TheDate | $Iterations Iterations | Writing: $TheFile | To: $ATextFile"
    Write-Output "DONE  | $TheDate | $Iterations Iterations | Writing: $TheFile | To: $ATextFile" | Out-File -Append $TheLogFile\
    Get-Content $TheLogFile
    Write-Output ""
}else{
    Write-Output ""
    Write-Output "DONE  | $TheDate | $Iterations Iterations | To: Console Buffer" | Out-File -Append $TheLogFile
    Write-Output "DONE  | $TheDate | $Iterations Iterations | To: Console Buffer"
    Write-Output ""

}
