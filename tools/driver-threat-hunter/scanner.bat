@echo off
setlocal enabledelayedexpansion
set OUTPUT_FILE=driver_scan_results.json
if not "%1"=="" set OUTPUT_FILE=%1

echo [*] Windows Driver Scanner
echo [*] Enumerating drivers...
echo.

net session >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Run as Administrator.
    exit /b 1
)

echo { > "%OUTPUT_FILE%"
echo   "scan_time": "%DATE%T%TIME%", >> "%OUTPUT_FILE%"
echo   "hostname": "%COMPUTERNAME%", >> "%OUTPUT_FILE%"
echo   "drivers": [ >> "%OUTPUT_FILE%"

set COUNT=0
set FIRST=1

for /f "skip=1 tokens=1,2,4,5,6 delims=," %%a in ('driverquery /fo csv') do (
    set MODULE=%%a
    set MODULE=!MODULE:"=!
    set DISPLAY=%%b
    set DISPLAY=!DISPLAY:"=!
    set TYPE=%%c
    set TYPE=!TYPE:"=!
    set DATE=%%d
    set DATE=!DATE:"=!

    if !FIRST! equ 0 echo , >> "%OUTPUT_FILE%"
    set FIRST=0

    echo     { >> "%OUTPUT_FILE%"
    echo       "driver_name": "!MODULE!", >> "%OUTPUT_FILE%"
    echo       "display_name": "!DISPLAY!", >> "%OUTPUT_FILE%"
    echo       "driver_type": "!TYPE!", >> "%OUTPUT_FILE%"
    echo       "link_date": "!DATE!" >> "%OUTPUT_FILE%"
    echo     } >> "%OUTPUT_FILE%"

    set /a COUNT+=1
)

echo   ], >> "%OUTPUT_FILE%"
echo   "total_drivers": %COUNT% >> "%OUTPUT_FILE%"
echo } >> "%OUTPUT_FILE%"

echo [+] Done. %COUNT% drivers found.
echo [+] Output: %OUTPUT_FILE%