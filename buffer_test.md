
**DESCRIPTION**

**Issue Description: When the Cimitra Agent on Windows runs an Action, under some conditions, the Action never advanced beyond "Sent" and output from the script does not get logged at the Cimitra Server and the in the Cimitra Web Client results window**


**CAUSE**
The Cimitra Agent for Windows uses the following C# call to launch PowerShell and a script | Exec.ExecuteProcessCommand

The Cimitra Agent expects the Windows operating system to return the results of the script execution output. 

If the output exceeds approximately 96538 characters, Windows ceases to capture the output. Presumably this is to make sure that a memory leak does not occur. 

**RESOLUTION**

Send the output of the command generating the characters to a file. For example: 

**<Command that causes output> | Out-File -Append "<Full path to a file that can be written to>"**
  
 NOTE: You may want to make sure that the file being appended to is deleted each time your script is run. This can be accomplished in this manner: 
  
 Remove-Item "<Full path to a file that can be written to>" -ErrorAction SilentlyContinue
  
  **OTHER NOTES**
  
Cimitra created a test script and associated it with a Cimitra Action in order to come up with this conclusion. The script and action are posted here. You can import the Action into your own Cimitra system and download the PowerShell script and place it in c:\cimitra\scripts in order to run the Cimitra Action. 
  
Cimitra Action Import URL: https://raw.githubusercontent.com/cimitrasoftware/support/main/json_files/buffer_test.json

PowerShell Script Location: https://raw.githubusercontent.com/cimitrasoftware/support/main/buffer_test.ps1
