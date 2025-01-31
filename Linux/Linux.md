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
## Linux File System Hierarchy

The Linux file system is organized in a hierarchical (tree-like) structure, starting from the **root directory** (`/`). Each directory under the root serves a specific purpose. 

### Root Directory (`/`)

- **Purpose**: The root directory is the top-level directory in the Linux file system. All other directories and files are organized under it.
- **Example**:
  ```bash
  $ cd /
  $ ls
  bin   dev   home  lib    media  opt   root  sbin  sys  usr
  boot  etc   init  lib64  mnt    proc  run   srv   tmp  var
  ```

---

### `/bin` (Binaries)
- **Purpose**: Contains essential **command binaries** (executable files) that are required for basic system functionality. These commands are available to all users.
- **Examples**: Commands like `ls`, `cp`, `mv`, `rm`, `cat`, and `echo` are stored here.
- **Location**:
  ```bash
  $ ls /bin
  bash  cat  cp  ls  mv  rm
  ```

---

### `/dev` (Device Files)
- **Purpose**: Contains **device files** that represent hardware devices (e.g., hard drives, keyboards, printers) as files. These files allow the operating system to interact with hardware.
- **Examples**:
  - `/dev/sda`: Represents the first hard drive.
  - `/dev/tty`: Represents the terminal.
- **Location**:
  ```bash
  $ ls /dev
  sda  tty  null  random
  ```

---

### `/etc` (Configuration Files)
- **Purpose**: Contains **system-wide configuration files** and scripts. These files control the behavior of the operating system and installed applications.
- **Examples**:
  - `/etc/passwd`: Stores user account information.
  - `/etc/hosts`: Maps hostnames to IP addresses.
  - `/etc/ssh/sshd_config`: Configuration file for the SSH server.
- **Location**:
  ```bash
  $ ls /etc
  passwd  hosts  ssh
  ```

---

### `/home` (User Home Directories)
- **Purpose**: Contains **personal directories** for each user on the system. Each user has a subdirectory under `/home` where they can store personal files and configurations.
- **Examples**:
  - `/home/username`: Personal directory for `username`.
  - `/home/john`: Personal directory for user `john`.
- **Location**:
  ```bash
  $ ls /home
  username  john
  ```

---

### `/lib` and `/lib64` (Libraries)
- **Purpose**: Contains **shared library files** required by the system and applications. These libraries are essential for running programs.
- **Examples**:
  - `/lib/libc.so.6`: The C standard library.
  - `/lib64/ld-linux-x86-64.so.2`: The dynamic linker/loader for 64-bit systems.
- **Location**:
  ```bash
  $ ls /lib
  libc.so.6  modules
  ```

---

### `/media` and `/mnt` (Mount Points)
- **Purpose**: Used for **mounting external storage devices** like USB drives, CDs, and network shares.
  - `/media`: Typically used for removable media (e.g., USB drives).
  - `/mnt`: Used for temporary mounts (e.g., network shares).
- **Examples**:
  - `/media/usb`: Mount point for a USB drive.
  - `/mnt/network_share`: Mount point for a network file system.
- **Location**:
  ```bash
  $ ls /media
  usb
  ```

---

### `/opt` (Optional Software)
- **Purpose**: Contains **optional or third-party software packages**. These are typically large applications that are not part of the default system installation.
- **Examples**:
  - `/opt/google/chrome`: Google Chrome installation.
  - `/opt/oracle`: Oracle database software.
- **Location**:
  ```bash
  $ ls /opt
  google  oracle
  ```

---

### `/proc` (Process Information)
- **Purpose**: A **virtual filesystem** that provides information about running processes and system resources. Files in `/proc` are dynamically generated by the kernel.
- **Examples**:
  - `/proc/cpuinfo`: Information about the CPU.
  - `/proc/meminfo`: Information about memory usage.
  - `/proc/1234`: Directory for process with PID 1234.
- **Location**:
  ```bash
  $ ls /proc
  1  2  3  cpuinfo  meminfo
  ```

---

### `/root` (Root User's Home)
- **Purpose**: The **home directory for the root user** (system administrator). This is separate from `/home` for security reasons.
- **Location**:
  ```bash
  $ ls /root
  ```

---

### `/tmp` (Temporary Files)
- **Purpose**: Contains **temporary files** created by the system and applications. Files in `/tmp` are often deleted upon reboot.
- **Examples**:
  - Temporary download files.
  - Cache files.
- **Location**:
  ```bash
  $ ls /tmp
  temp_file  cache
  ```

---

### `/usr` (User Programs and Data)
- **Purpose**: Contains **user-installed software**, libraries, and documentation. This directory is often read-only and shared across multiple systems.
- **Subdirectories**:
  - `/usr/bin`: User command binaries.
  - `/usr/lib`: Libraries for user programs.
  - `/usr/share`: Shared data like documentation and fonts.
- **Location**:
  ```bash
  $ ls /usr
  bin  lib  share
  ```

---

### `/var` (Variable Data)
- **Purpose**: Contains **variable data files** that change frequently during system operation. This includes logs, databases, and spool files.
- **Subdirectories**:
  - `/var/log`: System and application logs.
  - `/var/spool`: Queued files (e.g., print jobs).
  - `/var/cache`: Application cache data.
- **Examples**:
  - `/var/log/syslog`: System log file.
  - `/var/spool/mail`: Incoming mail files.
- **Location**:
  ```bash
  $ ls /var
  log  spool  cache
  ```

---

## Summary of Key Directories

| Directory | Purpose |
|-----------|---------|
| `/`       | Root directory, the top of the file system hierarchy. |
| `/bin`    | Essential command binaries for all users. |
| `/dev`    | Device files representing hardware. |
| `/etc`    | System-wide configuration files. |
| `/home`   | Personal directories for users. |
| `/lib`    | Shared libraries for system and applications. |
| `/media`  | Mount points for removable media. |
| `/mnt`    | Temporary mount points. |
| `/opt`    | Optional or third-party software. |
| `/proc`   | Virtual filesystem for process and system information. |
| `/root`   | Home directory for the root user. |
| `/tmp`    | Temporary files (often deleted on reboot). |
| `/usr`    | User-installed software and shared data. |
| `/var`    | Variable data like logs and caches. |

---

## Why is this Important?

Understanding the Linux file system hierarchy is crucial for:
- Navigating the system efficiently.
- Locating configuration files, logs, and binaries.
- Troubleshooting system issues.
- Managing files and directories effectively.

By knowing what each directory represents, you can work more confidently in a Linux environment and understand where to find or store files.

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