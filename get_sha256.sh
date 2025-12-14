#!/bin/bash

# --- Linux File Integrity and SHA256 Calculator ---

# Define the function to handle retries for input
prompt_for_file() {
    local filePath
    # Read-Host equivalent: prompt the user and store their input
    read -r -p "Please enter the full path to your file: " filePath
    echo "$filePath" # Return the path
}

# Get the file path from the user
FILE_PATH=$(prompt_for_file)

# Display what was captured (for testing/verification)
echo "You entered: $FILE_PATH"

# Test-Path -PathType Leaf equivalent: check if the file exists and is a regular file
if [ -f "$FILE_PATH" ]; then
    echo -e "\nFile exists. Proceeding...\n"

    # --- SHA256 Hash Calculation (Get-FileHash -Algorithm SHA256 equivalent) ---
    echo "--- SHA256 HASH (Integrity Check) ---"
    # The 'sha256sum' utility prints the hash followed by the filename.
    # We use 'awk' to extract only the hash value.
    HASH=$(sha256sum "$FILE_PATH" | awk '{print $1}')
    echo "$HASH"
    echo "-------------------------------------\n"

    # --- Digital Signature (Authenticode equivalent) ---
    echo "--- DIGITAL SIGNATURE NOTE ---"
    # The Windows Authenticode signature hash is specific to Windows PE files.
    # In Linux, digital signatures (like GPG/PGP) are usually verified through
    # package management systems (APT) or checked against separate signature files (.asc).
    # There is no single, standard utility command for extracting a signature hash
    # from a Linux executable or typical file in the way Authenticode works.
    echo "Verification successful (File exists and SHA256 calculated)."
    echo "------------------------------"

else
    # Write-Host Error equivalent
    echo -e "\nError: The specified file does not exist or is not a regular file."
fi

# pause equivalent: wait for user input before exiting
read -r -p "Press Enter to exit..."
echo ""

# Exit with success (0) or failure (1) code
if [ -f "$FILE_PATH" ]; then
    exit 0
else
    exit 1
fi