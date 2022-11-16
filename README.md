# :gear:INSTRUCTIONS
Teredo Universal Fix Guide 0.10, Updated 16/11/2022.
## Basic requirements :white_check_mark:
- Firewall needs to be enabled and on standard settings
- To gain open NAT, you are very likely going to need username and password of your wifi router
- 3 minutes for teredoFix
- 5-20 minutes for setting up the Port Forward on your router
## Run teredoFix.bat :runner:
- Run teredoFix.bat as administrator
- Windows Defender might show up, click on More informations and then Run (code is open-source so you can check that it is safe)
- In some cases it may ask for confirmation to restart some network services, proceed by confirming, usually by writing y and hitting enter (y could be another letter depending on your language).
- Wait for it to say Press any key to continue... > press a key
- Computer will automatically reboot in 30 seconds > wait.
- Once the computer is back on, open settings > games > xbox networking
- Wait the loading -> might still say teredo unable to qualify so press "Check again" button, wait and you should have NAT limited and Server Connected
- If not, start from the beginning of the guide, or look at the extra steps at the bottom.
- If, for some resons, at this point you already have Open NAT you are done! Otherwise continue with the next step.
## Set-up Port Forwarding to gain Open NAT :twisted_rightwards_arrows:
- Search cmd on windows bar > open cmd > write ```ipconfig``` and hit enter > look for *Predefined Gateway* and *Ipv4 address*, save them for later (ex. 192.168.1.1 , 192.168.1.45)
- Open web browser and paste the *Predefined Gateway* ip (ex. 192.168.1.1 or 192.168.0.1 etc...) on the top search bar and hit enter
- Access your wifi router using username and password (they usually are on the bottom of the wifi router), (the password is not the same that you use to connect to your wifi). 
- Once you logged in search for Port mapping and than create a new rule, some routers have the option *port mapping for known applications*, that's the preferred option.
- If you have port mapping for known applications than select it and select xbox live for windows application, than select your PC as local host, (if it asks for the ip address paste the *Ipv4* you saved previously)
- Otherwise create your own custom rule:<br>
:white_medium_small_square: Under Traffic comming from:<br>
You set up your interface (If you can choose between interfaces choose the one that has your public ip address in it (ussualy set by default), if you don't know your public ip address search on google "what's my ip").<br>
If it asks: Any host = set yes<br>
If it ask: Any port = set no, than specify port 3074<br>
:white_medium_small_square: Under Traffic directed to:<br>
Host name = select your computer if there is a list of all conected devices<br>
Host ip = paste *Ipv4* you saved previously (It's the local ip address of your computer)<br>
Port = Same port, 52586<br>
- APPLY ALL MODIFICATIONS
- Wait 5 to 10 minutes
- Reboot your computer
- Open settings > games > xbox networking > wait -> it will still say teredo unable to qualify > 
press Check again > wait > you should have NAT open and Server Connected > if not press Fix and than Check again
- If it still does not work try rebooting your wifi router and than your computer and try again to check if it worked
- It's very likely that you'll have to reboot your computer a few times before it starts working, but if it does not work after 2/3 reboot 5 minutes apart from each others, it probably wont even after 100
## Extra steps if it did not work :bangbang:
Check if it worked after every step
- Check your firewall: control panel > System and Security > Windows Defender Firewall > On the left side press: Restore predefined settings
- If you have more than 1 xbox connected to your wifi it could be using the same port so: open cmd as administrator and paste<br>
```netsh int teredo set state clientport=3074```, change 3074 with an other number like 3544 or 52586 and hit enter, cmd should respond with OK. Than you have to use that port also on the port forward (Must use custom rule to change port).
- Reset your network (will reset clientport and all teredo settings): settings > Network & internet > scroll down > Network reset, you have to re-run teredoFix.bat after the reset
