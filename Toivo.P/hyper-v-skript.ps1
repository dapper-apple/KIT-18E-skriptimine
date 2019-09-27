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


function Remove-MyVMs ()
{
    Get-vm | Remove-VM 
    Remove-Item C:\Hyper-V\vhd*\*.vhdx
    Write-Host "Puhastatud"
}


function New-MyVM ($Nimi, $VhdKaust, $VhdSuurus, $cpucount)
{ 
    $vhd = $VhdKaust + $Nimi + ".vhdx"
    $vm =  New-VM -Name $Nimi -Generation 2 -NewVHDPath $vhd -NewVHDSizeBytes $VhdSuurus
    Set-VMProcessor -Count $cpucount -VMName $vm.VMName

}


$konf = Import-Csv C:\Users\toivo.parnpuu\Documents\GitHub\KIT-18E-skriptimine\Toivo.P\vm-conf.csv -UseCulture

foreach ($e in $konf)
{

    New-MyVM -Nimi $e.Vmname -VhdKaust $e.vhd_dir -VhdSuurus 100GB -cpucount $e.CPU_count
}

