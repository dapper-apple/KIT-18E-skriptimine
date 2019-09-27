#
<#
  

Get-Command -Module *hyper-v*
update-help
Get-help new-vm
New-VM

New-VM -Name "new 1" -MemoryStartupBytes 1GB
mkdir c:\Hyper-V\vhd\


New-VM -Name "new 2" -MemoryStartupBytes 1GB -NewVHDPath $vhdasukoht\base.vhdx -NewVHDSizeBytes 4GB -WhatIf


#>


function Kustuta-Masinad ()
{
    Get-vm | Remove-VM 
    Remove-Item C:\Hyper-V\vhd\*.vhdx
    Write-Host "Puhastatud"
}





function Loo-Masin ($Nimi, $VhdKaust, $VhdSuurus)
{ 
    $vhd = $VhdKaust + $Nimi + ".vhdx"
    New-VM -Name $Nimi -Generation 2 -NewVHDPath $vhd -NewVHDSizeBytes $VhdSuurus
}

