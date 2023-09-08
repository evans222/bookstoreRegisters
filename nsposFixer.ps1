<#
Started 9/7/23

Automatically fixes registers that are locked out, have crashed, or are otherwise not working.


Goals/things to add:
- Fix admin lock-out
- Fix crash
- Fix reciept not printing
- Fix freedompay

Concepts needed:
- launch powershell program from AHK
- Detect if window open and on top
- Detect sub windows
- store current admin login creds.
- add reciept printer (ideally without opening the GUI)
#>


Write-Host "Hello, world!"
Pause