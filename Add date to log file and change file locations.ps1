$ScriptDir = Split-Path $script:MyInvocation.MyCommand.Path
$Date = Get-Date -Format FileDate
$Time = Get-Date -Format T
#https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/get-date?view=powershell-6
#gets the directory in which the script is being executed in
For ($i=1; $i -le 2; $i++) #loop through twice
{
[string]$filePath = $ScriptDir + "\program"+$i+"_log.txt";
#append the file name to the script directory so it knows what to rename, increments 1 and 2
#1st loop - $filePath = C:\Users\cuwsupport\Desktop\log\program1_log.txt"
#2nd loop - $filePath = C:\Users\cuwsupport\Desktop\log\program2_log.txt"

[string]$strippedFileName = [System.IO.Path]::GetFileNameWithoutExtension($filePath);
#takes the name of the file before the .txt
#1st loop - pass in $filePath and $strippedFileName = program1_log
#2nd loop - pass in $filePath and $strippedFileName = program2_log

[string]$newFileName = $strippedFileName + [DateTime]::Now.ToString("_yyyyMMdd") +".txt";
#appends the date and the file extension to the file
#1st loop - program1_log_20181022.txt
#2nd loop - program2_log_20181022.txt

[string]$newFilePath = [System.IO.Path]::Combine($ScriptDir, "prog"+$i+"_logs", $newFileName);
#determines and stores where to put the new file by combining the directory, the folder name, and then the new file name
#1st loop - C:\Users\cuwsupport\Desktop\log\prog1_logs\program1_log_20181022.txt
#2nd loop - C:\Users\cuwsupport\Desktop\log\prog2_logs\program2_log_20181022.txt

#https://stackoverflow.com/questions/1954203/timestamp-on-file-name-using-powershell

Move-Item -LiteralPath $filePath -Destination $newFilePath;
#move from base folder to prog1,prog2 folders
#https://social.technet.microsoft.com/Forums/windows/en-US/848b28c2-1ec2-405a-aebd-48bf79a9594f/how-to-move-files-from-one-location-to-another-location-using-powershell?forum=winserverpowershell

Add-Content ($ScriptDir + "\scriptlog.txt") "Log $i $Date Rename and copy successful at $Time";
#bonus writes to the scriptlog.txt
#https://www.faqforge.com/powershell/append-data-text-file-using-powershell/
}
pause;