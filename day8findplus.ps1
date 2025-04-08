$target = "notes.txt" 
$path = "c:\" # Specify the starting path (current directory)

$files = Get-ChildItem -Path $path -Recurse # Get files recursively

$found = $false # Initialize found flag

foreach ($file in $files) {
    if ($file.Name -eq $target) {
        Write-Host "Found file: $($file.Name) at $($file.FullName)"
        $found = $true
        break
    }
}

if (-not $found) {
    Write-Host "File '$target' does not exist in '$path' or its subdirectories."
}
