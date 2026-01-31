# 🖨️ PHASE I — Linux + Git Command Cheat Sheet

A concise, beginner-friendly reference for **Linux system operations** and **Git basics**, structured for daily terminal use and interview prep.

---

## 🖥️ System & User Information

| Command | What it does |
|------|-------------|
| `uname` | Displays the OS name |
| `uname -a` | Shows kernel version and full OS details |
| `hostname` | Displays system hostname |
| `hostnamectl set-hostname NAME` | Changes the system hostname |
| `date` | Shows current date and time |
| `whoami` | Displays the current logged-in user |
| `id` | Shows UID, GID, and group IDs |
| `groups` | Lists groups of the current user |

---

## 📂 Directory Navigation

| Command | What it does |
|------|-------------|
| `pwd` | Prints current working directory |
| `ls` | Lists files and directories |
| `ls -a` | Includes hidden files |
| `ls -l` | Shows permissions, owner, size, and timestamp |
| `cd /` | Navigates to root directory |
| `cd ~` | Goes to home directory |
| `cd ..` | Moves one directory up |
| `cd -` | Switches to the previous directory |

---

## 🗂️ File & Directory Operations

| Command | What it does |
|------|-------------|
| `mkdir dir_name` | Creates a directory |
| `touch file.txt` | Creates an empty file |
| `cp src dest` | Copies files/directories |
| `mv old new` | Moves or renames files |
| `rm file` | Deletes a file |
| `rm -r dir` | Deletes a directory recursively |
| `cat file` | Displays file content |
| `nano file` | Edits file using Nano editor |
| `>> file` | Appends output to a file |

---

## 🔐 Users, Groups & Permissions (Day 3)

| Command | What it does |
|------|-------------|
| `useradd user` | Creates a new user |
| `passwd user` | Sets or changes user password |
| `groupadd group` | Creates a new group |
| `usermod -aG group user` | Adds user to a group |
| `su user` | Switches user |
| `sudo command` | Executes command as root |
| `chmod` | Modifies file permissions |
| `chown user:group file` | Changes file owner/group |
| `ls -l` | Verifies permissions |

---

## ⚙️ Processes & System Resources (Day 4)

| Command | What it does |
|------|-------------|
| `ps` | Displays running processes |
| `ps -ef` | Lists all processes |
| `top` | Live system monitoring |
| `free` | Shows memory usage |
| `free -h` | Human-readable memory output |
| `uptime` | Shows system load and runtime |
| `sleep 30` | Runs a dummy process |
| `jobs` | Lists background jobs |
| `fg` | Brings job to foreground |
| `bg` | Sends job to background |
| `kill PID` | Terminates a process |

---

## 💽 Disk & Filesystems (Day 5)

| Command | What it does |
|------|-------------|
| `df` | Displays disk usage |
| `df -h` | Human-readable disk usage |
| `df -i` | Shows inode usage |
| `du -sh *` | Directory size summary |
| `find /path` | Searches for files |

---

## 🌐 Networking (Day 6)

| Command | What it does |
|------|-------------|
| `ip a` | Displays IP addresses and interfaces |
| `hostname -I` | Shows server IP address |
| `ping host` | Tests network connectivity |
| `curl URL` | Tests application connectivity |
| `ss -tuln` | Shows listening ports |
| `netstat -tulnp` | Displays network connections |

---

## ⚙️ Services & Logs (Day 7)

| Command | What it does |
|------|-------------|
| `systemctl status service` | Checks service status |
| `systemctl start service` | Starts a service |
| `systemctl stop service` | Stops a service |
| `systemctl restart service` | Restarts a service |
| `systemctl enable service` | Enables service at boot |
| `systemctl disable service` | Disables service at boot |
| `systemctl list-units --type=service` | Lists all services |
| `journalctl -u service` | Views service logs |
| `journalctl -n 20` | Shows last 20 logs |
| `journalctl -f` | Live log monitoring |
| `systemctl status crond` | Cron service status (RHEL) |

---

## 🧠 Git & Project Basics

| Command | What it does |
|------|-------------|
| `git init` | Initializes a Git repository |
| `git status` | Shows repository status |
| `git add .` | Stages all changes |
| `git commit -m "msg"` | Commits changes |
| `git pull` | Syncs changes from remote |
| `git push` | Pushes changes to GitHub |

---

## 🔑 One-Line Summary

```text
Linux → observe → diagnose → fix  
systemctl → control services  
journalctl → debug systems  
Git → track and trust your changes
