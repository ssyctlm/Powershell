# Day 8: Manipulate Files & Folders in PowerShell

## Basic Cmdlets

| Cmdlet          | Description                            |
|------------------|----------------------------------------|
| `Get-Item`       | Gets a file or folder (1 item)         |
| `Get-ChildItem`  | Lists files/folders (like `ls`)        |
| `New-Item`       | Creates a new file or folder           |
| `Remove-Item`    | Deletes files or folders               |
| `Copy-Item`      | Copies files or folders                |
| `Move-Item`      | Moves or renames files/folders         |
| `Test-Path`      | Checks if a file or folder exists      |

## Step 1: Folders & Files ( Recap)

-  List files in a folder
```Powershell

  Get-ChildItem -Path "C:\Users\name\Documents"
  # Or shorten
  gci C:\Users\name\Documents

```

- Create folder:

```Powershell

  New-Item C:\users\name\documents\PSPractice -filetype directory

```

- Create file:
```Powershell

  New-Item C:\users\name\documents\PSPractice\scripts.ps1 -filetype file

```

## Step 2: Check If a File Exists
```Powershell

  if (test-path "C:\users\name\documents\PSPractice\notes.txt"){
    #True
    Write-Host "File exists!"  
  } else {
    #False
    Write-Host "File does not exist."
  }

```

## Step 3: Write and Read File Content

- Write to file ( No need to create the file first)
```Powershell

  "Hello, PowerShell!" | Out-File -FilePath "C:\users\name\documents\PSPractice\notes.txt"

```

```powershell
  Set-Content -Path "C:\Temp\MyFile.txt" -Value "Hello, PowerShell!"
```

- Append to file
```Powershell

  "Hello, another line" | Out-File -FilePath "C:\users\name\documents\PSPractice\notes.txt" -append

```
```powershell
  Add-Content -Path "C:\Temp\MyFile.txt" -Value "This is another line."
```


- Read from file
```Powershell

 Get-content -Path "C:\users\name\documents\PSPractice\notes.txt"

```
**Notice**: `-FilePath` and `-Path`

## Loop Through Files 

```Powershell

  $files = Get-ChildItem -path "C:\users\name\documents\PSPractice"
  foreach( $file in $files) {
    Write-Host "Found file: $($file.Name)"
  }

```

## Remove a File or Folder

```Powershell

  Remove-Item "C:\PSPractice\notes.txt"

  Remove-Item "C:\PSPractice" -Recurse -Force

```

## Filtering Files

```powershell
Get-ChildItem -Path "C:\Temp" -Filter "*.txt"
```

### Recursively search all subfolders:

```powershell
Get-ChildItem -Path "C:\Temp" -Filter "*.log" -Recurse
```

---

## Get File/Folder Info

```powershell
Get-Item "C:\Temp\MyFile.txt" | Select-Object Name, Length, LastWriteTime
```

Or for folders:

```powershell
Get-ChildItem -Path "C:\Temp" | Where-Object { $_.PSIsContainer }
```

---




## Practice

Checks if a folder exists — if not, create it.

Adds a log entry with the current date/time.

Lists all .txt files in that folder.


