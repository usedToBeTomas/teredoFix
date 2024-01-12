@echo off
setlocal enabledelayedexpansion


REM Run the netsh command and store the output in a variable
for /f "delims=" %%i in ('netsh interface teredo show state') do set "result=!result! %%i"

echo !result! | find /i "disabled" > nul
if %errorlevel% equ 0 (
    echo Teredo is enabled your PC: X
    echo Teredo services have stared on PC: X
    echo Teredo services allowed by your router: X
    echo _________________________________
    echo:
    echo Teredo is disabled, run the teredoFix.bat script you can find at https://github.com/usedToBeTomas/teredoFix
)

echo !result! | find /i "dormant" > nul
if %errorlevel% equ 0 (
    echo Teredo is enabled on your PC: V
    echo Teredo services have stared on PC: X
    echo Teredo services allowed by your router: X
    echo _________________________________
    echo:
    echo Teredo is enabled, but your computer has not started the service yet.
    echo If you have just booted up your pc, wait 5 minutes and check again, teredo may take few minutes to kick in.
)

echo !result! | find /i "symmetric" > nul
if %errorlevel% equ 0 (
    echo Teredo is enabled on your PC: V
    echo Teredo services have stared on PC: V
    echo Teredo services allowed by your router: X
    echo _________________________________
    echo:
    echo Teredo services have corectly statred on you pc, but you wifi router is blocking the traffic!
    echo If you have just changed your teredo settings, wait 5 minutes, teredo may take few minutes to kick in.
    echo Otherwise follow the port-forwarding instruction on the github page https://github.com/usedToBeTomas/teredoFix
)

echo !result! | find /i "cone" > nul
if %errorlevel% equ 0 (
    echo Teredo is enabled on your PC: V
    echo Teredo services have stared on PC: V
    echo Teredo services allowed by your router: V
    echo _________________________________
    echo:
    echo Teredo is working! You have open NAT!!
)

echo _________________________________
echo:
pause
endlocal
