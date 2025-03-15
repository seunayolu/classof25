# Task 2: The Mass Deployment

## Story Background
After you saved the day with Dami’s single-site deployment at *Classof25 Inc.*, the boss was impressed—maybe too impressed. They’ve now tasked you with deploying *multiple* portfolio websites for a big client showcase, each using a different[Tooplate.com](https://www.tooplate.com/) template. Dami tried to help by scribbling a list of template URLs in `templates.txt`, but he didn’t know how to handle batches. The showcase is in two days, and the client wants a preview tomorrow. You need to whip up a shell script that processes multiple templates efficiently, confirms each deployment with you, and ensures everything’s set up right.

## Objective
Write a shell script that uses a `while or for` loop to deploy multiple Tooplate templates to unique subdirectories under `/var/www/html`, `if` conditionals to handle errors and checks, and the `read` command to prompt for user confirmation before each deployment.

## Prerequisites
- A Linux environment (e.g., Ubuntu EC2 Instance) with Apache2 installed (from Task 1).
- `wget` and `unzip` installed (`sudo apt-get install -y wget unzip` if missing).
- Sudo privileges to modify `/var/www/html`.

## Provided Files
- `templates.txt`: A list of Tooplate ZIP URLs, e.g.: NB: Feel free to update the list
  ```
  https://www.tooplate.com/zip-templates/2135_mini_finance.zip
  https://www.tooplate.com/zip-templates/2121_wave_cafe.zip
  https://www.tooplate.com/zip-templates/2114_pixie.zip
  ```

## Task Instructions
1. **Analyze the Mission**: Review `templates.txt`. Each template should deploy to its own subdirectory (e.g., `/var/www/html/mini_finance`, `/var/www/html/wave_cafe`).
2. **Build the Script**: Create a script (e.g., `mass_deploy.sh`) that:
   - Uses a `for` loop (or `while` with redirection) to process each URL from `templates.txt`.
   - Extracts the template name from the URL (e.g., `2135_mini_finance` from the ZIP filename).
   - Uses an `if` conditional to check if the subdirectory already exists in `/var/www/html`.
   - Prompts with `read` for confirmation (e.g., “Deploy mini_finance? [y/n]”).
   - Downloads, unzips, and copies each template to its subdirectory.
   - Cleans up temporary files (ZIP and extracted folder).
   - Handles errors (e.g., failed downloads or unzips).
3. **Test Your Work**: Run the script (`./mass_deploy.sh templates.txt`) and verify each site is accessible (e.g., `curl localhost/mini_finance` or use the public ip of your EC2 instance).
4. **Document Your Process**: Submit:
   - Your script with clear comments.
   - A short write-up (200 words, in `report.md`) explaining:
     - How the `for or while` loop processes the list.
     - What the `if` conditions check.
     - Why `read` improves usability.

## Example Workflow
```bash
$ chmod +x mass_deploy.sh
$ ./mass_deploy.sh templates.txt
Deploy mini_finance to /var/www/html/mini_finance? [y/n]
y
Downloading... Unzipping... Deploying...
mini_finance deployed successfully!
Deploy wave_cafe to /var/www/html/wave_cafe? [y/n]
n
Skipping wave_cafe.
...
Mass deployment complete!
```

## Success Criteria
- **For Loop**: Correctly iterates through the template list.
- **If Conditionals**: Handles existing directories, user input, and errors effectively.
- **Read Command**: Implements interactive confirmation cleanly.
- **Functionality**: Deploys all confirmed templates to subdirectories without issues.
- **Documentation**: Script has clear comments; write-up is logical and concise.

## Tips
- Use `basename` to extract filenames from URLs.
- Redirect file input with `<` or use `while read` for looping.
- Test with a small `templates.txt` first to debug faster.

Good luck, DevOps hero! The client showcase depends on you!
