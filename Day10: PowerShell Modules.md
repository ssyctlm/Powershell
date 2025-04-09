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

