Get-EventLog -LogName Security -Newest 1

(get-vm)[0] | Export-Csv -Path C:\Users\toivo.parnpuu\Desktop\test.csv 
 $vmmem = Get-VMMemory -VMName (get-vm)[0].Name
#Set-VMMemory -DynamicMemoryEnabled $false -VMName (get-vm)[0].Name
 $cred = Get-Credential
 $vmmem
Send-MailMessage -Body $vmmem -From "toivo.parnpuu@tptlive.ee" -Subject "test" -SmtpServer "mail.office365.com" -To "toivo.parnpuu@tptlive.ee" -Credential $cred  -UseSsl 