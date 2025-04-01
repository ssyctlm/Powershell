# Day 1: Getting Started with PowerShell
--- 
## Step 1: Open PowerShell
1. Call out Windows
   - `Ctl+X` -> windows powershell
   - Run as administrator
2. PowerShell Version
   ```PowerShell
        $PSVersionTable
   ```
## Step 2: Basic Commands
- **All available commands**
```PowerShell
  Get-Command
```
- **Get help for a command**
```PowerShell
  Get-Help Get-Process -online
```
- Try some commond
See running processes on this computer
```PowerShell
  Get-Process
```
Check system service
```PowerShell
  Get-Service
```
Find this computer’s system info
```PowerShell
  Get-ComputerInfo
```
## Step 3: Navigation Commands
- Check current directory `Get-Location`
- List files in current directory `Get-ChildItem` or `Gci`
- Change directory `Set-Location C:\Users`
- Create a new folder
  ```PowerShell
    New-Item -Path "C:\Users\[name]\Documents\newFolder" -Itemtype Directory
  ```
  ( Itemtype : Directory/file)
- Delete a folder
    ```PowerShell
    Remove-Item -Path "C:\Users\[name]\Documents\newFolder"
  ```


## Practices
Open PowerShell and check PowerShell version.

Run the commands above and note their outputs.

Navigate to Documents folder and create a new folder using PowerShell.

Delete that folder using PowerShell.

