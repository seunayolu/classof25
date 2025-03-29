# Deploy Tooplate Template to Apache2 Web Server

This script automates the deployment of a Tooplate HTML template (provided as a ZIP file URL) to an Apache2 web server on a Debian-based system.

## Usage
```bash
./deploy.sh <tooplate_zip_url>
```
- `<tooplate_zip_url>`: The direct URL to the Tooplate template ZIP file (e.g., `https://www.tooplate.com/zip-templates/2135_mini_finance.zip`).

## Prerequisites
- A Debian-based system (e.g., Ubuntu) with `sudo` privileges.
- Internet access to download the ZIP file and install dependencies.

## Script Breakdown

### 1. Shebang
```bash
#!/bin/bash
```
- Specifies that the script should be executed using the Bash shell.

---

### 2. Argument Check
```bash
if [ -z "$1" ]; then
    echo "Error: Please provide a Tooplate ZIP URL as an argument."
    exit 1
fi
```
- Checks if a command-line argument (the ZIP URL) is provided.
- If no argument (`$1`) is given (`-z` tests for empty string), it prints an error message and exits with status code `1` (indicating failure).

---

### 3. Variable Definitions
```bash
ZIP_URL="$1"
ZIP_FILE=$(basename "$ZIP_URL")
EXTRACTED_DIR=${ZIP_FILE%.zip}
WEB_DIR="/var/www/html"
```
- `ZIP_URL`: Stores the provided URL from `$1`.
- `ZIP_FILE`: Extracts the filename from the URL (e.g., `2135_mini_finance.zip` from the full URL).
- `EXTRACTED_DIR`: Removes the `.zip` extension from `ZIP_FILE` to predict the extracted directory name (e.g., `2135_mini_finance`).
- `WEB_DIR`: Sets the Apache2 default web directory to `/var/www/html`.

---

### 4. Dependency Installation
```bash
for pkg in apache2 unzip wget; do
    if ! dpkg -l | grep -q "$pkg"; then
        echo "Installing $pkg..."
        sudo apt-get update && sudo apt-get install -y "$pkg"
    fi
done
```
- Loops through required tools: `apache2` (web server), `unzip` (to extract ZIP files), and `wget` (to download files).
- Checks if each package is installed using `dpkg -l | grep -q "$pkg"`.
- If a package is missing, it updates the package list (`apt-get update`) and installs the package (`apt-get install -y`).

---

### 5. Download the Template
```bash
wget "$ZIP_URL" || { echo "Download failed!"; exit 1; }
```
- Uses `wget` to download the ZIP file from `ZIP_URL`.
- If the download fails (`||`), it prints an error message and exits with status code `1`.

---

### 6. Unzip and Deploy
```bash
unzip "$ZIP_FILE" || { echo "Unzip failed!"; exit 1; }
sudo mv "$WEB_DIR/index.html" "$WEB_DIR/index.html.bak" 2>/dev/null
sudo cp -r "$EXTRACTED_DIR"/* "$WEB_DIR/"
```
- `unzip "$ZIP_FILE"`: Extracts the contents of the ZIP file. Exits with an error if extraction fails.
- `sudo mv ...`: Backs up the default Apache `index.html` file (if it exists) to `index.html.bak`. The `2>/dev/null` suppresses errors if no file exists.
- `sudo cp -r ...`: Copies all contents of the extracted directory to `/var/www/html/` recursively.

---

### 7. Clean Up
```bash
rm -f "$ZIP_FILE"
rm -rf "$EXTRACTED_DIR"
```
- Deletes the downloaded ZIP file (`rm -f` forces removal without prompting).
- Deletes the extracted directory and its contents recursively (`rm -rf`).

---

### 8. Restart Apache2
```bash
if systemctl is-active apache2 >/dev/null; then
    sudo systemctl restart apache2
else
    sudo systemctl start apache2
fi
```
- Checks if Apache2 is already running (`systemctl is-active apache2`).
- If running, restarts the service (`systemctl restart`) to apply changes.
- If not running, starts the service (`systemctl start`).

---

### 9. Completion Message
```bash
echo "Deployment complete! Check the site at http://localhost"
```
- Prints a success message, directing the user to view the deployed site at `http://localhost`.

## Notes
- The script assumes the Tooplate ZIP file contains a ready-to-deploy HTML template with an `index.html` file.
- It overwrites existing files in `/var/www/html/` without warning (except for backing up `index.html`).
- Requires root privileges via `sudo` for file operations in `/var/www/html` and Apache2 management.

## Example
```bash
./deploy.sh https://www.tooplate.com/zip-templates/2135_mini_finance.zip
```
- Downloads, extracts, and deploys the "Mini Finance" template to your Apache2 server.

## Troubleshooting
- **Permission denied**: Ensure you have `sudo` privileges.
- **Download failed**: Verify the URL is correct and accessible.
- **Unzip failed**: Ensure the ZIP file is valid and not corrupted.
- **Apache2 not starting**: Check logs with `journalctl -u apache2` for errors.
```