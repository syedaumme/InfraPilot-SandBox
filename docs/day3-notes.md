# Day 3 — Users, Groups & Permissions

## Topics Covered
- Users vs Groups
- Root vs Normal users
- File ownership
- Linux permission model (r, w, x)
- Numeric permissions
- Why permission issues break systems

---

## What I Practised
- Checked current user and groups
- Created a new user and group
- Added user to a group
- Created files and directories
- Changed file ownership
- Modified file permissions
- Observed permission denied errors
- Fixed permission issues correctly

---

## Key Learnings

### Users vs Groups
- Every command runs as a user
- Groups are used to share access
- Linux checks permissions in this order:
  1. Owner
  2. Group
  3. Others

### Root vs Normal User
- Root can bypass all permissions
- Normal users are restricted
- If something works as root but not as normal user, permissions are wrong

### Ownership vs Permissions
- `chown` controls **who owns** the file
- `chmod` controls **what actions are allowed**
- Changing permissions without correct ownership often does not fix issues

### Directory Permissions
- Read (`r`) → list files
- Write (`w`) → create/delete files
- Execute (`x`) → enter directory
- Missing execute permission blocks access even if file permissions are correct

---

## Issue Faced
- Permission denied while accessing a file

## Root Cause
- File permissions were removed
- Directory execute permission was missing

## Fix
- Restored appropriate permissions using `chmod`
- Ensured correct ownership using `chown`

---

## Logs
Refer to: `logs/day3.log`
