netsh int teredo set state type=enterpriseclient
netsh int teredo set state refreshinterval=20
netsh int teredo set state clientport=52586
netsh int teredo set state servername=default
sc config iphlpsvc start=auto
sc config PolicyAgent start=auto
net stop iphlpsvc
net start iphlpsvc
net stop PolicyAgent
net start PolicyAgent
w32tm /resync
netsh int teredo show state
echo Computer will reboot in 30 seconds press any key to continue...
pause
shutdown -r -t 30
