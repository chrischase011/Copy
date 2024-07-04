Using module "./Copy.psm1"

Set-ExecutionPolicy Bypass

$copy = [Copy]::new()

Write-Host "Enter the source path:"
$copy.fromPath = Read-Host

Write-Host "Enter the destination path:"
$copy.toPath = Read-Host

$copy.Main()

