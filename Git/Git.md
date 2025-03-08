# Git Essentials for DevOps

Welcome to the Git Essentials guide! This document will cover the fundamental Git commands you need to know to effectively manage your code and collaborate with others.

## Table of Contents
1. [Introduction to Git](#introduction-to-git)
2. [Setting Up Git](#setting-up-git)
3. [Basic Git Commands](#basic-git-commands)
    - [git init](#git-init)
    - [git clone](#git-clone)
    - [git status](#git-status)
    - [git add](#git-add)
    - [git commit](#git-commit)
    - [git pull](#git-pull)
    - [git push](#git-push)
4. [Branching and Merging](#branching-and-merging)
    - [git branch](#git-branch)
    - [git checkout](#git-checkout)
    - [git merge](#git-merge)
5. [Undoing Changes](#undoing-changes)
    - [git reset](#git-reset)
    - [git revert](#git-revert)
6. [Stashing Changes](#stashing-changes)
    - [git stash](#git-stash)
7. [Viewing Commit History](#viewing-commit-history)
    - [git log](#git-log)
8. [Remote Repositories](#remote-repositories)
    - [git remote](#git-remote)
    - [git fetch](#git-fetch)

## Introduction to Git

Git is a distributed version control system that helps you track changes to your code, collaborate with others, and manage your project's history. It's widely used in the software development industry and is an essential tool for any DevOps engineer.

## Setting Up Git

Before you can use Git, you need to install it on your computer. You can download Git from the [official website](https://git-scm.com/).

After installing Git, configure your username and email address:

```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

## Basic Git Commands

### `*git init*`

Initialize a new Git repository in your project directory.

```bash
mkdir my-project
cd my-project
git init
```

Options:
- `--bare`: Creates a bare repository. Bare repositories do not have a working directory and are typically used as central repositories.

### `git clone`

Clone an existing repository from a remote server to your local machine.

```bash
git clone https://github.com/username/repository.git
```

Options:
- `--depth <depth>`: Create a shallow clone with a history truncated to the specified number of commits.
- `--branch <branch>`: Clone a specific branch.

### `git status`

Check the status of your working directory and staging area.

```bash
git status
```

Options:
- `-s` or `--short`: Give the output in the short-format.
- `-b` or `--branch`: Show the branch and tracking info even in short-format.

### `git add`

Add changes to the staging area.

```bash
# Add a specific file
git add file.txt

# Add all changes
git add .
```

Options:
- `-n` or `--dry-run`: Show what would be added without actually adding it.
- `-p` or `--patch`: Interactively choose hunks of patch between the index and the work tree and add them to the index.

### `git commit`

Commit changes in the staging area with a descriptive message.

```bash
git commit -m "Add feature X"
```

Options:
- `-a` or `--all`: Commit all changed files.
- `--amend`: Modify the last commit with the currently staged changes.

### `git pull`

Fetch changes from a remote repository and merge them into your local branch.

```bash
git pull origin main
```

Options:
- `--rebase`: Rebase the current branch on top of the upstream branch after fetching.
- `--no-commit`: Do not commit automatically after merging.

### `git push`

Push your local changes to a remote repository.

```bash
git push origin main
```

Options:
- `-f` or `--force`: Force push changes to the remote repository.
- `--tags`: Push all tags to the remote repository.

## Branching and Merging

### `git branch`

Create, list, and delete branches.

```bash
# List branches
git branch

# Create a new branch
git branch feature-branch

# Delete a branch
git branch -d feature-branch
```

Options:
- `-a` or `--all`: List both local and remote branches.
- `-r` or `--remotes`: List only the remote branches.

### `git checkout`

Switch to a different branch or restore working directory files.

```bash
# Switch to a branch
git checkout feature-branch

# Create and switch to a new branch
git checkout -b new-branch
```

Options:
- `-b`: Create a new branch and switch to it.
- `--track`: Set up tracking information during switch.

### `git merge`

Merge changes from one branch into another.

```bash
# Merge feature-branch into main
git checkout main
git merge feature-branch
```

Options:
- `--no-ff`: Create a merge commit even if the merge resolves as a fast-forward.
- `--squash`: Merge changes without committing them.

## Undoing Changes

### `git reset`

Unstage changes or reset the current branch to a previous state.

```bash
# Unstage changes
git reset file.txt

# Reset to a previous commit
git reset --hard commit-hash
```

Options:
- `--soft`: Keep changes in the working directory and index.
- `--hard`: Discard all changes in the working directory and index.

### `git revert`

Create a new commit that undoes changes from a previous commit.

```bash
git revert commit-hash
```

Options:
- `-n` or `--no-commit`: Do not commit the revert immediately.
- `-m <parent-number>`: Use the given parent number to revert a merge commit.

## Stashing Changes

### `git stash`

Temporarily save changes that are not ready to be committed.

```bash
# Stash changes
git stash

# List stashes
git stash list

# Apply the most recent stash
git stash apply
```

Options:
- `-u` or `--include-untracked`: Stash untracked files in addition to tracked files.
- `-k` or `--keep-index`: Keep changes already added to the index.

## Viewing Commit History

### `git log`

View the commit history of your repository.

```bash
git log
```

Options:
- `--oneline`: Show each commit on a single line.
- `--graph`: Show a graph of the commit history.

## Remote Repositories

### `git remote`

Manage remote repositories.

```bash
# List remote repositories
git remote -v

# Add a remote repository
git remote add origin https://github.com/username/repository.git

# Remove a remote repository
git remote remove origin
```

Options:
- `-v` or `--verbose`: Show the URLs of the remote repositories.

### `git fetch`

Download objects and refs from a remote repository.

```bash
git fetch origin
```

Options:
- `--all`: Fetch all remotes.
- `--prune`: Remove remote-tracking branches that no longer exist on the remote.
