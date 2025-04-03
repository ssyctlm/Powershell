# Day 5: Conditional Statements & Loops in PowerShell
As other program languages, PowerShell has conditional statements and loops to excercute scripts.

## Step 1: Conditonal Statements (if, elseif, else)
- Basic `if` statement
```PowerShell

  $age = 18

  if($age -ge 18) {
    Write-host "You are an adult."
  }

```
- `if`,`elseif`,`else` Example
```PowerShell

  $score = 85
  if($score -ge 90) {
    Write-Host "Grade: A"
  } elseif ($score -ge 80) {
    Write-Host "Grade: B"
  } else {
    Write-Host "Grade:C"
  }

```
-  Comparison Operators in PowerShell
  
| **Operator** | **Meaning**               | **Example**  |
|-------------|---------------------------|--------------|
| `-eq`       | Equals                    | `$a -eq $b`  |
| `-ne`       | Not equal                  | `$a -ne $b`  |
| `-gt`       | Greater than               | `$a -gt $b`  |
| `-lt`       | Less than                  | `$a -lt $b`  |
| `-ge`       | Greater than or equal      | `$a -ge $b`  |
| `-le`       | Less than or equal         | `$a -le $b`  |

## Step 2: Loops
- `while` loop
```PowerShell

  $count = 1

  while ($count -le 5) {
    Write-Host "Count: $count"
    $count++
  }


```
- `for` loop
- 
```PowerShell

  $count = 1

  for ($i=1; $i -le 5; $i++) {
    Write-Host "Count: $i"
  }

  # Iterate an array
  $arr = @("A","B","C","D","E")
  for($i = 0; $i -lt $arr.Length; $i++){
    Write-Host "Letter: $(arr[$i])
  }


```
- 
