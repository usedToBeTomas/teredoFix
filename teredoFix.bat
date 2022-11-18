echo off
reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\W32Time\Parameters /v Type /t REG_SZ /d NTP /f
netsh advfirewall set currentprofile firewallpolicy blockinbound,allowoutbound
netsh int teredo set state type=enterpriseclient
netsh int teredo set state refreshinterval=20
netsh int teredo set state clientport=3074
netsh int teredo set state servername=default
sc config iphlpsvc start=auto
sc config PolicyAgent start=auto
net stop iphlpsvc
net start iphlpsvc
net stop PolicyAgent
net start PolicyAgent
netsh int teredo show state
echo .
echo .
echo .
echo .
echo     dP                                    dP           88888888b dP dP    dP
echo     88                                    88           88        88 Y8.  .8P
echo   d8888P .d8888b. 88d888b. .d8888b. .d888b88 .d8888b. a88aaaa    88  Y8aa8P
echo     88   88ooood8 88'  `88 88ooood8 88'  `88 88'  `88  88        88 d8'  `8b
echo     88   88.  ... 88       88.  ... 88.  .88 88.  .88  88        88 88    88
echo     dP   `88888P' dP       `88888P' `88888P8 `88888P'  dP        dP dP    dP
echo oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
echo .
echo .
echo .
echo .
echo Computer will reboot in 30 seconds press any key to confirm...
pause
shutdown -r -t 30
