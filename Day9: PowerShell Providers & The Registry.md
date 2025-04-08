# Day 9: PowerShell Providers & The Registry
## What’s a PowerShell Provider?
PowerShell providers give a way to interact with different data stores using a filesystem-like experience.That means you can cd, ls, and use Get-ChildItem to explore not just files, but things like:

| Provider      | Description                              |
|---------------|------------------------------------------|
| `FileSystem`  | Your drives and folders (like `C:\`)     |
| `Registry`    | Windows Registry keys and values         |
| `Environment` | Environment variables (`$env:PATH`)      |
| `Alias`       | PowerShell command aliases               |
| `Function`    | All PowerShell functions in memory       |
| `Variable`    | All variables currently in your session  |

### 🔍 View All Providers

```powershell
Get-PSProvider
```

---

## View All Drives (Mapped to Providers)

```powershell
Get-PSDrive
```

Will see drives like `C:`, `HKCU:`, `Env:`, `Alias:`, and more — each mapped to a provider.

---

## Navigating Providers (Just Like Folders!)

### Registry Example

```powershell
Set-Location HKCU:\Software
Get-ChildItem
```

- `HKCU:` = HKEY_CURRENT_USER  
- `HKLM:` = HKEY_LOCAL_MACHINE

### Environment Variables

```powershell
Set-Location Env:
Get-ChildItem
```

### Alias Table

```powershell
Set-Location Alias:
Get-ChildItem
```

### Functions in Memory

```powershell
Set-Location Function:
Get-ChildItem
```

---

## Working with the Registry

### Create a Registry Key

```powershell
New-Item -Path "HKCU:\Software\MyCompany"
```

### Add a Registry Value

```powershell
New-ItemProperty -Path "HKCU:\Software\MyCompany" -Name "Theme" -Value "Dark" -PropertyType String
```

### Read a Registry Value

```powershell
Get-ItemProperty -Path "HKCU:\Software\MyCompany"
```

### Remove a Registry Value

```powershell
Remove-ItemProperty -Path "HKCU:\Software\MyCompany" -Name "Theme"
```

### Remove a Registry Key

```powershell
Remove-Item -Path "HKCU:\Software\MyCompany" -Recurse
```

---

## Environment Variables

### List Environment Variables

```powershell
Get-ChildItem Env:
```

### Access a Variable

```powershell
$env:USERNAME
```

### Create or Modify an Env Variable

```powershell
$env:MY_VAR = "HelloWorld"
```

---

## PSDrive Example

Mount drive to a specific registry path:

```powershell
New-PSDrive -Name "MyReg" -PSProvider Registry -Root "HKCU:\Software"
Set-Location MyReg:
```

---

## Practice 

1. Create a new registry key under `HKCU:\Software\DemoKey`.
2. Add a value called `Language = PowerShell`.
3. Read and display the value.


