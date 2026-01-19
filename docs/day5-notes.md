# Day 5 — Disk, Filesystems & Inodes

## Topics Covered
- Disk vs filesystem
- Mount points
- Disk usage
- Inode usage
- Difference between disk full and inode full
- Why disk issues crash systems

---

## What I Practised
- Checked disk usage
- Checked directory sizes
- Checked inode usage
- Identified large files
- Simulated inode exhaustion
- Cleaned up unused files

---

## Key Learnings

### Disk vs Filesystem
- Disk is physical storage
- Filesystem is the structure used to store files
- Linux cannot use raw disks directly

### Disk Space vs Inodes
- Disk full means no space left
- Inode full means no more files can be created
- A system can have free disk space but still fail due to inode exhaustion

### Real-World Impact
- Log files often cause disk issues
- Inode exhaustion commonly occurs due to many small files
- Disk issues can crash databases and applications

---

## Issue Faced
- Disk space appeared available but file creation failed

## Root Cause
- Inode exhaustion due to many small files

## Fix
- Removed unnecessary files
- Verified inode availability

---

## Logs
Refer to: `logs/day5.log`
