#!/bin/bash

# Usage: ./open_as_encrypted.sh unit.cs

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 filename"
    exit 1
fi

FILE=$1
ENC_FILE="${FILE}.enc"

# Encrypt the file content
openssl enc -aes-256-cbc -salt -in "$FILE" -out "$ENC_FILE" -pass pass:temporarypass

# Read the encrypted content
ENC_CONTENT=$(cat "$ENC_FILE")

# Create a temporary file to store the encrypted content for VS Code
TEMP_FILE=$(mktemp /tmp/encrypted_view.XXXXXX)

# Write the encrypted content to the temporary file
echo "$ENC_CONTENT" > "$TEMP_FILE"

# Open the temporary file in VS Code
code "$TEMP_FILE"

# Optional: Clean up the temporary files after VS Code is closed
# Uncomment the next line if you want to delete the temporary file automatically
# rm "$TEMP_FILE" "$ENC_FILE"
