#!/bin/bash

# Deploy a Tooplate template to Apache2 web server
# Usage: ./deploy.sh <tooplate_zip_url>

# Check if URL is provided
if [ -z "$1" ]; then
    echo "Error: Please provide a Tooplate ZIP URL as an argument."
    exit 1
fi

ZIP_URL="$1"
ZIP_FILE=$(basename "$ZIP_URL")
EXTRACTED_DIR=${ZIP_FILE%.zip}
WEB_DIR="/var/www/html"

# Ensure required tools are installed
for pkg in apache2 unzip wget; do
    if ! dpkg -l | grep -q "$pkg"; then
        echo "Installing $pkg..."
        sudo apt-get update && sudo apt-get install -y "$pkg"
    fi
done

# Download the template
wget "$ZIP_URL" || { echo "Download failed!"; exit 1; }

# Unzip and deploy
unzip "$ZIP_FILE" || { echo "Unzip failed!"; exit 1; }
sudo mv "$WEB_DIR/index.html" "$WEB_DIR/index.html.bak" 2>/dev/null # Backup default file if exists
sudo cp -r "$EXTRACTED_DIR"/* "$WEB_DIR/"

# Clean up
rm -f "$ZIP_FILE"
rm -rf "$EXTRACTED_DIR"

# Restart Apache2 if running
if systemctl is-active apache2 >/dev/null; then
    sudo systemctl restart apache2
else
    sudo systemctl start apache2
fi

echo "Deployment complete! Check the site at http://localhost"