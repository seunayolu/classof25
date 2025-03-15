# Task 1: The Rookie’s Shell Script Deployment

Welcome to your first DevOps challenge at *Classof25 Inc.*! This task is designed to test your Linux and shell scripting skills in a real-world scenario. Get ready to dive into a messy situation and save the day!

## Story Background

You’re a DevOps engineer at *Classof25 Inc.*, a startup racing to launch its new portfolio website. Your colleague, Dami, an overly confident intern, was tasked with writing a shell script to automate the deployment of an Apache2 web server with a sleek HTML template from [Tooplate.com](https://www.tooplate.com/). Unfortunately, Dami’s script is a disaster—full of bugs, bad practices, and cryptic errors. The site launch is tomorrow, and Dami’s already clocked out for the weekend. It’s up to you to fix his mess and ensure the website is live by morning.

## Objective

Your mission is to take Dami’s poorly written shell script, fix it, and make it reliably:
- Install Apache2.
- Download an HTML template ZIP from Tooplate.com.
- Unzip the template and deploy it to `/var/www/html`.
- Improve the script with variables, positional arguments, conditionals, and error handling.

## Setup

- **Environment**: You’ll work in a fresh EC2 Instance Deployed in your AWS Account.
- **Starting Point**: Dami’s broken script is below. Save it as `webserver-deploy.sh` and start debugging!
- **Assumptions**: You have `sudo` privileges and internet access.

### Dami’s Broken Script

```bash
#!/bin/bash

apt-get install apache2
wget https://www.tooplate.com/zip-templates/2135_mini_finance.zip
unzip 2135_mini_finance.zip
cp -r 2135_mini_finance/* /var/www/html
service apache2 restart
echo "Apache2 is running"
```

**Known Issues** (for you to discover):
- Missing `sudo` for privileged commands.
- No error checking for failed downloads or unzipping.
- Hardcoded URL and filenames.
- Overwrites `/var/www/html` without caution.
- No cleanup of temporary files.

## Task Instructions

1. **Assess the Damage**  
   Run Dami’s script as-is on your Linux environment. Document the errors or issues you encounter (e.g., permission denied, missing tools).

2. **Fix the Script**  
   Rewrite `webserver-deploy.sh` to:
   - Use `sudo` where needed.
   - Accept a positional argument for the Tooplate ZIP URL (e.g., `./deploy.sh https://www.tooplate.com/zip-templates/2135_mini_finance.zip`).
   - Define variables for the ZIP filename, extracted folder, and web directory (`/var/www/html`).
   - Add `if` conditionals to:
     - Check if Apache2 is installed (`dpkg -l | grep apache2`), installing it if missing.
     - Ensure `wget` and `unzip` are present (`apt-get install -y <package>`).
     - Verify the download succeeded before proceeding.
   - Backup the default `/var/www/html/index.html` (e.g., to `index.html.bak`) before overwriting.
   - Clean up temporary files (ZIP and extracted folder) after deployment.
   - Restart Apache2 only if it’s running (`systemctl is-active apache2`), otherwise start it.
   - Add comments explaining your logic.

3. **Test Your Work**  
   Execute your fixed script and verify the website is accessible (e.g., `curl localhost` or check in a browser with the public ip of your server. NB: Make sure port 80 is opened in your security group).

4. **Explain Your Fixes**  
   Submit your work with a short write-up (see Deliverables).

## Deliverables

Submit the following in your GitHub repo:
1. **Fixed Script**: `webserver-deploy.sh` with your improvements and comments.
2. **Write-Up**: A `REPORT.md` file (200-300 words) answering:
   - What was wrong with Dami’s original script?
   - How did your changes improve reliability and usability?
   - Any assumptions you made (e.g., internet access, sudo rights)?

## Success Criteria

Your work will be evaluated as if this were a technical interview:

| **Category**          | **Expectations**                                                                 |
|-----------------------|---------------------------------------------------------------------------------|
| **Script Functionality** | Installs Apache2, deploys the template, and serves the site correctly.         |
| **Shell Skills**      | Uses variables, positional arguments, `if` conditionals, and error handling.   |
| **Linux Commands**    | Correct use of `apt-get`, `cp`, `mv`, `systemctl`, etc.                        |
| **Documentation**     | Clear script comments and a logical, concise write-up.                         |

## Tips
- Test your script multiple times!
- Think like an interviewer: clarity and robustness matter as much as functionality.
- Stuck? Use `man <command>` or `command --help` to explore options.