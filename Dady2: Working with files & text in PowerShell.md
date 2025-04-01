# Day 2: Working with Files & Text in PowerShell

## Step 1: Creating & Managing Files
-  Create a new folder/directory (Day1)
-  Create a new text file
```PowerShell
  New-Item -path "C:\Users\[name]\Documents\firstfile.txt" -ItemType File
```
-  Write text into the file
```PowerShell
  Set-Content -path "C:\Users\[name]\Documents\firstfile.txt" -Value "Hello, World!"
```
-  Append text to a file
``` PowerShell
  Add-Content -path "C:\Users\[name]\Documents\firstfile.txt" -Value "Hello, PowerShell!"
```
-  Read the contents of a file
``` PowerShell
  Get-content -path "C:\Users\[name]\Documents\firstfile.txt" 
```
-  Delete a file
```PowerShell
  Remove-Item -path "C:\Users\[name]\Documents\firstfile.txt"
```

## Step 2: Creating & Managing Folders
- Create a new folder/directory 
``` PowerShell
  New-Item -Path "C:\Users\[name]\Documents\newfolder" -ItemType Directory
```
- Copy a file to another location
``` PowerShell
  Copy-Item -Path "C:\Users\[name]\Documents\firstfile.txt" -Destination "C:\Users\[name]\Documents\newfolder\"
```
- Move a file
``` PowerShell
  Move-Item -Path "C:\Users\[name]\Documents\firstfile.txt" -Destination "C:\Users\[name]\Documents\newfolder\"
```
- Delete a folder and its contents
``` PowerShell
  Remove-Item -Path "C:\Users\[name]\Documents\newfolder" -Recurse"
```
`Recurse` ensures all files insid the folder are deleted too.

## Step 3: Searching & Filtering Files
- List all files in a folder
``` PowerShell
  Get-ChildItem -Path "C:\Users\[name]\Documents\"
```
- Find files with a specific extension (e.g., .txt)
``` PowerShell
  Get-ChildItem -Path "C:\Users\[name]\Documents\" -Filter *.txt
```
- Search for text inside files
``` PowerShell
  Select-String -Path "C:\Users\[name]\Documents\firstfile.txt" -Pattern "PowerShell" 
```
This searches for "PowerShell" inside the file and returns matching lines.

## Practice
Create a folder called TestFolder inside your Documents.
Create a text file inside TestFolder and write some content to it.
Append more text to the file.
Move the file to another folder.
Search for the file with `-Filter` parameter
Search for a specific word inside the file.
Delete the file and the folder after testing.
