# PSL - PowerShell Software Library
Scheduled Personal Software Library
Last update - 11-11-2020

On this page is something that I needed but couldn't find anywhere, so made it myself.
I have a lot of tools for work or personal usage, but every month some tool or application gets an update, security patch or feature.
To keep all this up to date in one place can be a pain and a lot of work.

I all ready use Ketarin to keep all my favorite tools up to date.
But this is still a manual ritual that keeps coming back every time i see an app or tool gets a new version.

So to keep all my apps and tools up to date and stored in the same place I created this script.
It downloads the tools in a folder of my choice, per application and per version.
So in time it becomes a software library with various versions. :-)

You can select the apps and tools you don't want by commenting them out of the script.


To create a scheduled task that runs every week you can run this:
$SchedTaskCred = Get-Credential -Message "Enter the Domain credentials of the Scheduled Task Service Account"            
$SchedTaskCredUser = $SchedTaskCred.UserName            
$SchedTaskCredPwd = $SchedTaskCred.GetNetworkCredential().Password            
$Hostname = "Computername"            
$TaskName = "PSL"            
$Description = "Weekly PowerShell Software Library"            
             
$Action = New-ScheduledTaskAction -Execute 'Powershell.exe' `
-Argument '-NoProfile -WindowStyle Hidden -command "& "C:\Path\to\your\script\PSL\PSL.ps1""'            
             
$Trigger = New-ScheduledTaskTrigger -At 20:00 -Weekly -DaysOfWeek Sunday            
             
Register-ScheduledTask `
-User $SchedTaskCredUser `
-Password $SchedTaskCredPwd  `
-Action $Action `
-Trigger $Trigger `
-TaskName $TaskName `
-Description $Description `
-CimSession $Hostname

--Do not adjust the spaces and line separators or it won't work--

Only thing for you to do every now and then is download the latest version of the script.
