# Linux Basics Exercises

This exercise set will help you practice fundamental Linux concepts, focusing on:

- Introduction to Linux
- Basic Commands
- Linux File System Hierarchy
- Using `find` and `grep`

---

## 1. Introduction to Linux

1. **Check Your Distribution**
   - Use the command to show basic system information (e.g., `uname -a`). Identify the Linux distribution you're using.

2. **Identify Key Features**
   - Make a short list (not in the terminal, but as notes) of key features of your distribution, such as package manager, default desktop environment (if any), etc.

3. **Locate System Documentation**
   - Use `man` to view the manual for a common command (e.g., `ls`, `pwd`, or `cat`). Write down one interesting option or flag you discovered.

---

## 2. Basic Commands

1. **Navigating the File System**
   - Use `pwd` to confirm your current directory.
   - Change directories to `/home` (or another directory you’re allowed to access) using `cd`, then confirm with `pwd`.
   - Use `ls` to list contents and explore subdirectories.

2. **Creating and Managing Directories/Files**
   - In your home directory, create a new directory called `linux_exercises`.
   - Change into that directory, then create an empty file named `testfile.txt` using `touch`.
   - List the directory contents to confirm the file was created.

3. **Exploring System Information**
   - Run `df -h` to check disk usage and note how much space is available on your system.
   - Run `free -h` to check your system’s memory usage.

4. **Viewing and Editing Files**
   - Use `echo` to write a short message (e.g., `Hello Linux!`) into `testfile.txt` by redirecting output (e.g., `echo "Hello Linux!" > testfile.txt`).
   - Use `cat` to confirm your message was written.

---

## 3. Linux File System Hierarchy

1. **Identify Major Directories**
   - Run `ls /` to see top-level directories (e.g., `/bin`, `/etc`, `/home`, etc.).
   - Briefly describe (in your notes) the purpose of `/bin`, `/etc`, and `/home`.

2. **Check Contents of a System Directory**
   - Navigate to `/var` and list its contents.
   - Find a directory that stores log files (note its name for later use).

3. **Explore Subdirectories**
   - Go into `/usr` and list the contents of `/usr/bin` or `/usr/share`.
   - Observe how many files or subdirectories are there (you can use `ls | wc -l` to count).

---

## 4. Using `find` and `grep`

### 4.1 `find`

1. **Locate Specific Files**
   - Inside your home directory, use `find` to search for `testfile.txt`.
     ```bash
     find ~ -name "testfile.txt"
     ```
   - Note how the path is displayed.

2. **Search by File Type**
   - In the `/var` directory, search for all directories only:
     ```bash
     find /var -type d
     ```
   - Observe if you discover any subdirectory structure you didn’t notice before.

### 4.2 `grep`

1. **Search a Single File**
   - Append another line to `testfile.txt` (e.g., `echo "Linux is powerful." >> testfile.txt`).
   - Use `grep` to search for the word "Linux" in `testfile.txt`.

2. **Recursive Search**
   - In your `/var/log` directory (or another directory with text-based logs), pick a log file that contains human-readable text.
   - Use `grep -r "error" /path/to/log` to see if there are any lines matching the word "error".

---

## Additional Tasks

- **Cleanup**: If you created any extra files or directories, remove them when you’re finished practicing.
- **Reflection**: Write a short paragraph summarizing what you learned about Linux basics, particularly about the file system hierarchy, common commands, and how to use `find` and `grep`.

---

## Wrap-Up

By completing these exercises, you should now have:

- A clearer understanding of fundamental Linux directories and their purposes.
- Practical experience with commands such as `pwd`, `ls`, `cd`, `cat`, `echo`, `df`, `free`, and more.
- Confidence using `find` to locate files and directories based on specific criteria.
- Basic familiarity with `grep` for searching text patterns.

Continue to explore and practice these commands to further strengthen your Linux skills!
