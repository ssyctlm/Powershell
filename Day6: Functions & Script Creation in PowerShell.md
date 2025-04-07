# Day 6: Functions & Script Creation in PowerShell

## Step 1: Creating Functions

- Basic Function Syntax
```PowerShell

  function Say-Hello {
    write-host "Hello, PowerShell!"
  }

```
- Function with Parameters

``` PowerShell

  function Greet-User {
    param(
        [string]$name
    )
    Write-Host "Hello, $name"
  }

  # Call the function with Parameter
  Greet-User -name "Dave"

```

## Step 2: Returning Values from Functions

```PowerShell

  function Add-Num{
    Param($a,$b)
    return $a+$b
  }

```
- Example of storing result in a variable:

```PowerShell

  $result = Add-Num -a 5 -b 10
  write-host "Sum: $result"

```

## Step 3: Writing PowerShell Scripts ( `.ps1` Files)
Write a script file (`.ps1`) to run commands.

- Example Script (`Hello.ps1`)
Write in notepad and save it as `Hello.ps1`

```PowerShell

  function Say-Hello {
    Write-Host "Hello, this is a script!"
  }
  Say-Hello

```

** Running Scripts with Execution Policy**

By default, PowerShell restricts running scripts for security reasons.

- To Allow Script Execution:
``` PowerShell

  Set-ExecutionPolicy RemoteSigned -Scope Process
  
```

## Practice

Write a function that takes a name and prints "Hello, <name>!".

Write a function that calculates the square of a number.

Save a script (.ps1 file) and run it from PowerShell.



- 
