Get-Command -Module *hyper-v*

New-VM -Name "uus1" -MemoryStartupBytes 512MB
mkdir c:\Hyper-V\vhd\

New-VM -Name "uus2" -MemoryStartupBytes 1GB -NewVHDPath $vhdasukoht\base.vhdx -NewVHDSizeBytes 4GB -WhatIf

function Kustuta-Masinad ()
{
   Get-VM
Get-vm | Remove-VM
Remove-Item C:\Hyper-V\vhd\*.vhdx
Write-Host "Puhastatud" 
}

Get-VM
Get-vm | Remove-VM
Remove-Item C:\Hyper-V\vhd\*.vhdx
$vmname = "masin1"
$vhdasukoht = "c:\Hyper-V\vhd\" 
$vhd = $vhdasukoht + $vname + ".vhdx"
$vhdsize = 100GB
New-VM -Name $vmname -Generation 2 -NewVHDPath $vhd  -NewVHDSizeBytes $vhdsize



function Loo-Masin ($Nimi, $VhdKaust, $VhdSuurus)
{ 
$vhd = $VhdKaust + $Nimi + ".vhdx"
$VhdSuurus = 100GB
New-VM -Name $Nimi -Generation 2 -NewVHDPath $vhd  -NewVHDSizeBytes $VhdSuurus
}