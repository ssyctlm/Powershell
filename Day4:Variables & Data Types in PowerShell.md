# Day 4: Variables & Data Types in PowerShell

## Step 1: Variables
- A variable in PowerShell starts with a `$` sign.
- You don’t need to declare a type; PowerShell assigns it dynamically.
- Example:
  ```PowerShell

    $text = "Hello World!"
    $year = 2025
    $isRight = $true
  
    # To display a variable
    $text
    
  ```

- Declaring & Using Variables
  ```PowerShell

    $greeting = "Hello, PowerShell!"
    $number = 25
    $pi = 3.14
    $isRunning = $true

    Write-Host $greeting
    Write-Host "Number: $number, Pi: $pi, Running: $isRunning"

  ```
  `Write-Host` is a **cmdlet** used to display output directly to the console (screen).


## Step 2: Data Types in PowerShell

| **Type**       | **Example**                     | **Description**            |
|---------------|---------------------------------|----------------------------|
| **String**    | `"Hello"`                        | Text (words, sentences)    |
| **Integer**   | `10`                             | Whole numbers              |
| **Float**     | `3.14`                           | Decimal numbers            |
| **Boolean**   | `$true`, `$false`                | True or False              |
| **Array**     | `@("apple", "banana")`          | List of values             |
| **HashTable** | `@{name="John"; age=30}`        | Key-Value pairs            |

PowerShell automatically detects types, but you can force a specific type.

- Explicitly Setting Data Types
  ```PowerShell

    [string]$text = "Hello"
    [int]$num = 42
    [float]$decimal = 3.14
    [bool]$flag = $true

  ```
  
- Use `[type]::GetType()` to check the variable’s type:

  ```PowerShell

    $text.GetType()
  
  ```

## Step 3: Working with Arrays & HashTables

- Arrays
  ```PowerShell

    $fruits = @("Apple","Banana","Cherry")
    Write-Host "First fruit: $($fruits[0])"
  
  ```
- HashTables (Key-Value Pairs)
  ```PowerShell

    $John = @{Id = "IT001"; Name="John"; Age=30; Job="Developer"}
    Write-Host "John's ID: $($John['Id'])"
  
  ```

## Step 4: Basic Operations
-  Math Operations
  ```PowerShell

    $a = 10
    $b = 5
    $sum = $a + $b
    Write-Host "Sum: $sum"
  
  ```
-  String Operations
  ```PowerShell

    $first = "Power"
    $second = "Shell"
    $full = $first + $second
    Write-Host $full

  ```

## Practice

Create and print a variable of each type (string, integer, float, boolean, array, hashtable).

Perform a mathematical operation (addition, multiplication, etc.).

Create an array of 5 items and print the third item.

Create a hashtable with name, age, and profession, then print the age.

```Powershell

  Write-Host $John['Name'] "is a" $John['Job'] "his ID is" $John['Id']

```


  
