#

<#

Get-Command -Module *hyper-V*
Update-Help
Get-help New-VM
New-VM

New-VM -Name "new 1" -MemoryStartupBytes 1GB
mkdir C: \Hyper-V\vhd\

New-VM -Name "new 2" -MemoryStartupBytes 1GB -NewVHDPath $vhdasukoht\base.vhdx -NewVHDSizeBytes 4GB -WhatIf
Remove-Item C:\Hyper-V\vhd\*.vhdx

$vmname = "masin1"
$vhdasukoht = "C: \Hyper-V\vhd\"
$vhd = $vhdasukoht + $vmname + ".vhdx"
$vhdsize = 100GB
New-VM -Name $vmname -Generation 2 -NewVHDPath $vhd -NewVHDSizeBytes $vhdsize

#>

function Remove-MyVMS ()
{
    Get-VM | Remove-VM
    Remove-Item C:\Hyper-V\vhd\*.vhdx
    Write-Host "Puhastatud"
    
}


function New-MyVM ($Nimi, $vhdkaust, $vhdsuurus )
{
    
    $vhd = $vhdkaust + $Nimi + ".vhdx"
    $vm =  New-VM -Name $Nimi -Generation 2 -NewVHDPath $vhd -NewVHDSizeBytes $VhdSuurus
    Set-VMProcessor -Count $cpucount -VMName $vm.VMName

}


$konf = Import-Csv C:\Users\toivo.parnpuu\Documents\GitHub\KIT-18E-skriptimine\Toivo.P\vm-conf.csv -UseCulture

foreach ($e in $konf)
{

    New-MyVM -Nimi $e.Vmname -VhdKaust $e.vhd_dir -VhdSuurus 100GB -cpucount $e.CPU_count
}


for ($i = 1; $1 -lt 11; $i++) {
    $Nimi = "masin" + $i
    $vhdsuurus = $i * 1024 * 1024 * 1024
    New-MyVM -Nimi $Nimi -VhdKaust C:\Hyper-V\vhd\ -Vhdsuurus $vhdsuurus 

}