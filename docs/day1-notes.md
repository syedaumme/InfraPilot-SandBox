--Day 1 - DevOps Fundamentals--

->Topics Covered :
* Why DevOps? DevOps vs SDLC
* DevOps Tools Overview
* DevOps Lifecycle
* DevOps Core Principles
* OS Fundamentals - Shell vs Kernel, Shell Interfaces

->Practical/Project :
* Cloned Virtual Machine
* Configured Public IP to Private
* Connected the VM to local PowerShell/CMD using Secure Shell ssh root@192.168.29.241
* Changed Hostname to DevOpsEngg - hostnamectl set-hostname
* User Vs Hostname
* Saved Outputs of commands in log file. [whoami,date,uname,pwd,hostname]
* Github Connection - 
- Cofig : git config --global user.name "Your Name"
git config --global user.email "your-email@gmail.com"
- Generate a Key - ssh-keygen -t ed25519 -C "your-email@gmail.com"
- Copy the Key using - cat ~/.ssh/id_ed25519.pub
- Paste in the SSH keys in Settings in Github [Browser]
- Test the connection - ssh -T git@github.com
- Create a github Repo - git@github.com:yourusername/infrapilot.git
- Connect Project to Github - git init
git branch -M main
git remote add origin git@github.com:yourusername/infrapilot.git
- Add, Commit, Push - git add .
git commit -m "Day 1: DevOps fundamentals and Linux basics"
git push -u origin main

