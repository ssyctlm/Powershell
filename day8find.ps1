$files = Get-ChildItem "C:\users\name\documents\PSPractice"
$target = "notes.txt"
$found = $false 

foreach ($file in $files) {
    if ($file.Name -eq $target) {
        Write-Host "Found file: $($file.Name) at $($file.FullName)"
        $found = $true 
        break # Exit the loop since we found the file
    }
}

if (-not $found) {
    Write-Host "File '$target' does not exist."
}