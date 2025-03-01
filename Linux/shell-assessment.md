# Shell Scripting Assessment - Questions

## Overview
This assessment is designed to test your proficiency in shell scripting by evaluating your ability to perform common system administration and automation tasks.

## Tasks

### **Task 1: File and Directory Operations**
Write a shell script that:
- Creates a directory called `backup` if it does not exist.
- Copies all `.txt` files from the current directory to the `backup` directory.
- Displays the number of `.txt` files copied.

**Example Usage:**
```
$ ./file_backup.sh
Copied 5 text files to the backup directory.
```

### **Task 2: User Input and Conditional Statements**
Write a script that:
- Prompts the user to enter a number.
- Determines whether the number is even or odd.
- Displays the appropriate message.

**Example Usage:**
```
$ ./check_number.sh
Enter a number: 7
7 is an odd number.
```

### **Task 3: Process Monitoring**
Write a shell script that:
- Takes a process name as an argument.
- Checks if the process is running.
- Displays a message indicating whether the process is running or not.

**Example Usage:**
```
$ ./process_check.sh nginx
Process nginx is running.
```

### **Task 4: Log File Analysis**
Write a script that:
- Reads the system log file (`/var/log/syslog`).
- Counts and displays the number of error messages in the log file.
- Extracts lines containing the word "failed" and saves them to a file named `failed.log`.

**Example Usage:**
```
$ ./log_analysis.sh
Error count: 15
Extracted failed logs into failed.log
```

### **Task 5: Automated Backup**
Write a script that:
- Accepts a directory path as an argument.
- Creates a compressed `.tar.gz` backup of the specified directory.
- Stores the backup in `/tmp/backup/` with a timestamped filename.

**Example Usage:**
```
$ ./backup.sh /home/user/documents
Backup created at /tmp/backup/backup_20250301.tar.gz
```

### **Task 6: AWS Automation**
Write a script that:
- Takes an AWS region as an argument.
- Lists all running EC2 instances in the specified region.
- Saves the list of running instances to a file named `aws_instances.log`.

**Example Usage:**
```
$ ./aws_check.sh us-east-1
Running Instances in us-east-1: i-0123456789abcdef0 i-0abcdef1234567890
Saved instance details to aws_instances.log
```
---

## Submission
- Write and test each script.
- Submit your scripts along with a README file explaining how to run them.
- Ensure that scripts have proper permissions (`chmod +x script.sh`).

Happy scripting! 🚀