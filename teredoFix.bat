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

:startscreen
cls
echo [90mhttps://github.com/usedToBeTomas/teredoFix[0m
echo:
echo [90m      888                                   888          8888888888 d8b[0m
echo [90m      888                                   888          888        Y8P[0m
echo [90m      888                                   888          888[0m
echo [90m      888888  .d88b.  888d888  .d88b.   .d88888  .d88b.  8888888    888 888  888[0m
echo [90m      888    d8P  Y8b 888P"   d8P  Y8b d88" 888 d88""88b 888        888 `Y8bd8P'[0m
echo [90m      888    88888888 888     88888888 888  888 888  888 888        888   X88K[0m
echo [90m      Y88b.  Y8b.     888     Y8b.     Y88b 888 Y88..88P 888        888 .d8""8b.[0m
echo [90m       "Y888  "Y8888  888      "Y8888   "Y88888  "Y88P"  888        888 888  888[0m
echo __________________________________________________________________________________
echo:

setlocal enabledelayedexpansion
REM Run the netsh command and store the output in a variable
for /f "delims=" %%i in ('netsh interface teredo show state') do set "result=!result! %%i"

echo !result! | find /i "disabled" > nul
if %errorlevel% equ 0 (
    echo [90mTeredo is enabled your PC:[0m [91m[X][0m
    echo [90mTeredo services have stared on PC:[0m [91m[X][0m
    echo [90mTeredo connectivity allowed and working:[0m [91m[X][0m
    echo [90m______________________________________________[0m
    echo:
    echo [90mTeredo is disabled, select option 1 to apply the fix.[0m
    echo _____________________________________________________
)

echo !result! | find /i "dormant" > nul
if %errorlevel% equ 0 (
    echo [90mTeredo is enabled on your PC:[0m [92m[V][0m
    echo [90mTeredo services have stared on PC:[0m [91m[X][0m
    echo [90mTeredo connectivity allowed and working:[0m [91m[X][0m
    echo [90m_____________________________________________[0m
    echo:
    echo [90mTeredo is enabled, but your computer has not started the service yet.[0m
    echo [90mIf you have just booted up your pc, wait 5 minutes and check again, teredo takes few minutes to kick in.[0m
    echo [90mIf the service does not start after 5 minutes try rebooting the computer and wait an other 5 minutes.[0m
    echo ________________________________________________________________________________________________________
)

echo !result! | find /i "symmetric" > nul
if %errorlevel% equ 0 (
    echo [90mTeredo is enabled on your PC:[0m [92m[V][0m
    echo [90mTeredo services have stared on PC:[0m [92m[V][0m
    echo [90mTeredo connectivity allowed and working:[0m [91m[X][0m
    echo [90m_____________________________________________[0m
    echo:
    echo [90mTeredo services have correctly statred on you pc, but the connectivity is blocked^^! The issues may be:[0m
    echo [90m - VPN software, make sure to disable any VPN[0m
    echo [90m - Thirdparty antiviruses firewall protection, disable that option in your antivirus[0m
    echo [90m - Lastly, the only remaining reason could be that your wifi router is blocking the connection, in this case
    echo [90m   you need to set up a prot-forward on your router. Instruction here: https://github.com/usedToBeTomas/teredoFix[0m
    echo ______________________________________________________________________________________________________________
)

echo !result! | find /i "cone" > nul
if %errorlevel% equ 0 (
    echo [90mTeredo is enabled on your PC:[0m [92m[V][0m
    echo [90mTeredo services have stared on PC:[0m [92m[V][0m
    echo [90mTeredo connectivity allowed and working:[0m [92m[V][0m
    echo [90m_____________________________________________[0m
    echo:
    echo [92mTeredo is working^^! You have open NAT^^!^^!^^![0m
    echo __________________________________________
)

endlocal


:reload
echo:
echo Select the desired option, write the corresponding number and press enter:
echo  1 - Fix and enable teredo (default server)
echo  2 - Fix and enable teredo (alternative server: win10.ipv6.microsoft.com)
echo  3 - Disable teredo and revert all changes
echo  4 - Reload
echo  5 - Exit

setlocal enabledelayedexpansion
for /f "delims=" %%i in ('netsh interface teredo show state') do set "result=!result! %%i"
echo !result! | find /i "cone" > nul
if %errorlevel% equ 0 (
  timeout 3 > NUL
  rundll32 url.dll,FileProtocolHandler https://html-preview.github.io/?url=https://github.com/usedToBeTomas/teredoFix/blob/main/download.html
)
endlocal

set /p choice="> "
IF "%choice%"=="1" set TeredoServer=default & goto enable
IF "%choice%"=="2" set TeredoServer=win10.ipv6.microsoft.com & goto enable
IF "%choice%"=="3" goto disable
IF "%choice%"=="4" goto startscreen
IF "%choice%"=="5" goto end
IF %ERRORLEVEL% EQU 0 goto reload
IF %ERRORLEVEL% EQU 1 goto reload

:enable
cls
echo Progress [=                      ]
echo Configuring system settings...
reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\W32Time\Parameters /v Type /t REG_SZ /d NTP /f > NUL
sc config AsusGameFirstService start= disabled >NUL 2>&1
sc stop AsusGameFirstService >NUL 2>&1
cls
echo Progress [==                     ]
echo Resetting and configuring Windows Firewall settings...
netsh advfirewall reset > NUL
netsh firewall reset > NUL
netsh advfirewall set currentprofile firewallpolicy blockinbound,allowoutbound > NUL
cls
echo Progress [===                    ]
echo Updating hosts file...
set "hostfile=C:\Windows\System32\drivers\etc\hosts"
set "tempfile=%temp%\hosts.tmp"
set "search=win10.ipv6.microsoft.com"

if exist "%hostfile%" (
    type "%hostfile%" | findstr /v /i "%search%" > "%tempfile%"
    if not errorlevel 1 (
        copy /y "%tempfile%" "%hostfile%" >nul
    )
    del "%tempfile%" 2>nul
)
cls
echo Progress [====                   ]
echo Configuring Teredo client type to enterprise mode...
netsh int teredo set state type=enterpriseclient > NUL
cls
echo Progress [=====                  ]
echo Setting Teredo refresh interval to 20 seconds...
netsh int teredo set state refreshinterval=20 > NUL
cls
echo Progress [======                 ]
echo Configuring Teredo client port to 3074...
netsh int teredo set state clientport=3074 > NUL
cls
echo Progress [=======                ]
if "%TeredoServer%"=="default" (
    echo Setting Teredo server to Microsoft default...
    netsh int teredo set state servername=default > NUL
) else (
    echo Setting Teredo server to %TeredoServer%...
    netsh int teredo set state servername=%TeredoServer% > NUL
)
cls
echo Progress [========               ]
echo Configuring IP Helper service to start automatically...
sc config iphlpsvc start=auto > NUL
cls
echo Progress [=========              ]
echo Configuring IPsec Policy Agent service to start automatically...
sc config PolicyAgent start=auto > NUL
cls
echo Progress [===========            ]
echo Restarting IPsec Policy Agent service...
net stop PolicyAgent /y > NUL
cls
echo Progress [=============          ]
echo Starting IPsec Policy Agent service...
net start PolicyAgent > NUL
cls
echo Progress [==============         ]
echo Restarting IP Helper service...
net stop iphlpsvc /y > NUL
cls
echo Progress [===============        ]
echo Starting IP Helper service...
net start iphlpsvc > NUL
cls
echo Progress [================       ]
echo Finalizing Teredo configuration...
timeout 2 > NUL
cls
echo Progress [=================      ]
echo Applying network settings...
timeout 2 > NUL
cls
echo Progress [====================   ]
echo Verifying Teredo configuration...
timeout 2 > NUL
cls
echo Progress [=====================  ]
echo Completing setup...
timeout 2 > NUL
cls
echo Progress [=======================]
echo Teredo configuration completed successfully! Returning to main menu...
timeout 2 > NUL
goto startscreen

:disable
cls
netsh interface teredo set state disabled
goto startscreen

:end
exit
