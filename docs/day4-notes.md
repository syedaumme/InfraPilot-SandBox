# Day 4 — Processes, CPU & Memory

## Topics Covered
- What is a process
- Parent and child processes
- Foreground vs background processes
- Process states
- CPU usage vs memory usage
- Safe and unsafe process termination

---

## What I Practised
- Listed running processes
- Monitored system activity
- Checked memory usage
- Observed system load
- Ran background processes
- Moved processes between foreground and background
- Killed processes safely and forcefully

---

## Key Learnings

### Processes
- A process is a running program
- Each process has a unique PID
- Processes are created by other processes

### Foreground vs Background
- Foreground processes block the terminal
- Background processes allow continued terminal use

### CPU vs Memory
- High CPU usage usually means heavy computation
- High memory usage often indicates memory leaks
- High system load does not always mean high CPU usage

### Killing Processes
- Normal kill allows graceful shutdown
- Force kill immediately terminates a process
- Force kill should only be used when normal kill fails

---

## Issue Faced
- Background process consuming resources

## Root Cause
- Process running longer than required

## Fix
- Identified the process using its PID
- Terminated it safely

---

## Logs
Refer to: `logs/day4.log`
