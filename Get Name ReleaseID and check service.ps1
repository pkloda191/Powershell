Write-Host "Processor Name"
Get-WmiObject Win32_Processor | Format-Table Name
#win32_processor contains processor information and name field
#name contains the model manufacturer and speed
#format-table gets it to display just the name

$ReleaseID = (Get-ItemProperty -Path ‘HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion’).ReleaseId 
#store windows version in ReleaseID, registry location from source
Write-Host "The Windows ReleaseID is:" $ReleaseID

$ServiceName = "netlogon" #choose the name of the service 
$arrService = Get-Service -Name $ServiceName #get-service has a built in status function, can return whether something is running
if ($arrService.Status -eq 'Running') #determines whether the service is running or not
    {
        Write-Host "Service" $ServiceName "is running"
    }
else
    {
        Write-Host "Service" $ServiceName "is not running"
    }#print whether running or not

Read-Host -Prompt "Press Enter to exit" #this prevents the powershell window from closing immediately when ran


<# Referenecs
Getting CPU Info
https://docs.microsoft.com/en-us/windows/desktop/cimwin32prov/win32-processor
https://docs.microsoft.com/en-us/powershell/scripting/getting-started/cookbooks/getting-wmi-objects--get-wmiobject-?view=powershell-6

Registry location of release id and how to get the property
https://myitforum.com/getting-just-the-windows-10-release-id-using-powershell/

How to check whether a service is running, modified with the else statement
https://stackoverflow.com/questions/35064964/powershell-script-to-check-if-service-is-started-if-not-then-start-it

Stop the cmd box from disappearing immediately when ran
https://devtipscurator.wordpress.com/2017/02/01/quick-tip-how-to-wait-for-user-keypress-in-powershell/
#>