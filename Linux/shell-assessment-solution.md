# Shell Scripting Assessment - Solutions

## Overview
This document contains the solutions to the shell scripting assessment.

## Solutions

### **Task 1: File and Directory Operations**
#### **Solution: file_backup.sh**
```bash
#!/bin/bash

# Create backup directory if it does not exist
mkdir -p backup

# Count and copy .txt files
txt_count=$(ls *.txt 2>/dev/null | wc -l)
cp *.txt backup/ 2>/dev/null

echo "Copied $txt_count text files to the backup directory."
```

### **Task 2: User Input and Conditional Statements**
#### **Solution: check_number.sh**
```bash
#!/bin/bash

# Prompt user for input
read -p "Enter a number: " num

# Check if number is even or odd
if (( num % 2 == 0 )); then
    echo "$num is an even number."
else
    echo "$num is an odd number."
fi
```

### **Task 3: Process Monitoring**
#### **Solution: process_check.sh**
```bash
#!/bin/bash

# Check if process name is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <process_name>"
    exit 1
fi

# Check if process is running
if pgrep -x "$1" > /dev/null; then
    echo "Process $1 is running."
else
    echo "Process $1 is not running."
fi
```

### **Task 4: Log File Analysis**
#### **Solution: log_analysis.sh**
```bash
#!/bin/bash

# Define log file
LOG_FILE="/var/log/syslog"

# Count error messages
error_count=$(grep -i "error" $LOG_FILE | wc -l)

echo "Error count: $error_count"

# Extract failed log entries
grep -i "failed" $LOG_FILE > failed.log

echo "Extracted failed logs into failed.log"
```

### **Task 5: Automated Backup**
#### **Solution: backup.sh**
```bash
#!/bin/bash

# Check if directory path is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <directory_path>"
    exit 1
fi

# Create backup folder
mkdir -p /tmp/backup

timestamp=$(date +%Y%m%d_%H%M%S)
backup_file="/tmp/backup/backup_${timestamp}.tar.gz"

tar -czf "$backup_file" "$1"

echo "Backup created at $backup_file"
```

### **Task 6: System Resource Monitoring**
#### **Solution: monitor.sh**
```bash
#!/bin/bash

while true; do
    cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
    mem_usage=$(free | awk '/Mem/ {printf("%.2f"), $3/$2 * 100}')
    echo "CPU: $cpu_usage%, Memory: $mem_usage%"
    
    if (( $(echo "$cpu_usage > 80" | bc -l) )); then
        echo "High CPU usage: $cpu_usage%" >> resource_alert.log
    fi
    
    if (( $(echo "$mem_usage > 90" | bc -l) )); then
        echo "Memory usage exceeded 90%" | mail -s "High Memory Alert" admin@example.com
    fi
    
    sleep 5
done
```

### **Task 7: AWS Automation**
#### **Solution: aws_check.sh**
```bash
#!/bin/bash

# Check if AWS region is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <aws_region>"
    exit 1
fi

AWS_REGION=$1

# List running EC2 instances
instances=$(aws ec2 describe-instances --region $AWS_REGION --query 'Reservations[*].Instances[*].InstanceId' --output text)

echo "Running Instances in $AWS_REGION: $instances"
echo "$instances" > aws_instances.log
```

---

## Usage
- Ensure each script has execution permission: `chmod +x script.sh`
- Run the script with necessary arguments where applicable.

Happy scripting! 🚀
