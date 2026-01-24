DAY 9 — DISK MONITORING (InfraPilot v2)

Purpose:
- Detect disk full conditions early

Command:
df /
- Checks root filesystem usage

Extract usage:
df / | tail -1 | awk '{print $5}'
- tail -1 → removes header
- awk '{print $5}' → extracts Use%

Remove %:
tr -d '%'
- Enables numeric comparison

Store value:
usage=$(...)
- Saves disk usage in variable

Condition:
if [ "$usage" -gt 80 ]; then
- Triggers warning above threshold

Output:
echo "WARNING: Disk usage is above 80% ($usage%)"
echo "Disk usage is normal ($usage%)"
- Human-readable logs

Key rules:
- Spaces required inside [ ]
- Quote variables
- Use ../ for parent directory paths

Outcome:
- Disk monitoring automated
- Prevents disk-full outages

Interview line:
Disk threshold monitoring prevents production failures
