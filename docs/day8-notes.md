DAY 8 — Shell Scripting Basics (COMMANDS & SYNTAX)
#!/bin/bash

Why used:
Specifies bash as the interpreter for the script.

chmod +x script.sh

Why used:
Gives execute permission so the kernel can run the script.

./script.sh

Why used:
Explicitly executes script from current directory (security).

echo
echo "text"


Why used:
Prints readable output or labels in logs.

Command Substitution
$(command)


Why used:
Runs a command and replaces it with its output.

Example:

echo "Hostname: $(hostname)"

hostname

Why used:
Identifies which server the script is running on.

uptime

Why used:
Checks system running time and load average.

df -h /

Why used:
Checks disk usage of root filesystem (critical for system health).

Output Redirection
>> file.log


Why used:
Appends script output to log file (persistent logging).
