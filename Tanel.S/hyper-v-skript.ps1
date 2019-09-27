<#
Get-Command -module *hyper-v*
Update-Help
Get-Help New-VM


mkdir "c:\hyperv\vhd\"

New-VM -Name "New 1" -MemoryStartupBytes 1024MB -NewVHDPath $vhdasukoht\base.vhdx -NewVHDSizeBytes 4GB
#>

function Kustuta-Masinad()
{
    Get-VM | Remove-VM
    Remove-Item C:\hyperv\vhd\*.vhdx
    Write-Host "Kustutatud"
}

function Loo-Masin($Nimi, $VhdKaust, $VhdSuurus)
{
  
    $Vhd = $VhdKaust + $Nimi + "HDD" + ".vhdx"
    New-VM -Name $Nimi -Generation 2 -NewVHDPath $Vhd -NewVHDSizeBytes $VhdSuurus
}