# DAY 7 — SERVICES & LOGS

## Service

* Background process
* Runs continuously
* Provides system functionality

---

## systemd

* Service manager
* Controls service lifecycle
* Manages boot and logs

---

## systemctl

* CLI tool for systemd
* Used to start/stop/restart services
* Requires sudo for system-level control

---

## Service Permissions

* Services are **managed by root**
* Services **do not run fully as root**
* Privileges are dropped for security

---

## Service States

* active (running)
* inactive (stopped)
* failed
* enabled (starts at boot)
* disabled (manual start)

---

## Service Failures

* Configuration error
* Permission denied
* Port already in use
* Missing dependency
* Disk full
* Wrong user/group

---

## Logs

* Text-based records
* Explain why services fail
* Used for debugging

---

## journalctl

* Reads systemd logs
* Used to diagnose service issues

---

## Cron

* Job scheduler
* Executes tasks automatically

---

## Cron Service Name

* Debian/Ubuntu: `cron`
* RHEL/CentOS: `crond`

---

## Troubleshooting Rule

* Check status
* Read logs
* Fix cause
* Restart once

---

## Key Summary

* systemd → manager
* systemctl → control
* journalctl → logs
* crond → scheduler

---

