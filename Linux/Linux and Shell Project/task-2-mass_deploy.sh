#!/bin/bash

# Deploy multiple Tooplate templates to Apache2 subdirectories
# Usage: ./mass_deploy.sh templates.txt

if [ -z "$1" ] || [ ! -f "$1" ]; then
    echo "Error: Please provide a valid template list file."
    exit 1
fi

TEMPLATE_LIST="$1"
WEB_ROOT="/var/www/html"

# Ensure required tools are installed
for pkg in apache2 unzip wget; do
    if ! dpkg -l | grep -q "$pkg"; then
        echo "Installing $pkg..."
        sudo apt-get update && sudo apt-get install -y "$pkg"
    fi
done

# Loop through each URL in the file
while IFS= read -r url || [ -n "$url" ]; do
    # Skip empty lines
    [ -z "$url" ] && continue

    # Extract template name from URL
    zip_file=$(basename "$url")
    template_name=${zip_file%.zip}
    target_dir="$WEB_ROOT/$template_name"

    # Check if directory already exists
    if [ -d "$target_dir" ]; then
        echo "Warning: $target_dir already exists. Skipping $template_name."
        continue
    fi

    # Prompt for confirmation, read from terminal
    echo "Deploy $template_name to $target_dir? [y/n]"
    read -p "Enter your choice: " -r answer < /dev/tty
    echo "You entered: '$answer'"  # Debug line
    if [ "$answer" != "y" ] && [ "$answer" != "Y" ]; then
        echo "Skipping $template_name."
        continue
    fi

    # Download and deploy
    wget "$url" || { echo "Download failed for $template_name!"; continue; }
    unzip "$zip_file" || { echo "Unzip failed for $template_name!"; rm -f "$zip_file"; continue; }
    sudo mkdir -p "$target_dir" || { echo "Failed to create $target_dir!"; continue; }
    sudo cp -r "$template_name"/* "$target_dir/" || { echo "Failed to copy files for $template_name!"; rm -f "$zip_file"; rm -rf "$template_name"; continue; }
    rm -f "$zip_file"
    rm -rf "$template_name"

    echo "$template_name deployed successfully!"
done < "$TEMPLATE_LIST"

echo "Mass deployment complete! Check sites at http://localhost/<template_name>"