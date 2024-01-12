@echo off
:: BatchGotAdmin
:-------------------------------------
    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params= %*
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo                  888                                   888          8888888888 d8b
echo                  888                                   888          888        Y8P
echo                  888                                   888          888
echo                  888888  .d88b.  888d888  .d88b.   .d88888  .d88b.  8888888    888 888  888
echo                  888    d8P  Y8b 888P"   d8P  Y8b d88" 888 d88""88b 888        888 `Y8bd8P'
echo                  888    88888888 888     88888888 888  888 888  888 888        888   X88K
echo                  Y88b.  Y8b.     888     Y8b.     Y88b 888 Y88..88P 888        888 .d8""8b.
echo                   "Y888  "Y8888  888      "Y8888   "Y88888  "Y88P"  888        888 888  888
echo           ooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
echo                           teredoFix.bat Vers: 0.6.2 09/01/2024 fix teredo connection
echo:
echo:
echo                                             PRESS ANY KEY...
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
pause
:reload
cls
echo SELECT THE DESIRED OPTION BY WRITING THE CORRESPONDING NUMBER AND PRESSING ENTER:
echo 1 - FIX AND ENABLE TEREDO
echo 2 - DISABLE TEREDO AND REVERT ALL CHANGES
echo:
set /p choice="ENTER NUMBER: "
IF "%choice%"=="1" goto enable
IF "%choice%"=="2" goto disable
IF %ERRORLEVEL% EQU 0 goto reload
IF %ERRORLEVEL% EQU 1 goto reload

:enable
cls
reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\W32Time\Parameters /v Type /t REG_SZ /d NTP /f
netsh advfirewall set currentprofile firewallpolicy blockinbound,allowoutbound
netsh int teredo set state type=enterpriseclient
netsh int teredo set state refreshinterval=20
netsh int teredo set state clientport=3074
netsh int teredo set state servername=default
sc config iphlpsvc start=auto
sc config PolicyAgent start=auto
goto end


:disable
cls
netsh interface teredo set state disabled
goto end

:end
cls
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo                               8888888b.                             888
echo                               888  "Y88b                            888
echo                               888    888                            888
echo                               888    888  .d88b.  88888b.   .d88b.  888
echo                               888    888 d88""88b 888 "88b d8P  Y8b 888
echo                               888    888 888  888 888  888 88888888 Y8P
echo                               888  .d88P Y88..88P 888  888 Y8b.      "
echo                               8888888P"   "Y88P"  888  888  "Y8888  888
echo:
echo                      Computer will reboot in 30 seconds press any key to confirm...
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:
pause
shutdown -r -t 30
exit
