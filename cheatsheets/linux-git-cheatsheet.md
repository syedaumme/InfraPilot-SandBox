--> 🖨️ PHASE I - LINUX + GIT COMMAND CHEAT SHEET

🖥️ SYSTEM & USER INFO
Command
Purpose
uname
OS name
uname -a
Kernel & OS details
hostname
Show system hostname
hostnamectl set-hostname NAME
Change hostname
date
Current date & time
whoami
Current logged-in user
id
UID, GID, groups
groups
Groups of current user


📂 DIRECTORY NAVIGATION
Command
Purpose
pwd
Current directory
ls
List files
ls -a
Include hidden files
ls -l
Permissions & ownership
cd /
Go to root
cd ~
Home directory
cd ..
One level up
cd -
Previous directory


🗂️ FILE & DIRECTORY OPERATIONS
Command
Purpose
mkdir
Create directory
touch
Create empty file
cp
Copy file
mv
Move / rename
rm
Delete file
rm -r
Delete directory
cat
View file content
nano
Edit file
>>
Append output to file


🔐 USERS, GROUPS & PERMISSIONS (DAY 3)
Command
Purpose
useradd
Create user
passwd
Set user password
groupadd
Create group
usermod -aG
Add user to group
su
Switch user
sudo
Run command as root
chmod
Change permissions
chown
Change owner/group
ls -l
Check permissions


⚙️ PROCESSES & SYSTEM RESOURCES (DAY 4)
Command
Purpose
ps
Show processes
ps -ef
All processes
top
Live system monitor
free
Memory usage
free -h
Human-readable memory
uptime
System load
sleep
Dummy process
jobs
Background jobs
fg
Bring job to foreground
bg
Send job to background
kill
Stop process


💽 DISK & FILESYSTEMS (DAY 5)
Command
Purpose
df
Disk usage
df -h
Human-readable disk
df -i
Inode usage
du -sh *
Directory size
find
Find files


🌐 NETWORKING (DAY 6)
Command
Purpose
ip a
Show IP & interfaces
hostname
Identify server
ping
Network connectivity
curl
App connectivity test
ss
Listening ports
netstat
Network connections


⚙️ SERVICES & LOGS (DAY 7)
Command
Purpose
systemctl status
Check service status
systemctl start
Start service
systemctl stop
Stop service
systemctl restart
Restart service
systemctl enable
Enable at boot
systemctl disable
Disable at boot
systemctl list-units --type=service
List services
journalctl -u SERVICE
Service logs
journalctl -n 20
Last 20 logs
journalctl -f
Live logs
systemctl status crond
Cron service (RHEL)


🧠 GIT & PROJECT
Command
Purpose
git init
Initialize repo
git status
Repo status
git add
Stage files
git commit
Commit changes
git pull
Sync changes
git push
Push to GitHub


🔑 ONE-LINE SUMMARY
Linux: observe → diagnose → fix
systemctl: control
journalctl: debug
Git: track changes
