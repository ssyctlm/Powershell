# Day 13: Working with CSV, JSON, and XML in PowerShell

**CSV**, **JSON**, and **XML** are great for config files, logs, reports, and automation, essential for data exchange and scripting automation.

---

## Working with CSV Files

### Import CSV

```powershell
$users = Import-Csv -Path "C:\Temp\users.csv"
```

**Each row becomes an object!**

### View a property

```powershell
$users[0].Name
```

### Export to CSV

```powershell
$users | Export-Csv -Path "C:\Temp\output.csv" -NoTypeInformation
```

---

### Create CSV on the fly

```powershell
$data = @(
    [pscustomobject]@{ Name = "Alice"; Age = 30 }
    [pscustomobject]@{ Name = "Bob"; Age = 25 }
)
$data | Export-Csv -Path "C:\Temp\people.csv" -NoTypeInformation
```

---

## Working with JSON

### Convert to JSON

```powershell
$person = @{ Name = "Charlie"; Age = 40 }
$person | ConvertTo-Json
```

### Save to file

```powershell
$person | ConvertTo-Json | Set-Content -Path "C:\temp\person.json"

$person | ConvertTo-Json | Out-File -filepath "c:\temp\person1.json"
```

### Load from file

```powershell
$json = Get-Content -Path "C:\temp\person.json" | ConvertFrom-Json
$json.Name
```

---

## Working with XML

### Create from string

```powershell
[xml]$xml = @"
<user>
  <name>David</name>
  <age>35</age>
</user>
"@
```

### Access elements

```powershell
$xml.user.name
```

## Save to XML File

```powershell
$xml.Save("C:\temp\user.xml")
```

> This saves the XML content to `C:\temp\user.xml` using the built-in `.Save()` method.

> ??? Why Use `.Save()` Instead of `Out-File` for XML?
> | Method      | Purpose                                | Best For                        |
> |-------------|----------------------------------------|----------------------------------|
> | `.Save()`   | Native method for saving XML objects   | Preserves full XML structure     |
> | `Out-File`  | Writes plain text to a file            | Logs, basic output (not ideal for XML) |


>  **For XML files, always prefer `.Save()`**  
>  Use `Out-File` for text, not structured data.

### Load XML from file

```powershell
[xml]$data = Get-Content -Path "C:\temp\user.xml"
$data.user.age
```

---

## Format Comparison Table

| Feature     | CSV                         | JSON                        | XML                        |
|-------------|-----------------------------|-----------------------------|----------------------------|
| Structure   | Flat, table-like            | Nested, object-based        | Hierarchical, tag-based   |
| Readable    | Human-readable              | Human-readable              | Verbose but structured     |
| Use Cases   | Reports, spreadsheets       | APIs, configs               | Configs, legacy systems    |
| Cmdlets     | `Import/Export-Csv`         | `ConvertTo/From-Json`       | `[xml]`, `Get-Content`     |

---

## Practice

1. Create an array of custom user objects.
2. Export it to both `.csv` and `.json`.
3. Re-import each and print a property.

Example:

```powershell
$users = @(
    [pscustomobject]@{ Name = "Eve"; Role = "Admin" }
    [pscustomobject]@{ Name = "Frank"; Role = "User" }
)

# CSV
$users | Export-Csv "C:\Data\users.csv" -NoTypeInformation
Import-Csv "C:\Temp\users.csv" | ForEach-Object { $_.Name }

# JSON
$users | ConvertTo-Json | Set-Content "C:\Data\users.json"
(Get-Content "C:\Temp\users.json" | ConvertFrom-Json).Name
```


