# :cyclone: FAST GUIDE
- Remove any VPN software, disable thirdparty firewall protection in antivirus, keep windows firewall enabled and on standard settings.
- On this github page, on the top right, press the green button "Code" and than "Download zip" to download teredoFix.bat > unzip the folder.
- Open teredoFix.bat, computer will automatically reboot in 30 seconds.
- Check if you have open NAT in settings > games > xbox networking, if you still don't have open NAT try to use the "Fix" button in windows settings and than reboot or else you may have to access your router and set a port forward that redirects incomming traffic to your public ip address on port ```3074``` to the local ip address of your computer on the same port. If after the port forward you still have limited try rebooting and than the "fix" button.
# :books: FULL IN DEPTH GUIDE
Teredo Universal Fix Guide 0.5.0, Updated 24/11/2022.<br>
If you think i skipped some informations or you found an other solution not included here, you can create an issue or a pull request here on github and i'll try to implement it inside the teredoFix.bat, the ultimate goal is to create a general fix for every teredo/openNAT-related problem in the xbox app / microsoft multiplayer.
## Basic requirements :white_check_mark:
- Be able to follow instructions and not skip steps
- Firewall needs to be enabled and on standard settings, (if you never touched it, it's probably fine), also antiviruses can sometimes interfere with it, so disable all antivirus firewall).
- If you have installed any VPN software, try to disable them.
- To gain open NAT, you may need username and password of your wifi router
- Less than 5 minutes to fix teredo issues using teredoFix.bat
- 5-20 minutes for setting up the Port Forward, if your router blocks teredo connections
## Run teredoFix.bat :runner:
- On this github page, on the top right, press the green button "Code" and than "Download zip" to download teredoFix.bat > unzip the folder
- Open teredoFix.bat, it will ask the permission to run as administrator, confirm.
- Windows Defender might show up, click on More informations and then Run (code is open-source so you can check that it is safe)
- In some cases it may ask for confirmation to restart some network services, proceed by confirming, usually by writing y and hitting enter (y could be another letter depending on your language).
- Wait for it to say Press any key to continue... > press a key > computer will automatically reboot in 30 seconds > wait.
- Once the computer is back on, open settings > games > xbox networking
- Wait the loading -> might still say teredo unable to qualify so press "Check again" button, wait and you should have NATopen or NATlimited or NATmoderate and Server Connected.
- If you don't have either of them you can try the *Fix it* button, otherwise start from the beginning of the guide and re-run teredoFix.bat or look at the extra steps at the bottom.
- If at this point you have Open NAT you are done! Otherwise continue with the next steps.
## Set-up Port Forwarding to gain Open NAT :twisted_rightwards_arrows:
- Search cmd on windows bar > open cmd > write ```ipconfig``` and hit enter > look for ```Predefined Gateway``` and ```Ipv4 address```, save them for later (ex. 192.168.1.1 , 192.168.1.45)
- Open web browser and paste the ```Predefined Gateway``` ip (ex. 192.168.1.1 or 192.168.0.1 etc...) on the top search bar and hit enter
- Access your wifi router using username and password (they usually are on the bottom of the wifi router), (the password is not the same that you use to connect to your wifi). 
- Once you logged in search for Port mapping and than create a new rule, some routers have the option *port mapping for known applications*, that's the preferred option.
- If you have port mapping for known applications than select it and select xbox live for windows application, than select your PC as local host, (if it asks for the ip address paste the ```Ipv4``` you saved previously)
- If you don't have port mapping for known applications than create your own custom rule:<br>
:white_medium_small_square: Under Traffic comming from:<br>
You set up your interface (If you can choose between interfaces choose the one that has your public ip address in it (ussualy set by default), if you don't know your public ip address search on google "what's my ip").<br>
If it asks: Any host = set yes<br>
If it ask: Any port = set no, than specify port 3074<br>
:white_medium_small_square: Under Traffic directed to:<br>
Host name = select your computer if there is a list of all conected devices<br>
Host ip = paste ```Ipv4``` you saved previously (It's the local ip address of your computer)<br>
Port = Same port, 3074<br>
- APPLY ALL MODIFICATIONS
- Wait 5 minutes (Sometimes router will take some time to apply modifications)
- Reboot your computer
- Open settings > games > xbox networking > wait -> it will still say teredo unable to qualify > 
press Check again > wait > you should have NAT open and Server Connected > if not press Fix and than Check again
- If it still does not work try rebooting your wifi router and than your computer and try again to check if it worked
- If it still does not work run teredoFix.bat an other time, wait for the computer to reboot and check again
## Extra steps if it did not work :bangbang:
Check if it worked after every step
- Check your firewall: control panel > System and Security > Windows Defender Firewall > On the left side press: Restore predefined settings
- Uninstall any external VPN software
- Reset your network (will reset clientport and all teredo settings): settings > Network & internet > scroll down > Network reset, you have to re-run teredoFix.bat after the reset
