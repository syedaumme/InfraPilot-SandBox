SHELL SCRIPTING BASICS
- #!/bin/bash → interpreter
- chmod +x → make executable
- ./script.sh → explicit execution

VARIABLES & SUBSTITUTION
- var=value
- $(command)

CONDITIONS
- if [ "$var" -gt 80 ]
- -gt / -lt / -eq

PIPELINES
- command1 | command2

LOGGING
- > / >>
- timestamps
- log files

CRON
- crontab -e
- */5 * * * *
