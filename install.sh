#!/bin/bash

# Define the URL of the Debian package
PACKAGE_URL="https://github.com/kidosparental/kidos-linux-releases/releases/download/latest/kidos_amd64.deb"

# Define the temporary location for the downloaded package
TEMP_DEB="/tmp/kidos_amd64.deb"

# Download the package using curl
echo "Downloading the package..."
curl -sL -o "$TEMP_DEB" "$PACKAGE_URL"

# Check if the download was successful
if [ -f "$TEMP_DEB" ]; then
    echo "Download successful, installing the package..."
    # Install the package using dpkg
    sudo dpkg -i "$TEMP_DEB"
    # Clean up the temporary file
    rm "$TEMP_DEB"
    echo "Installation complete."
else
    echo "Download failed, package not found."
fi
