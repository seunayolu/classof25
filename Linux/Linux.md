```markdown
# Linux Basics

This repository provides an introduction to Linux basics, including essential commands, file system navigation, file permissions, process management, networking, and shell scripting. Whether you're new to Linux or need a refresher, this guide will help you get started.

---

## Table of Contents

1. [Introduction to Linux](#introduction-to-linux)
   - [What is Linux?](#what-is-linux)
   - [Key Features of Linux](#key-features-of-linux)
   - [Common Linux Distributions](#common-linux-distributions)
2. [Basic Commands](#basic-commands)
   - [Navigating the File System](#navigating-the-file-system)
   - [File and Directory Operations](#file-and-directory-operations)
   - [Viewing and Editing Files](#viewing-and-editing-files)
   - [System Information Commands](#system-information-commands)
3. [File System Navigation](#file-system-navigation)
   - [Linux File System Hierarchy](#linux-file-system-hierarchy)
   - [Key Directories](#key-directories)
4. [File Permissions](#file-permissions)
   - [Understanding Permissions](#understanding-permissions)
   - [Changing Permissions](#changing-permissions)
   - [Changing Ownership](#changing-ownership)
5. [Process Management](#process-management)
   - [Viewing Processes](#viewing-processes)
   - [Managing Processes](#managing-processes)
   - [Background and Foreground Processes](#background-and-foreground-processes)
6. [Networking Basics](#networking-basics)
   - [Checking Network Connectivity](#checking-network-connectivity)
   - [Network Interface Configuration](#network-interface-configuration)
   - [Remote Access with SSH](#remote-access-with-ssh)
   - [Transferring Files with SCP](#transferring-files-with-scp)
7. [Shell Scripting](#shell-scripting)
   - [What is a Shell Script?](#what-is-a-shell-script)
   - [Writing a Simple Script](#writing-a-simple-script)
   - [Running a Script](#running-a-script)
8. [Resources](#resources)

---

## Introduction to Linux

### What is Linux?
Linux is an open-source, Unix-like operating system kernel first released by Linus Torvalds in 1991. It is the foundation for many operating systems (distributions) like Ubuntu, CentOS, and Fedora.

### Key Features of Linux
- **Open Source**: Freely available to use, modify, and distribute.
- **Multi-User**: Supports multiple users simultaneously.
- **Security**: Robust user permissions and security features.
- **Stability**: Known for its reliability and uptime.
- **Flexibility**: Can be used on servers, desktops, embedded systems, and more.

### Common Linux Distributions
- **Ubuntu**: User-friendly, great for beginners.
- **CentOS**: Popular for servers and enterprise environments.
- **Debian**: Known for stability and extensive software repositories.
- **Fedora**: Cutting-edge features and frequent updates.

---

## Basic Commands

### Navigating the File System
- **`pwd`**: Print the current working directory.
  ```bash
  $ pwd
  /home/username
  ```
- **`cd`**: Change directory.
  ```bash
  $ cd /home/username/Documents
  ```
- **`ls`**: List files and directories.
  ```bash
  $ ls
  Documents  Downloads  Music  Pictures
  ```

### File and Directory Operations
- **`mkdir`**: Create a new directory.
  ```bash
  $ mkdir new_folder
  ```
- **`rm`**: Remove files or directories.
  ```bash
  $ rm file.txt
  $ rm -r folder  # Remove directory recursively
  ```
- **`cp`**: Copy files or directories.
  ```bash
  $ cp file.txt file_backup.txt
  $ cp -r folder1 folder2  # Copy directory recursively
  ```
- **`mv`**: Move or rename files or directories.
  ```bash
  $ mv file.txt /home/username/Documents/
  $ mv old_name.txt new_name.txt
  ```

### Viewing and Editing Files
- **`cat`**: Display file content.
  ```bash
  $ cat file.txt
  Hello, World!
  ```
- **`echo`**: Print text to the terminal.
  ```bash
  $ echo "Hello, Linux!"
  Hello, Linux!
  ```
- **`nano`**: Simple text editor.
  ```bash
  $ nano file.txt
  ```

### System Information Commands
- **`uname`**: Display system information.
  ```bash
  $ uname -a
  Linux hostname 5.4.0-42-generic #46-Ubuntu SMP Fri Jul 10 00:24:02 UTC 2020 x86_64 GNU/Linux
  ```
- **`df`**: Display disk space usage.
  ```bash
  $ df -h
  ```
- **`free`**: Display memory usage.
  ```bash
  $ free -h
  ```

---

## File System Navigation

### Linux File System Hierarchy
The Linux file system is organized in a hierarchical structure, starting from the root (`/`). Key directories include:
- **`/`**: Root directory.
- **`/home`**: User home directories.
- **`/etc`**: Configuration files.
- **`/var`**: Variable data like logs.
- **`/usr`**: User-installed software.

### Key Directories
- **`/bin`**: Essential command binaries.
- **`/dev`**: Device files.
- **`/tmp`**: Temporary files.
- **`/opt`**: Optional software packages.

---

## File Permissions

### Understanding Permissions
Linux uses a permission system to control access to files and directories. Permissions are divided into three categories:
- **Owner**: The user who owns the file.
- **Group**: Users who are part of a group.
- **Others**: All other users.

Permissions are represented as:
- **`r`**: Read (4)
- **`w`**: Write (2)
- **`x`**: Execute (1)

Example:
```bash
$ ls -l file.txt
-rw-r--r-- 1 username groupname 0 Oct  1 12:34 file.txt
```
- `rw-`: Owner can read and write.
- `r--`: Group can read.
- `r--`: Others can read.

### Changing Permissions
- **`chmod`**: Change file permissions.
  ```bash
  $ chmod 755 file.txt  # rwxr-xr-x
  $ chmod +x script.sh  # Make script executable
  ```

### Changing Ownership
- **`chown`**: Change file owner and group.
  ```bash
  $ chown username:groupname file.txt
  ```

---

## Process Management

### Viewing Processes
- **`ps`**: Display running processes.
  ```bash
  $ ps aux
  ```
- **`top`**: Real-time system monitoring.
  ```bash
  $ top
  ```

### Managing Processes
- **`kill`**: Terminate a process.
  ```bash
  $ kill 1234  # Kill process with PID 1234
  $ kill -9 1234  # Force kill
  ```

### Background and Foreground Processes
- **`&`**: Run a process in the background.
  ```bash
  $ sleep 100 &
  ```
- **`bg`**: Send a process to the background.
- **`fg`**: Bring a process to the foreground.

---

## Networking Basics

### Checking Network Connectivity
- **`ping`**: Test network connectivity.
  ```bash
  $ ping google.com
  ```

### Network Interface Configuration
- **`ifconfig`**: Display network interfaces.
  ```bash
  $ ifconfig
  ```
- **`ip`**: Modern alternative to `ifconfig`.
  ```bash
  $ ip addr show
  ```

### Remote Access with SSH
- **`ssh`**: Connect to a remote server.
  ```bash
  $ ssh username@remote_host
  ```

### Transferring Files with SCP
- **`scp`**: Securely copy files between hosts.
  ```bash
  $ scp file.txt username@remote_host:/path/to/destination
  ```

---

## Shell Scripting

### What is a Shell Script?
A shell script is a text file containing a series of commands that are executed by the shell.

### Writing a Simple Script
```bash
#!/bin/bash

# This is a comment
echo "Hello, $USER!"
echo "Today is $(date)"
```

### Running a Script
1. Make the script executable:
   ```bash
   $ chmod +x script.sh
   ```
2. Run the script:
   ```bash
   $ ./script.sh
   ```

---

## Resources

- [The Linux Command Line](https://linuxcommand.org/)
- [Linux Documentation Project](https://www.tldp.org/)
- [Ubuntu Documentation](https://help.ubuntu.com/)

---