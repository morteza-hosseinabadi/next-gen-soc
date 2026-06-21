#!/usr/bin/env python3
"""Driver Threat Analyzer"""

import json
import sys
import re
from pathlib import Path

def clean_json(raw):
    """Fix invalid JSON escape sequences from CMD output."""
    # Replace backslash followed by anything that's not a valid JSON escape
    # Valid: \\ \" \/ \b \f \n \r \t \u
    cleaned = re.sub(r'\\(?!["\\/bfnrtu])', r'\\\\', raw)
    return cleaned

def analyze_scan(filepath):
    with open(filepath, "r", encoding="utf-8", errors="replace") as f:
        raw = f.read()

    raw = clean_json(raw)

    try:
        data = json.loads(raw)
    except json.JSONDecodeError as e:
        print(f"[ERROR] Still cannot parse: {e}")
        sys.exit(1)

    drivers = data.get("drivers", [])
    print(f"Total drivers : {len(drivers)}")
    print(f"Hostname      : {data.get('hostname', 'N/A')}")
    print(f"Scan time     : {data.get('scan_time', 'N/A')}")
    print("-" * 50)

    suspicious = []
    for d in drivers:
        name = d.get("driver_name", "Unknown")
        display = d.get("display_name", "")
        if not display or display == name:
            suspicious.append(name)

    print(f"Drivers with no display name : {len(suspicious)}")
    print("-" * 50)
    if suspicious:
        print("These may include unsigned or custom drivers:")
        for s in suspicious[:15]:
            print(f"  - {s}")

if __name__ == "__main__":
    file = sys.argv[1] if len(sys.argv) > 1 else "driver_scan_results.json"
    if not Path(file).exists():
        print(f"[ERROR] File not found: {file}")
        sys.exit(1)
    analyze_scan(file)