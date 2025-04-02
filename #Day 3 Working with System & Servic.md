#Day 3: Working with System & Services in PowerShell

## Step 1: Managing System Processes
- View running processes
```PowerShell

   Get-Process

```

- Find a specific process (e.g., Chrome)

```PowerShell

   Get-Process -Name Chrome

```

- Stop a process
```PowerShell

   Stop-Process -Name Chrome -Forces 

```

The `-Force` flag ensures the process is terminated.

- Start a new process (open Notepad)
```PowerShell

   Start-Process -FilePath "notepad.exe" 

```

## Step 2: Managing System Services

- List all system services
```PowerShell

   Get-Service 

```

- Find a specific service (e.g., Windows Update service)
```PowerShell

   Get-Service -Name wuauserv

```

- Stop a service
```PowerShell

   Stop-Service -Name wuauserv

```

- Start a service
```PowerShell

   Start-Service -Name wuauserv

```

- Restart a service
```PowerShell

   Restart-Service -Name wuauserv

```

- Check if a service is running or stopped
```PowerShell

   (Get-Service -Name wuauserv).Status

```
```PowerShell

   Get-Service -Name wuauserv | Select-Object Status

```

## Step 3: Getting System Information

`Get-CimInstance` and `Get-WmiObject`

`Get-CimInstance` is a PowerShell cmdlet that retrieves management information from the system using CIM.
It replaces the older `Get-WmiObject` cmdlet because it is more efficient and works better with remote systems.

- Check basic system details
```Powershell

   Get-ComputerInfo

```

- Get system uptime
```Powershell

   Get-CimInstance Win32_OperatingSystem | Select-Object LastBootUptime

```

- Check available disk space
```Powershell

   Get-PSDrive -Name C

```

- Check CPU usage
```Powershell

   Get-WmiObject Win32_Processor | Select-Object LoadPercentage

```
```Powershell

   Get-CimInstance Win32_Processor | Select-Object LoadPercentage

```

- Check RAM usage
```Powershell

   Get-WmiObject Win32_OperatingSystem | Select-Object TotalVisibleMemorySize, FreePhysicalMemory

```
```Powershell

   Get-CimInstance Win32_OperatingSystem | Select-Object TotalVisibleMemorySize, FreePhysicalMemory

```


