#!/usr/bin/env bash

TMPFILE=$(mktemp)

# Kotlin compiler zip file url
KOTLIN_ZIP_URL="https://github.com/JetBrains/kotlin/releases/download/v2.1.20/kotlin-compiler-2.1.20.zip"

# Ensure usr/local/lib directory exists and is empty
mkdir -p "./usr/local/lib"
if [ "$(ls -A ./usr/local/lib)" ]; then
    echo "lib folder not empty, do you want to delete content? (y/n)"
    read -r answer
    if [[ ! "$answer" =~ ^[Yy]$ ]]; then
        echo "Exiting..."
        exit 1
    fi
    rm -rf ./usr/local/lib/*
fi

wget -O "$TMPFILE" "$KOTLIN_ZIP_URL"

unzip "$TMPFILE" -d "./usr/local/lib"

# Update DEBIAN/control file

## Read Version from control file
VERSION=$(grep -m 1 '^Version:' ./DEBIAN/control | cut -d ' ' -f 2)
## Ask for new version
echo "Current version is $VERSION. Do you want to change it? (y/n)"
read -r answer
if [[ "$answer" =~ ^[Yy]$ ]]; then
    echo "Enter new version:"
    read -r new_version
    sed -i "s/^Version: .*/Version: $new_version/" ./DEBIAN/control
fi


dpkg-deb --build . ../debian
