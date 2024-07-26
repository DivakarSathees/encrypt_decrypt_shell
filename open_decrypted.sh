#!/bin/bash

# Usage: ./open_decrypted.sh unit.cs.enc

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 encrypted_filename"
    exit 1
fi

ENC_FILE=$1
DEC_FILE="${ENC_FILE%.enc}.dec"

# Decrypt the file content
openssl enc -d -aes-256-cbc -in "$ENC_FILE" -out "$DEC_FILE" -pass pass:temporarypass

# Open the decrypted file in VS Code
code "$DEC_FILE"

# Optional: Clean up the decrypted file after VS Code is closed
# Uncomment the next line if you want to delete the decrypted file automatically
# rm "$DEC_FILE"
