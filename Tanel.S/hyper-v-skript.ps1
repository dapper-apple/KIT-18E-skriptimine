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


function New-MyVM ($Nimi, $VhdKaust, $VhdSuurus, $cpucount, $dynamic, $ram)
{ 
    $vhd = $VhdKaust + $Nimi + ".vhdx"
    $vm =  New-VM -Name $Nimi -Generation 2 -NewVHDPath $vhd -NewVHDSizeBytes $VhdSuurus
    Set-VMProcessor -Count $cpucount -VMName $vm.VMName
    Set-VMMemory -DynamicMemoryEnabled $dynamic -VMMemory $ram
   
}


$konf = Import-Csv C:\Users\opilane\Documents\GitHub\KIT-18E-skriptimine\Toivo.P\vm-conf.csv -Delimiter ";" -Encoding UTF8

foreach ($e in $konf)
{
    $dynamic = $false
    if ($e.dynamic_memory -icontains "TRUE")
{
    $dynamic = $true
}
    
    New-MyVM -Nimi $e.Vmname -VhdKaust $e.vhd_dir -VhdSuurus 100GB -cpucount $e.CPU_count -dynamic $dynamic -ram ($e.'RAM[GB]' *1GB)

}


