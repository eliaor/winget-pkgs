# Prompt the user and store their input in a variable
$filePath = Read-Host -Prompt "Please enter the full path to your file"

# Display what was captured (for testing/verification)
Write-Output "You entered: $filePath"

# Example usage: check if the file actually exists
if (Test-Path -Path $filePath -PathType Leaf) {
    Write-Host "File exists. Proceeding..." -ForegroundColor Green
    # You can now use $filePath in other commands, like:
    # Get-Content -Path $filePath 

    Get-FileHash -Path $filePath -Algorithm SHA256
    (Get-AuthenticodeSignature -FilePath $filePath).Hash
} else {
    Write-Host "Error: The specified file does not exist." -ForegroundColor Red
}

pause