# Day 7: Error Handling & Debugging in PowerShell

**Why this matters** 
In scripts, things fail. Files may be missing, input might be invalid, permissions may break things — you need to `catch`, `control`, and `recover` from these issues.

1.  Basic `try/catch` Block
```powershell
  try{
    Get-Item C:\notfound.txt -ErrorAction Stop
  }
  catch{
    write-host "X Error caught!"
    write-host "Details: $_"
  }
```
`-ErrorAction Stop` makes non-terminating errors(like file not found) behave like terminating errors that can be caught.

2.  Custom Errors with `throw`
```powershell

  function Divide {
    param($a,$b)

    if ($b -eq 0) {
      throw "Can't divide by zero! - By Dave"
    }
    return $a/$b
  }

  # Run it
  try {
    Divide -a 10 -b 0
  }
  catch {
    write-host "Math error: $_"
  }


```

3.  Using `-ErrorAction` Smartly

| Option              | What It Does                     |
|---------------------|----------------------------------|
| `Continue` (default)| Show error, keep running         |
| `Stop`              | Throw error to `catch`           |
| `SilentlyContinue`  | Hide error, continue silently    |
| `Ignore`            | Truly ignore (no logging at all) |

```powershell

  Remove-Item "C:\fakefile.txt" -ErrorAction SilentlyContinue

```
4.  Debug Messages: `Write-Debug`, `Write-Verbose`
   
```powershell
  
  function Test-Debug {
    [CmdletBinding()]
    param()

    Write-Verbose " Verbose message here, like a system info"
    Write-Debug " Debug info here"
    Write-Host " Running script body..."
  }

  # Run it
  Test-Debug -Verbose -Debug

```

5.  Script-Level Debugging
```powershell

  Set-PSDebug -Trace 1
  # Trace 1 : PowerShell shows each command before it runs, giving you a clear trace of execution.
  # Trace 2 : **deep-level debugging**, it shows Function calls, Scope changes, Variable assignments.

  # run the script, it will shows This shows every command being executed, helpful when you're trying to trace logic step-by-step..
  

  #don't forget to close the debug
  Set-PSDebug -Off

  
```

- Practice
 
  Try reading a non-existent file and catching the error.

  Write a function that fails if a number is too high (throw if over 100).

  Add -Verbose and -Debug output to your functions.

  Use Set-PSDebug to step through a script line-by-line.
