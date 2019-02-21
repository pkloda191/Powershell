Get-EventLog -LogName Security -UserName "NT*" | Group-Object -Property "UserName" -noelement | Format-Table Count, Name -Auto
Get-EventLog -LogName Security -EntryType FailureAudit -After ((Get-Date).AddDays(-7))
#get date -7 goes back for only a week
pause
#https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/get-eventlog?view=powershell-5.1
#https://social.technet.microsoft.com/Forums/windowsserver/en-US/8b764239-dddf-418e-8108-2c2bafe5aecd/how-to-pull-eventlogs-during-the-last-week-only?forum=winserverpowershell