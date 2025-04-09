# Day 10: PowerShell Modules

PowerShell **modules** are collections of related functions, cmdlets, variables, and more — packaged together for **reuse** and **sharing**.

---

## Why Use Modules?

- Organize related code (functions, aliases, variables)
- Reuse logic across multiple scripts or sessions
- Share the tools with others
- Load only what needed

---

## View Installed Modules

```powershell
Get-Module -ListAvailable
```

This lists all modules installed on your system.

- PowerShell Module Types

| ModuleType     | Description |
|----------------|-------------|
| `Script`       | A `.psm1` file — contains functions and logic written in PowerShell script. Most user-created modules are this type. |
| `Manifest`     | A `.psd1` file — contains metadata (like author, version, dependencies). Usually just points to a `.psm1` or binary module. |
| `Binary`       | A compiled .NET DLL — used for performance or native access. Often written in C#. |
| `Cim`          | A special type that interacts with CIM/WMI data (less common in modern use). |
| `Workflow`     | Rare now — was used for running long-running or parallel PowerShell workflows. |
| `Dynamic`      | Created at runtime by other modules or scripts — doesn't have a static file. |

```powershell
Get-Module -ListAvailable | Format-Table Name, ModuleType, Version, Path
```

    - A **Manifest** module (`.psd1`) often **points to a Script or Binary** module.
    - The **Script module** (`.psm1`) contains the actual code (functions, logic).
    - **Binary modules** are compiled for speed or complex tasks (e.g., `PSReadLine`).
    - You usually just import the module name (`Import-Module Az`) and PowerShell handles the rest.





---




## Install a Module (from PSGallery)

```powershell
Install-Module -Name Az -Scope CurrentUser
```

- `-Scope CurrentUser`: Installs it for just you.
- Add `-Force` if you're updating.

> May need to run `Set-PSRepository -Name PSGallery -InstallationPolicy Trusted` once to avoid install prompts.

---

## Import a Module (into your session)

```powershell
Import-Module -Name Az
```

> Most modules auto-import when you call one of their cmdlets!

---

## Export Your Own Module

1. Create a `.psm1` file (PowerShell module script).
2. Optionally, create a `.psd1` manifest for metadata.

### Folder Structure

```
MyTools\
├── MyTools.psm1
└── MyTools.psd1  (optional)
```

### Example: `MyTools.psm1`

```powershell
function Say-Hello {
    param($Name)
    "Hello, $Name!"
}
```

### Load It Temporarily

```powershell
Import-Module "C:\Path\To\MyTools\MyTools.psm1"
```

---

## Create a Module Manifest (Optional but recommended)

```powershell
New-ModuleManifest -Path "C:\Path\To\MyTools\MyTools.psd1" -RootModule "MyTools.psm1"
```

---

## Discover Modules Online

```powershell
Find-Module -Name *network*
```

Search PowerShell Gallery for modules by keyword.

---

## Check What’s Inside a Module

```powershell
Get-Command -Module Az.Accounts
```

---

## Remove a Module (from session)

```powershell
Remove-Module Az.Accounts
```

---

## Practice

Create a simple module:

1. Create a folder `MyModule` with a `.psm1` file.
2. Write one function like `Get-Greeting`.
3. Import the module and test the function.

Example function:

```powershell
function Get-Greeting {
    param($Name = "Stranger")
    "Welcome, $Name!"
}
```

