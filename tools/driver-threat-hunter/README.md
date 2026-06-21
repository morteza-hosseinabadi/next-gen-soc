**Driver Threat Hunter**



Detect BYOVD (Bring Your Own Vulnerable Driver) attacks on Windows endpoints.



**What It Does**



Scans all loaded Windows drivers and identifies suspicious ones based on:

\- Digital signature status (signed vs unsigned)

\- Missing display names (common in custom/unsigned drivers)

\- Suspicious signer names



**Why It Matters**



Attackers use signed-but-vulnerable drivers to gain kernel-level access. 

These drivers bypass EDR because they have valid signatures. 

This tool provides a first-pass triage for SOC analysts.



**MITRE ATT\&CK**



| Technique | ID |

|-----------|-----|

| Exploitation for Privilege Escalation | T1068 |

| Windows Service | T1543.003 |

| Impair Defenses | T1562.001 |



**Usage**



**Scan**

```cmd

scanner.bat

Requires Administrator privileges. Outputs driver\_scan\_results.json.



**Analyze**

python analyzer.py driver\_scan\_results.json





**Files**

File	Purpose

scanner.bat	CMD-based driver scanner (no PowerShell required)

analyzer.py	Python threat analyzer



**Requirements**



Windows 10/11

Administrator privileges

Python 3.x (for analyzer only)



**Author**

Morteza Hosseinabadi

